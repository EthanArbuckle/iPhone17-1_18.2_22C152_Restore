@interface PXStoryMemoryFeedViewLayoutSpecManager
- (PXMemoriesSpecManager)memoriesSpecManager;
- (PXStoryMemoryFeedViewLayoutSpecManager)init;
- (PXStoryMemoryFeedViewLayoutSpecManager)initWithLayoutKind:(int64_t)a3 extendedTraitCollection:(id)a4;
- (PXUpdater)updater;
- (int64_t)layoutKind;
- (void)_invalidateSpec;
- (void)_setNeedsUpdate;
- (void)_updateSpec;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXStoryMemoryFeedViewLayoutSpecManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_memoriesSpecManager, 0);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXMemoriesSpecManager)memoriesSpecManager
{
  return self->_memoriesSpecManager;
}

- (int64_t)layoutKind
{
  return self->_layoutKind;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)MemoriesSpecManagerObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryMemoryFeedViewLayoutSpecManager.m" lineNumber:96 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PXStoryMemoryFeedViewLayoutSpecManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD0FA8;
    v12[4] = self;
    [(PXStoryMemoryFeedViewLayoutSpecManager *)self performChanges:v12];
  }
}

uint64_t __71__PXStoryMemoryFeedViewLayoutSpecManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSpec];
}

- (void)_updateSpec
{
  v3 = [(PXStoryMemoryFeedViewLayoutSpecManager *)self memoriesSpecManager];
  id v13 = [v3 spec];

  v4 = [[PXStoryMemoryFeedViewLayoutSpec alloc] initWithMemoriesSpec:v13];
  [(PXFeedViewLayoutSpecManager *)self setSpec:v4];

  v5 = [v13 extendedTraitCollection];
  [v5 layoutReferenceSize];
  double v7 = v6;
  v8 = [v13 extendedTraitCollection];
  id v9 = [v8 rootExtendedTraitCollection];
  [v9 layoutReferenceSize];
  BOOL v11 = v7 == v10;
  v12 = [(PXFeedViewLayoutSpecManager *)self spec];
  [v12 setIsFullScreen:v11];
}

- (void)_invalidateSpec
{
  id v2 = [(PXStoryMemoryFeedViewLayoutSpecManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSpec];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryMemoryFeedViewLayoutSpecManager;
  [(PXStoryMemoryFeedViewLayoutSpecManager *)&v4 didPerformChanges];
  v3 = [(PXStoryMemoryFeedViewLayoutSpecManager *)self updater];
  [v3 updateIfNeeded];
}

- (PXStoryMemoryFeedViewLayoutSpecManager)initWithLayoutKind:(int64_t)a3 extendedTraitCollection:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3 == 1)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXStoryMemoryFeedViewLayoutSpecManager.m", 46, @"Invalid parameter not satisfying: %@", @"layoutKind == PXStoryMemoryFeedLayoutKindVerticalFeed" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXStoryMemoryFeedViewLayoutSpecManager.m", 47, @"Invalid parameter not satisfying: %@", @"extendedTraitCollection != nil" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)PXStoryMemoryFeedViewLayoutSpecManager;
  id v9 = [(PXStoryMemoryFeedViewLayoutSpecManager *)&v20 init];
  double v10 = v9;
  if (v9)
  {
    v9->_layoutKind = a3;
    BOOL v11 = [[PXMemoriesSpecManager alloc] initWithExtendedTraitCollection:v8 options:0 style:0];
    memoriesSpecManager = v10->_memoriesSpecManager;
    v10->_memoriesSpecManager = v11;

    [(PXMemoriesSpecManager *)v10->_memoriesSpecManager registerChangeObserver:v10 context:MemoriesSpecManagerObservationContext];
    uint64_t v13 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v10 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v13;

    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateSpec];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__PXStoryMemoryFeedViewLayoutSpecManager_initWithLayoutKind_extendedTraitCollection___block_invoke;
    v18[3] = &unk_1E5DD0FA8;
    v19 = v10;
    [(PXStoryMemoryFeedViewLayoutSpecManager *)v19 performChanges:v18];
  }
  return v10;
}

uint64_t __85__PXStoryMemoryFeedViewLayoutSpecManager_initWithLayoutKind_extendedTraitCollection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSpec];
}

- (PXStoryMemoryFeedViewLayoutSpecManager)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryFeedViewLayoutSpecManager.m", 42, @"%s is not available as initializer", "-[PXStoryMemoryFeedViewLayoutSpecManager init]");

  abort();
}

@end