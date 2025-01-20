@interface HomeCellProvider
- (BOOL)_isEmptySection:(id)a3;
- (BOOL)_isLoading;
- (BOOL)_isTableViewHidden:(id)a3;
- (BOOL)_needsSnapshotUpdate;
- (BOOL)_shouldDisplayObject:(id)a3;
- (BOOL)_shouldShowEntryOfTypeVehicleSetup:(id)a3;
- (BOOL)_shouldShowHeaderForSection:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (DeleteDelegate)deleteDelegate;
- (HomeActionDelegate)homeActionDelegate;
- (HomeCellProvider)initWithTableView:(id)a3 viewMode:(int64_t)a4;
- (HomeUpdateDelegate)homeUpdateDelegate;
- (NSArray)keyCommands;
- (OfflineMapsFeatureDiscoveryActionDelegate)offlineMapsDiscoveryActionDelegate;
- (ParkedCarActionDelegate)parkedCarActionDelegate;
- (PlaceCardActionDelegate)placeCardActionDelegate;
- (ShareDelegate)shareDelegate;
- (SuggestionsItemSource)suggestionsItemSource;
- (TransitPayActionDelegate)transitPayActionDelegate;
- (UGCPOIEnrichmentActionDelegate)poiEnrichmentActionDelegate;
- (double)contentHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_allDataProviders;
- (id)_allObjects;
- (id)_homeSectionAtDynamicIndex:(int64_t)a3;
- (id)_homeSectionAtIndexPath:(id)a3;
- (id)_homeSectionAtStaticIndex:(int64_t)a3;
- (id)_homeSectionWithType:(int64_t)a3;
- (id)_loadingDataProviders;
- (id)_objectsInSectionAtIndexPath:(id)a3;
- (id)_snapshotWithOldHomeSections:(id)a3 outDifference:(id *)a4;
- (id)_suggestionCellModelForMapsSuggestionsEntry:(id)a3;
- (id)analyticsContext;
- (id)deleteContextualActionAtIndexPath:(id)a3;
- (id)editLocationContextualActionAtIndexPath:(id)a3;
- (id)homeActionFooterViewUIMenuForRAP:(id)a3;
- (id)newTraits;
- (id)objectAtIndexPath:(id)a3;
- (id)objectsForAnalytics;
- (id)shareContextualActionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)targetForDragAnalytics;
- (int64_t)_dynamicIndexOfHomeSection:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)viewMode;
- (void)_addAnalyticsInfo;
- (void)_applySnapshotUpdateAndAnimateCells:(BOOL)a3 animateTableView:(BOOL)a4;
- (void)_beginDeletion:(id)a3;
- (void)_buildSections;
- (void)_captureCuratedCollectionAction:(int)a3 withCollectionHandler:(id)a4 verticalIndex:(unint64_t)a5;
- (void)_captureDeleteActionWithObject:(id)a3 indexPath:(id)a4;
- (void)_captureHeaderActionWithHomeSection:(id)a3;
- (void)_captureShareActionWithObject:(id)a3 indexPath:(id)a4;
- (void)_captureSuggestionDeleteActionWithEntry:(id)a3 behaviour:(int64_t)a4;
- (void)_captureTapActionWithObject:(id)a3 indexPath:(id)a4;
- (void)_configureHeaderView:(id)a3 inSection:(int64_t)a4;
- (void)_configureVisibleHeaders;
- (void)_createDataProviders;
- (void)_deleteCollection:(id)a3 atIndexPath:(id)a4 completion:(id)a5;
- (void)_deleteSharedTripWithSummary:(id)a3 atIndexPath:(id)a4 completion:(id)a5;
- (void)_endDeletion:(id)a3;
- (void)_fetchMissingImages;
- (void)_getRecentsWithCompletion:(id)a3;
- (void)_initialSuggestionsTimerDidFire;
- (void)_processPendingDeletions;
- (void)_resetSnapshotUpdateState;
- (void)_sectionHeaderButtonTappedWithHomeSection:(id)a3;
- (void)_setNeedsSnapshotUpdateAnimated:(BOOL)a3;
- (void)_updateInitialSuggestionsTimer;
- (void)_updateOrthogonalSectionCells;
- (void)_updateRestaurantReservationAnalytics;
- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5;
- (void)collectionsCarouselDidScrollBackward;
- (void)collectionsCarouselDidScrollForward;
- (void)deleteRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)editLocationAtIndexPath:(id)a3 completion:(id)a4;
- (void)exploreGuidesButtonTapped;
- (void)handleHomeSectionKeyCommand:(id)a3;
- (void)homeActionFooterViewDidTapMarkMyLocation:(id)a3;
- (void)homeActionFooterViewDidTapReportAProblem:(id)a3;
- (void)homeActionFooterViewDidTapShareMyLocation:(id)a3;
- (void)homeActionFooterViewDidTapTermsAndConditions:(id)a3;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)proactiveCallToActionButtonViewTapped:(id)a3;
- (void)resetScrollOffset;
- (void)routeToCuratedCollection:(id)a3;
- (void)routeToGuidesHomeFromExploreGuides:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)sendNoTypingACAnalyticsForSelectedAtIndexPath:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDeleteDelegate:(id)a3;
- (void)setHomeActionDelegate:(id)a3;
- (void)setHomeUpdateDelegate:(id)a3;
- (void)setOfflineMapsDiscoveryActionDelegate:(id)a3;
- (void)setParkedCarActionDelegate:(id)a3;
- (void)setPlaceCardActionDelegate:(id)a3;
- (void)setPoiEnrichmentActionDelegate:(id)a3;
- (void)setShareDelegate:(id)a3;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)shortcutsRowTableViewCell:(id)a3 openFavorite:(id)a4;
- (void)shortcutsRowTableViewCell:(id)a3 openShortcut:(id)a4;
- (void)shortcutsRowTableViewCellAddNewShortcut:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateIfNeeded;
@end

@implementation HomeCellProvider

- (double)contentHeight
{
  v3 = [(DataSource *)self tableView];
  v4 = [v3 traitCollection];

  v5 = [(DataSource *)self tableView];
  [v5 bounds];
  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:1 title:0 actionTitle:0 availableWidth:v4 traitCollection:CGRectGetWidth(v29)];
  double v7 = v6;

  +[TwoLinesTableViewCell estimatedCellHeight];
  double v9 = v8;
  v10 = [(DataSource *)self tableView];
  [v10 bounds];
  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:0 title:0 actionTitle:0 availableWidth:v4 traitCollection:CGRectGetWidth(v30)];
  double v12 = v11;

  +[ShortcutsRowTableViewCell cellHeightWithTraitCollection:v4];
  double v14 = v13;
  +[UIFont _maps_bodyScaledValueForValue:v4 compatibleWithTraitCollection:16.0];
  double v16 = v15;
  if ([(HomeCellProvider *)self _isLoading])
  {
    double v17 = v7 + v14 + v16;
  }
  else
  {
    double v17 = v7 + v9 + v12 + v14 + v16;
    if (self->_shortcutsSection)
    {
      int64_t v18 = -[HomeCellProvider _dynamicIndexOfHomeSection:](self, "_dynamicIndexOfHomeSection:");
      v19 = [(DataSource *)self tableView];
      [v19 rectForSection:v18];
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;

      v31.origin.x = v21;
      v31.origin.y = v23;
      v31.size.width = v25;
      v31.size.height = v27;
      if (v17 >= v16 + CGRectGetMaxY(v31))
      {
        v32.origin.x = v21;
        v32.origin.y = v23;
        v32.size.width = v25;
        v32.size.height = v27;
        double v17 = v16 + CGRectGetMaxY(v32);
      }
    }
  }

  return v17;
}

- (HomeCellProvider)initWithTableView:(id)a3 viewMode:(int64_t)a4
{
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)HomeCellProvider;
  double v7 = [(DataSource *)&v49 initWithTableView:v6 updateLocation:0];
  double v8 = v7;
  if (v7)
  {
    v7->_viewMode = a4;
    uint64_t v9 = +[NSMutableDictionary dictionary];
    pendingDeletions = v8->_pendingDeletions;
    v8->_pendingDeletions = (NSMutableDictionary *)v9;

    double v11 = [[RecentsDataFilter alloc] initWithSearchMode:1 filterPredicate:0];
    recentsDataFilter = v8->_recentsDataFilter;
    v8->_recentsDataFilter = v11;

    double v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Maps.HomeCellProvider.RecentsDataFilter", v13);
    recentsDataFilterQueue = v8->_recentsDataFilterQueue;
    v8->_recentsDataFilterQueue = (OS_dispatch_queue *)v14;

    id v16 = objc_alloc((Class)UITableViewDiffableDataSource);
    double v17 = sub_1005B3760(v8);
    int64_t v18 = (UITableViewDiffableDataSource *)[v16 initWithTableView:v6 cellProvider:v17];
    diffableDataSource = v8->_diffableDataSource;
    v8->_diffableDataSource = v18;

    [(UITableViewDiffableDataSource *)v8->_diffableDataSource setDefaultRowAnimation:0];
    uint64_t v20 = +[NSHashTable weakObjectsHashTable];
    orthogonalSectionCells = v8->_orthogonalSectionCells;
    v8->_orthogonalSectionCells = (NSHashTable *)v20;

    double v22 = objc_alloc_init(RAPReportMenuProvider);
    rapReportMenuProvider = v8->_rapReportMenuProvider;
    v8->_rapReportMenuProvider = v22;

    [(HomeCellProvider *)v8 _createDataProviders];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    double v24 = [(HomeCellProvider *)v8 _allDataProviders];
    id v25 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v46;
      do
      {
        v28 = 0;
        do
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          CGRect v29 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)v28) observers];
          [v29 registerObserver:v8];

          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v26);
    }

    uint64_t v30 = objc_opt_class();
    CGRect v31 = +[TwoLinesTableViewCell identifier];
    [v6 registerClass:v30 forCellReuseIdentifier:v31];

    uint64_t v32 = objc_opt_class();
    v33 = +[CollectionTableViewCell identifier];
    [v6 registerClass:v32 forCellReuseIdentifier:v33];

    uint64_t v34 = objc_opt_class();
    v35 = +[FeatureDiscoveryTableViewCell reuseIdentifier];
    [v6 registerClass:v34 forCellReuseIdentifier:v35];

    uint64_t v36 = objc_opt_class();
    v37 = +[SectionHeaderTableViewHeaderFooterView reuseIdentifier];
    [v6 registerClass:v36 forHeaderFooterViewReuseIdentifier:v37];

    uint64_t v38 = objc_opt_class();
    v39 = +[HomeActionFooterView classReuseIdentifier];
    [v6 registerClass:v38 forHeaderFooterViewReuseIdentifier:v39];

    uint64_t v40 = objc_opt_class();
    v41 = +[ShortcutsRowTableViewCell identifier];
    [v6 registerClass:v40 forCellReuseIdentifier:v41];

    uint64_t v42 = objc_opt_class();
    v43 = +[HomeCuratedCollectionsTableViewCell identifier];
    [v6 registerClass:v42 forCellReuseIdentifier:v43];
  }
  return v8;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DataSource *)self active] != a3)
  {
    v5 = sub_1000AA148();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HCP setActive %@", buf, 0xCu);
    }

    v18.receiver = self;
    v18.super_class = (Class)HomeCellProvider;
    [(DataSource *)&v18 setActive:v3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v7 = [(HomeCellProvider *)self _allDataProviders];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) setActive:v3];
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    if (v3)
    {
      [(HomeCellProvider *)self _setNeedsSnapshotUpdateAnimated:0];
      [(HomeCellProvider *)self _fetchMissingImages];
      objc_initWeak((id *)buf, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1008413DC;
      v12[3] = &unk_1012E6708;
      objc_copyWeak(&v13, (id *)buf);
      [(HomeCellProvider *)self _getRecentsWithCompletion:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      self->_appliedActiveUpdate = 0;
      LOBYTE(v11) = 0;
      [(DataSource *)self sendAnalyticsForDataAtIndexPath:0 object:0 childPlaceIndexPath:0 childPlaceObject:0 action:0 eventValue:0 populateSearchTapEvent:v11];
    }
  }
}

