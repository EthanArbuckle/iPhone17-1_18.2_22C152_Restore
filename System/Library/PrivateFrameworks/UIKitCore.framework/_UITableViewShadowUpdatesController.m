@interface _UITableViewShadowUpdatesController
- (BOOL)_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)_tableView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)_tableView:(id)a3 dragSessionSupportsSystemDrag:(id)a4;
- (BOOL)_tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)hasShadowUpdates;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 canPerformPrimaryActionForRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)tableView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)tableView:(id)a3 selectionFollowsFocusForRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)tableView:(id)a3 shouldUpdateFocusFromRowAtIndexPath:(id)a4 toView:(id)a5 heading:(unint64_t)a6;
- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (CGPoint)tableView:(id)a3 newContentOffsetAfterUpdate:(CGPoint)a4 context:(id)a5;
- (CGRect)tableView:(id)a3 calloutTargetRectForCell:(id)a4 forRowAtIndexPath:(id)a5;
- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4;
- (NSMutableArray)shadowUpdates;
- (UITableView)tableView;
- (_UIDataSourceSnapshotter)dataSourceAfterShadowUpdates;
- (_UIDataSourceSnapshotter)dataSourceBeforeShadowUpdates;
- (_UIDataSourceSnapshotter)initialSnapshot;
- (_UIDataSourceUpdateMap)updateMap;
- (_UITableViewShadowUpdatesController)initWithTableView:(id)a3;
- (double)heightForFooterInTableView:(id)a3;
- (double)heightForHeaderInTableView:(id)a3;
- (double)marginForTableView:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 maxTitleWidthForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 maxTitleWidthForHeaderInSection:(int64_t)a4;
- (double)tableViewSpacingForExtraSeparators:(id)a3;
- (id)_rebasedShadowUpdatesForUpdate:(id)a3 initialSnapshot:(id)a4;
- (id)_tableView:(id)a3 dragSessionPropertiesForSession:(id)a4;
- (id)_tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)_tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)_tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)_tableView:(id)a3 sectionIndexTitlesTrimmedToCount:(unint64_t)a4;
- (id)_tableView:(id)a3 targetIndexPathForProposedIndexPath:(id)a4 currentIndexPath:(id)a5 dropSession:(id)a6;
- (id)indexPathAfterShadowUpdates:(id)a3;
- (id)indexPathAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4;
- (id)indexPathAfterShadowUpdates:(id)a3 startingAtUpdate:(id)a4;
- (id)indexPathBeforeShadowUpdates:(id)a3;
- (id)indexPathBeforeShadowUpdates:(id)a3 startingBeforeUpdate:(id)a4;
- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4;
- (id)indexPathForPreferredFocusedItemForTableView:(id)a3;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)indexPathsAfterShadowUpdates:(id)a3;
- (id)indexPathsAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4;
- (id)indexPathsBeforeShadowUpdates:(id)a3;
- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)sectionsAfterShadowUpdates:(id)a3;
- (id)sectionsAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4;
- (id)sectionsBeforeShadowUpdates:(id)a3;
- (id)shadowUpdateWithIdentifier:(id)a3;
- (id)tableView:(id)a3 backgroundColorForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 backgroundColorForSwipeAccessoryButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 detailTextForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 dropPreviewParametersForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 leadingSwipeActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForSwipeAccessoryButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)viewForFooterInTableView:(id)a3;
- (id)viewForHeaderInTableView:(id)a3;
- (int64_t)__tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)__tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionAfterShadowUpdates:(int64_t)a3;
- (int64_t)sectionBeforeShadowUpdates:(int64_t)a3;
- (int64_t)tableView:(id)a3 accessoryTypeForRowWithIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4;
- (void)_tableView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)_tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)_tableView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)_tableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)_tableView:(id)a3 dropSessionDidExit:(id)a4;
- (void)_tableView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)appendShadowUpdate:(id)a3;
- (void)rebaseExistingShadowUpdatesForUpdates:(id)a3;
- (void)regenerateUpdateMap;
- (void)removeShadowUpdate:(id)a3;
- (void)reset;
- (void)setInitialSnapshot:(id)a3;
- (void)setShadowUpdates:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUpdateMap:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 didEndDisplayingHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndSwipingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnfocusRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 didUpdateTextFieldForRowAtIndexPath:(id)a4 withValue:(id)a5;
- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)tableView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)tableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)tableView:(id)a3 dropSessionDidExit:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)tableView:(id)a3 performPrimaryActionForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)tableView:(id)a3 swipeAccessoryButtonPushedForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginSwipingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willCommitMenuWithAnimator:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableViewDidFinishReload:(id)a3;
@end

@implementation _UITableViewShadowUpdatesController

- (_UITableViewShadowUpdatesController)initWithTableView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITableViewShadowUpdatesController;
  v5 = [(_UITableViewShadowUpdatesController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableView, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    shadowUpdates = v6->_shadowUpdates;
    v6->_shadowUpdates = (NSMutableArray *)v7;
  }
  return v6;
}

- (BOOL)hasShadowUpdates
{
  return [(NSMutableArray *)self->_shadowUpdates count] != 0;
}

- (NSMutableArray)shadowUpdates
{
  return self->_shadowUpdates;
}

