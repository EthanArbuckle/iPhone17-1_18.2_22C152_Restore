@interface PXStoryTimelineManager
+ (PXStoryTimelineManager)timelineManagerWithTimelineProducer:(id)a3 resourcesDataSourceManager:(id)a4 styleManager:(id)a5 specManager:(id)a6 configuration:(id)a7 loadingCoordinator:(id)a8 paperTrailOptions:(unint64_t)a9;
- (BOOL)isTargetTimelineFinal;
- (BOOL)isTimelineFinal;
- (BOOL)requiresUpdatedTargetTimelineImmediately;
- (NSIndexSet)pendingVisibleSegmentIdentifiers;
- (NSIndexSet)visibleSegmentIdentifiers;
- (NSProgress)targetTimelineProgress;
- (OS_dispatch_queue)storyQueue;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryLoadingCoordinator)loadingCoordinator;
- (PXStoryProducerResult)targetTimelineResult;
- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager;
- (PXStoryStyleManager)styleManager;
- (PXStoryTimeline)timeline;
- (PXStoryTimelineManager)init;
- (PXStoryTimelineManager)initWithTimelineProducer:(id)a3 resourcesDataSourceManager:(id)a4 styleManager:(id)a5 specManager:(id)a6 loadingCoordinator:(id)a7 errorReporter:(id)a8 options:(unint64_t)a9 paperTrailOptions:(unint64_t)a10;
- (PXStoryTimelineProducer)timelineProducer;
- (PXStoryTimelineSpecManager)specManager;
- (PXUpdater)updater;
- (_NSRange)_rangeOfVisibleDisplayAssetsInResourcesDataSource:(id)a3;
- (id)_diagnosticMovementTextForClipInfo:(id *)a3 segmentClipCount:(int)a4 autoEditClip:(id)a5;
- (id)_diagnosticStyleTextForClipInfo:(id *)a3 segmentClipCount:(int)a4 autoEditClip:(id)a5;
- (id)_diagnosticTextForSegmentIdentifier:(int64_t)a3 segmentTimeRange:(id *)a4 HUDType:(int64_t)a5 decisionList:(id)a6;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (unint64_t)options;
- (unint64_t)paperTrailOptions;
- (unint64_t)timelineAttributes;
- (void)_applyPendingVisibleSegmentIdentifiers;
- (void)_handleUpdatedTargetTimelineResult:(id)a3;
- (void)_invalidatePendingVisibleSegmentIdentifiers;
- (void)_invalidateTargetTimeline;
- (void)_invalidateTimeline;
- (void)_invalidateTimelineAttributes;
- (void)_setNeedsUpdate;
- (void)_updatePendingVisibleSegmentIdentifiers;
- (void)_updateTargetTimeline;
- (void)_updateTimeline;
- (void)_updateTimelineAttributes;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)dealloc;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setIsTargetTimelineFinal:(BOOL)a3;
- (void)setIsTimelineFinal:(BOOL)a3;
- (void)setPendingVisibleSegmentIdentifiers:(id)a3;
- (void)setTargetTimelineProgress:(id)a3;
- (void)setTargetTimelineResult:(id)a3;
- (void)setTimeline:(id)a3;
- (void)setTimelineAttributes:(unint64_t)a3;
- (void)setVisibleSegmentIdentifiers:(id)a3;
- (void)setVisibleSegmentIdentifiers:(id)a3 afterUpdatePass:(BOOL)a4;
@end

@implementation PXStoryTimelineManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingVisibleSegmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetTimelineProgress, 0);
  objc_storeStrong((id *)&self->_targetTimelineResult, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_timelineProducer, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_loadingCoordinator, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_visibleSegmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_timelinesPaperTrail, 0);
  objc_storeStrong((id *)&self->_targetTimelineResultsPaperTrail, 0);
}

- (void)setPendingVisibleSegmentIdentifiers:(id)a3
{
}

- (NSIndexSet)pendingVisibleSegmentIdentifiers
{
  return self->_pendingVisibleSegmentIdentifiers;
}

- (NSProgress)targetTimelineProgress
{
  return self->_targetTimelineProgress;
}

- (BOOL)isTargetTimelineFinal
{
  return self->_isTargetTimelineFinal;
}