- (void)_fetchMissingImages
{
  if ([(DataSource *)self active])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v3 = [(DataSource *)self tableView];
    v4 = [v3 visibleCells];

    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = sub_100841584(*(void **)(*((void *)&v10 + 1) + 8 * (void)v8));
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 fetchMissingImages];
          }

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (SuggestionsItemSource)suggestionsItemSource
{
  return [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestionsItemSource];
}

- (void)resetScrollOffset
{
  self->_needsResetFavoritesScrollOffset = 1;
  self->_needsResetCuratedCollectionsScrollOffset = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(DataSource *)self tableView];
  v4 = [v3 visibleCells];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = sub_100841584(*(void **)(*((void *)&v10 + 1) + 8 * (void)v8));
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 resetScrollOffset];
          self->_needsResetFavoritesScrollOffset = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 resetScrollOffset];
          self->_needsResetCuratedCollectionsScrollOffset = 0;
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setPoiEnrichmentActionDelegate:(id)a3
{
}

- (UGCPOIEnrichmentActionDelegate)poiEnrichmentActionDelegate
{
  return [(FeatureDiscoveryDataProvider *)self->_featureDiscoveryDataProvider poiEnrichmentActionDelegate];
}

- (void)setTransitPayActionDelegate:(id)a3
{
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return [(FeatureDiscoveryDataProvider *)self->_featureDiscoveryDataProvider transitPayActionDelegate];
}

- (void)setOfflineMapsDiscoveryActionDelegate:(id)a3
{
}

- (OfflineMapsFeatureDiscoveryActionDelegate)offlineMapsDiscoveryActionDelegate
{
  return [(FeatureDiscoveryDataProvider *)self->_featureDiscoveryDataProvider offlineMapsDiscoveryActionDelegate];
}

- (void)_createDataProviders
{
  BOOL v3 = objc_alloc_init(FeatureDiscoveryDataProvider);
  featureDiscoveryDataProvider = self->_featureDiscoveryDataProvider;
  self->_featureDiscoveryDataProvider = v3;

  objc_initWeak(&location, self);
  id v5 = [SuggestionsDataProvider alloc];
  int64_t viewMode = self->_viewMode;
  id v7 = objc_alloc((Class)MapsSuggestionsBlockFilter);
  CGFloat v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_100841A4C;
  id v26 = &unk_1012FA738;
  objc_copyWeak(&v27, &location);
  id v8 = [v7 initWithBlock:&v23];
  uint64_t v9 = -[SuggestionsDataProvider initWithViewMode:filter:includePlaceholderShortcuts:](v5, "initWithViewMode:filter:includePlaceholderShortcuts:", viewMode, v8, 1, v23, v24, v25, v26);
  suggestionsDataProvider = self->_suggestionsDataProvider;
  self->_suggestionsDataProvider = v9;

  long long v11 = [[SharedTripsDataProvider alloc] initWithCombineAllTrips:1];
  sharedTripsDataProvider = self->_sharedTripsDataProvider;
  self->_sharedTripsDataProvider = v11;

  if (MapsFeature_IsEnabled_SydneyARP())
  {
    long long v13 = [[HomePhotoLookupDataProvider alloc] initWithSuggestionsDataProvider:self->_suggestionsDataProvider];
    photoLookupDataProvider = self->_photoLookupDataProvider;
    self->_photoLookupDataProvider = v13;
  }
  if (GEOConfigGetBOOL())
  {
    long long v15 = [[HomeResultDataProvider alloc] initWithDelegate:self];
    resultDataProvider = self->_resultDataProvider;
    self->_resultDataProvider = v15;
  }
  long long v17 = [[CollectionsDataProvider alloc] initWithContext:2 observeInfo:0 observeContents:0];
  collectionsDataProvider = self->_collectionsDataProvider;
  self->_collectionsDataProvider = v17;

  v19 = objc_alloc_init(MarkedLocationDataProvider);
  markedLocationDataProvider = self->_markedLocationDataProvider;
  self->_markedLocationDataProvider = v19;

  CFStringRef v21 = objc_alloc_init(RecentsDataProvider);
  recentsDataProvider = self->_recentsDataProvider;
  self->_recentsDataProvider = v21;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (id)_allDataProviders
{
  BOOL v3 = +[NSMutableArray array];
  v4 = v3;
  if (self->_featureDiscoveryDataProvider) {
    [v3 addObject:];
  }
  if (self->_suggestionsDataProvider) {
    [v4 addObject:];
  }
  if (self->_sharedTripsDataProvider) {
    [v4 addObject:];
  }
  if (self->_photoLookupDataProvider) {
    [v4 addObject:];
  }
  if (self->_resultDataProvider) {
    [v4 addObject:];
  }
  if (self->_collectionsDataProvider) {
    [v4 addObject:];
  }
  if (self->_markedLocationDataProvider) {
    [v4 addObject:];
  }
  if (self->_recentsDataProvider) {
    [v4 addObject:];
  }
  id v5 = [v4 copy];

  return v5;
}

- (BOOL)_shouldShowEntryOfTypeVehicleSetup:(id)a3
{
  id v3 = a3;
  if (GEOConfigGetBOOL())
  {
    v4 = [v3 uniqueIdentifier];

    if (v4)
    {
      GEOConfigGetDouble();
      double v6 = v5;
      uint64_t Integer = GEOConfigGetInteger();
      id v8 = +[NSUserDefaults standardUserDefaults];
      uint64_t v9 = [v8 dictionaryForKey:@"VehicleSetupShownKey"];
      id v10 = [v9 mutableCopy];
      long long v11 = v10;
      if (v10) {
        long long v12 = v10;
      }
      else {
        long long v12 = objc_alloc_init((Class)NSMutableDictionary);
      }
      long long v14 = v12;

      long long v16 = +[NSUserDefaults standardUserDefaults];
      [v16 doubleForKey:@"LastSuspendTime"];
      double v18 = v17;

      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v20 = [v3 uniqueIdentifier];
      CFStringRef v21 = [v14 objectForKeyedSubscript:v20];

      double v22 = [v3 uniqueIdentifier];
      if (!v21)
      {
        [v14 setObject:&off_1013A8DD0 forKeyedSubscript:v22];

        uint64_t v42 = +[NSNumber numberWithDouble:v6 + v18];
        [v14 setObject:v42 forKeyedSubscript:@"nextUpdated"];

        v43 = +[NSUserDefaults standardUserDefaults];
        id v44 = [v14 copy];
        [v43 setObject:v44 forKey:@"VehicleSetupShownKey"];

        id v25 = sub_1000AA148();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v37 = [v3 uniqueIdentifier];
          long long v45 = +[NSNumber numberWithInteger:Integer];
          long long v46 = [v45 stringValue];
          int v48 = 138412546;
          objc_super v49 = v37;
          __int16 v50 = 2112;
          v51 = v46;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Vehicle Setup Entry from %@ has been shown 1/%@ times", (uint8_t *)&v48, 0x16u);

          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      CGFloat v23 = [v14 valueForKey:v22];
      signed int v24 = [v23 intValue];

      if (Integer > v24)
      {
        id v25 = [v14 objectForKeyedSubscript:@"nextUpdated"];
        [v25 doubleValue];
        if (Current > v26)
        {
          id v27 = [v14 objectForKeyedSubscript:@"nextUpdated"];
          [v27 doubleValue];
          double v29 = v28 - v6;

          if (v18 == v29)
          {
LABEL_21:
            BOOL v15 = 1;
            goto LABEL_22;
          }
          uint64_t v30 = [v3 uniqueIdentifier];
          CGRect v31 = [v14 objectForKeyedSubscript:v30];
          uint64_t v32 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v31 intValue] + 1);
          v33 = [v3 uniqueIdentifier];
          [v14 setObject:v32 forKeyedSubscript:v33];

          uint64_t v34 = +[NSNumber numberWithDouble:v6 + v18];
          [v14 setObject:v34 forKeyedSubscript:@"nextUpdated"];

          v35 = +[NSUserDefaults standardUserDefaults];
          id v36 = [v14 copy];
          [v35 setObject:v36 forKey:@"VehicleSetupShownKey"];

          id v25 = sub_1000AA148();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v37 = [v3 uniqueIdentifier];
            uint64_t v38 = [v3 uniqueIdentifier];
            v39 = [v14 objectForKeyedSubscript:v38];
            uint64_t v40 = +[NSNumber numberWithInteger:Integer];
            v41 = [v40 stringValue];
            int v48 = 138412802;
            objc_super v49 = v37;
            __int16 v50 = 2112;
            v51 = v39;
            __int16 v52 = 2112;
            v53 = v41;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Vehicle Setup Entry from %@ has been shown %@/%@ times", (uint8_t *)&v48, 0x20u);

LABEL_19:
            goto LABEL_20;
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
      long long v14 = sub_1000AA148();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v48) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "VehicleSetup entry must have a uniqueIdentifier to be shown", (uint8_t *)&v48, 2u);
      }
    }
    BOOL v15 = 0;
  }
  else
  {
    long long v13 = +[NSUserDefaults standardUserDefaults];
    [v13 removeObjectForKey:@"VehicleSetupShownKey"];

    long long v14 = sub_1000AA148();
    BOOL v15 = 1;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v48) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "VehicleSetupSuppression is disabled, showing entry", (uint8_t *)&v48, 2u);
    }
  }
LABEL_22:

  return v15;
}

