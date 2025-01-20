@interface SRUIFUIBridgeClient
- (BOOL)isAttending;
- (SRUIFSiriSessionStateHandler)_stateHandler;
- (SRUIFUIBridgeClient)initWithStateHandler:(id)a3;
- (SRUIFUIBridgeClient)initWithStateHandler:(id)a3 delegateQueue:(id)a4;
- (SRUIFUIBridgeClientDelegate)delegate;
- (SUIBUIBridgeClient)_client;
- (id)buildLatencyTextFromActionFlow:(id)a3;
- (void)_setIsAttending:(BOOL)a3;
- (void)endForReason:(int64_t)a3;
- (void)idleAndQuietDidChange:(BOOL)a3;
- (void)newRequestWillStart;
- (void)promptedUserForInput;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStateHandler:(id)a3;
- (void)stopAttending;
- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3;
- (void)uiBridgeServiceDidReceiveTasks:(id)a3;
- (void)uiBridgeServiceDidStartAttending;
- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3;
- (void)uiBridgeServiceReceivedCancelPhotoSelectionWithAnimation:(BOOL)a3;
- (void)uiBridgeServiceReceivedRequestProgress:(id)a3;
- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt;
- (void)uiBridgeServiceReceivedShowPhotoSelectionWithSearchString:(id)a3;
- (void)uiBridgeServiceReceivedSiriResponse:(id)a3;
- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3;
- (void)uiBridgeServiceWillStartAttending;
@end

@implementation SRUIFUIBridgeClient

- (SRUIFUIBridgeClient)initWithStateHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SRUIFUIBridgeClient;
  v6 = [(SRUIFUIBridgeClient *)&v15 init];
  objc_storeStrong((id *)&v6->_stateHandler, a3);
  v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SRUIFUIBridgeClient initWithStateHandler:]";
    _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - creating UIBridge client", buf, 0xCu);
  }
  uint64_t v8 = [objc_alloc(MEMORY[0x263F75400]) initWithDelegate:v6];
  client = v6->_client;
  v6->_client = (SUIBUIBridgeClient *)v8;

  [(SUIBUIBridgeClient *)v6->_client preheat];
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.siri.attendingQueue", 0);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v10;

  v12 = objc_alloc_init(_TtC16SiriUIFoundation24SRUIFLatencyStateManager);
  latencyStateManager = v6->_latencyStateManager;
  v6->_latencyStateManager = v12;

  return v6;
}

- (SRUIFUIBridgeClient)initWithStateHandler:(id)a3 delegateQueue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SRUIFUIBridgeClient;
  id v8 = a4;
  v9 = [(SRUIFUIBridgeClient *)&v19 init];
  objc_storeStrong((id *)&v9->_stateHandler, a3);
  dispatch_queue_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[SRUIFUIBridgeClient initWithStateHandler:delegateQueue:]";
    _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - creating UIBridge client with delegate queue", buf, 0xCu);
  }
  id v11 = objc_alloc(MEMORY[0x263F75400]);
  uint64_t v12 = objc_msgSend(v11, "initWithDelegate:delegateQueue:", v9, v8, v19.receiver, v19.super_class);

  client = v9->_client;
  v9->_client = (SUIBUIBridgeClient *)v12;

  [(SUIBUIBridgeClient *)v9->_client preheat];
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.siri.attendingQueue", 0);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v14;

  v16 = objc_alloc_init(_TtC16SiriUIFoundation24SRUIFLatencyStateManager);
  latencyStateManager = v9->_latencyStateManager;
  v9->_latencyStateManager = v16;

  return v9;
}

- (void)idleAndQuietDidChange:(BOOL)a3
{
  if (a3 && [(SRUIFUIBridgeClient *)self isAttending])
  {
    id v4 = [(SRUIFUIBridgeClient *)self _stateHandler];
    [v4 performTransitionForEvent:9];
  }
}

- (void)endForReason:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSNumber;
    id v7 = v5;
    id v8 = [v6 numberWithInteger:a3];
    int v9 = 136315394;
    dispatch_queue_t v10 = "-[SRUIFUIBridgeClient endForReason:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - end for reason %@", (uint8_t *)&v9, 0x16u);
  }
  [(SUIBUIBridgeClient *)self->_client stopAttendingForReason:1];
  [(SUIBUIBridgeClient *)self->_client siriDismissed];
  [(SRUIFUIBridgeClient *)self _setIsAttending:0];
}

- (void)stopAttending
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SRUIFUIBridgeClient stopAttending]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - stop attending", (uint8_t *)&v4, 0xCu);
  }
  [(SUIBUIBridgeClient *)self->_client stopAttendingForReason:1];
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:10];
  [(SRUIFUIBridgeClient *)self _setIsAttending:0];
}