- (PXStoryProducerResult)targetTimelineResult
{
  return self->_targetTimelineResult;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (BOOL)isTimelineFinal
{
  return self->_isTimelineFinal;
}

- (unint64_t)timelineAttributes
{
  return self->_timelineAttributes;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (unint64_t)paperTrailOptions
{
  return self->_paperTrailOptions;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryLoadingCoordinator)loadingCoordinator
{
  return self->_loadingCoordinator;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXStoryTimelineSpecManager)specManager
{
  return self->_specManager;
}

- (NSIndexSet)visibleSegmentIdentifiers
{
  return self->_visibleSegmentIdentifiers;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v23 = objc_alloc_init(PXStoryDurationFormatter);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v21 = self;
  v5 = self->_targetTimelineResultsPaperTrail;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [v10 object];
        v12 = [v11 diagnosticDescription];
        unsigned int v13 = [v10 isDegraded];
        [v10 productionDuration];
        v14 = -[PXStoryDurationFormatter stringFromTimeInterval:](v23, "stringFromTimeInterval:");
        [v4 appendFormat:@"Timeline: %@\n Is Degraded: %d\nProduction Duration: %@\n\n\n", v12, v13, v14, v21];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  [v22 addAttachmentWithText:v4 name:@"TimelineManagerTargetTimelineResults"];
  id v15 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v16 = v21->_timelinesPaperTrail;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        [v15 appendFormat:@"%@\n\n\n", *(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }

  [v22 addAttachmentWithText:v4 name:@"TimelineManagerTimelines"];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PXStoryTimelineManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCCD20;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryTimelineManager *)self performChanges:v5];
}

void __55__PXStoryTimelineManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == ResourcesDataSourceManagerObservationContext_161010)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = v3;
    if (v5)
    {
      [*(id *)(a1 + 32) _invalidateTargetTimeline];
      id v3 = v8;
      uint64_t v5 = *(void *)(a1 + 48);
    }
    if ((v5 & 2) == 0) {
      goto LABEL_15;
    }
LABEL_13:
    [*(id *)(a1 + 32) _invalidateTimelineAttributes];
    goto LABEL_14;
  }
  if (v4 == StyleManagerObservationContext_161011)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = v3;
    if ((v6 & 4) != 0)
    {
      [*(id *)(a1 + 32) _invalidateTargetTimeline];
      id v3 = v8;
      uint64_t v6 = *(void *)(a1 + 48);
    }
    if ((v6 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v4 != SpecManagerObservationContext_161012)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryTimelineManager.m" lineNumber:403 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v8 = v3;
    [*(id *)(a1 + 32) _invalidateTargetTimeline];
LABEL_14:
    id v3 = v8;
  }
LABEL_15:
}

- (void)_updateTimelineAttributes
{
  id v3 = [(PXStoryTimelineManager *)self targetTimelineProgress];

  if (v3) {
    return;
  }
  uint64_t v4 = [(PXStoryTimelineManager *)self resourcesDataSourceManager];
  if (![v4 isDataSourceFinal])
  {

    goto LABEL_6;
  }
  BOOL v5 = [(PXStoryTimelineManager *)self isTargetTimelineFinal];

  if (!v5)
  {
LABEL_6:
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [(PXStoryTimelineManager *)self styleManager];
  char v7 = [v6 currentStyleAttributes];

  uint64_t v8 = v7 & 3;
LABEL_7:
  [(PXStoryTimelineManager *)self setTimelineAttributes:v8];
}

- (void)_invalidateTimelineAttributes
{
  id v2 = [(PXStoryTimelineManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimelineAttributes];
}

- (void)_updateTimeline
{
  BOOL isUpdatingTimeline = self->_isUpdatingTimeline;
  self->_BOOL isUpdatingTimeline = 1;
  uint64_t v4 = [(PXStoryTimelineManager *)self timeline];
  BOOL v5 = [(PXStoryTimelineManager *)self visibleSegmentIdentifiers];
  uint64_t v6 = [(PXStoryTimelineManager *)self targetTimelineResult];
  char v7 = [v6 object];

  uint64_t v8 = +[PXStoryRecombinedTimeline timelineByRecombiningSourceTimeline:v4 withTargetTimeline:v7 visibleSegmentIdentifiers:v5];
  id v9 = v5;
  v10 = v9;
  if ([v9 count])
  {
    v10 = v9;
    if (([v8 containsAllSegmentsWithIdentifiers:v9] & 1) == 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __41__PXStoryTimelineManager__updateTimeline__block_invoke;
      v13[3] = &unk_1E5DD3088;
      id v14 = v8;
      id v15 = v4;
      id v16 = v11;
      id v12 = v11;
      [v9 enumerateIndexesUsingBlock:v13];
      v10 = (void *)[v12 copy];
    }
  }
  [(PXStoryTimelineManager *)self setTimeline:v8];
  [(PXStoryTimelineManager *)self setVisibleSegmentIdentifiers:v10];
  self->_BOOL isUpdatingTimeline = isUpdatingTimeline;
}

uint64_t __41__PXStoryTimelineManager__updateTimeline__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) identifierOfSegmentClosestToSegmentWithIdentifier:a2 inTimeline:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v4 = result;
    BOOL v5 = *(void **)(a1 + 48);
    return [v5 addIndex:v4];
  }
  return result;
}

