@interface PVEffectScheduler
- (BOOL)loadTimeIsNearEnd:(id *)a3;
- (BOOL)previousLoadedIteratorIsLastInList;
- (PVEffectScheduler)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)loadEffects:(id *)a3 playerRate:(float)a4;
- (void)releaseAllUnusedEffects:(id *)a3;
- (void)resetSchedule:(id)a3;
- (void)resetSearchPoint;
- (void)setEffectLoadingRenderContext:(HGRef<PVInstructionGraphContext>)a3;
- (void)setIsExporting:(BOOL)a3;
- (void)unloadInstructionFromPreviousSchedule;
@end

@implementation PVEffectScheduler

- (PVEffectScheduler)init
{
  v7.receiver = self;
  v7.super_class = (Class)PVEffectScheduler;
  v2 = [(PVEffectScheduler *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ProVideo.EffectScheduler", 0);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&v2->_endTime.value = *MEMORY[0x1E4F1FA48];
    v2->_endTime.epoch = *(void *)(v5 + 16);
    *(_WORD *)&v2->_loadedFinalInstructions = 0;
    atomic_store(0, (unsigned __int8 *)&v2->_isScheduling);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  begin_node = (PVEffectScheduler *)self->_effectSchedule.__tree_.__begin_node_;
  p_pair1 = &self->_effectSchedule.__tree_.__pair1_;
  if (begin_node != (PVEffectScheduler *)&self->_effectSchedule.__tree_.__pair1_)
  {
    do
    {
      uint64_t v5 = (id *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
      if (*((unsigned char *)v5 + 12))
      {
        [v5[2] unloadInstructionGraphNodes];
        *((unsigned char *)v5 + 12) = 0;
      }
      isa = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PVEffectScheduler *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__pair1_.__value_.__left_;
          BOOL v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (PVEffectScheduler *)p_pair1);
  }
  effectScheduleLock = self->_effectScheduleLock;
  if (effectScheduleLock) {
    (*((void (**)(HGSynchronizable *, SEL))effectScheduleLock->var0 + 1))(effectScheduleLock, a2);
  }
  v10.receiver = self;
  v10.super_class = (Class)PVEffectScheduler;
  [(PVEffectScheduler *)&v10 dealloc];
}

- (void)resetSchedule:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  effectScheduleLock = self->_effectScheduleLock;
  char v28 = 0;
  HGSynchronizable::Lock(effectScheduleLock);
  begin_node = (uint64_t *)self->_effectSchedule.__tree_.__begin_node_;
  p_pair1 = &self->_effectSchedule.__tree_.__pair1_;
  if (begin_node != (uint64_t *)&self->_effectSchedule.__tree_.__pair1_)
  {
    do
    {
      std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::__emplace_unique_key_args<HGRef<LoadableInstruction>,HGRef<LoadableInstruction> const&>((uint64_t **)&self->_previousScheduleToUnload, begin_node + 4, begin_node + 4);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)begin_node[1];
      if (left)
      {
        do
        {
          objc_super v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          objc_super v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)begin_node[2];
          BOOL v8 = v7->__value_.__left_ == begin_node;
          begin_node = (uint64_t *)v7;
        }
        while (!v8);
      }
      begin_node = (uint64_t *)v7;
    }
    while (v7 != p_pair1);
  }
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)&self->_effectSchedule, (void *)self->_effectSchedule.__tree_.__pair1_.__value_.__left_);
  self->_effectSchedule.__tree_.__pair1_.__value_.__left_ = 0;
  self->_effectSchedule.__tree_.__pair3_.__value_ = 0;
  self->_effectSchedule.__tree_.__begin_node_ = p_pair1;
  self->_lastLoadedEffectSetIterator.__ptr_ = p_pair1;
  self->_loadedFinalInstructions = 0;
  [v16 instructions];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    p_endTime = &self->_endTime;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = *(PVVideoCompositionInstruction **)(*((void *)&v23 + 1) + 8 * i);
        if (v14) {
          [*(id *)(*((void *)&v23 + 1) + 8 * i) timeRange];
        }
        else {
          memset(v21, 0, sizeof(v21));
        }
        CMTime time = v21[1];
        if (CMTimeGetSeconds(&time) > 0.0)
        {
          v15 = (LoadableInstruction *)HGObject::operator new(0xB0uLL);
          LoadableInstruction::LoadableInstruction(v15, v14, self->_isExporting);
          v20 = v15;
          std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::__emplace_unique_key_args<HGRef<LoadableInstruction>,HGRef<LoadableInstruction> const&>((uint64_t **)&self->_effectSchedule, (uint64_t *)&v20, (uint64_t *)&v20);
          memset(v21, 0, 24);
          if (v14) {
            [(PVVideoCompositionInstruction *)v14 timeRange];
          }
          else {
            memset(&range, 0, sizeof(range));
          }
          CMTimeRangeGetEnd(v21, &range);
          *(_OWORD *)&time1.value = *(_OWORD *)&p_endTime->value;
          time1.epoch = self->_endTime.epoch;
          CMTime time2 = v21[0];
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            *(_OWORD *)&p_endTime->value = *(_OWORD *)&v21[0].value;
            self->_endTime.epoch = v21[0].epoch;
          }
          if (v20) {
            (*(void (**)(LoadableInstruction *))(*(void *)v20 + 24))(v20);
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  HGSynchronizer::~HGSynchronizer(&effectScheduleLock);
}

