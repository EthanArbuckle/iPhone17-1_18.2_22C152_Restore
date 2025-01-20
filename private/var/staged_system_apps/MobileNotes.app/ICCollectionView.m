@interface ICCollectionView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canFocusItemAtIndexPath:(id)a3;
- (BOOL)isCellDraggableForIdentifier:(id)a3;
- (BOOL)isCellReorderableForIdentifier:(id)a3;
- (BOOL)sourceObjectIDsContainsSystemPaperNotes:(id)a3;
- (CGRect)presentationSourceRectForCell:(id)a3;
- (ICCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6;
- (ICDragSessionContext)currentDragSessionContext;
- (ICImportArchiveActivity)importArchiveActivity;
- (ICLockNoteActivity)lockNoteActivity;
- (ICMoveDecisionController)moveDecisionController;
- (ICNAViewController)presentingViewController;
- (ICRenameFolderActivity)renameFolderActivity;
- (ICViewControllerManager)viewControllerManager;
- (NSManagedObjectContext)legacyManagedObjectContext;
- (NSManagedObjectContext)modernManagedObjectContext;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)cellForItemIdentifier:(id)a3;
- (id)collaborationAccessibilityLabelForCloudSyncingObject:(id)a3;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)commonAccessibilityActionsForFolder:(id)a3;
- (id)commonAcessibilityActionsForNoteWithObjectID:(id)a3;
- (id)contextMenuConfigurationForIndexPath:(id)a3;
- (id)contextMenuConfigurationForItemsAtIndexPaths:(id)a3;
- (id)contextMenuForFolder:(id)a3 sourceView:(id)a4;
- (id)contextMenuForInvitation:(id)a3 sourceView:(id)a4;
- (id)contextMenuForLegacyNote:(id)a3 sourceView:(id)a4;
- (id)contextMenuForModernNote:(id)a3 sourceView:(id)a4;
- (id)contextMenuPreviewForDismissingContextMenuWithConfiguration:(id)a3 indexPath:(id)a4;
- (id)contextMenuPreviewForHighlightingMenuWithConfiguration:(id)a3 indexPath:(id)a4;
- (id)contextMenuPreviewWithConfiguration:(id)a3 indexPath:(id)a4;
- (id)contextMenuWithCenterWindowWithAppURL:(id)a3 actions:(id)a4;
- (id)createLayout;
- (id)customAccessibilityActionsForObjectID:(id)a3 galleryView:(BOOL)a4;
- (id)deleteFolderAccessibilityLabel;
- (id)deleteNoteAccessibilityLabel;
- (id)dragItemsForIndexPath:(id)a3 sessionContext:(id)a4;
- (id)firstUnselectedIndexPathWithFrame:(CGRect)a3 arrowDirection:(unint64_t)a4;
- (id)galleryViewAcessibilityActionsForFolder:(id)a3;
- (id)galleryViewAcessibilityActionsForNote:(id)a3;
- (id)interactionSourceViewForObjectID:(id)a3;
- (id)leadingSwipeActionsConfigurationForModernNote:(id)a3 inCell:(id)a4;
- (id)leadingSwipeActionsConfigurationProvider;
- (id)lockOrUnlockAccessibilityLabelForNoteIsLocked:(BOOL)a3;
- (id)movableNoteObjectIDsIn:(id)a3 forDropIntoSection:(id)a4;
- (id)moveFolderAccessibilityLabel;
- (id)moveNoteAccessibilityLabel;
- (id)multiSelectionContextMenuPreviewForHighlightingItemAtIndexPath:(id)a3;
- (id)optimisticallyAppliedSnapshotHandler;
- (id)pinOrUnpinAccessibilityAnnouncementForNoteIsPinned:(BOOL)a3 noteTitle:(id)a4;
- (id)pinOrUnpinAccessibilityLabelForNoteIsPinned:(BOOL)a3;
- (id)previewParametersWithCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)removeInvitationAccessibilityLabel;
- (id)renameFolderAccessibilityLabel;
- (id)replyToInvitationAccessibilityLabel;
- (id)sendNoteCopyAccessibilityLabel;
- (id)showFolderActivityAccessibilityLabel;
- (id)sourceObjectIDsForDragSession:(id)a3;
- (id)trailingSwipeActionsConfigurationForInvitation:(id)a3 inCell:(id)a4;
- (id)trailingSwipeActionsConfigurationForLegacyNote:(id)a3 inCell:(id)a4;
- (id)trailingSwipeActionsConfigurationForModernFolder:(id)a3 inCell:(id)a4;
- (id)trailingSwipeActionsConfigurationForModernNote:(id)a3 inCell:(id)a4;
- (id)trailingSwipeActionsConfigurationProvider;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)dataOwnerForIndexPath:(id)a3;
- (unint64_t)actualChildIndexForSnapshotIndex:(unint64_t)a3 inDestinationObjectID:(id)a4 sectionSnapshot:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)contextMenuWillPerformPreviewActionForMenuWithConfiguration:(id)a3 animator:(id)a4;
- (void)performCollaborationActionWithFolder:(id)a3 forceShareSheet:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (void)performCollaborationActionWithNote:(id)a3 forceShareSheet:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (void)performDeleteActionWithObjects:(id)a3 completion:(id)a4;
- (void)performDropOfFolderObjectIDs:(id)a3 atFolderObjectID:(id)a4 atIndex:(unint64_t)a5;
- (void)performEditSmartFolderActionWithFolder:(id)a3;
- (void)performExportArchiveActionWithObjects:(id)a3 fromSourceView:(id)a4;
- (void)performImportArchiveActionWithNoteContainer:(id)a3 fromSourceView:(id)a4;
- (void)performLockActionWithNote:(id)a3;
- (void)performMoveActionWithFolder:(id)a3 completion:(id)a4;
- (void)performMoveActionWithNotes:(id)a3 completion:(id)a4;
- (void)performPinActionWithNote:(id)a3;
- (void)performPinActionWithNotes:(id)a3;
- (void)performRemoveActionWithInvitation:(id)a3;
- (void)performRenameActionWithFolder:(id)a3;
- (void)performReplyActionWithInvitation:(id)a3;
- (void)performSendActionWithNote:(id)a3 fromSourceView:(id)a4;
- (void)performShowActivityStreamActionWithFolder:(id)a3;
- (void)reExpandFolderWithObjectID:(id)a3;
- (void)reloadCellAfterDelayForObjectID:(id)a3;
- (void)setCurrentDragSessionContext:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setImportArchiveActivity:(id)a3;
- (void)setLockNoteActivity:(id)a3;
- (void)setMoveDecisionController:(id)a3;
- (void)setOptimisticallyAppliedSnapshotHandler:(id)a3;
- (void)setRenameFolderActivity:(id)a3;
- (void)synchronouslyRemoveItemsWithIdentifiers:(id)a3;
@end

@implementation ICCollectionView

