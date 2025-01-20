@interface AudioDevice
- (BOOL)getAudioDeviceIsMute;
- (BOOL)getAudioDeviceIsRunningSomewhere;
- (BOOL)isDirty;
- (BOOL)isInput;
- (BOOL)isRunning;
- (BOOL)updateDefaultAudioDeviceInfo;
- (NSDate)lastUpdateTime;
- (PLAudioAgent)ctx;
- (float)getAudioDeviceVolume;
- (float)volume;
- (id)audioPropertyHandlerBlock;
- (id)initInputDeviceWithCtx:(id)a3;
- (id)initOutputDeviceWithCtx:(id)a3;
- (unsigned)deviceID;
- (unsigned)getAudioDeviceSource;
- (unsigned)getAudioDeviceTransportType;
- (unsigned)sourceID;
- (unsigned)transType;
- (void)cleanAndUpdateDeviceInfo;
- (void)flushAndUpdateDeviceInfoWithBlock:(id)a3;
- (void)initAudioPropertyHandler;
- (void)setAudioPropertyHandlerBlock:(id)a3;
- (void)setCtx:(id)a3;
- (void)setDeviceID:(unsigned int)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setIsInput:(BOOL)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setLastUpdateTime:(id)a3;
- (void)setSourceID:(unsigned int)a3;
- (void)setTransType:(unsigned int)a3;
- (void)setVolume:(float)a3;
@end

@implementation AudioDevice

- (id)initInputDeviceWithCtx:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AudioDevice;
  v5 = [(AudioDevice *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_ctx, v4);
    v6->_isInput = 1;
    [(AudioDevice *)v6 initAudioPropertyHandler];
  }

  return v6;
}

- (id)initOutputDeviceWithCtx:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AudioDevice;
  v5 = [(AudioDevice *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_ctx, v4);
    v6->_isInput = 0;
    [(AudioDevice *)v6 initAudioPropertyHandler];
  }

  return v6;
}

- (void)initAudioPropertyHandler
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AudioDevice_initAudioPropertyHandler__block_invoke;
  v5[3] = &unk_1E692E418;
  objc_copyWeak(&v6, &location);
  v3 = _Block_copy(v5);
  id audioPropertyHandlerBlock = self->_audioPropertyHandlerBlock;
  self->_id audioPropertyHandlerBlock = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__AudioDevice_initAudioPropertyHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained handleAudioDevicePropertyChange:a2 addresses:a3];
    id WeakRetained = v6;
  }
}

- (void)flushAndUpdateDeviceInfoWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ctx);
  if (WeakRetained)
  {
    if (self->_isDirty)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      lastUpdateTime = self->_lastUpdateTime;
      self->_lastUpdateTime = v6;

      if (v4) {
        v4[2](v4);
      }
    }
    else
    {
      if (v4) {
        v4[2](v4);
      }
      self->_isDirty = 1;
      objc_super v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v9 = self->_lastUpdateTime;
      self->_lastUpdateTime = v8;

      dispatch_time_t v10 = dispatch_time(0, 10000000000);
      v11 = [WeakRetained workQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__AudioDevice_flushAndUpdateDeviceInfoWithBlock___block_invoke;
      v12[3] = &unk_1E692B128;
      id v13 = WeakRetained;
      v14 = self;
      dispatch_after(v10, v11, v12);
    }
  }
}

uint64_t __49__AudioDevice_flushAndUpdateDeviceInfoWithBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logEventForwardAudioDevice:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return [v2 setIsDirty:0];
}

- (BOOL)getAudioDeviceIsRunningSomewhere
{
  return 0;
}

- (float)getAudioDeviceVolume
{
  return 0.0;
}

- (BOOL)getAudioDeviceIsMute
{
  return 0;
}

- (unsigned)getAudioDeviceTransportType
{
  return 0;
}

- (unsigned)getAudioDeviceSource
{
  return 0;
}

- (void)cleanAndUpdateDeviceInfo
{
  [(AudioDevice *)self removeAudioDeviceListener];
  if ([(AudioDevice *)self updateDefaultAudioDeviceInfo])
  {
    [(AudioDevice *)self addAudioDeviceListener];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ctx);
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      if (self->_isInput) {
        [WeakRetained setDefaultInputDevice:0];
      }
      else {
        [WeakRetained setDefaultOutputDevice:0];
      }
      id WeakRetained = v4;
    }
  }
}

- (BOOL)updateDefaultAudioDeviceInfo
{
  return 1;
}

- (PLAudioAgent)ctx
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ctx);
  return (PLAudioAgent *)WeakRetained;
}

- (void)setCtx:(id)a3
{
}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unsigned int)a3
{
  self->_deviceID = a3;
}

- (unsigned)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(unsigned int)a3
{
  self->_sourceID = a3;
}

- (unsigned)transType
{
  return self->_transType;
}

- (void)setTransType:(unsigned int)a3
{
  self->_transType = a3;
}

- (BOOL)isInput
{
  return self->_isInput;
}

- (void)setIsInput:(BOOL)a3
{
  self->_isInput = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (id)audioPropertyHandlerBlock
{
  return self->_audioPropertyHandlerBlock;
}

- (void)setAudioPropertyHandlerBlock:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (NSDate)lastUpdateTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastUpdateTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong(&self->_audioPropertyHandlerBlock, 0);
  objc_destroyWeak((id *)&self->_ctx);
}

@end