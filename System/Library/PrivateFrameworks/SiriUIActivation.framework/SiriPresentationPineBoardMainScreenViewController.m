@interface SiriPresentationPineBoardMainScreenViewController
- (AFClientLite)clientLite;
- (BOOL)_getValueForShouldRequestDictation;
- (BOOL)_shouldShowSetupViewController;
- (SiriPresentationPineBoardMainScreenViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4;
- (double)_buttonDownTimestamp;
- (double)_thresholdForTriggeringABCInLaunch;
- (id)siriViewController:(id)a3 willStartRequestWithOptions:(id)a4;
- (void)_forwardHIDButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 type:(int64_t)a5 senderID:(unint64_t)a6;
- (void)_prewarmFlamesWithPresentationFrame:(CGRect)a3;
- (void)_prewarmSiriVideoFlowDelegatePlugin;
- (void)_setButtonDownTimestamp:(double)a3;
- (void)setClientLite:(id)a3;
- (void)setNextAssistantRecognitionStrings:(id)a3;
- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3;
- (void)siriViewController:(id)a3 didChangePresentationPeekMode:(unint64_t)a4;
- (void)siriViewController:(id)a3 didChangePresentationVisualState:(unint64_t)a4;
- (void)siriViewController:(id)a3 didReceiveButtonUpWithRequestOptions:(id)a4;
- (void)siriViewController:(id)a3 sceneDidActivateWithIdentifier:(id)a4;
- (void)siriViewControllerDidChangeToListeningMode:(id)a3;
- (void)siriViewControllerDidDeactivateScene:(id)a3;
- (void)siriViewControllerDidPresentKeyboard:(id)a3;
@end

@implementation SiriPresentationPineBoardMainScreenViewController

- (SiriPresentationPineBoardMainScreenViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SiriPresentationPineBoardMainScreenViewController;
  v8 = -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](&v11, sel_initWithIdentifier_hostedPresentationFrame_, a3);
  v9 = v8;
  if (v8)
  {
    -[SiriPresentationPineBoardMainScreenViewController _prewarmFlamesWithPresentationFrame:](v8, "_prewarmFlamesWithPresentationFrame:", x, y, width, height);
    v9->_shouldRequestDictation = 0;
    v9->_didRequestDictationStart = 0;
    v9->_shouldListenForSceneActivation = 0;
  }
  return v9;
}

- (void)_prewarmSiriVideoFlowDelegatePlugin
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin]";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation  _prewarmSiriVideoFlowDelegatePlugin", (uint8_t *)&v10, 0xCu);
  }
  clientLite = self->_clientLite;
  self->_clientLite = 0;

  v5 = (AFClientLite *)objc_alloc_init(MEMORY[0x263F28460]);
  v6 = self->_clientLite;
  self->_clientLite = v5;

  v7 = (void *)[objc_alloc(MEMORY[0x263F64A38]) initWithBundleIdentifier:@"com.apple.siri.VideoFlowDelegatePlugin"];
  v8 = [MEMORY[0x263F08C38] UUID];
  v9 = [v8 UUIDString];
  [v7 setAceId:v9];

  [(AFClientLite *)self->_clientLite handleCommand:v7 commandHandler:0 completion:&__block_literal_global_0];
}

void __88__SiriPresentationPineBoardMainScreenViewController__prewarmSiriVideoFlowDelegatePlugin__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v4 || !a2)
  {
    if (v6)
    {
      int v10 = 136315394;
      objc_super v11 = "-[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v4;
      v7 = "%s #activation _prewarmSiriVideoFlowDelegatePlugin failed with error: %@";
      v8 = v5;
      uint32_t v9 = 22;
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    int v10 = 136315138;
    objc_super v11 = "-[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin]_block_invoke";
    v7 = "%s #activation _prewarmSiriVideoFlowDelegatePlugin successful";
    v8 = v5;
    uint32_t v9 = 12;
LABEL_7:
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
  }
}

- (void)_prewarmFlamesWithPresentationFrame:(CGRect)a3
{
}

uint64_t __89__SiriPresentationPineBoardMainScreenViewController__prewarmFlamesWithPresentationFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prewarmMetalLayers];
}

- (BOOL)_shouldShowSetupViewController
{
  return 0;
}

- (void)siriViewController:(id)a3 didChangePresentationPeekMode:(unint64_t)a4
{
  BOOL v6 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  int v7 = [(id)objc_opt_class() conformsToProtocol:&unk_26D3C13D0];

  if (v7)
  {
    id v8 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
    [v8 siriPresentation:self didChangePresentationPeekMode:a4];
  }
}