- (void)_invalidateTimeline
{
  id v2 = [(PXStoryTimelineManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimeline];
}

- (void)_updatePendingVisibleSegmentIdentifiers
{
  id v3 = [(PXStoryTimelineManager *)self pendingVisibleSegmentIdentifiers];
  if (v3)
  {
    uint64_t v4 = v3;
    [(PXStoryTimelineManager *)self setVisibleSegmentIdentifiers:v3];
    [(PXStoryTimelineManager *)self setPendingVisibleSegmentIdentifiers:0];
    id v3 = v4;
  }
}

- (void)_invalidatePendingVisibleSegmentIdentifiers
{
  id v2 = [(PXStoryTimelineManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePendingVisibleSegmentIdentifiers];
}

- (void)_handleUpdatedTargetTimelineResult:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __61__PXStoryTimelineManager__handleUpdatedTargetTimelineResult___block_invoke;
  id v9 = &unk_1E5DC0648;
  v10 = self;
  id v11 = v4;
  id v5 = v4;
  [(PXStoryTimelineManager *)self performChanges:&v6];
  -[NSMutableArray px_addObject:removingFirstObjectIfNeededToKeepMaximumCount:](self->_targetTimelineResultsPaperTrail, "px_addObject:removingFirstObjectIfNeededToKeepMaximumCount:", v5, self->_paperTrailLength, v6, v7, v8, v9, v10);
}

uint64_t __61__PXStoryTimelineManager__handleUpdatedTargetTimelineResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTargetTimelineResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setTargetTimelineProgress:0];
  }
  return result;
}

- (void)_updateTargetTimeline
{
  if (([(PXStoryTimelineManager *)self timelineAttributes] & 2) == 0
    || ([(PXStoryTimelineManager *)self options] & 1) == 0)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3032000000;
    v5[3] = __Block_byref_object_copy__161026;
    v5[4] = __Block_byref_object_dispose__161027;
    v5[5] = 0;
    id v3 = [(PXStoryTimelineManager *)self specManager];
    id v4 = [v3 timelineSpec];

    [v4 viewportSize];
    PXSizeIsNull();
  }
}

void __47__PXStoryTimelineManager__updateTargetTimeline__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id)[a2 deliveredNowWithRequestTime:*(double *)(a1 + 56)];
  PXIsSyncCallback();
}

void __47__PXStoryTimelineManager__updateTargetTimeline__block_invoke_32(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleUpdatedTargetTimelineResult:*(void *)(a1 + 32)];
  }
}

- (void)_invalidateTargetTimeline
{
  id v2 = [(PXStoryTimelineManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTargetTimeline];
}

- (void)_setNeedsUpdate
{
}

- (void)_applyPendingVisibleSegmentIdentifiers
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__PXStoryTimelineManager__applyPendingVisibleSegmentIdentifiers__block_invoke;
  v2[3] = &unk_1E5DC05F8;
  v2[4] = self;
  [(PXStoryTimelineManager *)self performChanges:v2];
}

uint64_t __64__PXStoryTimelineManager__applyPendingVisibleSegmentIdentifiers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePendingVisibleSegmentIdentifiers];
}

