@interface PVRenderEffectLoader
- (PVRenderEffectLoader)init;
- (float)unusedEffectTimeout;
- (void)_loadEffects_noLock:(id)a3;
- (void)_removeTimedOutEffects_noLock;
- (void)_removeUnusedEffects_noLock:(id)a3;
- (void)ageOutEffects;
- (void)dealloc;
- (void)loadEffectsForGraphs:(id)a3 loadContext:(HGRef<PVInstructionGraphContext>)a4;
- (void)setUnusedEffectTimeout:(float)a3;
- (void)unloadEffects;
@end

@implementation PVRenderEffectLoader

- (PVRenderEffectLoader)init
{
  v4.receiver = self;
  v4.super_class = (Class)PVRenderEffectLoader;
  v2 = [(PVRenderEffectLoader *)&v4 init];
  if (v2)
  {
    v2->_unusedEffectTimeout = 1.0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [(PVRenderEffectLoader *)self unloadEffects];
  loadedEffects = self->_loadedEffects;
  if (loadedEffects)
  {
    uint64_t v4 = std::deque<PVLoadedEffectItem>::~deque[abi:ne180100](loadedEffects);
    MEMORY[0x1BA9BFBA0](v4, 0x1080C40BE8D5F09);
  }
  lock = self->_lock;
  if (lock) {
    (*((void (**)(HGSynchronizable *))lock->var0 + 1))(lock);
  }
  v6.receiver = self;
  v6.super_class = (Class)PVRenderEffectLoader;
  [(PVRenderEffectLoader *)&v6 dealloc];
}

- (void)loadEffectsForGraphs:(id)a3 loadContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1) {
    kdebug_trace();
  }
  lock = self->_lock;
  char v30 = 0;
  HGSynchronizable::Lock(lock);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = *(void *)a4.m_Obj;
        uint64_t v24 = v14;
        if (v14) {
          (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
        }
        [v13 loadIGNode:&v24 returnLoadedEffects:v8];
        if (v24) {
          (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v10);
  }

  [(PVRenderEffectLoader *)self _removeUnusedEffects_noLock:v8];
  [(PVRenderEffectLoader *)self _loadEffects_noLock:v8];
  [(PVRenderEffectLoader *)self _removeTimedOutEffects_noLock];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "unloadIGNode", (void)v20);
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v31 count:16];
    }
    while (v16);
  }

  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v19) >= 1) {
    kdebug_trace();
  }

  HGSynchronizer::~HGSynchronizer(&lock);
}

