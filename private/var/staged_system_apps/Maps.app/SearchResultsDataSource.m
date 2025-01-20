@interface SearchResultsDataSource
- (BOOL)_showBottomRoundedCorners:(id)a3 rows:(int64_t)a4;
- (BOOL)_showTopRoundedCorners:(id)a3 rows:(int64_t)a4;
- (BOOL)displayDistance;
- (BOOL)displaysAsChainResult;
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)guideSummaryUsesRichLayout;
- (BOOL)isPresentingAddStopResultsFromWaypointEditor;
- (BOOL)isPresentingSearchAlongTheRouteResults;
- (BOOL)isPresentingVenueClusterResults;
- (BOOL)isShowingClusterResults;
- (BOOL)isSimpleSearchResults;
- (BOOL)placeSummaryUsesRichLayout;
- (BOOL)prefersAddressOverCategory;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)usePlaceSummary;
- (BOOL)usePlaceSummaryForSearchResult:(id)a3;
- (ErrorModeView)structuredRAPAffordance;
- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata;
- (GEOLocation)approxLocation;
- (GEOSearchCategory)searchCategory;
- (MKCollectionCarouselRoutingDelegate)collectionCarouselRoutingDelegate;
- (MKMapServiceTicket)mapServiceTicket;
- (NSArray)sectionIndexTitles;
- (NSCache)curatedGuideViewModels;
- (NSCache)placeSummaryTemplateViewModels;
- (NSDictionary)itemCountInVenue;
- (NSIndexPath)indexPathForRelatedCollectionSection;
- (NSMutableDictionary)impressionElements;
- (NSMutableDictionary)mapitemTemplates;
- (NSString)searchQuery;
- (NSUUID)impressionsSessionIdentifier;
- (SARSearchResultTableViewCellDelegate)searchAlongTheRouteCellDelegate;
- (SearchResultsCuratedCollectionsAnalyticsManager)curatedCollectionsAnalyticsManager;
- (SearchResultsDataSource)initWithTableView:(id)a3;
- (SearchResultsDataSourceContent)content;
- (ShareDelegate)shareDelegate;
- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata;
- (_TtC4Maps28PlaceSummaryAsyncDataManager)placeSummaryAsyncDataManager;
- (_TtC4Maps31PlaceSummaryEVChargerDownloader)evChargerDownloader;
- (_TtC4Maps35CuratedGuideViewModelDataDownloader)curatedGuideDataDownloader;
- (double)currentContentHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)curatedGuideCellViewModelForSearchResult:(id)a3 indexPath:(id)a4;
- (id)impressionElementForSearchResult:(id)a3 indexPath:(id)a4;
- (id)objectAtIndexPath:(id)a3;
- (id)objectsForAnalytics;
- (id)personalizedItemForQuickActionMenuWithCell:(id)a3;
- (id)placeContextViewModelWithMapItem:(id)a3;
- (id)placeSummaryTemplateAtIndexPath:(id)a3;
- (id)placeSummaryTemplateForSearchResult:(id)a3 indexPath:(id)a4;
- (id)shareContextualActionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)visibleImpressionElements;
- (int)targetForDragAnalytics;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addMetricsForGuideSummaryViewModel:(id)a3 atIndexPath:(id)a4;
- (void)addMetricsForPlaceSummaryTemplate:(id)a3 indexPath:(id)a4;
- (void)adjustRAPAffordanceFrameWithTopPadding:(double)a3;
- (void)buildAndCacheCuratedGuideViewModels;
- (void)cachePlaceSummaryTemplates;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)createEVChargersRefreshDownloader;
- (void)dealloc;
- (void)didTapOnAccessoryEntityCallWithCell:(id)a3;
- (void)didTapOnAccessoryEntityDirectionsWithCell:(id)a3;
- (void)didTapOnAccessoryEntityFlyoverWithCell:(id)a3;
- (void)didTapOnAccessoryEntityLookAroundWithCell:(id)a3;
- (void)didTapOnAccessoryEntityWebsiteWithCell:(id)a3;
- (void)didTapOnAddStop:(id)a3;
- (void)didTapOnContainmentParentMapItem:(id)a3 cell:(id)a4;
- (void)didTapOnCuratedGuide:(id)a3 cell:(id)a4;
- (void)didTapOnCuratedGuides:(id)a3 cell:(id)a4;
- (void)didTapOnPhotoCarousel:(id)a3 photoIndex:(int64_t)a4;
- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4;
- (void)didTapOnTappableEntryWithMapItemIdentifier:(id)a3 cell:(id)a4;
- (void)didTapOnUserGeneratedGuide:(id)a3 cell:(id)a4;
- (void)didTapOnUserLibrary:(id)a3 mapItem:(id)a4;
- (void)iterateThroughIndexPathsAndExecuteBlock:(id)a3;
- (void)locationDidUpdate;
- (void)notifyDelegateDidCachePlaceSummaryTemplates;
- (void)refreshEVChargers:(id)a3;
- (void)relatedSectionRouteToCuratedCollection:(id)a3;
- (void)relatedSectionTableViewCellDidScrollBackward;
- (void)relatedSectionTableViewCellDidScrollForward;
- (void)relatedSectionTappedOnCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5;
- (void)resetMapServiceTicket;
- (void)setApproxLocation:(id)a3;
- (void)setCollectionCarouselRoutingDelegate:(id)a3;
- (void)setContent:(id)a3;
- (void)setContent:(id)a3 openAt:(id)a4;
- (void)setCuratedCollectionsAnalyticsManager:(id)a3;
- (void)setCuratedGuideDataDownloader:(id)a3;
- (void)setCuratedGuideViewModels:(id)a3;
- (void)setDisplayDistance:(BOOL)a3;
- (void)setDisplaysAsChainResult:(BOOL)a3;
- (void)setEnableStructuredRAPAffordance:(BOOL)a3;
- (void)setEvChargerDownloader:(id)a3;
- (void)setGuideSummaryLayoutMetadata:(id)a3;
- (void)setGuideSummaryUsesRichLayout:(BOOL)a3;
- (void)setImpressionElements:(id)a3;
- (void)setImpressionsSessionIdentifier:(id)a3;
- (void)setIndexPathForRelatedCollectionSection:(id)a3;
- (void)setIsPresentingAddStopResultsFromWaypointEditor:(BOOL)a3;
- (void)setIsPresentingSearchAlongTheRouteResults:(BOOL)a3;
- (void)setIsPresentingVenueClusterResults:(BOOL)a3;
- (void)setIsShowingClusterResults:(BOOL)a3;
- (void)setIsSimpleSearchResults:(BOOL)a3;
- (void)setMapServiceTicket:(id)a3;
- (void)setMapitemTemplates:(id)a3;
- (void)setPlaceSummaryAsyncDataManager:(id)a3;
- (void)setPlaceSummaryMetadata:(id)a3;
- (void)setPlaceSummaryTemplateViewModels:(id)a3;
- (void)setPlaceSummaryUsesRichLayout:(BOOL)a3;
- (void)setPrefersAddressOverCategory:(BOOL)a3;
- (void)setSearchAlongTheRouteCellDelegate:(id)a3;
- (void)setSearchCategory:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSectionIndexTitles:(id)a3;
- (void)setShareDelegate:(id)a3;
- (void)setStructuredRAPAffordance:(id)a3;
- (void)setUsePlaceSummary:(BOOL)a3;
- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
@end

@implementation SearchResultsDataSource