- (void)setDiffableDataSource:(id)a3
{
  id v5 = a3;
  p_diffableDataSource = &self->_diffableDataSource;
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C7CF8;
  v11[3] = &unk_100628DD0;
  objc_copyWeak(&v12, &location);
  v7 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource reorderingHandlers];
  [v7 setCanReorderItemHandler:v11];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C7D4C;
  v9[3] = &unk_100628E38;
  objc_copyWeak(&v10, &location);
  v8 = [(UICollectionViewDiffableDataSource *)*p_diffableDataSource reorderingHandlers];
  [v8 setDidReorderHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (ICCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(ICCollectionView *)self createLayout];
  v18.receiver = self;
  v18.super_class = (Class)ICCollectionView;
  v15 = -[ICCollectionView initWithFrame:collectionViewLayout:](&v18, "initWithFrame:collectionViewLayout:", v14, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  if (v15)
  {
    objc_storeWeak((id *)&v15->_presentingViewController, v10);
    objc_storeStrong((id *)&v15->_legacyManagedObjectContext, a4);
    objc_storeStrong((id *)&v15->_modernManagedObjectContext, a5);
    objc_storeWeak((id *)&v15->_viewControllerManager, v13);
    [(ICCollectionView *)v15 setAlwaysBounceVertical:1];
    v16 = +[UIColor ICGroupedBackgroundColor];
    [(ICCollectionView *)v15 setBackgroundColor:v16];

    [(ICCollectionView *)v15 setShowsHorizontalScrollIndicator:0];
    [(ICCollectionView *)v15 setDragInteractionEnabled:1];
    [(ICCollectionView *)v15 setDragDelegate:v15];
    [(ICCollectionView *)v15 setDropDelegate:v15];
    [(ICCollectionView *)v15 setAllowsFocus:1];
  }

  return v15;
}

- (void)setOptimisticallyAppliedSnapshotHandler:(id)a3
{
}

- (id)createLayout
{
  id v2 = objc_alloc_init((Class)UICollectionViewFlowLayout);

  return v2;
}

- (BOOL)canFocusItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollectionView *)self cellForItemAtIndexPath:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(ICCollectionView *)self diffableDataSource];
      v8 = [(id)v7 itemIdentifierForIndexPath:v4];

      objc_opt_class();
      LOBYTE(v7) = objc_opt_isKindOfClass();

      if ((v7 & 1) == 0)
      {
LABEL_5:
        unsigned __int8 v6 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_5;
      }
    }
    v9 = [v5 accessories];
    unsigned __int8 v6 = [v9 ic_containsObjectPassingTest:&stru_100628E78];

    goto LABEL_8;
  }
  unsigned __int8 v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return [(ICCollectionView *)self previewParametersWithCollectionView:a3 atIndexPath:a4];
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [ICDragSessionContext alloc];
  id v10 = [(ICCollectionView *)self modernManagedObjectContext];
  id v11 = [(ICCollectionView *)self legacyManagedObjectContext];
  id v12 = [(ICDragSessionContext *)v9 initWithModernManagedObjectContext:v10 legacyManagedObjectContext:v11];

  [v8 setLocalContext:v12];
  [(ICCollectionView *)self setCurrentDragSessionContext:v12];
  id v13 = [(ICCollectionView *)self dragItemsForIndexPath:v7 sessionContext:v12];

  return v13;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  v21 = v5;
  unsigned __int8 v6 = [v5 localContext];
  id v7 = ICDynamicCast();

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [v7 currentSourceObjectIDs];
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v13, "ic_isEntityOfClass:", objc_opt_class()))
        {
          v14 = [(ICCollectionView *)self diffableDataSource];
          v15 = [v14 snapshot];
          v16 = [v15 sectionIdentifierForSectionContainingItemIdentifier:v13];

          v17 = [(ICCollectionView *)self diffableDataSource];
          objc_super v18 = [v17 snapshotForSection:v16];

          if ([v18 isExpanded:v13])
          {
            v26 = v13;
            v19 = +[NSArray arrayWithObjects:&v26 count:1];
            [v18 collapseItems:v19];

            v20 = [(ICCollectionView *)self diffableDataSource];
            [v20 applySnapshot:v18 toSection:v16 animatingDifferences:1];

            [v7 setAutoCollapsedFolderObjectID:v13];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8 = a5;
  id v9 = a4;
  objc_opt_class();
  id v10 = [v9 localContext];

  uint64_t v11 = ICDynamicCast();
  id v12 = [(ICCollectionView *)self dragItemsForIndexPath:v8 sessionContext:v11];

  return v12;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  unsigned __int8 v6 = [v5 localContext];

  ICDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 updateDropTargetCellsForPinNoteDrop:0];
  id v7 = [v9 autoCollapsedFolderObjectID];

  if (v7)
  {
    id v8 = [v9 autoCollapsedFolderObjectID];
    [(ICCollectionView *)self reExpandFolderWithObjectID:v8];
  }
  [(ICCollectionView *)self setCurrentDragSessionContext:0];
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[ICCollectionView dataOwnerForIndexPath:](self, "dataOwnerForIndexPath:", a5, a4);
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return -[ICCollectionView dataOwnerForIndexPath:](self, "dataOwnerForIndexPath:", a5, a4);
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return [(ICCollectionView *)self previewParametersWithCollectionView:a3 atIndexPath:a4];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  objc_opt_class();
  uint64_t v11 = [v8 localDragSession];
  id v12 = [v11 localContext];
  id v13 = ICDynamicCast();

  [v13 updateDropTargetCellsForPinNoteDrop:0];
  v14 = [v13 currentSourceObjectIDs];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000C8F44;
  v61[3] = &unk_100628EA0;
  v61[4] = self;
  v58 = [v14 ic_compactMap:v61];

  v15 = [(ICCollectionView *)self diffableDataSource];
  v16 = [v15 itemIdentifierForIndexPath:v9];

  objc_opt_class();
  v17 = ICDynamicCast();
  v56 = v16;
  if (objc_msgSend(v17, "ic_isModernType"))
  {
    objc_super v18 = [(ICCollectionView *)self modernManagedObjectContext];
LABEL_5:
    v19 = v18;
    id v20 = [v18 objectWithID:v17];

    goto LABEL_7;
  }
  if (objc_msgSend(v17, "ic_isLegacyType"))
  {
    objc_super v18 = [(ICCollectionView *)self legacyManagedObjectContext];
    goto LABEL_5;
  }
  id v20 = v16;
LABEL_7:
  objc_opt_class();
  v21 = ICDynamicCast();
  objc_opt_class();
  *((void *)&v59 + 1) = ICDynamicCast();
  objc_opt_class();
  v57 = ICDynamicCast();
  objc_opt_class();
  *(void *)&long long v59 = ICDynamicCast();
  long long v22 = [v21 parentCloudObject];
  long long v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = [v21 cloudAccount];
  }
  v55 = v24;

  long long v25 = [v10 cellForItemAtIndexPath:v9];

  if (!v20 || !v25)
  {
    id v30 = objc_alloc((Class)UICollectionViewDropProposal);
    uint64_t v31 = 1;
    uint64_t v32 = 0;
    goto LABEL_52;
  }
  if ([v13 dragSessionType] == (id)1)
  {
    id v54 = v8;
    if (v59 != 0)
    {
LABEL_14:
      id v26 = [objc_alloc((Class)ICMoveDecision) initWithSourceObjects:v58 destination:v20];
      unsigned int v27 = [v26 shouldMove];
      if (v27) {
        uint64_t v28 = 3;
      }
      else {
        uint64_t v28 = 1;
      }
      if (v27) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = 0;
      }

LABEL_30:
      id v8 = v54;
      if (v28 == 1 || !v29) {
        goto LABEL_51;
      }
      if (v59 == 0)
      {
        if (!v57)
        {
          uint64_t v29 = 2;
          goto LABEL_51;
        }
        v40 = [(ICCollectionView *)self diffableDataSource];
        v41 = [v40 snapshot];

        v53 = v41;
        v52 = [v41 sectionIdentifierForSectionContainingItemIdentifier:v56];
        v42 = [v13 currentSourceObjectIDs];
        v43 = [(ICCollectionView *)self movableNoteObjectIDsIn:v42 forDropIntoSection:v52];

        if ([v43 count])
        {
          v44 = [v53 itemIdentifiersInSectionWithIdentifier:v52];
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_1000C8FC0;
          v60[3] = &unk_100628EC8;
          v60[4] = self;
          v45 = [v44 ic_compactMap:v60];
          [v13 setCurrentDropTargetCells:v45];

          [v13 setCurrentDropTargetItemIDs:v44];
          [v13 updateDropTargetCellsForPinNoteDrop:1];
        }
        uint64_t v29 = 2;
        id v36 = v53;
        id v8 = v54;
      }
      else
      {
        v63 = v25;
        v35 = +[NSArray arrayWithObjects:&v63 count:1];
        [v13 setCurrentDropTargetCells:v35];

        v62 = v56;
        id v36 = +[NSArray arrayWithObjects:&v62 count:1];
        [v13 setCurrentDropTargetItemIDs:v36];
        uint64_t v29 = 2;
      }
      goto LABEL_50;
    }
    if (v57)
    {
      uint64_t v29 = 2;
      uint64_t v28 = 3;
      goto LABEL_30;
    }
    goto LABEL_34;
  }
  uint64_t v29 = 0;
  uint64_t v28 = 1;
  if ([v13 dragSessionType] != (id)2 || !*((void *)&v59 + 1)) {
    goto LABEL_51;
  }
  if (([*((id *)&v59 + 1) isSystemFolder] & 1) == 0)
  {
    id v54 = v8;
    [v8 locationInView:v25];
    double v38 = v37;
    if (v37 <= 0.0 || v37 >= 16.0)
    {
      [v25 frame];
      BOOL v39 = v38 <= v46 + -16.0;
    }
    else
    {
      BOOL v39 = 0;
    }
    v47 = [v13 currentSourceObjectIDs];
    unsigned __int8 v48 = [v47 containsObject:v17];

    if (!v39 && (v48 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
  if (![*((id *)&v59 + 1) isDefaultFolderForAccount])
  {
    uint64_t v29 = 0;
    uint64_t v28 = 1;
    goto LABEL_51;
  }
  id v54 = v8;
  v33 = [*((id *)&v59 + 1) account];
  id v34 = [v33 visibleCustomFoldersCount];

  if (!v34)
  {
LABEL_46:
    id v36 = [objc_alloc((Class)ICMoveDecision) initWithSourceObjects:v58 destination:v55];
    unsigned int v49 = [v36 shouldMove];
    if (v49) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = 1;
    }
    uint64_t v29 = v49;
    id v8 = v54;
LABEL_50:

    goto LABEL_51;
  }
LABEL_34:
  uint64_t v29 = 0;
  uint64_t v28 = 1;
  id v8 = v54;
LABEL_51:
  id v30 = objc_alloc((Class)UICollectionViewDropProposal);
  uint64_t v31 = v28;
  uint64_t v32 = v29;
LABEL_52:
  id v50 = [v30 initWithDropOperation:v31 intent:v32];

  return v50;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  unsigned __int8 v6 = [v5 session];
  id v7 = [v6 localDragSession];
  id v8 = [v7 localContext];
  id v9 = ICDynamicCast();

  id v10 = [v5 proposal];
  id v11 = [v10 operation];

  if (v11 == (id)3)
  {
    v82 = v9;
    id v12 = [v5 session];
    id v13 = [v12 localDragSession];
    v84 = self;
    v14 = [(ICCollectionView *)self sourceObjectIDsForDragSession:v13];

    v83 = [v5 destinationIndexPath];
    v15 = +[NSMutableArray array];
    v16 = +[NSMutableArray array];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v17 = v14;
    id v18 = [v17 countByEnumeratingWithState:&v89 objects:v93 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v90;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v90 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          unsigned __int8 v23 = [v22 ic_isEntityOfClass:[objc_opt_class()]];
          id v24 = v15;
          if ((v23 & 1) == 0)
          {
            unsigned int v25 = [v22 ic_isEntityOfClass:objc_opt_class()];
            id v24 = v16;
            if (!v25) {
              continue;
            }
          }
          [v24 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v89 objects:v93 count:16];
      }
      while (v19);
    }

    id v26 = [(ICCollectionView *)v84 diffableDataSource];
    unsigned int v27 = v83;
    uint64_t v28 = [v26 itemIdentifierForIndexPath:v83];

    objc_opt_class();
    uint64_t v29 = ICDynamicCast();
    objc_opt_class();
    id v30 = ICDynamicCast();
    if ([v15 count] && objc_msgSend(v16, "count"))
    {
      id v9 = v82;
LABEL_50:

      goto LABEL_51;
    }
    id v9 = v82;
    if (![v15 count] && !objc_msgSend(v16, "count")
      || (objc_msgSend(v29, "ic_isModernFolderType") & 1) == 0
      && (objc_msgSend(v29, "ic_isModernNoteType") & 1) == 0
      && !v30)
    {
      goto LABEL_50;
    }
    if ([v16 count])
    {
      if (!objc_msgSend(v29, "ic_isModernFolderType")) {
        goto LABEL_50;
      }
      v80 = v30;
      uint64_t v31 = [v5 proposal];
      id v32 = [v31 intent];

      if (v32 == (id)2)
      {
        v33 = [v82 currentDropTargetItemIDs];
        id v34 = [v33 count];

        if (v34 == (id)1)
        {
          objc_opt_class();
          v35 = [v82 currentDropTargetItemIDs];
          id v36 = [v35 firstObject];
          uint64_t v37 = ICDynamicCast();

          uint64_t v29 = (void *)v37;
        }
        double v38 = [v82 autoCollapsedFolderObjectID];
        unsigned int v39 = [v16 containsObject:v38];

        if (v39) {
          [v82 setAutoCollapsedFolderObjectID:0];
        }
        [(ICCollectionView *)v84 performDropOfFolderObjectIDs:v16 atFolderObjectID:v29 atIndex:0];
        goto LABEL_49;
      }
      unsigned __int8 v48 = [(ICCollectionView *)v84 modernManagedObjectContext];
      unsigned int v49 = [v48 objectWithID:v29];

      id v50 = [v49 parent];
      v51 = v50;
      if (v50)
      {
        id v52 = v50;
      }
      else
      {
        id v52 = [v49 account];
      }
      v76 = v52;

      v77 = [(ICCollectionView *)v84 diffableDataSource];
      long long v59 = [v77 snapshot];
      v78 = v49;
      v60 = [v49 objectID];
      uint64_t v61 = [v59 sectionIdentifierForSectionContainingItemIdentifier:v60];

      v62 = [(ICCollectionView *)v84 diffableDataSource];
      v75 = (void *)v61;
      v63 = [v62 snapshotForSection:v61];

      uint64_t v64 = [v63 parentOfChild:v29];
      v74 = (void *)v64;
      if ([v63 containsItem:v64])
      {
        v65 = [v63 childrenOfParent:v64];
      }
      else
      {
        v65 = &__NSArray0__struct;
      }
      v73 = v65;
      v66 = [v78 objectID];
      id v67 = [v65 indexOfObject:v66];

      if (v67 == (id)0x7FFFFFFFFFFFFFFFLL) {
        id v68 = 0;
      }
      else {
        id v68 = v67;
      }
      id v71 = v68;
      v69 = [v76 objectID];
      id v72 = [(ICCollectionView *)v84 actualChildIndexForSnapshotIndex:v71 inDestinationObjectID:v69 sectionSnapshot:v63];

      v70 = [v76 objectID];
      [(ICCollectionView *)v84 performDropOfFolderObjectIDs:v16 atFolderObjectID:v70 atIndex:v72];
    }
    else
    {
      if (![v15 count]) {
        goto LABEL_50;
      }
      if (!objc_msgSend(v29, "ic_isModernNoteType"))
      {
        if ((objc_msgSend(v29, "ic_isFolderType") & 1) != 0 || v30)
        {
          v81 = v30;
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_1000C9A04;
          v85[3] = &unk_100628F10;
          v85[4] = v84;
          uint64_t v53 = [v15 ic_map:v85];
          id v54 = [ICMoveDecisionController alloc];
          v55 = [(ICCollectionView *)v84 presentingViewController];
          v79 = (void *)v53;
          v56 = [(ICMoveDecisionController *)v54 initWithSourceObjects:v53 presentingViewController:v55];

          if (v29)
          {
            v57 = [(ICCollectionView *)v84 modernManagedObjectContext];
            v58 = [v57 objectWithID:v29];
            [(ICMoveDecisionController *)v56 setDestination:v58];

            id v9 = v82;
            unsigned int v27 = v83;
            id v30 = v81;
          }
          else
          {
            id v30 = v81;
            [(ICMoveDecisionController *)v56 setDestination:v81];
            unsigned int v27 = v83;
          }
          [(ICMoveDecisionController *)v56 performDecisionWithCompletion:0];
        }
        goto LABEL_50;
      }
      v80 = v30;
      v40 = [(ICCollectionView *)v84 diffableDataSource];
      v41 = [v40 snapshot];

      v42 = [v41 sectionIdentifiers];
      uint64_t v43 = [v42 objectAtIndexedSubscript:[v83 section]];

      v78 = v41;
      v44 = v41;
      v45 = (void *)v43;
      double v46 = [v44 sectionIdentifiers];
      LODWORD(v43) = [v46 ic_containsObjectPassingTest:&stru_100628EE8];

      if (v43)
      {
        v47 = [(ICCollectionView *)v84 modernManagedObjectContext];
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_1000C9884;
        v86[3] = &unk_100625A00;
        v86[4] = v84;
        id v87 = v17;
        id v88 = v45;
        [v47 performBlockAndWait:v86];
      }
    }

LABEL_49:
    unsigned int v27 = v83;
    id v30 = v80;
    goto LABEL_50;
  }
LABEL_51:
}

