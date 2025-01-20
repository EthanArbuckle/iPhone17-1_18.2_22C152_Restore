@interface _UICollectionViewShadowUpdatesController
- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)_collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)_collectionView:(id)a3 canHandleDropSesson:(id)a4;
- (BOOL)_collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)_collectionView:(id)a3 dragSessionSupportsSystemDrag:(id)a4;
- (BOOL)_collectionView:(id)a3 prefersFullSizePreviewsForDragSession:(id)a4;
- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5;
- (BOOL)_collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)_rebaseForUpdateMap:(id)a3;
- (BOOL)_shadowUpdatesAreSimpleInsertWithOptionalMoveSequenceForIndexPath:(id)a3;
- (BOOL)_shouldPerformTranslationForDelegateBasedFlowLayoutSizing;
- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldShowMenuForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)collectionView:(id)a3 shouldUpdateFocusFromItemAtIndexPath:(id)a4 toView:(id)a5 heading:(unint64_t)a6;
- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)collectionView:(id)a3 tableLayout:(id)a4 shouldIndentWhileEditingRowAtIndexPath:(id)a5;
- (BOOL)rebaseForUpdates:(id)a3;
- (BOOL)shouldRebaseForUpdates;
- (CGPoint)_collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSMutableArray)_shadowUpdates;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_UICollectionViewShadowUpdatesController)initWithCollectionView:(id)a3;
- (_UIDataSourceSnapshotter)initialSnapshot;
- (_UIDataSourceUpdateMap)updateMap;
- (double)collectionView:(id)a3 heightForFooterViewInTableLayout:(id)a4;
- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForFooterInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForHeaderInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForRowAtIndexPath:(id)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForFooterInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5;
- (id)_coalesceUpdatesIfPossible:(id)a3;
- (id)_collectionView:(id)a3 accessoriesForContextMenuWithConfiguration:(id)a4 layoutAnchor:(id *)a5;
- (id)_collectionView:(id)a3 dragDestinationTargetIndexPathForProposedIndexPath:(id)a4 currentIndexPath:(id)a5 dropSession:(id)a6;
- (id)_collectionView:(id)a3 dragSessionPropertiesForSession:(id)a4;
- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)_collectionView:(id)a3 flowLayoutRowAlignmentOptionsForSection:(int64_t)a4;
- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4;
- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5;
- (id)_collectionView:(id)a3 layout:(id)a4 sizesForItemsInSection:(int64_t)a5;
- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4;
- (id)_collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)_collectionView:(id)a3 sectionIndexTitlesTrimmedToCount:(unint64_t)a4;
- (id)_collectionView:(id)a3 styleForContextMenuWithConfiguration:(id)a4;
- (id)_collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForDismissingToItemAtIndexPath:(id)a5;
- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForHighlightingItemAtIndexPath:(id)a5;
- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForSelectedItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)_expandCollapseAnimationContextForCollectionView:(id)a3;
- (id)_findInsertShadowUpdateForFinalIndexPath:(id)a3;
- (id)_findShadowUpdateForIdentifier:(id)a3 inShadowUpdates:(id)a4;
- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3;
- (id)_indexPathsBeforeShadowUpdates:(id)a3;
- (id)_rebasedShadowUpdatesForUpdate:(id)a3 initialSnapshot:(id)a4 shadowUpdates:(id)a5;
- (id)_rebasedUpdateMapForUpdates:(id)a3;
- (id)_sectionIndexTitlesForCollectionView:(id)a3;
- (id)_shadowUpdateReuseIdentifierForItemItemAtIndexPath:(id)a3;
- (id)_supplementaryIndexPathBeforeShadowUpdates:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 leadingSwipeActionsForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)computeRevertShadowUpdates;
- (id)indexPathAfterShadowUpdates:(id)a3;
- (id)indexPathAfterShadowUpdates:(id)a3 allowingAppendingInserts:(BOOL)a4;
- (id)indexPathBeforeShadowUpdates:(id)a3;
- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4;
- (id)indexPathForPreferredFocusedItemForCollectionView:(id)a3;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)indexPathsAfterShadowUpdates:(id)a3;
- (id)indexPathsBeforeShadowUpdates:(id)a3;
- (id)indexTitlesForCollectionView:(id)a3;
- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 indentationLevelForRowAtIndexPath:(id)a5;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)sectionIndexAfterShadowUpdates:(int64_t)a3;
- (int64_t)sectionIndexAfterShadowUpdates:(int64_t)a3 allowingAppendingInserts:(BOOL)a4;
- (int64_t)sectionIndexBeforeShadowUpdates:(int64_t)a3;
- (void)_collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4;
- (void)_collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)_collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)_collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)_collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)_collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)_collectionView:(id)a3 horizontalIndexTitleBar:(id)a4 selectedEntry:(id)a5;
- (void)_collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)_collectionView:(id)a3 willPerformUpdates:(id)a4;
- (void)_pruneAndRebaseShadowUpdatesForShadowInsertWithIdentifier:(id)a3;
- (void)_regenerateUpdateMap;
- (void)appendShadowUpdate:(id)a3;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)collectionView:(id)a3 performAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 tableLayout:(id)a4 accessoryButtonTappedForRowWithIndexPath:(id)a5;
- (void)collectionView:(id)a3 tableLayout:(id)a4 commitEditingStyle:(int64_t)a5 forRowAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 tableLayout:(id)a4 didEndEditingRowAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 tableLayout:(id)a4 willBeginEditingRowAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)reset;
- (void)setCollectionView:(id)a3;
- (void)setInitialSnapshot:(id)a3;
- (void)setUpdateMap:(id)a3;
- (void)set_shadowUpdates:(id)a3;
@end

@implementation _UICollectionViewShadowUpdatesController

- (NSMutableArray)_shadowUpdates
{
  return self->__shadowUpdates;
}

- (BOOL)shouldRebaseForUpdates
{
  if (!self->_updateMap || !self->_initialSnapshot) {
    return 0;
  }
  v3 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  if ([v3 count])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    if ([v5 hasActiveDrop])
    {
      char v4 = 1;
    }
    else
    {
      v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
      char v4 = [v6 hasActiveDrag];
    }
  }

  return v4;
}

