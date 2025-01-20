@interface TUAudioDeviceController
- (AVAudioClient)audioClient;
- (AVAudioDevice)currentInputDevice;
- (AVAudioDevice)currentOutputDevice;
- (BOOL)isFollowingSystemInputSetting;
- (BOOL)isFollowingSystemOutputSetting;
- (NSArray)devices;
- (NSArray)inputDevices;
- (NSArray)outputDevices;
- (NSHashTable)delegates;
- (NSString)debugDescription;
- (OS_dispatch_queue)serialQueue;
- (TUAudioDeviceController)init;
- (TUAudioDeviceController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4;
- (TUAudioDeviceControllerActions)actionsDelegate;
- (id)registerForMutedTalkerNotificationCallback;
- (void)_handleCallStatusChangedNotification:(id)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)notifyDelegatesOfDeviceListChange;
- (void)removeDelegate:(id)a3;
- (void)setActionsDelegate:(id)a3;
- (void)setAudioClient:(id)a3;
- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentOutputDevice:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setFollowsSystemInputSetting:(BOOL)a3;
- (void)setFollowsSystemOutputSetting:(BOOL)a3;
- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3;
- (void)setRegisterForMutedTalkerNotificationCallback:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation TUAudioDeviceController

- (TUAudioDeviceController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUAudioDeviceController;
  v8 = [(TUAudioDeviceController *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_actionsDelegate, v6);
    objc_storeStrong((id *)&v9->_serialQueue, a4);
    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v9->_delegates;
    v9->_delegates = (NSHashTable *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel__handleCallStatusChangedNotification_ name:@"TUCallCenterCallStatusChangedNotification" object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v9 selector:sel__handleCallStatusChangedNotification_ name:@"TUCallCenterVideoCallStatusChangedNotification" object:0];

    objc_initWeak(&location, v9);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke;
    v17[3] = &unk_1E58E5C50;
    objc_copyWeak(&v18, &location);
    v14 = _Block_copy(v17);
    id registerForMutedTalkerNotificationCallback = v9->_registerForMutedTalkerNotificationCallback;
    v9->_id registerForMutedTalkerNotificationCallback = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUAudioDeviceController *)self delegates];
  [v6 addObject:v4];
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_2;
  block[3] = &unk_1E58E5C50;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  if (AAFMediaTypeXML_block_invoke_once != -1) {
    dispatch_once(&AAFMediaTypeXML_block_invoke_once, block);
  }
  objc_destroyWeak(&v2);
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)CUTWeakLinkClass();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_3;
  v5[3] = &unk_1E58E6990;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v2 registerForMutedTalkerNotifications:v5];
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Registered for registerForMutedTalkerNotification", v4, 2u);
  }

  objc_destroyWeak(&v6);
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained serialQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_4;
    v6[3] = &unk_1E58E6918;
    int v8 = a2;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __63__TUAudioDeviceController_initWithActionsDelegate_serialQueue___block_invoke_4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2 == 1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v3 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
    uint64_t v9 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v3);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 audioDeviceControllerMutedTalkerDidEnd:*(void *)(a1 + 32)];
          }
        }
        uint64_t v10 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    if (v2) {
      return;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v3 = [*(id *)(a1 + 32) delegates];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v5; ++j)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v8 audioDeviceControllerMutedTalkerDidStart:*(void *)(a1 + 32)];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (void)_handleCallStatusChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v12, 0xCu);
  }

  if (_TUIsInternalInstall())
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
    int v7 = [v6 BOOLForKey:@"shouldSuppressMutedTalkerNotification"] ^ 1;
  }
  else
  {
    int v7 = 1;
  }
  int v8 = [v4 object];
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    uint64_t v10 = [v8 provider];
    if (![v10 isSystemProvider])
    {
LABEL_11:

      goto LABEL_12;
    }
    int v11 = [v9 isActive];

    if (v11)
    {
      uint64_t v10 = [(TUAudioDeviceController *)self registerForMutedTalkerNotificationCallback];
      v10[2]();
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)notifyDelegatesOfDeviceListChange
{
  v3 = [(TUAudioDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TUAudioDeviceController_notifyDelegatesOfDeviceListChange__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__TUAudioDeviceController_notifyDelegatesOfDeviceListChange__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Audio devices changed", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 audioDeviceControllerDeviceListChanged:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  [(id)CUTWeakLinkClass() unregisterFromMutedTalkerNotifications];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.facetime.audioInputChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)TUAudioDeviceController;
  [(TUAudioDeviceController *)&v4 dealloc];
}

- (TUAudioDeviceController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUAudioDeviceController.m", 173, @"%s is not available. Use a designated initializer instead.", "-[TUAudioDeviceController init]");

  return 0;
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TUAudioDeviceController *)self devices];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p devices=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Setting mixesVoiceWithMedia: %d", (uint8_t *)v7, 8u);
  }

  uint64_t v6 = [(TUAudioDeviceController *)self audioClient];
  [(id)objc_opt_class() setMixingVoiceWithMediaEnabled:v3];
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Setting mediaPlaybackOnExternalDevice: %d", buf, 8u);
  }

  uint64_t v6 = [(TUAudioDeviceController *)self audioClient];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"kAUVoiceIOProperty_MediaPlaybackOnExternalDevice");
  long long v11 = v8;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 setAudioSessionProperties:v9];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUAudioDeviceController *)self delegates];
  [v6 removeObject:v4];
}

