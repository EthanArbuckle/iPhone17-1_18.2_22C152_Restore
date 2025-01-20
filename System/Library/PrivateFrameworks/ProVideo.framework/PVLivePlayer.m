@interface PVLivePlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime;
- (BOOL)_dropFrameForFullQueue;
- (BOOL)_dropFrameForSaturatedPrimaryPlayer;
- (BOOL)bypassRenderLink;
- (BOOL)lowerGCDPriority;
- (BOOL)lowerGPUPriority;
- (BOOL)testOutOfOrderCompletion:(HGRef<PVRenderLinkJob>)a3;
- (BOOL)throttledBypassRenderLink;
- (PVColorSpace)outputColorSpace;
- (PVLivePlayer)initWithOptions:(id)a3 delegate:(id)a4;
- (PVLivePlayerRenderLink)renderLink;
- (PVLivePlayerThermalThrottlingPolicy)thermalThrottlingPolicy;
- (double)getWindowedFPS;
- (id).cxx_construct;
- (id)getTaskToken;
- (id)playerSources;
- (id)readSourceFrameSets:(double)a3;
- (int)status;
- (unint64_t)getPackedFamilyCode:(unsigned int)a3;
- (unsigned)_throttledQueueSize_NoLock;
- (unsigned)queueSize;
- (void)_notifyDelegateOfDroppedFrame:(int)a3;
- (void)_renderLinkSignal:(id *)a3;
- (void)_statsLogCheck;
- (void)addStats:(const void *)a3;
- (void)bypassRenderLink:(HGRef<PVRenderLinkJob>)a3;
- (void)dealloc;
- (void)flush;
- (void)handleRenderLinkJob:(HGRef<PVRenderLinkJob>)a3;
- (void)printAndClearStats:(BOOL)a3;
- (void)renderLinkJobFinished:(HGRef<PVRenderLinkJob>)a3;
- (void)renderLinkSignal:(id *)a3;
- (void)renderLinkSignalDropped;
- (void)renderLinkSignalSkipped;
- (void)resetRenderTime;
- (void)setBypassRenderLink:(BOOL)a3;
- (void)setLowerGCDPriority:(BOOL)a3;
- (void)setLowerGPUPriority:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutputColorSpace:(id)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPrimaryPlayer:(id)a3;
- (void)setQueueSize:(unsigned int)a3;
- (void)setRenderLink:(id)a3;
- (void)setSource:(id)a3 inputID:(unsigned int)a4;
- (void)setStatus:(int)a3;
- (void)setThermalThrottlingPolicy:(id)a3;
- (void)shutdown;
- (void)start;
- (void)stop;
- (void)trackStats:(BOOL)a3;
- (void)updateRenderQueueUnits;
@end

@implementation PVLivePlayer

- (PVLivePlayer)initWithOptions:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PVLivePlayer;
  if ([(PVLivePlayer *)&v9 init]) {
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  [(PVLivePlayer *)self printAndClearStats:1];
  if ([(PVLivePlayer *)self status] != 3)
  {
    NSLog(&cfstr_DeallocWithout.isa, self);
    [(PVLivePlayer *)self shutdown];
  }
  v3.receiver = self;
  v3.super_class = (Class)PVLivePlayer;
  [(PVLivePlayer *)&v3 dealloc];
}

- (void)setSource:(id)a3 inputID:(unsigned int)a4
{
  id v6 = a3;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __34__PVLivePlayer_setSource_inputID___block_invoke;
  block[3] = &unk_1E616B7E8;
  id v11 = v6;
  v12 = self;
  unsigned int v13 = a4;
  v8 = *(NSObject **)value;
  id v9 = v6;
  dispatch_sync(v8, block);
}

void __34__PVLivePlayer_setSource_inputID___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = (uint64_t **)(*(void *)(a1 + 40) + 16);
  v4 = (unsigned int *)(a1 + 48);
  if (v2)
  {
    id v6 = (_DWORD *)(a1 + 48);
    v5 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v3, v4, (uint64_t)&std::piecewise_construct, &v6);
    objc_storeStrong((id *)v5 + 5, v2);
  }
  else
  {
    std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__erase_unique<unsigned int>((uint64_t)v3, v4);
  }
}