- (id)shadowUpdateWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(_UITableViewShadowUpdatesController *)self shadowUpdates];
  v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v8);
        if (v9) {
          objc_super v10 = (void *)v9[11];
        }
        else {
          objc_super v10 = 0;
        }
        id v11 = v10;
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          v6 = v9;
          goto LABEL_15;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v6 = (void *)v13;
    }
    while (v13);
  }
LABEL_15:

  return v6;
}

- (_UIDataSourceSnapshotter)dataSourceBeforeShadowUpdates
{
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    v3 = [(_UITableViewShadowUpdatesController *)self initialSnapshot];
  }
  else
  {
    v3 = 0;
  }
  return (_UIDataSourceSnapshotter *)v3;
}

- (_UIDataSourceSnapshotter)dataSourceAfterShadowUpdates
{
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    v3 = [(_UITableViewShadowUpdatesController *)self updateMap];
    id v4 = [v3 finalSnapshot];
  }
  else
  {
    id v4 = 0;
  }
  return (_UIDataSourceSnapshotter *)v4;
}

- (void)reset
{
  [(NSMutableArray *)self->_shadowUpdates removeAllObjects];
  [(_UITableViewShadowUpdatesController *)self setInitialSnapshot:0];
  [(_UITableViewShadowUpdatesController *)self setUpdateMap:0];
}

- (_UIDataSourceUpdateMap)updateMap
{
  updateMap = self->_updateMap;
  if (!updateMap)
  {
    [(_UITableViewShadowUpdatesController *)self regenerateUpdateMap];
    updateMap = self->_updateMap;
  }
  return updateMap;
}

- (void)regenerateUpdateMap
{
  id v10 = [(_UITableViewShadowUpdatesController *)self initialSnapshot];
  uint64_t v4 = [(_UITableViewShadowUpdatesController *)self shadowUpdates];
  id v5 = v10;
  v6 = (void *)v4;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UITableViewShadowUpdatesController.m" lineNumber:93 description:@"UITableView internal inconsistency: initialSnapshot should not be nil when creating the update map"];

    id v5 = 0;
  }
  uint64_t v7 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v5 orderedUpdateItems:v6];
  updateMap = self->_updateMap;
  self->_updateMap = v7;

  [(_UIDataSourceUpdateMap *)self->_updateMap _performAppendingInsertsFixups];
}

- (void)appendShadowUpdate:(id)a3
{
  id v5 = a3;
  long long v16 = v5;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UITableViewShadowUpdatesController.m", 100, @"Invalid parameter not satisfying: %@", @"shadowUpdate != nil" object file lineNumber description];

    id v5 = 0;
  }
  v6 = -[UICollectionViewUpdateItem _indexPath](v5);

  if (!v6)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UITableViewShadowUpdatesController.m" lineNumber:101 description:@"UITableView internal inconsistency: attempted to append shadow update without an index path"];
  }
  if (![(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    uint64_t v7 = [(_UITableViewShadowUpdatesController *)self tableView];
    v8 = [off_1E52D5400 snapshotterForDataSourceBackedView:v7];
    [(_UITableViewShadowUpdatesController *)self setInitialSnapshot:v8];
  }
  v9 = v16;
  if (!v16 || !*((void *)v16 + 10))
  {
    id v10 = [(_UITableViewShadowUpdatesController *)self updateMap];
    id v11 = [v10 finalSnapshot];
    char v12 = -[UICollectionViewUpdateItem _indexPath](v16);
    int v13 = [v11 indexPathIsSectionAppendingInsert:v12];

    v9 = v16;
    if (v16)
    {
      if (v13) {
        v16[56] |= 1u;
      }
    }
  }
  [(NSMutableArray *)self->_shadowUpdates addObject:v9];
  [(_UITableViewShadowUpdatesController *)self regenerateUpdateMap];
}

- (void)removeShadowUpdate:(id)a3
{
  uint64_t v4 = a3;
  id v5 = [(_UITableViewShadowUpdatesController *)self updateMap];
  if (v4) {
    v6 = (void *)v4[11];
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v10 = [v5 updateMapByRevertingUpdateWithIdentifier:v7];

  [(NSMutableArray *)self->_shadowUpdates removeAllObjects];
  shadowUpdates = self->_shadowUpdates;
  v9 = [v10 updates];
  [(NSMutableArray *)shadowUpdates addObjectsFromArray:v9];

  [(_UITableViewShadowUpdatesController *)self regenerateUpdateMap];
}

- (void)rebaseExistingShadowUpdatesForUpdates:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(_UITableViewShadowUpdatesController *)self shadowUpdates];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [(_UITableViewShadowUpdatesController *)self tableView];
      v8 = [off_1E52D5400 snapshotterForDataSourceBackedView:v7];

      if ([v4 count] == 1)
      {
        v9 = [v4 firstObject];
        id v10 = [(_UITableViewShadowUpdatesController *)self updateMap];
        id v11 = [v10 initialSnapshot];
        v18[0] = v9;
        char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        int v13 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v11 orderedUpdateItems:v12];
      }
      else
      {
        v9 = [(_UITableViewShadowUpdatesController *)self initialSnapshot];
        int v13 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v9 finalSnapshot:v8 batchUpdateItems:v4];
      }

      v14 = [(_UITableViewShadowUpdatesController *)self updateMap];
      long long v15 = [v14 rebasedMapFromNewBaseMap:v13];

      [(NSMutableArray *)self->_shadowUpdates removeAllObjects];
      shadowUpdates = self->_shadowUpdates;
      long long v17 = [v15 updates];
      [(NSMutableArray *)shadowUpdates addObjectsFromArray:v17];

      [(_UITableViewShadowUpdatesController *)self setInitialSnapshot:v8];
      [(_UITableViewShadowUpdatesController *)self regenerateUpdateMap];
    }
  }
}

