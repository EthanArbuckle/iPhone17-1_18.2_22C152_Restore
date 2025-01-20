@interface PAEBaseCorrectorEffect
+ (id)getterAPI:(id)a3;
+ (id)keyframingAPI:(id)a3;
+ (id)setterAPI:(id)a3;
+ (id)temporalImageAPI:(id)a3;
+ (unint64_t)colorPrimaries:(id)a3;
- (BOOL)addParameters;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)hostIsFCP;
- (BOOL)hostIsMotion;
- (BOOL)isACEScctGammaCorrected;
- (BOOL)oscIsPublishable:(BOOL)a3;
- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7;
- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6;
- (BOOL)renderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6;
- (BOOL)variesOverTime;
- (PAEBaseCorrectorEffect)initWithAPIManager:(id)a3;
- (PROAPIAccessing)apiManager;
- (id)customChannelData:(id)a3 ofParamID:(unsigned int)a4 time:(id *)a5;
- (id)parameterCreationAPI;
- (id)properties;
- (id)versionsingAPI;
- (void)_resyncAtTime:(id *)a3 apiManager:(id)a4;
- (void)_resyncOnceAtTime:(id *)a3 apiManager:(id)a4;
- (void)dealloc;
- (void)newNodeForCorrector;
@end

@implementation PAEBaseCorrectorEffect

- (PAEBaseCorrectorEffect)initWithAPIManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAEBaseCorrectorEffect;
  v4 = [(PAEBaseCorrectorEffect *)&v6 init];
  if (v4)
  {
    v4->_apiManager = (PROAPIAccessing *)a3;
    v4->_resyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.paeft.effect", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_resyncMutex);
  pthread_cond_destroy(&self->_resyncCondition);
  dispatch_release((dispatch_object_t)self->_resyncQueue);
  resyncOnce = self->_resyncOnce;
  if (resyncOnce) {
    MEMORY[0x1BA9BFBA0](resyncOnce, 0x1000C4052888210);
  }
  actionCount = self->_actionCount;
  if (actionCount) {
    MEMORY[0x1BA9BFBA0](actionCount, 0x1000C4052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)PAEBaseCorrectorEffect;
  [(PAEBaseCorrectorEffect *)&v5 dealloc];
}

- (BOOL)hostIsFCP
{
  return self->_hostApplication == 1;
}

- (BOOL)hostIsMotion
{
  return self->_hostApplication == 2;
}

- (void)newNodeForCorrector
{
  return 0;
}

- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7
{
  return 0;
}

- (id)properties
{
  if (-[PAEBaseCorrectorEffect properties]::once != -1) {
    dispatch_once(&-[PAEBaseCorrectorEffect properties]::once, &__block_literal_global_26);
  }
  return (id)-[PAEBaseCorrectorEffect properties]::properties;
}

uint64_t __36__PAEBaseCorrectorEffect_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:3];
  uint64_t v4 = [NSNumber numberWithInt:6];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", @"PositionIndependent", MEMORY[0x1E4F1CC28], @"MayRemapTime", MEMORY[0x1E4F1CC38], @"SupportsLargeRenderScale", MEMORY[0x1E4F1CC38], @"SupportsHeliumRendering", v1, @"SDRWorkingSpace", v2, @"HDRWorkingSpace", v3, @"AutoColorProcessingSupport", v4, @"PixelTransformSupport", 0);
  -[PAEBaseCorrectorEffect properties]::properties = result;
  return result;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  return 0;
}

- (BOOL)oscIsPublishable:(BOOL)a3
{
  return 0;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3) {
    *a3 = a5->var0;
  }
  if (a4) {
    *a4 = a5->var1;
  }
  return 1;
}

- (void)_resyncOnceAtTime:(id *)a3 apiManager:(id)a4
{
  resyncOnce = (atomic_uint *)self->_resyncOnce;
  if ([(PAEBaseCorrectorEffect *)self hostIsFCP])
  {
    v8 = (void *)[a4 apiForProtocol:&unk_1F122C238];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = *(void *)"";
    v19[2] = __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke;
    v19[3] = &unk_1E616BA80;
    v19[4] = self;
    v19[5] = a4;
    v19[6] = resyncOnce;
    v19[7] = a3;
    [v8 performBlockWithinReadLock:v19];
  }
  else
  {
    v9 = pthread_self();
    mach_port_t v10 = pthread_mach_thread_np(v9);
    int v11 = 0;
    atomic_compare_exchange_strong(resyncOnce, (unsigned int *)&v11, v10);
    if (v11)
    {
      char v13 = atomic_load((unsigned int *)resyncOnce);
      if ((v13 & 3) != 0)
      {
        p_resyncMutex = &self->_resyncMutex;
        pthread_mutex_lock(&self->_resyncMutex);
        char v15 = atomic_load((unsigned int *)resyncOnce);
        if ((v15 & 3) != 0)
        {
          p_resyncCondition = &self->_resyncCondition;
          do
          {
            pthread_cond_wait(p_resyncCondition, p_resyncMutex);
            char v17 = atomic_load((unsigned int *)resyncOnce);
          }
          while ((v17 & 3) != 0);
        }
        pthread_mutex_unlock(p_resyncMutex);
      }
    }
    else
    {
      pthread_mutex_lock(&self->_resyncMutex);
      resyncQueue = self->_resyncQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = *(void *)"";
      block[2] = __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke_2;
      block[3] = &unk_1E616BAA8;
      block[4] = self;
      block[5] = a4;
      block[6] = a3;
      dispatch_sync(resyncQueue, block);
      atomic_fetch_and(resyncOnce, 0xFFFFFFFC);
      pthread_cond_broadcast(&self->_resyncCondition);
      pthread_mutex_unlock(&self->_resyncMutex);
    }
  }
}

