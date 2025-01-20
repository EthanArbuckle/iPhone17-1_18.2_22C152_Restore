@interface RTTController
+ (id)sharedController;
- (BOOL)invalidateServerCaches:(id)a3;
- (BOOL)shouldSuppressIncomingNotification;
- (HCHeardControllerProtocol)delegate;
- (NSMutableArray)rttCalls;
- (RTTController)init;
- (RTTTranscriptionController)transcriber;
- (id)_callForUUIDWithoutRefresh:(id)a3;
- (id)actionClient;
- (id)actionCompletionBlock;
- (id)callForUUID:(id)a3;
- (id)displayCallPrompt:(id)a3;
- (id)handleDatabaseRequest:(id)a3;
- (id)handleDictionaryRequest:(id)a3;
- (id)handleIncomingNotificationSuppressionChange:(id)a3;
- (id)handleMediaAction:(id)a3;
- (id)handleRTTControllerIsVisible:(id)a3;
- (id)handleRTTVoicemailMessage:(id)a3;
- (id)handleSettingsRequest:(id)a3;
- (id)serverInvalidateCallback;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (void)_handlePreferredRelayNumberUpdate;
- (void)_refreshCurrentCallList;
- (void)_refreshCurrentCallListWithExistingCalls:(id)a3;
- (void)_requestNotificationAuthorization;
- (void)_requestNotificationAuthorizationIfNecessary;
- (void)_updateConversationControllerWithTranscription:(id)a3 type:(int64_t)a4 callUUID:(id)a5;
- (void)callDidConnect:(id)a3;
- (void)clientRemoved:(id)a3;
- (void)dealloc;
- (void)didChangeTelephonyCallingSupport;
- (void)dismissRTTFirstUseAlert;
- (void)displayRTTFirstUseAlert;
- (void)handleUpdatedCalls:(id)a3;
- (void)setActionCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRttCalls:(id)a3;
- (void)setServerInvalidateCallback:(id)a3;
- (void)setShouldSuppressIncomingNotification:(BOOL)a3;
- (void)setTranscriber:(id)a3;
- (void)transcriptionDidStart:(id)a3 forCallUUID:(id)a4;
- (void)transcriptionDidUpdate:(id)a3 forCallUUID:(id)a4;
- (void)ttyCall:(id)a3 didReceiveString:(id)a4 forUtterance:(id)a5;
- (void)ttyCall:(id)a3 didSendRemoteString:(id)a4 forUtterance:(id)a5;
- (void)ttyCall:(id)a3 setVisible:(BOOL)a4 serviceUpdate:(id)a5;
@end

@implementation RTTController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedController_Controller;

  return v2;
}

uint64_t __33__RTTController_sharedController__block_invoke()
{
  sharedController_Controller = objc_alloc_init(RTTController);

  return MEMORY[0x270F9A758]();
}

- (RTTController)init
{
  v63.receiver = self;
  v63.super_class = (Class)RTTController;
  v2 = [(RTTController *)&v63 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] array];
    [(RTTController *)v2 setRttCalls:v3];

    v4 = +[RTTSettings sharedInstance];
    [v4 migrateSettings];

    [(RTTController *)v2 didChangeTelephonyCallingSupport];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v7 = dispatch_queue_create("tty_worker_queue", v6);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v2->_workerQueue];
    preferredRelayCoalescer = v2->_preferredRelayCoalescer;
    v2->_preferredRelayCoalescer = (AXDispatchTimer *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v2->_workerQueue];
    callUpdateCoalescer = v2->_callUpdateCoalescer;
    v2->_callUpdateCoalescer = (AXDispatchTimer *)v11;

    [(AXDispatchTimer *)v2->_callUpdateCoalescer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    objc_initWeak(&location, v2);
    v13 = +[RTTSettings sharedInstance];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __21__RTTController_init__block_invoke;
    v60[3] = &unk_264540048;
    objc_copyWeak(&v61, &location);
    [v13 registerUpdateBlock:v60 forRetrieveSelector:sel_preferredRelayNumber withListener:v2];

    v14 = +[RTTSettings sharedInstance];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __21__RTTController_init__block_invoke_2;
    v57[3] = &unk_264540070;
    objc_copyWeak(&v59, &location);
    v15 = v2;
    v58 = v15;
    [v14 registerUpdateBlock:v57 forRetrieveSelector:sel_TTYHardwareEnabled withListener:v15];

    v16 = +[RTTSettings sharedInstance];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __21__RTTController_init__block_invoke_3;
    v54[3] = &unk_264540070;
    objc_copyWeak(&v56, &location);
    v17 = v15;
    v55 = v17;
    [v16 registerUpdateBlock:v54 forRetrieveSelector:sel_TTYSoftwareEnabled withListener:v17];

    v18 = +[RTTSettings sharedInstance];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __21__RTTController_init__block_invoke_4;
    v52[3] = &unk_264540048;
    objc_copyWeak(&v53, &location);
    [v18 registerUpdateBlock:v52 forRetrieveSelector:sel_incomingCallsTTY withListener:v17];

    v19 = +[RTTSettings sharedInstance];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __21__RTTController_init__block_invoke_5;
    v50[3] = &unk_264540048;
    objc_copyWeak(&v51, &location);
    [v19 registerUpdateBlock:v50 forRetrieveSelector:sel_ttyShouldBeRealtime withListener:v17];

    v20 = +[RTTSettings sharedInstance];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __21__RTTController_init__block_invoke_6;
    v48[3] = &unk_264540048;
    objc_copyWeak(&v49, &location);
    [v20 registerUpdateBlock:v48 forRetrieveSelector:sel_answerRTTCallsAsMuted withListener:v17];

    v21 = +[RTTSettings sharedInstance];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __21__RTTController_init__block_invoke_7;
    v45[3] = &unk_264540070;
    objc_copyWeak(&v47, &location);
    v22 = v17;
    v46 = v22;
    [v21 registerUpdateBlock:v45 forRetrieveSelector:sel_showsRTTNotifications withListener:v22];

    v23 = +[RTTSettings sharedInstance];
    [v23 ttyShouldBeRealtime];

    v24 = +[RTTSettings sharedInstance];
    [v24 preferredRelayNumber];

    v25 = +[RTTSettings sharedInstance];
    [v25 TTYHardwareEnabled];

    v26 = +[RTTSettings sharedInstance];
    [v26 TTYSoftwareEnabled];

    v27 = +[RTTSettings sharedInstance];
    [v27 incomingCallsTTY];

    v28 = +[RTTSettings sharedInstance];
    [v28 answerRTTCallsAsMuted];

    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
    localSettingsCache = v22->_localSettingsCache;
    v22->_localSettingsCache = (NSMutableDictionary *)v29;

    [MEMORY[0x263F7E198] addDelegate:v22 queue:v2->_workerQueue];
    v31 = +[RTTTelephonyUtilities sharedCallCenter];
    v32 = [v31 callServicesClientCapabilities];
    [v32 setWantsToScreenCalls:1];

    v33 = +[RTTTelephonyUtilities sharedCallCenter];
    v34 = [v33 callServicesClientCapabilities];
    [v34 save];

    v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:v22 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E310] object:0];

    v36 = [MEMORY[0x263F08A00] defaultCenter];
    [v36 addObserver:v22 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E380] object:0];

    v37 = [MEMORY[0x263F08A00] defaultCenter];
    [v37 addObserver:v22 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E378] object:0];

    v38 = [MEMORY[0x263F08A00] defaultCenter];
    [v38 addObserver:v22 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E300] object:0];

    [(RTTController *)v22 callDidConnect:0];
    v39 = AXLogRTT();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v39, OS_LOG_TYPE_INFO, "Posting transport changed because RTTController was inited", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AXTTYPreferredTransportMethodChangedNotification", 0, 0, 1u);
    if (!_AXSIsNonUIBuild())
    {
      v41 = [[RTTTranscriptionController alloc] initWithDelegate:v22];
      transcriber = v22->_transcriber;
      v22->_transcriber = v41;
    }
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__RTTController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePreferredRelayNumberUpdate];
}