- (SearchResultsDataSource)initWithTableView:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SearchResultsDataSource;
  v5 = [(DataSource *)&v44 initWithTableView:v4 updateLocation:1];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[_SearchResultTableViewCell identifier];
    [v4 registerClass:v6 forCellReuseIdentifier:v7];

    uint64_t v8 = objc_opt_class();
    v9 = +[_SearchResultTableViewCell accessibilityIdentifier];
    [v4 registerClass:v8 forCellReuseIdentifier:v9];

    uint64_t v10 = objc_opt_class();
    v11 = +[_SearchResultTableViewCell identifier];
    [v4 registerClass:v10 forCellReuseIdentifier:v11];

    uint64_t v12 = objc_opt_class();
    v13 = +[_SearchResultTableViewCell accessibilityIdentifier];
    [v4 registerClass:v12 forCellReuseIdentifier:v13];

    uint64_t v14 = objc_opt_class();
    v15 = +[TwoLinesTableViewCell identifier];
    [v4 registerClass:v14 forCellReuseIdentifier:v15];

    uint64_t v16 = objc_opt_class();
    v17 = +[RelatedSectionTableViewCell identifier];
    [v4 registerClass:v16 forCellReuseIdentifier:v17];

    uint64_t v18 = objc_opt_class();
    v19 = +[RelatedSectionTableViewCell accessibilityIdentifier];
    [v4 registerClass:v18 forCellReuseIdentifier:v19];

    uint64_t v20 = objc_opt_class();
    v21 = +[RelatedSectionTableViewCell identifier];
    [v4 registerClass:v20 forCellReuseIdentifier:v21];

    uint64_t v22 = objc_opt_class();
    v23 = +[RelatedSectionTableViewCell accessibilityIdentifier];
    [v4 registerClass:v22 forCellReuseIdentifier:v23];

    uint64_t v24 = objc_opt_class();
    v25 = +[_SearchResultTableViewCell identifier];
    [v4 registerClass:v24 forCellReuseIdentifier:v25];

    uint64_t v26 = objc_opt_class();
    v27 = +[_SearchResultTableViewCell accessibilityIdentifier];
    [v4 registerClass:v26 forCellReuseIdentifier:v27];

    uint64_t v28 = objc_opt_class();
    v29 = +[PlaceSummaryTableViewCell reuseIdentifier];
    [v4 registerClass:v28 forCellReuseIdentifier:v29];

    uint64_t v30 = objc_opt_class();
    v31 = +[CuratedGuideTableViewCell reuseIdentifier];
    [v4 registerClass:v30 forCellReuseIdentifier:v31];

    v5->_displayDistance = 1;
    v32 = objc_alloc_init(SearchResultsCuratedCollectionsAnalyticsManager);
    curatedCollectionsAnalyticsManager = v5->_curatedCollectionsAnalyticsManager;
    v5->_curatedCollectionsAnalyticsManager = v32;

    v34 = (NSCache *)objc_alloc_init((Class)NSCache);
    placeSummaryTemplateViewModels = v5->_placeSummaryTemplateViewModels;
    v5->_placeSummaryTemplateViewModels = v34;

    [(NSCache *)v5->_placeSummaryTemplateViewModels setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v5->_placeSummaryTemplateViewModels setEvictsObjectsWithDiscardedContent:0];
    v36 = (NSCache *)objc_alloc_init((Class)NSCache);
    curatedGuideViewModels = v5->_curatedGuideViewModels;
    v5->_curatedGuideViewModels = v36;

    [(NSCache *)v5->_curatedGuideViewModels setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v5->_curatedGuideViewModels setEvictsObjectsWithDiscardedContent:0];
    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    impressionElements = v5->_impressionElements;
    v5->_impressionElements = v38;

    uint64_t v40 = +[NSMutableDictionary dictionary];
    mapitemTemplates = v5->_mapitemTemplates;
    v5->_mapitemTemplates = (NSMutableDictionary *)v40;

    v42 = +[NSNotificationCenter defaultCenter];
    [v42 addObserver:v5 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [v4 setPrefetchDataSource:v5];
  }

  return v5;
}

- (void)dealloc
{
  evChargerDownloader = self->_evChargerDownloader;
  self->_evChargerDownloader = 0;

  v4.receiver = self;
  v4.super_class = (Class)SearchResultsDataSource;
  [(SearchResultsDataSource *)&v4 dealloc];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  if ([(SearchResultsDataSource *)self enableStructuredRAPAffordance])
  {
    [(SearchResultsDataSource *)self adjustRAPAffordanceFrameWithTopPadding:26.0];
  }
}

- (void)setPlaceSummaryMetadata:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_placeSummaryMetadata, a3);
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    [(SearchResultsDataSource *)self setPlaceSummaryUsesRichLayout:[(PlaceSummaryMetadata *)self->_placeSummaryMetadata containsPhotoCarouselLine]];
    if ([(SearchResultsDataSource *)self isShowingClusterResults]
      && [(SearchResultsDataSource *)self isPresentingSearchAlongTheRouteResults])
    {
      uint64_t v6 = [(DataSource *)self tableView];
      v7 = v6;
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v6 = [(DataSource *)self tableView];
      v7 = v6;
      uint64_t v8 = 0;
    }
    [v6 setSeparatorStyle:v8];

    v9 = sub_100109E50();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [(SearchResultsDataSource *)self placeSummaryUsesRichLayout];
      CFStringRef v11 = @"NO";
      if (v10) {
        CFStringRef v11 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Place Summary] PlaceSummaryUsesRichLayout: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)setGuideSummaryLayoutMetadata:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, a3);
  -[SearchResultsDataSource setGuideSummaryUsesRichLayout:](self, "setGuideSummaryUsesRichLayout:", [v5 guideSummaryUsesRichLayout]);
  uint64_t v6 = sub_100109E50();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(SearchResultsDataSource *)self guideSummaryUsesRichLayout];
    CFStringRef v8 = @"NO";
    if (v7) {
      CFStringRef v8 = @"YES";
    }
    int v9 = 138412290;
    CFStringRef v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Place Summary] GuideSummaryUsesRichLayout: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (id)shareContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006FE9F4;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = sub_100B7EA98(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)objectsForAnalytics
{
  v2 = [(SearchResultsDataSourceContent *)self->_content objects];
  id v3 = [v2 copy];

  return v3;
}

- (int)targetForDragAnalytics
{
  return 101;
}

- (id)impressionElementForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MapsFeature_IsEnabled_SearchResultsImpressions())
  {
    CFStringRef v8 = [(SearchResultsDataSource *)self impressionElements];
    id v9 = [v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      id v10 = [(SearchResultsDataSource *)self impressionElements];
      id v11 = [(SearchResultsImpressionMetadata *)v10 objectForKeyedSubscript:v7];
    }
    else
    {
      uint64_t v28 = [SearchResultsImpressionMetadata alloc];
      uint64_t v12 = [v6 resultIndex];
      CFStringRef v13 = [v6 mapItem];
      id v14 = [v13 _muid];
      v15 = [v6 mapItem];
      uint64_t v16 = [v15 place];
      id v17 = [v16 localSearchProviderID];
      uint64_t v18 = [(SearchResultsDataSource *)self searchQuery];
      id v10 = [(SearchResultsImpressionMetadata *)v28 initWithResultIndex:v12 businessId:v14 localSearchProviderId:v17 query:v18];

      id v19 = objc_alloc((Class)MUImpressionElement);
      uint64_t v20 = [v6 impressionElementIdentifier];
      GEOConfigGetDouble();
      id v11 = [v19 initWithElementIdentifier:v20];

      [v11 setCustomData:v10];
      v21 = [(SearchResultsDataSource *)self impressionsSessionIdentifier];
      [v11 setSessionIdentifier:v21];

      id v22 = [v7 section];
      id v23 = [v7 row];
      uint64_t v24 = [v6 mapItem];
      v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SearchResult at section %ld, index %ld, muid %llu", v22, v23, [v24 _muid]);
      [v11 setDebugString:v25];

      uint64_t v26 = [(SearchResultsDataSource *)self impressionElements];
      [v26 setObject:v11 forKeyedSubscript:v7];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (double)currentContentHeight
{
  +[_SearchResultTableViewCell cellHeight];
  return v2 * 3.0;
}

- (void)setContent:(id)a3
{
  id v5 = (SearchResultsDataSourceContent *)a3;
  if (self->_content != v5)
  {
    id v14 = v5;
    objc_storeStrong((id *)&self->_content, a3);
    [(SearchResultsDataSource *)self setIndexPathForRelatedCollectionSection:0];
    id v6 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    placeSummaryAsyncDataManager = self->_placeSummaryAsyncDataManager;
    self->_placeSummaryAsyncDataManager = v6;

    CFStringRef v8 = objc_alloc_init(_TtC4Maps35CuratedGuideViewModelDataDownloader);
    curatedGuideDataDownloader = self->_curatedGuideDataDownloader;
    self->_curatedGuideDataDownloader = v8;

    id v10 = [(SearchResultsDataSource *)self impressionElements];
    [v10 removeAllObjects];

    id v11 = [(SearchResultsDataSource *)self placeSummaryTemplateViewModels];
    [v11 removeAllObjects];

    uint64_t v12 = [(SearchResultsDataSource *)self curatedGuideViewModels];
    [v12 removeAllObjects];

    [(SearchResultsDataSource *)self cachePlaceSummaryTemplates];
    [(SearchResultsDataSource *)self buildAndCacheCuratedGuideViewModels];
    CFStringRef v13 = [(DataSource *)self delegate];
    [v13 dataSourceUpdated:self];

    [(SearchResultsDataSource *)self createEVChargersRefreshDownloader];
    id v5 = v14;
  }
}

- (void)setContent:(id)a3 openAt:(id)a4
{
  objc_storeStrong((id *)&self->_openAt, a4);
  id v6 = a3;
  [(SearchResultsDataSource *)self setContent:v6];
}

- (void)refreshEVChargers:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 mapItem];
        id v11 = [v10 _identifier];

        uint64_t v12 = [(NSMutableDictionary *)self->_mapitemTemplates objectForKeyedSubscript:v11];

        if (v12)
        {
          evChargerDownloader = self->_evChargerDownloader;
          id v14 = [(NSMutableDictionary *)self->_mapitemTemplates objectForKeyedSubscript:v11];
          v15 = [v9 mapItem];
          [(PlaceSummaryEVChargerDownloader *)evChargerDownloader refreshResultForForTemplate:v14 mapItem:v15];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)createEVChargersRefreshDownloader
{
  id v3 = [(SearchResultsDataSourceContent *)self->_content objects];
  id v4 = [v3 count];

  if (v4)
  {
    if (!self->_evChargerDownloader)
    {
      id v5 = objc_alloc_init(_TtC4Maps31PlaceSummaryEVChargerDownloader);
      evChargerDownloader = self->_evChargerDownloader;
      self->_evChargerDownloader = v5;
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1006FF148;
    v7[3] = &unk_1012F5F78;
    v7[4] = self;
    [(SearchResultsDataSource *)self iterateThroughIndexPathsAndExecuteBlock:v7];
  }
}

- (void)setIsPresentingSearchAlongTheRouteResults:(BOOL)a3
{
  if (self->_isPresentingSearchAlongTheRouteResults != a3)
  {
    self->_isPresentingSearchAlongTheRouteResults = a3;
    id v4 = [(SearchResultsDataSource *)self content];

    if (v4)
    {
      id v5 = [(DataSource *)self delegate];
      [v5 dataSourceUpdated:self];
    }
  }
}

- (void)setSearchAlongTheRouteCellDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchAlongTheRouteCellDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_searchAlongTheRouteCellDelegate, obj);
    id v6 = [(SearchResultsDataSource *)self content];

    id v5 = obj;
    if (v6)
    {
      uint64_t v7 = [(DataSource *)self delegate];
      [v7 dataSourceUpdated:self];

      id v5 = obj;
    }
  }
}

