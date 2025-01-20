@interface PXPhotosDragController
- (BOOL)_addDraggedAssetReferences:(id)a3 toLocalSession:(id)a4;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)canDragIn;
- (BOOL)canDragOut;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)isDragSessionActive;
- (BOOL)isUpdatingExcludedAssets;
- (BOOL)reorderFeedbackEnabled;
- (NSMutableSet)localDragSessions;
- (NSSet)draggedAssetReferences;
- (NSSet)excludedAssets;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetReference)hitAssetReference;
- (PXPhotosDragController)init;
- (PXPhotosDragController)initWithContentView:(id)a3 selectionManager:(id)a4 assetCollectionActionManager:(id)a5 delegate:(id)a6;
- (PXPhotosDragControllerDelegate)delegate;
- (PXSectionedSelectionManager)selectionManager;
- (PXUpdater)updater;
- (UIDragInteraction)dragInteraction;
- (UIDropInteraction)dropInteraction;
- (UIView)contentView;
- (UIViewController)viewControllerForPresentation;
- (_UIDragSnappingFeedbackGenerator)reorderFeedbackGenerator;
- (id)_actionManagerForDropSession:(id)a3;
- (id)_assetReferenceForDragItem:(id)a3;
- (id)_createDragItemForAssetReference:(id)a3;
- (id)_createLocalSession;
- (id)_draggableAssetReferenceAtLocation:(CGPoint)a3;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)scrollView;
- (id)undoManagerForActionPerformer:(id)a3;
- (unint64_t)_supportedDropOperationForSession:(id)a3;
- (void)_localSessionForDragSession:(id)a3 changeBlock:(id)a4;
- (void)_localSessionForDropSession:(id)a3 changeBlock:(id)a4;
- (void)_presentConfidentialityWarning;
- (void)_pruneLocalSessionIfFinished:(id)a3;
- (void)_removeDraggedAssetReferece:(id)a3 fromLocalSession:(id)a4;
- (void)_setupWithContentView:(id)a3;
- (void)_updateDraggedAssetReferences;
- (void)_updateDropTarget;
- (void)_updateExcludedAssets;
- (void)_updateIsDragSessionActive;
- (void)_updateTrackedAssetReferences;
- (void)dealloc;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)localDragSession:(id)a3 didChangeProperty:(SEL)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)removeFromView;
- (void)setCanDragIn:(BOOL)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setExcludedAssets:(id)a3;
- (void)setHitAssetReference:(id)a3;
- (void)setIsDragSessionActive:(BOOL)a3;
- (void)setIsUpdatingExcludedAssets:(BOOL)a3;
- (void)setReorderFeedbackEnabled:(BOOL)a3;
@end

@implementation PXPhotosDragController

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)SelectionManagerObserverContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosDragController.m" lineNumber:927 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 3) != 0)
  {
    id v11 = v9;
    [(PXPhotosDragController *)self _updateTrackedAssetReferences];
    id v9 = v11;
  }
}

- (void)_updateTrackedAssetReferences
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [(PXPhotosDragController *)self selectionManager];
  v5 = [v4 selectionSnapshot];
  char v6 = [v5 dataSource];

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v16 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v13 handleFailureInMethod:a2, self, @"PXPhotosDragController.m", 435, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.selectionManager.selectionSnapshot.dataSource", v15, v16 object file lineNumber description];
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v11++) updateWithDataSource:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v12 = [(PXPhotosDragController *)self updater];
  [v12 updateIfNeeded];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (NSMutableSet)localDragSessions
{
  return self->_localDragSessions;
}

- (PXPhotosDragController)initWithContentView:(id)a3 selectionManager:(id)a4 assetCollectionActionManager:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDragController;
  v14 = [(PXPhotosDragController *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v14];
    updater = v14->_updater;
    v14->_updater = (PXUpdater *)v15;

    [(PXUpdater *)v14->_updater addUpdateSelector:sel__updateDraggedAssetReferences];
    [(PXUpdater *)v14->_updater addUpdateSelector:sel__updateDropTarget];
    [(PXUpdater *)v14->_updater addUpdateSelector:sel__updateIsDragSessionActive];
    [(PXUpdater *)v14->_updater addUpdateSelector:sel__updateExcludedAssets];
    long long v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    localDragSessions = v14->_localDragSessions;
    v14->_localDragSessions = v17;

    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeStrong((id *)&v14->_selectionManager, a4);
    [v11 registerChangeObserver:v14 context:SelectionManagerObserverContext];
    objc_storeStrong((id *)&v14->_assetCollectionActionManager, a5);
    long long v19 = [MEMORY[0x1E4FB20C8] defaultConfiguration];
    long long v20 = [v19 tweakedConfigurationForClass:objc_opt_class() usage:@"reorder"];

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB20C0]) initWithConfiguration:v20 view:v10];
    reorderFeedbackGenerator = v14->_reorderFeedbackGenerator;
    v14->_reorderFeedbackGenerator = (_UIDragSnappingFeedbackGenerator *)v21;

    objc_storeWeak((id *)&v14->_contentView, v10);
    [(PXPhotosDragController *)v14 _setupWithContentView:v10];
    [(PXPhotosDragController *)v14 setCanDragIn:1];
  }
  return v14;
}

- (void)setCanDragIn:(BOOL)a3
{
  if (self->_canDragIn != a3)
  {
    BOOL v3 = a3;
    v5 = [(PXPhotosDragController *)self dropInteraction];

    if (v5)
    {
      char v6 = [(PXPhotosDragController *)self contentView];
      v7 = [(PXPhotosDragController *)self dropInteraction];
      [v6 removeInteraction:v7];

      [(PXPhotosDragController *)self setDropInteraction:0];
    }
    self->_canDragIn = v3;
    if (v3)
    {
      id v9 = (id)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:self];
      [v9 setAllowsSimultaneousDropSessions:1];
      uint64_t v8 = [(PXPhotosDragController *)self contentView];
      [v8 addInteraction:v9];

      [(PXPhotosDragController *)self setDropInteraction:v9];
    }
  }
}

