@interface HomeOutlineCollectionsSectionController
- (BOOL)_dataProviderContainsCollection:(id)a3;
- (BOOL)_isCopyOperationWithDropSession:(id)a3 destinationIndexPath:(id)a4;
- (BOOL)_isMoveOperationWithDropSession:(id)a3 destinationIndexPath:(id)a4;
- (BOOL)_shouldShowAddButtonForItemSnapshots:(id)a3;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)persistsExpansions;
- (BOOL)shouldClearSelectionWithReason:(id)a3;
- (HomeOutlineCollectionsSectionController)initWithConfiguration:(id)a3;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (id)_childItemsInCollection:(id)a3 excludeDeletions:(BOOL)a4;
- (id)_collectionContainingIdentifierPath:(id)a3;
- (id)_collectionContainingIndexPath:(id)a3;
- (id)_contextMenuForCollectionSnapshot:(id)a3;
- (id)_contextMenuForMapItemSnapshot:(id)a3;
- (id)_contextMenuForTransitLineSnapshot:(id)a3;
- (id)_identifierForItem:(id)a3;
- (id)_sortItemForCollection:(id)a3;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)contentInjectorForSnapshot:(id)a3;
- (id)contextMenuForSnapshot:(id)a3;
- (id)shareItemSourceForSnapshot:(id)a3;
- (id)sourceViewForProfileTipPopover;
- (int64_t)_accessoryVisibilityForCollection:(id)a3 withAccessoryType:(int64_t)a4;
- (void)_addMapItemSnapshotToFavorites:(id)a3;
- (void)_addPlacesToCollectionSnapshot:(id)a3;
- (void)_clearPendingCollection;
- (void)_createCollection;
- (void)_deleteCollectionItemSnapshot:(id)a3;
- (void)_deleteCollectionSnapshot:(id)a3;
- (void)_deleteSnapshot:(id)a3;
- (void)_didConfirmDeleteCollection:(id)a3 deletion:(id)a4;
- (void)_duplicateCollection:(id)a3;
- (void)_duplicateCollectionSnapshot:(id)a3;
- (void)_editCollection:(id)a3;
- (void)_editCollectionSnapshot:(id)a3;
- (void)_moveMapItem:(id)a3 fromCollection:(id)a4 toCollection:(id)a5;
- (void)_moveMapItemSnapshot:(id)a3 toCollection:(id)a4;
- (void)_openSnapshot:(id)a3 inNewTab:(BOOL)a4;
- (void)_performCopyWithDropCoordinator:(id)a3;
- (void)_performMoveWithDropCoordinator:(id)a3;
- (void)_performPendingCollectionOperationIfAvailable;
- (void)_removeMapItemSnapshotFromFavorites:(id)a3 shortcut:(id)a4;
- (void)_renameMapItemSnapshot:(id)a3;
- (void)_scrubSortItems;
- (void)_showAndEditCollection:(id)a3;
- (void)_showCollection:(id)a3 completion:(id)a4;
- (void)_waitForCollection:(id)a3 thenPerformOperation:(id)a4;
- (void)collectionSortItem:(id)a3 didSelectSortType:(int64_t)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)didApplyInitialSectionSnapshot;
- (void)editCollection:(id)a3;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)sectionHeaderOutlineCell:(id)a3 accessoryTypeTapped:(int64_t)a4;
- (void)showCollection:(id)a3;
- (void)smallButtonOutlineCellTapped:(id)a3;
- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5;
@end

@implementation HomeOutlineCollectionsSectionController

- (HomeOutlineCollectionsSectionController)initWithConfiguration:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)HomeOutlineCollectionsSectionController;
  v3 = [(HomeOutlineSectionController *)&v23 initWithConfiguration:a3];
  if (v3)
  {
    v4 = objc_alloc_init(CurrentLocationDataProvider);
    currentLocationDataProvider = v3->_currentLocationDataProvider;
    v3->_currentLocationDataProvider = v4;

    v6 = [[CollectionsDataProvider alloc] initWithContext:1 observeInfo:0 observeContents:1];
    collectionsDataProvider = v3->_collectionsDataProvider;
    v3->_collectionsDataProvider = v6;

    v8 = objc_alloc_init(DistanceUnitDataProvider);
    distanceUnitDataProvider = v3->_distanceUnitDataProvider;
    v3->_distanceUnitDataProvider = v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    sortItems = v3->_sortItems;
    v3->_sortItems = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableArray array];
    dropCollectionEditSessions = v3->_dropCollectionEditSessions;
    v3->_dropCollectionEditSessions = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    deleteCollectionEditSessions = v3->_deleteCollectionEditSessions;
    v3->_deleteCollectionEditSessions = (NSMutableArray *)v14;

    uint64_t v16 = +[NSMutableArray array];
    moveCollectionEditSessions = v3->_moveCollectionEditSessions;
    v3->_moveCollectionEditSessions = (NSMutableArray *)v16;

    uint64_t v18 = +[NSMutableArray array];
    duplicateCollectionEditSessions = v3->_duplicateCollectionEditSessions;
    v3->_duplicateCollectionEditSessions = (NSMutableArray *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    shortcutEditSessions = v3->_shortcutEditSessions;
    v3->_shortcutEditSessions = (NSMutableDictionary *)v20;
  }
  return v3;
}

- (NSArray)dataProviders
{
  collectionsDataProvider = self->_collectionsDataProvider;
  v5[0] = self->_currentLocationDataProvider;
  v5[1] = collectionsDataProvider;
  v5[2] = self->_distanceUnitDataProvider;
  v3 = +[NSArray arrayWithObjects:v5 count:3];

  return (NSArray *)v3;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineCollectionsSectionController;
  v4 = (CollectionsDataProvider *)a3;
  [(HomeOutlineSectionController *)&v6 homeDataProvidingObjectDidUpdate:v4];
  collectionsDataProvider = self->_collectionsDataProvider;

  if (collectionsDataProvider == v4) {
    [(HomeOutlineCollectionsSectionController *)self _performPendingCollectionOperationIfAvailable];
  }
}

- (void)didApplyInitialSectionSnapshot
{
  v3.receiver = self;
  v3.super_class = (Class)HomeOutlineCollectionsSectionController;
  [(HomeOutlineSectionController *)&v3 didApplyInitialSectionSnapshot];
  [(HomeOutlineCollectionsSectionController *)self _performPendingCollectionOperationIfAvailable];
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  objc_super v3 = [SectionHeaderAddOutlineCellModel alloc];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"[Proactive Tray] Guides Section" value:@"localized string not found" table:0];
  objc_super v6 = [(SectionHeaderAddOutlineCellModel *)v3 initWithTitle:v5 accessoryDelegate:self];

  return (MapsUIDiffableDataSourceViewModel *)v6;
}

