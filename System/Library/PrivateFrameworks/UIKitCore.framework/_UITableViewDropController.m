@interface _UITableViewDropController
- (BOOL)canOnlyHandleReordering;
- (BOOL)commitPlaceholderInsertionWithContext:(id)a3 dataSourceUpdates:(id)a4;
- (BOOL)deletePlaceholder:(id)a3;
- (BOOL)isActive;
- (BOOL)isTrackingDrag;
- (BOOL)shouldIgnoreDrags;
- (NSIndexPath)targetIndexPath;
- (NSMapTable)dragItemDropAnimations;
- (UIDropInteraction)dropInteraction;
- (UIDropSession)dropSession;
- (UITableViewDropProposal)dropProposal;
- (_UITableViewDropController)initWithTableView:(id)a3;
- (_UITableViewDropControllerDelegate)tableView;
- (id)animateDragItem:(id)a3 intoRowAtIndexPath:(id)a4 rect:(CGRect)a5;
- (id)animateDragItem:(id)a3 toCell:(id)a4 withPreviewParameters:(id)a5;
- (id)animateDragItem:(id)a3 toRowAtIndexPath:(id)a4;
- (id)animateDragItem:(id)a3 toTarget:(id)a4;
- (id)beginIgnoringDrags;
- (id)defaultAnimatorForDragItem:(id)a3;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)ignoringDragsCount;
- (unint64_t)defaultDropOperation;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)endIgnoringDrags;
- (void)insertPlaceholderAtIndexPath:(id)a3 withContext:(id)a4 previewParametersProvider:(id)a5;
- (void)resetAllDragState;
- (void)resetTrackingState;
- (void)setCanOnlyHandleReordering:(BOOL)a3;
- (void)setDefaultDropOperation:(unint64_t)a3;
- (void)setDragItemDropAnimations:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setDropProposal:(id)a3;
- (void)setDropSession:(id)a3;
- (void)setIgnoringDragsCount:(int64_t)a3;
- (void)setTableView:(id)a3;
- (void)setTargetIndexPath:(id)a3;
- (void)setupDragInteraction;
- (void)uninstallFromTableView;
- (void)updateTargetIndexPathAndDropProposalForSession:(id)a3;
@end

@implementation _UITableViewDropController

- (_UITableViewDropController)initWithTableView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UITableViewDropController.m", 79, @"Invalid parameter not satisfying: %@", @"tableView != nil" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UITableViewDropController;
  v6 = [(_UITableViewDropController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_tableView, v5);
    [(_UITableViewDropController *)v7 resetAllDragState];
    [(_UITableViewDropController *)v7 setupDragInteraction];
  }

  return v7;
}

- (void)setupDragInteraction
{
  v4 = [[UIDropInteraction alloc] initWithDelegate:self];
  [(_UITableViewDropController *)self setDropInteraction:v4];
  v3 = [(_UITableViewDropController *)self tableView];
  [v3 addInteraction:v4];
}

- (_UITableViewDropControllerDelegate)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (_UITableViewDropControllerDelegate *)WeakRetained;
}

- (void)setDropInteraction:(id)a3
{
}

- (void)resetAllDragState
{
  [(_UITableViewDropController *)self resetTrackingState];
  [(_UITableViewDropController *)self setDefaultDropOperation:0];
  [(_UITableViewDropController *)self setCanOnlyHandleReordering:0];
  id v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(_UITableViewDropController *)self setDragItemDropAnimations:v3];
}

- (void)setDropProposal:(id)a3
{
}

- (void)setDragItemDropAnimations:(id)a3
{
}

- (void)setDefaultDropOperation:(unint64_t)a3
{
  self->_defaultDropOperation = a3;
}

- (void)setCanOnlyHandleReordering:(BOOL)a3
{
  self->_canOnlyHandleReordering = a3;
}

- (void)resetTrackingState
{
  [(_UITableViewDropController *)self setTargetIndexPath:0];
  [(_UITableViewDropController *)self setDropProposal:0];
}

