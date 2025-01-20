@interface VPPresenterView
- (NSString)verificationCode;
- (unsigned)flags;
- (void)_watermarkStep;
- (void)layoutSubviews;
- (void)setFlags:(unsigned int)a3;
- (void)setVerificationCode:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation VPPresenterView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VPPresenterView;
  [(VPPresenterView *)&v3 layoutSubviews];
  if (self->_watermarkLayer)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(VPPresenterView *)self bounds];
    -[CALayer setFrame:](self->_watermarkLayer, "setFrame:");
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)setVerificationCode:(id)a3
{
  v4 = (NSString *)a3;
  if (gLogCategory_PV <= 30 && (gLogCategory_PV != -1 || _LogCategory_Initialize()))
  {
    IsAppleInternalBuild();
    LogPrintF();
  }
  verificationCode = self->_verificationCode;
  self->_verificationCode = v4;
  v6 = v4;

  watermarkPixelBuffers = self->_watermarkPixelBuffers;
  self->_watermarkPixelBuffers = 0;

  if (self->_started)
  {
    [(VPPresenterView *)self start];
  }
}

- (void)start
{
  if (gLogCategory_PV <= 30 && (gLogCategory_PV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_started = 1;
  if ([(NSString *)self->_verificationCode length])
  {
    int v19 = 0;
    if (self->_watermarkPixelBuffers) {
      goto LABEL_22;
    }
    v12 = [(NSString *)self->_verificationCode UTF8String];
    [(VPPresenterView *)self bounds];
    unint64_t v14 = (unint64_t)v13;
    [(VPPresenterView *)self bounds];
    v16 = (NSArray *)VPCreateWatermarkPixelBuffers(v12, 0xFFFFFFFFFFFFFFFFLL, v14, (unint64_t)v15, 32, &v19);
    watermarkPixelBuffers = self->_watermarkPixelBuffers;
    self->_watermarkPixelBuffers = v16;

    if (!v19)
    {
LABEL_22:
      if (!self->_watermarkLayer)
      {
        objc_super v3 = [MEMORY[0x263F157E8] layer];
        watermarkLayer = self->_watermarkLayer;
        self->_watermarkLayer = v3;

        [(CALayer *)self->_watermarkLayer setContentsDither:0];
        [(VPPresenterView *)self bounds];
        -[CALayer setFrame:](self->_watermarkLayer, "setFrame:");
        v5 = [(VPPresenterView *)self layer];
        [v5 addSublayer:self->_watermarkLayer];
      }
      if (!self->_moviePlayer)
      {
        v6 = (AVPlayer *)objc_alloc_init(MEMORY[0x263EFA7F0]);
        moviePlayer = self->_moviePlayer;
        self->_moviePlayer = v6;
      }
      if (!self->_watermarkStepTimer)
      {
        self->_watermarkStepIndex = 0;
        v8 = CUMainQueue();
        v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
        watermarkStepTimer = self->_watermarkStepTimer;
        self->_watermarkStepTimer = v9;

        v11 = self->_watermarkStepTimer;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __24__VPPresenterView_start__block_invoke;
        handler[3] = &unk_26484EEC8;
        handler[4] = self;
        dispatch_source_set_event_handler(v11, handler);
        CUDispatchTimerSet();
        dispatch_resume((dispatch_object_t)self->_watermarkStepTimer);
      }
    }
    else if (gLogCategory_PV <= 60 && (gLogCategory_PV != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __24__VPPresenterView_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _watermarkStep];
}

- (void)stop
{
  if (self->_started && gLogCategory_PV <= 30 && (gLogCategory_PV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_started = 0;
  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    [(AVPlayer *)moviePlayer pause];
    v4 = self->_moviePlayer;
    self->_moviePlayer = 0;
  }
  watermarkStepTimer = self->_watermarkStepTimer;
  if (watermarkStepTimer)
  {
    v6 = watermarkStepTimer;
    dispatch_source_cancel(v6);
    v7 = self->_watermarkStepTimer;
    self->_watermarkStepTimer = 0;
  }
  watermarkLayer = self->_watermarkLayer;
  if (watermarkLayer)
  {
    [(CALayer *)watermarkLayer removeFromSuperlayer];
    v9 = self->_watermarkLayer;
    self->_watermarkLayer = 0;
  }
  watermarkPixelBuffers = self->_watermarkPixelBuffers;
  self->_watermarkPixelBuffers = 0;
}

- (void)_watermarkStep
{
  unint64_t watermarkStepIndex = self->_watermarkStepIndex;
  self->_unint64_t watermarkStepIndex = watermarkStepIndex + 1;
  v4 = [(NSArray *)self->_watermarkPixelBuffers objectAtIndexedSubscript:watermarkStepIndex % [(NSArray *)self->_watermarkPixelBuffers count]];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CALayer *)self->_watermarkLayer setContents:v4];
  v5 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D30]];
  [(CALayer *)self->_watermarkLayer setCompositingFilter:v5];

  v6 = (void *)MEMORY[0x263F158F8];
  [v6 commit];
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_watermarkStepTimer, 0);
  objc_storeStrong((id *)&self->_watermarkPixelBuffers, 0);
  objc_storeStrong((id *)&self->_watermarkLayer, 0);
  objc_storeStrong((id *)&self->_moviePlayer, 0);
}

@end