uint64_t __21__RTTController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidateServerCaches:kAXSTTYHardwareEnabledPreference];

  v3 = *(void **)(a1 + 32);

  return [v3 _requestNotificationAuthorizationIfNecessary];
}

uint64_t __21__RTTController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidateServerCaches:kAXSTTYSoftwareEnabledPreference];

  v3 = *(void **)(a1 + 32);

  return [v3 _requestNotificationAuthorizationIfNecessary];
}

void __21__RTTController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateServerCaches:kAXSTTYIncomingCallsTTYPreference];
}

void __21__RTTController_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateServerCaches:kAXSTTYShouldBeRealtimePreference];
}

void __21__RTTController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateServerCaches:kAXSRTTAnswerAllRTTCallsAsMutedPreference];
}

uint64_t __21__RTTController_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidateServerCaches:kAXSRTTShowsNotificationsPreference];

  v3 = *(void **)(a1 + 32);

  return [v3 _requestNotificationAuthorizationIfNecessary];
}

- (void)_requestNotificationAuthorizationIfNecessary
{
  v3 = +[RTTSettings sharedInstance];
  if ([v3 TTYHardwareEnabled])
  {
  }
  else
  {
    v4 = +[RTTSettings sharedInstance];
    int v5 = [v4 TTYSoftwareEnabled];

    if (!v5) {
      return;
    }
  }

  [(RTTController *)self _requestNotificationAuthorization];
}

- (void)_requestNotificationAuthorization
{
}

void __50__RTTController__requestNotificationAuthorization__block_invoke()
{
  v0 = AXLogRTT();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_INFO, "Requesting notification authorization because hw/sw enabled", v1, 2u);
  }

  RTTRequestNotificationAuthorization();
}

- (void)_handlePreferredRelayNumberUpdate
{
  [(AXDispatchTimer *)self->_preferredRelayCoalescer cancel];
  preferredRelayCoalescer = self->_preferredRelayCoalescer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__RTTController__handlePreferredRelayNumberUpdate__block_invoke;
  v4[3] = &unk_264540098;
  v4[4] = self;
  [(AXDispatchTimer *)preferredRelayCoalescer afterDelay:v4 processBlock:0.5];
}

void __50__RTTController__handlePreferredRelayNumberUpdate__block_invoke(uint64_t a1)
{
  v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Settings preferred number changed", buf, 2u);
  }

  v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  int v4 = [v3 reloadRelayPhoneNumbers];

  if (v4)
  {
    int v5 = AXLogRTT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Relay number actually changed, invalidating server cache", v6, 2u);
    }

    [*(id *)(a1 + 32) invalidateServerCaches:kAXSTTYPreferredRelayNumberPreference];
  }
}

- (BOOL)invalidateServerCaches:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[RTTSettings sharedInstance];
  v6 = [v5 valueForPreferenceKey:v4];

  dispatch_queue_t v7 = [(NSMutableDictionary *)self->_localSettingsCache objectForKeyedSubscript:v4];
  int v8 = [v6 isEqual:v7];
  uint64_t v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v26 = v4;
    __int16 v27 = 2112;
    v28 = v6;
    __int16 v29 = 2112;
    v30 = v7;
    __int16 v31 = 1024;
    int v32 = v8;
    _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Invalidate server caches:%@ -> new: %@, _localeCache: %@ [same: %d]", buf, 0x26u);
  }

  if (v6) {
    char v10 = v8;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    [(NSMutableDictionary *)self->_localSettingsCache setObject:v6 forKeyedSubscript:v4];
    uint64_t v11 = [(RTTController *)self delegate];
    v12 = (void *)MEMORY[0x263F472C0];
    v13 = (void *)MEMORY[0x263F472B0];
    id v22 = v4;
    v23 = @"axtty_server_settings_upate_action";
    v21 = @"preferenceKey";
    v14 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v24 = v14;
    v15 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v16 = [v13 messagePayloadFromDictionary:v15 andIdentifier:0x40000000000];
    v17 = [v12 messageWithPayload:v16];
    [v11 sendUpdateMessage:v17 forIdentifier:0x40000000000];

    v18 = [(RTTController *)self serverInvalidateCallback];

    if (v18)
    {
      v19 = [(RTTController *)self serverInvalidateCallback];
      ((void (**)(void, uint64_t, id))v19)[2](v19, 1, v4);
    }
  }

  return v10 ^ 1;
}

- (void)didChangeTelephonyCallingSupport
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
    id v4 = [v3 defaultVoiceContext];
    int v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Telephony did change %@", (uint8_t *)&v12, 0xCu);
  }
  int v5 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v6 = [v5 defaultVoiceContext];

  if (v6)
  {
    if (!+[RTTTelephonyUtilities softwareTTYIsSupported])
    {
      dispatch_queue_t v7 = +[RTTSettings sharedInstance];
      [v7 setTTYSoftwareEnabled:0];
    }
    if (!+[RTTTelephonyUtilities hardwareTTYIsSupported])
    {
      int v8 = +[RTTSettings sharedInstance];
      [v8 setTTYHardwareEnabled:0];
    }
    uint64_t v9 = +[RTTSettings sharedInstance];
    int v10 = [v9 TTYSoftwareEnabled];

    if (v10) {
      id v11 = +[RTTDatabaseManager sharedManager];
    }
  }
}

- (void)callDidConnect:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __32__RTTController_callDidConnect___block_invoke;
  v11[3] = &unk_264540098;
  id v5 = v4;
  id v12 = v5;
  +[RTTTelephonyUtilities performCallCenterTask:v11];
  callUpdateCoalescer = self->_callUpdateCoalescer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__RTTController_callDidConnect___block_invoke_39;
  v8[3] = &unk_2645400C0;
  id v9 = v5;
  int v10 = self;
  id v7 = v5;
  [(AXDispatchTimer *)callUpdateCoalescer afterDelay:v8 processBlock:0.25];
}

