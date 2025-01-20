@interface SUAudioPlayer
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (NSURL)URL;
- (NSURL)certificateURL;
- (NSURL)keyURL;
- (SUAudioPlayer)initWithURL:(id)a3;
- (SUPlayerStatus)playerStatus;
- (id)_newFadeInAudioMixForAsset:(id)a3;
- (id)valueForNowPlayingKey:(id)a3;
- (int64_t)storeItemIdentifier;
- (void)_applyNowPlayingInfo;
- (void)_destroyPlayer;
- (void)_destroyPlayerItem;
- (void)_failWithError:(id)a3;
- (void)_handleAssetValuesDidLoad;
- (void)_itemFailedToPlayToEndNotification:(id)a3;
- (void)_itemPlayedToEndNotification:(id)a3;
- (void)_postStatusChangeNotification;
- (void)_setPlayerState:(int64_t)a3;
- (void)_updateForPeriodicTickWithTime:(double)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)seekToTime:(double)a3;
- (void)setCertificateURL:(id)a3;
- (void)setKeyURL:(id)a3;
- (void)setStoreItemIdentifier:(int64_t)a3;
- (void)setValue:(id)a3 forNowPlayingKey:(id)a4;
- (void)stop;
@end

@implementation SUAudioPlayer

- (SUAudioPlayer)initWithURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUAudioPlayer;
  v4 = [(SUAudioPlayer *)&v7 init];
  if (v4)
  {
    v4->_url = (NSURL *)a3;
    v5 = objc_alloc_init(SUPlayerStatus);
    v4->_status = v5;
    [(SUPlayerStatus *)v5 setPlayerState:0];
  }
  return v4;
}

- (void)dealloc
{
  [(SUAudioPlayer *)self _destroyPlayer];
  [(SUAudioPlayer *)self _destroyPlayerItem];

  v3.receiver = self;
  v3.super_class = (Class)SUAudioPlayer;
  [(SUAudioPlayer *)&v3 dealloc];
}

- (SUPlayerStatus)playerStatus
{
  v2 = (void *)[(SUPlayerStatus *)self->_status copy];

  return (SUPlayerStatus *)v2;
}

- (void)play
{
  if (self->_asset)
  {
    player = self->_player;
    if (player)
    {
      [(AVPlayer *)player play];
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    id v5 = objc_alloc(NSDictionary);
    v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", MEMORY[0x263EFFA88], *MEMORY[0x263EFA2C8], 0);
    objc_super v7 = (AVURLAsset *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:self->_url options:v6];
    self->_asset = v7;
    [(AVAssetResourceLoader *)[(AVURLAsset *)v7 resourceLoader] setDelegate:self queue:dispatch_get_global_queue(0, 0)];
    asset = self->_asset;
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"duration", @"tracks", 0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __21__SUAudioPlayer_play__block_invoke;
    v10[3] = &unk_264812130;
    v10[4] = v4;
    [(AVURLAsset *)asset loadValuesAsynchronouslyForKeys:v9 completionHandler:v10];
    [(SUAudioPlayer *)self _setPlayerState:1];
  }
}

void __21__SUAudioPlayer_play__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__SUAudioPlayer_play__block_invoke_2;
  block[3] = &unk_264812130;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __21__SUAudioPlayer_play__block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) object];

  return [v1 _handleAssetValuesDidLoad];
}

- (void)pause
{
}

- (void)seekToTime:(double)a3
{
  player = self->_player;
  CMTimeMakeWithSeconds(&v4, a3, 1);
  [(AVPlayer *)player seekToTime:&v4];
}

- (void)setValue:(id)a3 forNowPlayingKey:(id)a4
{
  nowPlayingInfo = self->_nowPlayingInfo;
  if (a3)
  {
    if (!nowPlayingInfo)
    {
      nowPlayingInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_nowPlayingInfo = nowPlayingInfo;
    }
    [(NSMutableDictionary *)nowPlayingInfo setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)nowPlayingInfo removeObjectForKey:a4];
  }

  [(SUAudioPlayer *)self _applyNowPlayingInfo];
}

- (void)stop
{
  [(AVPlayer *)self->_player pause];
  [(SUAudioPlayer *)self _destroyPlayer];
  [(SUAudioPlayer *)self _destroyPlayerItem];

  [(SUAudioPlayer *)self _setPlayerState:5];
}