- (void)_setIsAttending:(BOOL)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SRUIFUIBridgeClient__setIsAttending___block_invoke;
  block[3] = &unk_264785F28;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__SRUIFUIBridgeClient__setIsAttending___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (*((unsigned __int8 *)WeakRetained + 32) != v3)
    {
      *((unsigned char *)WeakRetained + 32) = v3;
      int v4 = WeakRetained + 5;
      BOOL v8 = WeakRetained;
      id v5 = objc_loadWeakRetained(WeakRetained + 5);
      char v6 = objc_opt_respondsToSelector();

      WeakRetained = v8;
      if (v6)
      {
        id v7 = objc_loadWeakRetained(v4);
        [v7 attendingStatusChanged:*((unsigned __int8 *)v8 + 32)];

        WeakRetained = v8;
      }
    }
  }
}

- (void)promptedUserForInput
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SRUIFUIBridgeClient promptedUserForInput]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation", (uint8_t *)&v4, 0xCu);
  }
  [(SUIBUIBridgeClient *)self->_client siriPrompted];
}

- (void)newRequestWillStart
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[SRUIFUIBridgeClient newRequestWillStart]";
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation", (uint8_t *)&v3, 0xCu);
  }
}

- (void)uiBridgeServiceWillStartAttending
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SRUIFUIBridgeClient uiBridgeServiceWillStartAttending]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - will start attending", (uint8_t *)&v4, 0xCu);
  }
  [(SRUIFUIBridgeClient *)self _setIsAttending:1];
}

- (void)uiBridgeServiceDidStartAttending
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SRUIFUIBridgeClient uiBridgeServiceDidStartAttending]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - did start attending", (uint8_t *)&v4, 0xCu);
  }
  [(SRUIFUIBridgeClient *)self _setIsAttending:1];
}

- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SRUIFUIBridgeClient uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:]";
    _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - did stop attending", (uint8_t *)&v5, 0xCu);
  }
  [(SRUIFUIBridgeClient *)self _setIsAttending:0];
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:10];
}

- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(SRUIFUIBridgeClient *)self _stateHandler];
    BOOL v8 = SRUIFSiriSessionStateGetDescription([v7 state]);
    int v11 = 136315650;
    uint64_t v12 = "-[SRUIFUIBridgeClient uiBridgeServiceDetectedSpeechStart:]";
    __int16 v13 = 1024;
    BOOL v14 = v3;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - speech start detected, shouldDuckTTS: %d, currentState: %@", (uint8_t *)&v11, 0x1Cu);
  }
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:11];
  if (v3)
  {
    self->_didDuckTTS = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LODWORD(v10) = 1036831949;
    [WeakRetained duckTTSToVolume:&__block_literal_global_8 rampTime:v10 completion:0.5];
  }
}

void __58__SRUIFUIBridgeClient_uiBridgeServiceDetectedSpeechStart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = *MEMORY[0x263F28348];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __58__SRUIFUIBridgeClient_uiBridgeServiceDetectedSpeechStart___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[SRUIFUIBridgeClient uiBridgeServiceDetectedSpeechStart:]_block_invoke";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - successfully ducked TTS", (uint8_t *)&v11, 0xCu);
  }
}

- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    BOOL v14 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]";
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - mitigationResult: %ld", (uint8_t *)&v13, 0x16u);
  }
  if (a3 == 3)
  {
    uint64_t v7 = [(SRUIFUIBridgeClient *)self _stateHandler];
    uint64_t v8 = v7;
    uint64_t v9 = 12;
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_8;
    }
    uint64_t v7 = [(SRUIFUIBridgeClient *)self _stateHandler];
    uint64_t v8 = v7;
    uint64_t v9 = 13;
  }
  [v7 performTransitionForEvent:v9];

LABEL_8:
  if (self->_didDuckTTS)
  {
    self->_didDuckTTS = 0;
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      BOOL v14 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]";
      _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - unducking TTS", (uint8_t *)&v13, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LODWORD(v12) = 1.0;
    [WeakRetained duckTTSToVolume:&__block_literal_global_8 rampTime:v12 completion:0.5];
  }
}

void __69__SRUIFUIBridgeClient_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = *MEMORY[0x263F28348];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __69__SRUIFUIBridgeClient_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    double v12 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]_block_invoke";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - successfully unducked TTS", (uint8_t *)&v11, 0xCu);
  }
}

- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedShowAssetsDownloadPrompt]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - Received Show Assets Download notification prompt.", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained showAssetsDownloadNotificationPrompt];
}