- (NSArray)itemSnapshots
{
  objc_super v3 = [(CurrentLocationDataProvider *)self->_currentLocationDataProvider currentLocation];
  v4 = [(CollectionsDataProvider *)self->_collectionsDataProvider collections];
  int64_t v5 = [(DistanceUnitDataProvider *)self->_distanceUnitDataProvider distanceUnit];
  objc_super v6 = [(HomeOutlineSectionController *)self selectedIdentifierPaths];
  v7 = [(HomeOutlineSectionController *)self configuration];
  v8 = [v7 sectionIdentifier];
  BOOL v9 = [(HomeOutlineSectionController *)self expanded];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100CC3D4C;
  v32[3] = &unk_1012E61D0;
  v32[4] = self;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100CC3D58;
  v27[3] = &unk_1012E61F8;
  id v10 = v6;
  id v28 = v10;
  v29 = self;
  id v11 = v3;
  id v30 = v11;
  int64_t v31 = v5;
  v25[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100CC45C4;
  v26[3] = &unk_1012E6220;
  v26[4] = self;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100CC4644;
  v25[3] = &unk_1012E6248;
  uint64_t v12 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v4 sectionIdentifier:v8 sectionExpanded:v9 itemIdentifierBlock:v32 viewModelBlock:v27 childItemsBlock:v26 expandedBlock:v25];

  if ([(HomeOutlineCollectionsSectionController *)self _shouldShowAddButtonForItemSnapshots:v12])
  {
    v13 = +[NSBundle mainBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"[Proactive Tray] Add Guide" value:@"localized string not found" table:0];

    v15 = [SmallButtonOutlineCellModel alloc];
    uint64_t v16 = +[UIImage systemImageNamed:@"plus.circle"];
    v17 = +[UIImage systemImageNamed:@"plus.circle.fill"];
    uint64_t v18 = [(SmallButtonOutlineCellModel *)v15 initWithStyle:1 title:v14 image:v16 hoverImage:v17 delegate:self];

    v19 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
    uint64_t v20 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    v21 = [v20 identifierPathByAppendingIdentifier:@"AddButtonIdentifier"];
    v22 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v19 initWithIdentifierPath:v21 viewModel:v18 childSnapshots:&__NSArray0__struct expanded:0];

    uint64_t v23 = [v12 arrayByAddingObject:v22];

    uint64_t v12 = (void *)v23;
  }
  [(HomeOutlineCollectionsSectionController *)self _scrubSortItems];

  return (NSArray *)v12;
}

- (int64_t)_accessoryVisibilityForCollection:(id)a3 withAccessoryType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 1) {
    return 0;
  }
  editingCollection = self->_editingCollection;
  if (editingCollection == a3) {
    return 0;
  }
  else {
    return [a3 isEqual:editingCollection v4, v5] ^ 1;
  }
}

- (id)contentInjectorForSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v4 viewModel];
  v8 = v7;
  if ((isKindOfClass & 1) != 0 && v5)
  {
    BOOL v9 = [v7 collection];
    id v10 = 0;
  }
  else
  {
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    BOOL v9 = 0;
    if ((v11 & 1) == 0)
    {
      id v10 = 0;
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    id v10 = 0;
    uint64_t v12 = 0;
    if (!v8) {
      goto LABEL_11;
    }
    v13 = [v4 identifierPath];
    BOOL v9 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v13];

    v8 = [v4 viewModel];
    id v10 = [v8 mapItem];
  }

  if (v9)
  {
    uint64_t v12 = [[HomeCollectionContentInjector alloc] initWithCollection:v9 selectedMapItem:v10];
    uint64_t v14 = [(HomeOutlineSectionController *)self configuration];
    v15 = [v14 actionCoordinator];
    [(HomeCollectionContentInjector *)v12 setActionCoordinator:v15];
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_11:

  return v12;
}

- (id)shareItemSourceForSnapshot:(id)a3
{
  id v4 = [a3 identifierPath];
  uint64_t v5 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v4];

  if (v5) {
    objc_super v6 = [[PersonalCollectionShareItemSource alloc] initWithCollectionHandlerInfo:v5];
  }
  else {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)showCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CC4A10;
  v6[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HomeOutlineCollectionsSectionController *)self _waitForCollection:v5 thenPerformOperation:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)editCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CC4B50;
  v6[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HomeOutlineCollectionsSectionController *)self _waitForCollection:v5 thenPerformOperation:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)sourceViewForProfileTipPopover
{
  objc_super v3 = [(HomeOutlineSectionController *)self delegate];
  id v4 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  id v5 = [v3 sectionController:self indexPathForIdentifierPath:v4];

  objc_super v6 = [(HomeOutlineSectionController *)self configuration];
  id v7 = [v6 collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v5];

  if (v8)
  {
    BOOL v9 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    [(HomeOutlineSectionController *)self expandElementAtIdentifierPath:v9];

    id v10 = v8;
  }

  return v8;
}

- (BOOL)shouldClearSelectionWithReason:(id)a3
{
  return (char *)[a3 action] - 3 < (char *)0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (void)_clearPendingCollection
{
  pendingCollection = self->_pendingCollection;
  self->_pendingCollection = 0;

  id pendingCollectionOperation = self->_pendingCollectionOperation;
  self->_id pendingCollectionOperation = 0;

  [(NSTimer *)self->_pendingCollectionTimer invalidate];
  pendingCollectionTimer = self->_pendingCollectionTimer;
  self->_pendingCollectionTimer = 0;
}

- (void)_waitForCollection:(id)a3 thenPerformOperation:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  if (-[HomeOutlineCollectionsSectionController _dataProviderContainsCollection:](self, "_dataProviderContainsCollection:", v7)&& (-[HomeOutlineSectionController delegate](self, "delegate"), BOOL v9 = [(HomeOutlineCollectionsSectionController *)self _clearPendingCollection];
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_pendingCollection, a3);
    char v11 = objc_retainBlock(v8);
    id pendingCollectionOperation = self->_pendingCollectionOperation;
    self->_id pendingCollectionOperation = v11;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100CC4ECC;
    v15[3] = &unk_101320DB8;
    id v16 = v7;
    objc_copyWeak(&v17, &location);
    v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v15 block:10.0];
    pendingCollectionTimer = self->_pendingCollectionTimer;
    self->_pendingCollectionTimer = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_performPendingCollectionOperationIfAvailable
{
  if (self->_pendingCollection)
  {
    if (-[HomeOutlineCollectionsSectionController _dataProviderContainsCollection:](self, "_dataProviderContainsCollection:"))
    {
      objc_super v3 = [(HomeOutlineSectionController *)self delegate];
      unsigned int v4 = [v3 applySnapshotIfNeededWithSectionController:self];

      if (v4)
      {
        id v6 = objc_retainBlock(self->_pendingCollectionOperation);
        [(HomeOutlineCollectionsSectionController *)self _clearPendingCollection];
        id v5 = v6;
        if (v6)
        {
          (*((void (**)(id))v6 + 2))(v6);
          id v5 = v6;
        }
      }
    }
  }
}

- (void)_showCollection:(id)a3 completion:(id)a4
{
  id v14 = a4;
  id v6 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:a3];
  if (v6)
  {
    id v7 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    id v8 = [v7 identifierPathByAppendingIdentifier:v6];

    BOOL v9 = [(HomeOutlineSectionController *)self sectionSnapshot];
    unsigned int v10 = [v8 identifierPathByRemovingFirstIdentifier];
    char v11 = [v9 nodeSnapshotAtIdentifierPath:v10];

    if (v11)
    {
      uint64_t v12 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
      [(HomeOutlineSectionController *)self expandElementAtIdentifierPath:v12];

      [(HomeOutlineSectionController *)self expandElementAtIdentifierPath:v8];
      v13 = [(HomeOutlineSectionController *)self delegate];
      [v13 sectionController:self selectItemAtIdentifierPath:v8 completion:v14];
    }
  }
}