- (id)playerSources
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  id v11 = __Block_byref_object_dispose__10;
  id v12 = (id)objc_opt_new();
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __29__PVLivePlayer_playerSources__block_invoke;
  v6[3] = &unk_1E6169850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__PVLivePlayer_playerSources__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  objc_super v3 = (void *)(v1 + 24);
  if (v2 != (void *)(v1 + 24))
  {
    do
    {
      uint64_t v5 = *((unsigned int *)v2 + 8);
      id v6 = (id)v2[5];
      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v8 = [NSNumber numberWithUnsignedInt:v5];
      [v7 setObject:v6 forKeyedSubscript:v8];

      uint64_t v9 = (void *)v2[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          uint64_t v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (void *)v2[2];
          BOOL v11 = *v10 == (void)v2;
          v2 = v10;
        }
        while (!v11);
      }
      v2 = v10;
    }
    while (v10 != v3);
  }
}

- (BOOL)throttledBypassRenderLink
{
  objc_super v3 = [(PVLivePlayer *)self thermalThrottlingPolicy];

  if (!v3)
  {
    uint64_t v5 = 0;
LABEL_6:
    char v8 = [(PVLivePlayer *)self bypassRenderLink];
    goto LABEL_7;
  }
  id v4 = [(PVLivePlayer *)self thermalThrottlingPolicy];
  uint64_t v5 = [v4 populatedControlParametersForCurrentThermalLevel];

  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [v5 playerBypassRenderLink];

  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = [v5 playerBypassRenderLink];
  char v8 = [v7 BOOLValue];

LABEL_7:
  return v8;
}

- (void)setQueueSize:(unsigned int)a3
{
}

- (unsigned)queueSize
{
  return atomic_load(&self->_queueSize);
}

- (void)updateRenderQueueUnits
{
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __38__PVLivePlayer_updateRenderQueueUnits__block_invoke;
  block[3] = &unk_1E61689B0;
  void block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

uint64_t __38__PVLivePlayer_updateRenderQueueUnits__block_invoke(uint64_t a1)
{
  v2 = *(_DWORD **)(a1 + 32);
  unsigned int v3 = v2[20];
  uint64_t result = [v2 queueSize];
  if (v3 < result) {
    HGRenderQueue::AddUserJobQueue(*(HGRenderQueue **)(*(void *)(a1 + 32) + 72));
  }
  return result;
}

- (unsigned)_throttledQueueSize_NoLock
{
  unsigned int v3 = [(PVLivePlayer *)self queueSize];
  id v4 = [(PVLivePlayer *)self thermalThrottlingPolicy];

  if (v4)
  {
    uint64_t v5 = [(PVLivePlayer *)self thermalThrottlingPolicy];
    id v6 = [v5 populatedControlParametersForCurrentThermalLevel];

    uint64_t v7 = [v6 playerQueueSize];

    if (v7)
    {
      char v8 = [v6 playerQueueSize];
      unsigned int v3 = [v8 unsignedIntegerValue];
    }
  }
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  uint64_t v7 = 0;
  char v8 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v7;
  uint64_t v9 = 0x4812000000;
  v10 = __Block_byref_object_copy__9;
  BOOL v11 = __Block_byref_object_dispose__10;
  id v12 = &unk_1B876C866;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __26__PVLivePlayer_renderTime__block_invoke;
  block[3] = &unk_1E6169380;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  *retstr = v8[2];
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __26__PVLivePlayer_renderTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(v1 + 88);
  v2[4].n128_u64[0] = *(void *)(v1 + 104);
  v2[3] = result;
  return result;
}

- (void)resetRenderTime
{
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __31__PVLivePlayer_resetRenderTime__block_invoke;
  block[3] = &unk_1E61689B0;
  void block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

__n128 __31__PVLivePlayer_resetRenderTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = MEMORY[0x1E4F1FA48];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)(v1 + 88) = *MEMORY[0x1E4F1FA48];
  *(void *)(v1 + 104) = *(void *)(v2 + 16);
  atomic_store(0, (unsigned int *)(*(void *)(a1 + 32) + 152));
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
  return result;
}

- (void)start
{
  if ([(PVLivePlayer *)self status] != 3)
  {
    atomic_store(1u, (unsigned int *)&self->_playerStatus);
    value = self->_statLogTimer.__ptr_.__value_;
    PerfTimer::Start(value);
  }
}

- (void)stop
{
  if ([(PVLivePlayer *)self status] != 3)
  {
    atomic_store(0, (unsigned int *)&self->_playerStatus);
    [(PVLivePlayer *)self printAndClearStats:1];
  }
}