- (id)objectAtIndexPath:(id)a3
{
  return [(SearchResultsDataSourceContent *)self->_content objectAtIndexPath:a3];
}

- (void)setIsPresentingVenueClusterResults:(BOOL)a3
{
  if (self->_isPresentingVenueClusterResults != a3)
  {
    self->_isPresentingVenueClusterResults = a3;
    id v4 = [(SearchResultsDataSource *)self content];

    if (v4)
    {
      id v5 = [(DataSource *)self delegate];
      [v5 dataSourceUpdated:self];
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(SearchResultsDataSource *)self content];
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(SearchResultsDataSource *)self content];
  id v6 = [v5 numberOfRowsInSection:a4];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  BOOL v6 = [a3 _maps_indexOfFirstNonEmptySection] == a4;
  uint64_t v7 = [(SearchResultsDataSource *)self content];
  CFStringRef v8 = [v7 viewForHeaderInSection:a4 isFirstNonEmptySection:v6];

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SearchResultsDataSource *)self content];
  CFStringRef v8 = [v7 titleForHeaderInSection:a4];

  if ([v8 length])
  {
    BOOL v9 = [v6 _maps_indexOfFirstNonEmptySection] == a4;
    id v10 = [v6 traitCollection];
    +[ResultsSectionHeaderView heightWhenFirstNonEmptySection:v9 title:v8 traitCollection:v10];
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v7 = 138412290;
    long long v24 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        double v12 = -[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v11, v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          CFStringRef v13 = v12;
        }
        else {
          CFStringRef v13 = 0;
        }
        id v14 = v13;
        if ([(SearchResultsDataSource *)self usePlaceSummaryForSearchResult:v14]
          && [(SearchResultsDataSource *)self placeSummaryUsesRichLayout])
        {
          v15 = [(SearchResultsDataSource *)self placeSummaryTemplateForSearchResult:v14 indexPath:v11];
          if (v15)
          {
            id v16 = v5;
            long long v17 = sub_100109E50();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              long long v18 = [v14 debugDescription];
              *(_DWORD *)buf = v24;
              uint64_t v30 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[PlaceSummary] Prefetching artwork for %@", buf, 0xCu);
            }
            placeSummaryAsyncDataManager = self->_placeSummaryAsyncDataManager;
            [v15 containerWidth];
            double v21 = v20;
            id v22 = +[MKSystemController sharedInstance];
            [v22 screenScale];
            [(PlaceSummaryAsyncDataManager *)placeSummaryAsyncDataManager loadWith:v15 containerWidth:v21 desiredScale:v23];

            id v5 = v16;
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SearchResultsDataSource *)self objectAtIndexPath:v7];
  unsigned __int8 v9 = +[UIFont accessibilityTextEnabled];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  if ([v11 type] == 11 && (MapsFeature_IsEnabled_SearchAndDiscovery() & 1) == 0)
  {
    double v21 = [v11 relatedSection];

    if (v21)
    {
      double v20 = [v11 relatedSection];
      id v22 = [v20 sectionType];
      if (v22 == (id)2)
      {
        double v12 = 0;
        id v16 = 0;
        goto LABEL_51;
      }
      if (v22 == (id)1)
      {
        double v23 = [v11 relatedSection];
        long long v24 = [v23 relatedPlaceCollections];
        id v25 = [v24 count];

        if (v25)
        {
          if (v9) {
            +[RelatedSectionTableViewCell accessibilityIdentifier];
          }
          else {
          double v12 = +[RelatedSectionTableViewCell identifier];
          }
          uint64_t v40 = [v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7];
          v41 = [v11 relatedSection];
          v42 = [v41 relatedPlaceCollections];
          [v40 setPlaceCollections:v42 delegate:self];

          id v16 = v40;
          v43 = [v20 name];
          [v16 setSectionName:v43];

          objc_super v44 = +[UIColor clearColor];
          [v16 setBackgroundColor:v44];

          goto LABEL_51;
        }
        goto LABEL_26;
      }
    }
    else
    {
      long long v28 = [v11 searchSection];

      if (!v28) {
        goto LABEL_6;
      }
      double v20 = [v11 searchSection];
      id v22 = [v20 sectionType];
      if (v22 == (id)2)
      {
        v37 = [v20 sectionGuide];
        v38 = [v37 placeCollections];
        id v39 = [v38 count];

        if (v39)
        {
          if (v9) {
            +[RelatedSectionTableViewCell accessibilityIdentifier];
          }
          else {
          double v12 = +[RelatedSectionTableViewCell identifier];
          }
          id v16 = [v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7];
          v45 = [v37 placeCollections];
          [v16 setPlaceCollections:v45 delegate:self];

          v46 = [v20 name];
          [v16 setSectionName:v46];

          v47 = +[UIColor clearColor];
          [v16 setBackgroundColor:v47];
        }
        else
        {
          id v16 = (id)objc_opt_new();
          double v12 = 0;
        }

        goto LABEL_51;
      }
      if (v22 == (id)1) {
        goto LABEL_26;
      }
    }
    if (v22)
    {

      goto LABEL_6;
    }
LABEL_26:
    id v16 = (id)objc_opt_new();
    double v12 = 0;
    goto LABEL_51;
  }
LABEL_6:
  double v12 = [v11 personalizedCompoundItem];
  CFStringRef v13 = [v12 address];

  if (v13)
  {
    id v14 = [v12 address];
    v15 = +[TwoLinesTableViewCell identifier];
    id v16 = [v6 dequeueReusableCellWithIdentifier:v15 forIndexPath:v7];

    long long v17 = +[TwoLinesContentViewModelComposer cellModelForAddressBookAddress:v14];
    [v16 setViewModel:v17];

LABEL_8:
    goto LABEL_52;
  }
  if (!MapsFeature_IsEnabled_SearchAndDiscovery()
    || ([v11 placeCollection], long long v18 = objc_claimAutoreleasedReturnValue(), v18, !v18))
  {
    if (!v11)
    {
      id v16 = (id)objc_opt_new();
      goto LABEL_52;
    }
    if ([(SearchResultsDataSource *)self usePlaceSummaryForSearchResult:v11])
    {
      uint64_t v26 = [(SearchResultsDataSource *)self placeSummaryTemplateForSearchResult:v11 indexPath:v7];
      if (v26)
      {
        double v20 = (void *)v26;
        long long v27 = +[PlaceSummaryTableViewCell reuseIdentifier];
        id v16 = [v6 dequeueReusableCellWithIdentifier:v27];

        [v16 setViewModel:v20 delegate:self asyncDataManager:self->_placeSummaryAsyncDataManager];
        goto LABEL_51;
      }
    }
    if ([(SearchResultsDataSource *)self isPresentingSearchAlongTheRouteResults])
    {
      if (v9) {
        +[_SearchResultTableViewCell accessibilityIdentifier];
      }
      else {
      uint64_t v30 = +[_SearchResultTableViewCell identifier];
      }
      id v16 = [v6 dequeueReusableCellWithIdentifier:v30 forIndexPath:v7];
      v31 = [(SearchResultsDataSource *)self searchAlongTheRouteCellDelegate];
      [v16 setDelegate:v31];

      goto LABEL_41;
    }
    if ([(SearchResultsDataSource *)self isSimpleSearchResults])
    {
      v29 = SimpleSearchResultTableViewCell;
    }
    else
    {
      v29 = SearchResultTableViewCell;
      if (v9)
      {
        uint64_t v32 = +[_SearchResultTableViewCell accessibilityIdentifier];
LABEL_40:
        uint64_t v30 = (void *)v32;
        id v16 = [v6 dequeueReusableCellWithIdentifier:v32 forIndexPath:v7];
LABEL_41:

        [v16 setPlaceContextViewModelDelegate:self];
        v33 = [v11 mapItem];
        v34 = [(SearchResultsDataSource *)self placeContextViewModelWithMapItem:v33];
        [v16 setPlaceContextViewModel:v34];

        [v16 setDisplayDistanceIfValidCurrentLocation:[self displayDistance]];
        v35 = [(DataSource *)self currentLocation];
        [v16 setCurrentLocation:v35];

        [v16 setDisplaysAsChainResult:[self displaysAsChainResult]];
        [v16 setPrefersAddressOverCategory:[self prefersAddressOverCategory]];
        v36 = [(SearchResultsDataSource *)self searchCategory];
        [v16 setSearchCategory:v36];

        id v14 = [v11 mapItem];
        [v16 setMapItem:v14];
        goto LABEL_8;
      }
    }
    uint64_t v32 = [(__objc2_class *)v29 identifier];
    goto LABEL_40;
  }
  long long v19 = +[CuratedGuideTableViewCell reuseIdentifier];
  id v16 = [v6 dequeueReusableCellWithIdentifier:v19 forIndexPath:v7];

  double v20 = [(SearchResultsDataSource *)self curatedGuideCellViewModelForSearchResult:v11 indexPath:v7];
  [v16 configureWith:v20 delegate:self imageLoader:self->_curatedGuideDataDownloader];