void __32__RTTController_callDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Call connected notification: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __32__RTTController_callDidConnect___block_invoke_39(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v4 = [*(id *)(a1 + 32) object];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = [v5 count];
    _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Processing %i calls from connect notification", (uint8_t *)v7, 8u);
  }

  [*(id *)(a1 + 40) _refreshCurrentCallListWithExistingCalls:v5];
}

- (void)_refreshCurrentCallList
{
  callUpdateCoalescer = self->_callUpdateCoalescer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__RTTController__refreshCurrentCallList__block_invoke;
  v3[3] = &unk_264540098;
  v3[4] = self;
  [(AXDispatchTimer *)callUpdateCoalescer afterDelay:v3 processBlock:0.0];
}

uint64_t __40__RTTController__refreshCurrentCallList__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshCurrentCallListWithExistingCalls:0];
}

- (void)_refreshCurrentCallListWithExistingCalls:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__RTTController__refreshCurrentCallListWithExistingCalls___block_invoke;
  v6[3] = &unk_2645400C0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  +[RTTTelephonyUtilities performCallCenterTask:v6];
}

void __58__RTTController__refreshCurrentCallListWithExistingCalls___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = +[RTTTelephonyUtilities sharedCallCenter];
  uint64_t v3 = [v2 currentCalls];

  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Refresh call list: %@", (uint8_t *)&v10, 0xCu);
  }

  if (![v3 count])
  {
    id v5 = AXLogRTT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void **)(a1 + 32);
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "No current calls for some reason, using what notification told us: %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = *(id *)(a1 + 32);
    uint64_t v3 = v7;
  }
  [*(id *)(a1 + 40) handleUpdatedCalls:v3];
  int v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 40) rttCalls];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "RTT calls after update: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)handleUpdatedCalls:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Found calls %lu", buf, 0xCu);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__RTTController_handleUpdatedCalls___block_invoke;
  v9[3] = &unk_2645400E8;
  v9[4] = self;
  [v4 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = [(RTTController *)self rttCalls];
  id v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_48];

  int v8 = [(RTTController *)self rttCalls];
  [v8 removeObjectsAtIndexes:v7];
}

void __36__RTTController_handleUpdatedCalls___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 status] == 4 || objc_msgSend(v3, "status") == 1)
    && [v3 ttyType]
    && (+[RTTTelephonyUtilities sharedUtilityProvider],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 currentPreferredTransportMethod],
        v4,
        v5 != 1))
  {
    v15 = *(void **)(a1 + 32);
    v16 = [v3 callUUID];
    v13 = [v15 _callForUUIDWithoutRefresh:v16];

    if (v13)
    {
      if (![v13 isLocallyHosted]
        || (int v17 = [v3 isEndpointOnCurrentDevice],
            v17 == [v3 isHostedOnCurrentDevice]))
      {
        v23 = AXLogRTT();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v39 = 138412546;
          *(void *)&v39[4] = v13;
          *(_WORD *)&v39[12] = 2112;
          id v40 = v3;
          _os_log_impl(&dword_21FEA9000, v23, OS_LOG_TYPE_INFO, "Stuttering call %@ - %@", v39, 0x16u);
        }

        [v13 stop];
      }
      else
      {
        [*(id *)(a1 + 32) ttyCall:v13 setVisible:0 serviceUpdate:RTTServiceUpdateTypeRemoteInterrupt];
        [v13 stop];
        v18 = [*(id *)(a1 + 32) rttCalls];
        [v18 removeObject:v13];

        v19 = [[RTTRemoteCall alloc] initWithCall:v3];
        [(RTTCall *)v19 setDelegate:*(void *)(a1 + 32)];
        v20 = [*(id *)(a1 + 32) rttCalls];
        [v20 addObject:v19];

        v21 = AXLogRTT();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [*(id *)(a1 + 32) rttCalls];
          *(_DWORD *)v39 = 138412290;
          *(void *)&v39[4] = v22;
          _os_log_impl(&dword_21FEA9000, v21, OS_LOG_TYPE_INFO, "Updated software TTY Calls %@", v39, 0xCu);
        }
        v13 = v19;
      }
    }
    else
    {
      int v27 = [v3 isEndpointOnCurrentDevice];
      int v28 = [v3 isHostedOnCurrentDevice];
      __int16 v29 = AXLogRTT();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v27 == v28)
      {
        if (v30)
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_21FEA9000, v29, OS_LOG_TYPE_INFO, "Creating TTY call as local", v39, 2u);
        }
        __int16 v31 = off_26453FEE0;
      }
      else
      {
        if (v30)
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_21FEA9000, v29, OS_LOG_TYPE_INFO, "Creating TTY call as remote", v39, 2u);
        }
        __int16 v31 = off_26453FF10;
      }

      v13 = (void *)[objc_alloc(*v31) initWithCall:v3];
      [v13 setDelegate:*(void *)(a1 + 32)];
      int v32 = [*(id *)(a1 + 32) rttCalls];
      [v32 addObject:v13];

      uint64_t v33 = AXLogRTT();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = [*(id *)(a1 + 32) rttCalls];
        *(_DWORD *)v39 = 138412290;
        *(void *)&v39[4] = v34;
        _os_log_impl(&dword_21FEA9000, v33, OS_LOG_TYPE_INFO, "Software TTY Calls %@", v39, 0xCu);
      }
    }
    [v13 start];
    v35 = [*(id *)(a1 + 32) transcriber];
    v36 = [v3 callUUID];
    [v35 startTranscribingForCallUUID:v36];

    v25 = +[RTTSettings sharedInstance];
    if (([v25 TTYSoftwareEnabled] & 1) == 0
      && [v3 supportsTTYWithVoice]
      && [v3 isIncoming])
    {
      v37 = +[RTTSettings sharedInstance];
      char v38 = [v37 hasReceivedRTTCall];

      if (v38) {
        goto LABEL_26;
      }
      [*(id *)(a1 + 32) displayRTTFirstUseAlert];
      v25 = +[RTTSettings sharedInstance];
      [v25 setHasReceivedRTTCall:1];
    }
  }
  else
  {
    uint64_t v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = [v3 status] == 1;
      BOOL v8 = [v3 ttyType] != 0;
      id v9 = +[RTTTelephonyUtilities sharedUtilityProvider];
      *(_DWORD *)v39 = 67109890;
      *(_DWORD *)&v39[4] = v7;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)&v39[10] = v8;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = [v9 currentPreferredTransportMethod] != 1;
      HIWORD(v40) = 2112;
      id v41 = v3;
      _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Skipping call: active: %d, tty: %d, no hw: %d - %@", v39, 0x1Eu);
    }
    int v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v3 callUUID];
    uint64_t v12 = (void *)[v11 copy];
    v13 = [v10 _callForUUIDWithoutRefresh:v12];

    if (v13 && [v3 status] == 1 && !objc_msgSend(v3, "ttyType"))
    {
      v24 = AXLogRTT();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v39 = 138412290;
        *(void *)&v39[4] = v3;
        _os_log_impl(&dword_21FEA9000, v24, OS_LOG_TYPE_INFO, "Call downgraded %@", v39, 0xCu);
      }

      [v13 stop];
    }
    else if (objc_msgSend(v3, "status", *(void *)v39) == 6)
    {
      uint64_t v14 = [v3 callUUID];
      RTTRemoveUserNotifications(v14);
    }
    v25 = objc_msgSend(*(id *)(a1 + 32), "transcriber", *(void *)v39);
    id v26 = [v3 callUUID];
    [v25 stopTranscribingForCallUUID:v26];
  }
