@interface HomeOutlineSearchResultsSectionController
- (BOOL)_isItemVenue:(id)a3;
- (BOOL)persistsExpansions;
- (HomeOutlineSearchResultsSectionController)initWithConfiguration:(id)a3;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (id)_childItemsInVenueSearchResult:(id)a3;
- (id)_searchResultContainingIdentifierPath:(id)a3;
- (id)contextMenuForSnapshot:(id)a3;
- (void)_refreshEVChargers:(id)a3;
- (void)addMetricsForPlaceSummaryTemplate:(id)a3;
- (void)cachePlacesummaryTemplates:(id)a3 metadata:(id)a4 location:(id)a5 openAt:(id)a6;
- (void)dealloc;
- (void)didTapOnContainment:(id)a3;
- (void)didTapOnCuratedGuide:(id)a3;
- (void)didTapOnCuratedGuides:(id)a3;
- (void)didTapOnPhotoCarousel:(id)a3 index:(int64_t)a4;
- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4;
- (void)didTapOnReportAnIssue;
- (void)didTapOnUserGeneratedGuide:(id)a3;
- (void)didTapOnUserLibrary:(id)a3;
- (void)didTapOnUserNote:(id)a3;
- (void)expandElementAtIdentifierPath:(id)a3;
- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5;
- (void)presentVenueWithVenueCardItem:(id)a3;
- (void)relatedSearchSuggestionOutlineCellDidTapActionButtonWithSuggestion:(id)a3;
- (void)resetEVChargerDownloader;
- (void)searchResultsFilterItem:(id)a3 didSelectSuggestion:(id)a4;
- (void)venuesDropDownOutlineCell:(id)a3 didSelectCategory:(id)a4;
@end

@implementation HomeOutlineSearchResultsSectionController

- (HomeOutlineSearchResultsSectionController)initWithConfiguration:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)HomeOutlineSearchResultsSectionController;
  v3 = [(HomeOutlineSectionController *)&v23 initWithConfiguration:a3];
  if (v3)
  {
    v4 = objc_alloc_init(SearchResultsDataProvider);
    searchResultsDataProvider = v3->_searchResultsDataProvider;
    v3->_searchResultsDataProvider = v4;

    v6 = [(HomeOutlineSectionController *)v3 configuration];
    v7 = [v6 actionCoordinator];
    [(SearchResultsDataProvider *)v3->_searchResultsDataProvider setActionCoordinator:v7];

    v8 = [[CollectionsDataProvider alloc] initWithContext:0 observeInfo:0 observeContents:1];
    collectionsDataProvider = v3->_collectionsDataProvider;
    v3->_collectionsDataProvider = v8;

    v10 = objc_alloc_init(CurrentLocationDataProvider);
    currentLocationDataProvider = v3->_currentLocationDataProvider;
    v3->_currentLocationDataProvider = v10;

    v12 = objc_alloc_init(DistanceUnitDataProvider);
    distanceUnitDataProvider = v3->_distanceUnitDataProvider;
    v3->_distanceUnitDataProvider = v12;

    v14 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    asyncDataManager = v3->_asyncDataManager;
    v3->_asyncDataManager = v14;

    v16 = objc_alloc_init(_TtC4Maps31PlaceSummaryEVChargerDownloader);
    evChargerDownloader = v3->_evChargerDownloader;
    v3->_evChargerDownloader = v16;

    v18 = objc_alloc_init(_TtC4Maps35CuratedGuideViewModelDataDownloader);
    curatedGuideDataDownloader = v3->_curatedGuideDataDownloader;
    v3->_curatedGuideDataDownloader = v18;

    v3->_usePlaceSummary = sub_1009DB5CC();
    v20 = (NSCache *)objc_alloc_init((Class)NSCache);
    placeSummaryTemplateViewModels = v3->_placeSummaryTemplateViewModels;
    v3->_placeSummaryTemplateViewModels = v20;
  }
  return v3;
}

- (void)dealloc
{
  placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;
  if (placeSummaryTemplateViewModels)
  {
    [(NSCache *)placeSummaryTemplateViewModels removeAllObjects];
    v4 = self->_placeSummaryTemplateViewModels;
    self->_placeSummaryTemplateViewModels = 0;
  }
  [(HomeOutlineSearchResultsSectionController *)self resetEVChargerDownloader];
  v5.receiver = self;
  v5.super_class = (Class)HomeOutlineSearchResultsSectionController;
  [(HomeOutlineSearchResultsSectionController *)&v5 dealloc];
}

