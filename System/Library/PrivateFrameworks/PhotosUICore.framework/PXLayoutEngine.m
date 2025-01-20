@interface PXLayoutEngine
- (BOOL)_needsUpdate;
- (BOOL)canComputeLayoutSnapshot;
- (PXLayoutDataSourceChangeDetails)changeDetails;
- (PXLayoutEngine)init;
- (PXLayoutEngine)initWithLayoutGenerator:(id)a3 dataSourceSnapshot:(id)a4;
- (PXLayoutEngineDataSourceSnapshot)dataSourceSnapshot;
- (PXLayoutEngineDelegate)delegate;
- (PXLayoutGenerator)layoutGenerator;
- (PXLayoutItem)seedItem;
- (PXLayoutSnapshot)layoutSnapshot;
- (id)computeLayoutSnapshot;
- (id)performChangesAndWait:(id)a3;
- (void)_publishChanges;
- (void)_updateIfNeeded;
- (void)_updateLayoutDataIfNeeded;
- (void)_updateLayoutSnapshotIfNeeded;
- (void)invalidateLayoutData;
- (void)invalidateLayoutSnapshot;
- (void)performChanges:(id)a3;
- (void)setChangeDetails:(id)a3;
- (void)setDataSourceSnapshot:(id)a3;
- (void)setDataSourceSnapshot:(id)a3 withChangeDetails:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLayoutGenerator:(id)a3;
- (void)setLayoutSnapshot:(id)a3;
- (void)setSeedItem:(id)a3;
- (void)updateLayoutDataWithChangeDetails:(id)a3;
@end

@implementation PXLayoutEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_seedItem, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_layoutSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
}

- (void)setChangeDetails:(id)a3
{
}

- (PXLayoutDataSourceChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void)setLayoutGenerator:(id)a3
{
}

- (PXLayoutGenerator)layoutGenerator
{
  return self->_layoutGenerator;
}

- (PXLayoutItem)seedItem
{
  return self->_seedItem;
}

- (PXLayoutEngineDataSourceSnapshot)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (PXLayoutSnapshot)layoutSnapshot
{
  return self->_layoutSnapshot;
}

- (void)setDelegate:(id)a3
{
}

- (PXLayoutEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXLayoutEngineDelegate *)WeakRetained;
}

- (id)computeLayoutSnapshot
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXLayoutEngine.m" lineNumber:189 description:@"-computeLayoutSnapshot: must be overriden"];

  return 0;
}

- (void)updateLayoutDataWithChangeDetails:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PXLayoutEngine.m" lineNumber:185 description:@"-updateLayoutDataWithChangeDetails: must be overriden"];
}

- (BOOL)canComputeLayoutSnapshot
{
  return self->_layoutGenerator && self->_dataSourceSnapshot != 0;
}

- (void)_publishChanges
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__PXLayoutEngine__publishChanges__block_invoke;
  v2[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __33__PXLayoutEngine__publishChanges__block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 layoutEngineDidUpdateLayoutSnapshot:v2];
  }
}

- (void)setLayoutSnapshot:(id)a3
{
  v6 = (PXLayoutSnapshot *)a3;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXLayoutEngine.m" lineNumber:152 description:@"layoutSnapshot cannot be nil"];

    v6 = 0;
  }
  if (self->_layoutSnapshot != v6)
  {
    v8 = v6;
    objc_storeStrong((id *)&self->_layoutSnapshot, a3);
    [(PXLayoutSnapshot *)self->_layoutSnapshot setDataSourceSnapshot:self->_dataSourceSnapshot];
    [(PXLayoutEngine *)self _publishChanges];
    v6 = v8;
  }
}

- (void)setDataSourceSnapshot:(id)a3 withChangeDetails:(id)a4
{
  id v6 = a4;
  [(PXLayoutEngine *)self setDataSourceSnapshot:a3];
  [(PXLayoutEngine *)self setChangeDetails:v6];

  [(PXLayoutEngine *)self invalidateLayoutData];
}