- (id)_suggestionCellModelForMapsSuggestionsEntry:(id)a3
{
  id v4 = a3;
  if (!MapsFeature_IsEnabled_SydneyARP()) {
    goto LABEL_5;
  }
  int64_t v5 = [(HomePhotoLookupDataProvider *)self->_photoLookupDataProvider resultForSuggestionsEntry:v4];
  if (v5)
  {
    if (v5 == 1)
    {
      double v6 = off_1012D3288;
LABEL_6:
      id v7 = [objc_alloc(*v6) initWithEntry:v4];
      goto LABEL_7;
    }
LABEL_5:
    double v6 = &off_1012D3290;
    goto LABEL_6;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)newTraits
{
  v2 = [(DataSource *)self delegate];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___HomeCellProviderDelegate]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 newTraits];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = objc_alloc_init((Class)GEOMapServiceTraits);
  }
  id v7 = v6;

  return v7;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4 = (MarkedLocationDataProvider *)a3;
  id v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    long long v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HDS homeDataProvidingObjectDidUpdate %@", buf, 0xCu);
  }
  id v8 = sub_1000AA148();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HomeDidUpdate", "", buf, 2u);
  }

  if (self->_markedLocationDataProvider == v4 || (MarkedLocationDataProvider *)self->_recentsDataProvider == v4)
  {
    uint64_t v9 = sub_1000AA148();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HomeDidUpdateRequiresRecents", "", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10084250C;
    v10[3] = &unk_1012E6708;
    objc_copyWeak(&v11, (id *)buf);
    [(HomeCellProvider *)self _getRecentsWithCompletion:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(HomeCellProvider *)self _setNeedsSnapshotUpdateAnimated:1];
  }
}

- (void)_getRecentsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(MarkedLocationDataProvider *)self->_markedLocationDataProvider markedLocation];
  if ([(HomeCellProvider *)self _shouldDisplayObject:v6]) {
    [v5 addObject:v6];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(RecentsDataProvider *)self->_recentsDataProvider recents];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if ([(HomeCellProvider *)self _shouldDisplayObject:v12]) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  id v13 = [v5 copy];
  long long v14 = self->_recentsDataFilter;
  objc_initWeak(&location, self);
  recentsDataFilterQueue = self->_recentsDataFilterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008427D4;
  block[3] = &unk_1012FA908;
  uint64_t v20 = v14;
  id v21 = v13;
  id v16 = v13;
  double v17 = v14;
  objc_copyWeak(&v23, &location);
  id v22 = v4;
  id v18 = v4;
  dispatch_async(recentsDataFilterQueue, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)_buildSections
{
  id v3 = +[NSMutableArray array];
  id v4 = [(SharedTripsDataProvider *)self->_sharedTripsDataProvider sharedTripSummaries];
  if (MSPSharedTripReceivingAvailable())
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v99 objects:v107 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v100;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v100 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v99 + 1) + 8 * i);
          if ([(HomeCellProvider *)self _shouldDisplayObject:v10]) {
            [v3 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v99 objects:v107 count:16];
      }
      while (v7);
    }
  }
  v82 = v4;
  id v11 = +[NSMutableArray array];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v12 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestions];
  id v13 = [v12 countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v96;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v96 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = [(HomeCellProvider *)self _suggestionCellModelForMapsSuggestionsEntry:*(void *)(*((void *)&v95 + 1) + 8 * (void)j)];
        if (v17 && [(HomeCellProvider *)self _shouldDisplayObject:v17]) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v95 objects:v106 count:16];
    }
    while (v14);
  }

  v81 = v11;
  [v3 addObjectsFromArray:v11];
  v83 = v3;
  id v18 = [[HomeSection alloc] initWithType:1 contents:v3 showsSectionButton:0 customLocalizedName:0];
  suggestionsSection = self->_suggestionsSection;
  self->_suggestionsSection = v18;

  featureDiscoveryDataProvider = self->_featureDiscoveryDataProvider;
  id v21 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestions];
  [(FeatureDiscoveryDataProvider *)featureDiscoveryDataProvider updateFeaturesWithSuggestions:v21];

  id v22 = [HomeSection alloc];
  id v23 = [(FeatureDiscoveryDataProvider *)self->_featureDiscoveryDataProvider features];
  signed int v24 = [(HomeSection *)v22 initWithType:6 contents:v23 showsSectionButton:0 customLocalizedName:0];
  featureDiscoverySection = self->_featureDiscoverySection;
  self->_featureDiscoverySection = v24;

  long long v26 = [[HomeSection alloc] initWithType:2 contents:&__NSArray0__struct showsSectionButton:1 customLocalizedName:0];
  shortcutsSection = self->_shortcutsSection;
  self->_shortcutsSection = v26;

  if (GEOConfigGetBOOL())
  {
    long long v28 = [(HomeResultDataProvider *)self->_resultDataProvider homeResult];
    double v29 = [v28 curatedCollections];
    if ([v29 count])
    {
      uint64_t v30 = [(HomeResultDataProvider *)self->_resultDataProvider homeResult];
      CGRect v31 = [v30 curatedCollectionSectionName];
      id v32 = [v31 length];

      if (v32)
      {
        v33 = [HomeSection alloc];
        uint64_t v34 = [(HomeResultDataProvider *)self->_resultDataProvider homeResult];
        v35 = [v34 curatedCollectionSectionName];
        id v36 = [(HomeSection *)v33 initWithType:4 contents:&__NSArray0__struct showsSectionButton:0 customLocalizedName:v35];
        curatedCollectionsSection = self->_curatedCollectionsSection;
        self->_curatedCollectionsSection = v36;

        goto LABEL_28;
      }
    }
    else
    {
    }
  }
  uint64_t v34 = self->_curatedCollectionsSection;
  self->_curatedCollectionsSection = 0;
LABEL_28:

  uint64_t v38 = +[NSMutableArray array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v39 = [(CollectionsDataProvider *)self->_collectionsDataProvider collections];
  id v40 = [v39 countByEnumeratingWithState:&v91 objects:v105 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v92;
    do
    {
      for (k = 0; k != v41; k = (char *)k + 1)
      {
        if (*(void *)v92 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v91 + 1) + 8 * (void)k);
        if ([(HomeCellProvider *)self _shouldDisplayObject:v44]) {
          [v38 addObject:v44];
        }
      }
      id v41 = [v39 countByEnumeratingWithState:&v91 objects:v105 count:16];
    }
    while (v41);
  }

  Uuint64_t Integer = GEOConfigGetUInteger();
  id v46 = [v38 count];
  id v47 = [v38 count];
  id v48 = (id)UInteger;
  if ((unint64_t)v47 < UInteger) {
    id v48 = [v38 count];
  }
  BOOL v49 = (unint64_t)v46 > UInteger;
  __int16 v50 = [v38 subarrayWithRange:0, v48];
  id v51 = [v50 mutableCopy];

  __int16 v52 = +[CollectionHandler addToCollection];
  [v51 addObject:v52];

  v80 = v51;
  v53 = [[HomeSection alloc] initWithType:3 contents:v51 showsSectionButton:v49 customLocalizedName:0];
  collectionsSection = self->_collectionsSection;
  self->_collectionsSection = v53;

  unint64_t v55 = GEOConfigGetUInteger();
  NSUInteger v56 = [(NSArray *)self->_filteredRecents count];
  filteredRecents = self->_filteredRecents;
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100843210;
  v90[3] = &unk_1012FA760;
  BOOL v58 = v56 > v55;
  v90[4] = self;
  v90[5] = v55;
  v79 = sub_1000AC254(filteredRecents, v90);
  v59 = [[HomeSection alloc] initWithType:5 contents:v79 showsSectionButton:v58 customLocalizedName:0];
  recentsSection = self->_recentsSection;
  self->_recentsSection = v59;

  v61 = +[NSMutableArray array];
  v62 = v61;
  if (self->_featureDiscoverySection) {
    [v61 addObject:];
  }
  if (self->_suggestionsSection) {
    [v62 addObject:];
  }
  if (self->_shortcutsSection) {
    [v62 addObject:];
  }
  if (self->_recentsSection) {
    [v62 addObject:];
  }
  if (self->_collectionsSection) {
    [v62 addObject:];
  }
  if (self->_curatedCollectionsSection) {
    [v62 addObject:];
  }
  v63 = [v62 copy];
  homeSections = self->_homeSections;
  self->_homeSections = v63;

  [(HomeCellProvider *)self _addAnalyticsInfo];
  [(HomeCellProvider *)self _updateRestaurantReservationAnalytics];
  id v84 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSArray *)self->_homeSections count])
  {
    unint64_t v65 = 0;
    uint64_t v66 = 1;
    do
    {
      v67 = [(NSArray *)self->_homeSections objectAtIndexedSubscript:v65];
      v68 = [v67 keyCommand];
      if (v68)
      {
        v69 = v68;
        v88 = [v68 title];
        v87 = [v69 image];
        id v86 = [v69 action];
        v89 = +[NSNumber numberWithInteger:v66];
        v70 = [v89 stringValue];
        id v71 = [v69 modifierFlags];
        CFStringRef v103 = @"type";
        v85 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v67 type]);
        v72 = [v85 stringValue];
        v104 = v72;
        +[NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        v74 = v73 = v67;
        v75 = +[UIKeyCommand commandWithTitle:v88 image:v87 action:v86 input:v70 modifierFlags:v71 propertyList:v74];

        v67 = v73;
        [v84 addObject:v75];

        ++v66;
      }

      ++v65;
    }
    while (v65 < [(NSArray *)self->_homeSections count]);
  }
  v76 = (NSArray *)[v84 copy];
  keyCommands = self->_keyCommands;
  self->_keyCommands = v76;
}

- (BOOL)_shouldDisplayObject:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A4B98(v4);
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_pendingDeletions objectForKeyedSubscript:v5];
    if (([v6 tentativelyDeleted] & 1) != 0
      || ([v6 completed] & 1) != 0)
    {
      BOOL v7 = 0;
    }
    else if ([v4 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
    {
      id v9 = [v4 entry];
      if ([v9 type] == (id)21) {
        BOOL v7 = +[RatingRequestHomeAvailability shouldShowRatingRequestSuggestionsOnProactiveTray];
      }
      else {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_homeSectionAtStaticIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    if ([(NSArray *)self->_homeSections count] <= a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(NSArray *)self->_homeSections objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (id)_homeSectionAtDynamicIndex:(int64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_homeSections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v11, (void)v14))
        {
          if (v8 == a3)
          {
            id v12 = v11;
            goto LABEL_13;
          }
          ++v8;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_13:

  return v12;
}

- (int64_t)_dynamicIndexOfHomeSection:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_homeSections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v11, (void)v14))
        {
          id v12 = [v11 type];
          if (v12 == [v4 type]) {
            goto LABEL_12;
          }
          ++v8;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v8;
}

- (id)_homeSectionWithType:(int64_t)a3
{
  homeSections = self->_homeSections;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008436C4;
  v6[3] = &unk_1012FA780;
  v6[4] = a3;
  id v4 = sub_1000990A8(homeSections, v6);

  return v4;
}

- (id)_homeSectionAtIndexPath:(id)a3
{
  id v4 = [a3 section];

  return [(HomeCellProvider *)self _homeSectionAtDynamicIndex:v4];
}

- (id)_objectsInSectionAtIndexPath:(id)a3
{
  uint64_t v3 = [(HomeCellProvider *)self _homeSectionAtIndexPath:a3];
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasOrthogonalLayout])
    {
      int64_t v8 = v4;
      uint64_t v5 = +[NSArray arrayWithObjects:&v8 count:1];
    }
    else
    {
      uint64_t v5 = [v4 contents];
    }
    id v6 = (void *)v5;
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HomeCellProvider *)self _objectsInSectionAtIndexPath:v4];
  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v6 = [v4 row], v6 >= objc_msgSend(v5, "count")))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndexedSubscript:[v4 row]];
  }

  return v7;
}