- (void)setDropInteraction:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (void)_setupWithContentView:(id)a3
{
  id v6 = a3;
  if ([(PXPhotosDragController *)self canDragOut])
  {
    v4 = (UIDragInteraction *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:self];
    [v6 addInteraction:v4];
    [(UIDragInteraction *)v4 setEnabled:1];
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v4;
  }
}

- (BOOL)canDragOut
{
  v2 = +[PXDragAndDropSettings sharedInstance];
  char v3 = [v2 dragOutEnabled];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_hitAssetReference, 0);
  objc_storeStrong((id *)&self->_excludedAssets, 0);
  objc_storeStrong((id *)&self->_reorderFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_localDragSessions, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setHitAssetReference:(id)a3
{
}

- (PXAssetReference)hitAssetReference
{
  return self->_hitAssetReference;
}

- (BOOL)reorderFeedbackEnabled
{
  return self->_reorderFeedbackEnabled;
}

- (NSSet)excludedAssets
{
  return self->_excludedAssets;
}

- (_UIDragSnappingFeedbackGenerator)reorderFeedbackGenerator
{
  return self->_reorderFeedbackGenerator;
}

- (void)setIsUpdatingExcludedAssets:(BOOL)a3
{
  self->_isUpdatingExcludedAssets = a3;
}

- (BOOL)isUpdatingExcludedAssets
{
  return self->_isUpdatingExcludedAssets;
}

- (BOOL)canDragIn
{
  return self->_canDragIn;
}

- (BOOL)isDragSessionActive
{
  return self->_isDragSessionActive;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXPhotosDragControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosDragControllerDelegate *)WeakRetained;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (void)localDragSession:(id)a3 didChangeProperty:(SEL)a4
{
  if (![(PXPhotosDragController *)self isUpdatingExcludedAssets])
  {
    if (sel_draggedAssetReferences == a4) {
      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateDraggedAssetReferences];
    }
    if (sel_dropTargetAssetReference == a4 || sel_hitAssetReference == a4) {
      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateDropTarget];
    }
    if (sel_isDragSessionActive == a4)
    {
      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateDraggedAssetReferences];
      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateIsDragSessionActive];
    }
    if (sel_draggedAssetReferences == a4
      || sel_dropTargetAssetReference == a4
      || sel_dropActionPerformer == a4
      || sel_excludedAssets == a4
      || sel_isDropActiveInsideView == a4
      || sel_dropOperation == a4)
    {
      updater = self->_updater;
      [(PXUpdater *)updater setNeedsUpdateOf:sel__updateExcludedAssets];
    }
  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  v4 = [(PXPhotosDragController *)self delegate];
  v5 = [v4 dragControllerUndoManager:self];

  return v5;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = [(PXPhotosDragController *)self viewControllerForPresentation];
  [v7 dismissViewControllerAnimated:1 completion:v6];

  return 1;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosDragController *)self viewControllerForPresentation];
  [v6 presentViewController:v5 animated:1 completion:0];

  return 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  [(PXPhotosDragController *)self _localSessionForDropSession:a4 changeBlock:&__block_literal_global_277];
  id v5 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    [(PXPhotosDragController *)self setReorderFeedbackEnabled:0];
  }
}

void __56__PXPhotosDragController_dropInteraction_sessionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDropActionPerformer:0];
  [v2 setDropSession:0];
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PXPhotosDragController_dropInteraction_concludeDrop___block_invoke;
  v4[3] = &unk_1E5DB6480;
  v4[4] = self;
  [(PXPhotosDragController *)self _localSessionForDropSession:a4 changeBlock:v4];
}

void __55__PXPhotosDragController_dropInteraction_concludeDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDropActionPerformer:0];
  uint64_t v4 = [v3 dropOperation];

  if (v4 == 3 && [*(id *)(a1 + 32) reorderFeedbackEnabled])
  {
    id v5 = [*(id *)(a1 + 32) reorderFeedbackGenerator];
    [v5 draggedObjectLanded];
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "dropInteraction: %@ previewForDroppingItem: %@", buf, 0x16u);
  }

  id v13 = [(PXPhotosDragController *)self _assetReferenceForDragItem:v10];
  if (v13)
  {
    v14 = [(PXPhotosDragController *)self selectionManager];
    uint64_t v15 = [v14 selectionSnapshot];
    v16 = [v15 dataSource];

    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
        [v23 handleFailureInMethod:a2, self, @"PXPhotosDragController.m", 863, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.selectionManager.selectionSnapshot.dataSource", v25, v26 object file lineNumber description];
      }
    }
    long long v17 = [v16 assetReferenceForAssetReference:v13];
    long long v18 = [(PXPhotosDragController *)self delegate];
    long long v19 = [v18 dragController:self regionOfInterestForAssetReference:v13 image:0];

    if (v19 && v17)
    {
      long long v20 = [(PXPhotosDragController *)self delegate];
      uint64_t v21 = [v20 dragController:self scrollViewForAssetReference:v17];

      [v19 rectInCoordinateSpace:v21];
      PXRectGetCenter();
    }
  }
  return 0;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [(PXPhotosDragController *)self _supportedDropOperationForSession:v8];
  id v10 = @"PXAssetCollectionActionTypeDropAssets";
  if (v9 == 3) {
    id v10 = @"PXAssetCollectionActionTypeMoveAssets";
  }
  id v11 = v10;
  id v12 = [(PXPhotosDragController *)self _actionManagerForDropSession:v8];
  id v13 = [v12 actionPerformerForActionType:v11];
  v14 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    uint64_t v31 = v13;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "dropInteraction:%@ performDrop:%@ actionPerformer:%@", buf, 0x20u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke;
  v24[3] = &unk_1E5DB6480;
  id v25 = v13;
  id v15 = v13;
  [(PXPhotosDragController *)self _localSessionForDropSession:v8 changeBlock:v24];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2;
  v18[3] = &unk_1E5DB6520;
  id v19 = v7;
  id v20 = v8;
  uint64_t v21 = self;
  unint64_t v22 = v9;
  SEL v23 = a2;
  id v16 = v8;
  id v17 = v7;
  [v15 performActionWithCompletionHandler:v18];
}

