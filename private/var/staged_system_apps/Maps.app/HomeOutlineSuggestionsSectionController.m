@interface HomeOutlineSuggestionsSectionController
- (BOOL)_canDisplaySuggestionsEntry:(id)a3;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)persistsExpansions;
- (BOOL)shouldPersistExpandedIdentifierPath:(id)a3;
- (HomeOutlineSuggestionsSectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (id)_childItemsInCollection:(id)a3;
- (id)_sortItemForCollection:(id)a3;
- (id)contentInjectorForSnapshot:(id)a3;
- (id)contextMenuForSnapshot:(id)a3;
- (void)_deleteSnapshot:(id)a3;
- (void)_processDeletion:(id)a3 forMapsSuggestionsEntry:(id)a4;
- (void)_processDeletion:(id)a3 forSharedTripSummary:(id)a4;
- (void)_scrubSortItems;
- (void)collectionSortItem:(id)a3 didSelectSortType:(int64_t)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)showSharedCollection:(id)a3;
- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5;
- (void)twoLinesOutlineCell:(id)a3 tappedActionButtonAtIndex:(int64_t)a4;
@end

@implementation HomeOutlineSuggestionsSectionController

- (HomeOutlineSuggestionsSectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4
{
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HomeOutlineSuggestionsSectionController;
  v8 = [(HomeOutlineSectionController *)&v20 initWithConfiguration:a3];
  if (v8)
  {
    v9 = objc_alloc_init(CurrentLocationDataProvider);
    currentLocationDataProvider = v8->_currentLocationDataProvider;
    v8->_currentLocationDataProvider = v9;

    v11 = objc_alloc_init(DistanceUnitDataProvider);
    distanceUnitDataProvider = v8->_distanceUnitDataProvider;
    v8->_distanceUnitDataProvider = v11;

    v13 = objc_alloc_init(SharedCollectionsDataProvider);
    sharedCollectionsDataProvider = v8->_sharedCollectionsDataProvider;
    v8->_sharedCollectionsDataProvider = v13;

    v15 = [[SharedTripsDataProvider alloc] initWithCombineAllTrips:0];
    sharedTripsDataProvider = v8->_sharedTripsDataProvider;
    v8->_sharedTripsDataProvider = v15;

    objc_storeStrong((id *)&v8->_suggestionsDataProvider, a4);
    uint64_t v17 = +[NSMutableDictionary dictionary];
    sortItems = v8->_sortItems;
    v8->_sortItems = (NSMutableDictionary *)v17;
  }
  return v8;
}

- (NSArray)dataProviders
{
  distanceUnitDataProvider = self->_distanceUnitDataProvider;
  v6[0] = self->_currentLocationDataProvider;
  v6[1] = distanceUnitDataProvider;
  sharedTripsDataProvider = self->_sharedTripsDataProvider;
  v6[2] = self->_sharedCollectionsDataProvider;
  v6[3] = sharedTripsDataProvider;
  v6[4] = self->_suggestionsDataProvider;
  v4 = +[NSArray arrayWithObjects:v6 count:5];

  return (NSArray *)v4;
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  unsigned int v2 = +[MapsSuggestionsSiri isEnabled];
  v3 = +[NSBundle mainBundle];
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"[Proactive Tray] Suggestion Section";
  }
  else {
    CFStringRef v5 = @"[Proactive Tray] Shared with Me Section";
  }
  v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  id v7 = [[SectionHeaderBasicOutlineCellModel alloc] initWithTitle:v6];

  return (MapsUIDiffableDataSourceViewModel *)v7;
}

- (BOOL)_canDisplaySuggestionsEntry:(id)a3
{
  if ([a3 type] != (id)21) {
    return 1;
  }

  return +[RatingRequestHomeAvailability shouldShowRatingRequestSuggestionsOnProactiveTray];
}