- (AVAudioDevice)currentInputDevice
{
  int v2 = [(TUAudioDeviceController *)self audioClient];
  BOOL v3 = [(id)objc_opt_class() currentInputDevice];

  return (AVAudioDevice *)v3;
}

- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);
}

- (AVAudioDevice)currentOutputDevice
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUAudioDeviceController *)self audioClient];
  uint64_t v5 = [(id)objc_opt_class() currentOutputDevice];

  return (AVAudioDevice *)v5;
}

- (void)setCurrentOutputDevice:(id)a3
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);
}

- (BOOL)isFollowingSystemInputSetting
{
  TUPreferredFaceTimeBundleIdentifier();
  int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = (void *)CFPreferencesCopyValue(@"PreferredAudioInputDeviceUID", v2, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (void)setFollowsSystemInputSetting:(BOOL)a3
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);
}

- (BOOL)isFollowingSystemOutputSetting
{
  TUPreferredFaceTimeBundleIdentifier();
  int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = (void *)CFPreferencesCopyValue(@"PreferredAudioOutputDeviceUID", v2, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (void)setFollowsSystemOutputSetting:(BOOL)a3
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);
}

- (NSArray)devices
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(TUAudioDeviceController *)self audioClient];
  uint64_t v5 = [v4 devices];

  return (NSArray *)v5;
}

- (NSArray)inputDevices
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(TUAudioDeviceController *)self audioClient];
  uint64_t v5 = [v4 inputDevices];

  return (NSArray *)v5;
}

- (NSArray)outputDevices
{
  BOOL v3 = [(TUAudioDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(TUAudioDeviceController *)self audioClient];
  uint64_t v5 = [v4 outputDevices];

  return (NSArray *)v5;
}

- (AVAudioClient)audioClient
{
  return self->_audioClient;
}

- (void)setAudioClient:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setDelegates:(id)a3
{
}

- (TUAudioDeviceControllerActions)actionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);

  return (TUAudioDeviceControllerActions *)WeakRetained;
}

- (void)setActionsDelegate:(id)a3
{
}

- (id)registerForMutedTalkerNotificationCallback
{
  return self->_registerForMutedTalkerNotificationCallback;
}

- (void)setRegisterForMutedTalkerNotificationCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registerForMutedTalkerNotificationCallback, 0);
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_audioClient, 0);
}

@end