@interface MRMigrationDevice
+ (id)proactiveDevice;
- (BOOL)isPrepared;
- (BOOL)preparedForAirPlay;
- (MRAVEndpoint)endpoint;
- (MRMigrationDevice)initWithUID:(id)a3;
- (MRMigrationDeviceDelegate)delegate;
- (MRNowPlayingPlayerResponse)playerState;
- (MRQHONowPlayingController)controller;
- (NSError)prepareError;
- (NSString)description;
- (NSString)uid;
- (OS_dispatch_queue)queue;
- (id)dictionaryRepresentation;
- (unint64_t)deviceState;
- (void)_checkIfAirPlayPossible;
- (void)_notifyDelegateOfPlayerStateChange;
- (void)_notifyDelegateOfStateChange;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controllerWillReloadForInvalidation:(id)a3;
- (void)dealloc;
- (void)prepare;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(unint64_t)a3;
- (void)setPrepareError:(id)a3;
- (void)setPreparedForAirPlay:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRMigrationDevice

+ (id)proactiveDevice
{
  v2 = [[MRMigrationDevice alloc] initWithUID:@"proactiveEndpoint"];

  return v2;
}

- (MRMigrationDevice)initWithUID:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRMigrationDevice;
  v5 = [(MRMigrationDevice *)&v14 init];
  if (v5)
  {
    v6 = [[MRQHONowPlayingController alloc] initWithUID:v4];
    controller = v5->_controller;
    v5->_controller = v6;

    [(MRQHONowPlayingController *)v5->_controller setDelegate:v5];
    v5->_preparedForAirPlay = 0;
    v5->_deviceState = 0;
    id v8 = [NSString stringWithFormat:@"com.apple.MediaRemote.MRMigrationDevice:%@|queue", v4];
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MRMigrationDevice *)self uid];
  [v3 setObject:v4 forKeyedSubscript:@"uid"];

  v5 = [(MRMigrationDevice *)self endpoint];
  [v3 setObject:v5 forKeyedSubscript:@"endpoint"];

  v6 = [(MRMigrationDevice *)self playerState];
  v7 = MRMediaRemoteCopyPlaybackStateDescription([v6 playbackState]);
  [v3 setObject:v7 forKeyedSubscript:@"playbackState"];

  id v8 = [(MRMigrationDevice *)self playerState];
  if ([v8 playerHasPlayedRecently]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 setObject:v9 forKeyedSubscript:@"playerHasPlayedRecently"];

  unint64_t v10 = [(MRMigrationDevice *)self deviceState] - 1;
  if (v10 > 2) {
    dispatch_queue_t v11 = @"NotPrepared";
  }
  else {
    dispatch_queue_t v11 = off_1E57D3D98[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"deviceState"];
  if ([(MRMigrationDevice *)self preparedForAirPlay]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 setObject:v12 forKeyedSubscript:@"preparedForAirPlay"];
  v13 = [(MRMigrationDevice *)self prepareError];
  [v3 setObject:v13 forKeyedSubscript:@"prepareError"];

  return v3;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MRMigrationDevice *)self uid];
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRMigrationDevice] [MRMigrationDevice]<%{public}@> Deallocating.", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)MRMigrationDevice;
  [(MRMigrationDevice *)&v5 dealloc];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(MRMigrationDevice *)self dictionaryRepresentation];
  v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)uid
{
  v2 = [(MRMigrationDevice *)self controller];
  id v3 = [v2 uid];

  return (NSString *)v3;
}

- (MRNowPlayingPlayerResponse)playerState
{
  v2 = [(MRMigrationDevice *)self controller];
  id v3 = [v2 response];

  return (MRNowPlayingPlayerResponse *)v3;
}

- (unint64_t)deviceState
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t deviceState = v2->_deviceState;
  objc_sync_exit(v2);

  return deviceState;
}

- (MRAVEndpoint)endpoint
{
  v2 = [(MRMigrationDevice *)self controller];
  id v3 = [v2 endpoint];

  return (MRAVEndpoint *)v3;
}

- (BOOL)preparedForAirPlay
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL preparedForAirPlay = v2->_preparedForAirPlay;
  objc_sync_exit(v2);

  return preparedForAirPlay;
}

- (BOOL)isPrepared
{
  if ([(MRMigrationDevice *)self deviceState] == 2) {
    return 1;
  }

  return [(MRMigrationDevice *)self preparedForAirPlay];
}

- (void)setDeviceState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v5 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MRMigrationDevice *)self uid];
    v7 = (void *)v6;
    unint64_t v8 = self->_deviceState - 1;
    if (v8 > 2) {
      v9 = @"NotPrepared";
    }
    else {
      v9 = off_1E57D3D98[v8];
    }
    if (a3 - 1 > 2) {
      unint64_t v10 = @"NotPrepared";
    }
    else {
      unint64_t v10 = off_1E57D3D98[a3 - 1];
    }
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    objc_super v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRMigrationDevice] <%{public}@> changing state from %@ to %@.", (uint8_t *)&v11, 0x20u);
  }
  self->_unint64_t deviceState = a3;
}