- (void)siriViewController:(id)a3 didChangePresentationVisualState:(unint64_t)a4
{
  id v6 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 siriPresentation:self didChangePresentationVisualState:a4];
  }
}

- (id)siriViewController:(id)a3 willStartRequestWithOptions:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  uint32_t v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v7;
    _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  id v10 = v7;
  [v10 setUseAutomaticEndpointing:0];
  [v10 setUseStreamingDictation:1];
  objc_super v11 = [v10 requestInfo];
  if (objc_msgSend(v11, "afui_isRemoteHeadsetActivation"))
  {
  }
  else
  {
    char v12 = objc_msgSend(v10, "afui_isTVFollowUpHearstActivation");

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
  }
  id v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #tv Automatic endpointing for hearst request and server command in multi-turn", buf, 0xCu);
  }
  [v10 setUseAutomaticEndpointing:1];
LABEL_9:
  [v10 setReleaseAudioSessionOnRecordingCompletion:1];
  uint64_t v14 = [(SiriPresentationViewController *)self _updateRequestOptionsWithTestingInput:v10];

  v15 = [v14 activationDeviceIdentifier];
  os_log_t v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)MEMORY[0x263F08B88];
    v18 = v16;
    v19 = [v17 currentThread];
    uint64_t v20 = [v19 qualityOfService];
    *(_DWORD *)buf = 136315394;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    __int16 v46 = 2048;
    uint64_t v47 = v20;
    _os_log_impl(&dword_221664000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  v21 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    _os_log_impl(&dword_221664000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", buf, 0xCu);
  }
  uint64_t v22 = [v14 inputType];
  uint64_t v23 = ([v14 isShortButtonPressAction] & 1) == 0
     && [v14 requestSource] != 35
     && [v14 requestSource] != 23
     && [v15 length] != 0;
  self->_shouldRequestDictation = v22 == v23;
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  v24 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    _os_log_impl(&dword_221664000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", buf, 0xCu);
  }
  os_log_t v25 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = NSStringFromBOOL();
    *(_DWORD *)buf = 136315394;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v27;
    _os_log_impl(&dword_221664000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation Should start Dictation - %@", buf, 0x16u);
  }
  if (self->_shouldRequestDictation)
  {
    requestDictationFromSiriGroup = self->_requestDictationFromSiriGroup;
    self->_requestDictationFromSiriGroup = 0;

    v29 = (OS_dispatch_group *)dispatch_group_create();
    v30 = self->_requestDictationFromSiriGroup;
    self->_requestDictationFromSiriGroup = v29;

    if ([v14 isInitialBringUp])
    {
      dispatch_group_enter((dispatch_group_t)self->_requestDictationFromSiriGroup);
      os_log_t v31 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)MEMORY[0x263F08B88];
        v33 = v31;
        v34 = [v32 currentThread];
        uint64_t v35 = [v34 qualityOfService];
        *(_DWORD *)buf = 136315394;
        v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
        __int16 v46 = 2048;
        uint64_t v47 = v35;
        _os_log_impl(&dword_221664000, v33, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", buf, 0x16u);
      }
      os_unfair_lock_lock(&self->_dictationInProgressLock);
      v36 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
        _os_log_impl(&dword_221664000, v36, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", buf, 0xCu);
      }
      self->_shouldListenForSceneActivation = 1;
      os_unfair_lock_unlock(&self->_dictationInProgressLock);
      v37 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
        _os_log_impl(&dword_221664000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", buf, 0xCu);
      }
    }
    dispatch_group_enter((dispatch_group_t)self->_requestDictationFromSiriGroup);
    objc_initWeak((id *)buf, self);
    v38 = self->_requestDictationFromSiriGroup;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __100__SiriPresentationPineBoardMainScreenViewController_siriViewController_willStartRequestWithOptions___block_invoke;
    v41[3] = &unk_2645BCE48;
    objc_copyWeak(&v43, (id *)buf);
    id v42 = v15;
    dispatch_group_notify(v38, MEMORY[0x263EF83A0], v41);

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v39 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
      _os_log_impl(&dword_221664000, v39, OS_LOG_TYPE_DEFAULT, "%s #activation sending command to warm up VideoFlowDelegatePlugin", buf, 0xCu);
    }
    [(SiriPresentationPineBoardMainScreenViewController *)self _prewarmSiriVideoFlowDelegatePlugin];
  }

  return v14;
}

