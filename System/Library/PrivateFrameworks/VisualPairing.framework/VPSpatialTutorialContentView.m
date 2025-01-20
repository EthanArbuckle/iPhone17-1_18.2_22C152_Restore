@interface VPSpatialTutorialContentView
- (VPSpatialTutorialContentView)initWithCoder:(id)a3;
- (VPSpatialTutorialContentView)initWithFrame:(CGRect)a3;
- (VPSpatialTutorialContentView)initWithFrame:(CGRect)a3 mode:(int)a4;
- (VPSpatialTutorialContentView)initWithMode:(int)a3;
- (int)mode;
- (void)dealloc;
- (void)initPlayerSpatial;
- (void)initPlayerStereo;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMode:(int)a3;
- (void)startPlayers;
- (void)stopPlayers;
- (void)syncPlayersWithRate:(float)a3;
- (void)updatePlayersValuesBasedOnMode;
@end

@implementation VPSpatialTutorialContentView

- (VPSpatialTutorialContentView)initWithFrame:(CGRect)a3 mode:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VPSpatialTutorialContentView;
  v5 = -[VPSpatialTutorialContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_mode = a4;
    v5->_playersPlaying = 0;
    v5->_playersStartTriggered = 0;
    v5->_spatialStatus = 0;
    v5->_stereoStatus = 0;
    [(VPSpatialTutorialContentView *)v5 initPlayerStereo];
    [(VPSpatialTutorialContentView *)v6 initPlayerSpatial];
    [(VPSpatialTutorialContentView *)v6 updatePlayersValuesBasedOnMode];
  }
  return v6;
}

