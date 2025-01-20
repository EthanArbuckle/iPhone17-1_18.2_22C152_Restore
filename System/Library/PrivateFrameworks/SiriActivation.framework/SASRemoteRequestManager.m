@interface SASRemoteRequestManager
+ (SASRemoteRequestManager)new;
+ (id)manager;
- (AFRemoteRequestWatcher)remoteRequestWatcher;
- (AFRequestInfo)pendingVoiceTriggerActivationInfo;
- (BOOL)_requestWatcherVoiceActivationEnabled;
- (BOOL)hasPendingVoiceTriggerActivation;
- (CMPocketStateManager)pocketStateManager;
- (INAppIntentDeliverer)currentAppIntentDeliverer;
- (SASRemoteRequestManager)init;
- (id)_init;
- (int64_t)_dismissalReasonForDeactivationReason:(int64_t)a3;
- (int64_t)currentPocketState;
- (unint64_t)currentVoiceTriggerRestriction;
- (unint64_t)pendingVoiceTriggerRestrictionCount;
- (void)_handleNewRemoteRequestWithInfo:(id)a3;
- (void)_handlePendingVoiceTriggerActivationsWithInfo:(id)a3;
- (void)_handleRemotePrewarmWithInfo:(id)a3;
- (void)_handleRemoteRequestDismissalWithReason:(int64_t)a3 options:(unint64_t)a4 analyticsContext:(id)a5;
- (void)_handleRequestWatcherVoiceTriggerRequestWithInfo:(id)a3;
- (void)_processPendingVoiceTriggerActivationsWithInfo:(id)a3 delay:(double)a4;
- (void)_startFetchingPocketStateUpdates;
- (void)setCurrentAppIntentDeliverer:(id)a3;
- (void)setCurrentPocketState:(int64_t)a3;
- (void)setCurrentVoiceTriggerRestriction:(unint64_t)a3;
- (void)setHasPendingVoiceTriggerActivation:(BOOL)a3;
- (void)setPendingVoiceTriggerActivationInfo:(id)a3;
- (void)setPendingVoiceTriggerRestrictionCount:(unint64_t)a3;
- (void)setPocketStateManager:(id)a3;
- (void)setRemoteRequestWatcher:(id)a3;
@end

@implementation SASRemoteRequestManager

+ (id)manager
{
  if (manager_onceToken != -1) {
    dispatch_once(&manager_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)manager_sharedManager;
  return v2;
}

uint64_t __34__SASRemoteRequestManager_manager__block_invoke()
{
  manager_sharedManager = [[SASRemoteRequestManager alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v27.receiver = self;
  v27.super_class = (Class)SASRemoteRequestManager;
  v2 = [(SASRemoteRequestManager *)&v27 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F4E548]);
    [(SASRemoteRequestManager *)v2 setRemoteRequestWatcher:v3];

    objc_initWeak(&location, v2);
    v4 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __32__SASRemoteRequestManager__init__block_invoke;
    v24[3] = &unk_1E6B68010;
    objc_copyWeak(&v25, &location);
    [v4 setPrewarmHandler:v24];

    v5 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __32__SASRemoteRequestManager__init__block_invoke_2;
    v22[3] = &unk_1E6B68038;
    objc_copyWeak(&v23, &location);
    [v5 setRequestHandler:v22];

    v6 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __32__SASRemoteRequestManager__init__block_invoke_3;
    v20[3] = &unk_1E6B68060;
    objc_copyWeak(&v21, &location);
    [v6 setDismissalHandler:v20];

    v7 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    [v7 setNewSpeechRequestHandler:&__block_literal_global_74];

    v8 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __32__SASRemoteRequestManager__init__block_invoke_5;
    v18[3] = &unk_1E6B680D0;
    objc_copyWeak(&v19, &location);
    [v8 setIntentHandler:v18];

    v9 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __32__SASRemoteRequestManager__init__block_invoke_7;
    v16 = &unk_1E6B68120;
    objc_copyWeak(&v17, &location);
    [v9 setIntentForwardingActionHandler:&v13];

    v10 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    [v10 setButtonEventHandler:&__block_literal_global_85];

    v11 = [(SASRemoteRequestManager *)v2 remoteRequestWatcher];
    [v11 setActivationHandler:&__block_literal_global_89];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__SASRemoteRequestManager__init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRemotePrewarmWithInfo:v3];
}

void __32__SASRemoteRequestManager__init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  v7 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleNewRemoteRequestWithInfo:v5];

  v7[2](v7, 0);
}

