@interface VTCoreSpeechKeepAliveHandler
- (BOOL)_coreSpeechDaemonKeepAlived;
- (VTCoreSpeechKeepAliveHandler)init;
- (void)VTSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_disableCoreSpeechDaemonKeepAlive;
- (void)_enableCoreSpeechDaemonKeepAlive;
- (void)_handleSpeakerActivated;
- (void)_handleSpeakerInactivated;
- (void)_voiceTriggerPolicyDisabled;
- (void)_voiceTriggerPolicyEnabled;
- (void)dealloc;
- (void)start;
- (void)voiceTriggerPolicyDidChange:(BOOL)a3;
@end

@implementation VTCoreSpeechKeepAliveHandler

void __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSpeakerActivated];
}

- (void)_handleSpeakerActivated
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Received Speaker Activated Event", v4, 2u);
  }
  self->_speakerStateActivated = 1;
  if (self->_voiceTriggerEnabled) {
    [(VTCoreSpeechKeepAliveHandler *)self _enableCoreSpeechDaemonKeepAlive];
  }
}

- (void).cxx_destruct
{
}

- (void)_disableCoreSpeechDaemonKeepAlive
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(VTCoreSpeechKeepAliveHandler *)self _coreSpeechDaemonKeepAlived])
  {
    v2 = [MEMORY[0x263F08850] defaultManager];
    id v6 = 0;
    int v3 = [v2 removeItemAtPath:@"/var/mobile/Library/VoiceTrigger/KeepAlive" error:&v6];
    id v4 = v6;

    v5 = VTLogContextFacilityVoiceTrigger;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Successfully make CoreSpeechDaemon as Non-KeepAlive", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = @"/var/mobile/Library/VoiceTrigger/KeepAlive";
      _os_log_error_impl(&dword_21844F000, v5, OS_LOG_TYPE_ERROR, "Failed to make CoreSpeechDaemon as Non-KeepAlive : Cannot remove file %{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)_coreSpeechDaemonKeepAlived
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/VoiceTrigger/KeepAlive"];

  return v3;
}

- (void)_enableCoreSpeechDaemonKeepAlive
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(VTCoreSpeechKeepAliveHandler *)self _coreSpeechDaemonKeepAlived]) {
    return;
  }
  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/VoiceTrigger"];

  if (v3) {
    goto LABEL_5;
  }
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v13 = 0;
  int v5 = [v4 createDirectoryAtPath:@"/var/mobile/Library/VoiceTrigger" withIntermediateDirectories:1 attributes:0 error:&v13];
  id v6 = v13;

  if (v5)
  {

LABEL_5:
    v7 = [MEMORY[0x263F08850] defaultManager];
    int v8 = [v7 createFileAtPath:@"/var/mobile/Library/VoiceTrigger/KeepAlive" contents:0 attributes:0];

    uint64_t v9 = VTLogContextFacilityVoiceTrigger;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Successfully make CoreSpeechDaemon as KeepAlive", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = @"/var/mobile/Library/VoiceTrigger/KeepAlive";
      _os_log_error_impl(&dword_21844F000, v9, OS_LOG_TYPE_ERROR, "Failed to make CoreSpeechDaemon as KeepAlive : Cannot create file at %{public}@", buf, 0xCu);
    }
    return;
  }
  v10 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = [v6 localizedDescription];
    *(_DWORD *)buf = 138543618;
    v15 = @"/var/mobile/Library/VoiceTrigger";
    __int16 v16 = 2114;
    v17 = v12;
    _os_log_error_impl(&dword_21844F000, v11, OS_LOG_TYPE_ERROR, "Cannot create directory at : %{public}@ : %{public}@", buf, 0x16u);
  }
}

- (void)VTSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__VTCoreSpeechKeepAliveHandler_VTSiriEnabledMonitor_didReceiveEnabled___block_invoke;
  v5[3] = &unk_264325FC8;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

uint64_t __71__VTCoreSpeechKeepAliveHandler_VTSiriEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = +[VTUtilities isNano];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      return [v3 _enableCoreSpeechDaemonKeepAlive];
    }
    else
    {
      return [v3 _disableCoreSpeechDaemonKeepAlive];
    }
  }
  return result;
}