- (id)customAccessibilityActionsForObjectID:(id)a3 galleryView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSArray array];
  if (objc_msgSend(v6, "ic_isModernFolderType"))
  {
    id v8 = [(ICCollectionView *)self modernManagedObjectContext];
    id v9 = [v8 objectWithID:v6];

    if (v4) {
      [(ICCollectionView *)self galleryViewAcessibilityActionsForFolder:v9];
    }
    else {
    uint64_t v10 = [(ICCollectionView *)self commonAccessibilityActionsForFolder:v9];
    }
  }
  else
  {
    if (!objc_msgSend(v6, "ic_isNoteType")) {
      goto LABEL_13;
    }
    if (!v4 || !objc_msgSend(v6, "ic_isModernNoteType"))
    {
      [(ICCollectionView *)self commonAcessibilityActionsForNoteWithObjectID:v6];
      id v7 = v9 = v7;
      goto LABEL_12;
    }
    id v11 = [(ICCollectionView *)self modernManagedObjectContext];
    id v9 = [v11 objectWithID:v6];

    uint64_t v10 = [(ICCollectionView *)self galleryViewAcessibilityActionsForNote:v9];
  }
  id v12 = (void *)v10;

  id v7 = v12;
LABEL_12:

LABEL_13:

  return v7;
}

- (id)contextMenuConfigurationForItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v6 = 0;
    goto LABEL_35;
  }
  if ([v4 count] != (id)1)
  {
    int v7 = [v4 count] != 0;
    int v8 = [v4 count] != 0;
    int v9 = [v4 count] != 0;
    char v10 = [v4 count] != 0;
    uint64_t v28 = +[NSMutableArray array];
    +[NSMutableArray array];
    v27 = id v26 = v4;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v4;
    id v11 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (!v11)
    {
      uint64_t v31 = 0;
      uint64_t v32 = 0;
LABEL_27:

      if (v9 & 1) != 0 || (v8 & 1) != 0 || (v7 & 1) != 0 || (v10)
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000CA034;
        v33[3] = &unk_100628FC0;
        char v40 = v10 & 1;
        id v24 = v27;
        id v34 = v27;
        v35 = self;
        uint64_t v38 = v31;
        uint64_t v39 = v32;
        char v41 = v7 & 1;
        id v36 = obj;
        id v5 = v28;
        id v37 = v28;
        char v42 = v8 & 1;
        char v43 = v9 & 1;
        id v6 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:&stru_100628F50 actionProvider:v33];

        id v4 = v26;
      }
      else
      {
        id v6 = 0;
        id v4 = v26;
        id v24 = v27;
        id v5 = v28;
      }

      goto LABEL_34;
    }
    id v12 = v11;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v30 = *(void *)v45;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v45 != v30) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * v13);
      v15 = [(ICCollectionView *)self diffableDataSource];
      v16 = [v15 itemIdentifierForIndexPath:v14];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = [v16 object];
          id v17 = [v18 objectID];
        }
        else
        {
          id v17 = 0;
        }
      }
      if (objc_msgSend(v17, "ic_isNoteType")) {
        break;
      }
      if (objc_msgSend(v17, "ic_isInvitationType"))
      {
        [(ICCollectionView *)self modernManagedObjectContext];
        uint64_t v20 = v19 = v10;
        v21 = [v20 objectWithID:v17];

        long long v22 = [v21 highlight];
        char v10 = v19 & (v22 != 0);

        [v27 ic_addNonNilObject:v21];
        int v9 = 0;
        int v8 = 0;
        int v7 = 0;
LABEL_22:
      }
      if (v12 == (id)++v13)
      {
        id v12 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (!v12) {
          goto LABEL_27;
        }
        goto LABEL_7;
      }
    }
    if (objc_msgSend(v17, "ic_isModernNoteType")) {
      [(ICCollectionView *)self modernManagedObjectContext];
    }
    else {
    unsigned __int8 v23 = [(ICCollectionView *)self legacyManagedObjectContext];
    }
    v21 = [v23 objectWithID:v17];

    v7 &= [v21 isPinnable];
    v8 &= [v21 isMovable];
    v9 &= [v21 isDeletable];
    v31 += [v21 isPinned];
    ++v32;
    [v28 ic_addNonNilObject:v21];
    char v10 = 0;
    goto LABEL_22;
  }
  id v5 = [v4 firstObject];
  id v6 = [(ICCollectionView *)self contextMenuConfigurationForIndexPath:v5];
LABEL_34:

LABEL_35:

  return v6;
}

- (id)contextMenuConfigurationForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollectionView *)self diffableDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  int v7 = [(ICCollectionView *)self cellForItemIdentifier:v6];
  int v8 = ICProtocolCast();
  uint64_t v9 = [v8 contextMenuInteractionPreview];
  char v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v7;
  }
  id v12 = v11;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v6;
    if (!v13) {
      goto LABEL_26;
    }
LABEL_9:
    if (objc_msgSend(v13, "ic_isAttachmentType"))
    {
      v15 = [(ICCollectionView *)self modernManagedObjectContext];
      v16 = [v15 objectWithID:v13];

      id v17 = [v16 note];
      uint64_t v18 = [v17 objectID];

      id v13 = (id)v18;
    }
    if (objc_msgSend(v13, "ic_isInvitationType"))
    {
      id v19 = [(ICCollectionView *)self modernManagedObjectContext];
      uint64_t v20 = [v19 objectWithID:v13];
      v21 = 0;
      long long v22 = 0;
      unsigned __int8 v23 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v13, "ic_isModernFolderType"))
    {
      id v24 = [(ICCollectionView *)self modernManagedObjectContext];
      id v19 = [v24 objectWithID:v13];

      if ([v19 isModernCustomFolder])
      {
        id v19 = v19;
        v21 = 0;
        long long v22 = 0;
        uint64_t v20 = 0;
        unsigned __int8 v23 = v19;
        goto LABEL_24;
      }
      v21 = 0;
      goto LABEL_22;
    }
    if (objc_msgSend(v13, "ic_isModernNoteType"))
    {
      id v19 = [(ICCollectionView *)self modernManagedObjectContext];
      long long v22 = [v19 objectWithID:v13];
      v21 = 0;
LABEL_23:
      unsigned __int8 v23 = 0;
      uint64_t v20 = 0;
LABEL_24:

      if (v20) {
        goto LABEL_31;
      }
      goto LABEL_28;
    }
    if (objc_msgSend(v13, "ic_isLegacyNoteType"))
    {
      id v19 = [(ICCollectionView *)self legacyManagedObjectContext];
      v21 = [v19 objectWithID:v13];
LABEL_22:
      long long v22 = 0;
      goto LABEL_23;
    }