- (void)shutdown
{
  if ([(PVLivePlayer *)self status] != 3)
  {
    atomic_store(3u, (unsigned int *)&self->_playerStatus);
    [(PVLivePlayerRenderLink *)self->_renderLink registerWithPlayer:0];
    [(PVLivePlayerRenderLink *)self->_renderLink teardown];
    HGRenderQueue::Pause(self->_playerQueue.m_Obj);
    HGRenderQueue::CancelAllRenderJobs(self->_playerQueue.m_Obj, 1);
    HGRenderQueue::CancelUserJobs(self->_playerQueue.m_Obj, 1);
    HGRenderQueue::Drain(self->_playerQueue.m_Obj);
    m_Obj = self->_playerQueue.m_Obj;
    HGRenderQueue::Shutdown(m_Obj);
  }
}

- (void)flush
{
  HGRenderQueue::Pause(self->_playerQueue.m_Obj);
  HGRenderQueue::CancelAllRenderJobs(self->_playerQueue.m_Obj, 1);
  HGRenderQueue::CancelUserJobs(self->_playerQueue.m_Obj, 1);
  [(PVRendererBase *)self->_renderer cancelAllPendingRequests];
  +[PVEffectResources flushEngine];
  m_Obj = self->_playerQueue.m_Obj;

  HGRenderQueue::Restart(m_Obj);
}

- (int)status
{
  return atomic_load((unsigned int *)&self->_playerStatus);
}

- (void)setStatus:(int)a3
{
}

- (void)setOutputColorSpace:(id)a3
{
}

- (PVColorSpace)outputColorSpace
{
  uint64_t v2 = [(PVRendererBase *)self->_renderer compositingContext];
  unsigned int v3 = [v2 outputColorSpace];

  return (PVColorSpace *)v3;
}

- (void)setPrimaryPlayer:(id)a3
{
  id v4 = a3;
  value = self->_lock.__ptr_.__value_;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __33__PVLivePlayer_setPrimaryPlayer___block_invoke;
  v8[3] = &unk_1E61689D8;
  v8[4] = self;
  id v9 = v4;
  id v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __33__PVLivePlayer_setPrimaryPlayer___block_invoke(uint64_t a1)
{
}

- (void)setName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSString *)[v4 copy];
  name = self->_name;
  self->_name = v5;

  id v7 = [(NSString *)self->_name stringByAppendingString:@"_Renderer"];
  [(PVRendererBase *)self->_renderer setName:v7];

  value = self->_perfStatsLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __24__PVLivePlayer_setName___block_invoke;
  block[3] = &unk_1E61689B0;
  void block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

void __24__PVLivePlayer_setName___block_invoke(uint64_t a1)
{
}

- (void)setParentCode:(unsigned int)a3
{
  value = self->_lock.__ptr_.__value_;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __30__PVLivePlayer_setParentCode___block_invoke;
  v4[3] = &unk_1E616B810;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(*(dispatch_queue_t *)value, v4);
}

void __30__PVLivePlayer_setParentCode___block_invoke(uint64_t a1)
{
  atomic_store(*(_DWORD *)(a1 + 40), (unsigned int *)(*(void *)(a1 + 32) + 168));
  uint64_t v2 = [PVTaskTokenPool alloc];
  uint64_t v3 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 168));
  uint64_t v4 = [(PVTaskTokenPool *)v2 initWithOffset:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v4;
}

- (unint64_t)getPackedFamilyCode:(unsigned int)a3
{
  uint64_t v3 = atomic_load(&self->_parentCode);
  return a3 | (unint64_t)(v3 << 32);
}

- (id)getTaskToken
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  value = self->_lock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __28__PVLivePlayer_getTaskToken__block_invoke;
  v5[3] = &unk_1E6169380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__PVLivePlayer_getTaskToken__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) getToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setRenderLink:(id)a3
{
  id v4 = a3;
  value = self->_lock.__ptr_.__value_;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __30__PVLivePlayer_setRenderLink___block_invoke;
  v8[3] = &unk_1E61689D8;
  v8[4] = self;
  id v9 = v4;
  uint64_t v6 = *(NSObject **)value;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __30__PVLivePlayer_setRenderLink___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 216);
  if (v3)
  {
    [v3 registerWithPlayer:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 216), *(id *)(a1 + 40));
  id v4 = *(void **)(*(void *)(a1 + 32) + 216);

  return objc_msgSend(v4, "registerWithPlayer:");
}