LABEL_51:

LABEL_52:

  return v16;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return ![(SearchResultsDataSource *)self isPresentingSearchAlongTheRouteResults];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(SearchResultsDataSource *)self objectAtIndexPath:a4];
  objc_opt_class();
  int64_t v5 = objc_opt_isKindOfClass() & 1;

  return v5;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableArray array];
  id v7 = [(SearchResultsDataSource *)self objectAtIndexPath:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (MapsFeature_IsEnabled_SearchAndDiscovery()
      && ([v8 placeCollection], unsigned __int8 v9 = objc_claimAutoreleasedReturnValue(), v9, v9)
      || ([v8 mapItem],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v11 = [v10 _hasHikeInfo],
          v10,
          (v11 & 1) != 0))
    {

      double v12 = 0;
      goto LABEL_10;
    }
    if ([v8 type] != 11)
    {
      CFStringRef v13 = [(SearchResultsDataSource *)self shareContextualActionAtIndexPath:v5];
      id v16 = v13;
      uint64_t v14 = +[NSArray arrayWithObjects:&v16 count:1];

      id v6 = (void *)v14;
    }
  }
  double v12 = +[UISwipeActionsConfiguration configurationWithActions:v6];
LABEL_10:

  return v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(SearchResultsDataSource *)self objectAtIndexPath:a4];
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || [v4 type] != 11;

  return v5;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v12 = a3;
  id v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v12 indexPathForCell:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned __int8 v9 = (void *)v8;
    id v10 = [(DataSource *)self delegate];
    unsigned __int8 v11 = [(SearchResultsDataSource *)self objectAtIndexPath:v9];
    [v10 dataSource:self itemFocused:v11];
  }
  else
  {
    unsigned __int8 v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemFocused:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SearchResultsDataSource *)self resetMapServiceTicket];
  uint64_t v8 = [(SearchResultsDataSource *)self objectAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 type] != 11)
    {
      id v10 = objc_alloc_init(SearchSessionAnalytics);
      unsigned __int8 v11 = [v9 placeCollection];
      if (v11)
      {
        [(SearchSessionAnalytics *)v10 setAction:2099];
        [(SearchSessionAnalytics *)v10 setTarget:101];
        id v12 = [v11 collectionIdentifier];
        uint64_t v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 muid]);

        CFStringRef v13 = [v11 publisher];
        id v25 = v6;
        if (v13)
        {
          uint64_t v14 = [v11 publisher];
          v15 = [v14 identifier];
          id v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 muid]);
          long long v27 = v16;
          long long v24 = +[NSArray arrayWithObjects:&v27 count:1];
        }
        else
        {
          long long v24 = 0;
        }

        unsigned int v23 = [(SearchSessionAnalytics *)v10 action];
        unsigned int v22 = [(SearchSessionAnalytics *)v10 target];
        long long v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 row]);
        long long v18 = [v11 collectionIdentifier];
        long long v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 resultProviderID]);
        +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:", v23, v22, 0, v24, 0, v26, 0, 0, v17, 0, 0, 0, 0, v19, 0,
          0);

        id v6 = v25;
      }
      else
      {
        [(SearchSessionAnalytics *)v10 setAction:2007];
        [(SearchSessionAnalytics *)v10 setTarget:101];
        [(DataSource *)self sendAnalyticsForDataAtIndexPath:v7 object:v9 action:[(SearchSessionAnalytics *)v10 action] populateSearchTapEvent:1];
      }
      double v20 = +[SearchSessionAnalyticsAggregator sharedAggregator];
      [v20 collectSearchSessionAnalytics:v10];

      double v21 = [(DataSource *)self delegate];
      [v21 dataSource:self itemTapped:v9];

      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SearchResultsDataSource *)self objectAtIndexPath:v7];
  if ([v8 type] == 11 && (MapsFeature_IsEnabled_SearchAndDiscovery() & 1) == 0)
  {
    id v12 = [v8 relatedSection];

    if (v12)
    {
      CFStringRef v13 = [v8 relatedSection];
      id v14 = [v13 sectionType];

      if (v14 == (id)1)
      {
        v15 = [v8 relatedSection];
        id v16 = [v15 relatedPlaceCollections];
        id v17 = [v16 count];

        if (v17)
        {
          unsigned __int8 v11 = RelatedCollectionsSectionTableViewCell;
          goto LABEL_35;
        }
        double v22 = 0.0;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v26 = [v8 searchSection];

      if (v26)
      {
        double v20 = [v8 searchSection];
        id v27 = [v20 sectionType];
        if (v27 == (id)2)
        {
          if (!MapsFeature_IsEnabled_SearchAndDiscovery())
          {
            v34 = [v20 sectionGuide];
            v35 = [v34 placeCollections];
            id v36 = [v35 count];

            if (v36)
            {
              v37 = [v20 sectionGuide];
              v38 = [v37 placeCollections];
              +[RelatedCollectionsSectionTableViewCell cellHeightWithCollectionsCount:](RelatedCollectionsSectionTableViewCell, "cellHeightWithCollectionsCount:", [v38 count]);
              double v22 = v39;
            }
            else
            {
              double v22 = 0.0;
            }
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        if (!v27)
        {
          +[RelatedSectionTableViewCell cellHeight];
          double v22 = v28;
          goto LABEL_16;
        }
      }
    }
    unsigned __int8 v11 = RelatedSectionTableViewCell;
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 personalizedCompoundItem];
    id v10 = [v9 address];
    if (v10)
    {

LABEL_7:
      unsigned __int8 v11 = TwoLinesTableViewCell;
LABEL_35:
      [(__objc2_class *)v11 cellHeight];
      double v22 = v40;
      goto LABEL_36;
    }
    unsigned int v18 = [(SearchResultsDataSource *)self displaysAsChainResult];

    if (v18) {
      goto LABEL_7;
    }
  }
  else if ([(SearchResultsDataSource *)self displaysAsChainResult])
  {
    goto LABEL_7;
  }
  long long v19 = [v8 placeCollection];

  if (v19)
  {
    double v20 = [(SearchResultsDataSource *)self curatedGuideCellViewModelForSearchResult:v8 indexPath:v7];
    [v6 bounds];
    [v20 setWidth:v21];
LABEL_15:
    double v22 = UITableViewAutomaticDimension;
LABEL_16:

    goto LABEL_36;
  }
  if ([(SearchResultsDataSource *)self usePlaceSummary])
  {
    unsigned int v23 = [(SearchResultsDataSource *)self placeSummaryTemplateForSearchResult:v8 indexPath:v7];
    long long v24 = [(DataSource *)self tableView];
    [v24 bounds];
    [v23 setContainerWidth:v25];

    double v22 = UITableViewAutomaticDimension;
  }
  else
  {
    if ([(SearchResultsDataSource *)self isSimpleSearchResults])
    {
      double v22 = UITableViewAutomaticDimension;
      goto LABEL_36;
    }
    +[_SearchResultTableViewCell cellHeight];
    double v22 = v29;
    unsigned int v23 = [v8 mapItem];
    uint64_t v30 = [(SearchResultsDataSource *)self placeContextViewModelWithMapItem:v23];
    if (v30)
    {
      v31 = (void *)v30;
      unsigned __int8 v32 = +[UIFont accessibilityTextEnabled];

      if (v32) {
        goto LABEL_36;
      }
      unsigned int v23 = [v6 traitCollection];
      [v23 displayScale];
      +[_SearchResultTableViewCell placeContextHeightWithDisplayScale:](SearchResultTableViewCell, "placeContextHeightWithDisplayScale:");
      double v22 = v22 + v33;
    }
  }

LABEL_36:
  return v22;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (![(SearchResultsDataSource *)self isSimpleSearchResults])
  {
    id v7 = [(SearchResultsDataSource *)self objectAtIndexPath:v5];
    if ([v7 type] == 11)
    {
      id v8 = [v7 relatedSection];

      if (v8)
      {
        id v9 = [v7 relatedSection];
        id v10 = [v9 sectionType];

        if (v10 == (id)1)
        {
          unsigned __int8 v11 = [v7 relatedSection];
          id v12 = [v11 relatedPlaceCollections];
          id v13 = [v12 count];

          if (!v13)
          {
            double v6 = 0.0;
LABEL_27:

            goto LABEL_28;
          }
          id v14 = RelatedCollectionsSectionTableViewCell;
          goto LABEL_25;
        }
      }
      else
      {
        long long v19 = [v7 searchSection];

        if (v19)
        {
          double v20 = [v7 searchSection];
          id v21 = [v20 sectionType];
          if (v21 == (id)2)
          {
            long long v24 = [v20 sectionGuide];
            double v25 = [v24 placeCollections];
            id v26 = [v25 count];

            if (v26)
            {
              id v27 = [v20 sectionGuide];
              double v28 = [v27 placeCollections];
              +[RelatedCollectionsSectionTableViewCell cellHeightWithCollectionsCount:](RelatedCollectionsSectionTableViewCell, "cellHeightWithCollectionsCount:", [v28 count]);
              double v6 = v29;
            }
            else
            {
              double v6 = 0.0;
            }
          }
          else
          {
            if (v21)
            {

              goto LABEL_24;
            }
            +[RelatedSectionTableViewCell cellHeight];
            double v6 = v22;
          }

          goto LABEL_27;
        }
      }
LABEL_24:
      id v14 = RelatedSectionTableViewCell;
LABEL_25:
      [(__objc2_class *)v14 cellHeight];
      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [v7 personalizedCompoundItem];
      id v16 = [v15 address];

      if (v16)
      {
        id v17 = TwoLinesTableViewCell;
LABEL_19:
        [(__objc2_class *)v17 estimatedCellHeight];
        goto LABEL_26;
      }
    }
    if ([(SearchResultsDataSource *)self usePlaceSummary])
    {
      +[PlaceSummaryTableViewCell searchResultEstimatedHeight];
    }
    else
    {
      unsigned int v23 = [(SearchResultsDataSource *)self displaysAsChainResult];
      id v17 = SearchResultTableViewCell;
      if (!v23) {
        goto LABEL_19;
      }
      +[_SearchResultTableViewCell estimatedTwoLinesCellHeight];
    }
LABEL_26:
    double v6 = v18;
    goto LABEL_27;
  }
  double v6 = UITableViewAutomaticDimension;
LABEL_28:

  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  double v6 = [(SearchResultsDataSource *)self content];
  id v7 = (char *)[v6 numberOfSections] - 1;

  return v7 != (char *)a4 || self->_enableStructuredRAPAffordance;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  double v6 = [(SearchResultsDataSource *)self indexPathForRelatedCollectionSection];
  if (v6)
  {
    id v7 = [(SearchResultsDataSource *)self indexPathForRelatedCollectionSection];
    BOOL v8 = [v7 section] == (id)a4;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)visibleImpressionElements
{
  if (MapsFeature_IsEnabled_SearchResultsImpressions())
  {
    id v3 = [(DataSource *)self tableView];
    id v4 = [v3 visibleCells];

    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v12 = [(DataSource *)self tableView];
          id v13 = [v12 indexPathForCell:v11];

          if (v13)
          {
            id v14 = [(SearchResultsDataSource *)self objectAtIndexPath:v13];
            v15 = [(SearchResultsDataSource *)self impressionElementForSearchResult:v14 indexPath:v13];
            id v16 = [(DataSource *)self tableView];
            [v16 rectForRowAtIndexPath:v13];
            [v15 setFrame:];

            [v5 addObject:v15];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    id v17 = [v5 copy];
  }
  else
  {
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

- (NSDictionary)itemCountInVenue
{
  id v3 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(SearchResultsDataSourceContent *)self->_content objects];
  id v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    do
    {
      id v7 = 0;
      id v23 = v5;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 mapItem];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          double v25 = v9;
          uint64_t v10 = [v9 venueAreaIdentifiers];
          uint64_t v11 = (void *)v10;
          id v12 = &__NSArray0__struct;
          if (v10) {
            id v12 = (void *)v10;
          }
          id v13 = v12;

          id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
                long long v19 = [v3 objectForKeyedSubscript:v18, v22];
                long long v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v19 unsignedIntegerValue] + 1);
                [v3 setObject:v20 forKeyedSubscript:v18];
              }
              id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v15);
          }

          uint64_t v6 = v22;
          id v5 = v23;
        }
        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (void)buildAndCacheCuratedGuideViewModels
{
  id v3 = sub_100109E50();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCacheGuideSummary", "", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100701268;
  v5[3] = &unk_1012F5F78;
  v5[4] = self;
  [(SearchResultsDataSource *)self iterateThroughIndexPathsAndExecuteBlock:v5];
  id v4 = sub_100109E50();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCacheGuideSummary", "", buf, 2u);
  }
}

- (id)curatedGuideCellViewModelForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 placeCollection];

  if (v8)
  {
    uint64_t v9 = [(SearchResultsDataSource *)self curatedGuideViewModels];
    id v8 = [v9 objectForKey:v7];

    if (!v8)
    {
      uint64_t v10 = [_TtC4Maps21CuratedGuideViewModel alloc];
      uint64_t v11 = [v6 placeCollection];
      BOOL v12 = [(SearchResultsDataSource *)self guideSummaryUsesRichLayout]
         || [(SearchResultsDataSource *)self placeSummaryUsesRichLayout];
      id v8 = [(CuratedGuideViewModel *)v10 initWithPlaceCollection:v11 useRichLayout:v12];

      [(SearchResultsDataSource *)self addMetricsForGuideSummaryViewModel:v8 atIndexPath:v7];
      id v13 = [(SearchResultsDataSource *)self curatedGuideViewModels];
      [v13 setObject:v8 forKey:v7];
    }
  }

  return v8;
}

- (void)addMetricsForGuideSummaryViewModel:(id)a3 atIndexPath:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    if ([(SearchResultsDataSource *)self guideSummaryUsesRichLayout]
      || [(SearchResultsDataSource *)self placeSummaryUsesRichLayout])
    {
      id v7 = [_TtC4Maps19GuideSummaryMetrics alloc];
      double v8 = 19.0;
      double v9 = 19.0;
      double v10 = 8.0;
      double v11 = 8.0;
    }
    else
    {
      uint64_t v18 = [(SearchResultsDataSource *)self content];
      id v19 = [v18 numberOfRowsInSection:[v6 section]];

      unsigned int v20 = [(SearchResultsDataSource *)self _showTopRoundedCorners:v6 rows:v19];
      unsigned int v21 = [(SearchResultsDataSource *)self _showBottomRoundedCorners:v6 rows:v19];
      id v7 = [_TtC4Maps19GuideSummaryMetrics alloc];
      if (!v20 || !v21)
      {
        if (v20)
        {
          uint64_t v16 = v21 ^ 1;
          double v8 = 16.0;
          double v9 = 16.0;
          double v10 = 16.0;
          double v11 = 0.0;
          double v12 = 10.0;
          double v13 = 10.0;
          double v14 = 0.0;
          double v15 = 0.0;
          goto LABEL_7;
        }
        double v8 = 16.0;
        double v9 = 16.0;
        double v10 = 0.0;
        if (!v21)
        {
          double v11 = 0.0;
          double v12 = 0.0;
          double v13 = 0.0;
          double v14 = 0.0;
          double v15 = 0.0;
          uint64_t v16 = 1;
          goto LABEL_7;
        }
        double v11 = 16.0;
        double v12 = 0.0;
        double v13 = 0.0;
        double v14 = 10.0;
        double v15 = 16.0;
LABEL_6:
        uint64_t v16 = 0;
LABEL_7:
        id v17 = [(GuideSummaryMetrics *)v7 initWithLeadingMargin:v16 trailingMargin:v8 topMargin:v9 bottomMargin:v10 topLeadingCornerRadius:v11 topTrailingCornerRadius:v12 bottomLeadingCornerRadius:v13 bottomTrailingCornerRadius:v14 showsDivider:v15];
        [v22 setMetrics:v17];

        goto LABEL_8;
      }
      double v8 = 16.0;
      double v9 = 16.0;
      double v10 = 16.0;
      double v11 = 0.0;
    }
    double v12 = 10.0;
    double v13 = 10.0;
    double v14 = 10.0;
    double v15 = 10.0;
    goto LABEL_6;
  }
LABEL_8:
}

