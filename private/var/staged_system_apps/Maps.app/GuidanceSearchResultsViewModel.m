@interface GuidanceSearchResultsViewModel
- (BOOL)isLoading;
- (GuidanceSearchResultsDataProviding)dataProvider;
- (GuidanceSearchResultsViewModel)initWithDataProvider:(id)a3 navActionCoordinator:(id)a4 routeInfoProvider:(id)a5 mapItemDisplayer:(id)a6;
- (GuidanceSearchResultsViewModelDelegate)delegate;
- (NSArray)results;
- (NSString)subtitle;
- (NSString)title;
- (NavActionCoordination)navActionCoordinator;
- (NavigationMapItemDisplaying)mapItemDisplayer;
- (NavigationRouteHistoryInfoProviding)routeInfoProvider;
- (PlaceSummaryMetadata)placeSummaryMetadata;
- (UIImage)headerImage;
- (void)_handleResults:(id)a3 error:(id)a4;
- (void)cancelResultsView;
- (void)clearSelection;
- (void)dealloc;
- (void)loadDataIfNeeded;
- (void)navigateToItemAtIndex:(unint64_t)a3;
- (void)selectMapItemAtIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setPlaceSummaryMetadata:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation GuidanceSearchResultsViewModel

- (GuidanceSearchResultsViewModel)initWithDataProvider:(id)a3 navActionCoordinator:(id)a4 routeInfoProvider:(id)a5 mapItemDisplayer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GuidanceSearchResultsViewModel;
  v15 = [(GuidanceSearchResultsViewModel *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataProvider, a3);
    objc_storeStrong((id *)&v16->_navActionCoordinator, a4);
    objc_storeStrong((id *)&v16->_routeInfoProvider, a5);
    objc_storeStrong((id *)&v16->_mapItemDisplayer, a6);
  }

  return v16;
}

- (void)dealloc
{
  [(GuidanceSearchResultsViewModel *)self clearSelection];
  [(NavigationMapItemDisplaying *)self->_mapItemDisplayer removeMapItems];
  v3.receiver = self;
  v3.super_class = (Class)GuidanceSearchResultsViewModel;
  [(GuidanceSearchResultsViewModel *)&v3 dealloc];
}

- (NSString)title
{
  objc_super v3 = [(GuidanceSearchResultsViewModel *)self dataProvider];
  v4 = [v3 title];

  v5 = [(GuidanceSearchResultsViewModel *)self results];
  id v6 = [v5 count];

  if (![v4 length] && v6)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"NAV_SAR_RESULT_TITLE" value:@"localized string not found" table:0];

    uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);

    v4 = (void *)v9;
  }

  return (NSString *)v4;
}

- (NSString)subtitle
{
  objc_super v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[Results] subtitle" value:@"localized string not found" table:0];
  v5 = [(GuidanceSearchResultsViewModel *)self results];
  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v5 count]);

  v7 = [(GuidanceSearchResultsViewModel *)self dataProvider];
  uint64_t v8 = [v7 subtitle];
  uint64_t v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = v6;
  }
  id v11 = v10;

  if ([v11 containsString:@"%[destination]"])
  {
    id v12 = [(NavActionCoordination *)self->_navActionCoordinator appCoordinator];
    id v13 = [v12 platformController];
    id v14 = [v13 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    v17 = [v16 currentDestinationString];

    if (v17)
    {
      id v18 = [v11 stringByReplacingOccurrencesOfString:@"%[destination]" withString:v17];
    }
    else
    {
      id v18 = v6;
    }
    id v19 = v18;
  }
  else
  {
    id v19 = v11;
  }

  return (NSString *)v19;
}

- (UIImage)headerImage
{
  headerImage = self->_headerImage;
  if (headerImage)
  {
    objc_super v3 = headerImage;
  }
  else
  {
    v5 = [(GuidanceSearchResultsViewModel *)self dataProvider];
    id v6 = [v5 styleAttributes];

    if (!v6) {
      goto LABEL_5;
    }
    v7 = [(GuidanceSearchResultsViewModel *)self dataProvider];
    uint64_t v8 = [v7 styleAttributes];
    uint64_t v9 = +[UIScreen mainScreen];
    [v9 nativeScale];
    +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v8, 4, 1);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_5:
      v10 = +[UIImage imageNamed:@"search"];
    }
    id v11 = self->_headerImage;
    self->_headerImage = v10;
    id v12 = v10;

    objc_super v3 = self->_headerImage;
  }

  return v3;
}