- (id)_allObjects
{
  uint64_t v3 = +[NSMutableArray array];
  if ([(NSArray *)self->_homeSections count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(NSArray *)self->_homeSections objectAtIndexedSubscript:v4];
      id v6 = [v5 contents];
      [v3 addObjectsFromArray:v6];

      ++v4;
    }
    while (v4 < [(NSArray *)self->_homeSections count]);
  }
  id v7 = [v3 copy];

  return v7;
}

- (BOOL)_isEmptySection:(id)a3
{
  id v3 = a3;
  if ([v3 hasOrthogonalLayout])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 contents];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (BOOL)_shouldShowHeaderForSection:(id)a3
{
  id v3 = [a3 localizedName];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)_loadingDataProviders
{
  if ([(SuggestionsDataProvider *)self->_suggestionsDataProvider hasInitialData])
  {
    id v3 = &__NSArray0__struct;
  }
  else
  {
    suggestionsDataProvider = self->_suggestionsDataProvider;
    id v3 = +[NSArray arrayWithObjects:&suggestionsDataProvider count:1];
  }

  return v3;
}

- (BOOL)_isLoading
{
  id v3 = [(HomeCellProvider *)self _loadingDataProviders];
  id v4 = [v3 count];

  BOOL result = [(NSTimer *)self->_initialSuggestionsTimer isValid];
  if (!v4) {
    return 0;
  }
  return result;
}

- (void)_updateInitialSuggestionsTimer
{
  unsigned __int8 v3 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider hasInitialData];
  initialSuggestionsTimer = self->_initialSuggestionsTimer;
  if (v3)
  {
    [(NSTimer *)initialSuggestionsTimer invalidate];
    uint64_t v5 = 0;
  }
  else
  {
    if (initialSuggestionsTimer) {
      return;
    }
    GEOConfigGetDouble();
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_initialSuggestionsTimerDidFire", 0, 0);
    uint64_t v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  }
  id v6 = self->_initialSuggestionsTimer;
  self->_initialSuggestionsTimer = v5;
}

- (void)_initialSuggestionsTimerDidFire
{
  [(NSTimer *)self->_initialSuggestionsTimer invalidate];
  if ([(DataSource *)self active])
  {
    [(HomeCellProvider *)self _setNeedsSnapshotUpdateAnimated:1];
  }
}

- (void)_resetSnapshotUpdateState
{
  self->_animateNextUpdate = 0;
  self->_needsUpdate = 0;
}

- (void)_setNeedsSnapshotUpdateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DataSource *)self active])
  {
    uint64_t v5 = sub_1000AA148();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetNeedsApplySnapshot", "", (uint8_t *)&v16, 2u);
    }

    [(HomeCellProvider *)self _updateInitialSuggestionsTimer];
    if ([(HomeCellProvider *)self _isLoading])
    {
      id v6 = sub_1000AA148();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

      if (!v7) {
        return;
      }
      int64_t v8 = [(HomeCellProvider *)self _loadingDataProviders];
      uint64_t v9 = sub_100099700(v8, &stru_1012FA7A0);
      uint64_t v10 = +[NSSet setWithArray:v9];

      id v11 = sub_1000AA148();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        long long v14 = [v10 allObjects];
        long long v15 = [v14 componentsJoinedByString:@", "];
        int v16 = 138412546;
        long long v17 = v13;
        __int16 v18 = 2112;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ skipping applySnapshot because initial data has not loaded in data providers [%@]", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      if ([(HomeCellProvider *)self _needsSnapshotUpdate]
        && self->_animateNextUpdate != v3
        && self->_appliedInitialUpdate
        && self->_appliedActiveUpdate)
      {
        [(HomeCellProvider *)self updateIfNeeded];
      }
      self->_animateNextUpdate = v3;
      self->_needsUpdate = 1;
      uint64_t v10 = [(HomeCellProvider *)self homeUpdateDelegate];
      [v10 homeSetNeedsUpdate];
    }
  }
}

- (BOOL)_needsSnapshotUpdate
{
  BOOL v3 = [(DataSource *)self active];
  if (v3)
  {
    if ([(HomeCellProvider *)self _isLoading]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = self->_needsUpdate || !self->_appliedInitialUpdate;
    }
  }
  return v3;
}

- (void)updateIfNeeded
{
  if ([(HomeCellProvider *)self _needsSnapshotUpdate])
  {
    if (self->_appliedInitialUpdate)
    {
      if (self->_appliedActiveUpdate)
      {
        BOOL v3 = 0;
        BOOL animateNextUpdate = self->_animateNextUpdate;
      }
      else
      {
        BOOL animateNextUpdate = 0;
        BOOL v3 = 0;
      }
    }
    else
    {
      BOOL animateNextUpdate = 0;
      BOOL v3 = self->_animateNextUpdate;
    }
    self->_appliedInitialUpdate = 1;
    self->_appliedActiveUpdate = 1;
    [(HomeCellProvider *)self _resetSnapshotUpdateState];
    [(HomeCellProvider *)self _applySnapshotUpdateAndAnimateCells:animateNextUpdate animateTableView:v3];
  }

  [(HomeCellProvider *)self _updateOrthogonalSectionCells];
}

- (void)_applySnapshotUpdateAndAnimateCells:(BOOL)a3 animateTableView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = sub_1000AA148();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  uint64_t v9 = sub_1000AA148();
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v12 = sub_100097E28(v5);
    id v13 = sub_100097E28(v4);
    *(_DWORD *)buf = 138412546;
    long long v45 = v12;
    __int16 v46 = 2112;
    id v47 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ApplySnapshot", "animateCells = %@, animateTableView = %@", buf, 0x16u);
  }
  if (v4)
  {
    long long v14 = [(DataSource *)self tableView];
    [v14 alpha];
    uint64_t v16 = v15;

    long long v17 = [(DataSource *)self tableView];
    [v17 setAlpha:0.0];

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100844468;
    v43[3] = &unk_1012E69C0;
    v43[4] = self;
    v43[5] = v16;
    +[UIView animateWithDuration:v43 animations:0.25];
  }
  [(HomeCellProvider *)self _processPendingDeletions];
  __int16 v18 = self->_homeSections;
  [(HomeCellProvider *)self _buildSections];
  id v42 = 0;
  v19 = [(HomeCellProvider *)self _snapshotWithOldHomeSections:v18 outDifference:&v42];
  id v20 = v42;
  if ([v20 hasChanges])
  {
    [(UITableViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v19 animatingDifferences:v5];
    [(HomeCellProvider *)self _configureVisibleHeaders];
    id v21 = [(HomeCellProvider *)self homeActionDelegate];
    [v21 homeContentDidUpdate];
  }
  id v22 = sub_1000AA148();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);

  if (v23)
  {
    unint64_t v41 = v8 - 1;
    signed int v24 = [v20 reloadedItems];
    long long v25 = sub_100099700(v24, &stru_1012FA7E0);

    long long v26 = [v20 insertedItems];
    long long v27 = sub_100099700(v26, &stru_1012FA800);

    long long v28 = [v20 deletedItems];
    double v29 = sub_100099700(v28, &stru_1012FA820);

    uint64_t v30 = sub_1000AA148();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      sub_100097E28(v5);
      CGRect v31 = v40 = v27;
      id v32 = sub_100097E28(v4);
      os_signpost_id_t v39 = v8;
      [v25 componentsJoinedByString:@", "];
      v33 = uint64_t v38 = v25;
      uint64_t v34 = [v40 componentsJoinedByString:@", "];
      v35 = [v29 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138413314;
      long long v45 = v31;
      __int16 v46 = 2112;
      id v47 = v32;
      __int16 v48 = 2112;
      BOOL v49 = v33;
      __int16 v50 = 2112;
      id v51 = v34;
      __int16 v52 = 2112;
      v53 = v35;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "HCP applySnapshot {\n\tanimateCells: %@\n\tanimateTableView: %@\n\treloads: [%@]\n\tinsertions: [%@]\n\tdeletions: [%@]\n}", buf, 0x34u);

      os_signpost_id_t v8 = v39;
      long long v25 = v38;

      long long v27 = v40;
    }

    unint64_t v11 = v41;
  }
  id v36 = sub_1000AA148();
  v37 = v36;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, v8, "ApplySnapshot", "", buf, 2u);
  }
}

- (id)analyticsContext
{
  return self->_analyticsContext;
}

- (void)_addAnalyticsInfo
{
  BOOL v3 = +[NSMutableArray array];
  BOOL v4 = [(HomeSection *)self->_suggestionsSection contents];
  [v3 addObjectsFromArray:v4];

  BOOL v5 = [(HomeSection *)self->_recentsSection contents];
  [v3 addObjectsFromArray:v5];

  id v6 = [[AutocompleteContext alloc] initWithQueryString:&stru_101324E70];
  analyticsContext = self->_analyticsContext;
  self->_analyticsContext = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v12);
        long long v14 = +[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0, (void)v16);
        uint64_t v15 = [(HomeCellProvider *)self analyticsContext];
        [v15 setMatchInfo:v14 forObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_updateRestaurantReservationAnalytics
{
  v2 = [(HomeCellProvider *)self _allObjects];
  BOOL v3 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v17 + 1) + 8 * (void)v8);
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])id v10 = v9; {
        else
        }
          id v10 = 0;
        id v11 = v10;

        id v12 = [v11 entry];
        id v13 = [v12 type];

        if (v13 == (id)8)
        {
          long long v14 = [v11 entry];
          uint64_t v15 = [v14 MKMapItem];
          long long v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 _muid]);
          [v3 addObject:v16];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  +[RestaurantReservationAnalyticsBookedSession removeAnalyticsBookedSessionsFromProactiveTrayIfNotInListOfMuids:v3];
}

