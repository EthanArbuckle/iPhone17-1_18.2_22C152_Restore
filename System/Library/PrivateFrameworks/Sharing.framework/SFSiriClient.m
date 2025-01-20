@interface SFSiriClient
- (OS_dispatch_queue)dispatchQueue;
- (SFSiriClient)init;
- (id)invalidationHandler;
- (id)siriDialogHandler;
- (void)_activate;
- (void)_completeAllRequestsWithError:(id)a3;
- (void)_completeRequest:(id)a3 error:(id)a4;
- (void)_deviceSetupEnd;
- (void)_deviceSetupPlayGreetingID:(int)a3 completion:(id)a4;
- (void)_deviceSetupPrepareGreetingFlow:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_invalidate;
- (void)_processQueuedRequests;
- (void)_speakPasscode:(id)a3 instructions:(id)a4 languageCode:(id)a5 voiceName:(id)a6 flags:(unsigned int)a7 completion:(id)a8;
- (void)_speakText:(id)a3 languageCode:(id)a4 flags:(unsigned int)a5 rate:(double)a6 delay:(double)a7 startHandler:(id)a8 completion:(id)a9;
- (void)activate;
- (void)deviceSetupBegin:(unint64_t)a3;
- (void)deviceSetupEnd;
- (void)deviceSetupPlayGreetingID:(int)a3 completion:(id)a4;
- (void)deviceSetupPrepareGreeting:(id)a3;
- (void)invalidate;
- (void)invalidateWithFlags:(unsigned int)a3;
- (void)preWarmDeviceSetupWelcomePhaseWithCompletion:(id)a3;
- (void)sessionService:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5;
- (void)sessionService:(id)a3 willPresentFeedbackWithDialogIdentifier:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSiriDialogHandler:(id)a3;
- (void)speakDeviceSetupWelcomePhaseWithCompletion:(id)a3;
- (void)speakPasscode:(id)a3 instructions:(id)a4 languageCode:(id)a5 voiceName:(id)a6 flags:(unsigned int)a7 completion:(id)a8;
- (void)speakText:(id)a3 completion:(id)a4;
- (void)speakText:(id)a3 flags:(unsigned int)a4 rate:(double)a5 delay:(double)a6 startHandler:(id)a7 completion:(id)a8;
- (void)speakText:(id)a3 languageCode:(id)a4 completion:(id)a5;
- (void)speakText:(id)a3 rate:(double)a4 completion:(id)a5;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError2:(id)a6;
- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error2:(id)a6;
- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error:(id)a6;
- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 withRequest:(id)a4 didReceiveTimingInfo2:(id)a5;
- (void)speechSynthesizer:(id)a3 withRequest:(id)a4 didReceiveTimingInfo:(id)a5;
- (void)startDelayedRequest:(id)a3;
- (void)stopSpeaking;
@end

@implementation SFSiriClient

- (SFSiriClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFSiriClient;
  v2 = [(SFSiriClient *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__SFSiriClient_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__SFSiriClient_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_siriDialogHandler)
  {
    siriServiceManager = self->_siriServiceManager;
    if (!siriServiceManager)
    {
      uint64_t v4 = (SVXClientServiceManager *)objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
      v5 = self->_siriServiceManager;
      self->_siriServiceManager = v4;

      siriServiceManager = self->_siriServiceManager;
    }
    id v6 = [(SVXClientServiceManager *)siriServiceManager sessionService];
    [v6 setDelegate:self];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SFSiriClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFSiriClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SFSiriClient_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E5BBEE88;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__SFSiriClient_invalidateWithFlags___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(_DWORD *)(v2 + 12) = *(_DWORD *)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  return [(id)v2 _invalidate];
}

- (void)_invalidate
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    uint64_t v4 = currentTimer;
    dispatch_source_cancel(v4);
    unsigned int v5 = self->_currentTimer;
    self->_currentTimer = 0;

    NSErrorWithOSStatusF();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(SFSiriClient *)self _completeRequest:self->_currentRequest error:v6];
LABEL_7:
    [(SFSiriClient *)self _completeAllRequestsWithError:v6];
LABEL_8:

    goto LABEL_9;
  }
  if (![(SFSiriRequest *)self->_currentRequest synthesizing])
  {
    currentRequest = self->_currentRequest;
    if ((self->_invalidateFlags & 0x20) == 0)
    {
      if (currentRequest)
      {
        if (gLogCategory_SFSiriClient <= 30
          && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        speechSynthesizer = self->_speechSynthesizer;
        id v16 = 0;
        char v14 = [(VSSpeechSynthesizer *)speechSynthesizer stopSpeakingAtNextBoundary:1 synchronously:0 error:&v16];
        id v6 = v16;
        if ((v14 & 1) == 0
          && gLogCategory_SFSiriClient <= 60
          && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
        {
          id v15 = v6;
          LogPrintF();
        }
        goto LABEL_8;
      }
      goto LABEL_23;
    }
    if (!currentRequest)
    {
LABEL_23:
      NSErrorWithOSStatusF();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_9:
  [(SFSiriClient *)self _deviceSetupEnd];
  id siriDialogHandler = self->_siriDialogHandler;
  self->_id siriDialogHandler = 0;

  v8 = [(SVXClientServiceManager *)self->_siriServiceManager sessionService];
  [v8 setDelegate:0];

  siriServiceManager = self->_siriServiceManager;
  self->_siriServiceManager = 0;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v11 = self->_invalidationHandler;
  }
  else
  {
    id v11 = 0;
  }
  self->_invalidationHandler = 0;
}

- (void)preWarmDeviceSetupWelcomePhaseWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!*(void *)(*(void *)(a1 + 32) + 88))
  {
    id v2 = objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = v2;
  }
  id v5 = objc_alloc((Class)getSVXSystemEventClass[0]());
  id v6 = (void *)[v5 initWithType:1 timestamp:mach_absolute_time()];
  objc_super v7 = [*(id *)(*(void *)(a1 + 32) + 88) activationService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5BBC9C8;
  id v8 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v7 prewarmForSystemEvent:v6 completion:v9];
}