LABEL_26:
}

BOOL __36__RTTController_handleUpdatedCalls___block_invoke_45(uint64_t a1, void *a2)
{
  v2 = [a2 call];
  BOOL v3 = [v2 status] == 6;

  return v3;
}

- (id)_callForUUIDWithoutRefresh:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RTTController *)self rttCalls];
  uint64_t v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Finding callID %@ from rtt calls %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__RTTController__callForUUIDWithoutRefresh___block_invoke;
  v10[3] = &unk_264540130;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = buf;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v8;
}

void __44__RTTController__callForUUIDWithoutRefresh___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 call];
  id v8 = [v7 callUUID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)callForUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RTTController *)self _callForUUIDWithoutRefresh:v4];
  uint64_t v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Asking for RTT call: %@ and found: %@", (uint8_t *)&v9, 0x16u);
  }

  if (!v5)
  {
    [(RTTController *)self _refreshCurrentCallList];
    uint64_t v5 = [(RTTController *)self _callForUUIDWithoutRefresh:v4];
    id v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Refreshed call list and asking again for RTT call: %@ and found: %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v5;
}

- (void)dismissRTTFirstUseAlert
{
  id v3 = [(RTTController *)self actionClient];
  v2 = [MEMORY[0x263F21380] backgroundAccessQueue];
  [v3 sendAsynchronousMessage:&unk_26D1B3A08 withIdentifier:1 targetAccessQueue:v2 completion:&__block_literal_global_57];
}

- (void)displayRTTFirstUseAlert
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = [(RTTController *)self actionClient];
  v10[0] = @"shouldShow";
  v10[1] = @"style";
  v11[0] = MEMORY[0x263EFFA88];
  v11[1] = &unk_26D1B3B20;
  v10[2] = @"options";
  id v3 = ttyLocString(@"RTTFirstUseAlertAcceptButton");
  int v9 = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  v11[2] = v4;
  v10[3] = @"title";
  uint64_t v5 = ttyLocString(@"RTTFirstUseAlertTitle");
  v11[3] = v5;
  void v10[4] = @"message";
  uint64_t v6 = ttyLocString(@"RTTFirstUseAlertMessage");
  void v11[4] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  id v8 = [MEMORY[0x263F21380] backgroundAccessQueue];
  [v2 sendAsynchronousMessage:v7 withIdentifier:1 targetAccessQueue:v8 completion:&__block_literal_global_81];
}

- (void)dealloc
{
  [(RTTController *)self setActionCompletionBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)RTTController;
  [(RTTController *)&v3 dealloc];
}

- (void)clientRemoved:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(RTTController *)self rttCalls];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int v9 = AXLogRTT();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v8;
          _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Client removed, marked view controller visible no: %@", buf, 0xCu);
        }

        if ([v8 isViewControllerVisible]) {
          [v8 setIsViewControllerVisible:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)actionClient
{
  actionUIClient = self->_actionUIClient;
  if (!actionUIClient)
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x2050000000;
    uint64_t v4 = (void *)getAXUIClientClass_softClass;
    uint64_t v15 = getAXUIClientClass_softClass;
    if (!getAXUIClientClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getAXUIClientClass_block_invoke;
      v11[3] = &unk_264540250;
      void v11[4] = &v12;
      __getAXUIClientClass_block_invoke((uint64_t)v11);
      uint64_t v4 = (void *)v13[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v12, 8);
    id v6 = [v5 alloc];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"ActionSheetUIClient-%d", getpid());
    id v8 = (AXUIClient *)[v6 initWithIdentifier:v7 serviceBundleName:@"AXActionSheetUIServer"];
    int v9 = self->_actionUIClient;
    self->_actionUIClient = v8;

    [(AXUIClient *)self->_actionUIClient setDelegate:self];
    actionUIClient = self->_actionUIClient;
  }

  return actionUIClient;
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  long long v11 = v10;
  if (a5 == 2)
  {
    v20 = [v10 valueForKey:@"didTap"];
    [v20 BOOLValue];
  }
  else if (a5 == 1)
  {
    uint64_t v12 = AXLogRTT();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      v23 = v11;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Got action sheet reply: %@ from: %@", (uint8_t *)&v22, 0x16u);
    }

    long long v13 = [v11 valueForKey:@"result"];
    if (v13)
    {
      uint64_t v14 = [(RTTController *)self actionCompletionBlock];

      if (v14)
      {
        uint64_t v15 = [v13 unsignedIntegerValue];
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = v15;
        }
        uint64_t v17 = AXLogRTT();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (void *)MEMORY[0x223C608D0](self->_actionCompletionBlock);
          int v22 = 138412546;
          v23 = v18;
          __int16 v24 = 1024;
          LODWORD(v25) = v16;
          _os_log_impl(&dword_21FEA9000, v17, OS_LOG_TYPE_INFO, "Sending to action completion: %@ for calltype: %d", (uint8_t *)&v22, 0x12u);
        }
        v19 = [(RTTController *)self actionCompletionBlock];
        v19[2](v19, v16);

        [(RTTController *)self setActionCompletionBlock:0];
      }
    }
  }
  return 0;
}

- (id)handleRTTControllerIsVisible:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x223C60680]();
  uint64_t v5 = [v3 payload];
  id v6 = [v5 objectForKey:@"axtty_callID"];

  id v7 = [v3 payload];
  id v8 = [v7 objectForKey:@"axtty_is_viewcontrollervisible_key"];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = +[RTTController sharedController];
  long long v11 = [v10 callForUUID:v6];

  [v11 setIsViewControllerVisible:v9];
  uint64_t v12 = AXLogRTT();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109378;
    v14[1] = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Marking RTT view controller visible[%d] for call: %@", (uint8_t *)v14, 0x12u);
  }

  return 0;
}

- (id)handleMediaAction:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x223C60680]();
  uint64_t v5 = [v3 payload];
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_99];

  id v6 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:MEMORY[0x263EFFA78] andIdentifier:0x80000000000];
  id v7 = [v3 replyMessageWithPayload:v6];

  return v7;
}