- (id)_rebasedShadowUpdatesForUpdate:(id)a3 initialSnapshot:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v37 = v6;
  v45[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v36 = v7;
  v9 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v7 orderedUpdateItems:v8];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v31 = self;
  id obj = [(_UITableViewShadowUpdatesController *)self shadowUpdates];
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v38)
  {
    uint64_t v35 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      id v11 = v9;
      do
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        int v13 = [v12 indexPathBeforeUpdate];
        uint64_t v14 = [v11 finalIndexPathForInitialIndexPath:v13];

        long long v15 = [v12 indexPathAfterUpdate];
        uint64_t v16 = [v11 finalIndexPathForInitialIndexPath:v15];

        if ([v12 updateAction] != 3)
        {
          if ([v12 updateAction]) {
            BOOL v19 = 0;
          }
          else {
            BOOL v19 = v16 == 0;
          }
          if (v19)
          {
            uint64_t v16 = [v12 indexPathAfterUpdate];
          }
          goto LABEL_21;
        }
        if (!v14)
        {
          uint64_t v14 = [v12 indexPathBeforeUpdate];
        }
        if (v14) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, v31, @"_UITableViewShadowUpdatesController.m", 166, @"Rebased moves cannot have either initial or final indexPaths == nil. updateItem(%@)", v12 object file lineNumber description];

LABEL_21:
          if (!(v14 | v16))
          {
            v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:a2, v31, @"_UITableViewShadowUpdatesController.m", 174, @"Rebased updateItem cannot have both an initial+final indexPath == nil. Faulty updateItem is (%@)", v12 object file lineNumber description];

            uint64_t v14 = 0;
            uint64_t v16 = 0;
          }
        }
        uint64_t v20 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v14, v16, [v12 updateAction]);
        if (v12) {
          v21 = (void *)v12[11];
        }
        else {
          v21 = 0;
        }
        id v22 = v21;
        -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v20, v22);

        if ((-[UICollectionViewUpdateItem isNOOP]((uint64_t)v20) & 1) == 0) {
          [v33 addObject:v20];
        }
        v23 = [v11 updates];
        v24 = [v23 arrayByAddingObject:v20];

        v25 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v36 orderedUpdateItems:v24];
        v26 = [v25 finalSnapshot];
        v43 = v37;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        v9 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v26 orderedUpdateItems:v27];

        ++v10;
        id v11 = v9;
      }
      while (v38 != v10);
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      uint64_t v38 = v29;
    }
    while (v29);
  }

  return v33;
}

- (int64_t)sectionBeforeShadowUpdates:(int64_t)a3
{
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    id v5 = [(_UITableViewShadowUpdatesController *)self updateMap];
    a3 = [v5 initialSectionIndexForFinalSectionIndex:a3];
  }
  return a3;
}

- (int64_t)sectionAfterShadowUpdates:(int64_t)a3
{
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    id v5 = [(_UITableViewShadowUpdatesController *)self updateMap];
    a3 = [v5 finalSectionIndexForInitialSectionIndex:a3];
  }
  return a3;
}

- (id)sectionsBeforeShadowUpdates:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITableViewShadowUpdatesController *)self hasShadowUpdates];
  if (v4 && v5)
  {
    id v6 = [(_UITableViewShadowUpdatesController *)self updateMap];
    id v7 = [MEMORY[0x1E4F28E60] indexSet];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67___UITableViewShadowUpdatesController_sectionsBeforeShadowUpdates___block_invoke;
    v13[3] = &unk_1E52DADC0;
    id v14 = v6;
    id v8 = v7;
    id v15 = v8;
    id v9 = v6;
    [v4 enumerateIndexesUsingBlock:v13];
    uint64_t v10 = v15;
    id v11 = v8;
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (id)sectionsAfterShadowUpdates:(id)a3
{
  return [(_UITableViewShadowUpdatesController *)self sectionsAfterShadowUpdates:a3 allowAppendingInsert:0];
}

- (id)sectionsAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(_UITableViewShadowUpdatesController *)self hasShadowUpdates];
  if (v6 && v7)
  {
    id v8 = [(_UITableViewShadowUpdatesController *)self updateMap];
    id v9 = [MEMORY[0x1E4F28E60] indexSet];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87___UITableViewShadowUpdatesController_sectionsAfterShadowUpdates_allowAppendingInsert___block_invoke;
    v15[3] = &unk_1E5309488;
    id v16 = v8;
    BOOL v18 = a4;
    id v10 = v9;
    id v17 = v10;
    id v11 = v8;
    [v6 enumerateIndexesUsingBlock:v15];
    char v12 = v17;
    id v13 = v10;
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (id)indexPathBeforeShadowUpdates:(id)a3
{
  id v4 = a3;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    BOOL v5 = [(_UITableViewShadowUpdatesController *)self updateMap];
    id v6 = [v5 initialIndexPathForFinalIndexPath:v4];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)indexPathAfterShadowUpdates:(id)a3
{
  return [(_UITableViewShadowUpdatesController *)self indexPathAfterShadowUpdates:a3 allowAppendingInsert:0];
}

- (id)indexPathAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    id v12 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    id v8 = [v6 arrayWithObjects:&v12 count:1];

    id v9 = -[_UITableViewShadowUpdatesController indexPathsAfterShadowUpdates:allowAppendingInsert:](self, "indexPathsAfterShadowUpdates:allowAppendingInsert:", v8, v4, v12, v13);
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)indexPathsBeforeShadowUpdates:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_UITableViewShadowUpdatesController *)self hasShadowUpdates];
  if (v4 && v5)
  {
    id v6 = [(_UITableViewShadowUpdatesController *)self updateMap];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(v6, "initialIndexPathForFinalIndexPath:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)indexPathsAfterShadowUpdates:(id)a3
{
  return [(_UITableViewShadowUpdatesController *)self indexPathsAfterShadowUpdates:a3 allowAppendingInsert:0];
}

- (id)indexPathsAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(_UITableViewShadowUpdatesController *)self hasShadowUpdates];
  if (v6 && v7)
  {
    id v8 = [(_UITableViewShadowUpdatesController *)self updateMap];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    id v22 = v6;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v8 finalIndexPathForInitialIndexPath:v13];
        long long v15 = (void *)v14;
        if (v4 && !v14)
        {
          long long v16 = [(_UITableViewShadowUpdatesController *)self updateMap];
          long long v17 = [v16 initialSnapshot];
          int v18 = [v17 indexPathIsSectionAppendingInsert:v13];

          if (!v18) {
            continue;
          }
          BOOL v19 = [(_UITableViewShadowUpdatesController *)self updateMap];
          uint64_t v20 = [v19 finalSnapshot];
          long long v15 = objc_msgSend(v20, "indexPathForAppendingInsertInSection:", objc_msgSend(v13, "section"));
        }
        if (v15)
        {
          [v23 addObject:v15];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v10)
      {
LABEL_16:

        id v6 = v22;
        goto LABEL_18;
      }
    }
  }
  id v23 = v6;