- (id)indexPathAfterShadowUpdates:(id)a3 allowingAppendingInserts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableArray *)self->__shadowUpdates count])
  {
    if (v4
      && ([(_UICollectionViewShadowUpdatesController *)self updateMap],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 initialSnapshot],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 indexPathIsSectionAppendingInsert:v6],
          v8,
          v7,
          v9))
    {
      v10 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
      v11 = [v10 finalSnapshot];
      objc_msgSend(v11, "indexPathForAppendingInsertInSection:", objc_msgSend(v6, "section"));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
      id v12 = [v10 finalIndexPathForInitialIndexPath:v6];
    }
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

- (id)indexPathAfterShadowUpdates:(id)a3
{
  return [(_UICollectionViewShadowUpdatesController *)self indexPathAfterShadowUpdates:a3 allowingAppendingInserts:0];
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (_UICollectionViewShadowUpdatesController)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewShadowUpdatesController;
  v5 = [(_UICollectionViewShadowUpdatesController *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    shadowUpdates = v6->__shadowUpdates;
    v6->__shadowUpdates = v7;

    [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"com.apple.UIKit.shadowReuseCellIdentifier"];
  }

  return v6;
}

- (void)setUpdateMap:(id)a3
{
}

- (void)reset
{
  v3 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  [v3 removeAllObjects];

  [(_UICollectionViewShadowUpdatesController *)self setInitialSnapshot:0];
  [(_UICollectionViewShadowUpdatesController *)self setUpdateMap:0];
}

- (void)setInitialSnapshot:(id)a3
{
}

- (BOOL)rebaseForUpdates:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(_UICollectionViewShadowUpdatesController *)self _rebasedUpdateMapForUpdates:v4];
    if (v5) {
      BOOL v6 = [(_UICollectionViewShadowUpdatesController *)self _rebaseForUpdateMap:v5];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_rebaseForUpdateMap:(id)a3
{
  id v4 = a3;
  v5 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  BOOL v6 = [off_1E52D5400 snapshotterForDataSourceBackedView:v5];

  v7 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
  v8 = [v7 rebasedMapFromNewBaseMap:v4];

  if (v8)
  {
    int v9 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    [v9 removeAllObjects];

    objc_super v10 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    v11 = [v8 updates];
    [v10 addObjectsFromArray:v11];

    [(_UICollectionViewShadowUpdatesController *)self setInitialSnapshot:v6];
    [(_UICollectionViewShadowUpdatesController *)self _regenerateUpdateMap];
  }

  return v8 != 0;
}

- (void)appendShadowUpdate:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
      v8 = [off_1E52D5400 snapshotterForDataSourceBackedView:v7];
      [(_UICollectionViewShadowUpdatesController *)self setInitialSnapshot:v8];
    }
    if (!v4[10])
    {
      int v9 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
      objc_super v10 = [v9 finalSnapshot];
      uint64_t v11 = 8;
      if (!v4[10]) {
        uint64_t v11 = 9;
      }
      id v12 = (id)v4[v11];
      int v13 = [v10 indexPathIsSectionAppendingInsert:v12];

      if (v13) {
        *((unsigned char *)v4 + 56) |= 1u;
      }
    }
    v14 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    v15 = [v14 lastObject];

    if (!v15
      || (v22[0] = v15,
          v22[1] = v4,
          [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2],
          v16 = objc_claimAutoreleasedReturnValue(),
          [(_UICollectionViewShadowUpdatesController *)self _coalesceUpdatesIfPossible:v16], v17 = objc_claimAutoreleasedReturnValue(), v16, !v17))
    {
      v17 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
      [v17 addObject:v4];
LABEL_22:

      [(_UICollectionViewShadowUpdatesController *)self _regenerateUpdateMap];
      goto LABEL_23;
    }
    v18 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    uint64_t v19 = [v18 count] - 1;

    if (v17[10] == 3 && v17[2] == v17[4] && v17[1] == v17[3])
    {
      v20 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
LABEL_20:
      [v20 removeObjectAtIndex:v19];
      goto LABEL_21;
    }
    if (v17[8])
    {
      v20 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    }
    else
    {
      uint64_t v21 = v17[9];
      v20 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
      if (!v21) {
        goto LABEL_20;
      }
    }
    [v20 replaceObjectAtIndex:v19 withObject:v17];
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:
}

- (id)computeRevertShadowUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = -[UICollectionViewUpdateItem revertedUpdate](*(UICollectionViewUpdateItem **)(*((void *)&v12 + 1) + 8 * i));
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    int v9 = [v8 finalSnapshot];
    int64_t v10 = [v9 numberOfItemsInSection:a4];
  }
  else
  {
    uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int v9 = [v8 _dataSourceActual];
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v10 = [v9 collectionView:v11 numberOfItemsInSection:a4];
  }
  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    uint64_t v7 = [v6 finalSnapshot];
    int64_t v8 = [v7 numberOfSections];
  }
  else
  {
    uint64_t v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v7 = [v6 _dataSourceActual];
    int v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v8 = [v7 numberOfSectionsInCollectionView:v9];
  }
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v6];
  if (v8)
  {
    int v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v10 = [v9 _dataSourceActual];
    uint64_t v11 = [v10 collectionView:v7 cellForItemAtIndexPath:v8];
  }
  else
  {
    int v9 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdateReuseIdentifierForItemItemAtIndexPath:v6];
    uint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

    [(_UICollectionViewShadowUpdatesController *)self _updateCellIfNeeded:v11 atIndexPath:v6];
    if ([v9 isEqualToString:@"com.apple.UIKit.shadowReuseCellIdentifier"]) {
      [v11 _setHiddenForReordering:1];
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self _supplementaryIndexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    long long v12 = [v11 _dataSourceActual];
    long long v13 = [v12 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v9 = [v8 _dataSourceActual];
    char v10 = [v9 collectionView:v6 canMoveItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  id v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  char v10 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v8];

  if (v9 && v10)
  {
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    long long v12 = [v11 _dataSourceActual];
    [v12 collectionView:v13 moveItemAtIndexPath:v9 toIndexPath:v10];
  }
}

- (id)_expandCollapseAnimationContextForCollectionView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v5 _dataSourceActual];
  id v7 = [v6 _expandCollapseAnimationContextForCollectionView:v4];

  return v7;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  id v4 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  uint64_t v5 = [v4 _dataSourceActual];
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v5 indexTitlesForCollectionView:v6];

  return v7;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v9 = [v8 _dataSourceActual];
  char v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  uint64_t v11 = [v9 collectionView:v10 indexPathForIndexTitle:v7 atIndex:a5];

  return v11;
}

- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a3];
  if (v7)
  {
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v9 = [v8 _dataSourceActual];
    char v10 = [v9 modelIdentifierForElementAtIndexPath:v7 inView:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v9 = [v8 _dataSourceActual];
  char v10 = [v9 indexPathForElementWithModelIdentifier:v7 inView:v6];

  uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v10];

  return v11;
}

- (BOOL)_collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v5)
  {
    id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v7 = [v6 _dataSourceActual];
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v9 = [v7 _collectionView:v8 canMoveItemAtIndexPath:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  char v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  char v10 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v8];

  if (v9 && v10)
  {
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    long long v12 = [v11 _dataSourceActual];
    [v12 _collectionView:v13 moveItemAtIndexPath:v9 toIndexPath:v10];
  }
}

- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v9 = [v8 _dataSourceActual];
    char v10 = [v9 _collectionView:v6 canEditItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v5 _dataSourceActual];
  id v7 = [v6 _sectionIndexTitlesForCollectionView:v4];

  return v7;
}

- (id)_collectionView:(id)a3 sectionIndexTitlesTrimmedToCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v8 = [v7 _dataSourceActual];
  char v9 = [v8 _collectionView:v6 sectionIndexTitlesTrimmedToCount:a4];

  return v9;
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  uint64_t v11 = [v10 _dataSourceActual];
  long long v12 = [v11 _collectionView:v9 indexPathForSectionIndexTitle:v8 atIndex:a5];

  return v12;
}

- (void)_collectionView:(id)a3 willPerformUpdates:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        id v13 = objc_msgSend(v12, "indexPathBeforeUpdate", v23);
        long long v14 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v13];

        long long v15 = [v12 indexPathAfterUpdate];
        v16 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v15];

        uint64_t v17 = [UICollectionViewUpdateItem alloc];
        if (v12) {
          uint64_t v18 = v12[10];
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = [(UICollectionViewUpdateItem *)v17 initWithInitialIndexPath:v14 finalIndexPath:v16 updateAction:v18];
        [v7 addObject:v19];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v9 = v20;
    }
    while (v20);
  }

  uint64_t v21 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  v22 = [v21 _dataSourceActual];
  [v22 _collectionView:v23 willPerformUpdates:v7];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v9 = [v8 _delegateActual];
    char v10 = [v9 collectionView:v6 shouldHighlightItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v8 = [v7 _delegateActual];
    [v8 collectionView:v9 didHighlightItemAtIndexPath:v6];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v8 = [v7 _delegateActual];
    [v8 collectionView:v9 didUnhighlightItemAtIndexPath:v6];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v9 = [v8 _delegateActual];
    char v10 = [v9 collectionView:v6 shouldSelectItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    uint64_t v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v9 = [v8 _delegateActual];
    char v10 = [v9 collectionView:v6 shouldDeselectItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v8 = [v7 _delegateActual];
    [v8 collectionView:v9 didSelectItemAtIndexPath:v6];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v8 = [v7 _delegateActual];
    [v8 collectionView:v9 didDeselectItemAtIndexPath:v6];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v9)
  {
    char v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v11 = [v10 _delegateActual];
    [v11 collectionView:v12 willDisplayCell:v8 forItemAtIndexPath:v9];
  }
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(_UICollectionViewShadowUpdatesController *)self _supplementaryIndexPathBeforeShadowUpdates:a6];
  if (v12)
  {
    id v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    long long v14 = [v13 _delegateActual];
    [v14 collectionView:v15 willDisplaySupplementaryView:v10 forElementKind:v11 atIndexPath:v12];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v9)
  {
    id v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v11 = [v10 _delegateActual];
    [v11 collectionView:v12 didEndDisplayingCell:v8 forItemAtIndexPath:v9];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(_UICollectionViewShadowUpdatesController *)self _supplementaryIndexPathBeforeShadowUpdates:a6];
  if (v12)
  {
    id v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    long long v14 = [v13 _delegateActual];
    [v14 collectionView:v15 didEndDisplayingSupplementaryView:v10 forElementOfKind:v11 atIndexPath:v12];
  }
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v7];
  if (v8)
  {
    id v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v10 = [v9 _delegateActual];
    char v11 = [v10 collectionView:v6 canEditItemAtIndexPath:v7];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldShowMenuForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v9 = [v8 _delegateActual];
    char v10 = [v9 collectionView:v6 shouldShowMenuForItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v12)
  {
    id v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    long long v14 = [v13 _delegateActual];
    char v15 = [v14 collectionView:v10 canPerformAction:a4 forItemAtIndexPath:v12 withSender:v11];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)collectionView:(id)a3 performAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  id v14 = a3;
  id v10 = a6;
  id v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v11)
  {
    id v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v13 = [v12 _delegateActual];
    [v13 collectionView:v14 performAction:a4 forItemAtIndexPath:v11 withSender:v10];
  }
}

- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v12 = [v11 _delegateActual];
  id v13 = [v12 collectionView:v10 transitionLayoutForOldLayout:v9 newLayout:v8];

  return v13;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v15 = [v14 _delegateActual];
  v16 = [v15 collectionView:v13 targetIndexPathForMoveOfItemFromOriginalIndexPath:v12 atCurrentIndexPath:v11 toProposedIndexPath:v10];

  return v16;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v12 = [v11 _delegateActual];
  id v13 = [v12 collectionView:v10 targetIndexPathForMoveFromItemAtIndexPath:v9 toProposedIndexPath:v8];

  return v13;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v9 = [v8 _delegateActual];
  objc_msgSend(v9, "collectionView:targetContentOffsetForProposedContentOffset:", v7, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v9 = [v8 _delegateActual];
    char v10 = [v9 collectionView:v6 canFocusItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _delegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 collectionView:v8 shouldUpdateFocusInContext:v5];

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v11 _delegateActual];
  char v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v9 collectionView:v10 didUpdateFocusInContext:v8 withAnimationCoordinator:v7];
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v10 = [v8 collectionView:v9 selectionFollowsFocusForItemAtIndexPath:v5];
  }
  else
  {
    char v10 = [v6 selectionFollowsFocus];
  }

  return v10;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v5 = [v4 _delegateActual];
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v5 indexPathForPreferredFocusedViewInCollectionView:v6];

  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v7];

  return v8;
}