LABEL_26:
    v21 = 0;
    long long v22 = 0;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v6 object];
    id v13 = [v14 objectID];

    if (!v13) {
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  v21 = 0;
  long long v22 = 0;
  id v13 = 0;
LABEL_27:
  unsigned __int8 v23 = 0;
  uint64_t v20 = 0;
LABEL_28:
  if (!v23 && !v22 && !v21) {
    goto LABEL_32;
  }
LABEL_31:
  if ([v23 isUnsupported])
  {
LABEL_32:
    unsigned int v25 = 0;
    goto LABEL_34;
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000CAA4C;
  v39[3] = &unk_100628FE8;
  id v40 = v20;
  id v41 = v23;
  id v42 = v22;
  id v26 = v21;
  uint64_t v31 = v21;
  unsigned int v27 = v6;
  uint64_t v28 = self;
  id v29 = v26;
  id v43 = v26;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000CAAF8;
  v32[3] = &unk_100629010;
  id v33 = v40;
  id v34 = v28;
  id v6 = v27;
  v21 = v31;
  id v35 = v12;
  id v36 = v41;
  id v37 = v42;
  id v38 = v29;
  unsigned int v25 = +[UIContextMenuConfiguration configurationWithIdentifier:v6 previewProvider:v39 actionProvider:v32];

LABEL_34:

  return v25;
}

- (id)contextMenuPreviewForHighlightingMenuWithConfiguration:(id)a3 indexPath:(id)a4
{
  return [(ICCollectionView *)self contextMenuPreviewWithConfiguration:a3 indexPath:a4];
}

- (id)contextMenuPreviewForDismissingContextMenuWithConfiguration:(id)a3 indexPath:(id)a4
{
  return [(ICCollectionView *)self contextMenuPreviewWithConfiguration:a3 indexPath:a4];
}

- (id)multiSelectionContextMenuPreviewForHighlightingItemAtIndexPath:(id)a3
{
  v3 = [(ICCollectionView *)self cellForItemAtIndexPath:a3];
  id v4 = ICProtocolCast();
  uint64_t v5 = [v4 contextMenuInteractionPreview];
  id v6 = (void *)v5;
  if (v5) {
    int v7 = (void *)v5;
  }
  else {
    int v7 = v3;
  }
  id v8 = v7;

  uint64_t v9 = [v8 window];
  if (v9) {
    id v10 = [objc_alloc((Class)UITargetedPreview) initWithView:v8];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)contextMenuWillPerformPreviewActionForMenuWithConfiguration:(id)a3 animator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1000CAD68;
  v15 = &unk_100625860;
  v16 = self;
  id v17 = v6;
  id v8 = v6;
  uint64_t v9 = objc_retainBlock(&v12);
  id v10 = [(ICCollectionView *)self viewControllerManager];
  id v11 = [v10 noteContainerViewMode];

  if (v11 == (id)1) {
    [v7 addAnimations:v9];
  }
  else {
    ((void (*)(void ***))v9[2])(v9);
  }
}

- (BOOL)sourceObjectIDsContainsSystemPaperNotes:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CAF80;
  v6[3] = &unk_100629038;
  v6[4] = self;
  v3 = [a3 ic_compactMap:v6];
  unsigned __int8 v4 = [v3 ic_containsObjectPassingTest:&stru_100629058];

  return v4;
}

- (void)reloadCellAfterDelayForObjectID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  dispatchMainAfterDelay();
}

- (unint64_t)actualChildIndexForSnapshotIndex:(unint64_t)a3 inDestinationObjectID:(id)a4 sectionSnapshot:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class()))
  {
    unsigned int v10 = [v9 containsItem:v8];
    id v11 = [(ICCollectionView *)self modernManagedObjectContext];
    id v12 = [v11 objectWithID:v8];

    uint64_t v13 = [v12 defaultFolder];
    uint64_t v14 = [v13 objectID];

    unsigned int v15 = [v9 containsItem:v14];
    if (a3) {
      uint64_t v16 = v10;
    }
    else {
      uint64_t v16 = 0;
    }
    if (a3) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = 0;
    }
    a3 = a3 - v16 - v17;
  }
  return a3;
}

- (id)sourceObjectIDsForDragSession:(id)a3
{
  id v3 = [a3 items];
  id v4 = [v3 ic_compactMap:&stru_100629098];

  return v4;
}

- (id)dragItemsForIndexPath:(id)a3 sessionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCollectionView *)self diffableDataSource];
  id v9 = [v8 itemIdentifierForIndexPath:v7];

  if ([(ICCollectionView *)self isCellDraggableForIdentifier:v9]
    && (objc_msgSend(v6, "addItemIdentifierIfAppropriate:isEditingCollectionView:", v9, -[ICCollectionView isEditing](self, "isEditing")), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (void *)v10;
    uint64_t v14 = v10;
    id v12 = +[NSArray arrayWithObjects:&v14 count:1];
  }
  else
  {
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

- (BOOL)isCellDraggableForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCollectionView *)self cellForItemIdentifier:v4];
  if (![v5 isUserInteractionEnabled]
    || ([v4 conformsToProtocol:&OBJC_PROTOCOL___ICSectionIdentifier] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    unsigned int v6 = +[ICTagCoreDataIndexer isTagItemIdentifier:v4] ^ 1;
  }
  objc_opt_class();
  id v7 = ICDynamicCast();
  if (v7)
  {
    objc_opt_class();
    id v8 = [v7 noteContainer];
    id v9 = ICDynamicCast();

    objc_opt_class();
    uint64_t v10 = [v7 noteContainer];
    id v11 = ICDynamicCast();

    if ([(ICCollectionView *)self isEditing]) {
      unsigned __int8 v12 = [v7 allowsEditing];
    }
    else {
      unsigned __int8 v12 = 1;
    }
    if (v9) {
      unsigned __int8 v13 = 0;
    }
    else {
      unsigned __int8 v13 = v12;
    }
    if (v11) {
      unsigned int v14 = [v11 isSystemFolder] ^ 1;
    }
    else {
      LOBYTE(v14) = 1;
    }
    LOBYTE(v6) = v6 & v14 & v13;
  }
  return v6;
}

- (BOOL)isCellReorderableForIdentifier:(id)a3
{
  id v4 = [(ICCollectionView *)self cellForItemIdentifier:a3];
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 allowsEditing]) {
    unsigned __int8 v6 = [(ICCollectionView *)self isEditing];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (int64_t)dataOwnerForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCollectionView *)self diffableDataSource];
  unsigned __int8 v6 = [v5 itemIdentifierForIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 object];
    uint64_t v8 = [v7 objectID];

    unsigned __int8 v6 = (void *)v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  id v9 = v6;
  if (!objc_msgSend(v9, "ic_isInvitationType")
    && !objc_msgSend(v9, "ic_isModernFolderType"))
  {
    if (objc_msgSend(v9, "ic_isModernNoteType"))
    {
      unsigned int v15 = [(ICCollectionView *)self modernManagedObjectContext];
      uint64_t v16 = [v15 ic_existingObjectWithID:v9];

      uint64_t v17 = [v16 folder];
      uint64_t v18 = [v17 account];
      unsigned __int8 v19 = [v18 isManaged];

      if (v19) {
        goto LABEL_7;
      }
    }
    else if (objc_msgSend(v9, "ic_isAttachmentType"))
    {
      uint64_t v20 = [(ICCollectionView *)self modernManagedObjectContext];
      v21 = [v20 ic_existingObjectWithID:v9];

      long long v22 = [v21 note];
      unsigned __int8 v23 = [v22 folder];
      id v24 = [v23 account];
      unsigned int v25 = [v24 isManaged];

      if (v25) {
        goto LABEL_7;
      }
    }
    else
    {
    }
LABEL_15:
    int64_t v14 = 1;
    goto LABEL_16;
  }
  uint64_t v10 = [(ICCollectionView *)self modernManagedObjectContext];
  id v11 = [v10 ic_existingObjectWithID:v9];

  unsigned __int8 v12 = [v11 account];
  unsigned __int8 v13 = [v12 isManaged];

  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_7:
  int64_t v14 = 2;
LABEL_16:

  return v14;
}

- (void)reExpandFolderWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCollectionView *)self currentDragSessionContext];
  unsigned __int8 v6 = [v5 autoCollapsedFolderObjectID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    uint64_t v8 = [(ICCollectionView *)self diffableDataSource];
    id v9 = [v8 snapshot];
    uint64_t v10 = [v9 sectionIdentifierForSectionContainingItemIdentifier:v4];

    id v11 = [(ICCollectionView *)self diffableDataSource];
    unsigned __int8 v12 = [v11 snapshotForSection:v10];

    id v16 = v4;
    unsigned __int8 v13 = +[NSArray arrayWithObjects:&v16 count:1];
    [v12 expandItems:v13];

    int64_t v14 = [(ICCollectionView *)self diffableDataSource];
    [v14 applySnapshot:v12 toSection:v10 animatingDifferences:1];

    unsigned int v15 = [(ICCollectionView *)self currentDragSessionContext];
    [v15 setAutoCollapsedFolderObjectID:0];
  }
}

- (id)movableNoteObjectIDsIn:(id)a3 forDropIntoSection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000CBB54;
  v10[3] = &unk_1006290C0;
  v10[4] = self;
  BOOL v11 = [v6 sectionType] == (id)3;
  uint64_t v8 = [v7 ic_compactMap:v10];

  return v8;
}

- (void)performDropOfFolderObjectIDs:(id)a3 atFolderObjectID:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 count];
  if (v9 && v10)
  {
    BOOL v11 = [(ICCollectionView *)self modernManagedObjectContext];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000CBD14;
    v12[3] = &unk_1006290E8;
    v12[4] = self;
    id v13 = v9;
    id v14 = v8;
    unint64_t v15 = a5;
    [v11 performBlockAndWait:v12];
  }
}

- (CGRect)presentationSourceRectForCell:(id)a3
{
  id v4 = a3;
  [v4 frame];
  -[ICCollectionView convertPoint:toView:](self, "convertPoint:toView:", self);
  double v6 = v5;
  [(ICCollectionView *)self bounds];
  CGFloat Width = CGRectGetWidth(v20);
  [v4 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  double Height = CGRectGetHeight(v21);
  double v17 = 0.0;
  double v18 = v6;
  double v19 = Width;
  result.size.height = Height;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)contextMenuForInvitation:(id)a3 sourceView:(id)a4
{
  id v5 = a3;
  double v6 = +[NSMutableArray array];
  id v7 = [v5 highlight];

  if (v7)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000CC534;
    v19[3] = &unk_100626400;
    v19[4] = self;
    id v8 = v5;
    id v20 = v8;
    CGFloat v9 = +[UIAction ic_replyActionWithHandler:v19];
    [v6 addObject:v9];
    CGFloat v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    CGFloat v15 = sub_1000CC540;
    id v16 = &unk_100626400;
    double v17 = self;
    id v18 = v8;
    double v10 = +[UIAction ic_removeActionWithHandler:&v13];
    [v6 addObject:v10, v13, v14, v15, v16, v17];
  }
  CGFloat v11 = +[UIMenu menuWithChildren:v6];

  return v11;
}