- (void)_showAndEditCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CC5268;
  v6[3] = &unk_1012E5D30;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HomeOutlineCollectionsSectionController *)self _showCollection:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_editCollection:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_editingCollection, a3);
  id v5 = [(HomeOutlineSectionController *)self delegate];
  [v5 sectionController:self setNeedsApplySnapshotAnimated:1];

  id v6 = [(HomeOutlineSectionController *)self delegate];
  [v6 applySnapshotIfNeededWithSectionController:self];

  editingCollection = self->_editingCollection;
  self->_editingCollection = 0;

  id v8 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:v11];
  if (v8)
  {
    BOOL v9 = [(HomeOutlineSectionController *)self sectionSnapshot];
    unsigned int v10 = [v9 childSnapshotWithIdentifier:v8];

    if (v10) {
      [(HomeOutlineCollectionsSectionController *)self _editCollectionSnapshot:v10];
    }
  }
}

- (void)_editCollectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 collection];
  if (v8)
  {
    BOOL v9 = [(HomeOutlineSectionController *)self delegate];
    unsigned int v10 = [v4 identifierPath];
    id v11 = [v9 sectionController:self indexPathForIdentifierPath:v10];

    if (v11)
    {
      uint64_t v12 = [(HomeOutlineSectionController *)self configuration];
      v13 = [v12 collectionView];
      id v14 = [v13 cellForItemAtIndexPath:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      if (v16)
      {
        id v17 = [v16 trailingAccessoryConfigurations];
        uint64_t v18 = [v17 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        if (v20)
        {
          objc_storeStrong((id *)&self->_editingCollection, v8);
          v21 = [(HomeOutlineSectionController *)self delegate];
          [v21 sectionController:self setNeedsApplySnapshotAnimated:1];

          objc_initWeak(&location, self);
          v36 = [(HomeOutlineSectionController *)self configuration];
          v35 = [v36 actionCoordinator];
          v22 = [(HomeOutlineSectionController *)self configuration];
          uint64_t v23 = [v22 homeActionDelegate];
          v34 = [v23 homeContaineeViewController];
          v33 = [v20 customView];
          v24 = [v20 customView];
          [v24 bounds];
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100CC5738;
          v37[3] = &unk_1012E6690;
          objc_copyWeak(&v39, &location);
          id v38 = v8;
          [v35 viewController:v34 editCollection:v38 sourceView:v33 sourceRect:v37 completion:v26, v28, v30, v32];

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

- (BOOL)_dataProviderContainsCollection:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CollectionsDataProvider *)self->_collectionsDataProvider collections];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * i) == v4
          || (objc_msgSend(v4, "isEqual:") & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)_identifierForItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine];
  id v6 = [(HomeOutlineSectionController *)self identifierCache];
  if (v5)
  {
    uint64_t v7 = MKMapItemIdentifierFromGEOTransitLine();

    id v4 = (id)v7;
  }
  uint64_t v8 = [v6 identifierForObject:v4];

  return v8;
}

- (id)_childItemsInCollection:(id)a3 excludeDeletions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 content];
  id v8 = [v7 count];

  if (v8)
  {
    BOOL v9 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    uint64_t v10 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:v6];
    id v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = &stru_101324E70;
    }
    long long v13 = [v9 identifierPathByAppendingIdentifier:v12];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v14 = [v6 content];
    id v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v15)
    {
      id v16 = v15;
      BOOL v42 = v4;
      id v17 = v14;
      v41 = v6;
      uint64_t v18 = *(void *)v49;
      id v19 = &__NSArray0__struct;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = -[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", *(void *)(*((void *)&v48 + 1) + 8 * i), v41);
          v22 = (void *)v21;
          if (v21) {
            CFStringRef v23 = (const __CFString *)v21;
          }
          else {
            CFStringRef v23 = &stru_101324E70;
          }
          v24 = [v13 identifierPathByAppendingIdentifier:v23];

          double v25 = [(HomeOutlineSectionController *)self deletions];
          double v26 = [v25 objectForKeyedSubscript:v24];

          if (!v26)
          {

            id v6 = v41;
            double v27 = [(HomeOutlineCollectionsSectionController *)self _sortItemForCollection:v41];
            long long v14 = +[NSMutableArray arrayWithObject:v27];

            if (v42)
            {
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              double v28 = [v41 content];
              id v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
              if (v29)
              {
                id v30 = v29;
                v43 = v14;
                uint64_t v31 = *(void *)v45;
                do
                {
                  for (j = 0; j != v30; j = (char *)j + 1)
                  {
                    if (*(void *)v45 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
                    uint64_t v34 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:v33];
                    v35 = (void *)v34;
                    if (v34) {
                      CFStringRef v36 = (const __CFString *)v34;
                    }
                    else {
                      CFStringRef v36 = &stru_101324E70;
                    }
                    v37 = [v13 identifierPathByAppendingIdentifier:v36];

                    id v38 = [(HomeOutlineSectionController *)self deletions];
                    id v39 = [v38 objectForKeyedSubscript:v37];

                    if (!v39) {
                      [v43 addObject:v33];
                    }
                  }
                  id v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
                }
                while (v30);
                id v6 = v41;
                long long v14 = v43;
              }
            }
            else
            {
              double v28 = [v41 content];
              [v14 addObjectsFromArray:v28];
            }

            id v19 = [v14 copy];
            goto LABEL_35;
          }
        }
        id v16 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v6 = v41;
      long long v14 = v17;
    }
    else
    {
      id v19 = &__NSArray0__struct;
    }
LABEL_35:
  }
  else
  {
    id v19 = &__NSArray0__struct;
  }

  return v19;
}

- (BOOL)_shouldShowAddButtonForItemSnapshots:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(HomeOutlineSectionController *)self deletions];
        id v11 = [v9 identifierPath];
        CFStringRef v12 = [v10 objectForKeyedSubscript:v11];

        if (!v12)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)_sortItemForCollection:(id)a3
{
  id v4 = a3;
  sortItems = self->_sortItems;
  id v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)sortItems objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = [[HomeCollectionSortItem alloc] initWithCollection:v4 delegate:self];
    id v8 = self->_sortItems;
    BOOL v9 = [v4 identifier];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (void)_scrubSortItems
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(CollectionsDataProvider *)self->_collectionsDataProvider collections];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        sortItems = self->_sortItems;
        id v11 = [v9 identifier];
        CFStringRef v12 = [(NSMutableDictionary *)sortItems objectForKeyedSubscript:v11];
        BOOL v13 = [v9 identifier];
        [(NSMutableDictionary *)v3 setObject:v12 forKeyedSubscript:v13];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v14 = self->_sortItems;
  self->_sortItems = v3;
}