uint64_t __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDropActionPerformer:*(void *)(a1 + 32)];
}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    unint64_t v9 = @"NO";
    if (a2) {
      unint64_t v9 = @"YES";
    }
    id v10 = v9;
    *(_DWORD *)buf = 138413058;
    uint64_t v40 = v7;
    __int16 v41 = 2112;
    uint64_t v42 = v8;
    __int16 v43 = 2112;
    v44 = v10;
    __int16 v45 = 2112;
    id v46 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "dropInteraction:%@ performDrop:%@ success:%@ error:%@", buf, 0x2Au);
  }
  if (*(void *)(a1 + 56) == 3)
  {
    id v11 = [*(id *)(a1 + 48) selectionManager];
    id v12 = [v11 dataSourceManager];

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v23 = *(void *)(a1 + 64);
        uint64_t v24 = *(void *)(a1 + 48);
        id v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        id v27 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
        [v22 handleFailureInMethod:v23, v24, @"PXPhotosDragController.m", 821, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.selectionManager.dataSourceManager", v26, v27 object file lineNumber description];
      }
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_267;
    v37[3] = &unk_1E5DB64D0;
    v37[4] = *(void *)(a1 + 48);
    id v13 = v12;
    id v38 = v13;
    [v13 performChanges:v37];
    v14 = [*(id *)(a1 + 48) draggedAssetReferences];
    id v15 = [v14 allObjects];

    id v16 = [*(id *)(a1 + 48) delegate];
    int v17 = [v16 dragController:*(void *)(a1 + 48) shouldSelectRearrangedAssetReferences:v15];

    if (v17)
    {
      long long v18 = [*(id *)(a1 + 48) selectionManager];
      id v19 = [v18 selectionSnapshot];
      id v20 = [v19 dataSource];

      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __int16 v28 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v33 = *(void *)(a1 + 64);
          uint64_t v29 = *(void *)(a1 + 48);
          __int16 v30 = (objc_class *)objc_opt_class();
          uint64_t v31 = NSStringFromClass(v30);
          uint64_t v32 = objc_msgSend(v20, "px_descriptionForAssertionMessage");
          [v28 handleFailureInMethod:v33, v29, @"PXPhotosDragController.m", 834, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"selectionManager.selectionSnapshot.dataSource", v31, v32 object file lineNumber description];
        }
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2_271;
      v34[3] = &unk_1E5DB64F8;
      id v35 = v15;
      id v36 = v20;
      id v21 = v20;
      [v18 performChanges:v34];
    }
  }
  [*(id *)(a1 + 48) _localSessionForDropSession:*(void *)(a1 + 40) changeBlock:&__block_literal_global_274];
}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_267(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) hitAssetReference];
  uint64_t v4 = [v3 assetCollection];
  if (v4)
  {
    id v5 = (void *)v4;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) dataSource];
    id v5 = [v6 firstAssetCollection];

    uint64_t v7 = v8;
    if (!v5) {
      goto LABEL_5;
    }
  }
  [v8 refreshResultsForAssetCollection:v5];

  uint64_t v7 = v8;
LABEL_5:
}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2_271(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *(void *)off_1E5DAAED8;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        id v11 = *(void **)(a1 + 40);
        if (v11)
        {
          [v11 indexPathForAssetReference:v10];
          if ((void)v15 != v8 && (void)v16 != 0x7FFFFFFFFFFFFFFFLL && *((void *)&v16 + 1) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v14[0] = v15;
            v14[1] = v16;
            [v3 setSelectedState:1 forIndexPath:v14];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setHitAssetReference:0];
  [v2 setDropTargetAssetReference:0];
  [v2 setIsDropActiveInsideView:0];
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v18 = a4;
  uint64_t v5 = [(PXPhotosDragController *)self contentView];
  uint64_t v6 = [v5 window];
  [v18 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(PXPhotosDragController *)self contentView];
  id v12 = [v11 window];
  id v13 = objc_msgSend(v12, "hitTest:withEvent:", 0, v8, v10);

  uint64_t v14 = [(PXPhotosDragController *)self contentView];
  if (v13 == (void *)v14)
  {
  }
  else
  {
    long long v15 = (void *)v14;
    long long v16 = [(PXPhotosDragController *)self contentView];
    char v17 = [v13 isDescendantOfView:v16];

    if ((v17 & 1) == 0) {
      [(PXPhotosDragController *)self _localSessionForDropSession:v18 changeBlock:&__block_literal_global_266_72571];
    }
  }
}

void __57__PXPhotosDragController_dropInteraction_sessionDidExit___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsDropActiveInsideView:0];
  [v2 setHitAssetReference:0];
  [v2 setDropTargetAssetReference:0];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(PXPhotosDragController *)self _supportedDropOperationForSession:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PXPhotosDragController_dropInteraction_sessionDidUpdate___block_invoke;
  v10[3] = &unk_1E5DB64A8;
  id v12 = self;
  unint64_t v13 = v6;
  id v11 = v5;
  id v7 = v5;
  [(PXPhotosDragController *)self _localSessionForDropSession:v7 changeBlock:v10];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v6];

  return v8;
}

void __59__PXPhotosDragController_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  [v24 setIsDropActiveInsideView:1];
  if (*(void *)(a1 + 48) == 3)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) contentView];
    [v3 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    double v9 = [*(id *)(a1 + 40) delegate];
    objc_msgSend(v9, "dragController:dropTargetAssetReferenceForLocation:", *(void *)(a1 + 40), v6, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) scrollView];
    [v11 locationInView:v12];
    double v14 = v13;
    double v16 = v15;

    objc_msgSend(v24, "setScrollViewLocation:", v14, v16);
    [v24 velocity];
    double v19 = hypot(v17, v18);
    long long v20 = +[PXDragAndDropSettings sharedInstance];
    [v20 dropGestureSpeedLimit];
    double v22 = v21;

    if (v19 <= v22)
    {
      id v10 = v10;
      [*(id *)(a1 + 40) setReorderFeedbackEnabled:1];
      uint64_t v23 = v10;
    }
    else
    {
      uint64_t v23 = [v24 dropTargetAssetReference];
    }
  }
  else
  {
    id v10 = 0;
    uint64_t v23 = 0;
  }
  [v24 setHitAssetReference:v10];
  [v24 setDropTargetAssetReference:v23];
  [v24 setDropOperation:*(void *)(a1 + 48)];
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
}