- (id)valueForNowPlayingKey:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_nowPlayingInfo objectForKey:a3];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (!objc_msgSend(a3, "isEqualToString:", @"status", a4, a5, a6)) {
    return;
  }
  if (self->_player == a4)
  {
    if ([a4 status] != 2) {
      return;
    }
    player = self->_player;
    goto LABEL_9;
  }
  if (self->_playerItem != a4) {
    return;
  }
  uint64_t v8 = [a4 status];
  if (v8 != 1)
  {
    if (v8 != 2) {
      return;
    }
    player = self->_playerItem;
LABEL_9:
    uint64_t v10 = [player error];
    [(SUAudioPlayer *)self _failWithError:v10];
    return;
  }
  v11 = self->_player;

  [(AVPlayer *)v11 play];
}

- (void)_itemFailedToPlayToEndNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SUAudioPlayer__itemFailedToPlayToEndNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__SUAudioPlayer__itemFailedToPlayToEndNotification___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = [v1[7] error];

  return [v1 _failWithError:v2];
}

- (void)_itemPlayedToEndNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUAudioPlayer__itemPlayedToEndNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__SUAudioPlayer__itemPlayedToEndNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPlayerState:5];
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  v6 = objc_alloc_init(SUPastisOperation);
  [(SUPastisOperation *)v6 setLoadingRequest:a4];
  [(SUPastisOperation *)v6 setKeyURL:self->_keyUrl];
  [(SUPastisOperation *)v6 setCertificateURL:self->_certificateUrl];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v6);

  return 1;
}

- (void)_applyNowPlayingInfo
{
  unint64_t v3 = [(SUPlayerStatus *)self->_status playerState] - 1;
  CMTime v4 = (void *)[MEMORY[0x263F12118] defaultCenter];
  if (v3 > 2) {
    nowPlayingInfo = 0;
  }
  else {
    nowPlayingInfo = self->_nowPlayingInfo;
  }

  [v4 setNowPlayingInfo:nowPlayingInfo];
}

- (void)_destroyPlayer
{
  if (self->_timeObserver)
  {
    -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");

    self->_timeObserver = 0;
  }
  [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"status"];

  self->_player = 0;
}

- (void)_destroyPlayerItem
{
  unint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFA060] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EFA050] object:0];
  [(AVPlayerItem *)self->_playerItem removeObserver:self forKeyPath:@"status"];

  self->_playerItem = 0;
}

- (void)_failWithError:(id)a3
{
  [(SUPlayerStatus *)self->_status setError:a3];

  [(SUAudioPlayer *)self _setPlayerState:4];
}

- (void)_handleAssetValuesDidLoad
{
  uint64_t v16 = 0;
  if ([(AVURLAsset *)self->_asset statusOfValueForKey:@"duration" error:&v16] == 2
    && [(AVURLAsset *)self->_asset statusOfValueForKey:@"tracks" error:&v16] == 2)
  {
    unint64_t v3 = (AVPlayer *)objc_alloc_init(MEMORY[0x263EFA7F0]);
    self->_player = v3;
    [(AVPlayer *)v3 setAllowsExternalPlayback:0];
    [(AVPlayer *)self->_player addObserver:self forKeyPath:@"status" options:0 context:0];
    uint64_t v4 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    player = self->_player;
    CMTimeMakeWithSeconds(&v15, 1.0, 4);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__SUAudioPlayer__handleAssetValuesDidLoad__block_invoke;
    v14[3] = &unk_264814D68;
    v14[4] = v4;
    id v6 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v15 queue:MEMORY[0x263EF83A0] usingBlock:v14];
    self->_timeObserver = v6;
    id v7 = v6;
    uint64_t v8 = (AVPlayerItem *)[objc_alloc(MEMORY[0x263EFA800]) initWithAsset:self->_asset];
    self->_playerItem = v8;
    [(AVPlayerItem *)v8 addObserver:self forKeyPath:@"status" options:0 context:0];
    id v9 = [(SUAudioPlayer *)self _newFadeInAudioMixForAsset:self->_asset];
    [(AVPlayerItem *)self->_playerItem setAudioMix:v9];

    uint64_t v10 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel__itemFailedToPlayToEndNotification_ name:*MEMORY[0x263EFA060] object:0];
    [v10 addObserver:self selector:sel__itemPlayedToEndNotification_ name:*MEMORY[0x263EFA050] object:self->_playerItem];
    [(AVPlayer *)self->_player replaceCurrentItemWithPlayerItem:self->_playerItem];
    status = self->_status;
    asset = self->_asset;
    if (asset) {
      [(AVURLAsset *)asset duration];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    [(SUPlayerStatus *)status setDuration:CMTimeGetSeconds(&v13)];
    [(SUAudioPlayer *)self _postStatusChangeNotification];
  }
  else
  {
    [(SUAudioPlayer *)self _failWithError:v16];
  }
}