- (void)setDataSourceSnapshot:(id)a3
{
  if (self->_dataSourceSnapshot != a3)
  {
    v4 = (PXLayoutEngineDataSourceSnapshot *)[a3 copyWithZone:0];
    dataSourceSnapshot = self->_dataSourceSnapshot;
    self->_dataSourceSnapshot = v4;
  }
}

- (void)setSeedItem:(id)a3
{
  id v5 = (PXLayoutItem *)a3;
  id v6 = v5;
  if (self->_seedItem != v5)
  {
    v8 = v5;
    char v7 = -[PXLayoutItem isEqual:](v5, "isEqual:");
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_seedItem, a3);
      [(PXLayoutEngine *)self invalidateLayoutSnapshot];
      id v6 = v8;
    }
  }
}

- (void)_updateLayoutDataIfNeeded
{
  if (self->_needsUpdateFlags.layoutData)
  {
    self->_needsUpdateFlags.layoutData = 0;
    [(PXLayoutEngine *)self updateLayoutDataWithChangeDetails:self->_changeDetails];
    [(PXLayoutEngine *)self setChangeDetails:0];
  }
}

- (void)invalidateLayoutData
{
  self->_needsUpdateFlags.layoutData = 1;
  [(PXLayoutEngine *)self _setNeedsUpdate];
}

- (void)_updateLayoutSnapshotIfNeeded
{
  if (self->_needsUpdateFlags.layoutSnapshot)
  {
    self->_needsUpdateFlags.layoutSnapshot = 0;
    if ([(PXLayoutEngine *)self canComputeLayoutSnapshot])
    {
      id v3 = [(PXLayoutEngine *)self computeLayoutSnapshot];
      if (v3)
      {
        v4 = v3;
        [(PXLayoutEngine *)self setLayoutSnapshot:v3];
        id v3 = v4;
      }
    }
  }
}

- (void)invalidateLayoutSnapshot
{
  self->_needsUpdateFlags.layoutSnapshot = 1;
  [(PXLayoutEngine *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXLayoutEngine *)self _needsUpdate])
  {
    [(PXLayoutEngine *)self _updateLayoutDataIfNeeded];
    [(PXLayoutEngine *)self _updateLayoutSnapshotIfNeeded];
    if ([(PXLayoutEngine *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PXLayoutEngine.m" lineNumber:90 description:@"updates still needed after an update cycle"];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.layoutData || self->_needsUpdateFlags.layoutSnapshot;
}

- (id)performChangesAndWait:(id)a3
{
  id v4 = a3;
  internalWorkQueue = self->_internalWorkQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__PXLayoutEngine_performChangesAndWait___block_invoke;
  v9[3] = &unk_1E5DD3280;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(internalWorkQueue, v9);
  char v7 = self->_layoutSnapshot;

  return v7;
}

void __40__PXLayoutEngine_performChangesAndWait___block_invoke(uint64_t a1)
{
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PXLayoutEngine_performChanges___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__PXLayoutEngine_performChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _InternalWorkQueue_PerformChanges(WeakRetained, *(void *)(a1 + 32));
}

- (PXLayoutEngine)initWithLayoutGenerator:(id)a3 dataSourceSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXLayoutEngine;
  id v8 = [(PXLayoutEngine *)&v16 init];
  if (v8)
  {
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photosUICore.layoutEngine.internalWork-queue", v10);
    internalWorkQueue = v8->_internalWorkQueue;
    v8->_internalWorkQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [v6 copy];
    layoutGenerator = v8->_layoutGenerator;
    v8->_layoutGenerator = (PXLayoutGenerator *)v13;

    [(PXLayoutEngine *)v8 setDataSourceSnapshot:v7 withChangeDetails:0];
  }

  return v8;
}

- (PXLayoutEngine)init
{
  return 0;
}

@end