- (void)setVisibleSegmentIdentifiers:(id)a3 afterUpdatePass:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    if (v6)
    {
      [(PXStoryTimelineManager *)self setPendingVisibleSegmentIdentifiers:v6];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28D60]);
      [(PXStoryTimelineManager *)self setPendingVisibleSegmentIdentifiers:v8];
    }
    objc_initWeak(&location, self);
    id v9 = [(PXStoryTimelineManager *)self storyQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__PXStoryTimelineManager_setVisibleSegmentIdentifiers_afterUpdatePass___block_invoke;
    v10[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v11, &location);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXStoryTimelineManager *)self setVisibleSegmentIdentifiers:v6];
  }
}

void __71__PXStoryTimelineManager_setVisibleSegmentIdentifiers_afterUpdatePass___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _applyPendingVisibleSegmentIdentifiers];
}

- (void)setVisibleSegmentIdentifiers:(id)a3
{
  id v8 = (NSIndexSet *)a3;
  BOOL v4 = self->_visibleSegmentIdentifiers;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSIndexSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSIndexSet *)[(NSIndexSet *)v8 copy];
      visibleSegmentIdentifiers = self->_visibleSegmentIdentifiers;
      self->_visibleSegmentIdentifiers = v6;

      [(PXStoryTimelineManager *)self setPendingVisibleSegmentIdentifiers:0];
      if (!self->_isUpdatingTimeline) {
        [(PXStoryTimelineManager *)self _invalidateTimeline];
      }
    }
  }
}

- (_NSRange)_rangeOfVisibleDisplayAssetsInResourcesDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3010000000;
  v20 = &unk_1AB5D584F;
  long long v21 = xmmword_1AB359BD0;
  char v5 = [(PXStoryTimelineManager *)self timeline];
  id v6 = [(PXStoryTimelineManager *)self visibleSegmentIdentifiers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PXStoryTimelineManager__rangeOfVisibleDisplayAssetsInResourcesDataSource___block_invoke;
  v13[3] = &unk_1E5DC05D0;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  id v16 = &v17;
  [v6 enumerateIndexesUsingBlock:v13];

  NSUInteger v9 = v18[4];
  NSUInteger v10 = v18[5];

  _Block_object_dispose(&v17, 8);
  NSUInteger v11 = v9;
  NSUInteger v12 = v10;
  result.length = v12;
  result.id location = v11;
  return result;
}

void __76__PXStoryTimelineManager__rangeOfVisibleDisplayAssetsInResourcesDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) indexesOfResourcesWithKind:1 inResourcesDataSource:*(void *)(a1 + 40) forClipsInSegmentWithIdentifier:a2];
  if ([v5 count])
  {
    id v3 = *(NSRange **)(*(void *)(a1 + 48) + 8);
    v7.id location = [v5 firstIndex];
    v7.length = 1;
    *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = NSUnionRange(v3[2], v7);
    id v4 = *(NSRange **)(*(void *)(a1 + 48) + 8);
    v8.id location = [v5 lastIndex];
    v8.length = 1;
    *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = NSUnionRange(v4[2], v8);
  }
}

- (void)setTargetTimelineProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  targetTimelineProgress = self->_targetTimelineProgress;
  if (targetTimelineProgress != v5)
  {
    NSRange v7 = v5;
    [(NSProgress *)targetTimelineProgress cancel];
    objc_storeStrong((id *)&self->_targetTimelineProgress, a3);
    [(PXStoryTimelineManager *)self _invalidateTimelineAttributes];
    id v5 = v7;
  }
}