- (void)collectionSortItem:(id)a3 didSelectSortType:(int64_t)a4
{
  collectionsDataProvider = self->_collectionsDataProvider;
  id v7 = a3;
  [(CollectionsDataProvider *)collectionsDataProvider setActive:0];
  id v8 = [v7 collection];

  [v8 setSortType:a4];
  [(CollectionsDataProvider *)self->_collectionsDataProvider setActive:1];
  id v9 = [(HomeOutlineSectionController *)self delegate];
  [v9 sectionController:self setNeedsApplySnapshotAnimated:0];
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v5)
  {
    uint64_t v7 = [(HomeOutlineCollectionsSectionController *)self _contextMenuForCollectionSnapshot:v4];
LABEL_10:
    CFStringRef v12 = (void *)v7;
    goto LABEL_11;
  }
  id v8 = [v4 viewModel];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0 && v8)
  {
    uint64_t v7 = [(HomeOutlineCollectionsSectionController *)self _contextMenuForMapItemSnapshot:v4];
    goto LABEL_10;
  }
  uint64_t v10 = [v4 viewModel];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  CFStringRef v12 = 0;
  if ((v11 & 1) != 0 && v10)
  {
    uint64_t v7 = [(HomeOutlineCollectionsSectionController *)self _contextMenuForTransitLineSnapshot:v4];
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)_contextMenuForCollectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 collection];
  char v9 = v8;
  if (v8
    && ([v8 identifier],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isEqualToString:@"__internal_CollectionSavedLinesIdentifier"],
        v10,
        (v11 & 1) == 0))
  {
    uint64_t v33 = +[NSMutableArray array];
    objc_initWeak(&location, self);
    if (![v9 handlerType])
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100CC6A38;
      v49[3] = &unk_1012E6690;
      objc_copyWeak(&v51, &location);
      id v50 = v4;
      BOOL v13 = HomeEditCollectionAction(v49);
      v57 = v13;
      long long v14 = +[NSArray arrayWithObjects:&v57 count:1];
      long long v15 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v14];

      [v33 addObject:v15];
      objc_destroyWeak(&v51);
    }
    if (![v9 handlerType])
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100CC6A88;
      v46[3] = &unk_1012E6690;
      objc_copyWeak(&v48, &location);
      id v47 = v4;
      long long v16 = HomeAddToCollectionAction(v46);
      v56 = v16;
      long long v17 = +[NSArray arrayWithObjects:&v56 count:1];
      long long v18 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v17];

      [v33 addObject:v18];
      objc_destroyWeak(&v48);
    }
    if (![v9 handlerType])
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100CC6AD8;
      v43[3] = &unk_1012E6690;
      objc_copyWeak(&v45, &location);
      id v44 = v4;
      id v19 = HomeDuplicateCollectionAction(v43);
      v55 = v19;
      id v20 = +[NSArray arrayWithObjects:&v55 count:1];
      uint64_t v21 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v20];

      [v33 addObject:v21];
      objc_destroyWeak(&v45);
    }
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100CC6B28;
    v40[3] = &unk_1012E6690;
    objc_copyWeak(&v42, &location);
    id v22 = v4;
    id v41 = v22;
    double v32 = HomeOpenInNewTabAction(v40);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100CC6B7C;
    v37[3] = &unk_1012E6690;
    objc_copyWeak(&v39, &location);
    id v23 = v22;
    id v38 = v23;
    v24 = HomeOpenInNewWindowAction(v37);
    v54[0] = v32;
    v54[1] = v24;
    double v25 = +[NSArray arrayWithObjects:v54 count:2];
    double v26 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v25];

    [v33 addObject:v26];
    double v27 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:0];
    [v33 addObject:v27];
    if ([v9 canDelete])
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100CC6BD0;
      v34[3] = &unk_1012E6690;
      objc_copyWeak(&v36, &location);
      id v35 = v23;
      double v28 = HomeDeleteCollectionAction(v34);
      v53 = v28;
      id v29 = +[NSArray arrayWithObjects:&v53 count:1];
      id v30 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v29];

      [v33 addObject:v30];
      objc_destroyWeak(&v36);
    }
    CFStringRef v12 = +[UIMenu menuWithTitle:&stru_101324E70 children:v33];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  else
  {
    CFStringRef v12 = 0;
  }

  return v12;
}