void __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_3;
    block[3] = &unk_1E5BBC658;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)speakDeviceSetupWelcomePhaseWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!*(void *)(*(void *)(a1 + 32) + 88))
  {
    id v2 = objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = v2;
  }
  id v5 = objc_alloc((Class)getSVXSystemEventClass[0]());
  id v6 = (void *)[v5 initWithType:1 timestamp:mach_absolute_time()];
  objc_super v7 = [*(id *)(*(void *)(a1 + 32) + 88) activationService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5BBE0F8;
  id v8 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v7 activateWithSystemEvent:v6 userInfo:0 completion:v9];
}

void __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_3;
    block[3] = &unk_1E5BBC9C8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)speakPasscode:(id)a3 instructions:(id)a4 languageCode:(id)a5 voiceName:(id)a6 flags:(unsigned int)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SFSiriClient_speakPasscode_instructions_languageCode_voiceName_flags_completion___block_invoke;
  block[3] = &unk_1E5BC1CB8;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  unsigned int v31 = a7;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(dispatchQueue, block);
}

uint64_t __83__SFSiriClient_speakPasscode_instructions_languageCode_voiceName_flags_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakPasscode:*(void *)(a1 + 40) instructions:*(void *)(a1 + 48) languageCode:*(void *)(a1 + 56) voiceName:*(void *)(a1 + 64) flags:*(unsigned int *)(a1 + 80) completion:*(void *)(a1 + 72)];
}