- (void)unloadEffects
{
  lock = self->_lock;
  char v9 = 0;
  HGSynchronizable::Lock(lock);
  while (1)
  {
    loadedEffects = self->_loadedEffects;
    uint64_t v4 = loadedEffects[5];
    if (!v4) {
      break;
    }
    v5 = (id *)(*(void *)(loadedEffects[1]
                          + (((unint64_t)(v4 + loadedEffects[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
              + 16 * (v4 + *((unsigned char *)loadedEffects + 32) - 1));
    id v6 = *v5;
    id v7 = v5[1];
    [v6 releaseEffect];
    std::deque<PVLoadedEffectItem>::pop_back((void *)self->_loadedEffects);
  }
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (void)ageOutEffects
{
  lock = self->_lock;
  char v4 = 0;
  HGSynchronizable::Lock(lock);
  [(PVRenderEffectLoader *)self _removeTimedOutEffects_noLock];
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (void)_removeUnusedEffects_noLock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loadedEffects = self->_loadedEffects;
  if (loadedEffects[5])
  {
    char v6 = 0;
    unint64_t v7 = 0;
    do
    {
      id v8 = (id *)(*(void *)(loadedEffects[1] + (((loadedEffects[4] + v7) >> 5) & 0x7FFFFFFFFFFFFF8))
                + 16 * (*((unsigned char *)loadedEffects + 32) + v7));
      id v9 = *v8;
      id v10 = v8[1];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v4;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v24;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v11);
            }
            if (v9 == *(id *)(*((void *)&v23 + 1) + 8 * v14))
            {

              ++v7;
              goto LABEL_16;
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v15 = (int64x2_t *)self->_loadedEffects;
      unint64_t v16 = v15[2].u64[0];
      uint64_t v17 = v15->i64[1];
      v18 = (void *)(v17 + 8 * (v16 >> 8));
      if (v15[1].i64[0] == v17) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = *v18 + 16 * v16;
      }
      v22[0] = v18;
      v22[1] = v19;
      long long v20 = (char *)std::__deque_iterator<PVLoadedEffectItem,PVLoadedEffectItem*,PVLoadedEffectItem&,PVLoadedEffectItem**,long,256l>::operator+[abi:ne180100]((uint64_t)v22, v7);
      std::deque<PVLoadedEffectItem>::erase(v15, v20, v21);
      char v6 = 1;
LABEL_16:

      loadedEffects = self->_loadedEffects;
    }
    while (v7 < loadedEffects[5]);
    if ((v6 & 1) != 0 && self->_flushesOnEffectStackChanges) {
      +[PVEffectResources flushEngine];
    }
  }
}

- (void)_loadEffects_noLock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        PVLoadedEffectItem::PVLoadedEffectItem((PVLoadedEffectItem *)v22, *(PVEffect **)(*((void *)&v23 + 1) + 8 * i));
        loadedEffects = self->_loadedEffects;
        unint64_t v9 = loadedEffects[4];
        uint64_t v10 = loadedEffects[1];
        id v11 = (void *)(v10 + 8 * (v9 >> 8));
        if (loadedEffects[2] == v10)
        {
          uint64_t v12 = 0;
          id v15 = 0;
          uint64_t v14 = (void **)(v10 + 8 * ((loadedEffects[5] + v9) >> 8));
        }
        else
        {
          uint64_t v12 = (void *)(*v11 + 16 * v9);
          unint64_t v13 = loadedEffects[5] + v9;
          uint64_t v14 = (void **)(v10 + 8 * (v13 >> 8));
          id v15 = &(*v14)[2 * v13];
        }
        uint64_t v17 = (char *)std::__find_segment_if[abi:ne180100]<std::__deque_iterator<PVLoadedEffectItem,PVLoadedEffectItem*,PVLoadedEffectItem&,PVLoadedEffectItem**,long,256l>,std::__find_segment<PVLoadedEffectItem>,std::__identity>(v11, v12, v14, v15, v22);
        v18 = (int64x2_t *)self->_loadedEffects;
        uint64_t v19 = v18->i64[1];
        if (v18[1].i64[0] == v19)
        {
          uint64_t v21 = 0;
        }
        else
        {
          unint64_t v20 = v18[2].i64[1] + v18[2].i64[0];
          uint64_t v21 = *(void *)(v19 + ((v20 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v20;
        }
        if (v21 == v16) {
          objc_msgSend(v22[0], "loadEffect", v17);
        }
        else {
          std::deque<PVLoadedEffectItem>::erase(v18, v17, v16);
        }
        std::deque<PVLoadedEffectItem>::push_front((uint64_t)self->_loadedEffects, v22);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)_removeTimedOutEffects_noLock
{
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  while (1)
  {
    loadedEffects = self->_loadedEffects;
    uint64_t v4 = loadedEffects[5];
    if (!v4) {
      break;
    }
    uint64_t v5 = (id *)(*(void *)(loadedEffects[1]
                          + (((unint64_t)(v4 + loadedEffects[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
              + 16 * (v4 + *((unsigned char *)loadedEffects + 32) - 1));
    id v6 = *v5;
    id v7 = v5[1];
    [v11 timeIntervalSinceDate:v7];
    double v9 = v8;

    [(PVRenderEffectLoader *)self unusedEffectTimeout];
    if (v9 <= v10)
    {

      break;
    }
    [v6 releaseEffect];
    std::deque<PVLoadedEffectItem>::pop_back((void *)self->_loadedEffects);
  }
}

- (float)unusedEffectTimeout
{
  return self->_unusedEffectTimeout;
}

- (void)setUnusedEffectTimeout:(float)a3
{
  self->_unusedEffectTimeout = a3;
}

@end