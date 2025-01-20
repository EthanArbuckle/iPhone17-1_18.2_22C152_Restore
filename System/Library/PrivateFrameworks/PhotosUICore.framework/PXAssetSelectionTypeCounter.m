@interface PXAssetSelectionTypeCounter
- ($DE30A600513D762F9B6AB73D2AED4B95)typedCount;
- (PXAssetSelectionTypeCounter)init;
- (PXAssetSelectionTypeCounter)initWithSelectionManager:(id)a3;
- (PXInfoUpdater)infoUpdater;
- (PXSectionedSelectionManager)selectionManager;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (id)selectionSnapshot;
- (int64_t)priorityForInfoRequestOfKind:(id)a3;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setTypedCount:(id)a3;
@end

@implementation PXAssetSelectionTypeCounter

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 isEqualToString:@"SelectedAssetsTypedCount"])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXAssetSelectionTypeCounter.m" lineNumber:92 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v9 = [(PXAssetSelectionTypeCounter *)self selectionSnapshot];
  if ([v9 isAnyItemSelected]
    && ([(PXAssetSelectionTypeCounter *)self selectionManager],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 disableAssetTypeCounting],
        v10,
        !v11))
  {
    v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    countUpdateQueue = self->_countUpdateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PXAssetSelectionTypeCounter_requestInfoOfKind_withResultHandler___block_invoke;
    block[3] = &unk_1E5DD0E78;
    id v13 = v14;
    id v19 = v13;
    id v20 = v9;
    id v21 = v8;
    dispatch_async(countUpdateQueue, block);
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPXDisplayAssetTypedCount:", *(void *)off_1E5DAAEF8, *((void *)off_1E5DAAEF8 + 1));
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    id v13 = 0;
  }

  return v13;
}

- (id)selectionSnapshot
{
  v2 = [(PXAssetSelectionTypeCounter *)self selectionManager];
  v3 = [v2 selectionSnapshot];

  return v3;
}

- (PXSectionedSelectionManager)selectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionManager);
  return (PXSectionedSelectionManager *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSelectionManagerObserverContext != a5)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXAssetSelectionTypeCounter.m" lineNumber:57 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v12 = v9;
    v10 = [(PXAssetSelectionTypeCounter *)self infoUpdater];
    [v10 invalidateInfo];

    id v9 = v12;
  }
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5 = a3;
  id v6 = [(PXAssetSelectionTypeCounter *)self infoUpdater];

  if (v6 != v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXAssetSelectionTypeCounter.m" lineNumber:127 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v7 = [(PXAssetSelectionTypeCounter *)self infoUpdater];
  id v8 = [v7 info];
  uint64_t v9 = [v8 PXDisplayAssetTypedCountValue];
  uint64_t v11 = v10;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__PXAssetSelectionTypeCounter_infoUpdaterDidUpdate___block_invoke;
  v13[3] = &unk_1E5DD0460;
  v13[4] = self;
  v13[5] = v9;
  v13[6] = v11;
  [(PXAssetSelectionTypeCounter *)self performChanges:v13];
}

- (PXInfoUpdater)infoUpdater
{
  return self->_infoUpdater;
}

uint64_t __52__PXAssetSelectionTypeCounter_infoUpdaterDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTypedCount:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setTypedCount:(id)a3
{
  if (self->_typedCount.count != a3.var0 || self->_typedCount.type != a3.var1)
  {
    self->_typedCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    [(PXAssetSelectionTypeCounter *)self signalChange:1];
  }
}

- (PXAssetSelectionTypeCounter)initWithSelectionManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXAssetSelectionTypeCounter;
  id v5 = [(PXAssetSelectionTypeCounter *)&v13 init];
  if (v5)
  {
    id v6 = [[PXInfoUpdater alloc] initWithInfoProvider:v5 infoKind:@"SelectedAssetsTypedCount"];
    infoUpdater = v5->_infoUpdater;
    v5->_infoUpdater = v6;

    [(PXInfoUpdater *)v5->_infoUpdater setObserver:v5];
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.assetSelectionTypeCounter", v9);
    countUpdateQueue = v5->_countUpdateQueue;
    v5->_countUpdateQueue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v5->_selectionManager, v4);
    [v4 registerChangeObserver:v5 context:PXSelectionManagerObserverContext];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoUpdater, 0);
  objc_destroyWeak((id *)&self->_selectionManager);
  objc_storeStrong((id *)&self->_countUpdateQueue, 0);
}

- ($DE30A600513D762F9B6AB73D2AED4B95)typedCount
{
  p_typedCount = &self->_typedCount;
  unint64_t count = self->_typedCount.count;
  int64_t type = p_typedCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (int64_t)priorityForInfoRequestOfKind:(id)a3
{
  if (![a3 isEqualToString:@"SelectedAssetsTypedCount"]) {
    return 0;
  }
  id v4 = [(PXAssetSelectionTypeCounter *)self selectionSnapshot];
  id v5 = [v4 selectedIndexPaths];
  uint64_t v6 = [v5 count];

  int64_t v7 = 10;
  if (v6 != 1) {
    int64_t v7 = 0;
  }
  if (v6) {
    return v7;
  }
  else {
    return 100;
  }
}

void __67__PXAssetSelectionTypeCounter_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v2 = PXDisplayAssetTypedCountFromSelectionSnapshot(*(void **)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithPXDisplayAssetTypedCount:", v2, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (PXAssetSelectionTypeCounter)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetSelectionTypeCounter.m", 34, @"%s is not available as initializer", "-[PXAssetSelectionTypeCounter init]");

  abort();
}

@end