LABEL_18:

  return v23;
}

- (id)indexPathBeforeShadowUpdates:(id)a3 startingBeforeUpdate:(id)a4
{
  id v6 = a3;
  BOOL v7 = a4;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    id v8 = [(_UITableViewShadowUpdatesController *)self updateMap];
    if (v7) {
      uint64_t v9 = (void *)v7[11];
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;
    id v11 = [v8 initialIndexPathForIndexPath:v6 beforeUpdateWithIdentifier:v10];
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

- (id)indexPathAfterShadowUpdates:(id)a3 startingAtUpdate:(id)a4
{
  id v6 = a3;
  BOOL v7 = a4;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    id v8 = [(_UITableViewShadowUpdatesController *)self updateMap];
    if (v7) {
      uint64_t v9 = (void *)v7[11];
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;
    id v11 = [v8 finalIndexPathForIndexPath:v6 startingAtUpdateWithIdentifier:v10];
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

- (void)setShadowUpdates:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (_UIDataSourceSnapshotter)initialSnapshot
{
  return self->_initialSnapshot;
}

- (void)setInitialSnapshot:(id)a3
{
}

- (void)setUpdateMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateMap, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_shadowUpdates, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    BOOL v5 = [(_UITableViewShadowUpdatesController *)self dataSourceAfterShadowUpdates];
    uint64_t v6 = [v5 numberOfSections];
  }
  else
  {
    BOOL v5 = [v4 _dataSourceActual];
    uint64_t v6 = [v5 numberOfSectionsInTableView:v4];
  }
  int64_t v7 = v6;

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    int64_t v7 = [(_UITableViewShadowUpdatesController *)self dataSourceAfterShadowUpdates];
    uint64_t v8 = [v7 numberOfItemsInSection:a4];
  }
  else
  {
    int64_t v7 = [v6 _dataSourceActual];
    uint64_t v8 = [v7 tableView:v6 numberOfRowsInSection:a4];
  }
  int64_t v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v7];
  if (v8)
  {
    int64_t v9 = [v6 _dataSourceActual];
    id v10 = [v9 tableView:v6 cellForRowAtIndexPath:v8];
  }
  else
  {
    id v10 = [v6 _cellForShadowRowAtIndexPath:v7];
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [v6 _dataSourceActual];
    uint64_t v8 = [v10 tableView:v6 titleForHeaderInSection:v9];
  }
  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [v6 _dataSourceActual];
    uint64_t v8 = [v10 tableView:v6 titleForFooterInSection:v9];
  }
  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    uint64_t v8 = [v6 _dataSourceActual];
    char v9 = [v8 tableView:v6 canEditRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    uint64_t v8 = [v6 _dataSourceActual];
    char v9 = [v8 tableView:v6 canMoveRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _dataSourceActual];
  BOOL v5 = [v4 sectionIndexTitlesForTableView:v3];

  return v5;
}

- (id)_tableView:(id)a3 sectionIndexTitlesTrimmedToCount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 _dataSourceActual];
  int64_t v7 = [v6 _tableView:v5 sectionIndexTitlesTrimmedToCount:a4];

  return v7;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _dataSourceActual];
  uint64_t v11 = [v10 tableView:v9 sectionForSectionIndexTitle:v8 atIndex:a5];

  return [(_UITableViewShadowUpdatesController *)self sectionAfterShadowUpdates:v11];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a3;
  id v8 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    id v9 = [v10 _dataSourceActual];
    [v9 tableView:v10 commitEditingStyle:a4 forRowAtIndexPath:v8];
  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v8];

  if (v9 && v10)
  {
    uint64_t v11 = [v12 _dataSourceActual];
    [v11 tableView:v12 moveRowAtIndexPath:v9 toIndexPath:v10];
  }
}