- (BOOL)_collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v9 = [v8 _delegateActual];
    char v10 = [v9 _collectionView:v6 canFocusItemAtIndexPath:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)indexPathForPreferredFocusedItemForCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v5 _delegateActual];
  id v7 = [v6 indexPathForPreferredFocusedItemForCollectionView:v4];

  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathAfterShadowUpdates:v7];

  return v8;
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v8 = [v7 _delegateActual];
    [v8 collectionView:v9 didFocusItemAtIndexPath:v6];
  }
}

- (void)_collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v8 = [v7 _delegateActual];
    [v8 _collectionView:v9 didFocusItemAtIndexPath:v6];
  }
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v8 = [v7 _delegateActual];
    [v8 collectionView:v9 didUnfocusItemAtIndexPath:v6];
  }
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusFromItemAtIndexPath:(id)a4 toView:(id)a5 heading:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v12)
  {
    double v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v14 = [v13 _delegateActual];
    char v15 = [v14 collectionView:v10 shouldUpdateFocusFromItemAtIndexPath:v12 toView:v11 heading:a6];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)_collectionView:(id)a3 horizontalIndexTitleBar:(id)a4 selectedEntry:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v11 = [v12 _delegateActual];
  [v11 _collectionView:v10 horizontalIndexTitleBar:v9 selectedEntry:v8];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  id v11 = objc_msgSend(v10, "collectionView:contextMenuConfigurationForItemsAtIndexPaths:point:", v9, v8, x, y);

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  id v11 = [v10 collectionView:v9 contextMenuConfiguration:v8 highlightPreviewForItemAtIndexPath:v7];

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  id v11 = [v10 collectionView:v9 contextMenuConfiguration:v8 dismissalPreviewForItemAtIndexPath:v7];

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  id v11 = objc_msgSend(v10, "collectionView:contextMenuConfigurationForItemAtIndexPath:point:", v9, v8, x, y);

  return v11;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _delegateActual];
  id v8 = [v7 collectionView:v6 previewForHighlightingContextMenuWithConfiguration:v5];

  return v8;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _delegateActual];
  id v8 = [v7 collectionView:v6 previewForDismissingContextMenuWithConfiguration:v5];

  return v8;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  [v10 collectionView:v9 willPerformPreviewActionForMenuWithConfiguration:v8 animator:v7];
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  [v10 collectionView:v9 willDisplayContextMenuWithConfiguration:v8 animator:v7];
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  [v10 collectionView:v9 willEndContextMenuInteractionWithConfiguration:v8 animator:v7];
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v7)
  {
    id v8 = [v6 _delegateActual];
    char v9 = [v8 collectionView:v6 canPerformPrimaryActionForItemAtIndexPath:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v6)
  {
    id v7 = [v8 _delegateActual];
    [v7 collectionView:v8 performPrimaryActionForItemAtIndexPath:v6];
  }
}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  id v11 = objc_msgSend(v10, "collectionView:sceneActivationConfigurationForItemAtIndexPath:point:", v9, v8, x, y);

  return v11;
}

- (id)_collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 _delegateActual];
  id v11 = objc_msgSend(v10, "_collectionView:sceneActivationConfigurationForItemAtIndexPath:point:", v9, v8, x, y);

  return v11;
}

- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v5 _delegateActual];
  id v7 = [v6 _indexPathOfReferenceItemForLayoutTransitionInCollectionView:v4];

  return v7;
}

- (CGPoint)_collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v9 = [v8 _delegateActual];
  objc_msgSend(v9, "_collectionView:targetContentOffsetForProposedContentOffset:", v7, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  double v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v12 = [v11 _delegateActual];
  char v13 = objc_msgSend(v12, "_collectionView:shouldApplyTransitionContentOffset:contentSize:", v10, x, y, width, height);

  return v13;
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  id v10 = [v9 _delegateActual];
  [v10 _collectionView:v9 orthogonalScrollViewDidScroll:v8 section:a5];
}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v6];
    id v10 = [v8 _delegateActual];
    double v11 = [v10 _collectionView:v8 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:v6];

    id v8 = v10;
  }
  else
  {
    id v9 = [v7 _delegateActual];
    double v11 = [v9 _collectionView:v8 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:0];
  }

  return v11;
}

- (id)_collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  double v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v9];

  double v12 = 0;
  if (v10 && v11)
  {
    char v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v14 = [v13 _delegateActual];
    double v12 = [v14 _collectionView:v8 targetIndexPathForMoveFromItemAtIndexPath:v10 toProposedIndexPath:v11];
  }
  return v12;
}

- (id)_collectionView:(id)a3 styleForContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _delegateActual];
  id v8 = [v7 _collectionView:v6 styleForContextMenuWithConfiguration:v5];

  return v8;
}

- (id)_collectionView:(id)a3 accessoriesForContextMenuWithConfiguration:(id)a4 layoutAnchor:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 _delegateActual];
  long long v10 = *(_OWORD *)&a5->var2;
  v13[0] = *(_OWORD *)&a5->var0;
  v13[1] = v10;
  int64_t var4 = a5->var4;
  double v11 = [v9 _collectionView:v8 accessoriesForContextMenuWithConfiguration:v7 layoutAnchor:v13];

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  long long v10 = [v9 _delegateActual];
  double v11 = objc_msgSend(v10, "_dci_collectionView:contextMenuConfigurationForItemsAtIndexPaths:point:", v9, v8, x, y);

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForSelectedItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  long long v10 = [v9 _delegateActual];
  double v11 = objc_msgSend(v10, "_dci_collectionView:contextMenuConfigurationForSelectedItemsAtIndexPaths:point:", v9, v8, x, y);

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForHighlightingItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  long long v10 = [v9 _delegateActual];
  double v11 = objc_msgSend(v10, "_dci_collectionView:contextMenuConfiguration:previewForHighlightingItemAtIndexPath:", v9, v8, v7);

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForDismissingToItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  long long v10 = [v9 _delegateActual];
  double v11 = objc_msgSend(v10, "_dci_collectionView:contextMenuConfiguration:previewForDismissingToItemAtIndexPath:", v9, v8, v7);

  return v11;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(void *)(*((void *)&v17 + 1) + 8 * v13), (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  double v15 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  v16 = [v15 _prefetchDataSourceActual];
  [v16 collectionView:v6 prefetchItemsAtIndexPaths:v8];
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(void *)(*((void *)&v17 + 1) + 8 * v13), (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  double v15 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  v16 = [v15 _prefetchDataSourceActual];
  [v16 collectionView:v6 cancelPrefetchingForItemsAtIndexPaths:v8];
}

- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    id v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v10 = [v9 _dragSourceDelegateActual];
    uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v12 = [v10 _collectionView:v11 itemsForBeginningDragSession:v7 atIndexPath:v8];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a4;
  uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v11)
  {
    uint64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v13 = [v12 _dragSourceDelegateActual];
    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v15 = objc_msgSend(v13, "_collectionView:itemsForAddingToDragSession:atIndexPath:point:", v14, v10, v11, x, y);
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (void)_collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragSourceDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 _collectionView:v7 dragSessionWillBegin:v5];
}