uint64_t __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  uint64_t result = pthread_mach_thread_np(v2);
  int v4 = 0;
  atomic_compare_exchange_strong(*(atomic_uint *volatile *)(a1 + 48), (unsigned int *)&v4, result);
  if (!v4)
  {
    objc_super v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = **(void **)(a1 + 56);
    return [v5 resyncOnce:v6 atTime:v7];
  }
  return result;
}

uint64_t __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resyncOnce:*(void *)(a1 + 40) atTime:**(void **)(a1 + 48)];
}

- (void)_resyncAtTime:(id *)a3 apiManager:(id)a4
{
  if (atomic_load((unsigned int *)self->_actionCount)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a3->var1 == 0;
  }
  if (!v5)
  {
    if ([(PAEBaseCorrectorEffect *)self hostIsFCP])
    {
      v9 = (void *)[a4 apiForProtocol:&unk_1F122C238];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = *(void *)"";
      v11[2] = __51__PAEBaseCorrectorEffect__resyncAtTime_apiManager___block_invoke;
      v11[3] = &unk_1E616BAA8;
      v11[4] = self;
      v11[5] = a4;
      v11[6] = a3;
      [v9 performBlockWithinReadLock:v11];
    }
    else
    {
      var1 = a3->var1;
      [(PAEBaseCorrectorEffect *)self resync:a4 atTime:var1];
    }
  }
}

uint64_t __51__PAEBaseCorrectorEffect__resyncAtTime_apiManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resync:*(void *)(a1 + 40) atTime:**(void **)(a1 + 48)];
}

- (BOOL)renderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v21 = 0;
  }
  [(PAEBaseCorrectorEffect *)self _resyncOnceAtTime:a5 apiManager:self->_apiManager];
  [(PAEBaseCorrectorEffect *)self _resyncAtTime:a5 apiManager:self->_apiManager];
  apiManager = self->_apiManager;
  long long v10 = *(_OWORD *)&a5->var2;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v10;
  v20[2] = *(_OWORD *)&a5->var4;
  if ([(PAEBaseCorrectorEffect *)self overrideRender:apiManager withOutputImage:a3 inputImage:a4 input:v21 withInfo:v20])
  {
LABEL_11:
    BOOL v15 = 1;
    goto LABEL_12;
  }
  int v11 = [(PAEBaseCorrectorEffect *)self newNodeForCorrector];
  if (v11)
  {
    v12 = self->_apiManager;
    var1 = a5->var0.var1;
    if (!a5->var0.var1) {
      var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x1E4F1FA48];
    }
    uint64_t v14 = *((void *)var1 + 2);
    long long v18 = *(_OWORD *)var1;
    uint64_t v19 = v14;
    [(PAEBaseCorrectorEffect *)self setParameters:v12 onNodeCorrector:v11 time:&v18];
    (*(void (**)(void *, void, uint64_t))(*(void *)v11 + 120))(v11, 0, v21);
    (*(void (**)(void *))(*(void *)v11 + 16))(v11);
    char v17 = v11;
    [a3 setHeliumRef:&v17];
    if (v17) {
      (*(void (**)(void *))(*(void *)v17 + 24))(v17);
    }
    (*(void (**)(void *))(*(void *)v11 + 24))(v11);
    goto LABEL_11;
  }
  BOOL v15 = 0;
LABEL_12:
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
  }
  return v15;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  if (a6) {
    *a6 = 0;
  }
  if (a5) {
    *a5 = 1;
  }
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

- (id)customChannelData:(id)a3 ofParamID:(unsigned int)a4 time:(id *)a5
{
  uint64_t v6 = 0;
  [(PAEBaseCorrectorEffect *)self resync:a3 atTime:a5 paramID:*(void *)&a4 customChannelData:&v6];
  return v6;
}

- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6
{
  return 1;
}

- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6
{
  return 0;
}

- (PROAPIAccessing)apiManager
{
  uint64_t v2 = self->_apiManager;

  return v2;
}

- (id)parameterCreationAPI
{
  return (id)[(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F121A238];
}

- (id)versionsingAPI
{
  return (id)[(PROAPIAccessing *)self->_apiManager apiForProtocol:&unk_1F121E208];
}

+ (id)setterAPI:(id)a3
{
  return (id)[a3 apiForProtocol:&unk_1F121D2E0];
}

+ (id)getterAPI:(id)a3
{
  return (id)[a3 apiForProtocol:&unk_1F121D130];
}

+ (id)keyframingAPI:(id)a3
{
  return (id)[a3 apiForProtocol:&unk_1F122C1D8];
}

+ (id)temporalImageAPI:(id)a3
{
  return (id)[a3 apiForProtocol:&unk_1F1225E40];
}

+ (unint64_t)colorPrimaries:(id)a3
{
  uint64_t v3 = (void *)[a3 apiForProtocol:&unk_1F12189D0];

  return [v3 colorPrimaries];
}

- (BOOL)isACEScctGammaCorrected
{
  return 0;
}

@end