- (void)renderLinkSignalDropped
{
  [(PVLivePlayer *)self getPackedFamilyCode:0];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v2) >= 1)
  {
    kdebug_trace();
  }
}

- (void)renderLinkSignalSkipped
{
  if ([(PVLivePlayer *)self status])
  {
    [(PVLivePlayer *)self getPackedFamilyCode:0];
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v3) >= 1)
    {
      kdebug_trace();
    }
  }
}

- (void)renderLinkSignal:(id *)a3
{
  if ([(PVLivePlayer *)self status])
  {
    [(PVLivePlayer *)self getPackedFamilyCode:0];
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1) {
      kdebug_trace();
    }
    uint64_t v12 = 0;
    unsigned int v13 = &v12;
    uint64_t v14 = 0x4812000000;
    v15 = __Block_byref_object_copy__9;
    v16 = __Block_byref_object_dispose__10;
    v17 = &unk_1B876C866;
    value = self->_lock.__ptr_.__value_;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = *(void *)"";
    block[2] = __33__PVLivePlayer_renderLinkSignal___block_invoke;
    block[3] = &unk_1E616B838;
    long long v10 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    void block[4] = self;
    void block[5] = &v12;
    dispatch_sync(*(dispatch_queue_t *)value, block);
    long long v7 = *((_OWORD *)v13 + 3);
    uint64_t v8 = v13[8];
    [(PVLivePlayer *)self _renderLinkSignal:&v7];
    [(PVLivePlayer *)self _statsLogCheck];
    _Block_object_dispose(&v12, 8);
  }
}

__n128 __33__PVLivePlayer_renderLinkSignal___block_invoke(__n128 *a1)
{
  unint64_t v2 = a1[2].n128_u64[0];
  uint64_t v3 = a1 + 3;
  if (*(unsigned char *)(v2 + 136))
  {
    *(__n128 *)&lhs.value = *v3;
    lhs.epoch = a1[4].n128_i64[0];
    CMTime rhs = *(CMTime *)(v2 + 112);
    CMTimeSubtract(&v15, &lhs, &rhs);
  }
  else
  {
    __n128 v4 = *v3;
    *(void *)(v2 + 128) = a1[4].n128_u64[0];
    *(__n128 *)(v2 + 112) = v4;
    *(unsigned char *)(a1[2].n128_u64[0] + 136) = 1;
    CMTime v15 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  CMTime v11 = *(CMTime *)(a1[2].n128_u64[0] + 88);
  CMTime v10 = v15;
  CMTimeAdd(&v12, &v11, &v10);
  *(CMTime *)(a1[2].n128_u64[0] + 88) = v12;
  unint64_t v5 = a1[2].n128_u64[0];
  uint64_t v6 = *(void *)(a1[2].n128_u64[1] + 8);
  uint64_t v7 = *(void *)(v5 + 104);
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v5 + 88);
  *(void *)(v6 + 64) = v7;
  uint64_t v8 = (__n128 *)a1[2].n128_u64[0];
  __n128 result = a1[3];
  v8[8].n128_u64[0] = a1[4].n128_u64[0];
  v8[7] = result;
  return result;
}

- (void)_renderLinkSignal:(id *)a3
{
  if ([(PVLivePlayer *)self status] != 3
    && ![(PVLivePlayer *)self _dropFrameForSaturatedPrimaryPlayer]
    && ![(PVLivePlayer *)self _dropFrameForFullQueue])
  {
    unint64_t v5 = [(PVLivePlayer *)self getTaskToken];
    double v6 = CACurrentMediaTime();
    uint64_t v7 = (char *)HGObject::operator new(0xD0uLL);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
    PVRenderLinkJob::PVRenderLinkJob((PVRenderLinkJob *)v7, self, (CMTime *)&v10, v6, v5);
    FrameStatsDescription = (uint64_t (***)(void))PVPerfStats::GetFrameStatsDescription(self->_perfStats.__ptr_.__value_);
    int v9 = (**FrameStatsDescription)(FrameStatsDescription);
    PVPerfStats::FrameStats::Init((PVPerfStats::FrameStats *)(v7 + 120), v9, atomic_fetch_add((atomic_uint *volatile)&self->_frameCount, 1u));
    HGRenderQueue::EnqueueUserJob(self->_playerQueue.m_Obj, (HGUserJob *)v7);
    if (v7) {
      (*(void (**)(char *))(*(void *)v7 + 24))(v7);
    }
  }
}

