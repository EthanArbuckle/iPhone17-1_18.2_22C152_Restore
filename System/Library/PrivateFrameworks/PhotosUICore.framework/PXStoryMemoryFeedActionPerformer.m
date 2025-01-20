@interface PXStoryMemoryFeedActionPerformer
- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 fromViewController:(id)a5;
- (BOOL)navigateToObjectReference:(id)a3 originalSource:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 willPresentHandler:(id)a7 completionHandler:(id)a8;
- (PXStoryMemoryFeedActionPerformer)init;
- (PXStoryMemoryFeedActionPerformer)initWithViewControllerSetupBlock:(id)a3;
- (id)viewControllerSetupBlock;
- (void)_presentViewController:(id)a3 contentViewController:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)deleteItemsInSelection:(id)a3 undoManager:(id)a4;
@end

@implementation PXStoryMemoryFeedActionPerformer

- (void).cxx_destruct
{
}

- (id)viewControllerSetupBlock
{
  return self->_viewControllerSetupBlock;
}

- (void)_presentViewController:(id)a3 contentViewController:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  if (a4) {
    id v12 = a4;
  }
  else {
    id v12 = a3;
  }
  id v13 = v12;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  +[PXGViewControllerTransition prepareTransitionFromSummaryViewController:v15 toPresentedViewController:v17 detailViewController:v13];
  [v15 presentViewController:v17 animated:v8 completion:v14];
}

- (void)deleteItemsInSelection:(id)a3 undoManager:(id)a4
{
  id v5 = a4;
  [a3 fetchSelectedObjects];
  objc_claimAutoreleasedReturnValue();
  PXMap();
}

void __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    v3 = [(PXMemoriesAction *)[PXRejectMemoriesAction alloc] initWithMemories:a1[4]];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_3;
    v5[3] = &unk_1E5DD3158;
    uint64_t v4 = a1[5];
    v5[4] = a1[6];
    [(PXAction *)v3 executeWithUndoManager:v4 completionHandler:v5];
  }
}

void __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed execute reject memories action for %@. Error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __71__PXStoryMemoryFeedActionPerformer_deleteItemsInSelection_undoManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetCollection];
}

- (BOOL)navigateToObjectReference:(id)a3 originalSource:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 willPresentHandler:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, id))a7;
  id v17 = a8;
  v18 = PXStoryConfigurationForObjectReference(a3);
  v19 = v18;
  if (v18)
  {
    [v18 configureWithNavigationSource:v14];
    v20 = +[PXStorySettings sharedInstance];
    int v21 = [v20 enableProtoPlayground];

    if (v21)
    {
      v22 = PXSoftLinkedProtoMemoriesPlayerViewController(v19);
      id v23 = 0;
    }
    else
    {
      id v31 = 0;
      v22 = +[PXStoryUIFactory viewControllerWithConfiguration:v19 contentViewController:&v31];
      id v23 = v31;
    }
    v24 = [(PXStoryMemoryFeedActionPerformer *)self viewControllerSetupBlock];

    if (v24)
    {
      v25 = [(PXStoryMemoryFeedActionPerformer *)self viewControllerSetupBlock];
      ((void (**)(void, id))v25)[2](v25, v23);
    }
    if (v16) {
      v16[2](v16, v23);
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __142__PXStoryMemoryFeedActionPerformer_navigateToObjectReference_originalSource_fromViewController_animated_willPresentHandler_completionHandler___block_invoke;
    v28[3] = &unk_1E5DD3280;
    id v29 = v23;
    id v30 = v17;
    id v26 = v23;
    [(PXStoryMemoryFeedActionPerformer *)self _presentViewController:v22 contentViewController:v26 fromViewController:v15 animated:v10 completion:v28];
  }
  return v19 != 0;
}

uint64_t __142__PXStoryMemoryFeedActionPerformer_navigateToObjectReference_originalSource_fromViewController_animated_willPresentHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 fromViewController:(id)a5
{
  id v9 = a5;
  long long v10 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v10;
  id v11 = [a4 objectReferenceAtIndexPath:v15];
  if (!v11)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXStoryMemoryFeedActionPerformer.m", 54, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
  }
  BOOL v12 = [(PXStoryMemoryFeedActionPerformer *)self navigateToObjectReference:v11 originalSource:@"ForYou" fromViewController:v9 animated:1 willPresentHandler:0 completionHandler:0];

  return v12;
}

- (PXStoryMemoryFeedActionPerformer)initWithViewControllerSetupBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMemoryFeedActionPerformer;
  id v5 = [(PXStoryMemoryFeedActionPerformer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id viewControllerSetupBlock = v5->_viewControllerSetupBlock;
    v5->_id viewControllerSetupBlock = (id)v6;
  }
  return v5;
}

- (PXStoryMemoryFeedActionPerformer)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryFeedActionPerformer.m", 41, @"%s is not available as initializer", "-[PXStoryMemoryFeedActionPerformer init]");

  abort();
}

@end