- (void)_speakPasscode:(id)a3 instructions:(id)a4 languageCode:(id)a5 voiceName:(id)a6 flags:(unsigned int)a7 completion:(id)a8
{
  uint64_t v55 = *(void *)&a7;
  v54 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v53 = a6;
  id v56 = a8;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    int v15 = IsAppleInternalBuild();
    id v16 = @"*";
    if (v15) {
      id v16 = v54;
    }
    uint64_t v49 = v55;
    v50 = &unk_1A56EB8D0;
    id v47 = v13;
    id v48 = v14;
    v46 = v16;
    LogPrintF();
  }
  if (!self->_speechSynthesizer)
  {
    id v17 = (VSSpeechSynthesizer *)objc_alloc_init((Class)getVSSpeechSynthesizerClass[0]());
    speechSynthesizer = self->_speechSynthesizer;
    self->_speechSynthesizer = v17;

    [(VSSpeechSynthesizer *)self->_speechSynthesizer setDelegate:self];
  }
  if ((v55 & 0x10) == 0 && self->_currentRequest)
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v19 = self->_speechSynthesizer;
    id v57 = 0;
    char v20 = -[VSSpeechSynthesizer stopSpeakingAtNextBoundary:synchronously:error:](v19, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, &v57, v46, v47, v48, v49, v50);
    id v21 = (__CFString *)v57;
    if ((v20 & 1) == 0
      && gLogCategory_SFSiriClient <= 60
      && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      v46 = v21;
      LogPrintF();
    }
  }
  id v22 = (NSString *)v14;
  v51 = v22;
  if (!v22)
  {
    id v22 = self->_languageCode;
    if (!v22)
    {
      softLinkVSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences[0]();
      id v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      languageCode = self->_languageCode;
      self->_languageCode = v23;

      v25 = self->_languageCode;
      if (!v25)
      {
        self->_languageCode = (NSString *)@"en-US";

        v25 = self->_languageCode;
      }
      id v22 = v25;
    }
  }
  uint64_t v26 = 1;
  if ((v55 & 0x80) == 0) {
    uint64_t v26 = 2;
  }
  if ((~v55 & 0xC0) != 0) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 3;
  }
  if (!self->_requests)
  {
    id v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requests = self->_requests;
    self->_requests = v28;
  }
  id v30 = _TtC7Sharing23_SFXPCContainerRegistry;
  if (v13)
  {
    id v31 = objc_alloc_init((Class)getVSSpeechRequestClass[0]());
    [v31 setLanguageCode:v22];
    [v31 setGender:v27];
    [v31 setText:v13];
    [v31 setContextInfo:MEMORY[0x1E4F1CC08]];
    [v31 setVoiceName:v53];
    v32 = objc_alloc_init(SFSiriRequest);
    [(SFSiriRequest *)v32 setFlags:v55];
    [(SFSiriRequest *)v32 setOwner:self];
    [(SFSiriRequest *)v32 setSpeechCompletion:v56];
    [(SFSiriRequest *)v32 setSpeechSynthesisRequest:v31];
    v33 = (void *)[v31 copy];
    [(SFSiriRequest *)v32 setSpeechUtteranceRequest:v33];

    [(NSMutableArray *)self->_requests addObject:v32];
  }
  v52 = v13;
  uint64_t v34 = [(__CFString *)v54 length];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = 0;
    if (v13) {
      double v37 = 0.5;
    }
    else {
      double v37 = 0.0;
    }
    uint64_t v38 = v34 - 1;
    do
    {
      v39 = v30;
      id v40 = objc_alloc_init(((Class (__cdecl *)())v30[42].isa)());
      [v40 setLanguageCode:v22];
      [v40 setGender:v27];
      v41 = -[__CFString substringWithRange:](v54, "substringWithRange:", v36, 1);
      [v40 setText:v41];

      [v40 setContextInfo:MEMORY[0x1E4F1CC08]];
      [v40 setVoiceName:v53];
      v42 = objc_alloc_init(SFSiriRequest);
      v43 = v42;
      if (v36) {
        double v44 = 0.2;
      }
      else {
        double v44 = v37;
      }
      [(SFSiriRequest *)v42 setDelaySecs:v44];
      [(SFSiriRequest *)v43 setFlags:v55];
      [(SFSiriRequest *)v43 setOwner:self];
      [(SFSiriRequest *)v43 setSpeechSynthesisRequest:v40];
      v45 = (void *)[v40 copy];
      [(SFSiriRequest *)v43 setSpeechUtteranceRequest:v45];

      if (v56 && v38 == v36) {
        [(SFSiriRequest *)v43 setSpeechCompletion:v56];
      }
      [(NSMutableArray *)self->_requests addObject:v43];

      ++v36;
      id v30 = v39;
    }
    while (v35 != v36);
  }
  [(SFSiriClient *)self _processQueuedRequests];
}

- (void)speakText:(id)a3 completion:(id)a4
{
}

- (void)speakText:(id)a3 rate:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SFSiriClient_speakText_rate_completion___block_invoke;
  v13[3] = &unk_1E5BC1CE0;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __42__SFSiriClient_speakText_rate_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakText:*(void *)(a1 + 40) languageCode:0 flags:0 rate:0 delay:*(void *)(a1 + 48) startHandler:*(double *)(a1 + 56) completion:0.0];
}

- (void)speakText:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__SFSiriClient_speakText_languageCode_completion___block_invoke;
  v15[3] = &unk_1E5BBCDE0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __50__SFSiriClient_speakText_languageCode_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakText:*(void *)(a1 + 40) languageCode:*(void *)(a1 + 48) flags:0 rate:0 delay:*(void *)(a1 + 56) startHandler:1.0 completion:0.0];
}

- (void)speakText:(id)a3 flags:(unsigned int)a4 rate:(double)a5 delay:(double)a6 startHandler:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFSiriClient_speakText_flags_rate_delay_startHandler_completion___block_invoke;
  block[3] = &unk_1E5BC1D08;
  void block[4] = self;
  id v22 = v14;
  unsigned int v27 = a4;
  double v25 = a5;
  double v26 = a6;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(dispatchQueue, block);
}