void __35__RTTController_handleMediaAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  int v7 = [v5 isEqualToString:@"axtty_media_action"];

  if (v7)
  {
    id v8 = [v6 objectForKey:@"axtty_callID"];
    uint64_t v9 = +[RTTController sharedController];
    id v10 = [v9 callForUUID:v8];

    long long v11 = [v6 objectForKey:@"axtty_value"];
    uint64_t v12 = [v11 BOOLValue];

    long long v13 = AXLogRTT();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14[0] = 67109378;
      v14[1] = v12;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Got request to toggle mute: %d %@", (uint8_t *)v14, 0x12u);
    }

    [v10 toggleSystemOutputMute:v12];
  }
}

- (id)handleDatabaseRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Handling database request: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v6 = (void *)MEMORY[0x223C60680]();
  int v7 = [v4 payload];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__RTTController_handleDatabaseRequest___block_invoke;
  v12[3] = &unk_2645401B8;
  v12[4] = self;
  p_long long buf = &buf;
  id v8 = v4;
  id v13 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v9 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:*(void *)(*((void *)&buf + 1) + 40) andIdentifier:0x800000000];
  id v10 = [v8 replyMessageWithPayload:v9];

  _Block_object_dispose(&buf, 8);

  return v10;
}

void __39__RTTController_handleDatabaseRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v97 = v6;
  }
  else {
    id v97 = 0;
  }
  if ([v5 isEqualToString:@"axtty_read_action"])
  {
    int v7 = [v97 objectForKey:@"axtty_callID"];
    id v8 = [NSString stringWithFormat:@"%@_%@", v5, v7];
    uint64_t v9 = [*(id *)(a1 + 32) callForUUID:v7];
    id v10 = [v9 conversation];
    long long v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v128 = v10;
      __int16 v129 = 2112;
      v130 = v9;
      _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "Found conversation %@ from call: %@", buf, 0x16u);
    }

    if (v10) {
      goto LABEL_11;
    }
    uint64_t v12 = +[RTTDatabaseManager sharedManager];
    id v10 = [v12 conversationForCallUID:v7];

    id v13 = AXLogRTT();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v128 = v10;
      _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Using saved conversation: %@", buf, 0xCu);
    }

    if (v10)
    {
LABEL_11:
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
      [v14 encodeObject:v10 forKey:*MEMORY[0x263F081D0]];
      [v14 finishEncoding];
      __int16 v15 = [v14 encodedData];
      v125 = v8;
      v123 = @"axtty_conversation";
      v124 = v15;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      v126 = v16;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else
    {
      v121 = v8;
      v119 = @"axtty_conversation";
      id v10 = [MEMORY[0x263EFF9D0] null];
      v120 = v10;
      __int16 v15 = [NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
      v122 = v15;
      uint64_t v55 = [NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
      uint64_t v56 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v56 + 40);
      *(void *)(v56 + 40) = v55;
    }

    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"axtty_write_action"])
  {
    id v20 = objc_alloc(MEMORY[0x263F08928]);
    v21 = [v97 objectForKey:@"axtty_conversation"];
    id v98 = 0;
    int v22 = (void *)[v20 initForReadingFromData:v21 error:&v98];
    id v23 = v98;

    if (v23)
    {
      __int16 v24 = AXLogRTT();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_2();
      }
    }
    else
    {
      v95 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      v43 = objc_msgSend(v22, "decodeObjectOfClasses:forKey:");
      v44 = AXLogRTT();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v128 = v43;
        _os_log_impl(&dword_21FEA9000, v44, OS_LOG_TYPE_INFO, "Server save conversation: %@", buf, 0xCu);
      }

      if (v43)
      {
        v45 = NSString;
        v46 = [v43 callIdentifier];
        id v47 = [v45 stringWithFormat:@"%@_%@", v5, v46];

        v48 = +[RTTDatabaseManager sharedManager];
        uint64_t v49 = [v48 saveConversation:v43];

        v117 = v47;
        v115 = @"axtty_result";
        v50 = [NSNumber numberWithBool:v49];
        v116 = v50;
        id v51 = [NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
        v118 = v51;
        uint64_t v52 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
        uint64_t v53 = *(void *)(*(void *)(a1 + 48) + 8);
        v54 = *(void **)(v53 + 40);
        *(void *)(v53 + 40) = v52;
      }
    }

    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"axtty_delete_action"])
  {
    id v25 = [v97 objectForKey:@"axtty_callID"];
    uint64_t v26 = [NSString stringWithFormat:@"%@_%@", v5, v25];
    int v27 = +[RTTDatabaseManager sharedManager];
    uint64_t v28 = [v27 deleteConversationWithCallUID:v25];

    v113 = v26;
    v111 = @"axtty_result";
    __int16 v29 = [NSNumber numberWithBool:v28];
    v112 = v29;
    BOOL v30 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    v114 = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"axtty_contact_search_action"])
  {
    v34 = [v97 objectForKey:@"axtty_contactID"];
    v35 = [NSString stringWithFormat:@"%@_%@", v5, v34];
    v36 = +[RTTDatabaseManager sharedManager];
    uint64_t v37 = [v36 contactIDIsTTYContact:v34];

    v109 = v35;
    v107 = @"axtty_result";
    char v38 = [NSNumber numberWithBool:v37];
    v108 = v38;
    v39 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    v110 = v39;
    uint64_t v40 = [NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    uint64_t v41 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;

    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"axtty_contact_path_search_action"])
  {
    v57 = [v97 objectForKey:@"axtty_value"];
    v58 = [v97 objectForKey:@"axtty_contactID"];
    uint64_t v59 = [v57 indexOfObjectPassingTest:&__block_literal_global_115];
    v60 = [NSString stringWithFormat:@"%@_%@", v5, v58];
    v105 = v60;
    v103 = @"axtty_result";
    id v61 = [NSNumber numberWithInt:v59 != 0x7FFFFFFFFFFFFFFFLL];
    v104 = v61;
    v62 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    v106 = v62;
    uint64_t v63 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
    uint64_t v64 = *(void *)(*(void *)(a1 + 48) + 8);
    v65 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;

    goto LABEL_28;
  }
  if (![v5 isEqualToString:@"axtty_conversation_updates"])
  {
    if ([v5 isEqualToString:@"axtty_remote_conversation_updates"])
    {
      v78 = [*(id *)(a1 + 40) client];
      v79 = v78;
      uint64_t v80 = 0x10000000000;
    }
    else
    {
      if (![v5 isEqualToString:@"axtty_service_message_updates"])
      {
        if (![v5 isEqualToString:@"axtty_reset_cloud_support_store_action"]) {
          goto LABEL_28;
        }
        v79 = +[RTTTelephonyUtilities sharedUtilityProvider];
        [v79 resetCloudSupportStore];
        goto LABEL_52;
      }
      v78 = [*(id *)(a1 + 40) client];
      v79 = v78;
      uint64_t v80 = 0x20000000000;
    }
    [v78 setWantsUpdates:1 forIdentifier:v80];
LABEL_52:

    goto LABEL_28;
  }
  v66 = [v97 objectForKey:@"axtty_callID"];
  v67 = AXLogRTT();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v128 = v97;
    _os_log_impl(&dword_21FEA9000, v67, OS_LOG_TYPE_INFO, "Conversation update string: %@", buf, 0xCu);
  }

  v68 = [v97 objectForKey:@"axtty_value"];
  BOOL v69 = v68 == 0;

  if (v69)
  {
    v70 = [*(id *)(a1 + 40) client];
    [v70 setWantsUpdates:1 forIdentifier:0x800000000];
  }
  else
  {
    v70 = [v97 objectForKey:@"axtty_value"];
    v96 = [*(id *)(a1 + 32) callForUUID:v66];
    v71 = AXLogRTT();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v128 = v96;
      __int16 v129 = 2112;
      v130 = v66;
      _os_log_impl(&dword_21FEA9000, v71, OS_LOG_TYPE_INFO, "Using call: %@[%@]", buf, 0x16u);
    }

    v72 = [v97 objectForKey:@"axtty_sender_type"];
    int v73 = [v72 intValue];

    if (!v73)
    {
      v74 = AXLogRTT();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT)) {
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_4();
      }
    }
    v75 = [v97 objectForKey:@"axtty_message_type"];
    int v76 = [v75 intValue];

    if (v76 == 1)
    {
      [v96 sendString:v70];
      if (v73 == 2)
      {
        v81 = [v96 conversation];
        v82 = [v81 utterances];
        v94 = [v82 lastObject];

        v83 = [NSString stringWithFormat:@"%@_%@", @"axtty_remote_conversation_updates", v66];
        v93 = [*(id *)(a1 + 32) delegate];
        v84 = (void *)MEMORY[0x263F472C0];
        v85 = (void *)MEMORY[0x263F472B0];
        v101 = v83;
        v99[0] = @"axtty_result";
        uint64_t v86 = [v94 text];
        v87 = (void *)v86;
        v88 = &stru_26D1B01C8;
        if (v86) {
          v88 = (__CFString *)v86;
        }
        v100[0] = v88;
        v100[1] = v70;
        v99[1] = @"axtty_value";
        v99[2] = @"axtty_message_type";
        v100[2] = &unk_26D1B3B38;
        v89 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:3];
        v102 = v89;
        v90 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
        v91 = [v85 messagePayloadFromDictionary:v90 andIdentifier:0x800000000];
        v92 = [v84 messageWithPayload:v91];
        [v93 sendUpdateMessage:v92 forIdentifier:0x800000000];
      }
    }
    else if (v76)
    {
      if ((v76 & 0xFFFFFFFE) == 2 && v73 == 1) {
        [v96 saveTranscribedTextForConversation:v70 isNew:v76 == 2];
      }
    }
    else
    {
      v77 = AXLogRTT();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_3();
      }
    }
  }