- (BOOL)_dropFrameForSaturatedPrimaryPlayer
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __51__PVLivePlayer__dropFrameForSaturatedPrimaryPlayer__block_invoke;
  v6[3] = &unk_1E6169850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  if (*((unsigned char *)v8 + 24))
  {
    [(PVLivePlayer *)self _notifyDelegateOfDroppedFrame:1];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__51__PVLivePlayer__dropFrameForSaturatedPrimaryPlayer__block_invoke(uint64_t a1)
{
  __n128 result = *(void **)(*(void *)(a1 + 32) + 64);
  if (result)
  {
    __n128 result = (void *)[result status];
    if (result == 2)
    {
      [*(id *)(a1 + 32) getPackedFamilyCode:0];
      __n128 result = (void *)HGLogger::getLevel((HGLogger *)"PVSignPost", v3);
      if ((int)result >= 1) {
        __n128 result = (void *)kdebug_trace();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)_dropFrameForFullQueue
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __38__PVLivePlayer__dropFrameForFullQueue__block_invoke;
  v6[3] = &unk_1E6169850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  if (*((unsigned char *)v8 + 24))
  {
    [(PVLivePlayer *)self _notifyDelegateOfDroppedFrame:0];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __38__PVLivePlayer__dropFrameForFullQueue__block_invoke(uint64_t a1)
{
  unsigned int v2 = objc_msgSend(*(id *)(a1 + 32), "_throttledQueueSize_NoLock");
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = *(_DWORD *)(v3 + 84);
  if (v4 >= v2)
  {
    [*(id *)(a1 + 32) getPackedFamilyCode:0];
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1) {
      kdebug_trace();
    }
    uint64_t result = [*(id *)(a1 + 32) setStatus:2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_DWORD *)(v3 + 84) = v4 + 1;
    if (*(_DWORD *)(*(void *)(a1 + 32) + 84) >= v2)
    {
      unint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = 2;
    }
    else
    {
      unint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = 1;
    }
    return [v5 setStatus:v6];
  }
  return result;
}

- (void)_notifyDelegateOfDroppedFrame:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [(PVLivePlayer *)self readSourceFrameSets:CACurrentMediaTime()];
    [(PVLivePlayer *)self renderTime];
    [WeakRetained livePlayerDroppedFrame:v3 sources:v6 time:v7];
  }
}

- (id)readSourceFrameSets:(double)a3
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  CMTime v12 = __Block_byref_object_copy__10;
  unsigned int v13 = __Block_byref_object_dispose__10;
  id v14 = (id)objc_opt_new();
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __36__PVLivePlayer_readSourceFrameSets___block_invoke;
  block[3] = &unk_1E616B860;
  void block[4] = self;
  void block[5] = &v9;
  *(double *)&void block[6] = a3;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__PVLivePlayer_readSourceFrameSets___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = *(void **)(v1 + 16);
  if (v2 != (void *)(v1 + 24))
  {
    do
    {
      uint64_t v4 = *((unsigned int *)v2 + 8);
      id v5 = (id)v2[5];
      id v6 = [v5 imageBufferForHostTime:*(double *)(a1 + 48)];
      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];
      [v7 setObject:v6 forKeyedSubscript:v8];

      uint64_t v9 = (void *)v2[1];
      if (v9)
      {
        do
        {
          char v10 = v9;
          uint64_t v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          char v10 = (void *)v2[2];
          BOOL v11 = *v10 == (void)v2;
          unsigned int v2 = v10;
        }
        while (!v11);
      }
      unsigned int v2 = v10;
    }
    while (v10 != (void *)(*(void *)(a1 + 32) + 24));
  }
}