- (void)resetSearchPoint
{
  loadQueue = self->_loadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __37__PVEffectScheduler_resetSearchPoint__block_invoke;
  block[3] = &unk_1E61689B0;
  block[4] = self;
  dispatch_async(loadQueue, block);
}

uint64_t __37__PVEffectScheduler_resetSearchPoint__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setEffectLoadingRenderContext:(HGRef<PVInstructionGraphContext>)a3
{
  effectScheduleLock = self->_effectScheduleLock;
  char v8 = 0;
  HGSynchronizable::Lock(effectScheduleLock);
  m_Obj = self->_effectLoadRenderContext.m_Obj;
  v6 = *(PVInstructionGraphContext **)a3.m_Obj;
  if (m_Obj != *(PVInstructionGraphContext **)a3.m_Obj)
  {
    if (m_Obj)
    {
      (*(void (**)(PVInstructionGraphContext *))(*(void *)m_Obj + 24))(self->_effectLoadRenderContext.m_Obj);
      v6 = *(PVInstructionGraphContext **)a3.m_Obj;
    }
    self->_effectLoadRenderContext.m_Obj = v6;
    if (v6) {
      (*(void (**)(PVInstructionGraphContext *))(*(void *)v6 + 16))(v6);
    }
  }
  HGSynchronizer::~HGSynchronizer(&effectScheduleLock);
}

- (void)setIsExporting:(BOOL)a3
{
  self->_isExporting = a3;
}

- (void)loadEffects:(id *)a3 playerRate:(float)a4
{
  if (a4 != 0.0 || (unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isScheduling), (v4 & 1) == 0))
  {
    loadQueue = self->_loadQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = *(void *)"";
    block[2] = __44__PVEffectScheduler_loadEffects_playerRate___block_invoke;
    block[3] = &unk_1E61693A8;
    block[4] = self;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
    BOOL v8 = a4 == 0.0;
    dispatch_async(loadQueue, block);
  }
}