- (NSArray)itemSnapshots
{
  v3 = [(CurrentLocationDataProvider *)self->_currentLocationDataProvider currentLocation];
  int64_t v4 = [(DistanceUnitDataProvider *)self->_distanceUnitDataProvider distanceUnit];
  CFStringRef v5 = [(HomeOutlineSectionController *)self selectedIdentifierPaths];
  v6 = +[NSMutableArray array];
  id v7 = [(SharedCollectionsDataProvider *)self->_sharedCollectionsDataProvider sharedCollections];
  [v6 addObjectsFromArray:v7];

  v8 = [(SharedTripsDataProvider *)self->_sharedTripsDataProvider sharedTripSummaries];
  [v6 addObjectsFromArray:v8];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v9 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestions];
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if ([(HomeOutlineSuggestionsSectionController *)self _canDisplaySuggestionsEntry:v14])
        {
          [v6 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  v15 = [(HomeOutlineSectionController *)self configuration];
  v16 = [v15 sectionIdentifier];
  BOOL v17 = [(HomeOutlineSectionController *)self expanded];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10042F2EC;
  v28[3] = &unk_1012E61D0;
  v28[4] = self;
  v23[4] = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10042F358;
  v24[3] = &unk_1012E61F8;
  v24[4] = self;
  id v25 = v5;
  id v26 = v3;
  int64_t v27 = v4;
  v22[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10042FC5C;
  v23[3] = &unk_1012E6220;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10042FCD8;
  v22[3] = &unk_1012E6248;
  id v18 = v3;
  id v19 = v5;
  objc_super v20 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v6 sectionIdentifier:v16 sectionExpanded:v17 itemIdentifierBlock:v28 viewModelBlock:v24 childItemsBlock:v23 expandedBlock:v22];

  [(HomeOutlineSuggestionsSectionController *)self _scrubSortItems];

  return (NSArray *)v20;
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  CFStringRef v5 = [v4 viewModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {

LABEL_7:
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10042FF7C;
    v14[3] = &unk_1012E6690;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    id v10 = HomeDeleteAction(v14);
    id v18 = v10;
    id v11 = +[NSArray arrayWithObjects:&v18 count:1];
    uint64_t v12 = +[UIMenu menuWithTitle:&stru_101324E70 children:v11];

    objc_destroyWeak(&v16);
    goto LABEL_8;
  }
  v8 = [v4 viewModel];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & (v8 != 0)) == 1) {
    goto LABEL_7;
  }
  uint64_t v12 = 0;
LABEL_8:
  objc_destroyWeak(&location);

  return v12;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (BOOL)shouldPersistExpandedIdentifierPath:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  unsigned __int8 v6 = [v4 isEqual:v5];

  return v6;
}

- (void)showSharedCollection:(id)a3
{
  id v4 = a3;
  if ([v4 handlerType] == (id)3) {
    [(SharedCollectionsDataProvider *)self->_sharedCollectionsDataProvider addSharedCollection:v4];
  }
}

- (id)contentInjectorForSnapshot:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = 0;
  if ((isKindOfClass & 1) != 0 && v5)
  {
    v8 = [v4 viewModel];
    v9 = [v8 collection];
    id v7 = [[HomeCollectionContentInjector alloc] initWithCollection:v9];
    id v10 = [(HomeOutlineSectionController *)self configuration];
    id v11 = [v10 actionCoordinator];
    [(HomeCollectionContentInjector *)v7 setActionCoordinator:v11];
  }

  return v7;
}

- (id)_childItemsInCollection:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 content];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = +[NSMutableArray array];
    v8 = [(HomeOutlineSuggestionsSectionController *)self _sortItemForCollection:v4];
    [v7 addObject:v8];

    v9 = [v4 content];
    [v7 addObjectsFromArray:v9];

    id v10 = [v7 copy];
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)_sortItemForCollection:(id)a3
{
  id v4 = a3;
  sortItems = self->_sortItems;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)sortItems objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [[HomeCollectionSortItem alloc] initWithCollection:v4 delegate:self];
    v8 = self->_sortItems;
    v9 = [v4 identifier];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (void)_scrubSortItems
{
  v3 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SharedCollectionsDataProvider *)self->_sharedCollectionsDataProvider sharedCollections];
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
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        sortItems = self->_sortItems;
        id v11 = [v9 identifier];
        uint64_t v12 = [(NSMutableDictionary *)sortItems objectForKeyedSubscript:v11];
        v13 = [v9 identifier];
        [(NSMutableDictionary *)v3 setObject:v12 forKeyedSubscript:v13];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v14 = self->_sortItems;
  self->_sortItems = v3;
}