uint64_t __67__SFSiriClient_speakText_flags_rate_delay_startHandler_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakText:*(void *)(a1 + 40) languageCode:0 flags:*(unsigned int *)(a1 + 80) rate:*(void *)(a1 + 48) delay:*(void *)(a1 + 56) startHandler:*(double *)(a1 + 64) completion:*(double *)(a1 + 72)];
}

- (void)_speakText:(id)a3 languageCode:(id)a4 flags:(unsigned int)a5 rate:(double)a6 delay:(double)a7 startHandler:(id)a8 completion:(id)a9
{
  uint64_t v13 = *(void *)&a5;
  id v16 = (__CFString *)a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    int v20 = IsAppleInternalBuild();
    id v21 = @"*";
    if (v20) {
      id v21 = v16;
    }
    double v40 = a6;
    double v41 = a7;
    uint64_t v38 = v21;
    id v39 = v17;
    LogPrintF();
  }
  if (self->_speechSynthesizer)
  {
    if ((v13 & 0x10) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    id v22 = (VSSpeechSynthesizer *)objc_alloc_init((Class)getVSSpeechSynthesizerClass[0]());
    speechSynthesizer = self->_speechSynthesizer;
    self->_speechSynthesizer = v22;

    [(VSSpeechSynthesizer *)self->_speechSynthesizer setDelegate:self];
    if ((v13 & 0x10) != 0) {
      goto LABEL_22;
    }
  }
  if (self->_currentRequest)
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v24 = self->_speechSynthesizer;
    id v42 = 0;
    char v25 = -[VSSpeechSynthesizer stopSpeakingAtNextBoundary:synchronously:error:](v24, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, &v42, v38, v39, *(void *)&v40, *(void *)&v41);
    double v26 = (__CFString *)v42;
    if ((v25 & 1) == 0
      && gLogCategory_SFSiriClient <= 60
      && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v38 = v26;
      LogPrintF();
    }
  }
LABEL_22:
  unsigned int v27 = (NSString *)v17;
  id v28 = v27;
  if (!v27)
  {
    id v28 = self->_languageCode;
    if (!v28)
    {
      softLinkVSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences[0]();
      id v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      languageCode = self->_languageCode;
      self->_languageCode = v29;

      id v31 = self->_languageCode;
      if (!v31)
      {
        self->_languageCode = (NSString *)@"en-US";

        id v31 = self->_languageCode;
      }
      id v28 = v31;
    }
  }
  id v32 = objc_alloc_init((Class)getVSSpeechRequestClass[0]());
  [v32 setLanguageCode:v28];
  [v32 setRate:a6];
  [v32 setText:v16];
  [v32 setContextInfo:MEMORY[0x1E4F1CC08]];
  v33 = objc_alloc_init(SFSiriRequest);
  [(SFSiriRequest *)v33 setDelaySecs:a7];
  [(SFSiriRequest *)v33 setFlags:v13];
  [(SFSiriRequest *)v33 setOwner:self];
  [(SFSiriRequest *)v33 setSpeechCompletion:v19];
  [(SFSiriRequest *)v33 setSpeechSynthesisRequest:v32];
  uint64_t v34 = (void *)[v32 copy];
  [(SFSiriRequest *)v33 setSpeechUtteranceRequest:v34];

  [(SFSiriRequest *)v33 setSpeechStartHandler:v18];
  requests = self->_requests;
  if (!requests)
  {
    uint64_t v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v37 = self->_requests;
    self->_requests = v36;

    requests = self->_requests;
  }
  -[NSMutableArray addObject:](requests, "addObject:", v33, v38);
  [(SFSiriClient *)self _processQueuedRequests];
}