- (id)contextMenuForFolder:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  if ([v6 canBeSharedViaICloud] && objc_msgSend(v6, "canCurrentUserShare"))
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000CCB80;
    v46[3] = &unk_100629138;
    v46[4] = self;
    id v47 = v6;
    id v48 = v7;
    CGFloat v9 = +[UIAction ic_collaborateShareActionWithCloudSyncingObject:v47 withHandler:v46];
    [v8 addObject:v9];
  }
  if ([v6 canBeSharedViaICloud] && objc_msgSend(v6, "isSharedViaICloud"))
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000CCBA8;
    v43[3] = &unk_100629138;
    v43[4] = self;
    id v44 = v6;
    id v45 = v7;
    double v10 = +[UIAction ic_collaborateManageActionWithCloudSyncingObject:v44 withHandler:v43];
    [v8 addObject:v10];
  }
  if ([v6 isSharedViaICloud])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000CCBD0;
    v41[3] = &unk_100626400;
    v41[4] = self;
    id v42 = v6;
    CGFloat v11 = +[UIAction ic_showActivityStreamActionWithCloudSyncingObject:v42 withHandler:v41];
    [v8 addObject:v11];
  }
  double v12 = [(ICCollectionView *)self viewControllerManager];
  unsigned int v13 = +[ICMoveFolderActivity canShowMoveActionForFolder:v6 viewControllerManager:v12];

  if (v13)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000CCBDC;
    v39[3] = &unk_100626400;
    void v39[4] = self;
    id v40 = v6;
    uint64_t v14 = +[UIAction ic_moveActionWithHandler:v39];
    [v8 addObject:v14];
  }
  if ([v6 isEditableSmartFolder])
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000CCBEC;
    v37[3] = &unk_100626400;
    v37[4] = self;
    CGFloat v15 = &v38;
    id v38 = v6;
    uint64_t v16 = +[UIAction ic_editSmartFolderActionWithHandler:v37];
  }
  else
  {
    if (![v6 isRenamable]) {
      goto LABEL_16;
    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000CCBF8;
    v35[3] = &unk_100626400;
    v35[4] = self;
    CGFloat v15 = &v36;
    id v36 = v6;
    uint64_t v16 = +[UIAction ic_renameActionWithHandler:v35];
  }
  double v17 = (void *)v16;
  [v8 addObject:v16];

LABEL_16:
  if ([v6 isDeletable])
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000CCC04;
    v33[3] = &unk_100626400;
    void v33[4] = self;
    id v34 = v6;
    id v18 = +[UIAction ic_deleteActionWithHandler:v33];
    [v8 addObject:v18];
  }
  if (ICInternalSettingsIsAlexandriaEnabled())
  {
    if ([v6 allowsImporting])
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000CCC8C;
      v30[3] = &unk_100629138;
      v30[4] = self;
      id v31 = v6;
      id v32 = v7;
      double v19 = +[UIAction ic_importArchiveActionWithHandler:v30];
      [v8 addObject:v19];
    }
    if ([v6 allowsExporting])
    {
      unsigned __int8 v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      unsigned int v25 = sub_1000CCC9C;
      id v26 = &unk_100629138;
      unsigned int v27 = self;
      id v28 = v6;
      id v29 = v7;
      id v20 = +[UIAction ic_exportArchiveActionWithHandler:&v23];
      [v8 addObject:v20, v23, v24, v25, v26, v27];
    }
  }
  CGRect v21 = +[UIMenu menuWithChildren:v8];

  return v21;
}

- (id)contextMenuForModernNote:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  if ([v6 isPinnable])
  {
    id v9 = [v6 isPinned];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000CD214;
    v36[3] = &unk_100626400;
    v36[4] = self;
    id v37 = v6;
    double v10 = +[UIAction ic_pinNoteActionPinned:v9 withHandler:v36];
    [v8 addObject:v10];
  }
  if ([v6 isLockable])
  {
    id v11 = [v6 isPasswordProtected];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000CD220;
    v34[3] = &unk_100626400;
    v34[4] = self;
    id v35 = v6;
    double v12 = +[UIAction ic_lockNoteActionLocked:v11 withHandler:v34];
    [v8 addObject:v12];
  }
  if ([v6 canBeSharedViaICloud])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000CD22C;
    v31[3] = &unk_100629138;
    v31[4] = self;
    id v32 = v6;
    id v33 = v7;
    unsigned int v13 = +[UIAction ic_collaborateShareActionWithCloudSyncingObject:v32 withHandler:v31];
    [v8 addObject:v13];
  }
  if ([v6 isSharedViaICloud])
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000CD254;
    v28[3] = &unk_100629138;
    v28[4] = self;
    id v29 = v6;
    id v30 = v7;
    uint64_t v14 = +[UIAction ic_collaborateManageActionWithCloudSyncingObject:v29 withHandler:v28];
    [v8 addObject:v14];
  }
  if (ICInternalSettingsIsAlexandriaEnabled() && [v6 allowsExporting])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000CD27C;
    v25[3] = &unk_100629138;
    v25[4] = self;
    id v26 = v6;
    id v27 = v7;
    CGFloat v15 = +[UIAction ic_exportArchiveActionWithHandler:v25];
    [v8 addObject:v15];
  }
  if ([v6 isMovable] && -[ICCollectionView ic_behavior](self, "ic_behavior") != (id)1)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000CD310;
    v23[3] = &unk_100626400;
    v23[4] = self;
    id v24 = v6;
    uint64_t v16 = +[UIAction ic_moveActionWithHandler:v23];
    [v8 addObject:v16];
  }
  if ([v6 isDeletable])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000CD398;
    v21[3] = &unk_100626400;
    v21[4] = self;
    id v22 = v6;
    double v17 = +[UIAction ic_deleteActionWithHandler:v21];
    [v8 addObject:v17];
  }
  id v18 = +[ICAppURLUtilities appURLForNote:v6];
  double v19 = [(ICCollectionView *)self contextMenuWithCenterWindowWithAppURL:v18 actions:v8];

  return v19;
}

- (id)contextMenuForLegacyNote:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000CD670;
  v23[3] = &unk_100629138;
  v23[4] = self;
  id v9 = v6;
  id v24 = v9;
  id v25 = v7;
  id v10 = v7;
  id v11 = +[UIAction ic_sendActionWithHandler:v23];
  [v8 addObject:v11];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CD680;
  v21[3] = &unk_100626400;
  v21[4] = self;
  id v12 = v9;
  id v22 = v12;
  unsigned int v13 = +[UIAction ic_moveActionWithHandler:v21];
  [v8 addObject:v13];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CD708;
  v19[3] = &unk_100626400;
  v19[4] = self;
  id v20 = v12;
  id v14 = v12;
  CGFloat v15 = +[UIAction ic_deleteActionWithHandler:v19];
  [v8 addObject:v15];
  uint64_t v16 = +[ICAppURLUtilities appURLForHTMLNote:v14];
  double v17 = [(ICCollectionView *)self contextMenuWithCenterWindowWithAppURL:v16 actions:v8];

  return v17;
}

- (id)contextMenuWithCenterWindowWithAppURL:(id)a3 actions:(id)a4
{
  id v5 = a3;
  id v6 = +[UIMenu menuWithTitle:&stru_10063F3D8 image:0 identifier:0 options:1 children:a4];
  id v7 = objc_alloc_init(ICCenterWindowSceneActivationRequestOptions);
  id v8 = +[UIAction ic_centerWindowActionWithAppURL:v5 activationRequestOptions:v7];

  v12[0] = v8;
  v12[1] = v6;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[UIMenu menuWithChildren:v9];

  return v10;
}

- (id)leadingSwipeActionsConfigurationProvider
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CD96C;
  v4[3] = &unk_100629160;
  objc_copyWeak(&v5, &location);
  id v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)trailingSwipeActionsConfigurationProvider
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CDB98;
  v4[3] = &unk_100629160;
  objc_copyWeak(&v5, &location);
  id v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)leadingSwipeActionsConfigurationForModernNote:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  if ([v6 isPinnable])
  {
    id v9 = [v6 isPinned];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CDFE4;
    v16[3] = &unk_100629188;
    objc_copyWeak(&v18, &location);
    id v10 = v6;
    id v17 = v10;
    id v11 = +[UIContextualAction ic_pinContextualActionWithPinned:v9 pinBlock:v16];
    id v12 = -[ICCollectionView pinOrUnpinAccessibilityLabelForNoteIsPinned:](self, "pinOrUnpinAccessibilityLabelForNoteIsPinned:", [v10 isPinned]);
    [v11 setAccessibilityLabel:v12];

    [v8 addObject:v11];
    objc_destroyWeak(&v18);
  }
  id v13 = [v8 copy];
  id v14 = +[UISwipeActionsConfiguration configurationWithActions:v13];

  [v14 setPerformsFirstActionWithFullSwipe:1];
  objc_destroyWeak(&location);

  return v14;
}

- (id)trailingSwipeActionsConfigurationForLegacyNote:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CE2D8;
  v21[3] = &unk_100629188;
  objc_copyWeak(&v23, &location);
  id v9 = v6;
  id v22 = v9;
  id v10 = +[UIContextualAction ic_deleteContextualActionWithBlock:v21];
  id v11 = [(ICCollectionView *)self deleteNoteAccessibilityLabel];
  [v10 setAccessibilityLabel:v11];

  [v8 addObject:v10];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000CE38C;
  v18[3] = &unk_100629188;
  objc_copyWeak(&v20, &location);
  id v12 = v9;
  id v19 = v12;
  id v13 = +[UIContextualAction ic_moveContextualActionWithBlock:v18];
  id v14 = [(ICCollectionView *)self moveNoteAccessibilityLabel];
  [v13 setAccessibilityLabel:v14];

  [v8 addObject:v13];
  id v15 = [v8 copy];
  uint64_t v16 = +[UISwipeActionsConfiguration configurationWithActions:v15];

  [v16 setPerformsFirstActionWithFullSwipe:0];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

