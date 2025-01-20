@interface HomeOutlineRecentsSectionController
- (BOOL)_shouldShowClearButtonForItemSnapshots:(id)a3;
- (BOOL)persistsExpansions;
- (HomeOutlineRecentsSectionController)initWithConfiguration:(id)a3;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (id)contextMenuForSnapshot:(id)a3;
- (void)_deleteMarkedLocationSnapshot:(id)a3;
- (void)_deleteRecentsSnapshots:(id)a3 deleteAll:(BOOL)a4;
- (void)_deleteSnapshot:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)smallButtonOutlineCellTapped:(id)a3;
- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5;
@end

@implementation HomeOutlineRecentsSectionController

- (HomeOutlineRecentsSectionController)initWithConfiguration:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HomeOutlineRecentsSectionController;
  v3 = [(HomeOutlineSectionController *)&v11 initWithConfiguration:a3];
  if (v3)
  {
    v4 = objc_alloc_init(MarkedLocationDataProvider);
    markedLocationDataProvider = v3->_markedLocationDataProvider;
    v3->_markedLocationDataProvider = v4;

    v6 = objc_alloc_init(RecentsDataProvider);
    recentsDataProvider = v3->_recentsDataProvider;
    v3->_recentsDataProvider = v6;

    v8 = [[RecentsDataFilter alloc] initWithSearchMode:1 filterPredicate:0];
    recentsDataFilter = v3->_recentsDataFilter;
    v3->_recentsDataFilter = v8;
  }
  return v3;
}

- (NSArray)dataProviders
{
  recentsDataProvider = self->_recentsDataProvider;
  v5[0] = self->_markedLocationDataProvider;
  v5[1] = recentsDataProvider;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return (NSArray *)v3;
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  v2 = [SectionHeaderBasicOutlineCellModel alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[Proactive Tray] Recents Section" value:@"localized string not found" table:0];
  v5 = [(SectionHeaderBasicOutlineCellModel *)v2 initWithTitle:v4];

  return (MapsUIDiffableDataSourceViewModel *)v5;
}

- (NSArray)itemSnapshots
{
  v3 = +[NSMutableArray array];
  v4 = [(MarkedLocationDataProvider *)self->_markedLocationDataProvider markedLocation];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(RecentsDataProvider *)self->_recentsDataProvider recents];
  [v3 addObjectsFromArray:v5];

  v6 = [(RecentsDataFilter *)self->_recentsDataFilter filteredRecents:v3 excludingDuplicatesOfEntries:&__NSArray0__struct];
  v7 = [(HomeOutlineSectionController *)self configuration];
  v8 = [v7 sectionIdentifier];
  v20[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B6D3D4;
  v21[3] = &unk_1012E61D0;
  v21[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100B6D440;
  v20[3] = &unk_1013157B0;
  v9 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v6 sectionIdentifier:v8 sectionExpanded:[(HomeOutlineSectionController *)self expanded] itemIdentifierBlock:v21 viewModelBlock:v20 childItemsBlock:&stru_1013196E8 expandedBlock:&stru_101319708];

  if ([(HomeOutlineRecentsSectionController *)self _shouldShowClearButtonForItemSnapshots:v9])
  {
    v10 = [SmallButtonOutlineCellModel alloc];
    objc_super v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"[Proactive Tray] Clear Recents" value:@"localized string not found" table:0];
    v13 = [(SmallButtonOutlineCellModel *)v10 initWithStyle:0 title:v12 image:0 hoverImage:0 delegate:self];

    v14 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
    v15 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    v16 = [v15 identifierPathByAppendingIdentifier:@"ClearRecents"];
    v17 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v14 initWithIdentifierPath:v16 viewModel:v13 childSnapshots:&__NSArray0__struct expanded:0];

    uint64_t v18 = [v9 arrayByAddingObject:v17];

    v9 = (void *)v18;
  }

  return (NSArray *)v9;
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [v4 viewModel];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___TwoLinesOutlineCellModel];

  if (v5) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 == 1)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100B6D918;
    v12[3] = &unk_1012E6690;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    v8 = HomeDeleteAction(v12);
    v16 = v8;
    v9 = +[NSArray arrayWithObjects:&v16 count:1];
    v10 = +[UIMenu menuWithTitle:&stru_101324E70 children:v9];

    objc_destroyWeak(&v14);
  }
  else
  {
    v10 = 0;
  }
  objc_destroyWeak(&location);

  return v10;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (BOOL)_shouldShowClearButtonForItemSnapshots:(id)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 viewModel:v18];
        unsigned int v11 = [v10 conformsToProtocol:&OBJC_PROTOCOL___HomeRecentsItemCellModel];

        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          id v13 = [(HomeOutlineSectionController *)self deletions];
          id v14 = [v9 identifierPath];
          v15 = [v13 objectForKeyedSubscript:v14];

          if (!v15)
          {
            BOOL v16 = 1;
            goto LABEL_15;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (void)_deleteSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(HomeOutlineSectionController *)self deletions];
  id v6 = [v4 identifierPath];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = [v4 viewModel];
    unsigned int v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___HomeRecentsItemCellModel];

    if (v8 && v9)
    {
      id v13 = v4;
      v10 = +[NSArray arrayWithObjects:&v13 count:1];
      [(HomeOutlineRecentsSectionController *)self _deleteRecentsSnapshots:v10 deleteAll:0];
    }
    else
    {
      unsigned int v11 = [v4 viewModel];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0 && v11) {
        [(HomeOutlineRecentsSectionController *)self _deleteMarkedLocationSnapshot:v4];
      }
    }
  }
}

