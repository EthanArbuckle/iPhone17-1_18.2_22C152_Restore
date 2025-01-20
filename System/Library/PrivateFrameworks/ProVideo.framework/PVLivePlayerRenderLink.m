@interface PVLivePlayerRenderLink
- (BOOL)setThrottledFPS:(unsigned int)a3;
- (BOOL)skipThrottledRenderLinkTime:(id *)a3;
- (PVLivePlayerRenderLink)init;
- (unsigned)_throttledRenderLinkFPS_NoLock;
- (unsigned)thermalPolicyThrottledFPS;
- (unsigned)throttledFPS;
- (void)dealloc;
- (void)registerWithPlayer:(id)a3;
- (void)signalDroppedRenderLink;
- (void)signalPlayer:(id *)a3;
@end

@implementation PVLivePlayerRenderLink

- (PVLivePlayerRenderLink)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVLivePlayerRenderLink;
  if ([(PVLivePlayerRenderLink *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  lock = self->_lock;
  if (lock) {
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVLivePlayerRenderLink;
  [(PVLivePlayerRenderLink *)&v4 dealloc];
}

- (void)registerWithPlayer:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  char v7 = 0;
  HGSynchronizable::Lock(lock);
  id v5 = objc_storeWeak((id *)&self->_player, v4);

  if (v4) {
    [(PVLivePlayerRenderLink *)self rebuild];
  }
  else {
    [(PVLivePlayerRenderLink *)self teardown];
  }
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (BOOL)setThrottledFPS:(unsigned int)a3
{
  lock = self->_lock;
  char v10 = 0;
  HGSynchronizable::Lock(lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  v6 = [WeakRetained thermalThrottlingPolicy];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_player);
    NSLog(&cfstr_IgnoreSetthrot.isa, self, v7);
  }
  else
  {
    self->_throttledFPS = a3;
  }
  HGSynchronizer::~HGSynchronizer(&lock);
  return v6 == 0;
}

- (unsigned)throttledFPS
{
  v2 = self;
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  LODWORD(v2) = v2->_throttledFPS;
  HGSynchronizer::~HGSynchronizer(&lock);
  return v2;
}

- (unsigned)thermalPolicyThrottledFPS
{
  v2 = self;
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  LODWORD(v2) = [(PVLivePlayerRenderLink *)v2 _throttledRenderLinkFPS_NoLock];
  HGSynchronizer::~HGSynchronizer(&lock);
  return v2;
}

- (BOOL)skipThrottledRenderLinkTime:(id *)a3
{
  lock = self->_lock;
  char v15 = 0;
  HGSynchronizable::Lock(lock);
  int32_t v5 = [(PVLivePlayerRenderLink *)self _throttledRenderLinkFPS_NoLock];
  if (v5)
  {
    memset(&v13, 0, sizeof(v13));
    CMTime time = (CMTime)*a3;
    CMTimeConvertScale(&v13, &time, v5, kCMTimeRoundingMethod_RoundTowardZero);
    CMTime time1 = (CMTime)self->_lastTime;
    CMTime v10 = v13;
    int32_t v6 = CMTimeCompare(&time1, &v10);
    p_lastTime = &self->_lastTime;
    BOOL v8 = v6 == 0;
    *(CMTime *)p_lastTime = v13;
  }
  else
  {
    BOOL v8 = 0;
  }
  HGSynchronizer::~HGSynchronizer(&lock);
  return v8;
}

- (unsigned)_throttledRenderLinkFPS_NoLock
{
  unsigned int v3 = [(PVLivePlayerRenderLink *)self throttledFPS];
  p_player = &self->_player;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  int32_t v6 = [WeakRetained thermalThrottlingPolicy];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_player);
    BOOL v8 = [v7 thermalThrottlingPolicy];
    v9 = [v8 populatedControlParametersForCurrentThermalLevel];

    CMTime v10 = [v9 renderLinkRate];
    if (v10)
    {
      v11 = [v9 renderLinkRate];
      uint64_t v12 = [v11 unsignedIntegerValue];

      if (v12)
      {
        CMTime v13 = [v9 renderLinkRate];
        unsigned int v3 = [v13 unsignedIntegerValue];
      }
    }
  }
  return v3;
}

- (void)signalPlayer:(id *)a3
{
  lock = self->_lock;
  char v11 = 0;
  HGSynchronizable::Lock(lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  HGSynchronizer::~HGSynchronizer(&lock);
  if (WeakRetained)
  {
    long long v8 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    if ([(PVLivePlayerRenderLink *)self skipThrottledRenderLinkTime:&v8])
    {
      [WeakRetained renderLinkSignalSkipped];
    }
    else
    {
      long long v6 = *(_OWORD *)&a3->var0;
      int64_t v7 = a3->var3;
      [WeakRetained renderLinkSignal:&v6];
    }
  }
}

- (void)signalDroppedRenderLink
{
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  HGSynchronizer::~HGSynchronizer(&lock);
  if (WeakRetained) {
    [WeakRetained renderLinkSignalDropped];
  }
}

- (void).cxx_destruct
{
}

@end