- (id)trailingSwipeActionsConfigurationForModernNote:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  if ([v6 isDeletable])
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000CE7CC;
    v29[3] = &unk_100629188;
    objc_copyWeak(&v31, &location);
    id v30 = v6;
    id v9 = +[UIContextualAction ic_deleteContextualActionWithBlock:v29];
    id v10 = [(ICCollectionView *)self deleteNoteAccessibilityLabel];
    [v9 setAccessibilityLabel:v10];

    [v8 addObject:v9];
    objc_destroyWeak(&v31);
  }
  if ([v6 isMovable] && -[ICCollectionView ic_behavior](self, "ic_behavior") != (id)1)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000CE880;
    v26[3] = &unk_100629188;
    objc_copyWeak(&v28, &location);
    id v27 = v6;
    id v11 = +[UIContextualAction ic_moveContextualActionWithBlock:v26];
    id v12 = [(ICCollectionView *)self moveNoteAccessibilityLabel];
    [v11 setAccessibilityLabel:v12];

    [v8 addObject:v11];
    objc_destroyWeak(&v28);
  }
  if ([v6 canBeSharedViaICloud])
  {
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    CGRect v21 = sub_1000CE934;
    id v22 = &unk_1006291B0;
    objc_copyWeak(&v25, &location);
    id v23 = v7;
    id v13 = v6;
    id v24 = v13;
    id v14 = +[UIContextualAction ic_shareContextualActionWithShareImageName:@"square.and.arrow.up" shareBlock:&v19];
    id v15 = -[ICCollectionView collaborationAccessibilityLabelForCloudSyncingObject:](self, "collaborationAccessibilityLabelForCloudSyncingObject:", v13, v19, v20, v21, v22);
    [v14 setAccessibilityLabel:v15];

    [v8 addObject:v14];
    objc_destroyWeak(&v25);
  }
  id v16 = [v8 copy];
  id v17 = +[UISwipeActionsConfiguration configurationWithActions:v16];

  [v17 setPerformsFirstActionWithFullSwipe:0];
  objc_destroyWeak(&location);

  return v17;
}

- (id)trailingSwipeActionsConfigurationForModernFolder:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  if ([v6 isDeletable])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000CEDA4;
    v31[3] = &unk_100629188;
    objc_copyWeak(&v33, &location);
    id v32 = v6;
    id v9 = +[UIContextualAction ic_deleteContextualActionWithBlock:v31];
    id v10 = [(ICCollectionView *)self deleteFolderAccessibilityLabel];
    [v9 setAccessibilityLabel:v10];

    [v8 addObject:v9];
    objc_destroyWeak(&v33);
  }
  id v11 = [(ICCollectionView *)self viewControllerManager];
  unsigned int v12 = +[ICMoveFolderActivity canShowMoveActionForFolder:v6 viewControllerManager:v11];

  if (v12)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000CEE58;
    v28[3] = &unk_100629188;
    objc_copyWeak(&v30, &location);
    id v29 = v6;
    id v13 = +[UIContextualAction ic_moveContextualActionWithBlock:v28];
    id v14 = [(ICCollectionView *)self moveFolderAccessibilityLabel];
    [v13 setAccessibilityLabel:v14];

    [v8 addObject:v13];
    objc_destroyWeak(&v30);
  }
  if ([v6 canBeSharedViaICloud] && objc_msgSend(v6, "canCurrentUserShare"))
  {
    CGRect v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_1000CEEC4;
    id v24 = &unk_1006291B0;
    objc_copyWeak(&v27, &location);
    id v25 = v7;
    id v15 = v6;
    id v26 = v15;
    id v16 = +[UIContextualAction ic_shareContextualActionWithShareImageName:@"square.and.arrow.up" shareBlock:&v21];
    id v17 = -[ICCollectionView collaborationAccessibilityLabelForCloudSyncingObject:](self, "collaborationAccessibilityLabelForCloudSyncingObject:", v15, v21, v22, v23, v24);
    [v16 setAccessibilityLabel:v17];

    [v8 addObject:v16];
    objc_destroyWeak(&v27);
  }
  id v18 = [v8 copy];
  id v19 = +[UISwipeActionsConfiguration configurationWithActions:v18];

  [v19 setPerformsFirstActionWithFullSwipe:0];
  objc_destroyWeak(&location);

  return v19;
}

- (id)trailingSwipeActionsConfigurationForInvitation:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  id v9 = [v6 highlight];

  if (v9)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000CF21C;
    v21[3] = &unk_100629188;
    objc_copyWeak(&v23, &location);
    id v10 = v6;
    id v22 = v10;
    id v11 = +[UIContextualAction ic_removeContextualActionWithBlock:v21];
    unsigned int v12 = [(ICCollectionView *)self removeInvitationAccessibilityLabel];
    [v11 setAccessibilityLabel:v12];

    [v8 addObject:v11];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CF290;
    v18[3] = &unk_100629188;
    objc_copyWeak(&v20, &location);
    id v19 = v10;
    id v13 = +[UIContextualAction ic_replyContextualActionWithBlock:v18];
    id v14 = [(ICCollectionView *)self replyToInvitationAccessibilityLabel];
    [v13 setAccessibilityLabel:v14];

    [v8 addObject:v13];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v23);
  }
  id v15 = [v8 copy];
  id v16 = +[UISwipeActionsConfiguration configurationWithActions:v15];

  [v16 setPerformsFirstActionWithFullSwipe:0];
  objc_destroyWeak(&location);

  return v16;
}

- (void)performPinActionWithNote:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[ICCollectionView performPinActionWithNotes:](self, "performPinActionWithNotes:", v5, v6);
}

- (void)performPinActionWithNotes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(ICCollectionView *)self presentingViewController];
  id v6 = ICDynamicCast();

  objc_opt_class();
  id v7 = [v6 dataSource];
  id v8 = ICDynamicCast();

  objc_opt_class();
  id v9 = [v8 indexer];
  id v10 = ICDynamicCast();

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000CF74C;
  v42[3] = &unk_100625860;
  id v11 = v4;
  id v43 = v11;
  id v32 = v10;
  id v44 = v32;
  [v8 performBlockSuspendingUpdates:v42 andApplySnapshotAnimated:1];
  objc_opt_class();
  id v33 = v6;
  unsigned int v12 = [v6 dataSource];
  id v13 = ICDynamicCast();

  if (v13)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = v11;
    id v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v19 changePinStatusIfPossible];
          id v20 = [v19 managedObjectContext];
          [v20 ic_save];
        }
        id v16 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v16);
    }

    [v13 performUpdatesIfNeededAndWait];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        id v27 = [(ICCollectionView *)self presentingViewController];
        id v28 = [v27 eventReporter];
        [v28 submitNotePinEventForModernNote:v26 contextPath:0];

        if (UIAccessibilityIsVoiceOverRunning())
        {
          id v29 = [v26 isPinned];
          id v30 = [v26 title];
          id v31 = [(ICCollectionView *)self pinOrUnpinAccessibilityAnnouncementForNoteIsPinned:v29 noteTitle:v30];

          ICAccessibilityPostHighPriorityAnnouncementNotification();
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v23);
  }
}

- (void)performLockActionWithNote:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ICLockNoteActivity);
  id v6 = [(ICCollectionView *)self presentingViewController];
  id v7 = [v5 initWithNote:v4 presentingViewController:v6];
  [(ICCollectionView *)self setLockNoteActivity:v7];

  objc_initWeak(&location, self);
  id v8 = [(ICCollectionView *)self viewControllerManager];
  id v9 = [v8 window];
  id v10 = [v9 firstResponder];

  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___UITextInput])
  {
    [v10 resignFirstResponder];
    v14[1] = _NSConcreteStackBlock;
    v14[2] = (id)3221225472;
    v14[3] = sub_1000CFA3C;
    v14[4] = &unk_100625938;
    id v11 = &v15;
    objc_copyWeak(&v15, &location);
    dispatchMainAfterDelay();
  }
  else
  {
    unsigned int v12 = [(ICCollectionView *)self lockNoteActivity];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000CFB4C;
    v13[3] = &unk_100626358;
    id v11 = v14;
    objc_copyWeak(v14, &location);
    [v12 performActivityWithCompletion:v13];
  }
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

- (void)performCollaborationActionWithNote:(id)a3 forceShareSheet:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = v17;
  if (v15)
  {
    if (a4 || ([v15 isPubliclySharedOrHasInvitees] & 1) == 0)
    {
      id v25 = [ICSendNoteActivity alloc];
      id v26 = [(ICCollectionView *)self presentingViewController];
      id v27 = [(ICCollectionView *)self presentingViewController];
      id v28 = [v27 eventReporter];
      id v23 = -[ICSendNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](v25, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", v15, v26, 0, v16, v28, x, y, width, height);

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000CFDF4;
      v31[3] = &unk_1006291D8;
      id v32 = v18;
      [(ICSendNoteActivity *)v23 performActivityWithCompletion:v31];
      uint64_t v24 = v32;
    }
    else
    {
      id v19 = [ICCollaborationNoteActivity alloc];
      id v20 = [(ICCollectionView *)self presentingViewController];
      id v21 = [(ICCollectionView *)self presentingViewController];
      id v22 = [v21 eventReporter];
      id v23 = [(ICCollaborationNoteActivity *)v19 initWithNote:v15 presentingViewController:v20 presentingBarButtonItem:0 presentingSourceView:v16 eventReporter:v22];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000CFE0C;
      v29[3] = &unk_1006291D8;
      id v30 = v18;
      [(ICSendNoteActivity *)v23 performActivityWithCompletion:v29];
      uint64_t v24 = v30;
    }
  }
  else if (v17)
  {
    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
}

- (void)performSendActionWithNote:(id)a3 fromSourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(ICCollectionView *)self modernManagedObjectContext];
    id v9 = [v6 objectID];
    id v10 = [v8 objectWithID:v9];

    id v11 = [ICSendNoteActivity alloc];
    unsigned int v12 = [(ICCollectionView *)self presentingViewController];
    id v13 = [(ICCollectionView *)self presentingViewController];
    id v14 = [v13 eventReporter];
    id v15 = -[ICSendNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](v11, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", v10, v12, 0, v7, v14, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

    [(ICSendNoteActivity *)v15 performActivityWithCompletion:0];
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [(ICCollectionView *)self legacyManagedObjectContext];
    id v17 = [v6 objectID];
    id v10 = [v16 objectWithID:v17];

    id v18 = [(ICCollectionView *)self viewControllerManager];
    id v15 = [v18 legacyNoteEditorViewController];

    id v19 = [(ICSendNoteActivity *)v15 view];
    [(ICSendNoteActivity *)v15 setNote:v10];
    [(ICSendNoteActivity *)v15 setContentFromNote];
    id v20 = [NotesActivityViewController alloc];
    id v21 = [(ICSendNoteActivity *)v15 noteActivityItemsForSharing];
    id v22 = [(NotesActivityViewController *)v20 initWithActivityItems:v21 applicationActivities:0];

    id v23 = [v10 store];
    uint64_t v24 = [v23 account];
    -[NotesActivityViewController setIsContentManaged:](v22, "setIsContentManaged:", [v24 isManaged]);

    v29[0] = UIActivityTypeOpenInIBooks;
    v29[1] = ICActivityTypeShareToNote;
    v29[2] = UIActivityTypeSharePlay;
    id v25 = +[NSArray arrayWithObjects:v29 count:3];
    [(NotesActivityViewController *)v22 setExcludedActivityTypes:v25];

    [(NotesActivityViewController *)v22 setDisplayController:v15];
    if (+[UIDevice ic_isVision]) {
      uint64_t v26 = -2;
    }
    else {
      uint64_t v26 = 7;
    }
    [(NotesActivityViewController *)v22 setModalPresentationStyle:v26];
    id v27 = [(NotesActivityViewController *)v22 popoverPresentationController];
    [v27 setSourceView:v7];

    id v28 = [(ICCollectionView *)self presentingViewController];
    [v28 presentViewController:v22 animated:1 completion:0];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)performMoveActionWithNotes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [ICMoveDecisionController alloc];
  id v9 = [(ICCollectionView *)self presentingViewController];
  id v10 = [(ICMoveDecisionController *)v8 initWithSourceObjects:v7 presentingViewController:v9];

  [(ICCollectionView *)self setMoveDecisionController:v10];
  id v11 = [(ICCollectionView *)self moveDecisionController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D0280;
  v13[3] = &unk_100627A30;
  void v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v11 performDecisionWithCompletion:v13];
}