- (BOOL)usePlaceSummaryForSearchResult:(id)a3
{
  id v4 = a3;
  if ([(SearchResultsDataSource *)self usePlaceSummary]) {
    unsigned __int8 v5 = [v4 usePlaceSummaryInSearch];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)placeSummaryTemplateForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SearchResultsDataSource *)self usePlaceSummaryForSearchResult:v6])
  {
    double v8 = [(SearchResultsDataSource *)self placeSummaryTemplateViewModels];
    double v9 = [v8 objectForKey:v7];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      [v6 setRepresentsIntermediateStop:[self isPresentingAddStopResultsFromWaypointEditor]];
      double v11 = [(SearchResultsDataSource *)self placeSummaryMetadata];
      double v12 = [(DataSource *)self currentLocation];
      id v10 = +[PlaceSummaryViewModelTemplateFactory viewModelWithSearchResult:v6 metadata:v11 currentLocation:v12 searchAlongRoute:[(SearchResultsDataSource *)self isPresentingSearchAlongTheRouteResults] openAt:self->_openAt];

      [(SearchResultsDataSource *)self addMetricsForPlaceSummaryTemplate:v10 indexPath:v7];
      if (v10)
      {
        double v13 = [(SearchResultsDataSource *)self placeSummaryTemplateViewModels];
        [v13 setObject:v10 forKey:v7];

        id v14 = v10;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)addMetricsForPlaceSummaryTemplate:(id)a3 indexPath:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v7 = [(DataSource *)self tableView];
    uint64_t v8 = sub_1000BBB44(v7);

    if (v8 == 5)
    {
      if (self->_isShowingClusterResults) {
        double v9 = 8.0;
      }
      else {
        double v9 = 0.0;
      }
      if (self->_isShowingClusterResults) {
        double v10 = 0.0;
      }
      else {
        double v10 = 16.0;
      }
      double v11 = [_TtC4Maps19PlaceSummaryMetrics alloc];
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = v9;
      double v18 = v10;
      double v19 = v10;
      goto LABEL_10;
    }
    if ([(SearchResultsDataSource *)self placeSummaryUsesRichLayout])
    {
      if (![v6 item])
      {
        if ([v6 section]) {
          double v25 = 8.0;
        }
        else {
          double v25 = 0.0;
        }
        double v11 = [_TtC4Maps19PlaceSummaryMetrics alloc];
        double v12 = 16.0;
        double v17 = 16.0;
        double v19 = 8.0;
        double v13 = 10.0;
        double v14 = 10.0;
        double v15 = 10.0;
        double v16 = 10.0;
        double v18 = v25;
        goto LABEL_25;
      }
      double v11 = [_TtC4Maps19PlaceSummaryMetrics alloc];
      double v12 = 16.0;
      double v17 = 16.0;
      double v18 = 8.0;
      double v19 = 8.0;
    }
    else
    {
      unsigned int v21 = [(SearchResultsDataSource *)self content];
      id v22 = [v21 numberOfRowsInSection:[v6 section]];

      unsigned int v23 = [(SearchResultsDataSource *)self _showTopRoundedCorners:v6 rows:v22];
      unsigned int v24 = [(SearchResultsDataSource *)self _showBottomRoundedCorners:v6 rows:v22];
      double v11 = [_TtC4Maps19PlaceSummaryMetrics alloc];
      if (!v23 || !v24)
      {
        if (v23)
        {
          uint64_t v20 = v24 ^ 1;
          double v12 = 16.0;
          double v17 = 16.0;
          double v18 = 0.0;
          double v19 = 0.0;
          double v13 = 10.0;
          double v14 = 10.0;
          double v15 = 0.0;
          double v16 = 0.0;
          goto LABEL_26;
        }
        double v12 = 16.0;
        double v17 = 16.0;
        double v18 = 0.0;
        if (!v24)
        {
          double v19 = 0.0;
          double v13 = 0.0;
          double v14 = 0.0;
          double v15 = 0.0;
          double v16 = 0.0;
LABEL_10:
          uint64_t v20 = 1;
LABEL_26:
          long long v26 = [(PlaceSummaryMetrics *)v11 initWithLeadingMargin:v20 trailingMargin:v12 topMargin:v17 bottomMargin:v18 topLeadingCornerRadius:v19 topTrailingCornerRadius:v13 bottomLeadingCornerRadius:v14 bottomTrailingCornerRadius:v15 showsDivider:v16];
          [v27 setMetrics:v26];

          goto LABEL_27;
        }
        double v19 = 16.0;
        double v13 = 0.0;
        double v14 = 0.0;
        goto LABEL_18;
      }
      double v12 = 16.0;
      double v17 = 16.0;
      double v18 = 0.0;
      double v19 = 0.0;
    }
    double v13 = 10.0;
    double v14 = 10.0;
LABEL_18:
    double v15 = 10.0;
    double v16 = 10.0;
LABEL_25:
    uint64_t v20 = 0;
    goto LABEL_26;
  }
LABEL_27:
}

- (BOOL)_showTopRoundedCorners:(id)a3 rows:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(SearchResultsDataSource *)self content];
  id v7 = [v6 titleForHeaderInSection:[v5 section]];

  if (v7) {
    BOOL v8 = [v7 length] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  if ([v5 item])
  {
    BOOL v8 = 0;
  }
  else if (![v5 section])
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_showBottomRoundedCorners:(id)a3 rows:(int64_t)a4
{
  id v6 = a3;
  id v7 = (char *)[v6 section] + 1;
  BOOL v8 = [(SearchResultsDataSource *)self content];
  double v9 = (char *)[v8 numberOfSections];

  if ((uint64_t)v7 >= (uint64_t)v9)
  {
    BOOL v12 = 0;
  }
  else
  {
    double v10 = [(SearchResultsDataSource *)self content];
    double v11 = [v10 titleForHeaderInSection:v7];

    if (v11) {
      BOOL v12 = [v11 length] != 0;
    }
    else {
      BOOL v12 = 0;
    }
  }
  double v13 = (char *)[v6 section];
  double v14 = [(SearchResultsDataSource *)self content];
  double v15 = (char *)[v14 numberOfSections];

  id v16 = [v6 item];
  BOOL v17 = v13 == v15 - 1 || v12;
  return v16 == (id)(a4 - 1) && v17;
}

- (void)cachePlaceSummaryTemplates
{
  id v3 = sub_100109E50();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCachePlaceSummary", "", buf, 2u);
  }

  if ([(SearchResultsDataSource *)self usePlaceSummary])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100701D88;
    v5[3] = &unk_1012F5F78;
    v5[4] = self;
    [(SearchResultsDataSource *)self iterateThroughIndexPathsAndExecuteBlock:v5];
    [(SearchResultsDataSource *)self notifyDelegateDidCachePlaceSummaryTemplates];
    id v4 = sub_100109E50();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCachePlaceSummary", "", buf, 2u);
    }
  }
  else
  {
    [(SearchResultsDataSource *)self notifyDelegateDidCachePlaceSummaryTemplates];
  }
}

- (void)notifyDelegateDidCachePlaceSummaryTemplates
{
  id v3 = [(DataSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    if (+[NSThread isMainThread])
    {
      id v5 = [(DataSource *)self delegate];
      [v5 didCachePlaceSummaryTemplates];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100702014;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (id)placeSummaryTemplateAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchResultsDataSource *)self placeSummaryTemplateViewModels];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)iterateThroughIndexPathsAndExecuteBlock:(id)a3
{
  double v11 = (void (**)(id, void *))a3;
  id v4 = [(SearchResultsDataSource *)self content];
  uint64_t v5 = (uint64_t)[v4 numberOfSections];

  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(SearchResultsDataSource *)self content];
      uint64_t v8 = (uint64_t)[v7 numberOfRowsInSection:i];

      if (v8 >= 1)
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          double v10 = +[NSIndexPath indexPathForRow:j inSection:i];
          v11[2](v11, v10);
        }
      }
    }
  }
}

- (void)locationDidUpdate
{
  id v3 = [(DataSource *)self currentLocation];

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100702254;
    v4[3] = &unk_1012F5F78;
    v4[4] = self;
    [(SearchResultsDataSource *)self iterateThroughIndexPathsAndExecuteBlock:v4];
  }
}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(SearchResultsDataSource *)self objectAtIndexPath:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    double v9 = [(SearchResultsDataSource *)self shareDelegate];
    double v10 = [v8 unknownContact];
    double v11 = +[ShareItem shareItemWithSearchResult:v8 contact:v10 includePrintActivity:1];
    BOOL v12 = [(DataSource *)self tableView];
    double v13 = [v12 cellForRowAtIndexPath:v16];
    [v9 shareItem:v11 sourceView:v13 completion:v6];

    [(DataSource *)self sendAnalyticsForDataAtIndexPath:v16 object:v8 action:2008];
    double v14 = objc_alloc_init(SearchSessionAnalytics);
    [(SearchSessionAnalytics *)v14 setAction:2008];
    [(SearchSessionAnalytics *)v14 setTarget:101];
    double v15 = +[SearchSessionAnalyticsAggregator sharedAggregator];
    [v15 collectSearchSessionAnalytics:v14];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (ErrorModeView)structuredRAPAffordance
{
  structuredRAPAffordance = self->_structuredRAPAffordance;
  if (structuredRAPAffordance)
  {
    id v3 = structuredRAPAffordance;
  }
  else
  {
    uint64_t v5 = objc_alloc_init(ErrorModeView);
    id v6 = self->_structuredRAPAffordance;
    self->_structuredRAPAffordance = v5;

    [(ErrorModeView *)self->_structuredRAPAffordance setSpacing:0.0];
    id v7 = self->_structuredRAPAffordance;
    id v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"Something Missing?" value:@"localized string not found" table:0];
    [(ErrorModeView *)v7 setTitle:v9 andMessage:0];

    objc_initWeak(&location, self);
    double v10 = self->_structuredRAPAffordance;
    double v11 = +[NSBundle mainBundle];
    BOOL v12 = [v11 localizedStringForKey:@"Add a Missing Place" value:@"localized string not found" table:0];
    double v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_100702774;
    BOOL v17 = &unk_1012EE310;
    objc_copyWeak(&v18, &location);
    [(ErrorModeView *)v10 setButtonTitle:v12 handler:&v14];

    -[ErrorModeView setTopPadding:](self->_structuredRAPAffordance, "setTopPadding:", 26.0, v14, v15, v16, v17);
    [(SearchResultsDataSource *)self adjustRAPAffordanceFrameWithTopPadding:26.0];
    id v3 = self->_structuredRAPAffordance;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)adjustRAPAffordanceFrameWithTopPadding:(double)a3
{
  id v8 = [(DataSource *)self tableView];
  [v8 frame];
  double v6 = v5;
  [(ErrorModeView *)self->_structuredRAPAffordance fittingHeight];
  -[ErrorModeView setFrame:](self->_structuredRAPAffordance, "setFrame:", 0.0, 0.0, v6, v7 + a3);
}