- (void)_voiceTriggerPolicyDisabled
{
  self->_voiceTriggerEnabled = 0;
  if (!+[VTUtilities isNano])
  {
    [(VTCoreSpeechKeepAliveHandler *)self _disableCoreSpeechDaemonKeepAlive];
  }
}

- (void)_voiceTriggerPolicyEnabled
{
  self->_voiceTriggerEnabled = 1;
  if (+[VTUtilities isNano]
    || !+[VTUtilities VTIsHorseman]
    && !+[VTUtilities supportBargeIn]
    && !+[VTUtilities isAlwaysOn])
  {
    [(VTCoreSpeechKeepAliveHandler *)self _enableCoreSpeechDaemonKeepAlive];
  }
}

- (void)voiceTriggerPolicyDidChange:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__VTCoreSpeechKeepAliveHandler_voiceTriggerPolicyDidChange___block_invoke;
  v4[3] = &unk_264325FC8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __60__VTCoreSpeechKeepAliveHandler_voiceTriggerPolicyDidChange___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 _voiceTriggerPolicyEnabled];
  }
  else {
    return [v2 _voiceTriggerPolicyDisabled];
  }
}

- (void)_handleSpeakerInactivated
{
  char v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Received Speaker Inactivated Event", v4, 2u);
  }
  self->_speakerStateActivated = 0;
  [(VTCoreSpeechKeepAliveHandler *)self _disableCoreSpeechDaemonKeepAlive];
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__VTCoreSpeechKeepAliveHandler_start__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__VTCoreSpeechKeepAliveHandler_start__block_invoke(uint64_t a1)
{
  if (+[VTUtilities isNano])
  {
    v2 = +[VTSiriEnabledMonitor sharedInstance];
    [v2 addObserver:*(void *)(a1 + 32)];

    char v3 = +[VTSiriEnabledMonitor sharedInstance];
    int v4 = [v3 isEnabled];

    BOOL v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 _enableCoreSpeechDaemonKeepAlive];
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 32);
  }
  [v5 _disableCoreSpeechDaemonKeepAlive];
LABEL_6:
  if (+[VTUtilities supportBargeIn])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = (int *)(v6 + 8);
    if (*(_DWORD *)(v6 + 8) == -1)
    {
      int v8 = *(NSObject **)(v6 + 16);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_2;
      handler[3] = &unk_2643257C8;
      objc_copyWeak(&v14, &location);
      notify_register_dispatch("com.apple.coreaudio.speaker.active", v7, v8, handler);
      objc_destroyWeak(&v14);
      uint64_t v6 = *(void *)(a1 + 32);
    }
    uint64_t v9 = (int *)(v6 + 12);
    if (*(_DWORD *)(v6 + 12) == -1)
    {
      v10 = *(NSObject **)(v6 + 16);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_3;
      v11[3] = &unk_2643257C8;
      objc_copyWeak(&v12, &location);
      notify_register_dispatch("com.apple.coreaudio.speaker.inactive", v9, v10, v11);
      objc_destroyWeak(&v12);
    }
    objc_destroyWeak(&location);
  }
}

void __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSpeakerInactivated];
}

- (void)dealloc
{
  int activeNotificationToken = self->_activeNotificationToken;
  if (activeNotificationToken != -1)
  {
    notify_cancel(activeNotificationToken);
    self->_int activeNotificationToken = -1;
  }
  inint activeNotificationToken = self->_inactiveNotificationToken;
  if (inactiveNotificationToken != -1)
  {
    notify_cancel(inactiveNotificationToken);
    self->_inint activeNotificationToken = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)VTCoreSpeechKeepAliveHandler;
  [(VTCoreSpeechKeepAliveHandler *)&v5 dealloc];
}

- (VTCoreSpeechKeepAliveHandler)init
{
  if (+[VTUtilities isExclaveHardware])
  {
    char v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VTCoreSpeechKeepAliveHandler;
    int v4 = [(VTCoreSpeechKeepAliveHandler *)&v8 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("VTCoreSpeechKeepAliveHandler", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

      *(void *)&v4->_int activeNotificationToken = -1;
      *(_WORD *)&v4->_voiceTriggerEnabled = 0;
    }
    self = v4;
    char v3 = self;
  }

  return v3;
}

@end