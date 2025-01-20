@interface SVVideoVolumeObserver
- (AVAudioSession)audioSession;
- (BOOL)muted;
- (SVKeyValueObserver)outputVolumeObserver;
- (SVPlaybackCoordinator)playbackCoordinator;
- (SVVideoVolumeObserver)initWithPlaybackCoordinator:(id)a3 audioSession:(id)a4;
- (float)volume;
- (id)muteStateChangeBlock;
- (id)volumeChangeBlock;
- (void)onMuteStateChange:(id)a3;
- (void)onVolumeChange:(id)a3;
- (void)playbackCoordinatorMuteStateChanged:(id)a3;
- (void)updateWithVolume:(float)a3 muted:(BOOL)a4;
- (void)volumeChanged:(float)a3;
@end

@implementation SVVideoVolumeObserver

- (SVVideoVolumeObserver)initWithPlaybackCoordinator:(id)a3 audioSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SVVideoVolumeObserver;
  v8 = [(SVVideoVolumeObserver *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackCoordinator, v6);
    objc_storeWeak((id *)&v9->_audioSession, v7);
    [v6 addPlaybackObserver:v9];
    [v7 outputVolume];
    int v11 = v10;
    uint64_t v12 = [v6 muted];
    LODWORD(v13) = v11;
    [(SVVideoVolumeObserver *)v9 updateWithVolume:v12 muted:v13];
    objc_initWeak(&location, v9);
    v14 = [SVKeyValueObserver alloc];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __66__SVVideoVolumeObserver_initWithPlaybackCoordinator_audioSession___block_invoke;
    v18[3] = &unk_264771050;
    objc_copyWeak(&v19, &location);
    uint64_t v15 = [(SVKeyValueObserver *)v14 initWithKeyPath:@"outputVolume" ofObject:v7 withOptions:1 change:v18];
    outputVolumeObserver = v9->_outputVolumeObserver;
    v9->_outputVolumeObserver = (SVKeyValueObserver *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__SVVideoVolumeObserver_initWithPlaybackCoordinator_audioSession___block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 audioSession];
  [v1 outputVolume];
  objc_msgSend(v2, "volumeChanged:");
}

- (void)playbackCoordinatorMuteStateChanged:(id)a3
{
  id v9 = a3;
  int v4 = 0;
  if (([v9 muted] & 1) == 0)
  {
    v5 = [(SVVideoVolumeObserver *)self audioSession];
    [v5 outputVolume];
    int v4 = v6;
  }
  uint64_t v7 = [v9 muted];
  LODWORD(v8) = v4;
  [(SVVideoVolumeObserver *)self updateWithVolume:v7 muted:v8];
}

- (void)volumeChanged:(float)a3
{
}

- (void)updateWithVolume:(float)a3 muted:(BOOL)a4
{
  int v4 = a4;
  int muted = self->_muted;
  if (self->_volume == a3)
  {
    if (muted == a4) {
      return;
    }
    self->_int muted = a4;
    self->_volume = a3;
    goto LABEL_8;
  }
  self->_int muted = a4;
  self->_volume = a3;
  uint64_t v7 = [(SVVideoVolumeObserver *)self volumeChangeBlock];

  if (v7)
  {
    double v8 = [(SVVideoVolumeObserver *)self volumeChangeBlock];
    ((void (**)(void, SVVideoVolumeObserver *))v8)[2](v8, self);
  }
  if (muted != v4)
  {
LABEL_8:
    id v9 = [(SVVideoVolumeObserver *)self muteStateChangeBlock];

    if (v9)
    {
      int v10 = [(SVVideoVolumeObserver *)self muteStateChangeBlock];
      v10[2](v10, self);
    }
  }
}

- (BOOL)muted
{
  return self->_muted;
}

- (float)volume
{
  return self->_volume;
}

- (id)volumeChangeBlock
{
  return self->_volumeChangeBlock;
}

- (void)onVolumeChange:(id)a3
{
}

- (id)muteStateChangeBlock
{
  return self->_muteStateChangeBlock;
}

- (void)onMuteStateChange:(id)a3
{
}

- (SVPlaybackCoordinator)playbackCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackCoordinator);

  return (SVPlaybackCoordinator *)WeakRetained;
}

- (AVAudioSession)audioSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSession);

  return (AVAudioSession *)WeakRetained;
}

- (SVKeyValueObserver)outputVolumeObserver
{
  return self->_outputVolumeObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputVolumeObserver, 0);
  objc_destroyWeak((id *)&self->_audioSession);
  objc_destroyWeak((id *)&self->_playbackCoordinator);
  objc_storeStrong(&self->_muteStateChangeBlock, 0);

  objc_storeStrong(&self->_volumeChangeBlock, 0);
}

@end