- (BOOL)requiresUpdatedTargetTimelineImmediately
{
  id v3 = [(PXStoryTimelineManager *)self targetTimelineResult];
  id v4 = [v3 object];

  if (!v4) {
    goto LABEL_11;
  }
  [v4 size];
  if (v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    goto LABEL_11;
  }
  [v4 size];
  double v9 = v8;
  double v11 = v10;
  NSUInteger v12 = [(PXStoryTimelineManager *)self specManager];
  unsigned int v13 = [v12 timelineSpec];
  [v13 viewportSize];
  if (v9 == v15 && v11 == v14)
  {

LABEL_11:
    BOOL v17 = 0;
    goto LABEL_12;
  }
  char v16 = [(PXStoryTimelineManager *)self options];

  if ((v16 & 4) != 0) {
    goto LABEL_11;
  }
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (void)setIsTimelineFinal:(BOOL)a3
{
  if (self->_isTimelineFinal != a3)
  {
    self->_isTimelineFinal = a3;
    [(PXStoryTimelineManager *)self signalChange:2];
  }
}

- (void)setTimelineAttributes:(unint64_t)a3
{
  if (self->_timelineAttributes != a3)
  {
    self->_timelineAttributes = a3;
    [(PXStoryTimelineManager *)self signalChange:4];
    unint64_t v4 = (self->_timelineAttributes >> 1) & 1;
    [(PXStoryTimelineManager *)self setIsTimelineFinal:v4];
  }
}

- (void)setTimeline:(id)a3
{
  NSRange v7 = (PXStoryTimeline *)a3;
  double v5 = self->_timeline;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryTimeline *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeline, a3);
      [(PXStoryTimelineManager *)self signalChange:1];
      [(NSMutableArray *)self->_timelinesPaperTrail px_addObject:self->_timeline removingFirstObjectIfNeededToKeepMaximumCount:self->_paperTrailLength];
    }
  }
}

- (void)setIsTargetTimelineFinal:(BOOL)a3
{
  if (self->_isTargetTimelineFinal != a3)
  {
    self->_isTargetTimelineFinal = a3;
    [(PXStoryTimelineManager *)self _invalidateTimelineAttributes];
  }
}

- (void)setTargetTimelineResult:(id)a3
{
  NSRange v7 = (PXStoryProducerResult *)a3;
  double v5 = self->_targetTimelineResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_targetTimelineResult, a3);
      [(PXStoryTimelineManager *)self setIsTargetTimelineFinal:[(PXStoryProducerResult *)v7 isDegraded] ^ 1];
      [(PXStoryTimelineManager *)self _invalidatePendingVisibleSegmentIdentifiers];
      [(PXStoryTimelineManager *)self _invalidateTimeline];
    }
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryTimelineManager;
  [(PXStoryTimelineManager *)&v4 didPerformChanges];
  id v3 = [(PXStoryTimelineManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryTimelineManager *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryTimelineManager;
  [(PXStoryTimelineManager *)&v6 performChanges:v4];
}

- (void)dealloc
{
  [(NSProgress *)self->_targetTimelineProgress cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineManager;
  [(PXStoryTimelineManager *)&v3 dealloc];
}

- (PXStoryTimelineManager)initWithTimelineProducer:(id)a3 resourcesDataSourceManager:(id)a4 styleManager:(id)a5 specManager:(id)a6 loadingCoordinator:(id)a7 errorReporter:(id)a8 options:(unint64_t)a9 paperTrailOptions:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  v37.receiver = self;
  v37.super_class = (Class)PXStoryTimelineManager;
  v20 = [(PXStoryTimelineManager *)&v37 init];
  long long v21 = v20;
  if (v20)
  {
    [(PXStoryTimelineManager *)v20 copyLogConfigurationFrom:v18];
    objc_storeStrong((id *)&v21->_timelineProducer, a3);
    objc_storeStrong((id *)&v21->_resourcesDataSourceManager, a4);
    [(PXStoryResourcesDataSourceManager *)v21->_resourcesDataSourceManager registerChangeObserver:v21 context:ResourcesDataSourceManagerObservationContext_161010];
    objc_storeStrong((id *)&v21->_styleManager, a5);
    [(PXStoryStyleManager *)v21->_styleManager registerChangeObserver:v21 context:StyleManagerObservationContext_161011];
    objc_storeStrong((id *)&v21->_specManager, a6);
    [(PXStoryTimelineSpecManager *)v21->_specManager registerChangeObserver:v21 context:SpecManagerObservationContext_161012];
    uint64_t v22 = [v18 storyQueue];
    storyQueue = v21->_storyQueue;
    v21->_storyQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v21->_loadingCoordinator, a7);
    objc_storeStrong((id *)&v21->_errorReporter, a8);
    v21->_options = a9;
    v21->_paperTrailOptions = a10;
    uint64_t v24 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v21 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v21->_updater;
    v21->_updater = (PXUpdater *)v24;

    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateTargetTimeline];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updatePendingVisibleSegmentIdentifiers];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateTimeline];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateTimelineAttributes];
    if (a10)
    {
      long long v26 = +[PXStorySettings sharedInstance];
      v21->_paperTrailLength = [v26 timelineManagerPaperTrailLength];

      uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21->_paperTrailLength];
      targetTimelineResultsPaperTrail = v21->_targetTimelineResultsPaperTrail;
      v21->_targetTimelineResultsPaperTrail = (NSMutableArray *)v27;

      uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21->_paperTrailLength];
      timelinesPaperTrail = v21->_timelinesPaperTrail;
      v21->_timelinesPaperTrail = (NSMutableArray *)v29;
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __162__PXStoryTimelineManager_initWithTimelineProducer_resourcesDataSourceManager_styleManager_specManager_loadingCoordinator_errorReporter_options_paperTrailOptions___block_invoke;
    v35[3] = &unk_1E5DD0FA8;
    v36 = v21;
    [(PXStoryTimelineManager *)v36 performChanges:v35];
  }
  return v21;
}