- (void)_collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragSourceDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 _collectionView:v7 dragSessionDidEnd:v5];
}

- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragDestinationDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 _collectionView:v7 performDropWithCoordinator:v5];
}

- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDestinationDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 _collectionView:v8 canHandleDropSesson:v5];

  return v9;
}

- (void)_collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragDestinationDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 _collectionView:v7 dropSessionDidEnter:v5];
}

- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  char v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v10 = [v9 _dragDestinationDelegateActual];
  uint64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  uint64_t v12 = [v10 _collectionView:v11 dropSessionDidUpdate:v7 withDestinationIndexPath:v8];

  return v12;
}

- (void)_collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragDestinationDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 _collectionView:v7 dropSessionDidExit:v5];
}

- (void)_collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragDestinationDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 _collectionView:v7 dropSessionDidEnd:v5];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(_UICollectionViewShadowUpdatesController *)self _shouldPerformTranslationForDelegateBasedFlowLayoutSizing];
  id v10 = v8;
  id v11 = v10;
  if (!v9) {
    goto LABEL_3;
  }
  id v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v10];

  if (v11) {
    goto LABEL_3;
  }
  objc_msgSend(v7, "layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:", v10, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 size];
  double v23 = *MEMORY[0x1E4F1DB30];
  double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v24 != *MEMORY[0x1E4F1DB30] || v21 != v22)
  {
    [v11 size];
    double v16 = v26;
    double v18 = v27;
    goto LABEL_4;
  }

  long long v28 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
  v29 = [v28 initialSnapshot];
  uint64_t v30 = [v29 globalIndexForIndexPath:v10];

  if (v30 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = v10;
LABEL_3:
    uint64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v13 = [v12 _delegateActual];

    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v13 collectionView:v14 layout:v7 sizeForItemAtIndexPath:v11];
    double v16 = v15;
    double v18 = v17;

LABEL_4:
    goto LABEL_5;
  }
  [v7 _fallbackItemSize];
  double v16 = v31;
  double v18 = v32;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 itemSize];
    if (v33 != v23 || v34 != v22)
    {
      double v18 = v34;
      double v16 = v33;
    }
  }
LABEL_5:

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v13 = v8;
    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v15 = [v14 _delegateActual];

    double v16 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v15 collectionView:v16 layout:v7 insetForSectionAtIndex:v13];
    double v12 = v17;
    double v11 = v18;
    double v10 = v19;
    double v9 = v20;
  }
  double v21 = v12;
  double v22 = v11;
  double v23 = v10;
  double v24 = v9;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  double v9 = 0.0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = v8;
    double v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v12 = [v11 _delegateActual];

    int64_t v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v12 collectionView:v13 layout:v7 minimumLineSpacingForSectionAtIndex:v10];
    double v9 = v14;
  }
  return v9;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  double v9 = 0.0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = v8;
    double v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v12 = [v11 _delegateActual];

    int64_t v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v12 collectionView:v13 layout:v7 minimumInteritemSpacingForSectionAtIndex:v10];
    double v9 = v14;
  }
  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    int64_t v11 = v8;
    double v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v13 = [v12 _delegateActual];

    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v13 collectionView:v14 layout:v7 referenceSizeForHeaderInSection:v11];
    double v9 = v15;
    double v10 = v16;
  }
  double v17 = v9;
  double v18 = v10;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    int64_t v11 = v8;
    double v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v13 = [v12 _delegateActual];

    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v13 collectionView:v14 layout:v7 referenceSizeForFooterInSection:v11];
    double v9 = v15;
    double v10 = v16;
  }
  double v17 = v9;
  double v18 = v10;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (id)_collectionView:(id)a3 flowLayoutRowAlignmentOptionsForSection:(int64_t)a4
{
  int64_t v5 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    int64_t v7 = v5;
    int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v9 = [v8 _delegateActual];

    double v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v6 = [v9 _collectionView:v10 flowLayoutRowAlignmentOptionsForSection:v7];
  }
  return v6;
}

- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    int64_t v10 = v8;
    int64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v12 = [v11 _delegateActual];

    int64_t v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v9 = [v12 _collectionView:v13 layout:v7 flowLayoutRowAlignmentOptionsForSection:v10];
  }
  return v9;
}

- (id)_collectionView:(id)a3 layout:(id)a4 sizesForItemsInSection:(int64_t)a5
{
  id v7 = a4;
  int64_t v8 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    int64_t v10 = v8;
    int64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v12 = [v11 _delegateActual];

    int64_t v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v9 = [v12 _collectionView:v13 layout:v7 sizesForItemsInSection:v10];
  }
  return v9;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v8];
  if (v9)
  {
LABEL_2:
    int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v11 = [v10 _delegateActual];

    double v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v11 collectionView:v12 tableLayout:v7 heightForRowAtIndexPath:v9];
    double v14 = v13;

    goto LABEL_3;
  }
  [v7 rowHeight];
  double v14 = v16;
  BOOL v17 = fabs(v16) < 2.22044605e-16;
  double v18 = fabs(v16 + -1.79769313e308);
  if (v17 || v18 <= 2.22044605e-16)
  {
    double v20 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    double v21 = [v20 initialSnapshot];
    uint64_t v22 = [v21 globalIndexForIndexPath:v8];

    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v7 _defaultCellHeight];
      double v14 = v23;
      goto LABEL_3;
    }
    id v9 = v8;
    goto LABEL_2;
  }