- (void)setTargetIndexPath:(id)a3
{
}

- (id)beginIgnoringDrags
{
  if (![(_UITableViewDropController *)self shouldIgnoreDrags]
    && [(_UITableViewDropController *)self isTrackingDrag])
  {
    id v3 = [(_UITableViewDropController *)self tableView];
    [v3 _removeDropTargetAndResetAppearance];

    [(_UITableViewDropController *)self resetTrackingState];
  }
  [(_UITableViewDropController *)self setIgnoringDragsCount:[(_UITableViewDropController *)self ignoringDragsCount] + 1];
  objc_initWeak(&location, self);
  v4 = [_UITableViewIgnoreDragsTokenImpl alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___UITableViewDropController_beginIgnoringDrags__block_invoke;
  v7[3] = &unk_1E52DC308;
  objc_copyWeak(&v8, &location);
  id v5 = [(_UITableViewIgnoreDragsTokenImpl *)v4 initWithDidEndHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)setIgnoringDragsCount:(int64_t)a3
{
  self->_ignoringDragsCount = a3;
}

- (BOOL)isTrackingDrag
{
  return [(_UITableViewDropController *)self defaultDropOperation] != 0;
}

- (unint64_t)defaultDropOperation
{
  return self->_defaultDropOperation;
}

- (void)endIgnoringDrags
{
  [(_UITableViewDropController *)self setIgnoringDragsCount:[(_UITableViewDropController *)self ignoringDragsCount] - 1];
  if ([(_UITableViewDropController *)self ignoringDragsCount] < 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UITableViewDropController.m" lineNumber:137 description:@"UITableView internal inconsistency: attempted to end ignoring drags more times than begin ignoring drags."];
  }
  if (![(_UITableViewDropController *)self shouldIgnoreDrags]
    && [(_UITableViewDropController *)self isTrackingDrag])
  {
    id v5 = [(_UITableViewDropController *)self dropSession];
    [(_UITableViewDropController *)self updateTargetIndexPathAndDropProposalForSession:v5];
  }
}

- (BOOL)shouldIgnoreDrags
{
  return [(_UITableViewDropController *)self ignoringDragsCount] > 0;
}

- (int64_t)ignoringDragsCount
{
  return self->_ignoringDragsCount;
}

- (BOOL)isActive
{
  if ([(_UITableViewDropController *)self isTrackingDrag]) {
    return 1;
  }
  v4 = [(_UITableViewDropController *)self dropSession];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)uninstallFromTableView
{
  if ([(_UITableViewDropController *)self isActive])
  {
    BOOL v3 = [(_UITableViewDropController *)self tableView];
    [v3 _removeDropTargetAndResetAppearance];

    [(_UITableViewDropController *)self resetAllDragState];
  }
  id v5 = [(_UITableViewDropController *)self tableView];
  v4 = [(_UITableViewDropController *)self dropInteraction];
  [v5 removeInteraction:v4];
}

- (void)updateTargetIndexPathAndDropProposalForSession:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v4)
    {
      id v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Cannot update the target index path and drop proposal without a dropSession", buf, 2u);
      }
      goto LABEL_11;
    }
  }
  else if (!v4)
  {
    v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateTargetIndexPathAndDropProposalForSession____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Cannot update the target index path and drop proposal without a dropSession", v14, 2u);
    }
    goto LABEL_12;
  }
  if (![(_UITableViewDropController *)self shouldIgnoreDrags])
  {
    id v5 = [(_UITableViewDropController *)self tableView];
    v6 = [v5 _targetIndexPathForDrop:v4];
    v7 = [[UITableViewDropProposal alloc] initWithDropOperation:[(_UITableViewDropController *)self defaultDropOperation]];
    id v8 = [v5 _updatedDropProposalForIndexPath:v6 dropSession:v4 withDefaultProposal:v7];
    unint64_t v9 = [v8 operation];
    if (v9 == 3)
    {
      if (([v4 allowsMoveOperation] & 1) == 0)
      {
        unint64_t v10 = 0;
LABEL_8:
        v11 = [[UITableViewDropProposal alloc] initWithDropOperation:v10];
        [(_UITableViewDropController *)self setDropProposal:v11];

        [(_UITableViewDropController *)self setTargetIndexPath:0];
        [v5 _removeDropTargetAndResetAppearance];
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v10 = v9;
      if (v9 <= 1) {
        goto LABEL_8;
      }
    }
    [(_UITableViewDropController *)self setDropProposal:v8];
    v12 = [v8 _adjustedTargetIndexPath];
    [(_UITableViewDropController *)self setTargetIndexPath:v12];
    [v5 _updateDropTargetAppearanceWithTargetIndexPath:v12 dropProposal:v8 dropSession:v4];

    goto LABEL_10;
  }
LABEL_12:
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v12 = a4;
  id v5 = [(_UITableViewDropController *)self tableView];
  if (shouldAllowDrop(v5, v12) && [v5 _canHandleDropSession:v12])
  {
    id v6 = v12;
    v7 = [v5 _activeSourceDragSession];
    if (v7
      && ([v6 localDragSession], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      unint64_t v9 = [v6 localDragSession];
      BOOL v10 = v7 == v9;

      if (v10) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    else
    {

      uint64_t v11 = 2;
    }
    [(_UITableViewDropController *)self setDefaultDropOperation:v11];
    [(_UITableViewDropController *)self setDropSession:v6];
    [v5 _dropEntered:v6];
    [(_UITableViewDropController *)self updateTargetIndexPathAndDropProposalForSession:v6];
  }
  else
  {
    [(_UITableViewDropController *)self setDefaultDropOperation:0];
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UITableViewDropController *)self defaultDropOperation])
  {
    unint64_t v9 = [[UIDropProposal alloc] initWithDropOperation:0];
    goto LABEL_9;
  }
  id v8 = [(_UITableViewDropController *)self tableView];
  if ((shouldAllowDrop(v8, v7) & 1) == 0)
  {
    [(_UITableViewDropController *)self dropInteraction:v6 sessionDidExit:v7];
    BOOL v10 = off_1E52D38E0;
    goto LABEL_7;
  }
  [(_UITableViewDropController *)self setDropSession:v7];
  [(_UITableViewDropController *)self updateTargetIndexPathAndDropProposalForSession:v7];
  unint64_t v9 = [(_UITableViewDropController *)self dropProposal];
  if (!v9)
  {
    BOOL v10 = off_1E52D4948;
LABEL_7:
    unint64_t v9 = (UIDropProposal *)[objc_alloc(*v10) initWithDropOperation:0];
  }

LABEL_9:
  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v6 = a4;
  if ([(_UITableViewDropController *)self defaultDropOperation])
  {
    [(_UITableViewDropController *)self resetAllDragState];
    id v5 = [(_UITableViewDropController *)self tableView];
    if (![(_UITableViewDropController *)self shouldIgnoreDrags]) {
      [v5 _removeDropTargetAndResetAppearance];
    }
    [v5 _dropExited:v6];
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v8 = a4;
  unint64_t v5 = [(_UITableViewDropController *)self defaultDropOperation];
  id v6 = [(_UITableViewDropController *)self dropSession];

  if (v5 || v6)
  {
    [(_UITableViewDropController *)self resetAllDragState];
    id v7 = [(_UITableViewDropController *)self tableView];
    if (![(_UITableViewDropController *)self shouldIgnoreDrags]) {
      [v7 _removeDropTargetAndResetAppearance];
    }
    [(_UITableViewDropController *)self setDropSession:0];
    [v7 _dropEnded:v8];
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v12 = a4;
  unint64_t v5 = [(_UITableViewDropController *)self dropProposal];
  id v6 = [(_UITableViewDropController *)self targetIndexPath];
  BOOL v7 = [(_UITableViewDropController *)self canOnlyHandleReordering];
  unint64_t v8 = [v5 operation];
  if (!v6 && [v5 intent])
  {
    unint64_t v9 = [[UITableViewDropProposal alloc] initWithDropOperation:v8 intent:0];

    unint64_t v5 = v9;
  }
  [(_UITableViewDropController *)self resetAllDragState];
  BOOL v10 = [(_UITableViewDropController *)self tableView];
  if (![(_UITableViewDropController *)self shouldIgnoreDrags]) {
    [v10 _removeDropTargetAndResetAppearance];
  }
  if (v8 >= 2)
  {
    uint64_t v11 = [[_UITableViewDropCoordinatorImpl alloc] initWithDelegate:self destinationIndexPath:v6 dropProposal:v5 session:v12];
    [v10 _performDrop:v12 withDropCoordinator:v11 forceHandleAsReorder:v7];
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unint64_t v9 = [(_UITableViewDropController *)self tableView];
  BOOL v10 = [(_UITableViewDropController *)self dragItemDropAnimations];
  uint64_t v11 = [v10 objectForKey:v8];

  if (!v11) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v11;
      v14 = [v19 cellForTargetContainerInTableView:v9];
      if (v14)
      {
        [v9 _beginAnimatingDropIntoCell:v14];
        [v19 _setDidBeginAnimation:1];
      }
      v15 = [v19 target];
      v20 = [v7 retargetedPreviewWithTarget:v15];
      goto LABEL_14;
    }
LABEL_10:
    v20 = 0;
    goto LABEL_16;
  }
  id v12 = v11;
  uint64_t v13 = [v12 cell];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v9 _beginAnimatingDropOfCell:v13 isCanceling:0];
    [v12 _setDidBeginAnimation:1];
    v16 = [v12 previewParameters];
    v17 = [UITargetedDragPreview alloc];
    if (v16) {
      uint64_t v18 = [(UITargetedPreview *)v17 initWithView:v15 parameters:v16];
    }
    else {
      uint64_t v18 = [(UITargetedDragPreview *)v17 initWithView:v15];
    }
    v20 = (void *)v18;

LABEL_14:
    goto LABEL_15;
  }
  v20 = 0;
