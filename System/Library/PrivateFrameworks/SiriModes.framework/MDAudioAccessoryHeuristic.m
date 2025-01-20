@interface MDAudioAccessoryHeuristic
- (BOOL)isConnectedToAudioAccessory;
- (MDAudioAccessoryHeuristic)init;
- (id)determineCurrentMode;
- (void)_connectedOutputDevicesDidChange:(id)a3;
- (void)_fetchConnectedAudioAccessoryState;
@end

@implementation MDAudioAccessoryHeuristic

- (MDAudioAccessoryHeuristic)init
{
  v8.receiver = self;
  v8.super_class = (Class)MDAudioAccessoryHeuristic;
  v2 = [(MDAudioAccessoryHeuristic *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFA7B8] sharedSystemAudioContext];
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v3;

    [(MDAudioAccessoryHeuristic *)v2 _fetchConnectedAudioAccessoryState];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__connectedOutputDevicesDidChange_ name:*MEMORY[0x263EF9FA0] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel__connectedOutputDevicesDidChange_ name:*MEMORY[0x263EF9FA8] object:0];
  }
  return v2;
}

- (id)determineCurrentMode
{
  if ([(MDAudioAccessoryHeuristic *)self isConnectedToAudioAccessory]) {
    v2 = [[MDModeDecision alloc] initWithMode:0];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (BOOL)isConnectedToAudioAccessory
{
  return self->_connectedToAudioAccessory;
}

- (void)_fetchConnectedAudioAccessoryState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AVOutputContext *)self->_sharedSystemAudioContext outputDevices];
  self->_connectedToAudioAccessory = 0;
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "deviceType", (void)v12);
        if (v9 <= 4 && ((1 << v9) & 0x13) != 0)
        {
          self->_connectedToAudioAccessory = 1;
          if (v9 <= 4 && ((1 << v9) & 0x13) != 0) {
            break;
          }
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__MDAudioAccessoryHeuristic__connectedOutputDevicesDidChange___block_invoke;
  v3[3] = &unk_2645BABE8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__MDAudioAccessoryHeuristic__connectedOutputDevicesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[MDAudioAccessoryHeuristic _connectedOutputDevicesDidChange:]_block_invoke";
    _os_log_impl(&dword_22161A000, v2, OS_LOG_TYPE_DEFAULT, "%s #modes: output devices changed, re-fetching connected audio accessory state", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchConnectedAudioAccessoryState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeDecisionBasedOnAudioAccessory, 0);
  objc_storeStrong((id *)&self->_sharedSystemAudioContext, 0);

  objc_storeStrong((id *)&self->_connectedOutputDevicesObserver, 0);
}

@end