LABEL_3:

  return v14;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v10)
  {
    int64_t v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v12 = [v11 _delegateActual];

    [v12 collectionView:v8 tableLayout:v9 estimatedHeightForRowAtIndexPath:v10];
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  double v11 = 0.0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = v10;
    double v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v14 = [v13 _delegateActual];

    [v14 collectionView:v8 tableLayout:v9 estimatedHeightForHeaderInSection:v12];
    double v11 = v15;
  }
  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForFooterInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  double v11 = 0.0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = v10;
    double v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v14 = [v13 _delegateActual];

    [v14 collectionView:v8 tableLayout:v9 estimatedHeightForFooterInSection:v12];
    double v11 = v15;
  }
  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  id v7 = a4;
  [v7 sectionHeaderHeight];
  double v9 = v8;
  int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = v10;
    int64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v13 = [v12 _delegateActual];

    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v13 collectionView:v14 tableLayout:v7 heightForHeaderInSection:v11];
    double v9 = v15;
  }
  return v9;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForFooterInSection:(int64_t)a5
{
  id v7 = a4;
  [v7 sectionFooterHeight];
  double v9 = v8;
  int64_t v10 = [(_UICollectionViewShadowUpdatesController *)self sectionIndexBeforeShadowUpdates:a5];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = v10;
    int64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v13 = [v12 _delegateActual];

    double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v13 collectionView:v14 tableLayout:v7 heightForFooterInSection:v11];
    double v9 = v15;
  }
  return v9;
}

- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _delegateActual];

  double v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v7 collectionView:v8 heightForHeaderViewInTableLayout:v5];
  double v10 = v9;

  return v10;
}

- (double)collectionView:(id)a3 heightForFooterViewInTableLayout:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _delegateActual];

  double v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v7 collectionView:v8 heightForFooterViewInTableLayout:v5];
  double v10 = v9;

  return v10;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 accessoryButtonTappedForRowWithIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v7)
  {
    double v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v9 = [v8 _delegateActual];

    double v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v9 collectionView:v10 tableLayout:v11 accessoryButtonTappedForRowWithIndexPath:v7];
  }
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 collectionView:v11 tableLayout:v7 editingStyleForRowAtIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 commitEditingStyle:(int64_t)a5 forRowAtIndexPath:(id)a6
{
  id v13 = a4;
  double v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a6];
  if (v9)
  {
    double v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v11 = [v10 _delegateActual];

    int64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v11 collectionView:v12 tableLayout:v13 commitEditingStyle:a5 forRowAtIndexPath:v9];
  }
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 collectionView:v11 tableLayout:v7 leadingSwipeActionsConfigurationForRowAtIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 collectionView:v11 tableLayout:v7 trailingSwipeActionsConfigurationForRowAtIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 tableLayout:(id)a4 shouldIndentWhileEditingRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v12 = [v10 collectionView:v11 tableLayout:v7 shouldIndentWhileEditingRowAtIndexPath:v8];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 willBeginEditingRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v7)
  {
    double v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v9 = [v8 _delegateActual];

    double v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v9 collectionView:v10 tableLayout:v11 willBeginEditingRowAtIndexPath:v7];
  }
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 didEndEditingRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v7)
  {
    double v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v9 = [v8 _delegateActual];

    double v10 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v9 collectionView:v10 tableLayout:v11 didEndEditingRowAtIndexPath:v7];
  }
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 indentationLevelForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 collectionView:v11 tableLayout:v7 indentationLevelForRowAtIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 leadingSwipeActionsForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 collectionView:v11 tableLayout:v7 leadingSwipeActionsForRowAtIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    double v10 = [v9 _delegateActual];

    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 collectionView:v11 tableLayout:v7 trailingSwipeActionsForRowAtIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  double v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  double v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v10 = [v9 _dragDelegateActual];
  id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  int64_t v12 = [v10 collectionView:v11 itemsForBeginningDragSession:v7 atIndexPath:v8];

  return v12;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a4;
  id v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  int64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v13 = [v12 _dragDelegateActual];
  double v14 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v15 = objc_msgSend(v13, "collectionView:itemsForAddingToDragSession:atIndexPath:point:", v14, v10, v11, x, y);

  return v15;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v5 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDelegateActual];
  double v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v9 = [v7 collectionView:v8 dragPreviewParametersForItemAtIndexPath:v5];

  return v9;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 collectionView:v7 dragSessionWillBegin:v5];
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dragDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 collectionView:v7 dragSessionDidEnd:v5];
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 collectionView:v8 dragSessionAllowsMoveOperation:v5];

  return v9;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 collectionView:v8 dragSessionIsRestrictedToDraggingApplication:v5];

  return v9;
}

- (BOOL)_collectionView:(id)a3 prefersFullSizePreviewsForDragSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 _collectionView:v8 prefersFullSizePreviewsForDragSession:v5];

  return v9;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    char v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v10 = [v9 _dragDelegateActual];
    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 _collectionView:v11 dataOwnerForDragSession:v7 atIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_collectionView:(id)a3 dragSessionSupportsSystemDrag:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 _collectionView:v8 dragSessionSupportsSystemDrag:v5];

  return v9;
}