uint64_t __42__SUAudioPlayer__handleAssetValuesDidLoad__block_invoke(uint64_t a1, CMTime *a2)
{
  unint64_t v3 = (void *)[*(id *)(a1 + 32) object];
  CMTime v5 = *a2;
  return [v3 _updateForPeriodicTickWithTime:CMTimeGetSeconds(&v5)];
}

- (id)_newFadeInAudioMixForAsset:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  CMTime v5 = (void *)[a3 tracksWithMediaType:*MEMORY[0x263EF9CE8]];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    long long v16 = *MEMORY[0x263F010E0];
    uint64_t v9 = *(void *)(MEMORY[0x263F010E0] + 16);
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x263EFA780]);
        objc_msgSend(v12, "setTrackID:", objc_msgSend(v11, "trackID"));
        long long v18 = v16;
        uint64_t v19 = v9;
        [v12 setVolume:&v18 atTime:0.0];
        CMTimeMakeWithSeconds(&v17, 0.3, 1);
        LODWORD(v13) = 1.0;
        [v12 setVolume:&v17 atTime:v13];
        [v4 addObject:v12];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFA778]);
  [v14 setInputParameters:v4];

  return v14;
}

- (void)_postStatusChangeNotification
{
  unint64_t v3 = self;
  id v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v4 postNotificationName:@"SUAudioPlayerStatusChangeNotification" object:self];
}

- (void)_setPlayerState:(int64_t)a3
{
  if ([(SUPlayerStatus *)self->_status playerState] != a3)
  {
    [(SUPlayerStatus *)self->_status setPlayerState:a3];
    [(SUAudioPlayer *)self _applyNowPlayingInfo];
    [(SUAudioPlayer *)self _postStatusChangeNotification];
  }
}

- (void)_updateForPeriodicTickWithTime:(double)a3
{
  [(SUPlayerStatus *)self->_status duration];
  double v6 = v5;
  [(SUPlayerStatus *)self->_status setCurrentTime:a3];
  if (v6 >= a3) {
    double v7 = v6;
  }
  else {
    double v7 = a3;
  }
  [(SUPlayerStatus *)self->_status setDuration:v7];
  int64_t v8 = [(SUPlayerStatus *)self->_status playerState];
  [(AVPlayer *)self->_player rate];
  uint64_t v10 = 3;
  if (v8 != 2) {
    uint64_t v10 = v8;
  }
  if (v9 <= 0.00000011921) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 2;
  }
  if ([(SUPlayerStatus *)self->_status playerState] != v11)
  {
    [(SUPlayerStatus *)self->_status setPlayerState:v11];
    [(SUAudioPlayer *)self _applyNowPlayingInfo];
  }
  if (!self->_didPostForPreviewHistory && a3 >= 5.0)
  {
    int64_t storeItemIdentifier = self->_storeItemIdentifier;
    if (storeItemIdentifier)
    {
      id v13 = SUCreatePreviewHistoryOperation(storeItemIdentifier);
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v13);
      self->_didPostForPreviewHistory = 1;
    }
  }

  [(SUAudioPlayer *)self _postStatusChangeNotification];
}

- (NSURL)certificateURL
{
  return self->_certificateUrl;
}

- (void)setCertificateURL:(id)a3
{
}

- (NSURL)keyURL
{
  return self->_keyUrl;
}

- (void)setKeyURL:(id)a3
{
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_int64_t storeItemIdentifier = a3;
}

- (NSURL)URL
{
  return self->_url;
}

@end