- (void)resetEVChargerDownloader
{
  evChargerDownloader = self->_evChargerDownloader;
  self->_evChargerDownloader = 0;
}

- (NSArray)dataProviders
{
  collectionsDataProvider = self->_collectionsDataProvider;
  v6[0] = self->_searchResultsDataProvider;
  v6[1] = collectionsDataProvider;
  distanceUnitDataProvider = self->_distanceUnitDataProvider;
  v6[2] = self->_currentLocationDataProvider;
  v6[3] = distanceUnitDataProvider;
  v4 = +[NSArray arrayWithObjects:v6 count:4];

  return (NSArray *)v4;
}

- (void)_refreshEVChargers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10036A974;
  v3[3] = &unk_1012E61A8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[Sidebar] Search Results" value:@"localized string not found" table:0];

  objc_super v5 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider searchResults];
  v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v5 count]);

  v7 = [[SectionHeaderBasicOutlineCellModel alloc] initWithTitle:v6];

  return (MapsUIDiffableDataSourceViewModel *)v7;
}

- (NSArray)itemSnapshots
{
  v3 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider searchInfo];
  if (!MapsFeature_IsEnabled_MapsWally()
    || ([v3 autocompletePerson], v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    objc_super v5 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider searchResults];
    v43 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider suggestions];
    v42 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider currentSuggestion];
    v7 = [(CurrentLocationDataProvider *)self->_currentLocationDataProvider currentLocation];
    int64_t v40 = [(DistanceUnitDataProvider *)self->_distanceUnitDataProvider distanceUnit];
    v41 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider relatedSuggestion];
    v8 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider errorString];
    if ([v3 singleResultMode])
    {
      v9 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider actionCoordinator];
      v10 = [v9 currentSearchSession];
      unsigned __int8 v11 = [v10 isSpotlightPunchInSearch];

      if ((v11 & 1) == 0)
      {
        v12 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider suggestions];
        id v13 = [v12 count];

        v14 = [v3 results];
        v15 = [v14 firstObject];
        unsigned __int8 v16 = [(HomeOutlineSearchResultsSectionController *)self _isItemVenue:v15];

        if ((v16 & 1) == 0 && !v13)
        {
          v17 = sub_1000AA148();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = sub_100097E28(0);
            v19 = sub_100097E28(0);
            *(_DWORD *)buf = 138412546;
            id v55 = v18;
            __int16 v56 = 2112;
            v57 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Returning empty items here. isVenueResult :%@ and %@", buf, 0x16u);
          }
          v6 = &__NSArray0__struct;
LABEL_25:

          goto LABEL_26;
        }
      }
    }
    if ([(SearchResultsDataProvider *)self->_searchResultsDataProvider isLoading]
      || [v8 length])
    {
      v20 = -[HomeSearchStatusOutlineCellModel initWithErrorString:enableStructuredRAPAffordance:delegate:]([HomeSearchStatusOutlineCellModel alloc], "initWithErrorString:enableStructuredRAPAffordance:delegate:", v8, [v3 enableStructuredRAPAffordance], self);
      v53 = v20;
      uint64_t v21 = +[NSArray arrayWithObjects:&v53 count:1];
    }
    else if ([v43 count])
    {
      v31 = [[HomeSearchResultsFilterItem alloc] initWithSuggestions:v43 currentSuggestion:v42 delegate:self];
      searchResultsFilterItem = self->_searchResultsFilterItem;
      self->_searchResultsFilterItem = v31;

      v52 = self->_searchResultsFilterItem;
      v20 = +[NSArray arrayWithObjects:&v52 count:1];
      uint64_t v21 = [(HomeSearchStatusOutlineCellModel *)v20 arrayByAddingObjectsFromArray:v5];
    }
    else
    {
      if ([v3 hasRelatedSearchSuggestion])
      {
        v20 = [[RelatedSearchSuggestionOutlineCellModel alloc] initWithRelatedSuggestion:v41 delegate:self];
        v51 = v20;
        v33 = +[NSArray arrayWithObjects:&v51 count:1];
        v17 = [v33 arrayByAddingObjectsFromArray:v5];

        goto LABEL_17;
      }
      v34 = self->_searchResultsFilterItem;
      self->_searchResultsFilterItem = 0;

      if (![v3 enableStructuredRAPAffordance]
        || ([v3 results],
            v35 = objc_claimAutoreleasedReturnValue(),
            id v36 = [v35 count],
            v35,
            !v36))
      {
        v17 = v5;
        goto LABEL_18;
      }
      v37 = [ReportASearchAutocompleteResult alloc];
      v38 = [v3 searchFieldItem];
      v39 = [v38 title];
      v20 = [(ReportASearchAutocompleteResult *)v37 initWithTitle:v39];

      uint64_t v21 = [v5 arrayByAddingObject:v20];
    }
    v17 = v21;