- (void)uiBridgeServiceReceivedShowPhotoSelectionWithSearchString:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained requestPhotoSelectionWithSearchString:v4 completion:&__block_literal_global_11];
}

- (void)uiBridgeServiceReceivedCancelPhotoSelectionWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelPhotoSelectionWithAnimation:v3];
}

- (void)uiBridgeServiceDidReceiveTasks:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  uint64_t v6 = (os_log_t *)MEMORY[0x263F28348];
  if (v5 >= 2)
  {
    uint64_t v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFUIBridgeClient uiBridgeServiceDidReceiveTasks:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  __int16 v15 = [v4 lastObject];
  unint64_t v16 = [v15 taskId];

  uint64_t v17 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    v24 = "-[SRUIFUIBridgeClient uiBridgeServiceDidReceiveTasks:]";
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_225FBA000, v17, OS_LOG_TYPE_DEFAULT, "%s Siri UI received task with identifier: %@", (uint8_t *)&v23, 0x16u);
  }
  latencyStateManager = self->_latencyStateManager;
  uint64_t v19 = [v16 UUIDString];
  [(SRUIFLatencyStateManager *)latencyStateManager processTaskReceivedWithIdentifier:v19];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v19) = objc_opt_respondsToSelector();

  if (v19)
  {
    id v22 = objc_loadWeakRetained((id *)p_delegate);
    [v22 orchestrationBeganTaskWithIdentifier:v16];
  }
}

- (void)uiBridgeServiceReceivedSiriResponse:(id)a3
{
  id v4 = [a3 inAppResponse];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained orchestrationDidPresentResponseFullyInApp];
  }
}

- (void)uiBridgeServiceReceivedRequestProgress:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 progressType];
  if (v4 == 2)
  {
    latencyStateManager = self->_latencyStateManager;
    uint64_t v6 = [v15 intelligenceFlowProgressUpdate];
    [(SRUIFLatencyStateManager *)latencyStateManager processLatencyProgressUpdate:v6];
  }
  else
  {
    if (v4 == 1)
    {
      uint64_t v10 = self->_latencyStateManager;
      uint64_t v6 = [v15 intelligenceFlowActionSummary];
      uint64_t v7 = [(SRUIFUIBridgeClient *)self buildLatencyTextFromActionFlow:v6];
      [(SRUIFLatencyStateManager *)v10 processParameterSummary:v7];
    }
    else
    {
      if (v4) {
        goto LABEL_9;
      }
      unint64_t v5 = self->_latencyStateManager;
      uint64_t v6 = [v15 nlRouterSummary];
      uint64_t v7 = [v6 rewrittenUtterance];
      uint64_t v8 = (void *)[v7 copy];
      [(SRUIFLatencyStateManager *)v5 processParameterSummary:v8];
    }
  }

LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v14 = [(SRUIFLatencyStateManager *)self->_latencyStateManager getLatestLatencyInformation];
    [v13 receivedLatencyInformation:v14];
  }
}

- (id)buildLatencyTextFromActionFlow:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 formatString];
  unint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v3 parameterMatches];
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_18];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    v21 = &v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        id v13 = objc_msgSend(v3, "parameterSummaries", v21);
        uint64_t v14 = [v12 captured];
        id v15 = [v13 objectForKey:v14];
        unint64_t v16 = [v15 value];

        if (!v16)
        {
          uint64_t v17 = *MEMORY[0x263F28348];
          unint64_t v16 = &stru_26D9AE000;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
            [(SRUIFUIBridgeClient *)buf buildLatencyTextFromActionFlow:v17];
          }
        }
        uint64_t v18 = [v12 range];
        objc_msgSend(v5, "replaceCharactersInRange:withString:", v18, v19, v16);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v9);
  }

  return v5;
}

uint64_t __54__SRUIFUIBridgeClient_buildLatencyTextFromActionFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 range];
  unint64_t v6 = [v4 range];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

- (SRUIFUIBridgeClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFUIBridgeClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (SRUIFSiriSessionStateHandler)_stateHandler
{
  return (SRUIFSiriSessionStateHandler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStateHandler:(id)a3
{
}

- (SUIBUIBridgeClient)_client
{
  return (SUIBUIBridgeClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latencyStateManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__SRUIFUIBridgeClient_uiBridgeServiceDetectedSpeechStart___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__SRUIFUIBridgeClient_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)uiBridgeServiceDidReceiveTasks:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)buildLatencyTextFromActionFlow:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SRUIFUIBridgeClient buildLatencyTextFromActionFlow:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s #SiriUIBridge sent match with no corresponding parameter summary", buf, 0xCu);
}

@end