- (id)objectsForAnalytics
{
  BOOL v3 = [(HomeCellProvider *)self _allObjects];
  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(HomeCellProvider *)self analyticsContext];
        id v12 = [v11 matchInfoForObject:v10];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (void)sendNoTypingACAnalyticsForSelectedAtIndexPath:(id)a3
{
  id v9 = a3;
  id v4 = [(HomeCellProvider *)self objectsForAnalytics];
  if (v4)
  {
    id v5 = [(HomeCellProvider *)self analyticsContext];
    id v6 = [(HomeCellProvider *)self newTraits];
    id v7 = +[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:v4 context:v5 mapsSuggestionsInsights:0 skipReportASearchItems:1 traits:v6];
  }
  else
  {
    id v7 = 0;
  }
  if (v9)
  {
    uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 row]);
    +[GEOAPPortal captureClientACSuggestionWithQuery:&stru_101324E70 queryTokens:0 entries:v7 selectedIndex:v8 selectedSectionIndex:0 withinSectionSelectedIndex:0 isRetainedQuery:0 isRerankerTriggered:0 shouldDifferentiateClientAndServerResults:0];
  }
  else
  {
    +[GEOAPPortal captureClientACSuggestionWithQuery:&stru_101324E70 queryTokens:0 entries:v7 selectedIndex:0 selectedSectionIndex:0 withinSectionSelectedIndex:0 isRetainedQuery:0 isRerankerTriggered:0 shouldDifferentiateClientAndServerResults:0];
  }
}

- (int)targetForDragAnalytics
{
  return 8;
}

- (void)_captureTapActionWithObject:(id)a3 indexPath:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  +[GEOAPPortal captureUserAction:2007 target:8 value:0];
  if ([v47 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
  {
    id v7 = [v47 entry];
    uint64_t v8 = [v7 analyticsGrouping];
    uint64_t v9 = 2039;
LABEL_15:
    +[GEOAPPortal captureUserAction:v9 target:8 value:v8];

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v47;
    id v11 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
    objc_opt_class();
    id v12 = v10;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
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
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 stringValue];
      uint64_t v9 = 175;
      goto LABEL_15;
    }
    id v18 = v12;
    long long v19 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
    objc_opt_class();
    id v20 = v18;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    if (v22
      && ([v22 historyEntry],
          BOOL v23 = objc_claimAutoreleasedReturnValue(),
          unsigned int v24 = [v23 conformsToProtocol:v19],
          v23,
          v24))
    {
      id v25 = v20;
    }
    else
    {
      id v25 = 0;
    }

    if (!v25)
    {
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 stringValue];
      uint64_t v9 = 2064;
      goto LABEL_15;
    }
    id v26 = v20;
    long long v27 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
    objc_opt_class();
    id v28 = v26;
    if (objc_opt_isKindOfClass()) {
      double v29 = v28;
    }
    else {
      double v29 = 0;
    }
    id v30 = v29;

    if (v30
      && ([v30 historyEntry],
          CGRect v31 = objc_claimAutoreleasedReturnValue(),
          unsigned int v32 = [v31 conformsToProtocol:v27],
          v31,
          v32))
    {
      id v7 = v28;
    }
    else
    {
      id v7 = 0;
    }

    v33 = [v7 historyEntry];
    uint64_t v34 = [v33 endWaypoint];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v36 = [v7 historyEntry];
    v37 = v36;
    if (isKindOfClass)
    {
      uint64_t v38 = [v36 endWaypoint];

      os_signpost_id_t v39 = [v38 route];
      id v40 = [v39 source];

      if (v40 == (id)3)
      {
        unint64_t v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
        id v42 = [v41 stringValue];
        uint64_t v43 = 468;
      }
      else
      {
        if (v40 != (id)2)
        {
LABEL_50:

          goto LABEL_16;
        }
        unint64_t v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
        id v42 = [v41 stringValue];
        uint64_t v43 = 462;
      }
      +[GEOAPPortal captureUserAction:v43 target:8 value:v42];
    }
    else
    {
      uint64_t v44 = [v36 waypoints];
      id v45 = [v44 count];

      if ((unint64_t)v45 > 2) {
        uint64_t v46 = 302;
      }
      else {
        uint64_t v46 = 303;
      }
      uint64_t v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
      unint64_t v41 = [v38 stringValue];
      +[GEOAPPortal captureUserAction:v46 target:8 value:v41];
    }

    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v47 _transportTypeStringForAnalytics];
    +[GEOAPPortal captureUserAction:9003 target:737 value:v7];
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v47;
    if ([v7 handlerType] == (id)4) {
      -[HomeCellProvider _captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](self, "_captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2099, v7, [v6 row]);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)_captureShareActionWithObject:(id)a3 indexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  +[GEOAPPortal captureUserAction:2037 target:8 value:0];
  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel]) {
    +[GEOAPPortal captureUserAction:2040 target:8 value:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[GEOAPPortal captureUserAction:2008 target:8 value:0];
    id v7 = v9;
    id v8 = [v7 handlerType];
    if (v8 == (id)4)
    {
      -[HomeCellProvider _captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](self, "_captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2096, v7, [v6 row]);
    }
    else if (!v8)
    {
      +[GEOAPPortal captureUserAction:2082 target:8 value:0];
    }
  }
}

- (void)_captureDeleteActionWithObject:(id)a3 indexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (([v9 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel] & 1) == 0)
  {
    +[GEOAPPortal captureUserAction:2038 target:8 value:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[GEOAPPortal captureUserAction:2009 target:8 value:0];
      id v7 = v9;
      id v8 = [v7 handlerType];
      if (v8 == (id)4)
      {
        -[HomeCellProvider _captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](self, "_captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2088, v7, [v6 row]);
      }
      else if (!v8)
      {
        +[GEOAPPortal captureUserAction:2081 target:8 value:0];
      }
    }
  }
}

- (void)_captureSuggestionDeleteActionWithEntry:(id)a3 behaviour:(int64_t)a4
{
  id v5 = [a3 proactiveItemType];
  if (v5 >= 0x17)
  {
    id v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
  }
  else
  {
    id v6 = *(&off_1012FAA10 + (int)v5);
  }
  if (unint64_t)a4 <= 8 && ((0x117u >> a4))
  {
    uint64_t v7 = dword_100F725F8[a4];
    uint64_t v8 = dword_100F7261C[a4];
    id v9 = v6;
    +[GEOAPPortal captureUserAction:v7 target:8 value:0];
    +[GEOAPPortal captureUserAction:v8 target:8 value:v9];
    id v6 = v9;
  }
}

- (void)_captureHeaderActionWithHomeSection:(id)a3
{
  if ([a3 type] == (id)2)
  {
    +[GEOAPPortal captureUserAction:2045 target:8 value:0];
  }
}

- (void)_captureCuratedCollectionAction:(int)a3 withCollectionHandler:(id)a4 verticalIndex:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[HomeAnalyticsManager captureCuratedCollectionAction:v6 withCollectionHandler:v7 verticalIndex:a5];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [collectionHandler isKindOfClass:CuratedCollectionHandler.class]", v8, 2u);
  }
}

- (id)_snapshotWithOldHomeSections:(id)a3 outDifference:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100104054;
  id v22 = sub_1001048A8;
  BOOL v23 = [[MapsUIDiffableDataSourceSnapshotDifference alloc] initWithReloadedItems:&__NSArray0__struct insertedItems:&__NSArray0__struct deletedItems:&__NSArray0__struct];
  id v7 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  homeSections = self->_homeSections;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008456B4;
  v14[3] = &unk_1012FA870;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v17 = &v18;
  [(NSArray *)homeSections enumerateObjectsUsingBlock:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008458B4;
  v13[3] = &unk_1012FA898;
  v13[4] = self;
  v13[5] = &v18;
  [v9 enumerateObjectsUsingBlock:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v39 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_100104054;
  v60 = sub_1001048A8;
  id v61 = 0;
  id v10 = [(HomeCellProvider *)self _objectsInSectionAtIndexPath:v8];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10084645C;
  v52[3] = &unk_1012F1898;
  id v11 = v9;
  id v53 = v11;
  unint64_t v55 = &v56;
  id v12 = v8;
  id v54 = v12;
  [v10 enumerateObjectsUsingBlock:v52];

  id v13 = [(HomeCellProvider *)self objectAtIndexPath:v57[5]];
  uint64_t v38 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v57[5]];
  id v14 = sub_1000AA148();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "HDS cellForRowAtIndexPath %@ %@", buf, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = +[TwoLinesTableViewCell identifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v15 forIndexPath:v12];

    id v17 = +[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:v13 showAutocompleteClientSource:0 showPlaceContext:0];
    [v16 setViewModel:v17];
LABEL_30:

    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = +[TwoLinesTableViewCell identifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v18 forIndexPath:v12];

    id v17 = +[TwoLinesContentViewModelComposer cellModelForRecentContact:v13];
    [v16 setViewModel:v17];
    goto LABEL_30;
  }
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
  {
    id v17 = v13;
    long long v19 = +[TwoLinesTableViewCell identifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v19 forIndexPath:v12];

    uint64_t v20 = [v17 entry];
    id v21 = [v17 title];
    id v22 = [v17 subtitle];
    BOOL v23 = +[TwoLinesContentViewModelComposer cellModelForMapsSuggestionEntry:v20 title:v21 subtitle:v22];

    unsigned int v24 = [v17 entry];
    if (MapsFeature_IsEnabled_LagunaBeach()
      && ([v24 type] == (id)21 || GEOConfigGetBOOL()))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v25 = -[UGCProactiveCallToActionButtonView initWithFrame:]([UGCProactiveCallToActionButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        -[UGCProactiveCallToActionButtonView systemLayoutSizeFittingSize:](v25, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
        -[UGCProactiveCallToActionButtonView setFrame:](v25, "setFrame:", 0.0, 0.0, v26, v27);
        [(UGCProactiveCallToActionButtonView *)v25 setDelegate:self];
        id v28 = [v24 uniqueIdentifier];
        [(UGCProactiveCallToActionButtonView *)v25 setLookupIdentifier:v28];

        [v23 setCustomAccessoryView:v25];
      }
    }
    [v16 setViewModel:v23];

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v29 = +[TwoLinesTableViewCell identifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v29 forIndexPath:v12];

    id v17 = +[TwoLinesContentViewModelComposer cellModelForSearchResult:v13];
    [v16 setViewModel:v17];
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v13;
    id v30 = +[TwoLinesTableViewCell identifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v30 forIndexPath:v12];

    CGRect v31 = +[TwoLinesContentViewModelComposer cellModelForSharedTripSummary:v17];
    [v16 setViewModel:v31];

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v13;
    unsigned int v32 = +[CollectionTableViewCell identifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v32 forIndexPath:v12];
    [v16 setCollectionInfo:v17];

    goto LABEL_30;
  }
  if ([v38 type] == (id)2)
  {
    v33 = +[ShortcutsRowTableViewCell identifier];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v63 = sub_100104054;
    v64 = sub_1001048A8;
    id v65 = 0;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1008464F8;
    v46[3] = &unk_1012FA8C0;
    id v51 = buf;
    id v47 = v39;
    id v17 = v33;
    id v48 = v17;
    id v49 = v12;
    __int16 v50 = self;
    +[UIView performWithoutAnimation:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSHashTable *)self->_orthogonalSectionCells addObject:*(void *)(*(void *)&buf[8] + 40)];
    }
    [*(id *)(*(void *)&buf[8] + 40) setAccessibilityIdentifier:@"ShortcutsSectionCell"];
    id v16 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  if ([v38 type] == (id)4)
  {
    uint64_t v34 = +[HomeCuratedCollectionsTableViewCell identifier];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v63 = sub_100104054;
    v64 = sub_1001048A8;
    id v65 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10084672C;
    v40[3] = &unk_1012FA8C0;
    id v45 = buf;
    id v41 = v39;
    id v17 = v34;
    id v42 = v17;
    id v43 = v12;
    uint64_t v44 = self;
    +[UIView performWithoutAnimation:v40];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSHashTable *)self->_orthogonalSectionCells addObject:*(void *)(*(void *)&buf[8] + 40)];
    }
    [*(id *)(*(void *)&buf[8] + 40) setAccessibilityIdentifier:@"CuratedCollectionsSectionCell"];
    id v16 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v13;
    v35 = +[FeatureDiscoveryTableViewCell reuseIdentifier];
    id v16 = [v39 dequeueReusableCellWithIdentifier:v35 forIndexPath:v12];

    id v36 = [v16 featureDiscoveryView];
    [v36 setModel:v17];

    [v16 setContext:0];
    goto LABEL_30;
  }
  id v16 = 0;