- (void)performDeleteActionWithObjects:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCollectionView *)self presentingViewController];
  if (([v8 isFirstResponder] & 1) == 0)
  {
    id v9 = [(ICCollectionView *)self presentingViewController];
    unsigned int v10 = [v9 canBecomeFirstResponder];

    if (!v10) {
      goto LABEL_5;
    }
    id v8 = [(ICCollectionView *)self presentingViewController];
    [v8 becomeFirstResponder];
  }

LABEL_5:
  objc_opt_class();
  id v11 = [(ICCollectionView *)self presentingViewController];
  id v12 = ICDynamicCast();

  id v13 = [ICDeleteDecisionController alloc];
  id v14 = [(ICCollectionView *)self window];
  id v15 = [(ICCollectionView *)self presentingViewController];
  id v16 = [v15 eventReporter];
  id v17 = [(ICDeleteDecisionController *)v13 initWithSourceObjects:v7 window:v14 sender:0 eventReporter:v16];

  objc_opt_class();
  id v18 = [v12 dataSource];
  id v19 = ICDynamicCast();

  objc_opt_class();
  id v20 = [v19 indexer];
  id v21 = ICDynamicCast();

  id v22 = [v7 ic_compactMap:&stru_100629220];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000D08A0;
  v39[3] = &unk_100629248;
  void v39[4] = self;
  id v23 = v22;
  id v40 = v23;
  id v24 = v6;
  id v41 = v24;
  [v21 deleteWithDecisionController:v17 completion:v39];
  objc_opt_class();
  id v25 = [v12 dataSource];
  uint64_t v26 = ICDynamicCast();

  objc_opt_class();
  id v27 = [v26 indexer];
  id v28 = ICDynamicCast();

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000D0900;
  v36[3] = &unk_100629248;
  v36[4] = self;
  id v29 = v23;
  id v37 = v29;
  id v30 = v24;
  id v38 = v30;
  [v28 deleteWithDecisionController:v17 completion:v36];
  objc_opt_class();
  id v31 = [v12 dataSource];
  id v32 = ICDynamicCast();

  if (v32)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D0960;
    v33[3] = &unk_100627958;
    id v34 = v32;
    id v35 = v30;
    [(ICDeleteDecisionController *)v17 performDecisionWithCompletion:v33];
  }
}

- (void)performMoveActionWithFolder:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [ICMoveFolderActivity alloc];
  id v9 = [(ICCollectionView *)self presentingViewController];
  unsigned int v10 = [(ICMoveFolderActivity *)v8 initWithFolder:v6 presentingViewController:v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D0AC4;
  v13[3] = &unk_100629270;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(ICMoveFolderActivity *)v10 performActivityWithCompletion:v13];
}

- (void)performRenameActionWithFolder:(id)a3
{
  id v4 = a3;
  id v5 = [ICRenameFolderActivity alloc];
  id v6 = [(ICCollectionView *)self presentingViewController];
  id v7 = [(ICRenameFolderActivity *)v5 initWithFolder:v4 presentingViewController:v6];

  [(ICCollectionView *)self setRenameFolderActivity:v7];
  id v8 = [(ICCollectionView *)self renameFolderActivity];
  [v8 performActivityWithCompletion:0];
}

- (void)performEditSmartFolderActionWithFolder:(id)a3
{
  id v4 = a3;
  id v5 = [ICEditSmartFolderActivity alloc];
  id v6 = [(ICCollectionView *)self presentingViewController];
  id v7 = [(ICEditSmartFolderActivity *)v5 initWithSmartFolder:v4 presentingViewController:v6];

  [(ICEditSmartFolderActivity *)v7 performActivityWithCompletion:0];
}

- (void)performCollaborationActionWithFolder:(id)a3 forceShareSheet:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v12 = a4;
  id v15 = a7;
  id v16 = a5;
  id v17 = a3;
  id v18 = [ICCollaborationFolderActivity alloc];
  id v19 = [(ICCollectionView *)self presentingViewController];
  id v20 = [(ICCollectionView *)self presentingViewController];
  id v21 = [v20 eventReporter];
  id v22 = -[ICCollaborationFolderActivity initWithFolder:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](v18, "initWithFolder:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", v17, v19, 0, v16, v21, x, y, width, height);

  [(ICCollaborationFolderActivity *)v22 setForceShareSheet:v12];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000D0E1C;
  v24[3] = &unk_1006291D8;
  id v25 = v15;
  id v23 = v15;
  [(ICCollaborationFolderActivity *)v22 performActivityWithCompletion:v24];
}

- (void)performShowActivityStreamActionWithFolder:(id)a3
{
  id v4 = a3;
  id v6 = [[ICShowActivityStreamActivity alloc] initWithObject:v4];

  id v5 = [(ICCollectionView *)self viewControllerManager];
  [(ICShowActivityStreamActivity *)v6 setViewControllerManager:v5];

  [(ICShowActivityStreamActivity *)v6 performActivityWithCompletion:0];
}

- (void)performImportArchiveActionWithNoteContainer:(id)a3 fromSourceView:(id)a4
{
  id v5 = a3;
  id v6 = [ICImportArchiveActivity alloc];
  id v7 = [(ICCollectionView *)self presentingViewController];
  id v8 = [(ICImportArchiveActivity *)v6 initWithNoteContainer:v5 presentingViewController:v7];

  [(ICCollectionView *)self setImportArchiveActivity:v8];
  id v9 = [(ICCollectionView *)self importArchiveActivity];
  [v9 performActivityWithCompletion:0];
}

- (void)performExportArchiveActionWithObjects:(id)a3 fromSourceView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [ICExportArchiveActivity alloc];
  id v9 = [(ICCollectionView *)self presentingViewController];
  unsigned int v10 = [(ICExportArchiveActivity *)v8 initWithObjects:v7 presentingViewController:v9 presentingBarButtonItem:0 presentingSourceView:v6];

  [(ICExportArchiveActivity *)v10 performActivityWithCompletion:0];
}

- (void)performRemoveActionWithInvitation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 highlight];
  id v6 = [v5 hideContextMenu];
  id v7 = [v6 actionBlock];

  if (v7)
  {
    id v8 = [v4 highlight];
    id v9 = [v8 hideContextMenu];
    unsigned int v10 = [v9 actionBlock];
    v10[2]();
  }
  id v11 = [v4 objectID];
  id v15 = v11;
  BOOL v12 = +[NSArray arrayWithObjects:&v15 count:1];
  [(ICCollectionView *)self synchronouslyRemoveItemsWithIdentifiers:v12];

  id v13 = [(ICCollectionView *)self presentingViewController];
  id v14 = [v13 eventReporter];
  [v14 submitCollabNotificationEventWithAction:2];
}

- (void)performReplyActionWithInvitation:(id)a3
{
  id v4 = [a3 highlight];
  id v5 = [(ICCollectionView *)self presentingViewController];
  id v8 = [v4 replyContextMenuWithPresentingViewController:v5];

  id v6 = [v8 actionBlock];

  if (v6)
  {
    id v7 = [v8 actionBlock];
    v7[2]();
  }
}

- (id)contextMenuPreviewWithConfiguration:(id)a3 indexPath:(id)a4
{
  id v5 = [a3 identifier];
  id v6 = [(ICCollectionView *)self cellForItemIdentifier:v5];

  id v7 = ICProtocolCast();
  uint64_t v8 = [v7 contextMenuInteractionPreview];
  id v9 = (void *)v8;
  if (v8) {
    unsigned int v10 = (void *)v8;
  }
  else {
    unsigned int v10 = v6;
  }
  id v11 = v10;

  id v12 = [v11 window];

  if (v12)
  {
    id v12 = [objc_alloc((Class)UITargetedPreview) initWithView:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v6 _visiblePathForBackgroundConfiguration];
      id v14 = [v12 parameters];
      [v14 setVisiblePath:v13];

      id v15 = [(ICCollectionView *)self backgroundColor];
      id v16 = [v12 parameters];
      [v16 setBackgroundColor:v15];
    }
  }

  return v12;
}

- (id)previewParametersWithCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [a3 cellForItemAtIndexPath:a4];
  id v6 = ICProtocolCast();
  uint64_t v7 = [v6 contextMenuInteractionPreview];
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v5;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = objc_alloc_init((Class)UIDragPreviewParameters);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v5 _visiblePathForBackgroundConfiguration];
      [v11 setVisiblePath:v12];

      id v13 = [(ICCollectionView *)self backgroundColor];
      [v11 setBackgroundColor:v13];
    }
    else
    {
      id v13 = [v10 layer];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [v13 cornerRadius];
      id v23 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15, v17, v19, v21, v22);
      [v11 setVisiblePath:v23];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)cellForItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollectionView *)self diffableDataSource];
  id v6 = [v5 indexPathForItemIdentifier:v4];

  uint64_t v7 = [(ICCollectionView *)self cellForItemAtIndexPath:v6];

  return v7;
}