LABEL_28:
}

uint64_t __39__RTTController_handleDatabaseRequest___block_invoke_112(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[RTTDatabaseManager sharedManager];
  uint64_t v4 = [v3 contactPathWasUsedForTTY:v2];

  return v4;
}

- (id)handleDictionaryRequest:(id)a3
{
  id v3 = [a3 payload];
  uint64_t v4 = [v3 objectForKey:@"shouldBeAvailable"];
  uint64_t v5 = [v4 BOOLValue];

  id v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
  [v6 setTTYDictionaryAvailability:v5];

  return 0;
}

- (id)handleSettingsRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKey:@"axtty_uuid"];

  id v6 = [v3 payload];
  int v7 = [v6 objectForKey:@"axtty_settings_key"];

  id v8 = +[RTTSettings sharedInstance];
  [v8 selectorForPreferenceKey:v7];

  uint64_t v9 = +[RTTSettings sharedInstance];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0
    || (+[RTTSettings sharedInstance],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        [v11 valueForPreferenceKey:v7],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  id v13 = [v3 client];
  [v13 setWantsUpdates:1 forIdentifier:0x40000000000];

  uint64_t v14 = AXLogRTT();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "Returning remote request for setting: %@ > %@", buf, 0x16u);
  }

  __int16 v15 = (void *)MEMORY[0x263F472B0];
  int v22 = v12;
  id v23 = v5;
  v21 = @"axtty_result";
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  __int16 v24 = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  uint64_t v18 = [v15 messagePayloadFromDictionary:v17 andIdentifier:0x4000000000];
  id v19 = [v3 replyMessageWithPayload:v18];

  return v19;
}

- (id)displayCallPrompt:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"shouldShow"];
  int v7 = [v6 BOOLValue];

  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v51 = v4;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Asking to show call prompt: %@", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __35__RTTController_displayCallPrompt___block_invoke;
    v44 = &unk_264540200;
    id v9 = v4;
    id v45 = v9;
    [(RTTController *)self setActionCompletionBlock:&v41];
    char v10 = [v9 payload];
    uint64_t v11 = [v10 objectForKey:@"title"];

    if (v11) {
      uint64_t v12 = (__CFString *)v11;
    }
    else {
      uint64_t v12 = &stru_26D1B01C8;
    }
    id v13 = NSString;
    uint64_t v14 = ttyLocString(@"TTYCallTypeVoiceWithDestination");
    __int16 v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12, v41, v42, v43, v44);

    uint64_t v16 = [(RTTController *)self actionClient];
    int64_t v17 = +[RTTTelephonyUtilities currentSupportedTextingType];
    uint64_t v18 = @"TTYCallTypeRelay";
    id v19 = @"TTYCallTypeTTY";
    if (v17 == 1)
    {
      id v19 = @"TTYCallTypeRTT";
      uint64_t v18 = @"TTYCallTypeRelayRTT";
    }
    BOOL v20 = v17 == 3;
    if (v17 == 3) {
      v21 = @"TTYCallTypeRTT_TTY";
    }
    else {
      v21 = v19;
    }
    v49[0] = v15;
    if (v20) {
      int v22 = @"TTYCallTypeRelayRTT_TTY";
    }
    else {
      int v22 = v18;
    }
    id v23 = ttyLocString(v21);
    v49[1] = v23;
    __int16 v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];

    v48[0] = &unk_26D1B3B50;
    id v25 = NSNumber;
    if (+[RTTTelephonyUtilities shouldUseRTT]) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 1;
    }
    __int16 v27 = [v25 numberWithUnsignedInteger:v26];
    v48[1] = v27;
    uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];

    if (+[RTTTelephonyUtilities relayIsSupported])
    {
      uint64_t v29 = +[RTTTelephonyUtilities sharedUtilityProvider];
      uint64_t v30 = [v29 currentPreferredTransportMethod];

      if (v30 == 2)
      {
        uint64_t v31 = ttyLocString(v22);
        uint64_t v32 = [v24 arrayByAddingObject:v31];

        uint64_t v33 = [v28 arrayByAddingObject:&unk_26D1B3B68];

        __int16 v24 = (void *)v32;
        uint64_t v28 = (void *)v33;
      }
    }
    if (v24)
    {
      v46[0] = @"shouldShow";
      v46[1] = @"options";
      v47[0] = MEMORY[0x263EFFA88];
      v47[1] = v24;
      v47[2] = v28;
      v46[2] = @"optionIndexes";
      v46[3] = @"cancelMessage";
      v34 = ttyLocString(@"TTYCallTypeCancel");
      v47[3] = v34;
      v46[4] = @"style";
      v35 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x263F472B0], "deviceIsPad"));
      v47[4] = v35;
      v36 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];

      uint64_t v37 = [MEMORY[0x263F21380] backgroundAccessQueue];
      [v16 sendAsynchronousMessage:v36 withIdentifier:1 targetAccessQueue:v37 completion:&__block_literal_global_167];
    }
    char v38 = v45;
  }
  else
  {
    char v38 = [(RTTController *)self actionClient];
    v39 = [MEMORY[0x263F21380] backgroundAccessQueue];
    [v38 sendAsynchronousMessage:&unk_26D1B3A30 withIdentifier:1 targetAccessQueue:v39 completion:&__block_literal_global_173];
  }
  return 0;
}