void __32__SASRemoteRequestManager__init__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleRemoteRequestDismissalWithReason:a2 options:a3 analyticsContext:v7];
}

void __32__SASRemoteRequestManager__init__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 activationEvent])
  {
    v4 = [[SiriContinuityContext alloc] initWithSpeechRequestOptions:v2];

    id v3 = +[SiriActivationService service];
    [v3 activationRequestFromContinuityWithContext:v4];
  }
  else
  {
    v4 = [[SiriContext alloc] initWithSpeechRequestOptions:v2];

    id v3 = +[SiriActivationService service];
    [v3 activationRequestFromButtonIdentifier:1 context:v4];
  }
}

void __32__SASRemoteRequestManager__init__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  v8 = (id *)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  v12 = (void *)WeakRetained[3];
  if (v12) {
    [v12 invalidateIntentDelivery];
  }
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F302C0]) initWithBundleIdentifier:v9];

  uint64_t v14 = (void *)WeakRetained[3];
  WeakRetained[3] = v13;

  v15 = (void *)WeakRetained[3];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32__SASRemoteRequestManager__init__block_invoke_6;
  v18[3] = &unk_1E6B680A8;
  id v19 = WeakRetained;
  id v20 = v7;
  id v16 = v7;
  id v17 = WeakRetained;
  [v15 deliverIntent:v10 reply:v18];
}

void __32__SASRemoteRequestManager__init__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __32__SASRemoteRequestManager__init__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = (void *)WeakRetained[3];
    if (v13) {
      [v13 invalidateIntentDelivery];
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F302C0]) initWithBundleIdentifier:v8 intentForwardingAction:v7];
    v15 = (void *)v12[3];
    v12[3] = v14;

    id v16 = (void *)v12[3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__SASRemoteRequestManager__init__block_invoke_8;
    v17[3] = &unk_1E6B680F8;
    objc_copyWeak(&v19, v10);
    id v18 = v9;
    [v16 deliverIntentForwardingActionWithResponseHandler:v17];

    objc_destroyWeak(&v19);
  }
}

void __32__SASRemoteRequestManager__init__block_invoke_8(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __32__SASRemoteRequestManager__init__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 source] == 4)
  {
    id v3 = [v2 deviceID];
    [v2 timestamp];
    AFMachAbsoluteTimeGetTimeInterval();
    double v5 = v4;
    if ([v2 event] == 9)
    {
      uint64_t v6 = +[SiriActivationService service];
      [v6 buttonUpFromButtonIdentifier:8 deviceIdentifier:v3 timestamp:0 context:v5];
    }
  }
  else
  {
    id v7 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __32__SASRemoteRequestManager__init__block_invoke_9_cold_1(v7, v2);
    }
  }
}

void __32__SASRemoteRequestManager__init__block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  double v5 = a3;
  if ([v4 source] == 12)
  {
    uint64_t v6 = objc_alloc_init(SiriRemotePresentationBringUpContext);
    id v7 = +[SiriActivationService service];
    [v7 activationRequestFromRemotePresentationBringUpWithContext:v6];

    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    id v8 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __32__SASRemoteRequestManager__init__block_invoke_86_cold_1(v8, v4);
    }
    uint64_t v6 = (SiriRemotePresentationBringUpContext *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.siri.activation" code:5 userInfo:&unk_1F337CE30];
    ((void (**)(id, SiriRemotePresentationBringUpContext *))v5)[2](v5, v6);
  }
}

- (SASRemoteRequestManager)init
{
  return 0;
}

+ (SASRemoteRequestManager)new
{
  return 0;
}

- (void)_handleRemotePrewarmWithInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[SASRemoteRequestManager _handleRemotePrewarmWithInfo:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s info=%@", (uint8_t *)&v14, 0x16u);
  }
  if ([(SASRemoteRequestManager *)self _requestWatcherVoiceActivationEnabled])
  {
    id v7 = [v4 speechRequestOptions];
    uint64_t v8 = [v7 activationEvent];

    if (v8 == 8)
    {
      [(SASRemoteRequestManager *)self _startFetchingPocketStateUpdates];
      if (AFDeviceSupportsAOP())
      {
        [(SASRemoteRequestManager *)self setCurrentVoiceTriggerRestriction:1];
        [(SASRemoteRequestManager *)self setPendingVoiceTriggerRestrictionCount:[(SASRemoteRequestManager *)self pendingVoiceTriggerRestrictionCount]+ 1];
        id v9 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315138;
          v15 = "-[SASRemoteRequestManager _handleRemotePrewarmWithInfo:]";
          _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s scheduling pending activation timer to give pocket detect time", (uint8_t *)&v14, 0xCu);
        }
        [(SASRemoteRequestManager *)self _processPendingVoiceTriggerActivationsWithInfo:v4 delay:0.35];
      }
      id v10 = +[SiriActivationService service];
      [v10 updatePredicatedRecordRoute];
    }
  }
  v11 = [v4 speechRequestOptions];
  uint64_t v12 = [v11 activationEvent];

  if (v12 == 31)
  {
    uint64_t v13 = +[SiriActivationService service];
    [v13 updatePredicatedRecordRoute];
  }
}

- (void)_handleNewRemoteRequestWithInfo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[SASRemoteRequestManager _handleNewRemoteRequestWithInfo:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s info=%@", buf, 0x16u);
  }
  id v7 = [v4 speechRequestOptions];
  uint64_t v8 = [v7 activationEvent];

  if (v8 != 31 && v8 != 8)
  {
    if ([v4 activationEvent] == 8)
    {
      if (objc_opt_respondsToSelector())
      {
        id v9 = [v4 performSelector:sel_text];
        if (!v4) {
          goto LABEL_16;
        }
      }
      else
      {
        id v9 = 0;
        if (!v4) {
          goto LABEL_16;
        }
      }
      if (![(SiriMagusContext *)v9 length]
        || (uint64_t v13 = [SiriTestingContext alloc],
            id v17 = v9,
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1],
            int v14 = objc_claimAutoreleasedReturnValue(),
            uint64_t v12 = [(SiriTestingContext *)v13 initWithRequestInfo:v4 recognitionStrings:v14 siriContextOverride:0], v14, !v12))
      {
LABEL_16:
        __int16 v16 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
          -[SASRemoteRequestManager _handleNewRemoteRequestWithInfo:](v16);
        }
        goto LABEL_23;
      }
      v15 = +[SiriActivationService service];
      [v15 activationRequestFromTestingWithContext:v12];
    }
    else
    {
      switch(v8)
      {
        case 27:
          id v10 = [SiriHearstLongPressButtonContext alloc];
          v11 = [v4 speechRequestOptions];
          id v9 = [(SiriHearstLongPressButtonContext *)v10 initWithSpeechRequestOptions:v11];

          uint64_t v12 = +[SiriActivationService service];
          [(SiriTestingContext *)v12 buttonLongPressFromButtonIdentifier:8 context:v9];
          break;
        case 30:
          id v9 = [(SiriContinuityContext *)[SiriMagusContext alloc] initWithRequestInfo:v4];
          uint64_t v12 = +[SiriActivationService service];
          [(SiriTestingContext *)v12 activationRequestFromContinuousConversationWithContext:v9];
          break;
        case 34:
          id v9 = [(SiriContinuityContext *)[SiriMagusContext alloc] initWithRequestInfo:v4];
          uint64_t v12 = +[SiriActivationService service];
          [(SiriTestingContext *)v12 activationRequestFromContinuousConversationHearstWithContext:v9];
          break;
        case 35:
          id v9 = [(SiriContinuityContext *)[SiriMagusContext alloc] initWithRequestInfo:v4];
          uint64_t v12 = +[SiriActivationService service];
          [(SiriTestingContext *)v12 activationRequestFromContinuousConversationJarvisWithContext:v9];
          break;
        default:
          id v9 = [[SiriContinuityContext alloc] initWithRequestInfo:v4];
          uint64_t v12 = +[SiriActivationService service];
          [(SiriTestingContext *)v12 activationRequestFromContinuityWithContext:v9];
          break;
      }
    }