- (VPSpatialTutorialContentView)initWithMode:(int)a3
{
  return -[VPSpatialTutorialContentView initWithFrame:mode:](self, "initWithFrame:mode:", *(void *)&a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (VPSpatialTutorialContentView)initWithFrame:(CGRect)a3
{
  return -[VPSpatialTutorialContentView initWithFrame:mode:](self, "initWithFrame:mode:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (VPSpatialTutorialContentView)initWithCoder:(id)a3
{
  return -[VPSpatialTutorialContentView initWithFrame:mode:](self, "initWithFrame:mode:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VPSpatialTutorialContentView;
  [(VPSpatialTutorialContentView *)&v4 layoutSublayersOfLayer:a3];
  [(VPSpatialTutorialContentView *)self bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayerStereo, "setFrame:");
  [(VPSpatialTutorialContentView *)self bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayerSpatial, "setFrame:");
}

- (void)dealloc
{
  -[AVPlayerLooper removeObserver:forKeyPath:context:](self->_looperStereo, "removeObserver:forKeyPath:context:", self, @"status");
  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerStereo, "removeObserver:forKeyPath:context:", self, @"status");
  -[AVPlayerLooper removeObserver:forKeyPath:context:](self->_looperSpatial, "removeObserver:forKeyPath:context:", self, @"status");
  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerSpatial, "removeObserver:forKeyPath:context:", self, @"status");
  v3.receiver = self;
  v3.super_class = (Class)VPSpatialTutorialContentView;
  [(VPSpatialTutorialContentView *)&v3 dealloc];
}

- (void)initPlayerStereo
{
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 pathForResource:@"StereoAudioLoop" ofType:@"mov"];

  v5 = [NSURL fileURLWithPath:v4];
  v6 = [MEMORY[0x263EFA800] playerItemWithURL:v5];
  playerItemStereo = self->_playerItemStereo;
  self->_playerItemStereo = v6;

  [(AVPlayerItem *)self->_playerItemStereo setAllowedAudioSpatializationFormats:0];
  objc_super v8 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
  playerStereo = self->_playerStereo;
  self->_playerStereo = v8;

  [(AVQueuePlayer *)self->_playerStereo setAutomaticallyWaitsToMinimizeStalling:0];
  v10 = (void *)MEMORY[0x263EFA840];
  v11 = self->_playerStereo;
  v12 = self->_playerItemStereo;
  CMTimeMake(&duration, 14000, 1000);
  CMTime v18 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake(&v20, &v18, &duration);
  v13 = [v10 playerLooperWithPlayer:v11 templateItem:v12 timeRange:&v20];
  looperStereo = self->_looperStereo;
  self->_looperStereo = v13;

  [(AVPlayerLooper *)self->_looperStereo addObserver:self forKeyPath:@"status" options:5 context:&self->_looperStereo];
  [(AVQueuePlayer *)self->_playerStereo addObserver:self forKeyPath:@"status" options:5 context:&self->_playerStereo];
  v15 = [MEMORY[0x263EFA838] playerLayerWithPlayer:self->_playerStereo];
  playerLayerStereo = self->_playerLayerStereo;
  self->_playerLayerStereo = v15;

  v17 = [(VPSpatialTutorialContentView *)self layer];
  [v17 addSublayer:self->_playerLayerStereo];
}

- (void)initPlayerSpatial
{
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 pathForResource:@"SpatialAudioLoop" ofType:@"mov"];

  v5 = [NSURL fileURLWithPath:v4];
  v6 = [MEMORY[0x263EFA800] playerItemWithURL:v5];
  playerItemSpatial = self->_playerItemSpatial;
  self->_playerItemSpatial = v6;

  objc_super v8 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
  playerSpatial = self->_playerSpatial;
  self->_playerSpatial = v8;

  [(AVQueuePlayer *)self->_playerSpatial setAutomaticallyWaitsToMinimizeStalling:0];
  v10 = (void *)MEMORY[0x263EFA840];
  v11 = self->_playerSpatial;
  v12 = self->_playerItemSpatial;
  CMTimeMake(&duration, 14000, 1000);
  CMTime v18 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake(&v20, &v18, &duration);
  v13 = [v10 playerLooperWithPlayer:v11 templateItem:v12 timeRange:&v20];
  looperSpatial = self->_looperSpatial;
  self->_looperSpatial = v13;

  [(AVPlayerLooper *)self->_looperSpatial addObserver:self forKeyPath:@"status" options:5 context:&self->_looperSpatial];
  [(AVQueuePlayer *)self->_playerSpatial addObserver:self forKeyPath:@"status" options:5 context:&self->_playerSpatial];
  v15 = [MEMORY[0x263EFA838] playerLayerWithPlayer:self->_playerSpatial];
  playerLayerSpatial = self->_playerLayerSpatial;
  self->_playerLayerSpatial = v15;

  v17 = [(VPSpatialTutorialContentView *)self layer];
  [v17 addSublayer:self->_playerLayerSpatial];
}

- (void)startPlayers
{
  self->_playersStartTriggered = 1;
  if (self->_stereoStatus.looperReady
    && self->_stereoStatus.playerReady
    && self->_spatialStatus.looperReady
    && self->_spatialStatus.playerReady)
  {
    [(VPSpatialTutorialContentView *)self updatePlayersValuesBasedOnMode];
    LODWORD(v3) = 1.0;
    [(VPSpatialTutorialContentView *)self syncPlayersWithRate:v3];
  }
  else if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)stopPlayers
{
  self->_playersStartTriggered = 0;
  if (self->_playersPlaying)
  {
    [(VPSpatialTutorialContentView *)self syncPlayersWithRate:0.0];
  }
  else if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)syncPlayersWithRate:(float)a3
{
  memset(&v21, 0, sizeof(v21));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v21, HostTimeClock);
  memset(&v20, 0, sizeof(v20));
  CMTimeMakeWithSeconds(&rhs, 0.1, 1000);
  CMTime lhs = v21;
  CMTimeAdd(&v20, &lhs, &rhs);
  playerStereo = self->_playerStereo;
  if (playerStereo)
  {
    [(AVQueuePlayer *)playerStereo currentTime];
    if ((v16 & 0x100000000) != 0)
    {
      v7 = self->_playerStereo;
      if (v7) {
        [(AVQueuePlayer *)v7 currentTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      *(_OWORD *)&lhs.value = *(_OWORD *)&time.value;
      CMTimeEpoch epoch = time.epoch;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  *(_OWORD *)&lhs.value = *MEMORY[0x263F010E0];
  CMTimeEpoch epoch = *(void *)(MEMORY[0x263F010E0] + 16);
LABEL_9:
  lhs.CMTimeEpoch epoch = epoch;
  if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
  {
    CMTime time = lhs;
    Float64 Seconds = CMTimeGetSeconds(&time);
    double v12 = a3;
    LogPrintF();
  }
  v9 = self->_playerStereo;
  CMTime time = lhs;
  CMTime v13 = v20;
  -[AVQueuePlayer setRate:time:atHostTime:](v9, "setRate:time:atHostTime:", &time, &v13, COERCE_DOUBLE(__PAIR64__(HIDWORD(v20.value), LODWORD(a3))), *(void *)&Seconds, *(void *)&v12);
  playerSpatial = self->_playerSpatial;
  CMTime time = lhs;
  CMTime v13 = v20;
  [(AVQueuePlayer *)playerSpatial setRate:&time time:&v13 atHostTime:COERCE_DOUBLE(__PAIR64__(HIDWORD(v20.value), LODWORD(a3)))];
  self->_playersPlaying = a3 == 1.0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  v9 = CUMainQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__VPSpatialTutorialContentView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_26484EF40;
  id v12 = v8;
  CMTime v13 = a6;
  block[4] = self;
  id v10 = v8;
  dispatch_async(v9, block);
}

unsigned char *__79__VPSpatialTutorialContentView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 == v3 + 416 || v2 == v3 + 424)
  {
    objc_super v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = [v4 integerValue];
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6 == v7 + 416)
    {
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v5 != 1) {
        goto LABEL_46;
      }
      v11 = &OBJC_IVAR___VPSpatialTutorialContentView__stereoStatus;
    }
    else
    {
      if (v6 != v7 + 424) {
        goto LABEL_46;
      }
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v5 != 1) {
        goto LABEL_46;
      }
      v11 = &OBJC_IVAR___VPSpatialTutorialContentView__spatialStatus;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + *v11) = 1;
    goto LABEL_46;
  }
  if (v2 == v3 + 432 || v2 == v3 + 440)
  {
    objc_super v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = [v4 integerValue];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9 == v10 + 432)
    {
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v8 != 1) {
        goto LABEL_46;
      }
      id v12 = &OBJC_IVAR___VPSpatialTutorialContentView__stereoStatus;
    }
    else
    {
      if (v9 != v10 + 440) {
        goto LABEL_46;
      }
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v8 != 1) {
        goto LABEL_46;
      }
      id v12 = &OBJC_IVAR___VPSpatialTutorialContentView__spatialStatus;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + *v12 + 1) = 1;