void __44__PVEffectScheduler_loadEffects_playerRate___block_invoke(uint64_t a1, const char *a2)
{
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", a2) >= 1) {
    kdebug_trace();
  }
  char v28 = *(HGSynchronizable **)(*(void *)(a1 + 32) + 112);
  char v29 = 0;
  HGSynchronizable::Lock(v28);
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 104));
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 24)) {
    goto LABEL_52;
  }
  long long v26 = *(_OWORD *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 56);
  [(id)v3 releaseAllUnusedEffects:&v26];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 64) || (uint64_t v5 = *(char **)(v4 + 56), v5 == (char *)(v4 + 16)))
  {
    uint64_t v5 = *(char **)(v4 + 8);
  }
  else if (!*(unsigned char *)(v4 + 88))
  {
    int v16 = [(id)v4 previousLoadedIteratorIsLastInList];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(char **)(v4 + 56);
    if (v16)
    {
      if ((char *)(v4 + 16) != v5)
      {
        do
        {
          uint64_t v17 = *((void *)v5 + 4);
          uint64_t v18 = *(void *)(v4 + 120);
          uint64_t v25 = v18;
          if (v18) {
            (*(void (**)(uint64_t))(*(void *)v18 + 16))(v18);
          }
          LoadableInstruction::LoadInstructionGraphNodes(v17, &v25);
          if (v25) {
            (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
          }
          v19 = (char *)*((void *)v5 + 1);
          if (v19)
          {
            do
            {
              v20 = v19;
              v19 = *(char **)v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = (char *)*((void *)v5 + 2);
              BOOL v15 = *(void *)v20 == (void)v5;
              uint64_t v5 = v20;
            }
            while (!v15);
          }
          uint64_t v4 = *(void *)(a1 + 32);
          uint64_t v5 = v20;
        }
        while (v20 != (char *)(v4 + 16));
      }
      *(unsigned char *)(v4 + 88) = 1;
      *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v5 = *(char **)(*(void *)(a1 + 32) + 8);
      goto LABEL_7;
    }
  }
  *(unsigned char *)(v4 + 88) = 0;
LABEL_7:
  v6 = *(char **)(a1 + 32);
  if (v5 == v6 + 16) {
    goto LABEL_49;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = (_OWORD *)(a1 + 40);
  while (1)
  {
    BOOL v8 = (void *)MEMORY[0x1BA9C0A20]();
    id v9 = (LoadableInstruction *)*((void *)v5 + 4);
    if (v9) {
      (*(void (**)(void))(*(void *)v9 + 16))(*((void *)v5 + 4));
    }
    *(_OWORD *)&v24.value = *v7;
    v24.epoch = *(void *)(a1 + 56);
    CMTime v23 = *(CMTime *)(*(void *)(a1 + 32) + 64);
    if (LoadableInstruction::ShouldLoadForTime(v9, &v24, &v23, *(unsigned __int8 *)(a1 + 64)))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 120);
      uint64_t v22 = v10;
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
      }
      LoadableInstruction::LoadInstructionGraphNodes((uint64_t)v9, &v22);
      if (v22) {
        (*(void (**)(uint64_t))(*(void *)v22 + 24))(v22);
      }
      *(void *)(*(void *)(a1 + 32) + 56) = v5;
LABEL_23:
      char v12 = 1;
      if (!v9) {
        goto LABEL_25;
      }
LABEL_24:
      (*(void (**)(LoadableInstruction *))(*(void *)v9 + 24))(v9);
      goto LABEL_25;
    }
    *(_OWORD *)&time2.value = *v7;
    time2.epoch = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v11 = (CMTime *)((char *)v9 + 76);
    }
    else {
      uint64_t v11 = (CMTime *)((char *)v9 + 28);
    }
    CMTime time1 = *v11;
    if (CMTimeCompare(&time1, &time2) != 1) {
      goto LABEL_23;
    }
    char v12 = 0;
    if (v9) {
      goto LABEL_24;
    }
LABEL_25:
    if ((v12 & 1) == 0) {
      break;
    }
    v13 = (char *)*((void *)v5 + 1);
    if (v13)
    {
      do
      {
        v14 = v13;
        v13 = *(char **)v13;
      }
      while (v13);
    }
    else
    {
      do
      {
        v14 = (char *)*((void *)v5 + 2);
        BOOL v15 = *(void *)v14 == (void)v5;
        uint64_t v5 = v14;
      }
      while (!v15);
    }
    v6 = *(char **)(a1 + 32);
    uint64_t v5 = v14;
    if (v14 == v6 + 16) {
      goto LABEL_49;
    }
  }
  v6 = *(char **)(a1 + 32);
LABEL_49:
  [v6 unloadInstructionFromPreviousSchedule];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v21) >= 1) {
    kdebug_trace();
  }
  uint64_t v3 = *(void *)(a1 + 32);
LABEL_52:
  atomic_store(0, (unsigned __int8 *)(v3 + 104));
  HGSynchronizer::~HGSynchronizer(&v28);
}