LABEL_23:
    goto LABEL_24;
  }
  [(SASRemoteRequestManager *)self _handleRequestWatcherVoiceTriggerRequestWithInfo:v4];
LABEL_24:
}

- (void)_handleRequestWatcherVoiceTriggerRequestWithInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SASRemoteRequestManager *)self _requestWatcherVoiceActivationEnabled])
  {
    unint64_t currentVoiceTriggerRestriction = self->_currentVoiceTriggerRestriction;
    if (currentVoiceTriggerRestriction)
    {
      if (currentVoiceTriggerRestriction == 2)
      {
        id v10 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = "-[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:]";
          _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger activation request, but currently blocking VoiceTrigger activations", (uint8_t *)&v11, 0xCu);
        }
      }
      else if (currentVoiceTriggerRestriction == 1)
      {
        uint64_t v6 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = "-[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:]";
          _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger activation request, already pending for possible future activation", (uint8_t *)&v11, 0xCu);
        }
        [(SASRemoteRequestManager *)self setHasPendingVoiceTriggerActivation:1];
        [(SASRemoteRequestManager *)self setPendingVoiceTriggerActivationInfo:v4];
      }
    }
    else
    {
      id v7 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        uint64_t v12 = "-[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:]";
        _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger activation request, no restrictions, activating", (uint8_t *)&v11, 0xCu);
      }
      uint64_t v8 = [(SiriContinuityContext *)[SiriVoiceTriggerContext alloc] initWithRequestInfo:v4];
      id v9 = +[SiriActivationService service];
      [v9 activationRequestFromVoiceTriggerWithContext:v8];
    }
  }
}

- (void)_processPendingVoiceTriggerActivationsWithInfo:(id)a3 delay:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SASRemoteRequestManager__processPendingVoiceTriggerActivationsWithInfo_delay___block_invoke;
  block[3] = &unk_1E6B676F8;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__SASRemoteRequestManager__processPendingVoiceTriggerActivationsWithInfo_delay___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained currentVoiceTriggerRestriction];

  if (v6 != 2)
  {
    id v7 = objc_loadWeakRetained(v4);
    [v7 setCurrentVoiceTriggerRestriction:0];

    id v8 = (id)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained(v4);
      uint64_t v10 = [v9 pendingVoiceTriggerRestrictionCount];
      if (v10)
      {
        id v11 = NSString;
        uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
        id v1 = objc_loadWeakRetained(v4);
        id v2 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v1, "pendingVoiceTriggerRestrictionCount"));
        uint64_t v13 = [v11 stringWithFormat:@"with %@ pending activations", v2];
      }
      else
      {
        uint64_t v13 = @"no pending activations";
      }
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[SASRemoteRequestManager _processPendingVoiceTriggerActivationsWithInfo:delay:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s pending voice trigger activation timer fired, %@", buf, 0x16u);
      if (v10)
      {
      }
    }

    id v14 = objc_loadWeakRetained(v4);
    [v14 _handlePendingVoiceTriggerActivationsWithInfo:*(void *)(a1 + 32)];
  }
}