- (void)handleRenderLinkJob:(HGRef<PVRenderLinkJob>)a3
{
  if (HGGLBlendingInfo::GetRGBOperation(*(HGGLBlendingInfo **)a3.var0) == 4)
  {
    uint64_t v29 = *(void *)a3.var0;
    if (v29) {
      (*(void (**)(uint64_t))(*(void *)v29 + 16))(v29);
    }
    [(PVLivePlayer *)self renderLinkJobFinished:&v29];
    if (v29) {
      (*(void (**)(uint64_t))(*(void *)v29 + 24))(v29);
    }
  }
  else
  {
    PerfTimer::PerfTimer(&v28);
    unint64_t v5 = -[PVLivePlayer getPackedFamilyCode:](self, "getPackedFamilyCode:", [*(id *)(*(void *)a3.var0 + 112) tokenId]);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1) {
      kdebug_trace();
    }
    uint64_t v7 = [(PVLivePlayer *)self readSourceFrameSets:*(double *)(*(void *)a3.var0 + 104)];
    uint64_t v8 = *(void *)a3.var0;
    double v9 = PerfTimer::End(&v28);
    PVPerfStats::FrameStats::SetValueForIndex(v8 + 120, 0, v9);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDelegate);
    if (WeakRetained)
    {
      PerfTimer::PerfTimer(&v26);
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1) {
        kdebug_trace();
      }
      uint64_t v12 = *(void *)a3.var0;
      long long v24 = *(_OWORD *)(*(void *)a3.var0 + 80);
      uint64_t v25 = *(void *)(v12 + 96);
      unsigned int v13 = [WeakRetained buildRenderRequest:v7 time:&v24];
      if ([(PVLivePlayer *)self lowerGCDPriority]) {
        [v13 setGcdPriority:0];
      }
      if ([(PVLivePlayer *)self lowerGPUPriority]) {
        [v13 setGpuPriority:0];
      }
      [v13 setParentCode:HIDWORD(v5)];
      [v13 setChildCode:v5];
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v14) >= 1) {
        kdebug_trace();
      }
      uint64_t v15 = *(void *)a3.var0;
      double v16 = PerfTimer::End(&v26);
      PVPerfStats::FrameStats::SetValueForIndex(v15 + 120, 1u, v16);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x4012000000;
      v22[3] = __Block_byref_object_copy__19;
      v22[4] = __Block_byref_object_dispose__20;
      v22[5] = &unk_1B876C866;
      PerfTimer::PerfTimer(&v23);
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v17) >= 1) {
        kdebug_trace();
      }
      renderer = self->_renderer;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3321888768;
      v20[2] = __36__PVLivePlayer_handleRenderLinkJob___block_invoke;
      v20[3] = &unk_1F108A0A8;
      uint64_t v19 = *(void *)a3.var0;
      v20[6] = v5;
      uint64_t v21 = v19;
      if (v19) {
        (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
      }
      v20[4] = self;
      v20[5] = v22;
      [(PVRenderer *)renderer startRenderRequest:v13 completionHandler:v20];
      if (v21) {
        (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
      }
      _Block_object_dispose(v22, 8);
    }
    else
    {
      uint64_t v27 = *(void *)a3.var0;
      if (v27) {
        (*(void (**)(uint64_t))(*(void *)v27 + 16))(v27);
      }
      [(PVLivePlayer *)self renderLinkJobFinished:&v27];
      if (v27) {
        (*(void (**)(uint64_t))(*(void *)v27 + 24))(v27);
      }
    }
  }
}

void __36__PVLivePlayer_handleRenderLinkJob___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1) {
    kdebug_trace();
  }
  uint64_t v8 = a1[7];
  double v9 = PerfTimer::End((PerfTimer *)(*(void *)(a1[5] + 8) + 48));
  PVPerfStats::FrameStats::SetValueForIndex(v8 + 120, 2u, v9);
  char v10 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __36__PVLivePlayer_handleRenderLinkJob___block_invoke_2;
  block[3] = &unk_1F108A070;
  uint64_t v11 = a1[7];
  void block[4] = a1[4];
  uint64_t v17 = v11;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 16))(v11);
  }
  uint64_t v18 = a1[6];
  id v12 = v6;
  id v15 = v12;
  id v13 = v5;
  id v16 = v13;
  dispatch_async(v10, block);

  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
  }
}