- (void)_deleteMarkedLocationSnapshot:(id)a3
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

  v8 = [v7 searchResult];

  if (v8)
  {
    unsigned int v9 = [(HomeOutlineSectionController *)self deletionWithSnapshot:v4];
    id v13 = v9;
    v10 = +[NSArray arrayWithObjects:&v13 count:1];
    [(HomeOutlineSectionController *)self beginDeletions:v10];

    unsigned int v11 = [(HomeOutlineSectionController *)self configuration];
    BOOL v12 = [v11 actionCoordinator];
    [v12 deleteMarkedLocation:v8];
  }
}

- (void)_deleteRecentsSnapshots:(id)a3 deleteAll:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100B6DF80;
  v17[3] = &unk_101319730;
  v17[4] = self;
  id v7 = sub_100099700(v6, v17);
  v8 = sub_100099700(v7, &stru_101319770);
  objc_initWeak(&location, self);
  [(HomeOutlineSectionController *)self beginDeletions:v7];
  recentsDataProvider = self->_recentsDataProvider;
  if (v4)
  {
    v10 = v14;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100B6E0F4;
    v14[3] = &unk_1012EB690;
    unsigned int v11 = &v15;
    objc_copyWeak(&v15, &location);
    v14[4] = v7;
    [(RecentsDataProvider *)recentsDataProvider deleteAllRecentsWithCompletion:v14];
  }
  else
  {
    v10 = v12;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100B6E164;
    v12[3] = &unk_1012EB690;
    unsigned int v11 = &v13;
    objc_copyWeak(&v13, &location);
    void v12[4] = v7;
    [(RecentsDataProvider *)recentsDataProvider deleteRecents:v8 completion:v12];
  }

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)smallButtonOutlineCellTapped:(id)a3
{
  BOOL v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(HomeOutlineSectionController *)self sectionSnapshot];
  id v6 = [v5 childSnapshots];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = [v11 viewModel];
        unsigned int v13 = [v12 conformsToProtocol:&OBJC_PROTOCOL___HomeRecentsItemCellModel];

        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14) {
          [v4 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(HomeOutlineRecentsSectionController *)self _deleteRecentsSnapshots:v4 deleteAll:1];
}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v26 = a4;
  id v7 = [a3 cellModel];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___HomeRecentsItemCellModel]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v9 homeRecentsItem];
    unsigned int v11 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
    objc_opt_class();
    id v12 = v10;
    if (objc_opt_isKindOfClass()) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = 0;
    }
    id v14 = v13;

    if (v14
      && ([v14 historyEntry],
          long long v15 = objc_claimAutoreleasedReturnValue(),
          unsigned int v16 = [v15 conformsToProtocol:v11],
          v15,
          v16))
    {
      id v17 = v12;
    }
    else
    {
      id v17 = 0;
    }

    if (v17)
    {
      long long v18 = [v17 historyEntry];
      long long v19 = [v18 lineItem];

      long long v20 = [[IncompleteTransitLineItem alloc] initWithTransitLine:v19];
      long long v21 = [(HomeOutlineSectionController *)self configuration];
      v22 = [v21 actionCoordinator];
      v23 = [(HomeOutlineSectionController *)self configuration];
      v24 = [v23 homeActionDelegate];
      v25 = [v24 homeContaineeViewController];
      [v26 bounds];
      [v22 viewController:v25 openTransitLineCard:v20 sourceView:v26];
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[GEOAPPortal captureUserAction:2064 target:8 value:0];
  v8.receiver = self;
  v8.super_class = (Class)HomeOutlineRecentsSectionController;
  [(HomeOutlineSectionController *)&v8 collectionView:v7 didSelectItemAtIndexPath:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);

  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
}

@end