- (void)stopSpeaking
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SFSiriClient_stopSpeaking__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__SFSiriClient_stopSpeaking__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = *(void **)(*(void *)(a1 + 32) + 48);
    id v5 = 0;
    char v3 = [v2 stopSpeakingAtNextBoundary:1 synchronously:0 error:&v5];
    id v4 = v5;
    if ((v3 & 1) == 0
      && gLogCategory_SFSiriClient <= 60
      && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_processQueuedRequests
{
  p_currentRequest = (id *)&self->_currentRequest;
  do
  {
    if (*p_currentRequest) {
      break;
    }
    uint64_t v5 = [(NSMutableArray *)self->_requests firstObject];
    if (!v5) {
      break;
    }
    id v6 = (void *)v5;
    [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
    id v7 = [v6 speechSynthesisRequest];
    id v8 = [v6 speechUtteranceRequest];
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      int v9 = IsAppleInternalBuild();
      if (v9)
      {
        id v2 = [v7 text];
        id v10 = v2;
      }
      else
      {
        id v10 = @"*";
      }
      objc_msgSend(v7, "rate", v16, v18);
      id v12 = v11;
      [v6 delaySecs];
      id v18 = v12;
      uint64_t v19 = v13;
      id v16 = v10;
      LogPrintF();
      if (v9) {
    }
      }
    [v6 setStartTicks:mach_absolute_time()];
    [v6 delaySecs];
    if (v14 <= 0.0)
    {
      [(VSSpeechSynthesizer *)self->_speechSynthesizer startSpeakingRequest:v8];
    }
    else
    {
      [v6 setSynthesizing:1];
      [(VSSpeechSynthesizer *)self->_speechSynthesizer startSynthesizingRequest:v7];
    id v15 = };
    if (v15)
    {
      if (gLogCategory_SFSiriClient > 60 || gLogCategory_SFSiriClient == -1 && !_LogCategory_Initialize()) {
        goto LABEL_25;
      }
      if (!IsAppleInternalBuild())
      {
        id v16 = @"*";
        id v18 = v15;
        LogPrintF();
LABEL_25:
        -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v6, v15, v16, v18, v19);
        goto LABEL_26;
      }
      id v17 = [v7 text];
      LogPrintF();

      -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v6, v15, v17, v15, v19);
    }
    else
    {
      objc_storeStrong(p_currentRequest, v6);
    }
LABEL_26:
  }
  while (v15);
}

- (void)_completeAllRequestsWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_requests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_requests removeAllObjects];
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  long long v11 = (SFSiriRequest *)a3;
  id v6 = a4;
  if (self->_currentRequest == v11)
  {
    self->_currentRequest = 0;
  }
  uint64_t v7 = [(SFSiriRequest *)v11 speechStartHandler];

  if (v7)
  {
    uint64_t v8 = [(SFSiriRequest *)v11 speechStartHandler];
    ((void (**)(void, void, id))v8)[2](v8, 0, v6);

    [(SFSiriRequest *)v11 setSpeechStartHandler:0];
  }
  uint64_t v9 = [(SFSiriRequest *)v11 speechCompletion];

  if (v9)
  {
    long long v10 = [(SFSiriRequest *)v11 speechCompletion];
    ((void (**)(void, id))v10)[2](v10, v6);

    [(SFSiriRequest *)v11 setSpeechCompletion:0];
  }
}

- (void)startDelayedRequest:(id)a3
{
  id v7 = a3;
  id v4 = [v7 speechUtteranceRequest];
  if (gLogCategory_SFSiriClient > 30 || gLogCategory_SFSiriClient == -1 && !_LogCategory_Initialize())
  {
    if (v4) {
      goto LABEL_8;
    }
LABEL_13:
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v5 = NSErrorWithOSStatusF();
    goto LABEL_20;
  }
  if (IsAppleInternalBuild())
  {
    id v6 = [v4 text];
    LogPrintF();

    if (v4) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  id v6 = @"*";
  LogPrintF();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v5 = -[VSSpeechSynthesizer startSpeakingRequest:](self->_speechSynthesizer, "startSpeakingRequest:", v4, v6);
  if (!v5) {
    goto LABEL_21;
  }
  if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v7, v5, v5);
    goto LABEL_21;
  }
LABEL_20:
  -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v7, v5, v6);
LABEL_21:
}

- (void)deviceSetupBegin:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SFSiriClient_deviceSetupBegin___block_invoke;
  v4[3] = &unk_1E5BBC910;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __33__SFSiriClient_deviceSetupBegin___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    uint64_t v3 = (*(void *)(a1 + 40) >> 3) & 1;
    id v4 = objc_alloc((Class)getSVXDeviceSetupContextClass[0]());
    uint64_t v5 = [v4 initWithTimestamp:mach_absolute_time() presentsAlternativeFlowWhenStoreAccountIsUnavailable:v3];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;

    id v2 = *(void **)(a1 + 32);
  }
  if (!v2[8])
  {
    id v8 = objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
    uint64_t v9 = *(void *)(a1 + 32);
    long long v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;

    id v2 = *(void **)(a1 + 32);
  }
  if (!v2[9])
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      id v18 = &unk_1A56EB926;
      LogPrintF();
    }
    uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "deviceService", v17, v18);
    uint64_t v12 = *(void *)(a1 + 32);
    long long v13 = *(void **)(v12 + 72);
    *(void *)(v12 + 72) = v11;

    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 72);
    uint64_t v16 = *(void *)(v14 + 56);
    [v15 beginSetupWithContext:v16];
  }
}