- (void)collectionSortItem:(id)a3 didSelectSortType:(int64_t)a4
{
  sharedCollectionsDataProvider = self->_sharedCollectionsDataProvider;
  id v7 = a3;
  [(SharedCollectionsDataProvider *)sharedCollectionsDataProvider setActive:0];
  v8 = [v7 collection];

  [v8 setSortType:a4];
  [(SharedCollectionsDataProvider *)self->_sharedCollectionsDataProvider setActive:1];
  id v9 = [(HomeOutlineSectionController *)self delegate];
  [v9 sectionController:self setNeedsApplySnapshotAnimated:0];
}

- (void)_deleteSnapshot:(id)a3
{
  id v18 = a3;
  id v4 = [(HomeOutlineSectionController *)self deletions];
  id v5 = [v18 identifierPath];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = [v18 viewModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    id v10 = [v9 sharedTripSummary];

    id v11 = [v18 viewModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    uint64_t v14 = [v13 entry];

    if (v14)
    {
      long long v15 = [(HomeOutlineSectionController *)self deletionWithSnapshot:v18];
      [(HomeOutlineSuggestionsSectionController *)self _processDeletion:v15 forMapsSuggestionsEntry:v14];
    }
    else
    {
      if (!v10) {
        goto LABEL_11;
      }
      long long v16 = [v10 sharedTrips];
      id v17 = [v16 count];

      if ((unint64_t)v17 > 1) {
        goto LABEL_11;
      }
      long long v15 = [(HomeOutlineSectionController *)self deletionWithSnapshot:v18];
      [(HomeOutlineSuggestionsSectionController *)self _processDeletion:v15 forSharedTripSummary:v10];
    }

LABEL_11:
  }
}

- (void)_processDeletion:(id)a3 forMapsSuggestionsEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(HomeOutlineSectionController *)self configuration];
  id v9 = [v8 actionCoordinator];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004308EC;
  v15[3] = &unk_1012E6690;
  objc_copyWeak(&v17, &location);
  id v10 = v6;
  id v16 = v10;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100430988;
  v12[3] = &unk_1012EA298;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  [v9 viewController:0 removeMapsSuggestionsEntry:v7 sourceView:0 sourceRect:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height startBlock:v15 completionBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_processDeletion:(id)a3 forSharedTripSummary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 sharedTrips];
  if ([v8 count] == (id)1)
  {
    id v9 = [v7 sharedTrips];
    id v10 = [v9 lastObject];
  }
  else
  {
    id v10 = 0;
  }

  id v11 = [v10 groupIdentifier];
  if (v11)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = [(HomeOutlineSectionController *)self configuration];
    id v13 = [v12 actionCoordinator];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100430BF0;
    v14[3] = &unk_1012EA2C0;
    objc_copyWeak(&v17, &location);
    id v15 = v6;
    id v16 = v11;
    [v13 confirmDeleteSharedTripWithSummary:v7 sourceView:0 sourceRect:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v23 = a3;
  id v7 = a4;
  v8 = [v23 cellModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v10 = [v23 cellModel];
  id v11 = v10;
  if (isKindOfClass)
  {
    uint64_t v12 = [v10 entry];
    if ([v12 type] != (id)21 && !GEOConfigGetBOOL()) {
      goto LABEL_9;
    }
    +[HomeAnalyticsManager captureTapActionWithEntry:v12];
    +[HomeAnalyticsManager captureRatingSuggestionTapAction];
    id v13 = [(HomeOutlineSectionController *)self configuration];
    id v14 = [v13 actionCoordinator];
    id v15 = [v12 geoMapItem];
    [v14 addRatingsForMapItem:v15];
    goto LABEL_7;
  }
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  id v17 = [v23 cellModel];
  id v11 = v17;
  if (v16)
  {
    uint64_t v12 = [v17 sharedTripSummary];
    id v18 = [v12 sharedTrips];
    id v13 = [v18 firstObject];

    id v14 = [(HomeOutlineSectionController *)self configuration];
    id v15 = [v14 actionCoordinator];
    [v15 presentSharedTrip:v13 inPopoverFromView:v7];
LABEL_7:

LABEL_8:
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if (v19)
  {
    id v11 = [v23 cellModel];
    uint64_t v12 = [v11 collection];
    objc_super v20 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    v21 = [(HomeOutlineSectionController *)self identifierCache];
    v22 = [v21 identifierForObject:v12];
    id v13 = [v20 identifierPathByAppendingIdentifier:v22];

    [(HomeOutlineSectionController *)self toggleElementAtIdentifierPath:v13];
    goto LABEL_8;
  }
LABEL_10:
}

- (void)twoLinesOutlineCell:(id)a3 tappedActionButtonAtIndex:(int64_t)a4
{
  id v6 = [a3 cellModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v11 = v7;

  v8 = v11;
  if (v11)
  {
    id v9 = [v11 collection];
    id v10 = v9;
    if (!a4)
    {
      [v9 createCollection:&stru_1012EA2E0];
      +[GEOAPPortal captureUserAction:2071 target:256 value:0];
    }
    [(SharedCollectionsDataProvider *)self->_sharedCollectionsDataProvider removeSharedCollection:v10];

    v8 = v11;
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HomeOutlineSectionController *)self delegate];
  id v9 = [v8 sectionController:self nodeSnapshotAtIndexPath:v7];

  id v10 = [v9 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v10)
  {
    BOOL v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HomeOutlineSuggestionsSectionController;
    BOOL v12 = [(HomeOutlineSectionController *)&v14 collectionView:v6 shouldSelectItemAtIndexPath:v7];
  }

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HomeOutlineSuggestionsSectionController;
  [(HomeOutlineSectionController *)&v22 collectionView:a3 didSelectItemAtIndexPath:v6];
  id v7 = [(HomeOutlineSectionController *)self delegate];
  [v7 sectionController:self setNeedsApplySnapshotAnimated:1];

  v8 = [(HomeOutlineSectionController *)self delegate];
  id v9 = [v8 sectionController:self nodeSnapshotAtIndexPath:v6];

  id v10 = [v9 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v12 = [v9 viewModel];
  id v13 = v12;
  if ((isKindOfClass & 1) != 0 && v10)
  {
    objc_super v14 = [v12 entry];

    id v15 = [v14 analyticsGrouping];
    uint64_t v16 = 2039;
    uint64_t v17 = 8;
LABEL_7:
    +[GEOAPPortal captureUserAction:v16 target:v17 value:v15];
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0 && v13)
  {
    objc_super v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
    id v15 = [v14 stringValue];
    uint64_t v16 = 2068;
    uint64_t v17 = 256;
    goto LABEL_7;
  }
  char v19 = [v9 viewModel];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0 && v19)
  {
    objc_super v14 = [v9 viewModel];
    id v15 = [v14 sharedTripSummary];
    v21 = [v15 _transportTypeStringForAnalytics];
    +[GEOAPPortal captureUserAction:9003 target:737 value:v21];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineSuggestionsSectionController;
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
  v15.super_class = (Class)HomeOutlineSuggestionsSectionController;
  [(HomeOutlineSectionController *)&v15 collectionView:v10 didUpdateFocusInContext:v9 withAnimationCoordinator:v8];

  id v13 = [(HomeOutlineSectionController *)self delegate];
  LODWORD(v10) = [v13 isCollectionViewFocusedWithSectionController:self];

  if (v12 != v10)
  {
    objc_super v14 = [(HomeOutlineSectionController *)self delegate];
    [v14 sectionController:self setNeedsApplySnapshotAnimated:1];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(HomeOutlineSectionController *)self delegate];
  id v16 = [(id)v7 sectionController:self nodeSnapshotAtIndexPath:v6];

  id v8 = [v16 viewModel];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  id v9 = [v16 viewModel];
  id v10 = v9;
  if ((v7 & 1) != 0 && v8)
  {
    id v11 = [v9 entry];
    id v12 = [v11 type];

    if (v12 == (id)21) {
      +[GEOAPPortal captureUserAction:339 target:8 value:0];
    }
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v10)
  {
    id v10 = [v16 viewModel];
    objc_super v14 = [v10 sharedTripSummary];
    objc_super v15 = [v14 _transportTypeStringForAnalytics];
    +[GEOAPPortal captureUserAction:9002 target:737 value:v15];

LABEL_8:
  }
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortItems, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedCollectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_distanceUnitDataProvider, 0);

  objc_storeStrong((id *)&self->_currentLocationDataProvider, 0);
}

@end