uint64_t __162__PXStoryTimelineManager_initWithTimelineProducer_resourcesDataSourceManager_styleManager_specManager_loadingCoordinator_errorReporter_options_paperTrailOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTargetTimeline];
}

- (PXStoryTimelineManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTimelineManager.m", 64, @"%s is not available as initializer", "-[PXStoryTimelineManager init]");

  abort();
}

+ (PXStoryTimelineManager)timelineManagerWithTimelineProducer:(id)a3 resourcesDataSourceManager:(id)a4 styleManager:(id)a5 specManager:(id)a6 configuration:(id)a7 loadingCoordinator:(id)a8 paperTrailOptions:(unint64_t)a9
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  char v20 = [v15 options];
  if (([v15 options] & 0xC) != 0) {
    uint64_t v21 = v20 & 3 | 8;
  }
  else {
    uint64_t v21 = v20 & 3;
  }
  uint64_t v22 = [PXStoryTimelineManager alloc];
  v23 = [v15 errorReporter];

  uint64_t v24 = [(PXStoryTimelineManager *)v22 initWithTimelineProducer:v19 resourcesDataSourceManager:v18 styleManager:v17 specManager:v16 loadingCoordinator:v14 errorReporter:v23 options:v21 paperTrailOptions:a9];
  return v24;
}

- (id)_diagnosticMovementTextForClipInfo:(id *)a3 segmentClipCount:(int)a4 autoEditClip:(id)a5
{
  id v6 = a5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v8 = *(_OWORD *)&a3->var9.var1.var0.c;
  long long v9 = *(_OWORD *)&a3->var9.var2.var0;
  long long v26 = *(_OWORD *)&a3->var9.var1.var0.tx;
  long long v27 = v9;
  long long v10 = *(_OWORD *)&a3->var9.var0.var0.a;
  long long v11 = *(_OWORD *)&a3->var9.var0.var0.tx;
  long long v22 = *(_OWORD *)&a3->var9.var0.var0.c;
  long long v23 = v11;
  long long v12 = *(_OWORD *)&a3->var9.var0.var0.tx;
  long long v24 = *(_OWORD *)&a3->var9.var1.var0.a;
  long long v25 = v8;
  long long v13 = *(_OWORD *)&a3->var9.var0.var0.c;
  long long v18 = *(_OWORD *)&a3->var9.var0.var0.a;
  long long v19 = v13;
  long long v20 = *(_OWORD *)&a3->var9.var0.var0.tx;
  long long v21 = v10;
  long long v15 = v10;
  int64_t var3 = a3->var9.var2.var3;
  long long v16 = v22;
  long long v17 = v12;
  PXStoryRectIsEmpty();
}