- (void)_handleRemoteRequestDismissalWithReason:(int64_t)a3 options:(unint64_t)a4 analyticsContext:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v10 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    uint64_t v12 = AFSiriDeactivationReasonGetName();
    uint64_t v13 = AFSiriDeactivationOptionsGetNames();
    int v25 = 136315906;
    v26 = "-[SASRemoteRequestManager _handleRemoteRequestDismissalWithReason:options:analyticsContext:]";
    __int16 v27 = 2112;
    v28 = v12;
    __int16 v29 = 2112;
    v30 = v13;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling remote request dismissal, reason=%@, options=%@, analyticsContext=%@", (uint8_t *)&v25, 0x2Au);
  }
  if (v8)
  {
    id v14 = [v8 objectForKey:@"inSpokenNotification"];
    int v15 = [v14 BOOLValue];

    if (a3 == 2)
    {
      if (v15)
      {
        __int16 v16 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
        [v16 logEventWithType:6007 context:0];

        unint64_t v17 = [(SASRemoteRequestManager *)self _dismissalReasonForDeactivationReason:2];
LABEL_10:
        uint64_t CancellationReason = SASDismissalReasonGetCancellationReason(v17);
        goto LABEL_12;
      }
    }
  }
  unint64_t v17 = [(SASRemoteRequestManager *)self _dismissalReasonForDeactivationReason:a3];
  if (a3 != 3) {
    goto LABEL_10;
  }
  os_log_t v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    uint64_t CancellationReason = 5;
    id v21 = AFRequestCancellationReasonGetName();
    uint64_t v22 = AFSiriDeactivationReasonGetName();
    int v25 = 136315650;
    v26 = "-[SASRemoteRequestManager _handleRemoteRequestDismissalWithReason:options:analyticsContext:]";
    __int16 v27 = 2112;
    v28 = v21;
    __int16 v29 = 2112;
    v30 = v22;
    _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #cancellationReason: Setting cancellationReason to %@ because deactivationReason is %@", (uint8_t *)&v25, 0x20u);
  }
  else
  {
    uint64_t CancellationReason = 5;
  }
LABEL_12:
  id v23 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:a4 animated:1 requestCancellationReason:CancellationReason dismissalReason:v17];
  v24 = +[SiriActivationService service];
  [v24 dismissSiriWithOptions:v23];
}

- (void)_handlePendingVoiceTriggerActivationsWithInfo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t pendingVoiceTriggerRestrictionCount = self->_pendingVoiceTriggerRestrictionCount;
    BOOL hasPendingVoiceTriggerActivation = self->_hasPendingVoiceTriggerActivation;
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "-[SASRemoteRequestManager _handlePendingVoiceTriggerActivationsWithInfo:]";
    __int16 v21 = 2048;
    unint64_t v22 = pendingVoiceTriggerRestrictionCount;
    __int16 v23 = 1024;
    LODWORD(v24) = hasPendingVoiceTriggerActivation;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s PendingCount:%tu, hasPendingTrigger:%i", buf, 0x1Cu);
  }
  if ([(SASRemoteRequestManager *)self pendingVoiceTriggerRestrictionCount]) {
    [(SASRemoteRequestManager *)self setPendingVoiceTriggerRestrictionCount:[(SASRemoteRequestManager *)self pendingVoiceTriggerRestrictionCount] - 1];
  }
  if (![(SASRemoteRequestManager *)self pendingVoiceTriggerRestrictionCount]
    && [(SASRemoteRequestManager *)self hasPendingVoiceTriggerActivation])
  {
    id v9 = v4;
    uint64_t v10 = [(SASRemoteRequestManager *)self pendingVoiceTriggerActivationInfo];

    if (v10)
    {
      os_log_t v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        uint64_t v13 = [(SASRemoteRequestManager *)self pendingVoiceTriggerActivationInfo];
        *(_DWORD *)buf = 136315650;
        __int16 v20 = "-[SASRemoteRequestManager _handlePendingVoiceTriggerActivationsWithInfo:]";
        __int16 v21 = 2112;
        unint64_t v22 = (unint64_t)v9;
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s replacing prewarm AFRequestInfo %@ with newer pending activation AFRequestInfo %@", buf, 0x20u);
      }
      uint64_t v14 = [(SASRemoteRequestManager *)self pendingVoiceTriggerActivationInfo];

      id v9 = (id)v14;
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__SASRemoteRequestManager__handlePendingVoiceTriggerActivationsWithInfo___block_invoke;
    v16[3] = &unk_1E6B68188;
    id v17 = v9;
    id v15 = v9;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_async(MEMORY[0x1E4F14428], v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
  }
}

