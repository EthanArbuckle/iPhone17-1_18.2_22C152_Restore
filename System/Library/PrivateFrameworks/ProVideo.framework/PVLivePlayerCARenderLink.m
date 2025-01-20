@interface PVLivePlayerCARenderLink
- (PVLivePlayerCARenderLink)initWithCADisplayLinkFPS:(int64_t)a3;
- (int64_t)prefferedCADisplayFPS;
- (void)displayLinkFired:(id)a3;
- (void)rebuild;
- (void)setPrefferedCADisplayFPS:(int64_t)a3;
- (void)teardown;
@end

@implementation PVLivePlayerCARenderLink

- (PVLivePlayerCARenderLink)initWithCADisplayLinkFPS:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PVLivePlayerCARenderLink;
  result = [(PVLivePlayerRenderLink *)&v5 init];
  if (result) {
    result->_prefferedCADisplayFPS = a3;
  }
  return result;
}

- (void)setPrefferedCADisplayFPS:(int64_t)a3
{
  lock = self->super._lock;
  char v6 = 0;
  HGSynchronizable::Lock(lock);
  self->_prefferedCADisplayFPS = a3;
  CAFrameRateRange v7 = CAFrameRateRangeMake((float)a3, (float)a3, (float)a3);
  -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (int64_t)prefferedCADisplayFPS
{
  lock = self->super._lock;
  char v6 = 0;
  HGSynchronizable::Lock(lock);
  int64_t prefferedCADisplayFPS = self->_prefferedCADisplayFPS;
  HGSynchronizer::~HGSynchronizer(&lock);
  return prefferedCADisplayFPS;
}

- (void)teardown
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)rebuild
{
  if (!self->_displayLink)
  {
    v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_displayLinkFired_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    objc_super v5 = self->_displayLink;
    char v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

    CAFrameRateRange v9 = CAFrameRateRangeMake((float)self->_prefferedCADisplayFPS, (float)self->_prefferedCADisplayFPS, (float)self->_prefferedCADisplayFPS);
    CAFrameRateRange v7 = self->_displayLink;
    -[CADisplayLink setPreferredFrameRateRange:](v7, "setPreferredFrameRateRange:", *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
  }
}

- (void)displayLinkFired:(id)a3
{
  memset(&v6, 0, sizeof(v6));
  [(CADisplayLink *)self->_displayLink timestamp];
  CMTimeMakeWithSeconds(&v6, v4, [(PVLivePlayerCARenderLink *)self prefferedCADisplayFPS]);
  CMTime v5 = v6;
  [(PVLivePlayerRenderLink *)self signalPlayer:&v5];
}

- (void).cxx_destruct
{
}

@end