LABEL_17:

LABEL_18:
    v22 = sub_1000AA148();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v17 count];
      *(_DWORD *)buf = 134218242;
      id v55 = v23;
      __int16 v56 = 2112;
      v57 = v17;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "These %lu items %@ will be will be applied to the snapshot.", buf, 0x16u);
    }

    placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;
    if (placeSummaryTemplateViewModels) {
      [(NSCache *)placeSummaryTemplateViewModels removeAllObjects];
    }
    if (v17)
    {
      v25 = [v3 placeSummaryMetadata];
      v26 = [v3 openAt];
      [(HomeOutlineSearchResultsSectionController *)self cachePlacesummaryTemplates:v17 metadata:v25 location:v7 openAt:v26];
    }
    v27 = [(HomeOutlineSectionController *)self configuration];
    v28 = [v27 sectionIdentifier];
    BOOL v29 = [(HomeOutlineSectionController *)self expanded];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10036B264;
    v50[3] = &unk_1012E61D0;
    v50[4] = self;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10036B39C;
    v46[3] = &unk_1012E61F8;
    v46[4] = self;
    id v47 = v3;
    id v48 = v7;
    int64_t v49 = v40;
    v44[4] = self;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10036B7E8;
    v45[3] = &unk_1012E6220;
    v45[4] = self;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10036B858;
    v44[3] = &unk_1012E6248;
    v6 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v17 sectionIdentifier:v28 sectionExpanded:v29 itemIdentifierBlock:v50 viewModelBlock:v46 childItemsBlock:v45 expandedBlock:v44];

    goto LABEL_25;
  }
  objc_super v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Returning empty items here : %@", buf, 0xCu);
  }
  v6 = &__NSArray0__struct;
LABEL_26:

  return (NSArray *)v6;
}

- (void)cachePlacesummaryTemplates:(id)a3 metadata:(id)a4 location:(id)a5 openAt:(id)a6
{
  id v10 = a3;
  id v40 = a4;
  id v39 = a5;
  v37 = self;
  id v38 = a6;
  if (self->_usePlaceSummary)
  {
    placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;
    if (placeSummaryTemplateViewModels)
    {
      [(NSCache *)placeSummaryTemplateViewModels removeAllObjects];
    }
    else
    {
      v12 = (NSCache *)objc_alloc_init((Class)NSCache);
      id v13 = self->_placeSummaryTemplateViewModels;
      self->_placeSummaryTemplateViewModels = v12;
    }
    +[NSMutableDictionary dictionary];
    id v35 = v10;
    id v36 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v43;
      p_superclass = CarMapWidgetETACardViewController.superclass;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = v20;
            v22 = v21;
            if (v21)
            {
              id v23 = [v21 mapItem];
              [v23 _geoMapItem];
              v25 = v24 = p_superclass;
              unsigned int v26 = [v25 _hasEVCharger];

              p_superclass = v24;
              if (v26)
              {
                v27 = +[PlaceSummaryViewModelTemplateFactory viewModelWithSearchResult:v22 metadata:v40 currentLocation:v39 searchAlongRoute:0 openAt:v38];
                if (v27)
                {
                  v28 = [v22 mapItem];
                  BOOL v29 = [v28 _identifier];
                  [(NSDictionary *)v36 setObject:v27 forKeyedSubscript:v29];

                  v41 = v37->_placeSummaryTemplateViewModels;
                  v30 = [v22 mapItem];
                  [v30 _identifier];
                  uint64_t v31 = v17;
                  v33 = id v32 = v14;
                  [(NSCache *)v41 setObject:v27 forKey:v33];

                  id v14 = v32;
                  uint64_t v17 = v31;
                  p_superclass = v24;
                }
              }
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v16);
    }

    placeSummaryTemplates = v37->_placeSummaryTemplates;
    v37->_placeSummaryTemplates = v36;

    id v10 = v35;
  }
}

