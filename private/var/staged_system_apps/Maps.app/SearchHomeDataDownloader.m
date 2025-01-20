@interface SearchHomeDataDownloader
- (BOOL)isFetchingDataComplete;
- (BOOL)searchAlongRoute;
- (BOOL)supportsFullTextSearch;
- (NSArray)dataProviders;
- (SearchHomeDataDownloader)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4;
- (SearchHomeDataDownloaderCache)cache;
- (SearchHomeDataFetcherDelegate)delegate;
- (id)browseCategoriesDataProviderWithSearchCategories:(id)a3 title:(id)a4;
- (id)citiesNearYouDataProviderWithSuggestions:(id)a3 title:(id)a4;
- (id)curatedCollectionsDataProviderWithCollectionSuggestions:(id)a3 title:(id)a4;
- (id)publishersDataProviderWithPublisherSuggestions:(id)a3 title:(id)a4;
- (void)fetchContent;
- (void)parseResponse:(id)a3;
- (void)setCache:(id)a3;
- (void)setDataProviders:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSupportsFullTextSearch:(BOOL)a3;
@end

@implementation SearchHomeDataDownloader

- (SearchHomeDataDownloader)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchHomeDataDownloader;
  v7 = [(SearchHomeDataDownloader *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_searchAlongRoute = a4;
    v9 = objc_alloc_init(SearchHomeDataDownloaderCache);
    cache = v8->_cache;
    v8->_cache = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.Maps.Search.SearchHomeParsingResponse", v11);
    parsingQueue = v8->_parsingQueue;
    v8->_parsingQueue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

- (void)fetchContent
{
  self->_isFetchingDataComplete = 0;
  v3 = [(SearchHomeDataDownloader *)self delegate];
  id v4 = [v3 newTraits];

  if (!v4)
  {
    v5 = sub_100576A04();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "The defaultTraits are being used because the delegate was found nil, hence the traits were nil", buf, 2u);
    }

    id v6 = +[MKMapService sharedService];
    id v4 = [v6 defaultTraits];
  }
  v7 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  v8 = [v7 virtualGarage];
  v9 = [v8 selectedVehicle];

  if (v9)
  {
    v10 = [v9 lprPowerType];
    lprPowerType = self->_lprPowerType;
    self->_lprPowerType = v10;
  }
  dispatch_queue_t v12 = [SearchHomeDataDownloaderCacheKey alloc];
  v13 = [v4 mapRegion];
  GEOMapRectForMapRegion();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  unsigned int v22 = [v4 mode] - 1;
  if (v22 > 3) {
    uint64_t v23 = 103;
  }
  else {
    uint64_t v23 = qword_100F73C60[v22];
  }
  v24 = -[SearchHomeDataDownloaderCacheKey initWithMapRect:mapType:time:lprPowerType:](v12, "initWithMapRect:mapType:time:lprPowerType:", v23, self->_lprPowerType, v15, v17, v19, v21, CFAbsoluteTimeGetCurrent());

  v25 = [(SearchHomeDataDownloader *)self cache];
  v26 = [v25 objectForKey:v24];

  if (v26)
  {
    [(SearchHomeDataDownloader *)self parseResponse:v26];
  }
  else
  {
    objc_initWeak(&location, self);
    v27 = sub_100C63F18();
    v28 = (char *)os_signpost_id_generate(v27);

    v29 = sub_100C63F18();
    v30 = v29;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v28, "FetchingSearchHome", "", buf, 2u);
    }

    v31 = [(SearchHomeDataDownloader *)self delegate];
    [v31 isTouristHereValue];
    [v4 setIsTourist:];

    [v4 setSearchOriginationType:0];
    if ([(SearchHomeDataDownloader *)self searchAlongRoute])
    {
      [v4 setNavigating:[self searchAlongRoute]];
      v32 = +[MNNavigationService sharedService];
      if ([v32 isInNavigatingState]) {
        id v33 = [v32 navigationTransportType];
      }
      else {
        id v33 = [v32 desiredTransportType];
      }
      [v4 setNavigationTransportType:v33];
      [v4 setSearchOriginationType:2];
      if (MapsFeature_IsEnabled_HikingiOS())
      {
        uint64_t v34 = 35;
      }
      else if (MapsFeature_IsEnabled_SearchAndDiscovery())
      {
        uint64_t v34 = 31;
      }
      else
      {
        uint64_t v34 = 28;
      }
      [v4 setPlaceSummaryRevision:v34];
      [v4 addSupportedPlaceSummaryFormatType:1];
      [v4 addSupportedPlaceSummaryFormatType:2];
      [v4 addSupportedPlaceSummaryFormatType:3];
    }
    v35 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
    uint64_t v36 = [v35 updatedTraitsForCurrentGarageState:v4];

    v37 = sub_100576A04();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "The category request is made with the traits: %@", buf, 0xCu);
    }

    v38 = +[MKMapService sharedService];
    v39 = [v38 ticketForSearchHomeWithTraits:v36];

    parsingQueue = self->_parsingQueue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100C63F6C;
    v41[3] = &unk_10131CD30;
    v44[1] = v28;
    objc_copyWeak(v44, &location);
    v42 = v24;
    v43 = self;
    [v39 submitWithCallbackQueue:parsingQueue handler:v41 networkActivity:0];

    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
    id v4 = (id)v36;
  }
}