void __36__PVLivePlayer_handleRenderLinkJob___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  if (WeakRetained)
  {
    PerfTimer::PerfTimer(&v21);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v3) >= 1) {
      kdebug_trace();
    }
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v20 = v5;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    }
    uint64_t v7 = [v4 testOutOfOrderCompletion:&v20];
    if (v20) {
      (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
    }
    if (v7 && (int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1) {
      kdebug_trace();
    }
    [WeakRetained renderRequestComplete:*(void *)(a1 + 40) results:*(void *)(a1 + 48) completedOutOfOrder:v7];
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v8) >= 1) {
      kdebug_trace();
    }
    uint64_t v9 = *(void *)(a1 + 56);
    double v10 = PerfTimer::End(&v21);
    PVPerfStats::FrameStats::SetValueForIndex(v9 + 120, 3u, v10);
    double v11 = PVPerfStats::FrameStats::MarkEndTimeForIndex((PVPerfStats::FrameStats *)(*(void *)(a1 + 56) + 120), 4u);
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v19 = v13;
    if (v13) {
      (*(void (**)(uint64_t, double))(*(void *)v13 + 16))(v13, v11);
    }
    objc_msgSend(v12, "renderLinkJobFinished:", &v19, v11);
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 24))(v19);
    }
    [*(id *)(a1 + 32) addStats:*(void *)(a1 + 56) + 120];
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v18 = v15;
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 16))(v15);
    }
    [v14 bypassRenderLink:&v18];
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 24))(v18);
    }
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v22 = v17;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 16))(v17);
    }
    [v16 renderLinkJobFinished:&v22];
    if (v22) {
      (*(void (**)(uint64_t))(*(void *)v22 + 24))(v22);
    }
  }
}

- (BOOL)testOutOfOrderCompletion:(HGRef<PVRenderLinkJob>)a3
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __41__PVLivePlayer_testOutOfOrderCompletion___block_invoke;
  block[3] = &unk_1F108A0E0;
  uint64_t v5 = *(void *)a3.var0;
  uint64_t v9 = v5;
  if (v5) {
    (*(void (**)(uint64_t, SEL))(*(void *)v5 + 16))(v5, a2);
  }
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  int v6 = *((unsigned __int8 *)v11 + 24);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  _Block_object_dispose(&v10, 8);
  return v6 != 0;
}

void *__41__PVLivePlayer_testOutOfOrderCompletion___block_invoke(void *result)
{
  double v1 = *(double *)(result[6] + 104);
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v1 < *(double *)(result[4] + 144);
  *(double *)(result[4] + 144) = v1;
  return result;
}

- (void)renderLinkJobFinished:(HGRef<PVRenderLinkJob>)a3
{
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __38__PVLivePlayer_renderLinkJobFinished___block_invoke;
  v6[3] = &unk_1F108A118;
  uint64_t v5 = *(void *)a3.var0;
  v6[4] = self;
  uint64_t v7 = v5;
  if (v5) {
    (*(void (**)(uint64_t, SEL))(*(void *)v5 + 16))(v5, a2);
  }
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  }
}

uint64_t __38__PVLivePlayer_renderLinkJobFinished___block_invoke(uint64_t a1)
{
  --*(_DWORD *)(*(void *)(a1 + 32) + 84);
  if ([*(id *)(a1 + 32) status] != 3) {
    [*(id *)(a1 + 32) setStatus:1];
  }
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 176);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 112);

  return [v2 returnToken:v3];
}

- (void)bypassRenderLink:(HGRef<PVRenderLinkJob>)a3
{
  if ([(PVLivePlayer *)self throttledBypassRenderLink])
  {
    if ([(PVLivePlayer *)self _throttledQueueSize_NoLock] == 1)
    {
      memset(&v9, 0, sizeof(v9));
      [(PVLivePlayer *)self renderTime];
      CMTime time1 = v9;
      CMTime time2 = *(CMTime *)(*(void *)a3.var0 + 80);
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1)
        {
          [(PVLivePlayer *)self getPackedFamilyCode:0];
          kdebug_trace();
        }
        CMTime v6 = v9;
        [(PVLivePlayer *)self _renderLinkSignal:&v6];
      }
    }
  }
}

- (void)trackStats:(BOOL)a3
{
  value = self->_perfStatsLock.__ptr_.__value_;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __27__PVLivePlayer_trackStats___block_invoke;
  v4[3] = &unk_1E61692B0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(*(dispatch_queue_t *)value, v4);
}

uint64_t __27__PVLivePlayer_trackStats___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 208) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 40) trackStats:*(unsigned __int8 *)(a1 + 40)];
}

- (void)addStats:(const void *)a3
{
  if (PVPerfStats::FrameStats::GetSize((PVPerfStats::FrameStats *)a3))
  {
    value = self->_perfStatsLock.__ptr_.__value_;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = *(void *)"";
    v6[2] = __25__PVLivePlayer_addStats___block_invoke;
    v6[3] = &unk_1E616B888;
    v6[4] = self;
    void v6[5] = a3;
    dispatch_sync(*(dispatch_queue_t *)value, v6);
  }
}