- (void)loadDataIfNeeded
{
  id v25 = [(GuidanceSearchResultsViewModel *)self results];
  if ([v25 count])
  {
    objc_super v3 = v25;
LABEL_3:
  }
  else
  {
    unsigned __int8 v4 = [(GuidanceSearchResultsViewModel *)self isLoading];

    if ((v4 & 1) == 0)
    {
      [(GuidanceSearchResultsViewModel *)self setLoading:1];
      v5 = [(GuidanceSearchResultsViewModel *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        v7 = [(GuidanceSearchResultsViewModel *)self delegate];
        [v7 viewModelWillStartLoading:self];
      }
      uint64_t v8 = +[MNNavigationService sharedService];
      switch([v8 navigationTransportType])
      {
        case 1u:
        case 6u:

          goto LABEL_18;
        case 2u:
          char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
          goto LABEL_13;
        case 3u:
          char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_13:
          char v10 = IsEnabled_Maps182;

          if (v10) {
            goto LABEL_14;
          }
          goto LABEL_18;
        default:
          int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

          if (!IsEnabled_DrivingMultiWaypointRoutes)
          {
LABEL_18:
            objc_initWeak(location, self);
            v17 = [(GuidanceSearchResultsViewModel *)self dataProvider];
            id v18 = [(GuidanceSearchResultsViewModel *)self routeInfoProvider];
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_100BFB200;
            v27[3] = &unk_1012E6E78;
            objc_copyWeak(&v28, location);
            [v17 loadSearchResultsWithRouteInfo:v18 completion:v27];

            objc_destroyWeak(&v28);
            objc_destroyWeak(location);
            return;
          }
LABEL_14:
          id v11 = [(GuidanceSearchResultsViewModel *)self dataProvider];
          if (objc_opt_respondsToSelector())
          {
            id v12 = [(GuidanceSearchResultsViewModel *)self dataProvider];
            unsigned int v13 = [v12 hasValidSearchResults];

            if (v13)
            {
              objc_initWeak(location, self);
              id v14 = [(GuidanceSearchResultsViewModel *)self dataProvider];
              v15 = [(GuidanceSearchResultsViewModel *)self routeInfoProvider];
              v29[0] = _NSConcreteStackBlock;
              v29[1] = 3221225472;
              v29[2] = sub_100BFB17C;
              v29[3] = &unk_1012E6E78;
              objc_copyWeak(&v30, location);
              [v14 loadSearchResultsWithRouteInfo:v15 completion:v29];

              objc_destroyWeak(&v30);
              objc_destroyWeak(location);
              return;
            }
          }
          else
          {
          }
          id v19 = [(GuidanceSearchResultsViewModel *)self dataProvider];
          char v20 = objc_opt_respondsToSelector();

          if (v20)
          {
            id v26 = [(GuidanceSearchResultsViewModel *)self dataProvider];
            v21 = [v26 error];
            [(GuidanceSearchResultsViewModel *)self _handleResults:&__NSArray0__struct error:v21];

            objc_super v3 = v26;
            goto LABEL_3;
          }
          v22 = sub_100109E50();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = [(GuidanceSearchResultsViewModel *)self dataProvider];
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v23;
          }
          v24 = +[NSError errorWithDomain:@"SAR_Results" code:0 userInfo:0];
          [(GuidanceSearchResultsViewModel *)self _handleResults:&__NSArray0__struct error:v24];

          break;
      }
    }
  }
}

- (void)clearSelection
{
  id v2 = [(GuidanceSearchResultsViewModel *)self navActionCoordinator];
  [v2 selectMapItem:0 shouldRemoveResults:1];
}

- (void)cancelResultsView
{
  [(GuidanceSearchResultsViewModel *)self clearSelection];
  [(NavigationMapItemDisplaying *)self->_mapItemDisplayer removeMapItems];
  id v3 = [(GuidanceSearchResultsViewModel *)self navActionCoordinator];
  [v3 dismissSearchAlongRoute];
}