void __100__SiriPresentationPineBoardMainScreenViewController_siriViewController_willStartRequestWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (os_log_t *)MEMORY[0x263F28348];
    id v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x263F08B88];
      id v6 = v4;
      id v7 = [v5 currentThread];
      int v11 = 136315394;
      char v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
      __int16 v13 = 2048;
      uint64_t v14 = [v7 qualityOfService];
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v11, 0x16u);
    }
    os_unfair_lock_lock(WeakRetained + 368);
    id v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      char v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
      _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_dictationInProgressLock successfully locked", (uint8_t *)&v11, 0xCu);
    }
    if (BYTE2(WeakRetained[369]._os_unfair_lock_opaque))
    {
      -[os_unfair_lock_s _forwardHIDButtonEventWithUsagePage:usage:type:senderID:](WeakRetained, "_forwardHIDButtonEventWithUsagePage:usage:type:senderID:", 12, 4, 0, [*(id *)(a1 + 32) longLongValue]);
      LOBYTE(WeakRetained[369]._os_unfair_lock_opaque) = 1;
      BYTE2(WeakRetained[369]._os_unfair_lock_opaque) = 0;
      uint32_t v9 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        char v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
        _os_log_impl(&dword_221664000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Forwarded Dictation Start Event to BackBoard", (uint8_t *)&v11, 0xCu);
      }
    }
    os_unfair_lock_unlock(WeakRetained + 368);
    id v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      char v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
      _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_dictationInProgressLock unlocked", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)siriViewController:(id)a3 didReceiveButtonUpWithRequestOptions:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  uint32_t v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)MEMORY[0x263F08B88];
    int v11 = v9;
    char v12 = [v10 currentThread];
    int v19 = 136315394;
    uint64_t v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
    __int16 v21 = 2048;
    uint64_t v22 = [v12 qualityOfService];
    _os_log_impl(&dword_221664000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v19, 0x16u);
  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  __int16 v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
    _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v19, 0xCu);
  }
  BOOL didRequestDictationStart = self->_didRequestDictationStart;
  self->_shouldRequestDictation = 0;
  self->_BOOL didRequestDictationStart = 0;
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  uint64_t v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
    _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", (uint8_t *)&v19, 0xCu);
  }
  if (didRequestDictationStart)
  {
    os_log_t v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      uint64_t v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
      _os_log_impl(&dword_221664000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation Forwarding Dictation stop event to BackBoard", (uint8_t *)&v19, 0xCu);
    }
    v17 = [v7 activationDeviceIdentifier];
    -[SiriPresentationPineBoardMainScreenViewController _forwardHIDButtonEventWithUsagePage:usage:type:senderID:](self, "_forwardHIDButtonEventWithUsagePage:usage:type:senderID:", 12, 4, 1, [v17 longLongValue]);
  }
  requestDictationFromSiriGroup = self->_requestDictationFromSiriGroup;
  self->_requestDictationFromSiriGroup = 0;
}

- (void)siriViewControllerDidPresentKeyboard:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x263F08B88];
    id v8 = v6;
    uint32_t v9 = [v7 currentThread];
    int v14 = 136315394;
    uint64_t v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
    __int16 v16 = 2048;
    uint64_t v17 = [v9 qualityOfService];
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v14, 0x16u);
  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  id v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
    _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v14, 0xCu);
  }
  if (self->_requestDictationFromSiriGroup) {
    BOOL shouldRequestDictation = self->_shouldRequestDictation;
  }
  else {
    BOOL shouldRequestDictation = 0;
  }
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  char v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
    _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", (uint8_t *)&v14, 0xCu);
  }
  if (shouldRequestDictation)
  {
    __int16 v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
      _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation Keyboard Ready to Start Dictation", (uint8_t *)&v14, 0xCu);
    }
    dispatch_group_leave((dispatch_group_t)self->_requestDictationFromSiriGroup);
  }
}

- (void)siriViewController:(id)a3 sceneDidActivateWithIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 siriPresentation:self sceneDidActivateWithIdentifier:v5];
  }
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = (void *)MEMORY[0x263F08B88];
    id v10 = v8;
    int v11 = [v9 currentThread];
    int v16 = 136315394;
    uint64_t v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
    __int16 v18 = 2048;
    uint64_t v19 = [v11 qualityOfService];
    _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v16, 0x16u);
  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  char v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
    _os_log_impl(&dword_221664000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v16, 0xCu);
  }
  if (self->_requestDictationFromSiriGroup && self->_shouldRequestDictation && self->_shouldListenForSceneActivation)
  {
    self->_shouldListenForSceneActivation = 0;
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  int v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
    _os_log_impl(&dword_221664000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", (uint8_t *)&v16, 0xCu);
  }
  if (v13)
  {
    uint64_t v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
      _os_log_impl(&dword_221664000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation Scene Activated & ready to start dictation", (uint8_t *)&v16, 0xCu);
    }
    dispatch_group_leave((dispatch_group_t)self->_requestDictationFromSiriGroup);
  }
}