LABEL_31:

  _Block_object_dispose(&v56, 8);

  return v16;
}

- (void)_updateOrthogonalSectionCells
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_orthogonalSectionCells;
  id v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updateHidden:v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  long long v7 = +[NSIndexPath indexPathForRow:0 inSection:a4];
  long long v8 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v7];

  double v9 = 0.0;
  if (![(HomeCellProvider *)self _isEmptySection:v8]
    && [(HomeCellProvider *)self _shouldShowHeaderForSection:v8])
  {
    id v10 = [v6 _maps_indexOfFirstNonEmptySection];
    id v11 = [v8 localizedName];
    unsigned int v12 = [v8 showsSectionButton];
    if (v12)
    {
      id v13 = [v8 localizedButtonName];
    }
    else
    {
      id v13 = 0;
    }
    BOOL v14 = v10 == (id)a4;
    id v15 = [(DataSource *)self tableView];
    [v15 bounds];
    double Width = CGRectGetWidth(v21);
    id v17 = [(DataSource *)self tableView];
    uint64_t v18 = [v17 traitCollection];
    +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:v14 title:v11 actionTitle:v13 availableWidth:v18 traitCollection:Width];
    double v9 = v19;

    if (v12) {
  }
    }

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  long long v7 = +[NSIndexPath indexPathForRow:0 inSection:a4];
  long long v8 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v7];

  double v9 = 0;
  if (![(HomeCellProvider *)self _isEmptySection:v8])
  {
    if ([(HomeCellProvider *)self _shouldShowHeaderForSection:v8])
    {
      id v10 = +[SectionHeaderTableViewHeaderFooterView reuseIdentifier];
      double v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v10];

      [(HomeCellProvider *)self _configureHeaderView:v9 inSection:a4];
      id v11 = [v8 _maps_diffableDataSourceIdentifier];
      unsigned int v12 = [@"Home" stringByAppendingString:v11];
      [v9 setAccessibilityIdentifiersWithBaseString:v12];
    }
    else
    {
      double v9 = 0;
    }
  }

  return v9;
}

- (void)_configureVisibleHeaders
{
  id v3 = [(DataSource *)self tableView];
  uint64_t v4 = (uint64_t)[v3 numberOfSections];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = [(DataSource *)self tableView];
      [v6 rectForHeaderInSection:v5];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;

      id v15 = [(DataSource *)self tableView];
      [v15 bounds];
      v26.origin.x = v16;
      v26.origin.y = v17;
      v26.size.width = v18;
      v26.size.height = v19;
      v25.origin.x = v8;
      v25.origin.y = v10;
      v25.size.width = v12;
      v25.size.height = v14;
      BOOL v20 = CGRectIntersectsRect(v25, v26);

      if (v20)
      {
        CGRect v21 = [(DataSource *)self tableView];
        id v22 = [v21 headerViewForSection:v5];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(HomeCellProvider *)self _configureHeaderView:v22 inSection:v5];
        }
      }
      ++v5;
      BOOL v23 = [(DataSource *)self tableView];
      id v24 = [v23 numberOfSections];
    }
    while (v5 < (uint64_t)v24);
  }
}

- (void)_configureHeaderView:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = +[NSIndexPath indexPathForRow:0 inSection:a4];
  CGFloat v8 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v7];

  if (![(HomeCellProvider *)self _isEmptySection:v8])
  {
    double v9 = [v8 localizedName];
    [v6 setTitle:v9];

    CGFloat v10 = [(DataSource *)self tableView];
    objc_msgSend(v6, "setFirstNonEmptySection:", objc_msgSend(v10, "_maps_indexOfFirstNonEmptySection") == (id)a4);

    if ([v8 showsSectionButton])
    {
      double v11 = [v8 localizedButtonName];
      [v6 setActionTitle:v11];
    }
    else
    {
      [v6 setActionTitle:0];
    }
    [v6 setShowsBottomHairline:0];
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100847034;
    v15[3] = &unk_1012E6690;
    objc_copyWeak(&v17, &location);
    id v16 = v8;
    [v6 setActionHandler:v15];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100847084;
    v12[3] = &unk_1012EA9E0;
    void v12[4] = self;
    int64_t v14 = a4;
    id v13 = v6;
    +[UIView performWithoutAnimation:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_sectionHeaderButtonTappedWithHomeSection:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(DataSource *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DataSource *)self delegate];
    [v6 dataSource:self sectionHeaderTapped:v7];

    [(HomeCellProvider *)self _captureHeaderActionWithHomeSection:v7];
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  char v5 = +[NSIndexPath indexPathForRow:0 inSection:a4];
  id v6 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v5];

  uint64_t v7 = [(NSArray *)self->_homeSections lastObject];
  if (v6 == (void *)v7)
  {
  }
  else
  {
    CGFloat v8 = (void *)v7;
    unsigned int v9 = [v6 isEqual:v7];

    double v10 = 0.0;
    if (!v9) {
      goto LABEL_6;
    }
  }
  double v10 = UITableViewAutomaticDimension;
LABEL_6:

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[NSIndexPath indexPathForRow:0 inSection:a4];
  CGFloat v8 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v7];

  uint64_t v9 = [(NSArray *)self->_homeSections lastObject];
  if (v8 == (HomeSection *)v9)
  {
  }
  else
  {
    double v10 = (void *)v9;
    unsigned int v11 = [(HomeSection *)v8 isEqual:v9];

    if (!v11)
    {
      id v12 = 0;
      goto LABEL_8;
    }
  }
  id v13 = objc_alloc_init(HomeActionFooterViewModel);
  [(HomeActionFooterViewModel *)v13 setDelegate:self];
  double v14 = 20.0;
  if (v8 == self->_curatedCollectionsSection) {
    double v14 = 11.0;
  }
  [(HomeActionFooterViewModel *)v13 setTopMargin:v14];
  id v15 = +[HomeActionFooterView classReuseIdentifier];
  id v16 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v15];

  [v16 setViewModel:v13];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100847448;
  v19[3] = &unk_1012E5D58;
  id v17 = v16;
  id v20 = v17;
  CGRect v21 = self;
  +[UIView performWithoutAnimation:v19];
  id v12 = v17;

LABEL_8:

  return v12;
}

- (void)homeActionFooterViewDidTapShareMyLocation:(id)a3
{
  id v3 = [(HomeCellProvider *)self homeActionDelegate];
  [v3 homeDidTapShareMyLocation];

  +[HomeAnalyticsManager captureShareMyLocationAction];
}

- (void)homeActionFooterViewDidTapMarkMyLocation:(id)a3
{
  id v3 = [(HomeCellProvider *)self homeActionDelegate];
  [v3 homeDidTapMarkMyLocation];

  +[HomeAnalyticsManager captureMarkMyLocationAction];
}

- (void)homeActionFooterViewDidTapReportAProblem:(id)a3
{
  if ((MapsFeature_IsEnabled_RAPCommunityID() & 1) == 0)
  {
    uint64_t v4 = [(HomeCellProvider *)self homeActionDelegate];
    [v4 homeDidTapReportAProblem];
  }

  +[HomeAnalyticsManager captureRAPAction];
}

- (void)homeActionFooterViewDidTapTermsAndConditions:(id)a3
{
  id v3 = [(HomeCellProvider *)self homeActionDelegate];
  [v3 homeDidTapTermsAndConditions];
}

- (id)homeActionFooterViewUIMenuForRAP:(id)a3
{
  if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    rapReportMenuProvider = self->_rapReportMenuProvider;
    char v5 = [(DataSource *)self tableView];
    id v6 = [v5 _maps_mapsSceneDelegate];
    uint64_t v7 = [(RAPReportMenuProvider *)rapReportMenuProvider getReportMenuFromEntryPoint:8 sceneDelegate:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)deleteContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008477B0;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7E834(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)shareContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10084791C;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7EA98(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)editLocationContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100847A8C;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7E954(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_deleteCollection:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100847DF0;
  v32[3] = &unk_1012FA908;
  id v11 = v8;
  id v33 = v11;
  id v12 = v9;
  id v34 = v12;
  id v13 = v10;
  id v35 = v13;
  objc_copyWeak(&v36, &location);
  double v14 = objc_retainBlock(v32);
  id v15 = [(DataSource *)self tableView];
  id v16 = [v15 cellForRowAtIndexPath:v12];

  id v17 = [(HomeCellProvider *)self deleteDelegate];
  id v38 = v11;
  CGFloat v18 = +[NSArray arrayWithObjects:&v38 count:1];
  [v16 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100847E98;
  v29[3] = &unk_1012E8D90;
  double v27 = v14;
  id v30 = v27;
  id v28 = v13;
  id v31 = v28;
  [v17 confirmDeleteCollections:v18 sourceView:v16 sourceRect:v29 completion:v20 v22 v24 v26];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

- (void)_deleteSharedTripWithSummary:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1008480FC;
  v31[3] = &unk_1012FA908;
  id v11 = v8;
  id v32 = v11;
  id v12 = v9;
  id v33 = v12;
  id v13 = v10;
  id v34 = v13;
  objc_copyWeak(&v35, &location);
  double v14 = objc_retainBlock(v31);
  id v15 = [(DataSource *)self tableView];
  id v16 = [v15 cellForRowAtIndexPath:v12];

  id v17 = [(HomeCellProvider *)self deleteDelegate];
  [v16 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1008481A4;
  v28[3] = &unk_1012E8D90;
  double v26 = v14;
  id v29 = v26;
  id v27 = v13;
  id v30 = v27;
  [v17 confirmDeleteSharedTripWithSummary:v11 sourceView:v16 sourceRect:v28 completion:v19, v21, v23, v25];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (void)deleteRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeCellProvider *)self objectAtIndexPath:v6];
  id v9 = sub_1000AA148();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HCP deleteRowAtIndexPath object %@", (uint8_t *)&v13, 0xCu);
  }

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(HomeCellProvider *)self _deleteCollection:v8 atIndexPath:v6 completion:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(HomeCellProvider *)self _deleteSharedTripWithSummary:v8 atIndexPath:v6 completion:v7];
      }
      else
      {
        id v10 = [HomeDeletion alloc];
        id v11 = objc_alloc_init(IdentifierPath);
        id v12 = [(HomeDeletion *)v10 initWithObject:v8 indexPath:v6 identifierPath:v11 contextualActionCompletionHandler:v7];

        [(HomeCellProvider *)self _beginDeletion:v12];
      }
    }
  }
}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeCellProvider *)self objectAtIndexPath:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(HomeCellProvider *)self shareDelegate];
      id v11 = [(DataSource *)self tableView];
      id v12 = [v11 cellForRowAtIndexPath:v6];
      [v10 shareCollection:v8 sourceView:v12 completion:v7];
    }
    else
    {
      if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
      {
        id v13 = v8;
        id v10 = [(HomeCellProvider *)self shareDelegate];
        double v14 = [v13 entry];
        id v15 = +[ShareItem shareItemForObject:v14];

        id v16 = [(DataSource *)self tableView];
        id v17 = [v16 cellForRowAtIndexPath:v6];
        [v10 shareItem:v15 sourceView:v17 completion:v7];

        goto LABEL_9;
      }
      id v10 = [(HomeCellProvider *)self shareDelegate];
      id v11 = +[ShareItem shareItemForObject:v8];
      id v12 = [(DataSource *)self tableView];
      double v18 = [v12 cellForRowAtIndexPath:v6];
      [v10 shareItem:v11 sourceView:v18 completion:v7];
    }
    goto LABEL_9;
  }
  id v9 = v8;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100848660;
  v19[3] = &unk_1012FA930;
  id v10 = v9;
  id v20 = v10;
  id v22 = v7;
  objc_copyWeak(&v23, &location);
  id v21 = v6;
  [v10 retrieveGeoCollectionWithRefinedItems:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_9:

  [(HomeCellProvider *)self _captureShareActionWithObject:v8 indexPath:v6];
}