- (void)deviceSetupEnd
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SFSiriClient_deviceSetupEnd__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__SFSiriClient_deviceSetupEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deviceSetupEnd];
}

- (void)_deviceSetupEnd
{
  if (self->_siriDeviceSetupService
    && gLogCategory_SFSiriClient <= 30
    && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SVXClientDeviceServicing *)self->_siriDeviceSetupService endSetup];
  siriDeviceSetupService = self->_siriDeviceSetupService;
  self->_siriDeviceSetupService = 0;

  siriDeviceSetupContext = self->_siriDeviceSetupContext;
  self->_siriDeviceSetupContext = 0;

  siriDeviceSetupManager = self->_siriDeviceSetupManager;
  self->_siriDeviceSetupManager = 0;
}

- (void)deviceSetupPrepareGreeting:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[9] && v2[7] && v2[8])
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 72);
    uint64_t v6 = *(void *)(v4 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_2;
    v8[3] = &unk_1E5BC1D30;
    v8[4] = v4;
    id v9 = *(id *)(a1 + 40);
    [v5 prepareForSetupWithContext:v6 completion:v8];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v7);
  }
}

void __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 96);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_3;
  v11[3] = &unk_1E5BBCDE0;
  v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deviceSetupPrepareGreetingFlow:*(void *)(a1 + 40) error:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_deviceSetupPrepareGreetingFlow:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (!v8 || v9)
  {
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v9)
    {
      ((void (**)(void, void, id))v11)[2](v11, 0, v9);
    }
    else
    {
      id v12 = NSErrorWithOSStatusF();
      ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
    }
  }
  else
  {
    id v22 = v10;
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v21 = objc_alloc_init(SFSiriDeviceSetupGreetingDetails);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v8;
    id v13 = [v8 scenes];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          if (objc_msgSend(v18, "sceneID", v20) == 5)
          {
            if (gLogCategory_SFSiriClient <= 30
              && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            objc_storeStrong((id *)&self->_deviceSetupSceneOutro, v18);
          }
          else if (gLogCategory_SFSiriClient <= 30 {
                 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
          }
          {
            uint64_t v20 = [v18 sceneID];
            LogPrintF();
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v19 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v15 = v19;
      }
      while (v19);
    }

    uint64_t v11 = (void (**)(void, void, void))v22;
    (*((void (**)(id, SFSiriDeviceSetupGreetingDetails *, void))v22 + 2))(v22, v21, 0);

    id v9 = 0;
    id v8 = v23;
  }
}

- (void)deviceSetupPlayGreetingID:(int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SFSiriClient_deviceSetupPlayGreetingID_completion___block_invoke;
  block[3] = &unk_1E5BBFC48;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __53__SFSiriClient_deviceSetupPlayGreetingID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deviceSetupPlayGreetingID:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_deviceSetupPlayGreetingID:(int)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_siriDeviceSetupService && self->_siriDeviceSetupContext && self->_siriDeviceSetupManager && a3 == 5)
  {
    uint64_t v7 = self->_deviceSetupSceneOutro;
    if (v7) {
      goto LABEL_8;
    }
    id v8 = objc_alloc_init((Class)getSVXDeviceSetupFlowSceneBuilderClass[0]());
    [v8 setSceneID:5];
    uint64_t v9 = [v8 build];
    if (v9)
    {
      uint64_t v7 = (SVXDeviceSetupFlowScene *)v9;

LABEL_8:
      if (gLogCategory_SFSiriClient <= 30
        && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v11 = objc_alloc((Class)getSVXSystemEventClass[0]());
      id v12 = (void *)[v11 initWithType:7 timestamp:mach_absolute_time() alarm:0 deviceSetupFlowScene:v7];
      id v13 = [(SVXClientServiceManager *)self->_siriDeviceSetupManager activationService];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke;
      v14[3] = &unk_1E5BC1D58;
      int v16 = 5;
      v14[4] = self;
      id v15 = v6;
      [v13 activateWithSystemEvent:v12 userInfo:0 completion:v14];

      goto LABEL_18;
    }
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  id v10 = NSErrorWithOSStatusF();
  if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v6) {
    (*((void (**)(id, void *))v6 + 2))(v6, v10);
  }

LABEL_18:
}

void __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (gLogCategory_SFSiriClient <= 30 {
         && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke_2;
    block[3] = &unk_1E5BBC9C8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    if (IsAppleInternalBuild())
    {
      id v6 = [v5 text];
      LogPrintF();
    }
    else
    {
      LogPrintF();
    }
  }
}