- (void)parseResponse:(id)a3
{
  id v4 = a3;
  v5 = sub_100C63F18();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = sub_100C63F18();
  v8 = v7;
  unint64_t v33 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "BuildingDataProviders", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  v9 = [v4 sections];
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v34 = v4;
  v11 = [v4 sections];
  id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    double v14 = 0;
    uint64_t v15 = *(void *)v36;
LABEL_6:
    uint64_t v16 = 0;
    while (2)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v11);
      }
      double v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
      switch((unint64_t)[v17 sectionType])
      {
        case 1uLL:
          double v18 = [v17 searchCategories];
          double v19 = [v17 name];
          uint64_t v20 = [(SearchHomeDataDownloader *)self browseCategoriesDataProviderWithSearchCategories:v18 title:v19];

          [v10 addObject:v20];
          double v14 = (void *)v20;
          goto LABEL_16;
        case 2uLL:
          double v21 = [v17 collectionSuggestions];
          unsigned int v22 = [v17 name];
          uint64_t v23 = [(SearchHomeDataDownloader *)self curatedCollectionsDataProviderWithCollectionSuggestions:v21 title:v22];
          goto LABEL_15;
        case 3uLL:
          double v21 = [v17 publisherSuggestions];
          unsigned int v22 = [v17 name];
          uint64_t v23 = [(SearchHomeDataDownloader *)self publishersDataProviderWithPublisherSuggestions:v21 title:v22];
          goto LABEL_15;
        case 4uLL:
          if (!MapsFeature_IsEnabled_Maps269()) {
            goto LABEL_16;
          }
          double v21 = [v17 guideLocationSuggestsions];
          unsigned int v22 = [v17 name];
          uint64_t v23 = [(SearchHomeDataDownloader *)self citiesNearYouDataProviderWithSuggestions:v21 title:v22];
LABEL_15:
          v24 = (void *)v23;
          [v10 addObject:v23];

LABEL_16:
          if (v13 != (id)++v16) {
            continue;
          }
          id v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (!v13) {
            goto LABEL_20;
          }
          goto LABEL_6;
        default:
          goto LABEL_16;
      }
    }
  }
  double v14 = 0;
LABEL_20:

  v25 = +[MapsOfflineUIHelper sharedHelper];
  if ([v25 isUsingOfflineMaps]
    && ![(SearchHomeDataDownloader *)self searchAlongRoute])
  {
    unsigned __int8 v31 = [(SearchHomeDataDownloader *)self supportsFullTextSearch];

    if ((v31 & 1) == 0)
    {
      BOOL v26 = 0;
      goto LABEL_24;
    }
  }
  else
  {
  }
  BOOL v26 = [v10 count] == (id)1;