- (id)tableView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _dataSourceActual];
  uint64_t v11 = [v10 tableView:v9 indexPathForSectionIndexTitle:v8 atIndex:a5];

  id v12 = [(_UITableViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v11];

  return v12;
}

- (id)tableView:(id)a3 detailTextForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [v6 _dataSourceActual];
    id v8 = [v10 tableView:v6 detailTextForHeaderInSection:v9];
  }
  return v8;
}

- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a3];
  if (v7)
  {
    id v8 = [(_UITableViewShadowUpdatesController *)self tableView];
    int64_t v9 = [v8 _dataSourceActual];
    id v10 = [v9 modelIdentifierForElementAtIndexPath:v7 inView:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UITableViewShadowUpdatesController *)self tableView];
  int64_t v9 = [v8 _dataSourceActual];
  id v10 = [v9 indexPathForElementWithModelIdentifier:v7 inView:v6];

  uint64_t v11 = [(_UITableViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v10];

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v7];
  if (v8)
  {
    int64_t v9 = [v6 _delegateActual];
    [v9 tableView:v6 heightForRowAtIndexPath:v8];
    double v11 = v10;
  }
  else
  {
    [v6 _heightForShadowRowAtIndexPath:v7];
    double v11 = v12;
  }

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    [v8 tableView:v6 estimatedHeightForRowAtIndexPath:v7];
    double v10 = v9;
  }
  else
  {
    double v10 = -1.0;
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  double v9 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v9)
  {
    double v10 = [v11 _delegateActual];
    [v10 tableView:v11 willDisplayCell:v8 forRowAtIndexPath:v9];
  }
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  int64_t v9 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a5];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = v9;
    id v11 = [v12 _delegateActual];
    [v11 tableView:v12 willDisplayHeaderView:v8 forSection:v10];
  }
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  int64_t v9 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a5];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = v9;
    id v11 = [v12 _delegateActual];
    [v11 tableView:v12 willDisplayFooterView:v8 forSection:v10];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  int64_t v9 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v9)
  {
    int64_t v10 = [v11 _delegateActual];
    [v10 tableView:v11 didEndDisplayingCell:v8 forRowAtIndexPath:v9];
  }
}

- (void)tableView:(id)a3 didEndDisplayingHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  int64_t v9 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a5];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = v9;
    id v11 = [v12 _delegateActual];
    [v11 tableView:v12 didEndDisplayingHeaderView:v8 forSection:v10];
  }
}

- (void)tableView:(id)a3 didEndDisplayingFooterView:(id)a4 forSection:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  int64_t v9 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a5];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = v9;
    id v11 = [v12 _delegateActual];
    [v11 tableView:v12 didEndDisplayingFooterView:v8 forSection:v10];
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    int64_t v10 = [v6 _delegateActual];
    [v10 tableView:v6 heightForHeaderInSection:v9];
    double v8 = v11;
  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    int64_t v10 = [v6 _delegateActual];
    [v10 tableView:v6 heightForFooterInSection:v9];
    double v8 = v11;
  }
  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    int64_t v10 = [v6 _delegateActual];
    [v10 tableView:v6 estimatedHeightForHeaderInSection:v9];
    double v8 = v11;
  }
  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    int64_t v10 = [v6 _delegateActual];
    [v10 tableView:v6 estimatedHeightForFooterInSection:v9];
    double v8 = v11;
  }
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    int64_t v10 = [v6 _delegateActual];
    double v8 = [v10 tableView:v6 viewForHeaderInSection:v9];
  }
  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    int64_t v10 = [v6 _delegateActual];
    double v8 = [v10 tableView:v6 viewForFooterInSection:v9];
  }
  return v8;
}

- (int64_t)tableView:(id)a3 accessoryTypeForRowWithIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    double v8 = [v6 _delegateActual];
    int64_t v9 = [v8 tableView:v6 accessoryTypeForRowWithIndexPath:v7];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 accessoryButtonTappedForRowWithIndexPath:v6];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didHighlightRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didUnhighlightRowAtIndexPath:v6];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 willSelectRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 willDeselectRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didSelectRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didDeselectRowAtIndexPath:v6];
  }
}