- (void)navigateToItemAtIndex:(unint64_t)a3
{
  [(GuidanceSearchResultsViewModel *)self loadDataIfNeeded];
  v5 = [(GuidanceSearchResultsViewModel *)self results];
  id v6 = [v5 count];

  if ((unint64_t)v6 > a3)
  {
    v7 = [(GuidanceSearchResultsViewModel *)self results];
    id v9 = [v7 objectAtIndexedSubscript:a3];

    +[SARAnalytics captureListStartDetourToMapItem:v9 index:a3];
    uint64_t v8 = [(GuidanceSearchResultsViewModel *)self navActionCoordinator];
    [v8 detourToMapItem:v9];

    [(NavigationMapItemDisplaying *)self->_mapItemDisplayer removeMapItems];
  }
}

- (void)selectMapItemAtIndex:(unint64_t)a3
{
  v5 = [(GuidanceSearchResultsViewModel *)self results];
  id v6 = [v5 count];

  if ((unint64_t)v6 > a3)
  {
    v7 = [(GuidanceSearchResultsViewModel *)self results];
    id v9 = [v7 objectAtIndexedSubscript:a3];

    uint64_t v8 = [(GuidanceSearchResultsViewModel *)self navActionCoordinator];
    [v8 selectMapItem:v9 shouldRemoveResults:0];
  }
}

- (void)_handleResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = sub_100109E50();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412290;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SAR: Error received: %@", (uint8_t *)&v21, 0xCu);
    }

    [(GuidanceSearchResultsViewModel *)self setResults:0];
    id v9 = [(GuidanceSearchResultsViewModel *)self delegate];
    char v10 = v9;
    id v11 = self;
    id v12 = v7;
    goto LABEL_17;
  }
  if (![(GuidanceSearchResultsViewModel *)self isLoading])
  {
    id v13 = [v6 count];
    if (v6 && v13)
    {
      [(GuidanceSearchResultsViewModel *)self setResults:v6];
      if ([v6 count] == (id)1)
      {
        id v14 = +[MNNavigationService sharedService];
        unsigned int v15 = [v14 navigationTransportType];

        if (v15 != 3)
        {
          id v19 = sub_100109E50();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            char v20 = [(GuidanceSearchResultsViewModel *)self results];
            int v21 = 138412290;
            id v22 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SAR: Received only one result, will open placecard directly. Result: %@", (uint8_t *)&v21, 0xCu);
          }
          char v10 = [(GuidanceSearchResultsViewModel *)self mapItemDisplayer];
          [v10 displayMapItems:v6];
          goto LABEL_18;
        }
      }
      id v16 = sub_100109E50();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 134217984;
        id v22 = [v6 count];
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "SAR: showing %ld search results", (uint8_t *)&v21, 0xCu);
      }

      v17 = [(GuidanceSearchResultsViewModel *)self mapItemDisplayer];
      [v17 displayMapItems:v6];
    }
    else
    {
      id v18 = sub_100109E50();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 138412290;
        id v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "SAR: Empty results received: %@", (uint8_t *)&v21, 0xCu);
      }

      [(GuidanceSearchResultsViewModel *)self setResults:0];
    }
    id v9 = [(GuidanceSearchResultsViewModel *)self delegate];
    char v10 = v9;
    id v11 = self;
    id v12 = 0;
LABEL_17:
    [v9 viewModelDidFinishLoading:v11 error:v12];
LABEL_18:
  }
}

- (GuidanceSearchResultsViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GuidanceSearchResultsViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setHeaderImage:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (void)setPlaceSummaryMetadata:(id)a3
{
}

- (GuidanceSearchResultsDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (NavActionCoordination)navActionCoordinator
{
  return self->_navActionCoordinator;
}

- (NavigationRouteHistoryInfoProviding)routeInfoProvider
{
  return self->_routeInfoProvider;
}

- (NavigationMapItemDisplaying)mapItemDisplayer
{
  return self->_mapItemDisplayer;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemDisplayer, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_storeStrong((id *)&self->_navActionCoordinator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end