uint64_t __58__PXPhotosDragController_dropInteraction_sessionDidEnter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDropActiveInsideView:1];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "dropInteraction: %@ canHandleSession: %@", (uint8_t *)&v12, 0x16u);
  }

  if ([(PXPhotosDragController *)self canDragIn])
  {
    double v9 = [(PXPhotosDragController *)self _actionManagerForDropSession:v7];
    char v10 = [v9 canPerformActionType:@"PXAssetCollectionActionTypeDropAssets"];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)_supportedDropOperationForSession:(id)a3
{
  id v5 = a3;
  id v6 = [(PXPhotosDragController *)self selectionManager];
  id v7 = [v6 selectionSnapshot];
  double v8 = [v7 dataSource];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      long double v18 = (objc_class *)objc_opt_class();
      double v19 = NSStringFromClass(v18);
      long long v20 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v17 handleFailureInMethod:a2, self, @"PXPhotosDragController.m", 728, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.selectionManager.selectionSnapshot.dataSource", v19, v20 object file lineNumber description];
    }
  }
  double v9 = [(PXPhotosDragController *)self _actionManagerForDropSession:v5];
  if (![(PXPhotosDragController *)self isDragSessionActive]) {
    goto LABEL_11;
  }
  if (![v5 allowsMoveOperation]) {
    goto LABEL_11;
  }
  if ([v8 isSorted]) {
    goto LABEL_11;
  }
  if (![v9 canPerformActionType:@"PXAssetCollectionActionTypeMoveAssets"]) {
    goto LABEL_11;
  }
  char v10 = [v5 items];
  unint64_t v11 = [v10 count];
  uint64_t v12 = [v8 totalNumberOfItems];
  id v13 = [(PXPhotosDragController *)self excludedAssets];
  unint64_t v14 = [v13 count] + v12;

  if (v11 < v14)
  {
    unint64_t v15 = 3;
  }
  else
  {
LABEL_11:
    if ([(PXPhotosDragController *)self isDragSessionActive]
      || ([v9 canPerformActionType:@"PXAssetCollectionActionTypeDropAssets"] & 1) == 0)
    {
      unint64_t v15 = 0;
    }
    else
    {
      unint64_t v15 = 2;
    }
  }

  return v15;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v9 = a4;
  char v10 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v41.CGFloat x = x;
    v41.CGFloat y = y;
    unint64_t v11 = NSStringFromCGPoint(v41);
    *(_DWORD *)buf = 138412802;
    id v34 = v27;
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ sessionForAddingItems: %@ withTouchAtPoint: %@", buf, 0x20u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v13)
  {

LABEL_16:
    if ([v9 count] == 1)
    {
      unint64_t v15 = [v9 lastObject];
    }
    else
    {
      unint64_t v15 = 0;
    }
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  id v26 = v9;
  unint64_t v15 = 0;
  uint64_t v16 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v12);
      }
      long double v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v19 = objc_msgSend(v18, "dragSession", v26);
      if (v19)
      {
        long long v20 = (void *)v19;
        uint64_t v21 = [v18 identifier];
        double v22 = [v15 localContext];
        uint64_t v23 = [v22 identifier];

        if (v21 > v23)
        {
          uint64_t v24 = [v18 dragSession];

          unint64_t v15 = (void *)v24;
        }
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v14);

  id v9 = v26;
  if (!v15) {
    goto LABEL_16;
  }
LABEL_19:

  return v15;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v9[3] = &unk_1E5DD2470;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [a4 addCompletion:v9];
}

uint64_t __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v2 = *(void *)(result + 40);
      id v3 = *(void **)(result + 32);
      return [v3 _localSessionForDragSession:v2 changeBlock:&__block_literal_global_261_72580];
    }
  }
  else
  {
    id v5 = *(void **)(result + 32);
    uint64_t v4 = *(void *)(result + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3;
    v6[3] = &unk_1E5DB6480;
    v6[4] = v5;
    return [v5 _localSessionForDragSession:v4 changeBlock:v6];
  }
  return result;
}

void __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3(uint64_t a1, void *a2)
{
  if ([a2 dropOperation] == 3 && objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackEnabled"))
  {
    id v3 = [*(id *)(a1 + 32) reorderFeedbackGenerator];
    [v3 draggedObjectLifted];
  }
}

uint64_t __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDraggedAssetReferences:0];
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PXPhotosDragController *)self _assetReferenceForDragItem:v9];
  if (v11)
  {
    id v24 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = [(PXPhotosDragController *)self localDragSessions];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v13)
    {
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v14 = v13;
    double v22 = v10;
    id v23 = v9;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        long double v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "draggedAssetReferences", v22, v23);
        int v20 = [v19 containsObject:v11];

        if (v20)
        {
          id v21 = v18;

          unint64_t v15 = v21;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);

    id v9 = v23;
    id v8 = v24;
    id v10 = v22;
    if (v15)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __77__PXPhotosDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
      v25[3] = &unk_1E5DB6458;
      v25[4] = self;
      id v26 = v11;
      id v27 = v15;
      id v12 = v15;
      [v22 addCompletion:v25];

      goto LABEL_13;
    }
  }
LABEL_14:
}

uint64_t __77__PXPhotosDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _removeDraggedAssetReferece:*(void *)(result + 40) fromLocalSession:*(void *)(result + 48)];
  }
  return result;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ session: %@ didEndWithOperation: %lu", (uint8_t *)&v11, 0x20u);
  }

  [(PXPhotosDragController *)self _localSessionForDragSession:v9 changeBlock:&__block_literal_global_72583];
}

void __70__PXPhotosDragController_dragInteraction_session_didEndWithOperation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDragSession:0];
  [v2 setIsDragSessionActive:0];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke;
  v10[3] = &unk_1E5DB6410;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PXPhotosDragController *)self _localSessionForDragSession:v8 changeBlock:v10];
}

void __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 draggedAssetReferences];
  BOOL v5 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssetReferences:v4];

  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke_2;
    block[3] = &unk_1E5DD36F8;
    block[4] = a1[4];
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v7 = PLDragAndDropGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ sessionWillBegin: %@", buf, 0x16u);
    }

    [v3 setIsDragSessionActive:1];
  }
}