- (BOOL)tableView:(id)a3 canPerformPrimaryActionForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 canPerformPrimaryActionForRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 performPrimaryActionForRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 performPrimaryActionForRowAtIndexPath:v6];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    int64_t v9 = [v8 tableView:v6 editingStyleForRowAtIndexPath:v7];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    int64_t v9 = [v8 tableView:v6 titleForDeleteConfirmationButtonForRowAtIndexPath:v7];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    int64_t v9 = [v8 tableView:v6 editActionsForRowAtIndexPath:v7];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 shouldIndentWhileEditingRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 willBeginEditingRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didEndEditingRowAtIndexPath:v6];
  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v9];
  id v12 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v10];

  if (v11 && v12)
  {
    uint64_t v13 = [v8 _delegateActual];
    uint64_t v14 = [v13 tableView:v8 targetIndexPathForMoveFromRowAtIndexPath:v11 toProposedIndexPath:v12];

    uint64_t v15 = [(_UITableViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v14];
    long long v16 = (void *)v15;
    if (v15) {
      long long v17 = (void *)v15;
    }
    else {
      long long v17 = v9;
    }
    id v18 = v17;
  }
  else
  {
    id v18 = v9;
  }

  return v18;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    int64_t v9 = [v8 tableView:v6 indentationLevelForRowAtIndexPath:v7];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 shouldShowMenuForRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v12)
  {
    uint64_t v13 = [v10 _delegateActual];
    char v14 = [v13 tableView:v10 canPerformAction:a4 forRowAtIndexPath:v12 withSender:v11];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v13 = a3;
  id v10 = a6;
  id v11 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v11)
  {
    id v12 = [v13 _delegateActual];
    [v12 tableView:v13 performAction:a4 forRowAtIndexPath:v11 withSender:v10];
  }
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 canFocusRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 previouslyFocusedIndexPath];
  char v9 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v8];

  id v10 = [v6 nextFocusedIndexPath];
  id v11 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v10];

  id v12 = [v6 previouslyFocusedIndexPath];
  id v13 = v12;
  if (!v12 || v9)
  {
    char v14 = [v6 nextFocusedIndexPath];

    if (!v14 || v11) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v19 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "Support for shadow updates on tvOS with the focus system is not implemented yet.", buf, 2u);
    }
  }
  else
  {
    uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &tableView_shouldUpdateFocusInContext____s_category) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Support for shadow updates on tvOS with the focus system is not implemented yet.", v20, 2u);
    }
  }
LABEL_9:
  long long v16 = [v7 _delegateActual];
  char v17 = [v16 tableView:v7 shouldUpdateFocusInContext:v6];

  return v17;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 previouslyFocusedIndexPath];
  id v12 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v11];

  id v13 = [v8 nextFocusedIndexPath];
  char v14 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v13];

  uint64_t v15 = [v8 previouslyFocusedIndexPath];
  long long v16 = v15;
  if (!v15 || v12)
  {
    char v17 = [v8 nextFocusedIndexPath];

    if (!v17 || v14) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v20 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Support for shadow updates on tvOS with the focus system is not implemented yet.", buf, 2u);
    }
  }
  else
  {
    id v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &tableView_didUpdateFocusInContext_withAnimationCoordinator____s_category)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Support for shadow updates on tvOS with the focus system is not implemented yet.", v21, 2u);
    }
  }
LABEL_9:
  BOOL v19 = [v10 _delegateActual];
  [v19 tableView:v10 didUpdateFocusInContext:v8 withAnimationCoordinator:v9];
}

- (BOOL)tableView:(id)a3 selectionFollowsFocusForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 tableView:v6 selectionFollowsFocusForRowAtIndexPath:v7];
  }
  else
  {
    char v9 = [v6 selectionFollowsFocus];
  }

  return v9;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _delegateActual];
  id v6 = [v5 indexPathForPreferredFocusedViewInTableView:v4];

  id v7 = [(_UITableViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v6];

  return v7;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [v6 _delegateActual];
    char v8 = [v10 tableView:v6 wantsHeaderForSection:v9];
  }
  return v8;
}

- (double)tableViewSpacingForExtraSeparators:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  [v4 tableViewSpacingForExtraSeparators:v3];
  double v6 = v5;

  return v6;
}

- (CGPoint)tableView:(id)a3 newContentOffsetAfterUpdate:(CGPoint)a4 context:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  objc_msgSend(v10, "tableView:newContentOffsetAfterUpdate:context:", v9, v8, x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)tableView:(id)a3 didUpdateTextFieldForRowAtIndexPath:(id)a4 withValue:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  id v9 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v9)
  {
    id v10 = [v11 _delegateActual];
    [v10 tableView:v11 didUpdateTextFieldForRowAtIndexPath:v9 withValue:v8];
  }
}

- (double)marginForTableView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  [v4 marginForTableView:v3];
  double v6 = v5;

  return v6;
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = 4;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [v6 _delegateActual];
    int64_t v8 = [v10 tableView:v6 titleAlignmentForHeaderInSection:v9];
  }
  return v8;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = 4;
  }
  else
  {
    int64_t v9 = v7;
    id v10 = [v6 _delegateActual];
    int64_t v8 = [v10 tableView:v6 titleAlignmentForFooterInSection:v9];
  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v10)
  {
    id v11 = [v8 _delegateActual];
    char v12 = [v11 tableView:v8 shouldSpringLoadRowAtIndexPath:v10 withContext:v9];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)_tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v10)
  {
    id v11 = [v8 _delegateActual];
    char v12 = [v11 _tableView:v8 shouldSpringLoadRowAtIndexPath:v10 withContext:v9];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (double)tableView:(id)a3 maxTitleWidthForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    id v10 = [v6 _delegateActual];
    [v10 tableView:v6 maxTitleWidthForHeaderInSection:v9];
    double v8 = v11;
  }
  return v8;
}

- (double)tableView:(id)a3 maxTitleWidthForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  double v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    id v10 = [v6 _delegateActual];
    [v10 tableView:v6 maxTitleWidthForFooterInSection:v9];
    double v8 = v11;
  }
  return v8;
}

- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  int64_t v9 = [v8 _delegateActual];
  objc_msgSend(v9, "tableView:frameForSectionIndexGivenProposedFrame:", v8, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  [v4 tableViewDidFinishReload:v3];
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  [v4 heightForHeaderInTableView:v3];
  double v6 = v5;

  return v6;
}