- (id)contextMenuForSnapshot:(id)a3
{
  return 0;
}

- (id)_searchResultContainingIdentifierPath:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    v6 = [v4 identifiers];
    v7 = [v6 objectAtIndexedSubscript:1];

    v8 = [(HomeOutlineSectionController *)self sectionSnapshot];
    v9 = [v8 childSnapshotWithIdentifier:v7];

    id v10 = [v9 viewModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v11 = v10;
    }
    else {
      unsigned __int8 v11 = 0;
    }
    id v12 = v11;

    objc_super v5 = [v12 searchResult];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)addMetricsForPlaceSummaryTemplate:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    v3 = [[_TtC4Maps19PlaceSummaryMetrics alloc] initWithLeadingMargin:1 trailingMargin:8.0 topMargin:8.0 bottomMargin:8.0 topLeadingCornerRadius:8.0 topTrailingCornerRadius:0.0 bottomLeadingCornerRadius:0.0 bottomTrailingCornerRadius:0.0 showsDivider:0.0];
    [v4 setMetrics:v3];
  }
}

- (void)expandElementAtIdentifierPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HomeOutlineSearchResultsSectionController *)self _searchResultContainingIdentifierPath:v4];
  v6 = v5;
  if (v5)
  {
    searchResultsDataProvider = self->_searchResultsDataProvider;
    v8 = [v5 mapItem];
    [(SearchResultsDataProvider *)searchResultsDataProvider downloadVenueInfoForMapItem:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)HomeOutlineSearchResultsSectionController;
  [(HomeOutlineSectionController *)&v9 expandElementAtIdentifierPath:v4];
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  id v12 = a3;
  [(SearchResultsDataProvider *)self->_searchResultsDataProvider presentVenueWithVenueCardItem:v12];
  if ([v12 conformsToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem])
  {
    id v4 = v12;
    objc_super v5 = [SearchResult alloc];
    v6 = [v4 venueMapItem];

    v7 = [(SearchResult *)v5 initWithMapItem:v6];
    v8 = [(HomeOutlineSectionController *)self identifierCache];
    objc_super v9 = [v8 identifierForObject:v7];

    id v10 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    unsigned __int8 v11 = [v10 identifierPathByAppendingIdentifier:v9];

    [(HomeOutlineSearchResultsSectionController *)self expandElementAtIdentifierPath:v11];
  }
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  searchResultsDataProvider = self->_searchResultsDataProvider;
  id v9 = a3;
  [(SearchResultsDataProvider *)searchResultsDataProvider handleVenueSearchResultsWithSelectedSearchResult:v9 searchFieldItem:a4 browseCategories:a5];
  id v14 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider searchInfo];
  id v10 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider searchInfo];
  unsigned __int8 v11 = [v10 placeSummaryMetadata];
  id v12 = [(CurrentLocationDataProvider *)self->_currentLocationDataProvider currentLocation];
  id v13 = [v14 openAt];
  [(HomeOutlineSearchResultsSectionController *)self cachePlacesummaryTemplates:v9 metadata:v11 location:v12 openAt:v13];
}

- (BOOL)_isItemVenue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 mapItem];
    BOOL v5 = [v4 _venueFeatureType] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_childItemsInVenueSearchResult:(id)a3
{
  id v4 = [a3 mapItem];
  BOOL v5 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider venueProviderForMapItem:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 currentCategory];
    v8 = [v7 displayString];

    id v9 = [v4 _venueInfo];
    id v10 = [v9 venueIdentifier];

    unsigned __int8 v11 = [VenueDropDownOutlineCellModel alloc];
    id v12 = [v6 browseCategories];
    id v13 = [v6 currentCategory];
    id v14 = [(VenueDropDownOutlineCellModel *)v11 initWithButtonTitle:v8 categories:v12 selectedCategory:v13 venueIdentifier:v10 delegate:self];

    v19 = v14;
    id v15 = +[NSArray arrayWithObjects:&v19 count:1];
    id v16 = [v6 venueContents];
    uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v16];
  }
  else
  {
    uint64_t v17 = &__NSArray0__struct;
  }

  return v17;
}