uint64_t __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentConfidentialityWarning];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int buf = 138412546;
    id buf_4 = v8;
    __int16 buf_12 = 2112;
    id buf_14 = v10;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ previewForCancellingItem: %@", (uint8_t *)&buf, 0x16u);
  }

  uint64_t v12 = [(PXPhotosDragController *)self viewControllerForPresentation];
  int v13 = objc_msgSend(v12, "px_isVisible");

  if (v13)
  {
    uint64_t v14 = [(PXPhotosDragController *)self _assetReferenceForDragItem:v9];
    uint64_t v15 = [(PXPhotosDragController *)self delegate];
    unint64_t v16 = [v15 dragController:self regionOfInterestForAssetReference:v14 image:0];

    if (v16)
    {
      uint64_t v17 = [(PXPhotosDragController *)self delegate];
      uint64_t v18 = [v17 dragController:self scrollViewForAssetReference:v14];

      [v16 rectInCoordinateSpace:v18];
      PXRectGetCenter();
    }
  }
  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412802;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ previewForLiftingItem: %@ session: %@", buf, 0x20u);
  }

  uint64_t v12 = [(PXPhotosDragController *)self viewControllerForPresentation];
  int v13 = objc_msgSend(v12, "px_isVisible");

  if (v13)
  {
    uint64_t v14 = [(PXPhotosDragController *)self _assetReferenceForDragItem:v9];
    uint64_t v15 = [(PXPhotosDragController *)self delegate];
    id v26 = 0;
    unint64_t v16 = [v15 dragController:self regionOfInterestForAssetReference:v14 image:&v26];
    id v17 = v26;

    if (v16 && v17)
    {
      uint64_t v18 = [v16 coordinateSpace];
      [v16 rectInCoordinateSpace:v18];
      PXPreviewImageViewForImage(v17, v16, v19, v20, v21, v22);
      objc_claimAutoreleasedReturnValue();

      id v23 = [(PXPhotosDragController *)self delegate];
      uint64_t v24 = [v23 dragController:self scrollViewForAssetReference:v14];

      [v16 rectInCoordinateSpace:v24];
      PXRectGetCenter();
    }
  }
  return 0;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v11 = a5;
  if (a6 == a3)
  {
    id v12 = a4;
    int v13 = [(PXPhotosDragController *)self selectionManager];
    uint64_t v14 = [v13 dataSourceManager];

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v18 = (objc_class *)objc_opt_class();
        double v19 = NSStringFromClass(v18);
        double v20 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
        [v17 handleFailureInMethod:a2, self, @"PXPhotosDragController.m", 576, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.selectionManager.dataSourceManager", v19, v20 object file lineNumber description];
      }
    }
    uint64_t v15 = [v14 dataSource];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__PXPhotosDragController_dragInteraction_session_willAddItems_forInteraction___block_invoke;
    v21[3] = &unk_1E5DB6410;
    id v22 = v11;
    id v23 = self;
    id v24 = v15;
    id v16 = v15;
    [(PXPhotosDragController *)self _localSessionForDragSession:v12 changeBlock:v21];
  }
}

void __78__PXPhotosDragController_dragInteraction_session_willAddItems_forInteraction___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a1[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(a1[5], "_assetReferenceForDragItem:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        if (v10)
        {
          id v11 = (void *)v10;
          id v12 = [a1[6] assetReferenceForAssetReference:v10];

          if (v12)
          {
            [v4 addObject:v12];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [a1[5] _addDraggedAssetReferences:v4 toLocalSession:v3];
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23.CGFloat x = x;
    v23.CGFloat y = y;
    NSStringFromCGPoint(v23);
    id v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)int buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ itemsForAddingToSession: %@ withTouchAtPoint: %@", buf, 0x20u);
  }
  *(void *)int buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__72594;
  double v19 = __Block_byref_object_dispose__72595;
  id v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PXPhotosDragController_dragInteraction_itemsForAddingToSession_withTouchAtPoint___block_invoke;
  v16[3] = &unk_1E5DB63E8;
  *(CGFloat *)&v16[6] = x;
  *(CGFloat *)&v16[7] = y;
  v16[4] = self;
  v16[5] = buf;
  [(PXPhotosDragController *)self _localSessionForDragSession:v10 changeBlock:v16];
  if (*(void *)(*(void *)&buf[8] + 40)) {
    long long v13 = *(void **)(*(void *)&buf[8] + 40);
  }
  else {
    long long v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)&buf[8] + 40), v13);
  id v14 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __83__PXPhotosDragController_dragInteraction_itemsForAddingToSession_withTouchAtPoint___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_draggableAssetReferenceAtLocation:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (v4)
  {
    id v5 = [v3 draggedAssetReferences];
    char v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [*(id *)(a1 + 32) _createDragItemForAssetReference:v4];
      uint64_t v8 = (void *)v7;
      if (v7)
      {
        v12[0] = v7;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
    }
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ itemsForBeginningSession: %@", buf, 0x16u);
  }

  if (![(PXPhotosDragController *)self canDragOut])
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PXPhotosDragController.m" lineNumber:503 description:@"Trying to start a dragging session when Drag & Drop is not enabled."];
  }
  uint64_t v10 = [(PXPhotosDragController *)self delegate];
  id v11 = [v10 dragControllerAssetReferenceForBeginningSession:self];

  if (!v11)
  {
    id v12 = [(PXPhotosDragController *)self contentView];
    [v8 locationInView:v12];
    double v14 = v13;
    double v16 = v15;

    id v11 = -[PXPhotosDragController _draggableAssetReferenceAtLocation:](self, "_draggableAssetReferenceAtLocation:", v14, v16);
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  *(void *)int buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v30 = __Block_byref_object_copy__72594;
  __int16 v31 = __Block_byref_object_dispose__72595;
  id v32 = (id)MEMORY[0x1E4F1CBF0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke;
  v23[3] = &unk_1E5DB63C0;
  id v18 = v11;
  id v24 = v18;
  id v25 = self;
  SEL v28 = a2;
  id v19 = v17;
  id v26 = v19;
  id v27 = buf;
  [(PXPhotosDragController *)self _localSessionForDragSession:v8 changeBlock:v23];
  id v20 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v20;
}

void __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    id v5 = [v3 draggedAssetReferences];
    char v6 = [v5 containsObject:*(void *)(a1 + 32)];

    if ((v6 & 1) == 0)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v8 = [*(id *)(a1 + 40) selectionManager];
      uint64_t v9 = [v8 selectionSnapshot];

      uint64_t v10 = [v9 dataSource];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          double v15 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v16 = *(void *)(a1 + 64);
          uint64_t v17 = *(void *)(a1 + 40);
          id v18 = (objc_class *)objc_opt_class();
          id v19 = NSStringFromClass(v18);
          id v20 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
          [v15 handleFailureInMethod:v16, v17, @"PXPhotosDragController.m", 522, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v19, v20 object file lineNumber description];
        }
      }
      id v11 = *(void **)(a1 + 32);
      if (v11) {
        [v11 indexPath];
      }
      else {
        memset(v26, 0, sizeof(v26));
      }
      if ([v9 isIndexPathSelected:v26])
      {
        id v12 = [v9 selectedIndexPaths];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke_2;
        v21[3] = &unk_1E5DC88E0;
        id v13 = v10;
        uint64_t v14 = *(void *)(a1 + 40);
        id v22 = v13;
        uint64_t v23 = v14;
        id v24 = v7;
        id v25 = *(id *)(a1 + 48);
        [v12 enumerateItemIndexPathsUsingBlock:v21];
      }
      else
      {
        id v12 = [*(id *)(a1 + 40) _createDragItemForAssetReference:*(void *)(a1 + 32)];
        if (v12)
        {
          [v7 addObject:v12];
          [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
        }
      }

      if ([*(id *)(a1 + 48) count]
        && [*(id *)(a1 + 40) _addDraggedAssetReferences:*(void *)(a1 + 48) toLocalSession:v4])
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
      }
    }
  }
}