LABEL_24:
  [v14 setWantsOneColumnLayout:v26];
  self->_isFetchingDataComplete = 1;
  id v27 = [v10 copy];
  [(SearchHomeDataDownloader *)self setDataProviders:v27];

  v28 = [(SearchHomeDataDownloader *)self delegate];
  [v28 didUpdateDataFetcher:self];

  v29 = sub_100C63F18();
  v30 = v29;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, spid, "BuildingDataProviders", "", buf, 2u);
  }
}

- (id)browseCategoriesDataProviderWithSearchCategories:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
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
        id v13 = [[BrowseCategory alloc] initWithCategory:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  double v14 = sub_100576A04();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "The Search Browse Categories in the response are : %@", buf, 0xCu);
  }

  uint64_t v15 = +[NSUUID UUID];
  uint64_t v16 = [v15 UUIDString];
  double v17 = +[NSString stringWithFormat:@"SearchHomeBrowseCategories-%@", v16];

  double v18 = [SearchHomeBrowseCategoriesDataProvider alloc];
  id v19 = [v7 copy];
  uint64_t v20 = [(SearchHomeBrowseCategoriesDataProvider *)v18 initWithObjects:v19 type:2 identifier:v17 title:v6];

  return v20;
}

- (id)curatedCollectionsDataProviderWithCollectionSuggestions:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 collections];
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [v5 collections];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) collection];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  uint64_t v15 = +[NSUUID UUID];
  uint64_t v16 = [v15 UUIDString];
  double v17 = +[NSString stringWithFormat:@"SearchHomeCuratedCollections-%@", v16];

  double v18 = [SearchHomeCollectionsDataProvider alloc];
  id v19 = [v8 copy];
  uint64_t v20 = [(SearchHomeCollectionsDataProvider *)v18 initWithObjects:v19 type:3 identifier:v17 title:v6];

  if (MapsFeature_IsEnabled_Maps269())
  {
    double v21 = [v5 exploreGuides];

    if (v21)
    {
      long long v22 = [v5 exploreGuides];
      [(SearchHomeCollectionsDataProvider *)v20 configureWithExploreGuides:v22];
    }
  }

  return v20;
}

- (id)publishersDataProviderWithPublisherSuggestions:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 publishers];
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [v5 publishers];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) publisher];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  uint64_t v15 = +[NSUUID UUID];
  uint64_t v16 = [v15 UUIDString];
  double v17 = +[NSString stringWithFormat:@"SearchHomePublishers-%@", v16];

  double v18 = [SearchHomePublishersDataProvider alloc];
  id v19 = [v8 copy];
  uint64_t v20 = [(SearchHomePublishersDataProvider *)v18 initWithObjects:v19 type:4 identifier:v17 title:v6];

  return v20;
}

- (id)citiesNearYouDataProviderWithSuggestions:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (MapsFeature_IsEnabled_Maps269())
  {
    v7 = +[NSUUID UUID];
    id v8 = [v7 UUIDString];
    id v9 = +[NSString stringWithFormat:@"SearchHomeCitiesNearYou-%@", v8];

    id v10 = [SearchHomeCitiesDataProvider alloc];
    id v11 = [v5 guideLocations];
    uint64_t v12 = [(SearchHomeCitiesDataProvider *)v10 initWithObjects:v11 type:5 identifier:v9 title:v6];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (SearchHomeDataFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchHomeDataFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
}

- (BOOL)isFetchingDataComplete
{
  return self->_isFetchingDataComplete;
}

- (BOOL)supportsFullTextSearch
{
  return self->_supportsFullTextSearch;
}

- (void)setSupportsFullTextSearch:(BOOL)a3
{
  self->_supportsFullTextSearch = a3;
}

- (SearchHomeDataDownloaderCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_lprPowerType, 0);

  objc_storeStrong((id *)&self->_parsingQueue, 0);
}

@end