void __35__RTTController_displayCallPrompt___block_invoke(uint64_t a1, uint64_t a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F472B0];
  __int16 v15 = @"result";
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  v16[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v6 = [v3 messagePayloadFromDictionary:v5 andIdentifier:0x1000000000];
  int v7 = [v2 replyMessageWithPayload:v6];

  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 client];
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Received reply %@, forwarding back to %@", (uint8_t *)&v11, 0x16u);
  }
  char v10 = [v7 client];
  [v10 sendMessage:v7 errorBlock:&__block_literal_global_128];
}

void __35__RTTController_displayCallPrompt___block_invoke_125(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__RTTController_displayCallPrompt___block_invoke_125_cold_1();
  }
}

- (id)handleIncomingNotificationSuppressionChange:(id)a3
{
  id v4 = [a3 payload];
  uint64_t v5 = [v4 objectForKey:@"shouldSuppress"];
  uint64_t v6 = [v5 BOOLValue];

  [(RTTController *)self setShouldSuppressIncomingNotification:v6];
  if (v6)
  {
    int v7 = [(RTTController *)self actionClient];
    id v8 = [MEMORY[0x263F21380] backgroundAccessQueue];
    [v7 sendAsynchronousMessage:&unk_26D1B3A58 withIdentifier:2 targetAccessQueue:v8 completion:&__block_literal_global_182];
  }
  return 0;
}

- (id)handleRTTVoicemailMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F472B0] currentProcessIsHeard])
  {
    uint64_t v5 = [v4 payload];
    uint64_t v6 = [v5 objectForKey:@"axtty_callID"];

    int v7 = [v4 payload];
    id v8 = [v7 objectForKey:@"axtty_voicemail_message_locale"];

    id v9 = [v4 payload];
    char v10 = [v9 objectForKey:@"axtty_voicemail_message_url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = 0;
      int v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v30];
      uint64_t v12 = v30;
      if (v12)
      {
        __int16 v13 = v12;
        uint64_t v14 = AXLogRTT();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[RTTController handleRTTVoicemailMessage:]();
        }

LABEL_13:
        id v15 = 0;
LABEL_22:

        goto LABEL_23;
      }
      id v15 = [v11 URL];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __int16 v13 = AXLogRTT();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[RTTController handleRTTVoicemailMessage:]();
        }
        goto LABEL_13;
      }
      id v15 = v10;
    }
    uint64_t v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "Received voicemail message url for callID %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2050000000;
    int64_t v17 = (void *)getSFSpeechRecognizerClass_softClass;
    uint64_t v34 = getSFSpeechRecognizerClass_softClass;
    if (!getSFSpeechRecognizerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v36 = __getSFSpeechRecognizerClass_block_invoke;
      uint64_t v37 = &unk_264540250;
      char v38 = &v31;
      __getSFSpeechRecognizerClass_block_invoke((uint64_t)&buf);
      int64_t v17 = (void *)v32[3];
    }
    uint64_t v18 = v17;
    _Block_object_dispose(&v31, 8);
    id v19 = [v18 alloc];
    BOOL v20 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v8];
    __int16 v13 = [v19 initWithLocale:v20];

    v21 = [(RTTController *)self callForUUID:v6];
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2050000000;
    int v22 = (void *)getSFSpeechURLRecognitionRequestClass_softClass;
    uint64_t v34 = getSFSpeechURLRecognitionRequestClass_softClass;
    if (!getSFSpeechURLRecognitionRequestClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v36 = __getSFSpeechURLRecognitionRequestClass_block_invoke;
      uint64_t v37 = &unk_264540250;
      char v38 = &v31;
      __getSFSpeechURLRecognitionRequestClass_block_invoke((uint64_t)&buf);
      int v22 = (void *)v32[3];
    }
    id v23 = v22;
    _Block_object_dispose(&v31, 8);
    __int16 v24 = (void *)[[v23 alloc] initWithURL:v15];
    [v24 setShouldReportPartialResults:0];
    [v24 setAddsPunctuation:1];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __43__RTTController_handleRTTVoicemailMessage___block_invoke;
    v28[3] = &unk_264540228;
    id v29 = v21;
    id v25 = v21;
    id v26 = (id)[v13 recognitionTaskWithRequest:v24 resultHandler:v28];

    goto LABEL_22;
  }
  uint64_t v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Can only handle voicemail transcriptions from heard", (uint8_t *)&buf, 2u);
  }
LABEL_23:

  return 0;
}

void __43__RTTController_handleRTTVoicemailMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    id v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Transcription failed with error %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if ([v5 isFinal])
  {
    id v8 = [v5 bestTranscription];
    id v9 = [v8 formattedString];

    char v10 = NSString;
    int v11 = ttyLocString(@"RTTVoicemailPrefix");
    uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", v11, v9);

    [*(id *)(a1 + 32) sendVoicemailTranscriptionText:v12];
    __int16 v13 = AXLogRTT();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Transcribed voicemail message text: %@", buf, 0xCu);
    }

LABEL_9:
  }
}