void __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  id v5 = [v3 assetReferenceAtItemIndexPath:v7];
  char v6 = [*(id *)(a1 + 40) _createDragItemForAssetReference:v5];
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
    [*(id *)(a1 + 56) addObject:v5];
  }
}

- (id)_draggableAssetReferenceAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(PXPhotosDragController *)self delegate];
  id v7 = objc_msgSend(v6, "dragController:draggableAssetReferenceAtLocation:", self, x, y);

  return v7;
}

- (void)_presentConfidentialityWarning
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  v7[0] = v3;
  long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = +[PXSharingConfidentialityController confidentialityAlertWithActions:v4];

  char v6 = [(PXPhotosDragController *)self viewControllerForPresentation];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)_removeDraggedAssetReferece:(id)a3 fromLocalSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 draggedAssetReferences];
  id v10 = (id)[v8 mutableCopy];

  [v10 removeObject:v7];
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithSet:v10];
  [v6 setDraggedAssetReferences:v9];

  [(PXPhotosDragController *)self _updateDraggedAssetReferences];
}

- (BOOL)_addDraggedAssetReferences:(id)a3 toLocalSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 draggedAssetReferences];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [v8 setByAddingObjectsFromSet:v6];
  }
  else
  {
    id v10 = v6;
  }
  [v7 setDraggedAssetReferences:v10];
  [(PXPhotosDragController *)self _updateDraggedAssetReferences];

  return 1;
}

- (id)_createDragItemForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  id v6 = PXDragAndDropItemProviderForDisplayAsset(v5);

  if (v6) {
    goto LABEL_2;
  }
  uint64_t v9 = [(PXPhotosDragController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(PXPhotosDragController *)self delegate];
    id v6 = [v11 dragController:self itemProviderForAssetReference:v4];

    if (v6)
    {
LABEL_2:
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v6];
      id v8 = [[PXDraggingItemLocalObject alloc] initWithAssetReference:v4];
      [v7 setLocalObject:v8];

      goto LABEL_8;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)_assetReferenceForDragItem:(id)a3
{
  id v3 = [a3 localObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 assetReference];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateExcludedAssets
{
  id v3 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  BOOL v40 = [(PXPhotosDragController *)self isUpdatingExcludedAssets];
  [(PXPhotosDragController *)v3 setIsUpdatingExcludedAssets:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = [(PXPhotosDragController *)v3 excludedAssets];
  uint64_t v39 = [(PXPhotosDragController *)v3 selectionManager];
  id v6 = [v39 dataSourceManager];
  CGPoint v41 = v6;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v35 = [MEMORY[0x1E4F28B00] currentHandler];
      id v36 = (objc_class *)objc_opt_class();
      __int16 v37 = NSStringFromClass(v36);
      id v38 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v35 handleFailureInMethod:a2, v3, @"PXPhotosDragController.m", 400, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"selectionManager.dataSourceManager", v37, v38 object file lineNumber description];

      id v6 = v41;
    }
  }
  id v7 = [v6 dataSource];
  id v47 = objc_alloc_init((Class)off_1E5DA7430);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = [(PXPhotosDragController *)v3 localDragSessions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v62;
    __int16 v43 = v8;
    v44 = v3;
    uint64_t v42 = *(void *)v62;
    do
    {
      uint64_t v12 = 0;
      uint64_t v45 = v10;
      do
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v46 = v12;
        id v13 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
        uint64_t v14 = [v13 dropActionPerformer];
        if (v14
          && (double v15 = (void *)v14,
              [v13 excludedAssets],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              v16,
              v15,
              v16))
        {
          uint64_t v17 = [v13 excludedAssets];
          [v4 unionSet:v17];
        }
        else
        {
          if ([v13 dropOperation] != 3) {
            goto LABEL_29;
          }
          id v18 = [v13 dropTargetAssetReference];
          if (v18)
          {
          }
          else if (![v13 isDropActiveInsideView])
          {
            goto LABEL_29;
          }
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          uint64_t v17 = [v13 draggedAssetReferences];
          uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v58 != v21) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                id v24 = [v23 asset];
                char v25 = [v5 containsObject:v24];

                if ((v25 & 1) == 0)
                {
                  long long v55 = 0u;
                  long long v56 = 0u;
                  if (v7) {
                    [v7 indexPathForAssetReference:v23];
                  }
                  v54[0] = v55;
                  v54[1] = v56;
                  [v47 addIndexPath:v54];
                }
                id v26 = [v23 asset];
                [v4 addObject:v26];
              }
              uint64_t v20 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
            }
            while (v20);
            id v8 = v43;
            id v3 = v44;
            uint64_t v11 = v42;
            uint64_t v10 = v45;
          }
        }