- (void)speechSynthesizer:(id)a3 withRequest:(id)a4 didReceiveTimingInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__SFSiriClient_speechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke;
  v15[3] = &unk_1E5BBD050;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __67__SFSiriClient_speechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechSynthesizer:*(void *)(a1 + 40) withRequest:*(void *)(a1 + 48) didReceiveTimingInfo2:*(void *)(a1 + 56)];
}

- (void)speechSynthesizer:(id)a3 withRequest:(id)a4 didReceiveTimingInfo2:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SFSiriRequest *)self->_currentRequest speechStartHandler];
  if (v9)
  {
    [(SFSiriRequest *)self->_currentRequest setSpeechStartHandler:0];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v35 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v82 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v16 = objc_alloc_init(SFSiriWordTimingInfo);
          [v15 startTime];
          -[SFSiriWordTimingInfo setTimeOffset:](v16, "setTimeOffset:");
          uint64_t v17 = [v15 textRange];
          -[SFSiriWordTimingInfo setTextRange:](v16, "setTextRange:", v17, v18);
          [v39 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v82 count:16];
      }
      while (v12);
    }

    ((void (**)(void, id, void))v9)[2](v9, v39, 0);
    id v36 = v7;
    double v37 = [v7 text];
    unint64_t v19 = [v37 length];
    long long v80 = 0u;
    memset(v81, 0, sizeof(v81));
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    long long v51 = 0u;
    double v44 = &v50;
    char v50 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = v10;
    uint64_t v20 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(obj);
          }
          long long v24 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          unint64_t v26 = objc_msgSend(v24, "textRange", v31, v32, v33, v34);
          unint64_t v27 = v25;
          BOOL v28 = v19 >= v26 && v19 - v26 >= v25;
          uint64_t v29 = @"?";
          if (v28)
          {
            objc_msgSend(v37, "substringWithRange:", v26, v25);
            uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          [v24 startTime];
          uint64_t v34 = v29;
          uint64_t v33 = v30;
          unint64_t v31 = v26;
          unint64_t v32 = v27;
          SNPrintF_Add();
        }
        uint64_t v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16, v26, v27, v33, v29);
      }
      while (v21);
    }

    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      [obj count];
      LogPrintF();
    }

    id v8 = v35;
    id v7 = v36;
  }
  else if (gLogCategory_SFSiriClient <= 30 {
         && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  }
  {
    [v8 count];
    LogPrintF();
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__SFSiriClient_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke;
  block[3] = &unk_1E5BC1D80;
  void block[4] = self;
  id v19 = v11;
  BOOL v22 = a5;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(dispatchQueue, block);
}

uint64_t __97__SFSiriClient_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechSynthesizer:*(void *)(a1 + 40) didFinishSpeakingRequest:*(void *)(a1 + 48) successfully:*(unsigned __int8 *)(a1 + 64) withError2:*(void *)(a1 + 56)];
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError2:(id)a6
{
  BOOL v7 = a5;
  id v28 = a3;
  id v10 = a4;
  id v11 = a6;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    if (IsAppleInternalBuild())
    {
      uint64_t v12 = [v10 text];
      id v13 = (void *)v12;
      id v14 = "no";
      if (v7) {
        id v14 = "yes";
      }
      unint64_t v26 = v14;
      id v27 = v11;
      unint64_t v25 = (__CFString *)v12;
      LogPrintF();
    }
    else
    {
      id v15 = "no";
      if (v7) {
        id v15 = "yes";
      }
      unint64_t v26 = v15;
      id v27 = v11;
      unint64_t v25 = @"*";
      LogPrintF();
    }
  }
  id v16 = [(SFSiriRequest *)self->_currentRequest speechUtteranceRequest];

  if (v16 != v10
    && gLogCategory_SFSiriClient <= 60
    && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v17 = [(SFSiriRequest *)self->_currentRequest speechStartHandler];

  if (v17)
  {
    uint64_t v18 = [(SFSiriRequest *)self->_currentRequest speechStartHandler];
    id v19 = (void (**)(void, void, void))v18;
    if (v11)
    {
      (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v11);
    }
    else
    {
      id v20 = NSErrorWithOSStatusF();
      ((void (**)(void, void, void *))v19)[2](v19, 0, v20);
    }
    [(SFSiriRequest *)self->_currentRequest setSpeechStartHandler:0];
  }
  id v21 = [(SFSiriRequest *)self->_currentRequest speechCompletion];

  if (v21)
  {
    BOOL v22 = [(SFSiriRequest *)self->_currentRequest speechCompletion];
    ((void (**)(void, id))v22)[2](v22, v11);

    [(SFSiriRequest *)self->_currentRequest setSpeechCompletion:0];
  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  if (self->_invalidateCalled)
  {
    long long v24 = NSErrorWithOSStatusF();
    [(SFSiriClient *)self _completeAllRequestsWithError:v24];
  }
  else
  {
    [(SFSiriClient *)self _processQueuedRequests];
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke;
  block[3] = &unk_1E5BBF198;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

uint64_t __88__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechSynthesizer:*(void *)(a1 + 40) didFinishSynthesisRequest:*(void *)(a1 + 48) withInstrumentMetrics:*(void *)(a1 + 56) error2:*(void *)(a1 + 64)];
}

- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error2:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  double v11 = COERCE_DOUBLE(a6);
  id v12 = self->_currentRequest;
  [(SFSiriRequest *)v12 setSynthesizing:0];
  if (v11 == 0.0 && self->_invalidateCalled)
  {
    NSErrorWithOSStatusF();
    double v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  }
  if (v11 != 0.0)
  {
    if (gLogCategory_SFSiriClient > 90 || gLogCategory_SFSiriClient == -1 && !_LogCategory_Initialize())
    {
      if (!v12) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (IsAppleInternalBuild())
    {
      unint64_t v26 = [v9 text];
      double v27 = v11;
      LogPrintF();

      if (!v12) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v26 = @"*";
      double v27 = v11;
      LogPrintF();
      if (!v12)
      {
LABEL_17:
        if (self->_invalidateCalled) {
          [(SFSiriClient *)self _completeAllRequestsWithError:*(void *)&v11];
        }
        goto LABEL_32;
      }
    }
LABEL_16:
    -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v12, *(void *)&v11, v26, *(void *)&v27);
    goto LABEL_17;
  }
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    int v13 = IsAppleInternalBuild();
    if (v13)
    {
      id v14 = [v9 text];
    }
    else
    {
      id v14 = @"*";
    }
    [v10 timeToSpeakLatency];
    double v27 = v15 * 1000.0;
    unint64_t v26 = v14;
    LogPrintF();
    if (v13) {
  }
    }
  [(SFSiriRequest *)v12 delaySecs];
  if (v16 > 0.0)
  {
    [(SFSiriRequest *)v12 delaySecs];
    double v18 = v17;
    mach_absolute_time();
    [(SFSiriRequest *)v12 startTicks];
    UpTicksToSecondsF();
    if (v18 - v19 <= 0.0)
    {
      [(SFSiriClient *)self startDelayedRequest:v12];
    }
    else
    {
      currentTimer = self->_currentTimer;
      if (currentTimer)
      {
        id v21 = currentTimer;
        dispatch_source_cancel(v21);
        id v22 = self->_currentTimer;
        self->_currentTimer = 0;
      }
      id v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      long long v24 = self->_currentTimer;
      self->_currentTimer = v23;

      unint64_t v25 = self->_currentTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __89__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error2___block_invoke;
      handler[3] = &unk_1E5BBBD18;
      handler[4] = self;
      uint64_t v29 = v12;
      dispatch_source_set_event_handler(v25, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_currentTimer);
    }
  }