- (id)_contextMenuForMapItemSnapshot:(id)a3
{
  id v55 = a3;
  id v4 = [v55 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v50 = v6;
  id v51 = [v6 mapItem];
  if (v51)
  {
    v52 = +[NSMutableArray array];
    objc_initWeak(&location, self);
    id v7 = +[CollectionManager sharedManager];
    id v8 = [v7 collectionsNotContainingMapItem:v51];

    v54 = +[NSMutableArray array];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v81;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v81 != v10) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v12 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v13 = [v12 title];
          long long v14 = (void *)v13;
          if (v13) {
            CFStringRef v15 = (const __CFString *)v13;
          }
          else {
            CFStringRef v15 = &stru_101324E70;
          }
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_100CC76B4;
          v76[3] = &unk_101320DE0;
          objc_copyWeak(&v79, &location);
          id v77 = v55;
          v78 = v12;
          long long v16 = +[UIAction actionWithTitle:v15 image:0 identifier:0 handler:v76];

          [v54 addObject:v16];
          objc_destroyWeak(&v79);
        }
        id v9 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v9);
    }

    long long v17 = +[NSBundle mainBundle];
    long long v49 = [v17 localizedStringForKey:@"[Maps Home] New Guide" value:@"localized string not found" table:0];

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100CC7704;
    v73[3] = &unk_1012E6368;
    objc_copyWeak(&v75, &location);
    id v18 = v55;
    id v74 = v18;
    v43 = +[UIAction actionWithTitle:v49 image:0 identifier:0 handler:v73];
    v89 = v43;
    id v19 = +[NSArray arrayWithObjects:&v89 count:1];
    id v48 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v19];

    [v54 addObject:v48];
    id v20 = +[NSBundle mainBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"[Maps Home] Move to" value:@"localized string not found" table:0];
    id v47 = +[UIMenu menuWithTitle:v21 children:v54];

    [v52 addObject:v47];
    if (objc_msgSend(v51, "_maps_canRenameCollectionItem"))
    {
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100CC77D8;
      v70[3] = &unk_1012E6690;
      objc_copyWeak(&v72, &location);
      id v71 = v18;
      id v22 = HomeRenameCollectionMapItemAction(v70);
      v88 = v22;
      id v23 = +[NSArray arrayWithObjects:&v88 count:1];
      v24 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v23];

      [v52 addObject:v24];
      objc_destroyWeak(&v72);
    }
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100CC7828;
    v67[3] = &unk_1012E6690;
    objc_copyWeak(&v69, &location);
    id v25 = v18;
    id v68 = v25;
    long long v46 = HomeOpenInNewTabAction(v67);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100CC787C;
    v64[3] = &unk_1012E6690;
    objc_copyWeak(&v66, &location);
    id v26 = v25;
    id v65 = v26;
    uint64_t v27 = HomeOpenInNewWindowAction(v64);
    v87[0] = v46;
    id v42 = (void *)v27;
    v87[1] = v27;
    double v28 = +[NSArray arrayWithObjects:v87 count:2];
    id v45 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v28];

    [v52 addObject:v45];
    id v29 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:0];
    [v52 addObject:v29];
    id v30 = +[ShortcutManager sharedManager];
    id v44 = [v30 meCard];

    uint64_t v31 = [v44 _maps_shortcutForMapItem:v51];
    if (v31)
    {
      double v32 = v59;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100CC7920;
      v59[3] = &unk_1012E9340;
      uint64_t v33 = &v61;
      objc_copyWeak(&v61, &location);
      v59[4] = v26;
      id v60 = v31;
      uint64_t v34 = HomeRemoveFromFavoritesAction(v59);
    }
    else
    {
      double v32 = v62;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100CC78D0;
      v62[3] = &unk_1012E6690;
      uint64_t v33 = &v63;
      objc_copyWeak(&v63, &location);
      v62[4] = v26;
      uint64_t v34 = HomeAddToFavoritesAction(v62);
    }

    objc_destroyWeak(v33);
    v86 = v34;
    id v36 = +[NSArray arrayWithObjects:&v86 count:1];
    v37 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v36];

    [v52 addObject:v37];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100CC7970;
    v56[3] = &unk_1012E6690;
    objc_copyWeak(&v58, &location);
    id v57 = v26;
    id v38 = HomeRemoveFromCollectionAction(v56);
    v85 = v38;
    id v39 = +[NSArray arrayWithObjects:&v85 count:1];
    v40 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v39];

    [v52 addObject:v40];
    id v35 = +[UIMenu menuWithTitle:&stru_101324E70 children:v52];

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v66);

    objc_destroyWeak(&v69);
    objc_destroyWeak(&v75);

    objc_destroyWeak(&location);
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (id)_contextMenuForTransitLineSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100CC7D30;
  v24[3] = &unk_1012E6690;
  objc_copyWeak(&v26, &location);
  id v6 = v4;
  id v25 = v6;
  long long v17 = HomeOpenInNewTabAction(v24);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100CC7D84;
  v21[3] = &unk_1012E6690;
  objc_copyWeak(&v23, &location);
  id v7 = v6;
  id v22 = v7;
  id v8 = HomeOpenInNewWindowAction(v21);
  v29[0] = v17;
  v29[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v29 count:2];
  uint64_t v10 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v9];

  [v5 addObject:v10];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100CC7DD8;
  v18[3] = &unk_1012E6690;
  objc_copyWeak(&v20, &location);
  id v11 = v7;
  id v19 = v11;
  CFStringRef v12 = HomeRemoveFromCollectionAction(v18);
  double v28 = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:&v28 count:1];
  long long v14 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v13];

  [v5 addObject:v14];
  CFStringRef v15 = +[UIMenu menuWithTitle:&stru_101324E70 children:v5];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v15;
}

- (void)_addPlacesToCollectionSnapshot:(id)a3
{
  id v4 = [a3 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v13 = [v6 collection];

  if (v13)
  {
    id v7 = [(CollectionEditSession *)[CollectionSaveSession alloc] initWithCollection:v13];
    id v8 = [(HomeOutlineSectionController *)self configuration];
    id v9 = [v8 actionCoordinator];
    uint64_t v10 = [(HomeOutlineSectionController *)self configuration];
    id v11 = [v10 homeActionDelegate];
    CFStringRef v12 = [v11 homeContaineeViewController];
    [v9 viewController:v12 addItemsFromACToCollection:v7];
  }
}

- (void)_duplicateCollectionSnapshot:(id)a3
{
  id v4 = [a3 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v8 = [v6 collection];

  id v7 = v8;
  if (v8)
  {
    [(HomeOutlineCollectionsSectionController *)self _duplicateCollection:v8];
    id v7 = v8;
  }
}

- (void)_moveMapItemSnapshot:(id)a3 toCollection:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [v6 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 mapItem];

  id v11 = [v6 identifierPath];

  CFStringRef v12 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v11];

  if (v10) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    [(HomeOutlineCollectionsSectionController *)self _moveMapItem:v10 fromCollection:v12 toCollection:v14];
  }
}

- (void)_renameMapItemSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 mapItem];

  id v9 = [v4 identifierPath];

  uint64_t v10 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v9];

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFStringRef v12 = [(HomeOutlineSectionController *)self configuration];
    BOOL v13 = [v12 actionCoordinator];
    id v14 = [(HomeOutlineSectionController *)self configuration];
    CFStringRef v15 = [v14 homeActionDelegate];
    long long v16 = [v15 homeContaineeViewController];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100CC82A0;
    v17[3] = &unk_1012EE6E0;
    id v18 = v10;
    id v19 = v8;
    [v13 viewController:v16 editNameOfMapItem:v19 saveHandler:v17 cancelHandler:0];
  }
}