- (void)prepare
{
  v2 = self;
  objc_sync_enter(v2);
  if (![(MRMigrationDevice *)v2 deviceState])
  {
    [(MRMigrationDevice *)v2 setDeviceState:1];
    id v3 = [(MRMigrationDevice *)v2 controller];
    [v3 beginLoadingUpdates];

    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    objc_super v5 = [(MRMigrationDevice *)v2 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__MRMigrationDevice_prepare__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = v2;
    dispatch_after(v4, v5, block);
  }
  objc_sync_exit(v2);
}

void __28__MRMigrationDevice_prepare__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) controller];
  id v3 = [v2 endpoint];

  if (!v3)
  {
    dispatch_time_t v4 = *(void **)(a1 + 32);
    [v4 _checkIfAirPlayPossible];
  }
}

- (void)_checkIfAirPlayPossible
{
  if (![(MRMigrationDevice *)self isPrepared])
  {
    id v3 = [(MRMigrationDevice *)self uid];
    char v4 = [v3 isEqualToString:@"proactiveEndpoint"];

    if ((v4 & 1) == 0)
    {
      objc_super v5 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
      uint64_t v6 = [(MRMigrationDevice *)self uid];
      v7 = [(MRMigrationDevice *)self queue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__MRMigrationDevice__checkIfAirPlayPossible__block_invoke;
      v9[3] = &unk_1E57D3D78;
      unint64_t v10 = v5;
      int v11 = self;
      unint64_t v8 = v5;
      [(MRAVLightweightReconnaissanceSession *)v8 searchForOutputDeviceUID:v6 timeout:@"MRProximityProvider AVOD fallback" reason:v7 queue:v9 completion:7.0];
    }
  }
}

void __44__MRMigrationDevice__checkIfAirPlayPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_sync_enter(v7);
  unint64_t v8 = *(void **)(a1 + 40);
  if (v9)
  {
    [v8 setPreparedForAirPlay:1];
    [*(id *)(a1 + 40) setDeviceState:2];
  }
  else
  {
    [v8 setPreparedForAirPlay:0];
    [*(id *)(a1 + 40) setDeviceState:3];
  }
  objc_sync_exit(v7);

  [*(id *)(a1 + 40) _notifyDelegateOfStateChange];
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(MRMigrationDevice *)v7 setDeviceState:2];
  [(MRMigrationDevice *)v7 setPrepareError:0];
  objc_sync_exit(v7);

  [(MRMigrationDevice *)v7 _notifyDelegateOfStateChange];
  [(MRMigrationDevice *)v7 _notifyDelegateOfPlayerStateChange];
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if ([v6 code] == 42)
  {
    [(MRMigrationDevice *)v7 setDeviceState:2];
  }
  else if (![(MRMigrationDevice *)v7 preparedForAirPlay])
  {
    [(MRMigrationDevice *)v7 _checkIfAirPlayPossible];
  }
  [(MRMigrationDevice *)v7 setPrepareError:v6];
  objc_sync_exit(v7);

  [(MRMigrationDevice *)v7 _notifyDelegateOfStateChange];
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  id v5 = a3;
  if (![(MRMigrationDevice *)self preparedForAirPlay])
  {
    char v4 = self;
    objc_sync_enter(v4);
    [(MRMigrationDevice *)v4 setDeviceState:1];
    objc_sync_exit(v4);

    [(MRMigrationDevice *)v4 _notifyDelegateOfStateChange];
  }
}

- (void)_notifyDelegateOfStateChange
{
  id v3 = [(MRMigrationDevice *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MRMigrationDevice *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MRMigrationDevice__notifyDelegateOfStateChange__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __49__MRMigrationDevice__notifyDelegateOfStateChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "device:stateDidChange:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "deviceState"));
}

- (void)_notifyDelegateOfPlayerStateChange
{
  id v3 = [(MRMigrationDevice *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MRMigrationDevice *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MRMigrationDevice__notifyDelegateOfPlayerStateChange__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __55__MRMigrationDevice__notifyDelegateOfPlayerStateChange__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 playerState];
  [v4 device:v2 playerStateDidChange:v3];
}

- (NSError)prepareError
{
  return self->_prepareError;
}

- (void)setPrepareError:(id)a3
{
}

- (MRMigrationDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRMigrationDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRQHONowPlayingController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setPreparedForAirPlay:(BOOL)a3
{
  self->_BOOL preparedForAirPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_prepareError, 0);
}

@end