void __73__SASRemoteRequestManager__handlePendingVoiceTriggerActivationsWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[SASRemoteRequestManager _handlePendingVoiceTriggerActivationsWithInfo:]_block_invoke";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s count is zero after being decremented, activating from pending", (uint8_t *)&v9, 0xCu);
  }
  id v3 = [(SiriContinuityContext *)[SiriVoiceTriggerContext alloc] initWithRequestInfo:*(void *)(a1 + 32)];
  id v4 = +[SiriActivationService service];
  [v4 activationRequestFromVoiceTriggerWithContext:v3];

  double v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setPendingVoiceTriggerRestrictionCount:0];

  id v7 = objc_loadWeakRetained(v5);
  [v7 setHasPendingVoiceTriggerActivation:0];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setPendingVoiceTriggerActivationInfo:0];
}

- (void)_startFetchingPocketStateUpdates
{
  id v2 = +[SASSiriPocketStateManager sharedManager];
  [v2 queryForPocketStateWithCompletion:0];
}

- (BOOL)_requestWatcherVoiceActivationEnabled
{
  return 1;
}

- (int64_t)_dismissalReasonForDeactivationReason:(int64_t)a3
{
  if ((unint64_t)a3 < 0x15) {
    return qword_1D95D8328[a3];
  }
  id v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SASRemoteRequestManager _dismissalReasonForDeactivationReason:](v4);
  }
  return 0;
}

- (AFRemoteRequestWatcher)remoteRequestWatcher
{
  return self->_remoteRequestWatcher;
}

- (void)setRemoteRequestWatcher:(id)a3
{
}

- (INAppIntentDeliverer)currentAppIntentDeliverer
{
  return self->_currentAppIntentDeliverer;
}

- (void)setCurrentAppIntentDeliverer:(id)a3
{
}

- (unint64_t)currentVoiceTriggerRestriction
{
  return self->_currentVoiceTriggerRestriction;
}

- (void)setCurrentVoiceTriggerRestriction:(unint64_t)a3
{
  self->_unint64_t currentVoiceTriggerRestriction = a3;
}

- (unint64_t)pendingVoiceTriggerRestrictionCount
{
  return self->_pendingVoiceTriggerRestrictionCount;
}

- (void)setPendingVoiceTriggerRestrictionCount:(unint64_t)a3
{
  self->_unint64_t pendingVoiceTriggerRestrictionCount = a3;
}

- (BOOL)hasPendingVoiceTriggerActivation
{
  return self->_hasPendingVoiceTriggerActivation;
}

- (void)setHasPendingVoiceTriggerActivation:(BOOL)a3
{
  self->_BOOL hasPendingVoiceTriggerActivation = a3;
}

- (AFRequestInfo)pendingVoiceTriggerActivationInfo
{
  return self->_pendingVoiceTriggerActivationInfo;
}

- (void)setPendingVoiceTriggerActivationInfo:(id)a3
{
}

- (CMPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
}

- (int64_t)currentPocketState
{
  return self->_currentPocketState;
}

- (void)setCurrentPocketState:(int64_t)a3
{
  self->_currentPocketState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_pendingVoiceTriggerActivationInfo, 0);
  objc_storeStrong((id *)&self->_currentAppIntentDeliverer, 0);
  objc_storeStrong((id *)&self->_remoteRequestWatcher, 0);
}

void __32__SASRemoteRequestManager__init__block_invoke_9_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 event];
  [a2 source];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1D9588000, v4, v5, "%s Unsupported button event: %li from source: %li", v6, v7, v8, v9, 2u);
}

void __32__SASRemoteRequestManager__init__block_invoke_86_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 event];
  [a2 source];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1D9588000, v4, v5, "%s Unsupported button event: %li from source: %li", v6, v7, v8, v9, 2u);
}

- (void)_handleNewRemoteRequestWithInfo:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[SASRemoteRequestManager _handleNewRemoteRequestWithInfo:]";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s TestAutomation activationEvent does not contain recognition text or speech file paths.", (uint8_t *)&v1, 0xCu);
}

- (void)_dismissalReasonForDeactivationReason:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = a1;
  id v2 = AFSiriDeactivationReasonGetName();
  int v3 = 136315394;
  uint64_t v4 = "-[SASRemoteRequestManager _dismissalReasonForDeactivationReason:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D9588000, v1, OS_LOG_TYPE_ERROR, "%s Unhandled deactivation reason: %@", (uint8_t *)&v3, 0x16u);
}

@end