LABEL_15:

LABEL_16:
  return v20;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_UITableViewDropController *)self dragItemDropAnimations];
  id v12 = [v11 objectForKey:v9];

  if (v12)
  {
    [v12 _addClientBlocksToAnimator:v10];
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79___UITableViewDropController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v13[3] = &unk_1E52E98E8;
    objc_copyWeak(&v16, &location);
    id v14 = v12;
    id v15 = v9;
    [v10 addCompletion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [(_UITableViewDropController *)self dragItemDropAnimations];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = objc_msgSend(v4, "objectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _executeCompletionBlocks];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UITableViewDropController *)self targetIndexPath];
  uint64_t v7 = [(_UITableViewDropController *)self tableView];
  int64_t v8 = [v7 _dataOwnerForDropSession:v5 atIndexPath:v6];

  return v8;
}

- (id)defaultAnimatorForDragItem:(id)a3
{
  id v4 = a3;
  id v5 = [[_UITableViewDropAnimation alloc] initWithDragItem:v4];
  uint64_t v6 = [(_UITableViewDropController *)self dragItemDropAnimations];
  [v6 setObject:v5 forKey:v4];

  return v5;
}

- (id)animateDragItem:(id)a3 intoRowAtIndexPath:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  long long v13 = [(_UITableViewDropController *)self tableView];
  id v14 = [v13 cellForRowAtIndexPath:v12];

  if (v14)
  {
    [v11 _visibleDropItemSize];
    double v16 = v15;
    double v18 = v17;
    double Center = UIRectGetCenter(x, y, width);
    double v21 = v20;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    _UIScaleTransformForAspectFitOrFillOfSizeInTargetSize((CGAffineTransform *)1, (uint64_t)&v27, v16, v18, width, height);
    v22 = [UIDragPreviewTarget alloc];
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    v23 = -[UIPreviewTarget initWithContainer:center:transform:](v22, "initWithContainer:center:transform:", v14, v26, Center, v21);
    v24 = [(_UITableViewDropController *)self animateDragItem:v11 toTarget:v23];
  }
  else
  {
    v24 = [(_UITableViewDropController *)self defaultAnimatorForDragItem:v11];
  }

  return v24;
}

- (id)animateDragItem:(id)a3 toRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(_UITableViewDropController *)self tableView];
  uint64_t v9 = [v8 cellForRowAtIndexPath:v7];
  if (v9)
  {
    long long v10 = [v8 _dropPreviewParametersForIndexPath:v7];
    if (!v10)
    {
      long long v10 = objc_alloc_init(UIDragPreviewParameters);
      id v11 = [v9 _visiblePathForBackgroundConfiguration];
      [(UIPreviewParameters *)v10 setVisiblePath:v11];
    }
    id v12 = [(_UITableViewDropController *)self animateDragItem:v6 toCell:v9 withPreviewParameters:v10];
  }
  else
  {
    id v12 = [(_UITableViewDropController *)self defaultAnimatorForDragItem:v6];
  }

  return v12;
}