- (void)siriViewControllerDidDeactivateScene:(id)a3
{
  id v4 = [(SiriPresentationViewController *)self siriPresentationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 siriPresentationDidDeactivateScene:self];
  }
}

- (void)siriViewControllerDidChangeToListeningMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SiriPresentationPineBoardMainScreenViewController *)self _buttonDownTimestamp];
  if (v4 > 0.0)
  {
    CFAbsoluteTimeGetCurrent();
    SiriSystemUpTimeFromCFAbsoluteCurrentTime();
    double v6 = v5 - self->_buttonDownTimestamp;
    id v7 = (os_log_t *)MEMORY[0x263F28348];
    id v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v9 = NSNumber;
      id v10 = v8;
      int v11 = [v9 numberWithDouble:v6];
      int v14 = 136315394;
      uint64_t v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidChangeToListeningMode:]";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_221664000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation Launch time (button.down - listening): %@", (uint8_t *)&v14, 0x16u);
    }
    [(SiriPresentationPineBoardMainScreenViewController *)self _thresholdForTriggeringABCInLaunch];
    if (v6 >= v12)
    {
      int v13 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        uint64_t v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidChangeToListeningMode:]";
        _os_log_impl(&dword_221664000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation Triggering ABC for launch time >= 2.5 seconds", (uint8_t *)&v14, 0xCu);
      }
      [(SiriPresentationViewController *)self _logSignatureWithType:@"tvos_launch_performance" subType:@"tvos_long_launch_time" context:0];
    }
  }
}

- (double)_thresholdForTriggeringABCInLaunch
{
  return 2.5;
}

- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[SiriPresentationPineBoardMainScreenViewController setNextVoiceRecognitionAudioInputPaths:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  [(SiriPresentationViewController *)self _clearAllTestingInputs];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [NSURL fileURLWithPath:*(void *)(*((void *)&v17 + 1) + 8 * v9)];
        id v11 = objc_alloc(MEMORY[0x263F6C748]);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __92__SiriPresentationPineBoardMainScreenViewController_setNextVoiceRecognitionAudioInputPaths___block_invoke;
        v15[3] = &unk_2645BCE70;
        id v16 = v10;
        id v12 = v10;
        int v13 = (void *)[v11 initWithBuilder:v15];
        [(SiriPresentationViewController *)self _enqueueTestInput:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

void __92__SiriPresentationPineBoardMainScreenViewController_setNextVoiceRecognitionAudioInputPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:2];
  [v3 setRecordedSpeechURL:*(void *)(a1 + 32)];
}

- (void)setNextAssistantRecognitionStrings:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[SiriPresentationPineBoardMainScreenViewController setNextAssistantRecognitionStrings:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_221664000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  [(SiriPresentationViewController *)self _clearAllTestingInputs];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x263F6C748]);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __88__SiriPresentationPineBoardMainScreenViewController_setNextAssistantRecognitionStrings___block_invoke;
        v14[3] = &unk_2645BCE70;
        v14[4] = v11;
        int v13 = (void *)[v12 initWithBuilder:v14];
        [(SiriPresentationViewController *)self _enqueueTestInput:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

void __88__SiriPresentationPineBoardMainScreenViewController_setNextAssistantRecognitionStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:1];
  [v3 setText:*(void *)(a1 + 32)];
}

- (void)_forwardHIDButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 type:(int64_t)a5 senderID:(unint64_t)a6
{
  id v8 = [MEMORY[0x263F29820] keyboardFocusEnvironment];
  if ((unint64_t)a5 <= 1)
  {
    mach_absolute_time();
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
    IOHIDEventSetSenderID();
    BKSHIDEventSendToResolvedProcessForDeferringEnvironment();
    CFRelease(KeyboardEvent);
  }
}

- (BOOL)_getValueForShouldRequestDictation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (void *)MEMORY[0x263F08B88];
    id v6 = v4;
    uint64_t v7 = [v5 currentThread];
    int v10 = 136315394;
    uint64_t v11 = "-[SiriPresentationPineBoardMainScreenViewController _getValueForShouldRequestDictation]";
    __int16 v12 = 2048;
    uint64_t v13 = [v7 qualityOfService];
    _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  id v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SiriPresentationPineBoardMainScreenViewController _getValueForShouldRequestDictation]";
    _os_log_impl(&dword_221664000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v10, 0xCu);
  }
  return self->_shouldRequestDictation;
}

- (double)_buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)_setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (AFClientLite)clientLite
{
  return self->_clientLite;
}

- (void)setClientLite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLite, 0);
  objc_storeStrong((id *)&self->_requestDictationFromSiriGroup, 0);
}

@end