- (void)_addMapItemSnapshotToFavorites:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 mapItem];
  if (v8)
  {
    id v9 = [v4 identifierPath];
    uint64_t v10 = [v9 lastIdentifier];

    BOOL v11 = [(NSMutableDictionary *)self->_shortcutEditSessions objectForKeyedSubscript:v10];

    if (!v11)
    {
      CFStringRef v12 = +[ShortcutEditSession addSessionWithType:1 mapItem:v8];
      [(NSMutableDictionary *)self->_shortcutEditSessions setObject:v12 forKeyedSubscript:v10];
      objc_initWeak(&location, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100CC8528;
      v13[3] = &unk_1012E5D30;
      objc_copyWeak(&v15, &location);
      id v14 = v10;
      [v12 saveWithCompletion:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_removeMapItemSnapshotFromFavorites:(id)a3 shortcut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  BOOL v11 = [v10 mapItem];
  if (v11)
  {
    CFStringRef v12 = [v6 identifierPath];
    BOOL v13 = [v12 lastIdentifier];

    shortcutEditSessions = self->_shortcutEditSessions;
    id v15 = [v6 identifierPath];
    long long v16 = [v15 lastIdentifier];
    long long v17 = [(NSMutableDictionary *)shortcutEditSessions objectForKeyedSubscript:v16];

    if (!v17)
    {
      id v18 = +[ShortcutEditSession editSessionWithShortcut:v7];
      [(NSMutableDictionary *)self->_shortcutEditSessions setObject:v18 forKeyedSubscript:v13];
      objc_initWeak(&location, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100CC87D0;
      v19[3] = &unk_1012E5D30;
      objc_copyWeak(&v21, &location);
      id v20 = v13;
      [v18 removeFromShortcutsWithCompletion:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_openSnapshot:(id)a3 inNewTab:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  id v7 = [v5 identifierPath];

  id v8 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v7];

  id v9 = [v8 handlerType];
  if (v9)
  {
    if (v9 != (id)4)
    {
      id v10 = 0;
      goto LABEL_9;
    }
    id v10 = [objc_alloc((Class)NSUserActivity) initWithActivityType:NSUserActivityTypeBrowsingWeb];
    BOOL v11 = [v8 sharingURL];
    [v10 setWebpageURL:v11];
  }
  else
  {
    id v10 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.NewWindow"];
    CFStringRef v12 = [(HomeOutlineSectionController *)self configuration];
    BOOL v13 = [v12 homeActionDelegate];
    id v14 = [v13 homeContaineeViewController];
    id v15 = [v14 _maps_mapsSceneDelegate];
    BOOL v11 = [v15 mapsActivityWithFidelity:2];

    long long v16 = [v8 identifier];
    [v11 setUserCreatedCollectionID:v16];

    long long v17 = [v11 data];
    id v18 = [v17 bzip2CompressedData];

    if (v18)
    {
      CFStringRef v25 = @"bs";
      id v26 = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v10 setUserInfo:v19];
    }
  }

LABEL_9:
  [v10 setEligibleForHandoff:0];
  id v20 = [(HomeOutlineSectionController *)self configuration];
  id v21 = [v20 homeActionDelegate];
  id v22 = [v21 homeContaineeViewController];
  id v23 = [v22 _maps_uiScene];
  [v6 setRequestingScene:v23];

  v24 = +[UIApplication sharedApplication];
  [v24 requestSceneSessionActivation:0 userActivity:v10 options:v6 errorHandler:0];
}

- (void)_moveMapItem:(id)a3 fromCollection:(id)a4 toCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v8)
    {
      if (v10)
      {
        if ([v10 contentType] == (id)1)
        {
          unsigned __int8 v12 = [v11 containsItem:v8];
          if (v11 != v9 && (v12 & 1) == 0 && ([v11 isEqual:v9] & 1) == 0)
          {
            BOOL v13 = [(CollectionEditSession *)[CollectionAddOrRemoveSession alloc] initWithCollection:v11];
            id v14 = [(CollectionEditSession *)[CollectionAddOrRemoveSession alloc] initWithCollection:v9];
            [(CollectionEditSession *)v13 addSelectedObject:v8];
            [(CollectionEditSession *)v14 addSelectedObject:v8];
            objc_initWeak(&location, self);
            [(NSMutableArray *)self->_moveCollectionEditSessions addObject:v13];
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_100CC8D18;
            v17[3] = &unk_101320E28;
            objc_copyWeak(&v22, &location);
            id v18 = v11;
            id v15 = v14;
            id v19 = v15;
            id v20 = v9;
            long long v16 = v13;
            id v21 = v16;
            [(CollectionAddOrRemoveSession *)v16 applyToCollection:v18 completion:v17];

            objc_destroyWeak(&v22);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

- (void)_duplicateCollection:(id)a3
{
  id v4 = a3;
  if ([v4 contentType] == (id)1 && !objc_msgSend(v4, "handlerType"))
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"[Maps Home] Duplicated Collection Name" value:@"localized string not found" table:0];
    uint64_t v7 = [v4 title];
    id v8 = (void *)v7;
    CFStringRef v9 = &stru_101324E70;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v9);

    id v11 = +[CollectionHandler collection];
    [v11 updateTitle:v10];
    unsigned __int8 v12 = [(CollectionEditSession *)[CollectionAddOrRemoveSession alloc] initWithCollection:v4];
    BOOL v13 = [v4 content];
    [(CollectionEditSession *)v12 addSelectedObjects:v13];

    objc_initWeak(&location, self);
    [(NSMutableArray *)self->_duplicateCollectionEditSessions addObject:v12];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100CC9230;
    v15[3] = &unk_1012F6B00;
    objc_copyWeak(&v18, &location);
    id v16 = v4;
    id v14 = v12;
    long long v17 = v14;
    [(CollectionAddOrRemoveSession *)v14 applyToCollection:v11 completion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)_createCollection
{
  objc_super v3 = +[CollectionHandler collection];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"[Collections] New Guide" value:@"localized string not found" table:0];

  [v3 updateTitle:v5];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100CC9490;
  v7[3] = &unk_1012EB690;
  objc_copyWeak(&v9, &location);
  id v6 = v3;
  id v8 = v6;
  [v6 createCollection:v7];
  +[GEOAPPortal captureUserAction:2072 target:8 value:0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sectionHeaderOutlineCell:(id)a3 accessoryTypeTapped:(int64_t)a4
{
  if (a4 == 2) {
    [(HomeOutlineCollectionsSectionController *)self _createCollection];
  }
}

- (void)smallButtonOutlineCellTapped:(id)a3
{
}

- (BOOL)_isMoveOperationWithDropSession:(id)a3 destinationIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 items];
  id v9 = [v8 firstObject];
  id v10 = [v9 localObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    BOOL v13 = [(HomeOutlineSectionController *)self mapItemForDropSession:v6];
    id v14 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIndexPath:v7];
    long long v17 = [v12 itemSnapshot];
    id v15 = [v17 identifierPath];
    id v16 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v15];

    LOBYTE(v17) = 0;
    if (v13 && v14 && v16)
    {
      if ([v14 contentType] == (id)1)
      {
        LOBYTE(v17) = 0;
        if (([v14 containsItem:v13] & 1) == 0 && v14 != v16) {
          LODWORD(v17) = [v14 isEqual:v16] ^ 1;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return (char)v17;
}

- (void)_performMoveWithDropCoordinator:(id)a3
{
  id v17 = a3;
  id v4 = [v17 items];
  id v5 = [v4 firstObject];
  id v6 = [v5 dragItem];
  id v7 = [v6 localObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v17 session];
    id v11 = [(HomeOutlineSectionController *)self mapItemForDropSession:v10];

    id v12 = [v17 destinationIndexPath];
    BOOL v13 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIndexPath:v12];

    id v14 = [v9 itemSnapshot];
    id v15 = [v14 identifierPath];
    id v16 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v15];

    [(HomeOutlineCollectionsSectionController *)self _moveMapItem:v11 fromCollection:v16 toCollection:v13];
  }
}

- (BOOL)_isCopyOperationWithDropSession:(id)a3 destinationIndexPath:(id)a4
{
  id v8 = a4;
  id v6 = [(HomeOutlineSectionController *)self mapItemForDropSession:a3];
  id v7 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIndexPath:v8];

  LOBYTE(v8) = 0;
  if (v6 && v7)
  {
    if ([v7 contentType] == (id)1) {
      LODWORD(v8) = [v7 containsItem:v6] ^ 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

- (void)_performCopyWithDropCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [v4 session];
  id v6 = [(HomeOutlineSectionController *)self mapItemForDropSession:v5];

  id v7 = [v4 destinationIndexPath];
  id v8 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIndexPath:v7];

  if (v6
    && v8
    && [v8 contentType] == (id)1
    && ([v8 containsItem:v6] & 1) == 0)
  {
    id v9 = [(CollectionEditSession *)[CollectionAddOrRemoveSession alloc] initWithCollection:v8];
    [(CollectionEditSession *)v9 addSelectedObject:v6];
    [(NSMutableArray *)self->_dropCollectionEditSessions addObject:v9];
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100CC9ACC;
    v11[3] = &unk_1012F6B00;
    objc_copyWeak(&v14, &location);
    id v12 = v8;
    id v10 = v9;
    BOOL v13 = v10;
    [(CollectionAddOrRemoveSession *)v10 applyToCollection:v12 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (id)_collectionContainingIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HomeOutlineSectionController *)self delegate];
    id v6 = [v5 sectionController:self nodeSnapshotAtIndexPath:v4];

    if (v6)
    {
      id v7 = [v6 identifierPath];
      id v8 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_collectionContainingIdentifierPath:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    id v6 = [v4 identifiers];
    id v7 = [v6 objectAtIndexedSubscript:1];

    id v8 = [(HomeOutlineSectionController *)self sectionSnapshot];
    id v9 = [v8 childSnapshotWithIdentifier:v7];

    id v10 = [v9 viewModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    id v5 = [v12 collection];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_deleteSnapshot:(id)a3
{
  id v12 = a3;
  id v4 = [(HomeOutlineSectionController *)self deletions];
  id v5 = [v12 identifierPath];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = v12;
  if (!v6)
  {
    id v8 = [v12 viewModel];
    unsigned int v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___HomeCollectionItemCellModel];

    if (v8 && v9)
    {
      [(HomeOutlineCollectionsSectionController *)self _deleteCollectionItemSnapshot:v12];
LABEL_8:
      id v7 = v12;
      goto LABEL_9;
    }
    id v10 = [v12 viewModel];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v7 = v12;
    if ((isKindOfClass & 1) != 0 && v10)
    {
      [(HomeOutlineCollectionsSectionController *)self _deleteCollectionSnapshot:v12];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)_deleteCollectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 collection];
  if (v8)
  {
    unsigned int v9 = [(HomeOutlineSectionController *)self deletionWithSnapshot:v4];
    objc_initWeak(&location, self);
    id v10 = [(HomeOutlineSectionController *)self configuration];
    id v11 = [v10 actionCoordinator];
    id v19 = v8;
    id v12 = +[NSArray arrayWithObjects:&v19 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100CCA0B8;
    v14[3] = &unk_1012EA2C0;
    objc_copyWeak(&v17, &location);
    id v15 = v8;
    id v13 = v9;
    id v16 = v13;
    [v11 viewController:0 confirmDeleteCollections:v12 sourceView:0 sourceRect:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_didConfirmDeleteCollection:(id)a3 deletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v14 = v7;
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  [(HomeOutlineSectionController *)self beginDeletions:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100CCA274;
  v10[3] = &unk_1012EB690;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v6 deleteCollection:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_deleteCollectionItemSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifierPath];
  id v6 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIdentifierPath:v5];

  id v7 = [v4 viewModel];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___HomeCollectionItemCellModel]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 homeCollectionItem];
  id v11 = (void *)v10;
  if (v6 && v10)
  {
    id v12 = [(HomeOutlineSectionController *)self deletionWithSnapshot:v4];
    id v13 = [(CollectionEditSession *)[CollectionAddOrRemoveSession alloc] initWithCollection:v6];
    [(CollectionEditSession *)v13 addSelectedObject:v11];
    [(NSMutableArray *)self->_deleteCollectionEditSessions addObject:v13];
    objc_initWeak(&location, self);
    id v23 = v12;
    id v14 = +[NSArray arrayWithObjects:&v23 count:1];
    [(HomeOutlineSectionController *)self beginDeletions:v14];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100CCA580;
    v17[3] = &unk_101312A50;
    objc_copyWeak(&v21, &location);
    id v18 = v6;
    id v15 = v12;
    id v19 = v15;
    id v16 = v13;
    id v20 = v16;
    [(CollectionAddOrRemoveSession *)v16 applyToCollection:v18 completion:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeOutlineSectionController *)self delegate];
  id v9 = [v8 sectionController:self nodeSnapshotAtIndexPath:v7];

  uint64_t v10 = [v9 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v10)
  {
    BOOL v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HomeOutlineCollectionsSectionController;
    BOOL v12 = [(HomeOutlineSectionController *)&v14 collectionView:v6 shouldSelectItemAtIndexPath:v7];
  }

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeOutlineSectionController *)self delegate];
  id v9 = [v8 sectionController:self nodeSnapshotAtIndexPath:v7];

  uint64_t v10 = [v9 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v12 = [v9 viewModel];
  id v13 = v12;
  if (isKindOfClass)
  {
    objc_super v14 = [v12 collection];
    if ([v14 handlerType] == (id)4)
    {
      id v15 = [(HomeOutlineSectionController *)self configuration];
      id v16 = [v15 actionCoordinator];
      id v17 = [v13 collection];
      [v16 viewController:0 showCollection:v17];

      +[HomeAnalyticsManager captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](HomeAnalyticsManager, "captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2099, v14, [v7 row]);
    }
    if (![v14 handlerType])
    {
      id v18 = [v14 showAction];
      if ([v14 handlerType] == (id)3) {
        uint64_t v19 = 256;
      }
      else {
        uint64_t v19 = 8;
      }
      id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 bucketedNumberOfItems]);
      id v21 = +[NSString stringWithFormat:@"%@", v20];

      +[GEOAPPortal captureUserAction:v18 target:v19 value:v21];
    }
  }
  else
  {
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) == 0) {
      goto LABEL_12;
    }
    id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 row]);
    objc_super v14 = [v13 stringValue];
    +[GEOAPPortal captureUserAction:2068 target:252 value:v14];
  }

LABEL_12:
  id v23 = [v9 viewModel];
  objc_opt_class();
  char v24 = objc_opt_isKindOfClass();

  if ((v24 & 1) == 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)HomeOutlineCollectionsSectionController;
    [(HomeOutlineSectionController *)&v26 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
  CFStringRef v25 = [(HomeOutlineSectionController *)self delegate];
  [v25 sectionController:self setNeedsApplySnapshotAnimated:1];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineCollectionsSectionController;
  [(HomeOutlineSectionController *)&v6 collectionView:a3 didDeselectItemAtIndexPath:a4];
  id v5 = [(HomeOutlineSectionController *)self delegate];
  [v5 sectionController:self setNeedsApplySnapshotAnimated:1];
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HomeOutlineSectionController *)self delegate];
  unsigned int v12 = [v11 isCollectionViewFocusedWithSectionController:self];

  v15.receiver = self;
  v15.super_class = (Class)HomeOutlineCollectionsSectionController;
  [(HomeOutlineSectionController *)&v15 collectionView:v10 didUpdateFocusInContext:v9 withAnimationCoordinator:v8];

  id v13 = [(HomeOutlineSectionController *)self delegate];
  LODWORD(v10) = [v13 isCollectionViewFocusedWithSectionController:self];

  if (v12 != v10)
  {
    objc_super v14 = [(HomeOutlineSectionController *)self delegate];
    [v14 sectionController:self setNeedsApplySnapshotAnimated:1];
  }
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5 = [(HomeOutlineSectionController *)self delegate];
  [v5 sectionController:self setNeedsApplySnapshotAnimated:1];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(HomeOutlineCollectionsSectionController *)self _isMoveOperationWithDropSession:v7 destinationIndexPath:v8])
  {
    uint64_t v9 = 3;
  }
  else
  {
    if (![(HomeOutlineCollectionsSectionController *)self _isCopyOperationWithDropSession:v7 destinationIndexPath:v8])
    {
      unsigned int v12 = 0;
      id v10 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = 2;
  }
  id v10 = [objc_alloc((Class)UICollectionViewDropProposal) initWithDropOperation:v9 intent:2];
  if (!v10)
  {
    unsigned int v12 = 0;
LABEL_11:
    id v11 = 0;
    objc_super v14 = 0;
    char v15 = 1;
    goto LABEL_14;
  }
  id v11 = [(HomeOutlineCollectionsSectionController *)self _collectionContainingIndexPath:v8];
  if (!v11)
  {
    unsigned int v12 = 0;
    goto LABEL_13;
  }
  unsigned int v12 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:v11];
  if (!v12)
  {
LABEL_13:
    char v15 = 0;
    objc_super v14 = 0;
    goto LABEL_14;
  }
  id v13 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  objc_super v14 = [v13 identifierPathByAppendingIdentifier:v12];

  char v15 = 0;