- (id)_collectionView:(id)a3 dragSessionPropertiesForSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 _collectionView:v8 dragSessionPropertiesForSession:v5];

  return v9;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dropDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 collectionView:v7 performDropWithCoordinator:v5];
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dropDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 collectionView:v8 canHandleDropSession:v5];

  return v9;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dropDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 collectionView:v7 dropSessionDidEnter:v5];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v7];
  id v10 = (id)v9;
  if (v7 && !v9)
  {
    if ([(_UICollectionViewShadowUpdatesController *)self _shadowUpdatesAreSimpleInsertWithOptionalMoveSequenceForIndexPath:v7])
    {
      id v10 = v7;
    }
    else
    {
      id v10 = 0;
    }
  }
  id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  int64_t v12 = [v11 _dropDelegateActual];
  id v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v14 = [v12 collectionView:v13 dropSessionDidUpdate:v8 withDestinationIndexPath:v10];

  return v14;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dropDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 collectionView:v7 dropSessionDidExit:v5];
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v6 = [v8 _dropDelegateActual];
  id v7 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  [v6 collectionView:v7 dropSessionDidEnd:v5];
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  id v5 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v5)
  {
    id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v7 = [v6 _dropDelegateActual];
    id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v9 = [v7 collectionView:v8 dropPreviewParametersForItemAtIndexPath:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a5];
  if (v8)
  {
    uint64_t v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v10 = [v9 _dropDelegateActual];
    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    int64_t v12 = [v10 _collectionView:v11 dataOwnerForDropSession:v7 withDestinationIndexPath:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4
{
  id v5 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragSourceDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  uint64_t v9 = [v7 _collectionView:v8 liftingPreviewParametersForItemAtIndexPath:v5];

  return v9;
}

- (id)_collectionView:(id)a3 dragDestinationTargetIndexPathForProposedIndexPath:(id)a4 currentIndexPath:(id)a5 dropSession:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  int64_t v12 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:v10];

  id v13 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v14 = [v13 _dragDestinationDelegateActual];
  double v15 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  double v16 = [v14 _collectionView:v15 dragDestinationTargetIndexPathForProposedIndexPath:v11 currentIndexPath:v12 dropSession:v9];

  return v16;
}

- (BOOL)_collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v5 = a4;
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [v6 _dragDestinationDelegateActual];
  id v8 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  char v9 = [v7 _collectionView:v8 canHandleDropSesson:v5];

  return v9;
}

- (BOOL)_collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v8)
  {
    char v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v10 = [v9 _delegateActual];
    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v12 = [v10 _collectionView:v11 shouldSpringLoadItemAtIndexPath:v8 withContext:v7];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = [(_UICollectionViewShadowUpdatesController *)self indexPathBeforeShadowUpdates:a4];
  if (v8)
  {
    char v9 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    id v10 = [v9 _delegateActual];
    id v11 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    char v12 = [v10 collectionView:v11 shouldSpringLoadItemAtIndexPath:v8 withContext:v7];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldPerformTranslationForDelegateBasedFlowLayoutSizing
{
  return 1;
}

- (BOOL)_shadowUpdatesAreSimpleInsertWithOptionalMoveSequenceForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->__shadowUpdates count];
  shadowUpdates = self->__shadowUpdates;
  if (v5 == 1)
  {
    id v7 = [(NSMutableArray *)shadowUpdates objectAtIndexedSubscript:0];
    if ([v7 updateAction])
    {
      char v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    char v9 = -[UICollectionViewUpdateItem _indexPath](v7);
    char v8 = [v9 isEqual:v4];
LABEL_12:

    goto LABEL_13;
  }
  if ([(NSMutableArray *)shadowUpdates count] == 2)
  {
    id v7 = [(NSMutableArray *)self->__shadowUpdates objectAtIndexedSubscript:0];
    char v9 = [(NSMutableArray *)self->__shadowUpdates objectAtIndexedSubscript:1];
    if ([v7 updateAction] || objc_msgSend(v9, "updateAction") != 3)
    {
      char v8 = 0;
    }
    else
    {
      id v10 = -[UICollectionViewUpdateItem _indexPath](v7);
      id v11 = [v9 indexPathBeforeUpdate];
      if ([v10 isEqual:v11])
      {
        char v12 = [v9 indexPathAfterUpdate];
        char v8 = [v4 isEqual:v12];
      }
      else
      {
        char v8 = 0;
      }
    }
    goto LABEL_12;
  }
  char v8 = 0;
LABEL_14:

  return v8;
}

- (id)_rebasedShadowUpdatesForUpdate:(id)a3 initialSnapshot:(id)a4 shadowUpdates:(id)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v39 = v7;
  v47[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v38 = v8;
  id v11 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v8 orderedUpdateItems:v10];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v9;
  uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v40)
  {
    uint64_t v37 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      id v13 = v11;
      do
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        double v15 = [v14 indexPathBeforeUpdate];
        uint64_t v16 = [v13 finalIndexPathForInitialIndexPath:v15];

        BOOL v17 = [v14 indexPathAfterUpdate];
        uint64_t v18 = [v13 finalIndexPathForInitialIndexPath:v17];

        if ([v14 updateAction] != 3)
        {
          if ([v14 updateAction]) {
            BOOL v21 = 0;
          }
          else {
            BOOL v21 = v18 == 0;
          }
          if (v21)
          {
            uint64_t v18 = [v14 indexPathAfterUpdate];
          }
          goto LABEL_21;
        }
        if (!v16)
        {
          uint64_t v16 = [v14 indexPathBeforeUpdate];
        }
        if (v16) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          double v20 = [MEMORY[0x1E4F28B00] currentHandler];
          [v20 handleFailureInMethod:a2, self, @"_UICollectionViewShadowUpdatesController.m", 1303, @"Rebased moves cannot have either initial or final indexPaths == nil. updateItem(%@)", v14 object file lineNumber description];

LABEL_21:
          if (!(v16 | v18))
          {
            uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
            [v30 handleFailureInMethod:a2, self, @"_UICollectionViewShadowUpdatesController.m", 1311, @"Rebased updateItem cannot have both an initial+final indexPath == nil. Faulty updateItem is (%@)", v14 object file lineNumber description];

            uint64_t v16 = 0;
            uint64_t v18 = 0;
          }
        }
        uint64_t v22 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v16, v18, [v14 updateAction]);
        if (v14) {
          double v23 = (void *)v14[11];
        }
        else {
          double v23 = 0;
        }
        id v24 = v23;
        -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v22, v24);

        if ((-[UICollectionViewUpdateItem isNOOP]((uint64_t)v22) & 1) == 0) {
          [v35 addObject:v22];
        }
        long long v25 = [v13 updates];
        double v26 = [v25 arrayByAddingObject:v22];

        double v27 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v38 orderedUpdateItems:v26];
        long long v28 = [v27 finalSnapshot];
        v45 = v39;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
        id v11 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v28 orderedUpdateItems:v29];

        ++v12;
        id v13 = v11;
      }
      while (v40 != v12);
      uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      uint64_t v40 = v31;
    }
    while (v31);
  }

  return v35;
}