LABEL_46:

    goto LABEL_47;
  }
  if (gLogCategory_STCV <= 90 && (gLogCategory_STCV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_47:
  result = *(unsigned char **)(a1 + 32);
  if (result[481])
  {
    return (unsigned char *)[result startPlayers];
  }
  return result;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
  [(VPSpatialTutorialContentView *)self updatePlayersValuesBasedOnMode];
}

- (void)updatePlayersValuesBasedOnMode
{
  uint64_t v3 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerStereo;
  int mode = self->_mode;
  if (mode)
  {
    if (mode != 1) {
      return;
    }
    uint64_t v5 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerStereo;
    uint64_t v6 = &OBJC_IVAR___VPSpatialTutorialContentView__playerStereo;
    uint64_t v7 = &OBJC_IVAR___VPSpatialTutorialContentView__playerSpatial;
    uint64_t v3 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerSpatial;
  }
  else
  {
    uint64_t v6 = &OBJC_IVAR___VPSpatialTutorialContentView__playerSpatial;
    uint64_t v7 = &OBJC_IVAR___VPSpatialTutorialContentView__playerStereo;
    uint64_t v5 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerSpatial;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v3) setHidden:0];
  [*(id *)((char *)&self->super.super.super.isa + *v5) setHidden:1];
  LODWORD(v8) = 1.0;
  [*(id *)((char *)&self->super.super.super.isa + *v7) setVolume:v8];
  uint64_t v9 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  [v9 setVolume:0.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayerSpatial, 0);
  objc_storeStrong((id *)&self->_playerLayerStereo, 0);
  objc_storeStrong((id *)&self->_playerItemSpatial, 0);
  objc_storeStrong((id *)&self->_playerItemStereo, 0);
  objc_storeStrong((id *)&self->_looperSpatial, 0);
  objc_storeStrong((id *)&self->_looperStereo, 0);
  objc_storeStrong((id *)&self->_playerSpatial, 0);
  objc_storeStrong((id *)&self->_playerStereo, 0);
}

@end