LABEL_14:
  if (v14 != self->_dropDestinationIdentifierPath && !-[IdentifierPath isEqual:](v14, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_dropDestinationIdentifierPath, v14);
    id v16 = [(HomeOutlineSectionController *)self delegate];
    [v16 sectionController:self setNeedsApplySnapshotAnimated:1];
  }
  if (v15) {
    id v17 = [objc_alloc((Class)UICollectionViewDropProposal) initWithDropOperation:0];
  }
  else {
    id v17 = v10;
  }
  id v18 = v17;

  return v18;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v11 = a4;
  id v5 = [v11 session];
  objc_super v6 = [v11 destinationIndexPath];
  unsigned int v7 = [(HomeOutlineCollectionsSectionController *)self _isMoveOperationWithDropSession:v5 destinationIndexPath:v6];

  if (v7)
  {
    [(HomeOutlineCollectionsSectionController *)self _performMoveWithDropCoordinator:v11];
  }
  else
  {
    id v8 = [v11 session];
    uint64_t v9 = [v11 destinationIndexPath];
    unsigned int v10 = [(HomeOutlineCollectionsSectionController *)self _isCopyOperationWithDropSession:v8 destinationIndexPath:v9];

    if (v10) {
      [(HomeOutlineCollectionsSectionController *)self _performCopyWithDropCoordinator:v11];
    }
  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  dropDestinationIdentifierPath = self->_dropDestinationIdentifierPath;
  self->_dropDestinationIdentifierPath = 0;

  id v6 = [(HomeOutlineSectionController *)self delegate];
  [v6 sectionController:self setNeedsApplySnapshotAnimated:1];
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  dropDestinationIdentifierPath = self->_dropDestinationIdentifierPath;
  self->_dropDestinationIdentifierPath = 0;

  id v6 = [(HomeOutlineSectionController *)self delegate];
  [v6 sectionController:self setNeedsApplySnapshotAnimated:1];
}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v34 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [v34 cellModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unsigned int v12 = [v34 cellModel];
  id v13 = v12;
  if (isKindOfClass)
  {
    objc_super v14 = [v12 transitLine];

    if (!v14)
    {
LABEL_6:

      goto LABEL_11;
    }
    char v15 = [IncompleteTransitLineItem alloc];
    id v16 = [v13 transitLine];
    id v17 = [(IncompleteTransitLineItem *)v15 initWithTransitLine:v16];

    id v18 = [(HomeOutlineSectionController *)self configuration];
    uint64_t v19 = [v18 actionCoordinator];
    id v20 = [(HomeOutlineSectionController *)self configuration];
    id v21 = [v20 homeActionDelegate];
    char v22 = [v21 homeContaineeViewController];
    [v8 bounds];
    [v19 viewController:v22 openTransitLineCard:v17 sourceView:v8];

    goto LABEL_4;
  }
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  if (v23)
  {
    id v24 = [v9 accessoryType];
    id v13 = [v34 cellModel];
    id v17 = [v13 collection];
    id v25 = [(IncompleteTransitLineItem *)v17 handlerType];
    if (v24 == (id)1)
    {
      if (v25 == (id)4) {
        goto LABEL_5;
      }
      objc_super v26 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
      uint64_t v27 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:v17];
      id v18 = [v26 identifierPathByAppendingIdentifier:v27];

      double v28 = [(HomeOutlineSectionController *)self sectionSnapshot];
      id v29 = [v18 identifierPathByRemovingFirstIdentifier];
      id v30 = [v28 nodeSnapshotAtIdentifierPath:v29];

      uint64_t v31 = [(HomeOutlineSectionController *)self delegate];
      [v31 sectionController:self setNeedsApplySnapshotAnimated:1];

      [(HomeOutlineCollectionsSectionController *)self _editCollectionSnapshot:v30];
    }
    else
    {
      if (v25 == (id)4) {
        goto LABEL_5;
      }
      double v32 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
      uint64_t v33 = [(HomeOutlineCollectionsSectionController *)self _identifierForItem:v17];
      id v18 = [v32 identifierPathByAppendingIdentifier:v33];

      [(HomeOutlineSectionController *)self toggleElementAtIdentifierPath:v18];
    }
LABEL_4:

LABEL_5:
    goto LABEL_6;
  }
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCollectionTimer, 0);
  objc_storeStrong(&self->_pendingCollectionOperation, 0);
  objc_storeStrong((id *)&self->_pendingCollection, 0);
  objc_storeStrong((id *)&self->_editingCollection, 0);
  objc_storeStrong((id *)&self->_dropDestinationIdentifierPath, 0);
  objc_storeStrong((id *)&self->_shortcutEditSessions, 0);
  objc_storeStrong((id *)&self->_duplicateCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_moveCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_deleteCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_dropCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_sortItems, 0);
  objc_storeStrong((id *)&self->_distanceUnitDataProvider, 0);
  objc_storeStrong((id *)&self->_collectionsDataProvider, 0);

  objc_storeStrong((id *)&self->_currentLocationDataProvider, 0);
}

@end