- (void)synchronouslyRemoveItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollectionView *)self diffableDataSource];
  id v9 = [v5 snapshot];

  [v9 deleteItemsWithIdentifiers:v4];
  id v6 = [(ICCollectionView *)self diffableDataSource];
  [v6 applySnapshot:v9 animatingDifferences:1];

  uint64_t v7 = [(ICCollectionView *)self optimisticallyAppliedSnapshotHandler];

  if (v7)
  {
    uint64_t v8 = [(ICCollectionView *)self optimisticallyAppliedSnapshotHandler];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (id)firstUnselectedIndexPathWithFrame:(CGRect)a3 arrowDirection:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(ICCollectionView *)self indexPathsForSelectedItems];
  id v11 = [v10 firstObject];

  id v12 = [(ICCollectionView *)self collectionViewLayout];
  id v13 = [v12 layoutAttributesForElementsInRect:x, y, width, height];

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_1000D187C;
  id v30 = sub_1000D188C;
  id v31 = 0;
  v25[0] = 0;
  v25[1] = v25;
  BOOL v14 = a4 == 8 || a4 == 2;
  double v15 = -1.79769313e308;
  if (v14) {
    double v15 = 1.79769313e308;
  }
  v25[2] = 0x2020000000;
  *(double *)&v25[3] = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D1894;
  v19[3] = &unk_100629298;
  id v16 = v11;
  id v20 = v16;
  double v21 = self;
  id v23 = &v26;
  unint64_t v24 = a4;
  double v22 = v25;
  [v13 enumerateObjectsUsingBlock:v19];
  double v17 = [(id)v27[5] indexPath];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (id)commonAccessibilityActionsForFolder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 isRenamable])
  {
    id v6 = objc_alloc((Class)UIAccessibilityCustomAction);
    uint64_t v7 = [(ICCollectionView *)self renameFolderAccessibilityLabel];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000D1C54;
    v20[3] = &unk_1006292C0;
    v20[4] = self;
    id v21 = v4;
    id v8 = [v6 initWithName:v7 actionHandler:v20];

    [v5 addObject:v8];
  }
  if ([v4 isSharedViaICloud])
  {
    id v9 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v10 = [(ICCollectionView *)self showFolderActivityAccessibilityLabel];
    BOOL v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_1000D1C78;
    double v17 = &unk_1006292C0;
    double v18 = self;
    id v19 = v4;
    id v11 = [v9 initWithName:v10 actionHandler:&v14];

    [v5 addObject:v11, v14, v15, v16, v17, v18];
  }
  id v12 = [v5 copy];

  return v12;
}

- (id)galleryViewAcessibilityActionsForFolder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(ICCollectionView *)self commonAccessibilityActionsForFolder:v4];
  [v5 addObjectsFromArray:v6];

  if ([v4 isDeletable])
  {
    id v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v8 = [(ICCollectionView *)self deleteFolderAccessibilityLabel];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000D1F54;
    v28[3] = &unk_1006292C0;
    void v28[4] = self;
    id v29 = v4;
    id v9 = [v7 initWithName:v8 actionHandler:v28];

    [v5 addObject:v9];
  }
  id v10 = [(ICCollectionView *)self viewControllerManager];
  unsigned int v11 = +[ICMoveFolderActivity canShowMoveActionForFolder:v4 viewControllerManager:v10];

  if (v11)
  {
    id v12 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v13 = [(ICCollectionView *)self moveFolderAccessibilityLabel];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000D1FE0;
    v26[3] = &unk_1006292C0;
    void v26[4] = self;
    id v27 = v4;
    id v14 = [v12 initWithName:v13 actionHandler:v26];

    [v5 addObject:v14];
  }
  if ([v4 canBeSharedViaICloud])
  {
    id v15 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v16 = [(ICCollectionView *)self collaborationAccessibilityLabelForCloudSyncingObject:v4];
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    double v22 = sub_1000D2008;
    id v23 = &unk_1006292C0;
    unint64_t v24 = self;
    id v25 = v4;
    id v17 = [v15 initWithName:v16 actionHandler:&v20];

    [v5 addObject:v17, v20, v21, v22, v23, v24];
  }
  id v18 = [v5 copy];

  return v18;
}

- (id)commonAcessibilityActionsForNoteWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if (objc_msgSend(v4, "ic_isModernNoteType"))
  {
    id v6 = [(ICCollectionView *)self modernManagedObjectContext];
  }
  else
  {
    if (!objc_msgSend(v4, "ic_isLegacyNoteType"))
    {
      id v8 = 0;
      goto LABEL_7;
    }
    id v6 = [(ICCollectionView *)self legacyManagedObjectContext];
  }
  id v7 = v6;
  id v8 = [v6 objectWithID:v4];

LABEL_7:
  objc_opt_class();
  id v9 = ICDynamicCast();
  id v10 = v9;
  if (v9 && [v9 isLockable])
  {
    id v11 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v12 = -[ICCollectionView lockOrUnlockAccessibilityLabelForNoteIsLocked:](self, "lockOrUnlockAccessibilityLabelForNoteIsLocked:", [v10 isPasswordProtected]);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_1000D223C;
    id v19 = &unk_1006292C0;
    id v20 = self;
    id v21 = v10;
    id v13 = [v11 initWithName:v12 actionHandler:&v16];

    [v5 addObject:v13, v16, v17, v18, v19, v20];
  }
  id v14 = [v5 copy];

  return v14;
}

- (id)galleryViewAcessibilityActionsForNote:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [v4 objectID];
  id v7 = [(ICCollectionView *)self commonAcessibilityActionsForNoteWithObjectID:v6];
  [v5 addObjectsFromArray:v7];

  if ([v4 isDeletable])
  {
    id v8 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v9 = [(ICCollectionView *)self deleteNoteAccessibilityLabel];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000D25E8;
    v31[3] = &unk_1006292C0;
    void v31[4] = self;
    id v32 = v4;
    id v10 = [v8 initWithName:v9 actionHandler:v31];

    [v5 addObject:v10];
  }
  if ([v4 isMovable])
  {
    id v11 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v12 = [(ICCollectionView *)self moveNoteAccessibilityLabel];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000D2674;
    void v29[3] = &unk_1006292C0;
    void v29[4] = self;
    id v30 = v4;
    id v13 = [v11 initWithName:v12 actionHandler:v29];

    [v5 addObject:v13];
  }
  if ([v4 isPinnable])
  {
    id v14 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v15 = -[ICCollectionView pinOrUnpinAccessibilityLabelForNoteIsPinned:](self, "pinOrUnpinAccessibilityLabelForNoteIsPinned:", [v4 isPinned]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000D2700;
    v27[3] = &unk_1006292C0;
    v27[4] = self;
    id v28 = v4;
    id v16 = [v14 initWithName:v15 actionHandler:v27];

    [v5 addObject:v16];
  }
  if ([v4 canBeSharedViaICloud])
  {
    uint64_t v17 = [v4 objectID];
    id v18 = [(ICCollectionView *)self interactionSourceViewForObjectID:v17];

    id v19 = objc_alloc((Class)UIAccessibilityCustomAction);
    id v20 = [(ICCollectionView *)self collaborationAccessibilityLabelForCloudSyncingObject:v4];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D2724;
    v24[3] = &unk_1006292E8;
    void v24[4] = self;
    id v25 = v4;
    id v26 = v18;
    id v21 = v18;
    id v22 = [v19 initWithName:v20 actionHandler:v24];

    [v5 addObject:v22];
  }

  return v5;
}

- (id)interactionSourceViewForObjectID:(id)a3
{
  id v3 = [(ICCollectionView *)self cellForItemIdentifier:a3];
  id v4 = ICProtocolCast();
  uint64_t v5 = [v4 contextMenuInteractionPreview];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v3;
  }
  id v8 = v7;

  return v8;
}

- (id)deleteNoteAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Delete note" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)moveNoteAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Move note" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)sendNoteCopyAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Share button" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)pinOrUnpinAccessibilityLabelForNoteIsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Unpin note";
  }
  else {
    CFStringRef v6 = @"Pin note";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

  return v7;
}

- (id)pinOrUnpinAccessibilityAnnouncementForNoteIsPinned:(BOOL)a3 noteTitle:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  CFStringRef v6 = +[NSBundle mainBundle];
  id v7 = v6;
  if (v4) {
    CFStringRef v8 = @"Pinned note with title, %@";
  }
  else {
    CFStringRef v8 = @"Unpinned note with title, %@";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_10063F3D8 table:0];

  id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v5);

  return v10;
}

- (id)lockOrUnlockAccessibilityLabelForNoteIsLocked:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Remove lock from note";
  }
  else {
    CFStringRef v6 = @"Add lock to note";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

  return v7;
}

- (id)collaborationAccessibilityLabelForCloudSyncingObject:(id)a3
{
  return [a3 shareViaICloudManageActionTitle];
}

- (id)deleteFolderAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Delete folder" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)moveFolderAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Move folder" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)renameFolderAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Rename folder" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)showFolderActivityAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Show Folder Activity" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)removeInvitationAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Remove invitation" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)replyToInvitationAccessibilityLabel
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Reply to invitation" value:&stru_10063F3D8 table:0];

  return v3;
}

- (ICNAViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (ICNAViewController *)WeakRetained;
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  return self->_legacyManagedObjectContext;
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  return self->_modernManagedObjectContext;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (id)optimisticallyAppliedSnapshotHandler
{
  return self->_optimisticallyAppliedSnapshotHandler;
}

- (ICRenameFolderActivity)renameFolderActivity
{
  return self->_renameFolderActivity;
}

- (void)setRenameFolderActivity:(id)a3
{
}

- (ICImportArchiveActivity)importArchiveActivity
{
  return self->_importArchiveActivity;
}

- (void)setImportArchiveActivity:(id)a3
{
}

- (ICLockNoteActivity)lockNoteActivity
{
  return self->_lockNoteActivity;
}

- (void)setLockNoteActivity:(id)a3
{
}

- (ICMoveDecisionController)moveDecisionController
{
  return self->_moveDecisionController;
}

- (void)setMoveDecisionController:(id)a3
{
}

- (ICDragSessionContext)currentDragSessionContext
{
  return self->_currentDragSessionContext;
}

- (void)setCurrentDragSessionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDragSessionContext, 0);
  objc_storeStrong((id *)&self->_moveDecisionController, 0);
  objc_storeStrong((id *)&self->_lockNoteActivity, 0);
  objc_storeStrong((id *)&self->_importArchiveActivity, 0);
  objc_storeStrong((id *)&self->_renameFolderActivity, 0);
  objc_storeStrong(&self->_optimisticallyAppliedSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_storeStrong((id *)&self->_modernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_legacyManagedObjectContext, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end