LABEL_29:
        uint64_t v12 = v46 + 1;
      }
      while (v46 + 1 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v10);
  }

  if ([v47 count] >= 1)
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __47__PXPhotosDragController__updateExcludedAssets__block_invoke;
    v52[3] = &unk_1E5DD1458;
    id v53 = v47;
    [v41 performChanges:v52];
  }
  id v27 = (void *)[v4 copy];
  [(PXPhotosDragController *)v3 setExcludedAssets:v27];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  SEL v28 = [(PXPhotosDragController *)v3 localDragSessions];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v65 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v34 = [(PXPhotosDragController *)v3 excludedAssets];
        [v33 setExcludedAssets:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v65 count:16];
    }
    while (v30);
  }

  [(PXPhotosDragController *)v3 setIsUpdatingExcludedAssets:v40];
}

uint64_t __47__PXPhotosDragController__updateExcludedAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 excludeAssetsAtIndexPaths:*(void *)(a1 + 32)];
}

- (void)_updateIsDragSessionActive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDragSessionActive])
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(PXPhotosDragController *)self setIsDragSessionActive:v4];
}

- (void)_updateDropTarget
{
  id v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v4)
  {

    id v6 = 0;
    id v18 = 0;
    goto LABEL_27;
  }
  uint64_t v5 = v4;
  id v24 = v2;
  char v25 = 0;
  id v6 = 0;
  LOBYTE(v7) = 0;
  LOBYTE(v8) = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v3);
      }
      uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (v7)
      {
        BOOL v7 = 1;
        if ((v8 & 1) == 0) {
          goto LABEL_8;
        }
      }
      else
      {
        BOOL v7 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dropOperation] == 3;
        if ((v8 & 1) == 0)
        {
LABEL_8:
          int v8 = [v12 isDropActiveInsideView];
          goto LABEL_11;
        }
      }
      int v8 = 1;
LABEL_11:
      if ([v12 identifier] <= v9) {
        continue;
      }
      id v13 = [v12 dropTargetAssetReference];
      if (v13)
      {
      }
      else
      {
        uint64_t v14 = [v12 hitAssetReference];

        if (!v14) {
          continue;
        }
      }
      uint64_t v15 = [v12 dropTargetAssetReference];

      uint64_t v16 = [v12 hitAssetReference];
      uint64_t v17 = v6;
      id v6 = (void *)v16;

      uint64_t v9 = [v12 identifier];
      char v25 = (void *)v15;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v5);

  if ((v7 & v8) == 1)
  {
    id v2 = v24;
    id v18 = v25;
    if ([(PXPhotosDragController *)v24 reorderFeedbackEnabled])
    {
      id v19 = [v25 asset];
      uint64_t v20 = [(PXPhotosDragController *)v24 dropTargetAssetReference];
      id v21 = [v20 asset];
      if (v19 == v21)
      {

LABEL_26:
      }
      else
      {
        id v22 = v21;
        char v23 = [v19 isEqual:v21];

        if ((v23 & 1) == 0)
        {
          id v19 = [(PXPhotosDragController *)v24 reorderFeedbackGenerator];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          _OWORD v26[2] = __43__PXPhotosDragController__updateDropTarget__block_invoke;
          v26[3] = &unk_1E5DD36F8;
          v26[4] = v24;
          [v19 performFeedbackWithDelay:v26 insideBlock:0.05];
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    id v2 = v24;
    id v18 = v25;
  }
LABEL_27:
  [(PXPhotosDragController *)v2 setHitAssetReference:v6];
  [(PXPhotosDragController *)v2 setDropTargetAssetReference:v18];
}

void __43__PXPhotosDragController__updateDropTarget__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reorderFeedbackGenerator];
  [v1 objectSnapped];
}

- (void)_updateDraggedAssetReferences
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isDragSessionActive])
        {
          uint64_t v10 = [v9 draggedAssetReferences];
          [v3 unionSet:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(PXPhotosDragController *)self setDraggedAssetReferences:v3];
}

- (void)_localSessionForDropSession:(id)a3 changeBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  int v8 = [v6 localDragSession];
  uint64_t v9 = [v8 localContext];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v10 = v9;

    if (v10) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = [(PXPhotosDragController *)self localDragSessions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
LABEL_8:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
      id v17 = [v16 dropSession];

      if (v17 == v6) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    id v10 = v16;

    if (v10) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_14:
  }
  id v10 = [(PXPhotosDragController *)self _createLocalSession];
  [v10 setDropSession:v6];
LABEL_17:
  v7[2](v7, v10);
  [(PXPhotosDragController *)self _pruneLocalSessionIfFinished:v10];
  id v18 = [(PXPhotosDragController *)self updater];
  [v18 updateIfNeeded];
}

- (void)_localSessionForDragSession:(id)a3 changeBlock:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, id))a4;
  uint64_t v7 = [v10 localContext];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v7;

    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v8 = [(PXPhotosDragController *)self _createLocalSession];
  [v8 setDragSession:v10];
  [v10 setLocalContext:v8];
LABEL_7:
  v6[2](v6, v8);
  [(PXPhotosDragController *)self _pruneLocalSessionIfFinished:v8];
  uint64_t v9 = [(PXPhotosDragController *)self updater];
  [v9 updateIfNeeded];
}

- (void)_pruneLocalSessionIfFinished:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = [v4 dragSession];
    if (v5) {
      goto LABEL_4;
    }
    uint64_t v5 = [v11 dropSession];
    if (v5) {
      goto LABEL_4;
    }
    id v6 = [v11 dropActionPerformer];

    id v4 = v11;
    if (!v6)
    {
      uint64_t v7 = [(PXPhotosDragController *)self localDragSessions];
      [v7 removeObject:v11];

      id v8 = [(PXPhotosDragController *)self updater];
      [v8 setNeedsUpdateOf:sel__updateDraggedAssetReferences];

      uint64_t v9 = [(PXPhotosDragController *)self updater];
      [v9 setNeedsUpdateOf:sel__updateDropTarget];

      id v10 = [(PXPhotosDragController *)self updater];
      [v10 setNeedsUpdateOf:sel__updateIsDragSessionActive];

      uint64_t v5 = [(PXPhotosDragController *)self updater];
      [v5 setNeedsUpdateOf:sel__updateExcludedAssets];
LABEL_4:

      id v4 = v11;
    }
  }
}