- (void)ttyCall:(id)a3 didReceiveString:(id)a4 forUtterance:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  char v10 = NSString;
  int v11 = [a3 call];
  uint64_t v12 = [v11 callUUID];
  __int16 v13 = [v10 stringWithFormat:@"%@_%@", @"axtty_conversation_updates", v12];

  uint64_t v14 = (__CFString *)v9;
  id v15 = AXLogRTT();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [(RTTController *)self delegate];
    *(_DWORD *)long long buf = 138412802;
    id v30 = v8;
    __int16 v31 = 2112;
    uint64_t v32 = v14;
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    _os_log_impl(&dword_21FEA9000, v15, OS_LOG_TYPE_INFO, "Received remote string %@ for utterance: %@, sending to delegate: %@", buf, 0x20u);
  }
  if (v14) {
    int64_t v17 = v14;
  }
  else {
    int64_t v17 = &stru_26D1B01C8;
  }

  uint64_t v18 = [(RTTController *)self delegate];
  id v19 = (void *)MEMORY[0x263F472C0];
  BOOL v20 = (void *)MEMORY[0x263F472B0];
  __int16 v27 = v13;
  v25[0] = @"axtty_result";
  v25[1] = @"axtty_value";
  v26[0] = v17;
  v26[1] = v8;
  v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  uint64_t v28 = v21;
  int v22 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v23 = [v20 messagePayloadFromDictionary:v22 andIdentifier:0x800000000];
  __int16 v24 = [v19 messageWithPayload:v23];
  [v18 sendUpdateMessage:v24 forIdentifier:0x800000000];
}

- (void)ttyCall:(id)a3 didSendRemoteString:(id)a4 forUtterance:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  char v10 = NSString;
  int v11 = [a3 call];
  uint64_t v12 = [v11 callUUID];
  __int16 v13 = [v10 stringWithFormat:@"%@_%@", @"axtty_remote_conversation_updates", v12];

  uint64_t v14 = (__CFString *)v9;
  id v15 = AXLogRTT();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v29 = v8;
    __int16 v30 = 2112;
    __int16 v31 = v14;
    _os_log_impl(&dword_21FEA9000, v15, OS_LOG_TYPE_INFO, "Sending remote string %@ for utterance: %@", buf, 0x16u);
  }
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = &stru_26D1B01C8;
  }

  int64_t v17 = [(RTTController *)self delegate];
  uint64_t v18 = (void *)MEMORY[0x263F472C0];
  id v19 = (void *)MEMORY[0x263F472B0];
  id v26 = v13;
  v24[0] = @"axtty_result";
  v24[1] = @"axtty_value";
  v25[0] = v16;
  v25[1] = v8;
  BOOL v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  __int16 v27 = v20;
  v21 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  int v22 = [v19 messagePayloadFromDictionary:v21 andIdentifier:0x10000000000];
  id v23 = [v18 messageWithPayload:v22];
  [v17 sendUpdateMessage:v23 forIdentifier:0x10000000000];
}

- (void)ttyCall:(id)a3 setVisible:(BOOL)a4 serviceUpdate:(id)a5
{
  BOOL v5 = a4;
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = NSString;
  char v10 = [a3 call];
  int v11 = [v10 callUUID];
  uint64_t v12 = [v9 stringWithFormat:@"%@_%@", @"axtty_service_message_updates", v11];

  id v25 = v12;
  v23[0] = @"axtty_result";
  v23[1] = @"axtty_value";
  v24[0] = v8;
  v24[1] = MEMORY[0x263EFFA78];
  v23[2] = @"axtty_set_visible_service_update";
  __int16 v13 = [NSNumber numberWithBool:v5];
  void v24[2] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[0] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

  uint64_t v16 = AXLogRTT();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    int v22 = v15;
    _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "Send service update: %@", buf, 0xCu);
  }

  int64_t v17 = [(RTTController *)self delegate];
  uint64_t v18 = (void *)MEMORY[0x263F472C0];
  id v19 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v15 andIdentifier:0x20000000000];
  BOOL v20 = [v18 messageWithPayload:v19];
  [v17 sendUpdateMessage:v20 forIdentifier:0x20000000000];
}

- (void)transcriptionDidStart:(id)a3 forCallUUID:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_DEFAULT, "New transcription: %@", (uint8_t *)&v9, 0xCu);
  }

  [(RTTController *)self _updateConversationControllerWithTranscription:v6 type:2 callUUID:v7];
}

- (void)transcriptionDidUpdate:(id)a3 forCallUUID:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_DEFAULT, "Updated transcription: %@", (uint8_t *)&v9, 0xCu);
  }

  [(RTTController *)self _updateConversationControllerWithTranscription:v6 type:3 callUUID:v7];
}

- (void)_updateConversationControllerWithTranscription:(id)a3 type:(int64_t)a4 callUUID:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(RTTController *)self callForUUID:v8];
  uint64_t v11 = [NSString stringWithFormat:@"%@_%@", @"axtty_remote_conversation_updates", v8];

  uint64_t v12 = [(RTTController *)self delegate];
  __int16 v13 = (void *)MEMORY[0x263F472C0];
  uint64_t v14 = (void *)MEMORY[0x263F472B0];
  int v22 = v11;
  v20[0] = @"axtty_result";
  v20[1] = @"axtty_value";
  v21[0] = v9;
  v21[1] = v9;
  v20[2] = @"axtty_message_type";
  id v15 = [NSNumber numberWithInteger:a4];
  v21[2] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v23[0] = v16;
  int64_t v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  uint64_t v18 = [v14 messagePayloadFromDictionary:v17 andIdentifier:0x800000000];
  id v19 = [v13 messageWithPayload:v18];
  [v12 sendUpdateMessage:v19 forIdentifier:0x800000000];

  [v10 saveTranscribedTextForConversation:v9 isNew:a4 == 2];
}

- (NSMutableArray)rttCalls
{
  return self->_rttCalls;
}

- (void)setRttCalls:(id)a3
{
}

- (HCHeardControllerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HCHeardControllerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)serverInvalidateCallback
{
  return self->_serverInvalidateCallback;
}

- (void)setServerInvalidateCallback:(id)a3
{
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
}

- (BOOL)shouldSuppressIncomingNotification
{
  return self->_shouldSuppressIncomingNotification;
}

- (void)setShouldSuppressIncomingNotification:(BOOL)a3
{
  self->_shouldSuppressIncomingNotification = a3;
}

- (RTTTranscriptionController)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong(&self->_serverInvalidateCallback, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rttCalls, 0);
  objc_storeStrong((id *)&self->_callUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_preferredRelayCoalescer, 0);
  objc_storeStrong((id *)&self->_localSettingsCache, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong((id *)&self->_actionUIClient, 0);
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Exception decoding data: %@", v2, v3, v4, v5, v6);
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Failed to create unarchiver with error %@", v2, v3, v4, v5, v6);
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_FAULT, "We need a message type for update messages: %@", v1, 0xCu);
}

void __39__RTTController_handleDatabaseRequest___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_FAULT, "We need a sender type for update messages: %@", v1, 0xCu);
}

void __35__RTTController_displayCallPrompt___block_invoke_125_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Send message error: %@", v2, v3, v4, v5, v6);
}

- (void)handleRTTVoicemailMessage:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21FEA9000, v1, OS_LOG_TYPE_ERROR, "Failed to decode voicemail message url for callID %@, error: %@", v2, 0x16u);
}

- (void)handleRTTVoicemailMessage:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Failed to parse voicemail message url from payload for callID %@", v2, v3, v4, v5, v6);
}

@end