- (id)animateDragItem:(id)a3 toCell:(id)a4 withPreviewParameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[_UITableViewDropAnimationToCell alloc] initWithDragItem:v10 cell:v9 previewParameters:v8];

  id v12 = [(_UITableViewDropController *)self dragItemDropAnimations];
  [v12 setObject:v11 forKey:v10];

  return v11;
}

- (id)animateDragItem:(id)a3 toTarget:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_UITableViewDropAnimationToTarget alloc] initWithDragItem:v7 target:v6];

  id v9 = [(_UITableViewDropController *)self dragItemDropAnimations];
  [v9 setObject:v8 forKey:v7];

  return v8;
}

- (void)insertPlaceholderAtIndexPath:(id)a3 withContext:(id)a4 previewParametersProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [(_UITableViewDropController *)self tableView];
  id v12 = [v9 dragItem];
  long long v13 = [v11 _insertPlaceholderAtIndexPath:v8 withContext:v9];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__191;
  long long v27 = __Block_byref_object_dispose__191;
  id v28 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97___UITableViewDropController_insertPlaceholderAtIndexPath_withContext_previewParametersProvider___block_invoke;
  v19[3] = &unk_1E52E1B98;
  v22 = &v23;
  id v14 = v11;
  id v20 = v14;
  id v15 = v13;
  id v21 = v15;
  [v14 performUsingPresentationValues:v19];
  uint64_t v16 = v24[5];
  if (v16)
  {
    if (v10)
    {
      double v17 = v10[2](v10, v24[5]);
      uint64_t v16 = v24[5];
    }
    else
    {
      double v17 = 0;
    }
    double v18 = [(_UITableViewDropController *)self animateDragItem:v12 toCell:v16 withPreviewParameters:v17];
  }
  else
  {
    double v18 = [(_UITableViewDropController *)self defaultAnimatorForDragItem:v12];
  }
  [v9 _setAnimator:v18];

  _Block_object_dispose(&v23, 8);
}

- (BOOL)deletePlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITableViewDropController *)self tableView];
  id v6 = [v5 _deletePlaceholderForContext:v4];

  return v6 != 0;
}

- (BOOL)commitPlaceholderInsertionWithContext:(id)a3 dataSourceUpdates:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UITableViewDropController *)self tableView];
  char v9 = [v8 _commitPlaceholderInsertionWithContext:v7 dataSourceUpdates:v6];

  return v9;
}

- (BOOL)canOnlyHandleReordering
{
  return self->_canOnlyHandleReordering;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setTableView:(id)a3
{
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (UITableViewDropProposal)dropProposal
{
  return self->_dropProposal;
}

- (UIDropSession)dropSession
{
  return self->_dropSession;
}

- (void)setDropSession:(id)a3
{
}

- (NSMapTable)dragItemDropAnimations
{
  return self->_dragItemDropAnimations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemDropAnimations, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_dropProposal, 0);
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
}

@end