- (id)_createLocalSession
{
  id v3 = objc_alloc_init(PXLocalDragSession);
  [(PXLocalDragSession *)v3 setDelegate:self];
  id v4 = [(PXPhotosDragController *)self localDragSessions];
  [v4 addObject:v3];

  return v3;
}

- (void)setReorderFeedbackEnabled:(BOOL)a3
{
  if (self->_reorderFeedbackEnabled != a3)
  {
    self->_reorderFeedbackEnabled = a3;
    reorderFeedbackGenerator = self->_reorderFeedbackGenerator;
    if (a3) {
      [(_UIDragSnappingFeedbackGenerator *)reorderFeedbackGenerator userInteractionStarted];
    }
    else {
      [(_UIDragSnappingFeedbackGenerator *)reorderFeedbackGenerator userInteractionEnded];
    }
  }
}

- (void)setExcludedAssets:(id)a3
{
  id v6 = (NSSet *)a3;
  uint64_t v7 = self->_excludedAssets;
  if (v7 == v6)
  {
  }
  else
  {
    id v8 = v7;
    char v9 = [(NSSet *)v7 isEqual:v6];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)[(NSSet *)self->_excludedAssets mutableCopy];
      if ([(NSSet *)v6 count]) {
        [v10 minusSet:v6];
      }
      objc_storeStrong((id *)&self->_excludedAssets, a3);
      if ([v10 count])
      {
        id v11 = [(PXPhotosDragController *)self selectionManager];
        uint64_t v12 = [v11 dataSourceManager];

        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v14 = (objc_class *)objc_opt_class();
            uint64_t v15 = NSStringFromClass(v14);
            uint64_t v16 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
            [v13 handleFailureInMethod:a2, self, @"PXPhotosDragController.m", 247, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.selectionManager.dataSourceManager", v15, v16 object file lineNumber description];
          }
        }
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __44__PXPhotosDragController_setExcludedAssets___block_invoke;
        v17[3] = &unk_1E5DD1458;
        id v18 = v10;
        [v12 performChanges:v17];
      }
    }
  }
}

void __44__PXPhotosDragController_setExcludedAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 allObjects];
  [v3 stopExcludingAssets:v4];
}

- (void)setIsDragSessionActive:(BOOL)a3
{
  if (self->_isDragSessionActive != a3)
  {
    BOOL v3 = a3;
    self->_isDragSessionActive = a3;
    id v5 = [(PXPhotosDragController *)self delegate];
    [v5 dragController:self isDragSessionActiveDidChange:v3];
  }
}

- (void)setDropTargetAssetReference:(id)a3
{
  char v9 = (PXAssetReference *)a3;
  id v5 = self->_dropTargetAssetReference;
  id v6 = v9;
  if (v5 != v9)
  {
    uint64_t v7 = v5;
    char v8 = [(PXAssetReference *)v5 isEqual:v9];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
    id v6 = [(PXPhotosDragController *)self delegate];
    [v6 dragController:self dropTargetAssetReferenceDidChange:v9];
  }

LABEL_5:
}

- (void)setDraggedAssetReferences:(id)a3
{
  char v9 = (NSSet *)a3;
  id v5 = self->_draggedAssetReferences;
  id v6 = v9;
  if (v5 != v9)
  {
    uint64_t v7 = v5;
    char v8 = [(NSSet *)v5 isEqual:v9];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_draggedAssetReferences, a3);
    id v6 = [(PXPhotosDragController *)self delegate];
    [v6 dragController:self draggedAssetReferencesDidChange:v9];
  }

LABEL_5:
}

- (id)scrollView
{
  BOOL v3 = [(PXPhotosDragController *)self delegate];
  id v4 = [v3 dragController:self scrollViewForAssetReference:0];

  return v4;
}

- (UIViewController)viewControllerForPresentation
{
  BOOL v3 = [(PXPhotosDragController *)self delegate];
  id v4 = [v3 dragControllerViewControllerForPresentation:self];

  return (UIViewController *)v4;
}

- (id)_actionManagerForDropSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localDragSession];
  id v6 = [v5 localContext];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  char v8 = [(PXPhotosDragController *)self assetCollectionActionManager];
  [v8 setDropSession:v4];

  char v9 = [v7 dragSession];
  [v8 setDragSession:v9];

  id v10 = [(PXPhotosDragController *)self hitAssetReference];
  [v8 setDropTargetAssetReference:v10];

  id v11 = [v8 performerDelegate];

  if (!v11) {
    [v8 setPerformerDelegate:self];
  }

  return v8;
}

- (void)removeFromView
{
  BOOL v3 = [(PXPhotosDragController *)self dragInteraction];
  id v4 = [v3 view];
  id v5 = [(PXPhotosDragController *)self dragInteraction];
  [v4 removeInteraction:v5];

  id v8 = [(PXPhotosDragController *)self dropInteraction];
  id v6 = [v8 view];
  id v7 = [(PXPhotosDragController *)self dropInteraction];
  [v6 removeInteraction:v7];
}

- (void)dealloc
{
  BOOL v3 = [(PXPhotosDragController *)self dragInteraction];
  id v4 = [(PXPhotosDragController *)self dropInteraction];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __33__PXPhotosDragController_dealloc__block_invoke;
  id v10 = &unk_1E5DD32A8;
  id v11 = v3;
  uint64_t v12 = v4;
  id v5 = v4;
  id v6 = v3;
  px_dispatch_on_main_queue();
}

void __33__PXPhotosDragController_dealloc__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v3 = [v2 view];
    [v3 removeInteraction:*(void *)(a1 + 32)];
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = [v4 view];
    [v5 removeInteraction:*(void *)(a1 + 40)];
  }
}

- (PXPhotosDragController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDragController.m", 152, @"%s is not available as initializer", "-[PXPhotosDragController init]");

  abort();
}

@end