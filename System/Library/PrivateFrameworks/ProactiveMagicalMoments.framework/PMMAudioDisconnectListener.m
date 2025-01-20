@interface PMMAudioDisconnectListener
+ (BOOL)bluetoothDeviceTypeIsAudio:(id)a3;
- (PMMAudioDisconnectListener)initWithHandler:(id)a3;
- (void)_setupAudioDisconnectListener;
- (void)_setupBluetoothDisconnectListener;
@end

@implementation PMMAudioDisconnectListener

void __59__PMMAudioDisconnectListener__setupAudioDisconnectListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2247FC000, v5, OS_LOG_TYPE_DEFAULT, "audio disconnect listener called, %@", (uint8_t *)&v7, 0xCu);
  }

  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

+ (BOOL)bluetoothDeviceTypeIsAudio:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  return (v3 < 0x30) & (0x800000FB0008uLL >> v3);
}

- (PMMAudioDisconnectListener)initWithHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)PMMAudioDisconnectListener;
    uint64_t v6 = [(PMMAudioDisconnectListener *)&v12 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      id disconnectHandler = v6->_disconnectHandler;
      v6->_id disconnectHandler = (id)v7;

      [(PMMAudioDisconnectListener *)v6 _setupAudioDisconnectListener];
      [(PMMAudioDisconnectListener *)v6 _setupBluetoothDisconnectListener];
    }
    self = v6;
    uint64_t v9 = self;
  }
  else
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PMMAudioDisconnectListener.m", 61, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_setupAudioDisconnectListener
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__PMMAudioDisconnectListener__setupAudioDisconnectListener__block_invoke;
  v8[3] = &unk_2646DFC98;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x22A618C40](v8);
  unint64_t v3 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "registering for audio disconnect callbacks", v7, 2u);
  }

  v4 = [MEMORY[0x263F351D0] predicateForAudioOutputStatus:0];
  id v5 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.mm.audiodisconnect" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v2];
  uint64_t v6 = +[PMMContextHelper sharedInstance];
  [v6 registerForNotifications:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setupBluetoothDisconnectListener
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__PMMAudioDisconnectListener__setupBluetoothDisconnectListener__block_invoke;
  v8[3] = &unk_2646DFC98;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x22A618C40](v8);
  unint64_t v3 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "registering for bluetooth disconnect callbacks", v7, 2u);
  }

  v4 = [MEMORY[0x263F351D0] predicateForBluetoothConnectionStatus:0];
  id v5 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.duetexpertd.mm.bluetoothdisconnect" contextualPredicate:v4 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v2];
  uint64_t v6 = +[PMMContextHelper sharedInstance];
  [v6 registerForNotifications:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__PMMAudioDisconnectListener__setupBluetoothDisconnectListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_2247FC000, v5, OS_LOG_TYPE_DEFAULT, "bluetooth disconnect listener called, %@", (uint8_t *)&v12, 0xCu);
  }

  if (WeakRetained)
  {
    uint64_t v6 = [MEMORY[0x263F351D0] keyPathForBluetoothDataDictionary];
    uint64_t v7 = +[PMMContextHelper sharedInstance];
    id v8 = [v7 fetchDataDictionaryForKeyPath:v6];

    if (v8)
    {
      id v9 = [MEMORY[0x263F351D0] bluetoothDeviceTypeKey];
      v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        if (+[PMMAudioDisconnectListener bluetoothDeviceTypeIsAudio:v10])
        {
          uint64_t v11 = WeakRetained[1];
          if (v11) {
            (*(void (**)(void))(v11 + 16))();
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end