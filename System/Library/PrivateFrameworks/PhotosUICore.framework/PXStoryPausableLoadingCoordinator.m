@interface PXStoryPausableLoadingCoordinator
- (OS_os_log)log;
- (PXStoryPausableLoadingCoordinator)init;
- (void)dealloc;
- (void)dispatchTimelineWorkAsyncOnQueue:(id)a3 block:(id)a4;
- (void)pauseTimelineWork;
- (void)resumeTimelineWork;
@end

@implementation PXStoryPausableLoadingCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_timelineWorkGroup, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)dispatchTimelineWorkAsyncOnQueue:(id)a3 block:(id)a4
{
  id v6 = a4;
  v7 = a3;
  objc_initWeak(&location, self);
  timelineWorkGroup = self->_timelineWorkGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXStoryPausableLoadingCoordinator_dispatchTimelineWorkAsyncOnQueue_block___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(timelineWorkGroup, v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __76__PXStoryPausableLoadingCoordinator_dispatchTimelineWorkAsyncOnQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (void)resumeTimelineWork
{
  p_timelineWorkGroup = &self->_timelineWorkGroup;
  timelineWorkGroup = self->_timelineWorkGroup;
  self->_pauseCount = (int64_t)p_timelineWorkGroup[1] - 1;
  dispatch_group_leave(timelineWorkGroup);
  if (!self->_pauseCount)
  {
    v5 = [(PXStoryPausableLoadingCoordinator *)self log];
    id v6 = v5;
    os_signpost_id_t pausedSignpostID = self->_pausedSignpostID;
    if (pausedSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, pausedSignpostID, "StoryLoadingCoordinatorPaused", "", v8, 2u);
    }
  }
}

- (void)pauseTimelineWork
{
  int64_t pauseCount = self->_pauseCount;
  if (!pauseCount)
  {
    v4 = [(PXStoryPausableLoadingCoordinator *)self log];
    self->_os_signpost_id_t pausedSignpostID = os_signpost_id_make_with_pointer(v4, self);

    v5 = [(PXStoryPausableLoadingCoordinator *)self log];
    id v6 = v5;
    os_signpost_id_t pausedSignpostID = self->_pausedSignpostID;
    if (pausedSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, pausedSignpostID, "StoryLoadingCoordinatorPaused", "", v8, 2u);
    }

    int64_t pauseCount = self->_pauseCount;
  }
  self->_int64_t pauseCount = pauseCount + 1;
  dispatch_group_enter((dispatch_group_t)self->_timelineWorkGroup);
}

- (void)dealloc
{
  int64_t pauseCount = self->_pauseCount;
  if (pauseCount >= 1)
  {
    timelineWorkGroup = self->_timelineWorkGroup;
    do
    {
      dispatch_group_leave(timelineWorkGroup);
      --pauseCount;
    }
    while (pauseCount);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXStoryPausableLoadingCoordinator;
  [(PXStoryPausableLoadingCoordinator *)&v5 dealloc];
}

- (PXStoryPausableLoadingCoordinator)init
{
  v11.receiver = self;
  v11.super_class = (Class)PXStoryPausableLoadingCoordinator;
  v2 = [(PXStoryPausableLoadingCoordinator *)&v11 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    timelineWorkGroup = v2->_timelineWorkGroup;
    v2->_timelineWorkGroup = (OS_dispatch_group *)v3;

    objc_super v5 = (const char *)*MEMORY[0x1E4F8C518];
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    os_log_t v8 = os_log_create(v5, (const char *)[v7 UTF8String]);
    log = v2->_log;
    v2->_log = (OS_os_log *)v8;
  }
  return v2;
}

@end