- (_UIDataSourceUpdateMap)updateMap
{
  updateMap = self->_updateMap;
  if (!updateMap)
  {
    id v4 = [(_UICollectionViewShadowUpdatesController *)self initialSnapshot];
    uint64_t v5 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
    id v6 = +[_UIDataSourceUpdateMap mapForInitialSnapshot:v4 orderedUpdateItems:v5];
    id v7 = self->_updateMap;
    self->_updateMap = v6;

    updateMap = self->_updateMap;
  }
  return updateMap;
}

- (void)_regenerateUpdateMap
{
  [(_UICollectionViewShadowUpdatesController *)self setUpdateMap:0];
  id v3 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
  [v3 _performAppendingInsertsFixups];
}

- (_UIDataSourceSnapshotter)initialSnapshot
{
  initialSnapshot = self->_initialSnapshot;
  if (!initialSnapshot)
  {
    id v4 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    uint64_t v5 = [off_1E52D5400 snapshotterForDataSourceBackedView:v4];
    id v6 = self->_initialSnapshot;
    self->_initialSnapshot = v5;

    initialSnapshot = self->_initialSnapshot;
  }
  return initialSnapshot;
}

- (id)_rebasedUpdateMapForUpdates:(id)a3
{
  id v5 = a3;
  if (!self->_updateMap || !self->_initialSnapshot)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
    [v11 handleFailureInMethod:a2, self, @"_UICollectionViewShadowUpdatesController.m", 1350, @"UICollectionView internal inconsistency: attempted to rebase shadow updates with a nil update map and/or initial snapshot. Collection view: %@", v12 object file lineNumber description];
  }
  id v6 = [(_UICollectionViewShadowUpdatesController *)self collectionView];
  id v7 = [off_1E52D5400 snapshotterForDataSourceBackedView:v6];

  id v8 = [(_UICollectionViewShadowUpdatesController *)self initialSnapshot];
  id v9 = +[_UIDataSourceUpdateMap validatedMapForInitialSnapshot:v8 finalSnapshot:v7 batchUpdateItems:v5];

  return v9;
}

- (id)_coalesceUpdatesIfPossible:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = (UICollectionViewUpdateItem *)v4;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    id v9 = 0;
    id v10 = v7;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v3);
      }
      id v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
      if (!v11 || v11[10] != 3) {
        break;
      }
      uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v9), "indexPathBeforeUpdate", (void)v16);
      id v13 = v12;
      if (v6)
      {
        int v14 = [v12 isEqual:v10];

        if (!v14) {
          break;
        }
      }
      else
      {
        id v6 = v12;
      }
      id v7 = [v11 indexPathAfterUpdate];

      id v9 = (UICollectionViewUpdateItem *)((char *)v9 + 1);
      id v10 = v7;
      if (v5 == v9)
      {
        id v5 = (UICollectionViewUpdateItem *)[v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          goto LABEL_3;
        }

        if (v6 && v7) {
          id v5 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v6 finalIndexPath:v7 updateAction:3];
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
    id v6 = 0;
    id v10 = 0;
  }

  id v5 = 0;
  id v7 = v10;
LABEL_19:

  return v5;
}

- (id)indexPathBeforeShadowUpdates:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->__shadowUpdates count])
  {
    id v5 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    id v6 = [v5 initialIndexPathForFinalIndexPath:v4];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)indexPathsBeforeShadowUpdates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->__shadowUpdates count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)indexPathsAfterShadowUpdates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->__shadowUpdates count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (int64_t)sectionIndexBeforeShadowUpdates:(int64_t)a3
{
  if ([(NSMutableArray *)self->__shadowUpdates count])
  {
    id v5 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
    a3 = [v5 initialSectionIndexForFinalSectionIndex:a3];
  }
  return a3;
}

- (int64_t)sectionIndexAfterShadowUpdates:(int64_t)a3
{
  return [(_UICollectionViewShadowUpdatesController *)self sectionIndexAfterShadowUpdates:a3 allowingAppendingInserts:0];
}

- (int64_t)sectionIndexAfterShadowUpdates:(int64_t)a3 allowingAppendingInserts:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSMutableArray *)self->__shadowUpdates count])
  {
    if (v4
      && ([(_UICollectionViewShadowUpdatesController *)self updateMap],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 initialSnapshot],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 numberOfSections],
          v8,
          v7,
          v9 == a3))
    {
      id v10 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
      id v11 = [v10 finalSnapshot];
      a3 = [v11 numberOfSections];
    }
    else
    {
      id v10 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
      a3 = [v10 finalSectionIndexForInitialSectionIndex:a3];
    }
  }
  return a3;
}

- (id)_indexPathsBeforeShadowUpdates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_supplementaryIndexPathBeforeShadowUpdates:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)_shadowUpdateReuseIdentifierForItemItemAtIndexPath:(id)a3
{
  return @"com.apple.UIKit.shadowReuseCellIdentifier";
}

- (id)_findShadowUpdateForIdentifier:(id)a3 inShadowUpdates:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__47;
  long long v17 = __Block_byref_object_dispose__47;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91___UICollectionViewShadowUpdatesController__findShadowUpdateForIdentifier_inShadowUpdates___block_invoke;
  v10[3] = &unk_1E52E3478;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_findInsertShadowUpdateForFinalIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__47;
  long long v16 = __Block_byref_object_dispose__47;
  id v17 = 0;
  id v5 = [(_UICollectionViewShadowUpdatesController *)self shadowUpdates];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85___UICollectionViewShadowUpdatesController__findInsertShadowUpdateForFinalIndexPath___block_invoke;
  v9[3] = &unk_1E52E67C0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_pruneAndRebaseShadowUpdatesForShadowInsertWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewShadowUpdatesController *)self updateMap];
  id v9 = [v5 updateMapByRevertingUpdateWithIdentifier:v4];

  id v6 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  [v6 removeAllObjects];

  id v7 = [(_UICollectionViewShadowUpdatesController *)self _shadowUpdates];
  id v8 = [v9 updates];
  [v7 addObjectsFromArray:v8];

  [(_UICollectionViewShadowUpdatesController *)self _regenerateUpdateMap];
}

- (void)setCollectionView:(id)a3
{
}

- (void)set_shadowUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shadowUpdates, 0);
  objc_storeStrong((id *)&self->_updateMap, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end