- (void)releaseAllUnusedEffects:(id *)a3
{
  begin_node = (PVEffectScheduler *)self->_effectSchedule.__tree_.__begin_node_;
  p_pair1 = &self->_effectSchedule.__tree_.__pair1_;
  if (begin_node != (PVEffectScheduler *)&self->_effectSchedule.__tree_.__pair1_)
  {
    char v6 = 0;
    p_endTime = &self->_endTime;
    do
    {
      BOOL v8 = (LoadableInstruction *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
      CMTime v14 = (CMTime)*a3;
      $95D729B680665BEAEFA1D6FCA8238556 v13 = *p_endTime;
      if (LoadableInstruction::ShouldReleaseForTime(v8, &v14, (CMTime *)&v13))
      {
        id v9 = (id *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
        if (*((unsigned char *)v9 + 12))
        {
          [v9[2] unloadInstructionGraphNodes];
          *((unsigned char *)v9 + 12) = 0;
        }
        char v6 = 1;
      }
      isa = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PVEffectScheduler *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__pair1_.__value_.__left_;
          BOOL v12 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v12);
      }
      begin_node = left;
    }
    while (left != (PVEffectScheduler *)p_pair1);
    if (v6) {
      +[PVInstructionGraphImageSourceNode purgeBitmapCache:0];
    }
  }
}

- (void)unloadInstructionFromPreviousSchedule
{
  p_previousScheduleToUnload = &self->_previousScheduleToUnload;
  begin_node = (PVEffectScheduler *)self->_previousScheduleToUnload.__tree_.__begin_node_;
  p_pair1 = &self->_previousScheduleToUnload.__tree_.__pair1_;
  if (begin_node != (PVEffectScheduler *)&self->_previousScheduleToUnload.__tree_.__pair1_)
  {
    do
    {
      char v6 = (id *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
      if (*((unsigned char *)v6 + 12))
      {
        [v6[2] unloadInstructionGraphNodes];
        *((unsigned char *)v6 + 12) = 0;
      }
      isa = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PVEffectScheduler *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__pair1_.__value_.__left_;
          BOOL v9 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v9);
      }
      begin_node = left;
    }
    while (left != (PVEffectScheduler *)p_pair1);
  }
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)p_previousScheduleToUnload, (void *)self->_previousScheduleToUnload.__tree_.__pair1_.__value_.__left_);
  self->_previousScheduleToUnload.__tree_.__pair1_.__value_.__left_ = 0;
  self->_previousScheduleToUnload.__tree_.__pair3_.__value_ = 0;
  self->_previousScheduleToUnload.__tree_.__begin_node_ = p_pair1;
}

- (BOOL)loadTimeIsNearEnd:(id *)a3
{
  memset(&v13, 0, sizeof(v13));
  BOOL v5 = +[PVDeviceCharacteristics isLowMemDevice];
  double v6 = 0.9;
  if (!v5) {
    double v6 = 3.0;
  }
  CMTimeMakeWithSeconds(&v13, v6, 30);
  memset(&v12, 0, sizeof(v12));
  CMTime lhs = (CMTime)*a3;
  CMTime rhs = v13;
  CMTimeAdd(&v12, &lhs, &rhs);
  CMTime time1 = v12;
  $95D729B680665BEAEFA1D6FCA8238556 endTime = self->_endTime;
  return CMTimeCompare(&time1, (CMTime *)&endTime) >= 0;
}

- (BOOL)previousLoadedIteratorIsLastInList
{
  ptr = self->_lastLoadedEffectSetIterator.__ptr_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)*((void *)ptr + 1);
  if (left)
  {
    do
    {
      uint64_t v4 = left;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)left->__value_.__left_;
    }
    while (left);
  }
  else
  {
    do
    {
      uint64_t v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)*((void *)ptr + 2);
      BOOL v5 = v4->__value_.__left_ == ptr;
      ptr = v4;
    }
    while (!v5);
  }
  return v4 == &self->_effectSchedule.__tree_.__pair1_;
}

- (void).cxx_destruct
{
  m_Obj = self->_effectLoadRenderContext.m_Obj;
  if (m_Obj) {
    (*(void (**)(PVInstructionGraphContext *, SEL))(*(void *)m_Obj + 24))(m_Obj, a2);
  }
  objc_storeStrong((id *)&self->_loadQueue, 0);
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)&self->_previousScheduleToUnload, (void *)self->_previousScheduleToUnload.__tree_.__pair1_.__value_.__left_);
  left = self->_effectSchedule.__tree_.__pair1_.__value_.__left_;

  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)&self->_effectSchedule, left);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  *((void *)self + 15) = 0;
  return self;
}

@end