- (id)_diagnosticStyleTextForClipInfo:(id *)a3 segmentClipCount:(int)a4 autoEditClip:(id)a5
{
  id v6 = a5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v23 = *(_OWORD *)&a3->var4.var1.var0;
  *(void *)&long long v24 = a3->var4.var1.var3;
  long long v8 = PXStoryTimeDescription((CMTime *)&v23);
  [v7 appendFormat:@"    Duration=%@", v8];

  if (v6)
  {
    long long v25 = 0u;
    memset(&v26, 0, sizeof(v26));
    long long v23 = 0u;
    long long v24 = 0u;
    [v6 durationInfo];
    CMTime var1 = (CMTime)a3->var4.var1;
    *(_OWORD *)&v21.value = v23;
    v21.epoch = v24;
    CMTime v20 = v26;
    *(_OWORD *)&time1.value = v23;
    time1.epoch = v24;
    CMTime time2 = (CMTime)a3->var4.var1;
    long long v9 = @"🟥";
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      CMTime time1 = var1;
      CMTime time2 = v20;
      if (CMTimeCompare(&time1, &time2) < 1) {
        long long v9 = @"✅";
      }
    }
    CMTime v17 = v21;
    long long v10 = PXStoryTimeDescription(&v17);
    CMTime v16 = v20;
    long long v11 = PXStoryTimeDescription(&v16);
    [v7 appendFormat:@", AE (min=%@/max=%@): %@", v10, v11, v9];

    id v12 = v6;
    [v12 durationMultiplier];
    uint64_t v14 = v13;

    [v7 appendFormat:@", baked-in multiplier: %.2f", v14];
  }
  else
  {
    [v7 appendString:@" (AE: N/A)"];
  }
  [v7 appendString:@"\n"];
  PXDisplayAssetPlaybackStyleDescription();
}

- (id)_diagnosticTextForSegmentIdentifier:(int64_t)a3 segmentTimeRange:(id *)a4 HUDType:(int64_t)a5 decisionList:(id)a6
{
  id v8 = a6;
  objc_msgSend(objc_alloc_init(MEMORY[0x1E4F28E78]), "appendFormat:", @"Segment: %ld\n", a3);
  [(PXStoryTimelineManager *)self timeline];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXRectWithOriginAndSize();
}

uint64_t __113__PXStoryTimelineManager_Diagnostics___diagnosticTextForSegmentIdentifier_segmentTimeRange_HUDType_decisionList___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    double v5 = (void *)(a5 + 152);
    do
    {
      if (*(v5 - 18) == 1 && *v5 != 0) {
        ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
      }
      v5 += 96;
      --a2;
    }
    while (a2);
  }
  return result;
}