- (void)setEnableStructuredRAPAffordance:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enableStructuredRAPAffordance = a3;
  if (a3)
  {
    id v6 = [(SearchResultsDataSource *)self structuredRAPAffordance];
  }
  else
  {
    id v6 = 0;
  }
  double v5 = [(DataSource *)self tableView];
  [v5 setTableFooterView:v6];

  if (v3)
  {
  }
}

- (id)placeContextViewModelWithMapItem:(id)a3
{
  id v4 = a3;
  if ([(SearchResultsDataSource *)self displaysAsChainResult]
    || [(SearchResultsDataSource *)self isPresentingVenueClusterResults])
  {
    double v5 = 0;
  }
  else
  {
    if ([(SearchResultsDataSource *)self isPresentingSearchAlongTheRouteResults])
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }
    double v5 = [[PlaceContextViewModel alloc] initWithMapItem:v4 context:v6];
  }

  return v5;
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DataSource *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(DataSource *)self delegate];
    [v10 searchDataSource:self didTapOnPlaceContextWithViewModel:v6];
  }
  double v11 = [(DataSource *)self tableView];
  BOOL v12 = [v11 indexPathForCell:v7];

  if ([v6 type] == (id)1)
  {
    double v13 = [v6 placeCollections];
    double v14 = [v13 firstObject];

    uint64_t v15 = [v14 collectionIdentifier];
    id v16 = [v15 muid];

    BOOL v17 = +[CuratedCollectionSyncManager sharedManager];
    id v18 = [v17 collectionIsSaved:v14];

    double v19 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
    [v19 placeContextSingleCollectionTappedWithMuid:v16 isCurrentlySaved:v18 verticalIndex:[v12 row]];
  }
  else if ([v6 type] == (id)2)
  {
    long long v32 = v12;
    id v20 = objc_alloc((Class)NSMutableArray);
    unsigned int v21 = [v6 placeCollections];
    id v22 = [v20 initWithCapacity:[v21 count]];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unsigned int v23 = [v6 placeCollections];
    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = [*(id *)(*((void *)&v33 + 1) + 8 * i) collectionIdentifier];
          long long v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v28 muid]);
          [v22 addObject:v29];
        }
        id v25 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v25);
    }

    long long v30 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
    id v31 = [v22 copy];
    BOOL v12 = v32;
    [v30 placeContextMultipleCollectionsTappedWithMuids:v31 verticalIndex:[v32 row]];
  }
}

- (void)didTapOnUserGeneratedGuide:(id)a3 cell:(id)a4
{
  id v8 = a3;
  double v5 = [(DataSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DataSource *)self delegate];
    [v7 didTapOnUserGeneratedGuide:v8];
  }
}

- (void)didTapOnCuratedGuide:(id)a3 cell:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(DataSource *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(DataSource *)self delegate];
    [v9 didTapOnCuratedGuide:v17];
  }
  double v10 = [(DataSource *)self tableView];
  double v11 = [v10 indexPathForCell:v6];

  BOOL v12 = [v17 collectionIdentifier];
  id v13 = [v12 muid];

  double v14 = +[CuratedCollectionSyncManager sharedManager];
  id v15 = [v14 collectionIsSaved:v17];

  id v16 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
  [v16 placeContextSingleCollectionTappedWithMuid:v13 isCurrentlySaved:v15 verticalIndex:[v11 row]];
}

- (void)didTapOnCuratedGuides:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(DataSource *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(DataSource *)self delegate];
    [v10 didTapOnCuratedGuides:v6];
  }
  double v11 = [(DataSource *)self tableView];
  unsigned int v23 = v7;
  BOOL v12 = [v11 indexPathForCell:v7];

  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v18) collectionIdentifier];
        id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 muid]);
        [v13 addObject:v20];

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  unsigned int v21 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
  id v22 = [v13 copy];
  [v21 placeContextMultipleCollectionsTappedWithMuids:v22 verticalIndex:[v12 row]];
}

- (void)didTapOnAccessoryEntityDirectionsWithCell:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(SearchResultsDataSource *)self objectAtIndexPath:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(DataSource *)self delegate];
      [v9 didTapOnDirectionsWithSearchResult:v6];
    }
  }
}

- (void)didTapOnAccessoryEntityLookAroundWithCell:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(SearchResultsDataSource *)self objectAtIndexPath:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(DataSource *)self delegate];
      [v9 didTapOnLookAroundWithSearchResult:v6];
    }
  }
}

- (void)didTapOnAccessoryEntityCallWithCell:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(SearchResultsDataSource *)self objectAtIndexPath:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(DataSource *)self delegate];
      [v9 didTapOnCallWithSearchResult:v6];
    }
  }
}

- (void)didTapOnAccessoryEntityWebsiteWithCell:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(SearchResultsDataSource *)self objectAtIndexPath:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(DataSource *)self delegate];
      [v9 didTapOnWebsiteWithSearchResult:v6];
    }
  }
}

- (void)didTapOnAccessoryEntityFlyoverWithCell:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(SearchResultsDataSource *)self objectAtIndexPath:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(DataSource *)self delegate];
      [v9 didTapOnFlyoverWithSearchResult:v6];
    }
  }
}

- (void)didTapOnContainmentParentMapItem:(id)a3 cell:(id)a4
{
  id v8 = a3;
  double v5 = [(DataSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DataSource *)self delegate];
    [v7 didTapOnContainmentParentMapItem:v8];
  }
}

- (void)didTapOnTappableEntryWithMapItemIdentifier:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SearchResultsDataSource *)self resetMapServiceTicket];
  id v8 = [objc_alloc((Class)MKMapItemIdentifier) initWithGEOMapItemIdentifier:v6];
  char v9 = +[MKMapService sharedService];
  id v16 = v8;
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  double v11 = [v9 ticketForIdentifiers:v10 traits:0];
  [(SearchResultsDataSource *)self setMapServiceTicket:v11];

  objc_initWeak(&location, self);
  BOOL v12 = [(SearchResultsDataSource *)self mapServiceTicket];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10070378C;
  v13[3] = &unk_1012E6E78;
  objc_copyWeak(&v14, &location);
  [v12 submitWithHandler:v13 networkActivity:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)personalizedItemForQuickActionMenuWithCell:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  id v7 = [(SearchResultsDataSource *)self objectAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [(SearchResultMapItemBase *)[SearchResultMapItem alloc] initWithSearchResult:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)didTapOnAddStop:(id)a3
{
  id v4 = a3;
  double v5 = [(DataSource *)self tableView];
  id v13 = [v5 indexPathForCell:v4];

  id v6 = [(SearchResultsDataSource *)self objectAtIndexPath:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = v6;
      id v10 = [(DataSource *)self delegate];
      [v10 didTapOnAddStopWithSearchResult:v9 atIndexPath:v13];
    }
    else
    {
      double v11 = [(DataSource *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_7;
      }
      id v10 = [(DataSource *)self delegate];
      [v10 didTapOnAddStopAtIndex:[v13 row]];
    }
  }
LABEL_7:
}

- (void)didTapOnUserLibrary:(id)a3 mapItem:(id)a4
{
  id v8 = a4;
  double v5 = [(DataSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DataSource *)self delegate];
    [v7 didTapOnUserLibraryMapItem:v8];
  }
}

- (void)didTapOnPhotoCarousel:(id)a3 photoIndex:(int64_t)a4
{
  id v5 = a3;
  char v6 = [(DataSource *)self tableView];
  id v12 = [v6 indexPathForCell:v5];

  id v7 = [(SearchResultsDataSource *)self objectAtIndexPath:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = objc_alloc_init(SearchSessionAnalytics);
    [(SearchSessionAnalytics *)v9 setAction:2007];
    [(SearchSessionAnalytics *)v9 setTarget:101];
    id v10 = +[SearchSessionAnalyticsAggregator sharedAggregator];
    [v10 collectSearchSessionAnalytics:v9];

    [(DataSource *)self sendAnalyticsForDataAtIndexPath:v12 object:v8 action:[(SearchSessionAnalytics *)v9 action] populateSearchTapEvent:1];
    double v11 = [(DataSource *)self delegate];
    [v11 dataSource:self itemTapped:v8];
  }
}

- (void)resetMapServiceTicket
{
  BOOL v3 = [(SearchResultsDataSource *)self mapServiceTicket];
  [v3 cancel];

  [(SearchResultsDataSource *)self setMapServiceTicket:0];
}

