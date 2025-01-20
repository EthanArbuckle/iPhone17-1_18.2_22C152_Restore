@interface VFXDisplayLink
- (BOOL)_isInvalidated;
- (BOOL)isPaused;
- (BOOL)setPaused:(BOOL)a3 nextFrameTimeHint:(double)a4 lastUpdate:(double)a5;
- (VFXDisplayLink)init;
- (VFXDisplayLink)initWithQueue:(id)a3 screen:(id)a4 policy:(unint64_t)a5 block:(id)a6;
- (float)preferredFrameRate;
- (id)adaptativeFrameRate;
- (int)queuedFrameCount;
- (void)_caDisplayLinkCallback;
- (void)_callbackWithTime:(double)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAdaptativeFrameRate:(id)a3;
- (void)setNeedsDisplay;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFrameRate:(float)a3;
@end

@implementation VFXDisplayLink

- (VFXDisplayLink)init
{
  return 0;
}

- (VFXDisplayLink)initWithQueue:(id)a3 screen:(id)a4 policy:(unint64_t)a5 block:(id)a6
{
  v31.receiver = self;
  v31.super_class = (Class)VFXDisplayLink;
  v10 = [(VFXDisplayLink *)&v31 init];
  uint64_t v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_preferredFrameRate = 0.0;
    v10->_paused = 1;
    v10->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    atomic_store(0, (unsigned int *)(v11 + 88));
    *(void *)(v11 + 32) = objc_msgSend_copy(a6, v12, v13, v14);
    *(void *)(v11 + 64) = 0;
    *(void *)(v11 + 80) = objc_alloc_init(VFXRecursiveLock);
    if (a4) {
      v16 = objc_msgSend_displayLinkWithTarget_selector_(a4, v15, v11, (uint64_t)sel__caDisplayLinkCallback);
    }
    else {
      v16 = objc_msgSend_displayLinkWithTarget_selector_(MEMORY[0x1E4F39B68], v15, v11, (uint64_t)sel__caDisplayLinkCallback);
    }
    id v17 = v16;
    *(void *)(v11 + 8) = v17;
    objc_msgSend_setPaused_(v17, v18, 1, v19);
    v20 = *(void **)(v11 + 8);
    uint64_t v24 = objc_msgSend_currentRunLoop(MEMORY[0x1E4F1CAC0], v21, v22, v23);
    objc_msgSend_addToRunLoop_forMode_(v20, v25, v24, *MEMORY[0x1E4F1C4B0]);
    if (a5 == 1)
    {
      *(void *)(v11 + 24) = dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, *(dispatch_queue_t *)(v11 + 48));
      objc_initWeak(&location, (id)v11);
      v26 = *(NSObject **)(v11 + 24);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_1B654ED10;
      v28[3] = &unk_1E6144358;
      objc_copyWeak(&v29, &location);
      dispatch_source_set_event_handler(v26, v28);
      dispatch_resume(*(dispatch_object_t *)(v11 + 24));
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  return (VFXDisplayLink *)v11;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    sub_1B63F2F54(17, @"Unreachable code: -[VFXDisplayLink invalidate] must be called before -[VFXDisplayLink dealloc]", v2, v3, v4, v5, v6, v7, (uint64_t)v13.receiver);
    objc_msgSend_invalidate(self, v9, v10, v11);
  }

  self->_block = 0;
  coalescingSource = self->_coalescingSource;
  if (coalescingSource)
  {
    dispatch_source_cancel(coalescingSource);
    dispatch_release((dispatch_object_t)self->_coalescingSource);
    self->_coalescingSource = 0;
  }
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  v13.receiver = self;
  v13.super_class = (Class)VFXDisplayLink;
  [(VFXDisplayLink *)&v13 dealloc];
}

- (BOOL)isPaused
{
  objc_sync_enter(self);
  BOOL paused = self->_paused;
  objc_sync_exit(self);
  return paused;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  objc_sync_enter(self);
  if (objc_msgSend_isPaused(self, v5, v6, v7) != v3)
  {
    self->_BOOL paused = v3;
    if (v3) {
      self->_lastFrameTime = 0.0;
    }
    objc_msgSend_setPaused_(self->_caDisplayLink, v8, v3, v9);
  }

  objc_sync_exit(self);
}

- (BOOL)setPaused:(BOOL)a3 nextFrameTimeHint:(double)a4 lastUpdate:(double)a5
{
  double v11 = CACurrentMediaTime();
  BOOL v12 = v11 - a5 <= 0.25 || a4 - v11 <= 0.25;
  BOOL v13 = !a3 || v12;
  if (v13)
  {
    objc_msgSend_setPaused_(self, v9, 0, v10);
  }
  else
  {
    objc_msgSend_setPaused_(self, v9, 1, v10);
    if (a4 != INFINITY)
    {
      CFTimeInterval v14 = CACurrentMediaTime();
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)((a4 - v14 + -0.01) * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B654F058;
      block[3] = &unk_1E61422C0;
      block[4] = self;
      dispatch_after(v15, MEMORY[0x1E4F14428], block);
    }
  }
  return !v13;
}

- (id)adaptativeFrameRate
{
  return self->_adaptativeFrameDuration;
}

- (void)setAdaptativeFrameRate:(id)a3
{
  id adaptativeFrameDuration = self->_adaptativeFrameDuration;
  if (adaptativeFrameDuration != a3)
  {

    self->_id adaptativeFrameDuration = (id)objc_msgSend_copy(a3, v6, v7, v8);
  }
}

- (float)preferredFrameRate
{
  return self->_preferredFrameRate;
}

- (void)setPreferredFrameRate:(float)a3
{
  if (self->_preferredFrameRate != a3)
  {
    self->_preferredFrameRate = a3;
    objc_msgSend_setPreferredFramesPerSecond_(self->_caDisplayLink, a2, (uint64_t)a3, v3);
  }
}

- (int)queuedFrameCount
{
  return atomic_load((unsigned int *)&self->_queuedFrameCount);
}

- (void)_callbackWithTime:(double)a3
{
  if (self->_coalescingSource)
  {
    uint64_t v5 = sub_1B63F2EE0();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DisplayLink (coalesced)", "", v6, 2u);
    }
    atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_lastDisplayLinkTime);
    dispatch_source_merge_data((dispatch_source_t)self->_coalescingSource, 1uLL);
  }
  else
  {
    sub_1B654F1F0((uint64_t)self, a3);
  }
}

- (void)_caDisplayLinkCallback
{
  objc_msgSend_targetTimestamp(self->_caDisplayLink, a2, v2, v3);

  MEMORY[0x1F4181798](self, sel__callbackWithTime_, v5, v6);
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    objc_msgSend_lock(self->_runningLock, a2, v2, v3);
    self->_invalidated = 1;
    objc_msgSend_invalidate(self->_caDisplayLink, v5, v6, v7);

    self->_caDisplayLink = 0;
    runningLock = self->_runningLock;
    objc_msgSend_unlock(runningLock, v8, v9, v10);
  }
}

- (void)setNeedsDisplay
{
  objc_msgSend_setPaused_(self, a2, 0, v2);
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

@end