- (double)heightForFooterInTableView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  [v4 heightForFooterInTableView:v3];
  double v6 = v5;

  return v6;
}

- (id)viewForHeaderInTableView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  double v5 = [v4 viewForHeaderInTableView:v3];

  return v5;
}

- (id)viewForFooterInTableView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _delegateActual];
  double v5 = [v4 viewForFooterInTableView:v3];

  return v5;
}

- (CGRect)tableView:(id)a3 calloutTargetRectForCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    double v11 = [v8 _delegateActual];
    [v11 tableView:v8 calloutTargetRectForCell:v9 forRowAtIndexPath:v10];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 leadingSwipeActionsConfigurationForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 trailingSwipeActionsConfigurationForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 leadingSwipeActionsForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 leadingSwipeActionsForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 trailingSwipeActionsForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 willBeginReorderingRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didEndReorderingRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didCancelReorderingRowAtIndexPath:v6];
  }
}

- (id)tableView:(id)a3 backgroundColorForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 backgroundColorForDeleteConfirmationButtonForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 backgroundColorForSwipeAccessoryButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 backgroundColorForSwipeAccessoryButtonForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForSwipeAccessoryButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    id v9 = [v8 tableView:v6 titleForSwipeAccessoryButtonForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 swipeAccessoryButtonPushedForRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 swipeAccessoryButtonPushedForRowAtIndexPath:v6];
  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    double v10 = [v6 _delegateActual];
    char v8 = [v10 tableView:v6 shouldDrawTopSeparatorForSection:v9];
  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    double v10 = [v6 _delegateActual];
    char v8 = [v10 tableView:v6 shouldDrawBottomSeparatorForSection:v9];
  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    double v10 = [v6 _delegateActual];
    char v8 = [v10 tableView:v6 shouldHaveFullLengthTopSeparatorForSection:v9];
  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self sectionBeforeShadowUpdates:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    double v10 = [v6 _delegateActual];
    char v8 = [v10 tableView:v6 shouldHaveFullLengthBottomSeparatorForSection:v9];
  }
  return v8;
}

- (void)tableView:(id)a3 willBeginSwipingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 willBeginSwipingRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didEndSwipingRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didEndSwipingRowAtIndexPath:v6];
  }
}

- (BOOL)_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 _tableView:v6 canFocusRowAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didFocusRowAtIndexPath:v6];
  }
}

- (void)tableView:(id)a3 didUnfocusRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    int64_t v7 = [v8 _delegateActual];
    [v7 tableView:v8 didUnfocusRowAtIndexPath:v6];
  }
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusFromRowAtIndexPath:(id)a4 toView:(id)a5 heading:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v12)
  {
    double v13 = [v10 _delegateActual];
    char v14 = [v13 tableView:v10 shouldUpdateFocusFromRowAtIndexPath:v12 toView:v11 heading:a6];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)indexPathForPreferredFocusedItemForTableView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 _delegateActual];
  id v6 = [v5 indexPathForPreferredFocusedItemForTableView:v4];

  int64_t v7 = [(_UITableViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v6];

  return v7;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v10)
  {
    id v11 = [v9 _delegateActual];
    double v12 = objc_msgSend(v11, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", v9, v10, x, y);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int64_t v7 = [v6 _delegateActual];
  id v8 = [v7 tableView:v6 previewForHighlightingContextMenuWithConfiguration:v5];

  return v8;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int64_t v7 = [v6 _delegateActual];
  id v8 = [v7 tableView:v6 previewForDismissingContextMenuWithConfiguration:v5];

  return v8;
}

- (void)tableView:(id)a3 willCommitMenuWithAnimator:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _delegateActual];
  [v7 tableView:v6 willCommitMenuWithAnimator:v5];
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  [v10 tableView:v9 willPerformPreviewActionForMenuWithConfiguration:v8 animator:v7];
}

- (void)tableView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  [v10 tableView:v9 willDisplayContextMenuWithConfiguration:v8 animator:v7];
}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  [v10 tableView:v9 willEndContextMenuInteractionWithConfiguration:v8 animator:v7];
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathsBeforeShadowUpdates:a4];
  if ([v6 count])
  {
    id v7 = [v8 _prefetchDataSourceActual];
    [v7 tableView:v8 prefetchRowsAtIndexPaths:v6];
  }
}

- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4
{
  id v8 = a3;
  id v6 = [(_UITableViewShadowUpdatesController *)self indexPathsBeforeShadowUpdates:a4];
  if ([v6 count])
  {
    id v7 = [v8 _prefetchDataSourceActual];
    [v7 tableView:v8 cancelPrefetchingForRowsAtIndexPaths:v6];
  }
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    id v11 = [v8 _dragDelegateActual];
    double v12 = [v11 tableView:v8 itemsForBeginningDragSession:v9 atIndexPath:v10];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v11 = a3;
  id v12 = a4;
  double v13 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v13)
  {
    char v14 = [v11 _dragDelegateActual];
    double v15 = objc_msgSend(v14, "tableView:itemsForAddingToDragSession:atIndexPath:point:", v11, v12, v13, x, y);
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _dragDelegateActual];
    id v9 = [v8 tableView:v6 dragPreviewParametersForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDelegateActual];
  [v7 tableView:v6 dragSessionWillBegin:v5];
}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDelegateActual];
  [v7 tableView:v6 dragSessionDidEnd:v5];
}

- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDelegateActual];
  char v8 = [v7 tableView:v6 dragSessionAllowsMoveOperation:v5];

  return v8;
}

- (BOOL)tableView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDelegateActual];
  char v8 = [v7 tableView:v6 dragSessionIsRestrictedToDraggingApplication:v5];

  return v8;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    id v11 = [v8 _dragDelegateActual];
    int64_t v12 = [v11 _tableView:v8 dataOwnerForDragSession:v9 atIndexPath:v10];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_tableView:(id)a3 dragSessionSupportsSystemDrag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDelegateActual];
  char v8 = [v7 _tableView:v6 dragSessionSupportsSystemDrag:v5];

  return v8;
}

- (id)_tableView:(id)a3 dragSessionPropertiesForSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDelegateActual];
  char v8 = [v7 _tableView:v6 dragSessionPropertiesForSession:v5];

  return v8;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke;
    v10[3] = &unk_1E52E5E90;
    v10[4] = self;
    [v6 _translateDestinationIndexPath:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke_2;
    v9[3] = &unk_1E52E5E90;
    v9[4] = self;
    [v6 _translateSourceIndexPathsOfDropItems:v9];
  }
  char v8 = [v7 _dropDelegateActual];
  [v8 tableView:v7 performDropWithCoordinator:v6];
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dropDelegateActual];
  char v8 = [v7 tableView:v6 canHandleDropSession:v5];

  return v8;
}

- (void)tableView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dropDelegateActual];
  [v7 tableView:v6 dropSessionDidEnter:v5];
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  id v11 = [v9 _dropDelegateActual];
  int64_t v12 = [v11 tableView:v9 dropSessionDidUpdate:v8 withDestinationIndexPath:v10];

  return v12;
}

- (void)tableView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dropDelegateActual];
  [v7 tableView:v6 dropSessionDidExit:v5];
}

- (void)tableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dropDelegateActual];
  [v7 tableView:v6 dropSessionDidEnd:v5];
}

- (id)tableView:(id)a3 dropPreviewParametersForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _dropDelegateActual];
    id v9 = [v8 tableView:v6 dropPreviewParametersForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  id v11 = [v9 _dropDelegateActual];
  int64_t v12 = [v11 _tableView:v9 dataOwnerForDropSession:v8 withDestinationIndexPath:v10];

  return v12;
}

- (id)_tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    id v11 = [v8 _dragSourceDelegateActual];
    int64_t v12 = [v11 _tableView:v8 itemsForBeginningDragSession:v9 atIndexPath:v10];
  }
  else
  {
    int64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)_tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v11 = a3;
  id v12 = a4;
  double v13 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v13)
  {
    char v14 = [v11 _dragSourceDelegateActual];
    double v15 = objc_msgSend(v14, "_tableView:itemsForAddingToDragSession:atIndexPath:point:", v11, v12, v13, x, y);
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (void)_tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragSourceDelegateActual];
  [v7 _tableView:v6 dragSessionWillBegin:v5];
}

- (void)_tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragSourceDelegateActual];
  [v7 _tableView:v6 dragSessionDidEnd:v5];
}

- (int64_t)__tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    id v11 = [v8 _dragSourceDelegateActual];
    int64_t v12 = objc_msgSend(v11, "__tableView:dataOwnerForDragSession:atIndexPath:", v8, v9, v10);
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (void)_tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(_UITableViewShadowUpdatesController *)self hasShadowUpdates])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke;
    v10[3] = &unk_1E52E5E90;
    v10[4] = self;
    [v6 _translateDestinationIndexPath:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke_2;
    v9[3] = &unk_1E52E5E90;
    v9[4] = self;
    [v6 _translateSourceIndexPathsOfDropItems:v9];
  }
  id v8 = [v7 _dragDestinationDelegateActual];
  [v8 _tableView:v7 performDropWithCoordinator:v6];
}

- (BOOL)_tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDestinationDelegateActual];
  char v8 = [v7 _tableView:v6 canHandleDropSession:v5];

  return v8;
}

- (void)_tableView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDestinationDelegateActual];
  [v7 _tableView:v6 dropSessionDidEnter:v5];
}

- (id)_tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  id v11 = [v9 _dragDestinationDelegateActual];
  int64_t v12 = [v11 _tableView:v9 dropSessionDidUpdate:v8 withDestinationIndexPath:v10];

  return v12;
}

- (void)_tableView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDestinationDelegateActual];
  [v7 _tableView:v6 dropSessionDidExit:v5];
}

- (void)_tableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _dragDestinationDelegateActual];
  [v7 _tableView:v6 dropSessionDidEnd:v5];
}

- (id)_tableView:(id)a3 targetIndexPathForProposedIndexPath:(id)a4 currentIndexPath:(id)a5 dropSession:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v13)
  {
    char v14 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v11];
    double v15 = [v10 _dragDestinationDelegateActual];
    double v16 = [v15 _tableView:v10 targetIndexPathForProposedIndexPath:v13 currentIndexPath:v14 dropSession:v12];
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (int64_t)__tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UITableViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  id v11 = [v9 _dragDestinationDelegateActual];
  int64_t v12 = objc_msgSend(v11, "__tableView:dataOwnerForDropSession:withDestinationIndexPath:", v9, v8, v10);

  return v12;
}

@end