- (void)relatedSectionTableViewCellDidScrollForward
{
  id v4 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
  BOOL v3 = [(SearchResultsDataSource *)self indexPathForRelatedCollectionSection];
  [v4 carouselScrolledForwardAtVerticalIndex:[v3 row]];
}

- (void)relatedSectionTableViewCellDidScrollBackward
{
  id v4 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
  BOOL v3 = [(SearchResultsDataSource *)self indexPathForRelatedCollectionSection];
  [v4 carouselScrolledBackwardAtVerticalIndex:[v3 row]];
}

- (void)relatedSectionTappedOnCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v11 = [(SearchResultsDataSource *)self curatedCollectionsAnalyticsManager];
  id v9 = [v8 muid];

  id v10 = [(SearchResultsDataSource *)self indexPathForRelatedCollectionSection];
  [v11 carouselCollectionTappedWithMuid:v9 row:[v10 row] verticalIndex:a4 horizontalIndex:v5];
}

- (void)relatedSectionRouteToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchResultsDataSource *)self collectionCarouselRoutingDelegate];
  [v5 routeToCuratedCollection:v4];
}

- (NSIndexPath)indexPathForRelatedCollectionSection
{
  indexPathForRelatedCollectionSection = self->_indexPathForRelatedCollectionSection;
  if (!indexPathForRelatedCollectionSection)
  {
    id v4 = [(SearchResultsDataSource *)self content];
    uint64_t v5 = (uint64_t)[v4 numberOfSections];

    if (v5 < 1) {
      goto LABEL_13;
    }
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(SearchResultsDataSource *)self content];
      uint64_t v8 = (uint64_t)[v7 numberOfRowsInSection:v6];

      if (v8 < 1) {
        goto LABEL_12;
      }
      uint64_t v9 = 0;
      while (1)
      {
        id v10 = +[NSIndexPath indexPathForRow:v9 inSection:v6];
        id v11 = [(SearchResultsDataSource *)self content];
        id v12 = [v11 objectAtIndexPath:v10];

        if ([v12 type] == 11) {
          break;
        }
LABEL_9:

        ++v9;
        id v14 = [(SearchResultsDataSource *)self content];
        id v15 = [v14 numberOfRowsInSection:v6];

        if (v9 >= (uint64_t)v15) {
          goto LABEL_12;
        }
      }
      id v13 = [v12 searchSection];
      if ([v13 sectionType] != (id)2) {
        break;
      }
      id v16 = self->_indexPathForRelatedCollectionSection;
      self->_indexPathForRelatedCollectionSection = v10;

LABEL_12:
      ++v6;
      uint64_t v17 = [(SearchResultsDataSource *)self content];
      id v18 = [v17 numberOfSections];

      if (v6 >= (uint64_t)v18)
      {
LABEL_13:
        indexPathForRelatedCollectionSection = self->_indexPathForRelatedCollectionSection;
        goto LABEL_14;
      }
    }

    goto LABEL_9;
  }
LABEL_14:
  double v19 = indexPathForRelatedCollectionSection;

  return v19;
}

- (BOOL)displaysAsChainResult
{
  return self->_displaysAsChainResult;
}

- (void)setDisplaysAsChainResult:(BOOL)a3
{
  self->_displaysAsChainResult = a3;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (void)setPrefersAddressOverCategory:(BOOL)a3
{
  self->_prefersAddressOverCategory = a3;
}

- (BOOL)usePlaceSummary
{
  return self->_usePlaceSummary;
}

- (void)setUsePlaceSummary:(BOOL)a3
{
  self->_usePlaceSummary = a3;
}

- (SearchResultsDataSourceContent)content
{
  return self->_content;
}

- (ShareDelegate)shareDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);

  return (ShareDelegate *)WeakRetained;
}

- (void)setShareDelegate:(id)a3
{
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
}

- (BOOL)isPresentingSearchAlongTheRouteResults
{
  return self->_isPresentingSearchAlongTheRouteResults;
}

- (BOOL)isPresentingAddStopResultsFromWaypointEditor
{
  return self->_isPresentingAddStopResultsFromWaypointEditor;
}

- (void)setIsPresentingAddStopResultsFromWaypointEditor:(BOOL)a3
{
  self->_isPresentingAddStopResultsFromWaypointEditor = a3;
}

- (SARSearchResultTableViewCellDelegate)searchAlongTheRouteCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchAlongTheRouteCellDelegate);

  return (SARSearchResultTableViewCellDelegate *)WeakRetained;
}

- (MKCollectionCarouselRoutingDelegate)collectionCarouselRoutingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionCarouselRoutingDelegate);

  return (MKCollectionCarouselRoutingDelegate *)WeakRetained;
}

- (void)setCollectionCarouselRoutingDelegate:(id)a3
{
}

- (BOOL)displayDistance
{
  return self->_displayDistance;
}

- (void)setDisplayDistance:(BOOL)a3
{
  self->_displayDistance = a3;
}

- (BOOL)isPresentingVenueClusterResults
{
  return self->_isPresentingVenueClusterResults;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void)setSectionIndexTitles:(id)a3
{
}

- (GEOLocation)approxLocation
{
  return self->_approxLocation;
}

- (void)setApproxLocation:(id)a3
{
}

- (BOOL)isShowingClusterResults
{
  return self->_isShowingClusterResults;
}

- (void)setIsShowingClusterResults:(BOOL)a3
{
  self->_isShowingClusterResults = a3;
}

- (BOOL)isSimpleSearchResults
{
  return self->_isSimpleSearchResults;
}

- (void)setIsSimpleSearchResults:(BOOL)a3
{
  self->_isSimpleSearchResults = a3;
}

- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return self->_guideSummaryLayoutMetadata;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSUUID)impressionsSessionIdentifier
{
  return self->_impressionsSessionIdentifier;
}

- (void)setImpressionsSessionIdentifier:(id)a3
{
}

- (SearchResultsCuratedCollectionsAnalyticsManager)curatedCollectionsAnalyticsManager
{
  return self->_curatedCollectionsAnalyticsManager;
}

- (void)setCuratedCollectionsAnalyticsManager:(id)a3
{
}

- (void)setIndexPathForRelatedCollectionSection:(id)a3
{
}

- (NSCache)placeSummaryTemplateViewModels
{
  return self->_placeSummaryTemplateViewModels;
}

- (void)setPlaceSummaryTemplateViewModels:(id)a3
{
}

- (NSCache)curatedGuideViewModels
{
  return self->_curatedGuideViewModels;
}

- (void)setCuratedGuideViewModels:(id)a3
{
}

- (NSMutableDictionary)mapitemTemplates
{
  return self->_mapitemTemplates;
}

- (void)setMapitemTemplates:(id)a3
{
}

- (MKMapServiceTicket)mapServiceTicket
{
  return self->_mapServiceTicket;
}

- (void)setMapServiceTicket:(id)a3
{
}

- (void)setStructuredRAPAffordance:(id)a3
{
}

- (NSMutableDictionary)impressionElements
{
  return self->_impressionElements;
}

- (void)setImpressionElements:(id)a3
{
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)placeSummaryAsyncDataManager
{
  return self->_placeSummaryAsyncDataManager;
}

- (void)setPlaceSummaryAsyncDataManager:(id)a3
{
}

- (_TtC4Maps31PlaceSummaryEVChargerDownloader)evChargerDownloader
{
  return self->_evChargerDownloader;
}

- (void)setEvChargerDownloader:(id)a3
{
}

- (_TtC4Maps35CuratedGuideViewModelDataDownloader)curatedGuideDataDownloader
{
  return self->_curatedGuideDataDownloader;
}

- (void)setCuratedGuideDataDownloader:(id)a3
{
}

- (BOOL)placeSummaryUsesRichLayout
{
  return self->_placeSummaryUsesRichLayout;
}

- (void)setPlaceSummaryUsesRichLayout:(BOOL)a3
{
  self->_placeSummaryUsesRichLayout = a3;
}

- (BOOL)guideSummaryUsesRichLayout
{
  return self->_guideSummaryUsesRichLayout;
}

- (void)setGuideSummaryUsesRichLayout:(BOOL)a3
{
  self->_guideSummaryUsesRichLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedGuideDataDownloader, 0);
  objc_storeStrong((id *)&self->_evChargerDownloader, 0);
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, 0);
  objc_storeStrong((id *)&self->_impressionElements, 0);
  objc_storeStrong((id *)&self->_structuredRAPAffordance, 0);
  objc_storeStrong((id *)&self->_mapServiceTicket, 0);
  objc_storeStrong((id *)&self->_mapitemTemplates, 0);
  objc_storeStrong((id *)&self->_curatedGuideViewModels, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_indexPathForRelatedCollectionSection, 0);
  objc_storeStrong((id *)&self->_curatedCollectionsAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_impressionsSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_storeStrong((id *)&self->_approxLocation, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_destroyWeak((id *)&self->_collectionCarouselRoutingDelegate);
  objc_destroyWeak((id *)&self->_searchAlongTheRouteCellDelegate);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_openAt, 0);
}

@end