void __25__PVLivePlayer_addStats___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 208)) {
    PVPerfStats::AddFrameStats(*(PVPerfStats **)(v1 + 200), *(const PVPerfStats::FrameStats **)(a1 + 40));
  }
}

- (void)printAndClearStats:(BOOL)a3
{
  {
    __cxa_atexit((void (*)(void *))std::unique_ptr<PVGCDLock>::~unique_ptr[abi:ne180100], &-[PVLivePlayer printAndClearStats:]::sSerialLogLock, &dword_1B73F3000);
  }
  if (-[PVLivePlayer printAndClearStats:]::onceToken != -1) {
    dispatch_once(&-[PVLivePlayer printAndClearStats:]::onceToken, &__block_literal_global_18);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __35__PVLivePlayer_printAndClearStats___block_invoke_2;
  v5[3] = &unk_1E61692B0;
  v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync(*(dispatch_queue_t *)-[PVLivePlayer printAndClearStats:]::sSerialLogLock, v5);
  PerfTimer::Start(self->_statLogTimer.__ptr_.__value_);
}

void __35__PVLivePlayer_printAndClearStats___block_invoke()
{
}

void __35__PVLivePlayer_printAndClearStats___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = *(dispatch_queue_t **)(v1 + 192);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __35__PVLivePlayer_printAndClearStats___block_invoke_3;
  v3[3] = &unk_1E61692B0;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  dispatch_sync(*v2, v3);
}

void __35__PVLivePlayer_printAndClearStats___block_invoke_3(uint64_t a1)
{
  PVPerfStats::Print(*(PVPerfStats **)(*(void *)(a1 + 32) + 200), 0, 1);
  if (*(unsigned char *)(a1 + 40))
  {
    unsigned int v2 = *(PVPerfStats **)(*(void *)(a1 + 32) + 200);
    PVPerfStats::Reset(v2);
  }
}

- (void)_statsLogCheck
{
  if (PerfTimer::End(self->_statLogTimer.__ptr_.__value_) > 5.0)
  {
    [(PVLivePlayer *)self printAndClearStats:1];
  }
}

- (double)getWindowedFPS
{
  return PVPerfStats::WindowedFPS(self->_perfStats.__ptr_.__value_);
}

- (PVLivePlayerRenderLink)renderLink
{
  return self->_renderLink;
}

- (PVLivePlayerThermalThrottlingPolicy)thermalThrottlingPolicy
{
  return self->_thermalThrottlingPolicy;
}

- (void)setThermalThrottlingPolicy:(id)a3
{
}

- (BOOL)lowerGCDPriority
{
  return self->_lowerGCDPriority;
}

- (void)setLowerGCDPriority:(BOOL)a3
{
  self->_lowerGCDPriority = a3;
}

- (BOOL)lowerGPUPriority
{
  return self->_lowerGPUPriority;
}

- (void)setLowerGPUPriority:(BOOL)a3
{
  self->_lowerGPUPriority = a3;
}

- (BOOL)bypassRenderLink
{
  return self->_bypassRenderLink;
}

- (void)setBypassRenderLink:(BOOL)a3
{
  self->_bypassRenderLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalThrottlingPolicy, 0);
  objc_storeStrong((id *)&self->_renderLink, 0);
  std::unique_ptr<PVPerfStats>::reset[abi:ne180100](&self->_perfStats.__ptr_.__value_, 0);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_perfStatsLock, 0);
  value = self->_statLogTimer.__ptr_.__value_;
  self->_statLogTimer.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x1BA9BFBA0](value, 0x1000C40451B5BE8);
  }
  objc_storeStrong((id *)&self->_tokenPool, 0);
  objc_storeStrong((id *)&self->_name, 0);
  m_Obj = self->_playerQueue.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGRenderQueue *))(*(void *)m_Obj + 24))(m_Obj);
  }
  objc_storeStrong((id *)&self->_primaryPlayer, 0);
  objc_destroyWeak((id *)&self->_weakDelegate);
  objc_storeStrong((id *)&self->_renderer, 0);
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::destroy((uint64_t)&self->_sourceMap, (void *)self->_sourceMap.__tree_.__pair1_.__value_.__left_);

  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_lock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = (char *)self + 24;
  *((void *)self + 9) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 23) = 0;
  return self;
}

@end