- (void)editLocationAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(HomeCellProvider *)self objectAtIndexPath:v6];
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = [v10 entry];
  if ([v11 type] == (id)7)
  {
    [(DataSource *)self sendAnalyticsForDataAtIndexPath:v6 object:v8 action:2010];
    id v12 = +[ParkedCarManager sharedManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100848984;
    v13[3] = &unk_1012FA958;
    v13[4] = self;
    double v14 = v7;
    [v12 fetchParkedCar:v13];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (void)_beginDeletion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = sub_1000A4B98(v5);
  id v7 = [(NSMutableDictionary *)self->_pendingDeletions objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = sub_1000AA148();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "HCP _beginDeletion: %@", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_pendingDeletions setObject:v4 forKeyedSubscript:v6];
    objc_initWeak((id *)buf, self);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100849160;
    v56[3] = &unk_1012FA980;
    id v9 = v6;
    id v57 = v9;
    id v10 = v4;
    id v58 = v10;
    v37 = &v59;
    objc_copyWeak(&v59, (id *)buf);
    id v40 = objc_retainBlock(v56);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10084924C;
    v52[3] = &unk_1012FA9A8;
    id v53 = v9;
    id v11 = v10;
    id v54 = v11;
    id location = &v55;
    objc_copyWeak(&v55, (id *)buf);
    id v41 = objc_retainBlock(v52);
    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
    {
      id v12 = v5;
      id v13 = [v12 entry:&v59, &v55];
      double v14 = sub_100018584();
      [v14 feedbackForEntry:v13 action:5];

      id v15 = [(DataSource *)self tableView];
      id v16 = [v11 indexPath];
      [v15 rectForRowAtIndexPath:v16];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDelegate);
      double v26 = [(DataSource *)self tableView];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100849370;
      v50[3] = &unk_1012E6EA8;
      id v51 = v40;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100849380;
      v46[3] = &unk_1012FA9D0;
      id v27 = v13;
      id v47 = v27;
      objc_copyWeak(&v49, (id *)buf);
      id v48 = v41;
      [WeakRetained viewController:removeMapsSuggestionsEntry:sourceView:sourceRect:startBlock:completionBlock:0 v27 v26 v50 v46 v18 v20 v22 v24];

      objc_destroyWeak(&v49);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v5;
        ((void (*)(void *, uint64_t))v40[2])(v40, v28);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100849538;
        v44[3] = &unk_1012E76C0;
        id v45 = v41;
        [v12 deleteCollection:v44, &v59, &v55];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 markAsCompletedWithSuccess:1 error:0 v59, v55];
          id v12 = objc_loadWeakRetained((id *)&self->_deleteDelegate);
          [v12 deleteMarkedLocation:v5];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            ((void (*)(void *, uint64_t))v40[2])(v40, v29);
            recentsDataProvider = self->_recentsDataProvider;
            id v61 = v5;
            id v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1, &v59, &v55);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_100849554;
            v42[3] = &unk_1012E76C0;
            id v43 = v41;
            [(RecentsDataProvider *)recentsDataProvider deleteRecents:v31 completion:v42];

            id v12 = v43;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v11 markAsCompletedWithSuccess:1 error:0 v59, v55];
              id v32 = self->_recentsDataProvider;
              v60 = v5;
              id v12 = +[NSArray arrayWithObjects:&v60 count:1];
              [(RecentsDataProvider *)v32 deleteRecents:v12 completion:&stru_1012FA9F0];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_15;
              }
              id v34 = [v5 sharedTrips:&v59, &v55];
              id v12 = [v34 firstObject];

              if ([v12 hasGroupIdentifier])
              {
                [v11 markAsCompletedWithSuccess:1 error:0];
                id v35 = +[MSPSharedTripService sharedInstance];
                id v36 = [v12 groupIdentifier];
                [v35 blockSharedTripWithIdentifier:v36];
              }
              else
              {
                [v11 markAsCompletedWithSuccess:0 error:0];
              }
            }
          }
        }
      }
    }

LABEL_15:
    id v33 = [v11 indexPath:v37];
    [(HomeCellProvider *)self _captureDeleteActionWithObject:v5 indexPath:v33];

    objc_destroyWeak(location);
    objc_destroyWeak(v38);

    objc_destroyWeak((id *)buf);
  }
}

- (void)_endDeletion:(id)a3
{
  id v4 = a3;
  if ([v4 completed])
  {
    id v5 = [v4 object];
    id v6 = sub_1000A4B98(v5);
    id v7 = sub_1000AA148();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "HCP _endDeletion: %@", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableDictionary *)self->_pendingDeletions setObject:0 forKeyedSubscript:v6];
    if (([v4 tentativelyDeleted] & 1) == 0)
    {
      id v8 = [v4 contextualActionCompletionHandler];
      ((void (**)(void, id))v8)[2](v8, [v4 success]);
    }
  }
}

- (void)_processPendingDeletions
{
  id v3 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestions];
  id v5 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [(HomeCellProvider *)self _suggestionCellModelForMapsSuggestionsEntry:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v6);
  }

  id v10 = [(CollectionsDataProvider *)self->_collectionsDataProvider collections];
  [v3 addObjectsFromArray:v10];

  id v11 = [(MarkedLocationDataProvider *)self->_markedLocationDataProvider markedLocation];

  if (v11)
  {
    id v12 = [(MarkedLocationDataProvider *)self->_markedLocationDataProvider markedLocation];
    [v3 addObject:v12];
  }
  id v13 = [(RecentsDataProvider *)self->_recentsDataProvider recents];
  [v3 addObjectsFromArray:v13];

  double v14 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v15 = v3;
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = sub_1000A4B98(*(void **)(*((void *)&v32 + 1) + 8 * (void)j));
        if (v20) {
          [v14 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = [(NSMutableDictionary *)self->_pendingDeletions copy];
  id v22 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v28 + 1) + 8 * (void)k);
        id v27 = [(NSMutableDictionary *)self->_pendingDeletions objectForKeyedSubscript:v26];
        if (([v14 containsObject:v26] & 1) == 0
          && ([v27 completed] & 1) == 0)
        {
          [v27 markAsCompletedWithSuccess:1 error:0];
        }
        if ([v27 completed]) {
          [(HomeCellProvider *)self _endDeletion:v27];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v23);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HomeCellProvider;
  [(DataSource *)&v4 scrollViewDidScroll:a3];
  [(HomeCellProvider *)self _updateOrthogonalSectionCells];
}

- (BOOL)_isTableViewHidden:(id)a3
{
  id v3 = a3;
  if ([v3 isHidden])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v3 superview];
    if ([v5 isHidden])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [v3 window];
      if (v6)
      {
        uint64_t v7 = [v3 superview];
        BOOL v4 = v7 == 0;
      }
      else
      {
        BOOL v4 = 1;
      }
    }
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HomeCellProvider;
  [(DataSource *)&v24 tableView:v8 willDisplayCell:v9 forRowAtIndexPath:v10];
  id v11 = [(HomeCellProvider *)self objectAtIndexPath:v10];
  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
  {
    id v12 = [v11 entry];
    [(DataSource *)self addEKAnalyticsForEntry:v12 tapped:0];
    id v13 = [v12 analyticsGrouping];
    +[GEOAPPortal captureUserAction:359 target:8 value:v13];

    if ([v12 type] == (id)9)
    {
      double v14 = [v12 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
      id v15 = [v12 stringForKey:@"MapsSuggestionsRideBookingRideIDKey"];
      id v16 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v14 rideIdentifier:v15];
      [v16 setViewedInProactiveTray:1];
    }
    else
    {
      if ([v12 type] != (id)8)
      {
        if ([v12 type] == (id)20)
        {
          double v14 = +[MKMapService sharedService];
          [v14 captureUserAction:2108 onTarget:8 eventValue:0];
        }
        else
        {
          if ([v12 type] == (id)21)
          {
            +[GEOAPPortal captureUserAction:2138 target:8 value:0];
            +[GEOAPPortal captureUserAction:339 target:8 value:0];
            goto LABEL_6;
          }
          if ([v12 type] != (id)11) {
            goto LABEL_6;
          }
          double v14 = +[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:v12];
          if ((unint64_t)[v14 count] <= 1) {
            uint64_t v23 = 70;
          }
          else {
            uint64_t v23 = 71;
          }
          +[GEOAPPortal captureUserAction:9002 target:v23 value:0];
        }
LABEL_5:

LABEL_6:
        goto LABEL_15;
      }
      if ([(HomeCellProvider *)self _isTableViewHidden:v8]) {
        goto LABEL_6;
      }
      id v17 = [v8 indexPathsForVisibleRows];
      unsigned int v18 = [v17 containsObject:v10];

      if (!v18) {
        goto LABEL_6;
      }
      double v19 = [v12 MKMapItem];
      double v14 = +[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", [v19 _muid], 1);

      [v14 setViewedInProactiveTray:1];
      double v20 = [v12 MKMapItem];
      [v14 setMuid:[v20 _muid]];

      id v15 = [v12 MKMapItem];
      id v16 = [v15 _restaurantLink_firstProviderIdentifier];
      [v14 setAppID:v16];
    }

    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 markAsDisplayed];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = [v11 _transportTypeStringForAnalytics];
      +[GEOAPPortal captureUserAction:9002 target:737 value:v21];
    }
  }