void __113__PXStoryTimelineManager_Diagnostics___diagnosticTextForSegmentIdentifier_segmentTimeRange_HUDType_decisionList___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (a2 >= 1)
  {
    uint64_t v52 = v5;
    uint64_t v53 = v6;
    uint64_t v8 = a2;
    while (1)
    {
      uint64_t v11 = *a5;
      uint64_t v10 = a5[1];
      long long v12 = *((_OWORD *)a5 + 8);
      long long v49 = *((_OWORD *)a5 + 7);
      long long v50 = v12;
      uint64_t v13 = a5[19];
      uint64_t v51 = a5[18];
      long long v14 = *((_OWORD *)a5 + 4);
      long long v45 = *((_OWORD *)a5 + 3);
      long long v46 = v14;
      long long v15 = *((_OWORD *)a5 + 6);
      long long v47 = *((_OWORD *)a5 + 5);
      long long v48 = v15;
      long long v16 = *((_OWORD *)a5 + 2);
      long long v43 = *((_OWORD *)a5 + 1);
      long long v44 = v16;
      memcpy(__dst, a5 + 20, sizeof(__dst));
      CMTime v17 = [*(id *)(a1 + 32) clipWithIdentifier:v11];
      long long v18 = v17;
      if (v10 != 1 || !v13) {
        goto LABEL_14;
      }
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"  Clip %6ld\n", objc_msgSend(v17, "identifier"));
      if (*(void *)(a1 + 48))
      {
        long long v19 = [v18 resource];
        CMTime v20 = objc_msgSend(v19, "px_storyResourceDisplayAsset");
        CMTime v21 = [*(id *)(a1 + 48) clipForDisplayAsset:v20];
      }
      else
      {
        CMTime v21 = 0;
      }
      uint64_t v22 = *(void *)(a1 + 80);
      if (v22 == 11) {
        break;
      }
      long long v23 = &stru_1F00B0030;
      if (v22 == 7)
      {
        long long v24 = *(void **)(a1 + 56);
        uint64_t v25 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v29 = v11;
        uint64_t v30 = 1;
        long long v37 = v49;
        long long v38 = v50;
        uint64_t v39 = v51;
        long long v33 = v45;
        long long v34 = v46;
        long long v35 = v47;
        long long v36 = v48;
        long long v31 = v43;
        long long v32 = v44;
        uint64_t v40 = v13;
        memcpy(v41, __dst, sizeof(v41));
        uint64_t v26 = [v24 _diagnosticStyleTextForClipInfo:&v29 segmentClipCount:v25 autoEditClip:v21];
LABEL_12:
        long long v23 = (__CFString *)v26;
      }
      [*(id *)(a1 + 40) appendFormat:@"%@\n", v23];

LABEL_14:
      a5 += 96;
      if (!--v8) {
        return;
      }
    }
    long long v27 = *(void **)(a1 + 56);
    uint64_t v28 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v29 = v11;
    uint64_t v30 = 1;
    long long v37 = v49;
    long long v38 = v50;
    uint64_t v39 = v51;
    long long v33 = v45;
    long long v34 = v46;
    long long v35 = v47;
    long long v36 = v48;
    long long v31 = v43;
    long long v32 = v44;
    uint64_t v40 = v13;
    memcpy(v41, __dst, sizeof(v41));
    uint64_t v26 = [v27 _diagnosticMovementTextForClipInfo:&v29 segmentClipCount:v28 autoEditClip:v21];
    goto LABEL_12;
  }
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  uint64_t v6 = [(PXStoryTimelineManager *)self styleManager];
  id v7 = [v6 currentStyle];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 autoEditDecisionList];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (v8)
    {
      objc_msgSend(v9, "appendFormat:", @"Auto-Edit decision list contains: %ld clips\n", objc_msgSend(v8, "numberOfClips"));
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  [v9 appendString:@"No Auto-Edit decision list present\n"];
  uint64_t v8 = 0;
LABEL_6:
  uint64_t v10 = [v7 originalColorGradeCategory];
  uint64_t v11 = (void *)v10;
  long long v12 = @"-";
  if (v10) {
    long long v12 = (__CFString *)v10;
  }
  [v9 appendFormat:@"Color grade category: %@\n", v12];
  [v9 appendString:@"\n"];
  uint64_t v13 = [(PXStoryTimelineManager *)self timeline];
  long long v14 = +[PXStorySettings sharedInstance];
  if ([v14 useVerboseStyleHUDText])
  {
    if (v13) {
      [v13 timeRange];
    }
    else {
      memset(v33, 0, sizeof(v33));
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke;
    v29[3] = &unk_1E5DC4668;
    v29[4] = self;
    uint64_t v30 = v8;
    id v31 = v9;
    int64_t v32 = a3;
    id v19 = v9;
    id v20 = v8;
    [v13 enumerateSegmentsInTimeRange:v33 usingBlock:v29];

    long long v18 = v30;
  }
  else
  {
    long long v15 = [(PXStoryTimelineManager *)self visibleSegmentIdentifiers];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke_2;
    v23[3] = &unk_1E5DC4690;
    id v24 = v13;
    uint64_t v25 = self;
    id v27 = v9;
    int64_t v28 = a3;
    id v26 = v8;
    id v16 = v9;
    id v17 = v8;
    [v15 enumerateIndexesUsingBlock:v23];

    long long v18 = v24;
  }

  CMTime v21 = (void *)[v9 copy];
  return v21;
}

void __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t *a4)
{
  if (a2 >= 1)
  {
    uint64_t v14 = v4;
    uint64_t v15 = v5;
    uint64_t v8 = a2;
    do
    {
      uint64_t v10 = *a4;
      a4 += 25;
      long long v11 = a3[1];
      v13[0] = *a3;
      v13[1] = v11;
      v13[2] = a3[2];
      long long v12 = [*(id *)(a1 + 32) _diagnosticTextForSegmentIdentifier:v10 segmentTimeRange:v13 HUDType:*(void *)(a1 + 56) decisionList:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) appendFormat:@"%@\n", v12];

      a3 += 3;
      --v8;
    }
    while (v8);
  }
}

void __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 timeRangeForSegmentWithIdentifier:a2];
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  uint64_t v8 = [v6 _diagnosticTextForSegmentIdentifier:a2 segmentTimeRange:v9 HUDType:v5 decisionList:v7];
  [*(id *)(a1 + 56) appendFormat:@"%@\n", v8];
}

@end