LABEL_32:
}

uint64_t __89__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error2___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);

  return [v6 startDelayedRequest:v7];
}

- (void)sessionService:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5
{
  id v5 = a3;
  id v6 = v5;
  if (gLogCategory_SFSiriClient <= 30)
  {
    id v8 = v5;
    if (gLogCategory_SFSiriClient != -1 || (int v7 = _LogCategory_Initialize(), v6 = v8, v7))
    {
      LogPrintF();
      id v6 = v8;
    }
  }
}

- (void)sessionService:(id)a3 willPresentFeedbackWithDialogIdentifier:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SFSiriClient_sessionService_willPresentFeedbackWithDialogIdentifier___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __71__SFSiriClient_sessionService_willPresentFeedbackWithDialogIdentifier___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_SFSiriClient <= 30)
  {
    if (gLogCategory_SFSiriClient != -1 || (result = _LogCategory_Initialize(), result)) {
      result = LogPrintF();
    }
  }
  uint64_t v2 = *(void *)(v1 + 40);
  if (!*(unsigned char *)(v2 + 8))
  {
    result = *(void *)(v2 + 112);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)siriDialogHandler
{
  return self->_siriDialogHandler;
}

- (void)setSiriDialogHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_siriDialogHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_siriServiceManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupSceneOutro, 0);
  objc_storeStrong((id *)&self->_siriDeviceSetupService, 0);
  objc_storeStrong((id *)&self->_siriDeviceSetupManager, 0);
  objc_storeStrong((id *)&self->_siriDeviceSetupContext, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);

  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end