LABEL_15:
  id v22 = sub_100841584(v9);
  if (self->_needsResetFavoritesScrollOffset)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v22 resetScrollOffset];
      self->_needsResetFavoritesScrollOffset = 0;
    }
  }
  if (self->_needsResetCuratedCollectionsScrollOffset)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v22 resetScrollOffset];
      self->_needsResetCuratedCollectionsScrollOffset = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v22 fetchMissingImages];
  }
  [(HomeCellProvider *)self _updateOrthogonalSectionCells];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  BOOL v4 = [(HomeCellProvider *)self _homeSectionAtIndexPath:a4];
  char v5 = [v4 hasOrthogonalLayout] ^ 1;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [(HomeCellProvider *)self objectAtIndexPath:v11];
  [(HomeCellProvider *)self sendNoTypingACAnalyticsForSelectedAtIndexPath:v11];
  [v6 deselectRowAtIndexPath:v11 animated:1];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___HomeCellModel])
  {
    id v8 = [v7 homeActionObject];
    id v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemTapped:v8];
  }
  else
  {
    id v8 = [(DataSource *)self delegate];
    [v8 dataSource:self itemTapped:v7];
  }

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
  {
    id v10 = [v7 entry];
    [(DataSource *)self addEKAnalyticsForEntry:v10 tapped:1];
  }
  [(HomeCellProvider *)self _captureTapActionWithObject:v7 indexPath:v11];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(HomeCellProvider *)self _homeSectionAtIndexPath:a4];
  switch((unint64_t)[v4 type])
  {
    case 1uLL:
    case 5uLL:
      char v5 = TwoLinesTableViewCell;
      goto LABEL_8;
    case 2uLL:
      char v5 = ShortcutsRowTableViewCell;
      goto LABEL_8;
    case 3uLL:
      char v5 = CollectionTableViewCell;
      goto LABEL_8;
    case 4uLL:
      char v5 = HomeCuratedCollectionsTableViewCell;
LABEL_8:
      [(__objc2_class *)v5 estimatedCellHeight];
      goto LABEL_9;
    case 6uLL:
      +[FeatureDiscoveryTableViewCell estimatedHeightForContext:0];
LABEL_9:
      double v6 = v7;
      break;
    default:
      double v6 = 0.0;
      break;
  }

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(HomeCellProvider *)self objectAtIndexPath:v5];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
  {
    double v7 = [v6 entry];
    id v8 = +[ShareItem shareItemForObject:v7];
    unsigned int v9 = v8 != 0;
  }
  else
  {
    double v7 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v5];
    unsigned int v9 = [v7 hasOrthogonalLayout] ^ 1;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = +[NSMutableArray array];
  double v7 = [(HomeCellProvider *)self objectAtIndexPath:v5];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_7:
    id v11 = [(HomeCellProvider *)self deleteContextualActionAtIndexPath:v5];
    [v6 addObject:v11];

    id v12 = +[ShareItem shareItemForObject:v8];

    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel])
  {
    id v13 = [v8 entry];
    if ([v13 availableRemovalBehaviors])
    {
      id v16 = [(HomeCellProvider *)self deleteContextualActionAtIndexPath:v5];
      [v6 addObject:v16];
    }
    if ([v13 type] == (id)7)
    {
      id v17 = [(HomeCellProvider *)self editLocationContextualActionAtIndexPath:v5];
      [v6 addObject:v17];
    }
    unsigned int v18 = +[ShareItem shareItemForObject:v13];

    if (!v18) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v20 = [(HomeCellProvider *)self deleteContextualActionAtIndexPath:v5];
    [v6 addObject:v20];

LABEL_8:
    id v13 = [(HomeCellProvider *)self shareContextualActionAtIndexPath:v5];
    [v6 addObject:v13];
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    if ([v13 canDelete])
    {
      id v21 = [(HomeCellProvider *)self deleteContextualActionAtIndexPath:v5];
      [v6 addObject:v21];
    }
    if (![v13 canShare]) {
      goto LABEL_9;
    }
LABEL_19:
    double v19 = [(HomeCellProvider *)self shareContextualActionAtIndexPath:v5];
    [v6 addObject:v19];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    id v22 = [v13 sharedTrips];
    if ([v22 count] == (id)1)
    {
      uint64_t v23 = [v13 sharedTrips];
      objc_super v24 = [v23 firstObject];
      unsigned int v25 = [v24 hasGroupIdentifier];

      if (!v25) {
        goto LABEL_9;
      }
      id v22 = [(HomeCellProvider *)self deleteContextualActionAtIndexPath:v5];
      [v6 addObject:v22];
    }

    goto LABEL_9;
  }
LABEL_10:
  double v14 = +[UISwipeActionsConfiguration configurationWithActions:v6];

  return v14;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HomeCellProvider *)self _homeSectionAtIndexPath:v10];
  if ([v11 hasOrthogonalLayout])
  {
    id v12 = &__NSArray0__struct;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HomeCellProvider;
    id v12 = [(DataSource *)&v14 tableView:v8 itemsForBeginningDragSession:v9 atIndexPath:v10];
  }

  return v12;
}

- (void)shortcutsRowTableViewCellAddNewShortcut:(id)a3
{
  id v4 = [(DataSource *)self delegate];
  [v4 dataSource:self itemTapped:@"newShortcutEntry"];
}

- (void)shortcutsRowTableViewCell:(id)a3 openShortcut:(id)a4
{
  id v5 = a4;
  id v6 = [(DataSource *)self delegate];
  [v6 dataSource:self itemTapped:v5];
}

- (void)shortcutsRowTableViewCell:(id)a3 openFavorite:(id)a4
{
  id v5 = a4;
  id v6 = [(DataSource *)self delegate];
  [v6 dataSource:self itemTapped:v5];
}

- (void)proactiveCallToActionButtonViewTapped:(id)a3
{
  id v3 = [a3 lookupIdentifier];
  id v4 = sub_1000AA148();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "UGC - Call to action view tapped with identifier %@", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(HomeCellProvider *)self _allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        if ([v10 conformsToProtocol:&OBJC_PROTOCOL___HomeListSuggestionCellModel]) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          id v13 = [v12 entry];
          objc_super v14 = [v13 uniqueIdentifier];
          unsigned int v15 = [v14 isEqualToString:v3];

          if (v15)
          {
            id v16 = sub_1000AA148();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = v3;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "UGC -  Found a matching suggestion for identifier %@", buf, 0xCu);
            }

            id v17 = [(HomeCellProvider *)self poiEnrichmentActionDelegate];
            unsigned int v18 = [v12 entry];
            double v19 = [v18 geoMapItem];
            [v17 addRatingsForMapItem:v19];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(DataSource *)self delegate];
  [v5 dataSource:self itemTapped:v4];
}

- (void)routeToGuidesHomeFromExploreGuides:(id)a3
{
  id v4 = a3;
  id v6 = [(DataSource *)self delegate];
  id v5 = [v4 guideLocation];

  [v6 dataSource:self itemTapped:v5];
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
}

- (void)collectionsCarouselDidScrollForward
{
}

- (void)collectionsCarouselDidScrollBackward
{
}

- (void)exploreGuidesButtonTapped
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  if ([(NSArray *)self->_keyCommands containsObject:v5])
  {
    id v6 = [v5 propertyList];
    id v7 = [v6 objectForKeyedSubscript:@"type"];
    id v8 = [v7 integerValue];

    id v9 = [(HomeCellProvider *)self _homeSectionWithType:v8];
    unsigned __int8 v10 = [v9 showsSectionButton];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)handleHomeSectionKeyCommand:(id)a3
{
  id v4 = [a3 propertyList];
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  id v6 = [v5 integerValue];

  id v7 = [(HomeCellProvider *)self _homeSectionWithType:v6];
  if (v7)
  {
    id v8 = v7;
    [(HomeCellProvider *)self _sectionHeaderButtonTappedWithHomeSection:v7];
    id v7 = v8;
  }
}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (HomeActionDelegate)homeActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);

  return (HomeActionDelegate *)WeakRetained;
}

- (void)setHomeActionDelegate:(id)a3
{
}

- (HomeUpdateDelegate)homeUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeUpdateDelegate);

  return (HomeUpdateDelegate *)WeakRetained;
}

- (void)setHomeUpdateDelegate:(id)a3
{
}

- (ShareDelegate)shareDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);

  return (ShareDelegate *)WeakRetained;
}

- (void)setShareDelegate:(id)a3
{
}

- (DeleteDelegate)deleteDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDelegate);

  return (DeleteDelegate *)WeakRetained;
}

- (void)setDeleteDelegate:(id)a3
{
}

- (PlaceCardActionDelegate)placeCardActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardActionDelegate);

  return (PlaceCardActionDelegate *)WeakRetained;
}

- (void)setPlaceCardActionDelegate:(id)a3
{
}

- (ParkedCarActionDelegate)parkedCarActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parkedCarActionDelegate);

  return (ParkedCarActionDelegate *)WeakRetained;
}

- (void)setParkedCarActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parkedCarActionDelegate);
  objc_destroyWeak((id *)&self->_placeCardActionDelegate);
  objc_destroyWeak((id *)&self->_deleteDelegate);
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_destroyWeak((id *)&self->_homeUpdateDelegate);
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_orthogonalSectionCells, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_initialSuggestionsTimer, 0);
  objc_storeStrong((id *)&self->_pendingDeletions, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_filteredRecents, 0);
  objc_storeStrong((id *)&self->_featureDiscoverySection, 0);
  objc_storeStrong((id *)&self->_recentsSection, 0);
  objc_storeStrong((id *)&self->_collectionsSection, 0);
  objc_storeStrong((id *)&self->_curatedCollectionsSection, 0);
  objc_storeStrong((id *)&self->_shortcutsSection, 0);
  objc_storeStrong((id *)&self->_suggestionsSection, 0);
  objc_storeStrong((id *)&self->_homeSections, 0);
  objc_storeStrong((id *)&self->_recentsDataFilterQueue, 0);
  objc_storeStrong((id *)&self->_rapReportMenuProvider, 0);
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);
  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_collectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_resultDataProvider, 0);
  objc_storeStrong((id *)&self->_photoLookupDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);

  objc_storeStrong((id *)&self->_featureDiscoveryDataProvider, 0);
}

@end