- (BOOL)persistsExpansions
{
  return 0;
}

- (void)searchResultsFilterItem:(id)a3 didSelectSuggestion:(id)a4
{
  id v5 = a4;
  v8 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v8 setSuggestion:v5];

  v6 = [(HomeOutlineSectionController *)self configuration];
  v7 = [v6 actionCoordinator];
  [v7 viewController:0 doSearchItem:v8 withUserInfo:&off_1013AE970];
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v5 = a3;
  id v7 = [(HomeOutlineSectionController *)self configuration];
  v6 = [v7 homeActionDelegate];
  [v6 homeDidTapOnPlaceContextWithViewModel:v5];
}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v4 = a3;
  id v6 = [(HomeOutlineSectionController *)self configuration];
  id v5 = [v6 homeActionDelegate];
  [v5 homeDidTapOnUserGeneratedGuide:v4];
}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v4 = a3;
  id v6 = [(HomeOutlineSectionController *)self configuration];
  id v5 = [v6 homeActionDelegate];
  [v5 homeDidTapOnCuratedGuide:v4];
}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v4 = a3;
  id v6 = [(HomeOutlineSectionController *)self configuration];
  id v5 = [v6 homeActionDelegate];
  [v5 homeDidTapOnCuratedGuides:v4];
}

- (void)didTapOnContainment:(id)a3
{
  id v4 = a3;
  id v7 = [(HomeOutlineSectionController *)self configuration];
  id v5 = [v7 homeActionDelegate];
  id v6 = [(SearchResultsDataProvider *)self->_searchResultsDataProvider searchResults];
  [v5 homeDidTapOnContainment:v4 forResults:v6];
}

- (void)didTapOnUserNote:(id)a3
{
  id v4 = a3;
  id v6 = [(HomeOutlineSectionController *)self configuration];
  id v5 = [v6 homeActionDelegate];
  [v5 homeItemTapped:v4];
}

- (void)didTapOnUserLibrary:(id)a3
{
  id v4 = [(HomeOutlineSectionController *)self configuration];
  id v3 = [v4 actionCoordinator];
  [v3 viewControllerShowLibraryPlacesView:0];
}

- (void)didTapOnPhotoCarousel:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  id v7 = [(HomeOutlineSectionController *)self configuration];
  id v6 = [v7 homeActionDelegate];
  [v6 homeItemTapped:v5];
}

- (void)venuesDropDownOutlineCell:(id)a3 didSelectCategory:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cellModel];
  id v8 = [v7 venueIdentifier];

  [(SearchResultsDataProvider *)self->_searchResultsDataProvider selectCategory:v6 forVenueWithVenueIdentifier:v8];
}

- (void)relatedSearchSuggestionOutlineCellDidTapActionButtonWithSuggestion:(id)a3
{
}

- (void)didTapOnReportAnIssue
{
  id v8 = [[ReportASearchAutocompleteResult alloc] initWithTitle:0];
  id v3 = [(HomeOutlineSectionController *)self configuration];
  id v4 = [v3 actionCoordinator];
  id v5 = [v4 containerViewController];
  id v6 = [v5 _maps_mapsSceneDelegate];
  id v7 = [v6 rapPresenter];

  [v7 presentAddToMapsFromSearchEntryPoint:8 result:v8 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSummaryTemplates, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_curatedGuideDataDownloader, 0);
  objc_storeStrong((id *)&self->_evChargerDownloader, 0);
  objc_storeStrong((id *)&self->_asyncDataManager, 0);
  objc_storeStrong((id *)&self->_searchResultsFilterItem, 0);
  objc_storeStrong((id *)&self->_distanceUnitDataProvider, 0);
  objc_storeStrong((id *)&self->_collectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_currentLocationDataProvider, 0);

  objc_storeStrong((id *)&self->_searchResultsDataProvider, 0);
}

@end