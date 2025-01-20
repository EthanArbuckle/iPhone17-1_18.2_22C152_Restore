@interface GuidanceSearchResultsCategoryDataProvider
- (GEOCategorySearchResultSection)categorySearchResultSection;
- (GEOFeatureStyleAttributes)styleAttributes;
- (GuidanceSearchResultsCategoryDataProvider)initWithSearchItem:(id)a3 mapService:(id)a4 chromeViewController:(id)a5;
- (IOSBasedChromeViewController)chromeViewController;
- (MKMapService)mapService;
- (MKMapServiceTicket)searchTicket;
- (NSString)subtitle;
- (NSString)title;
- (OS_dispatch_queue)workerQueue;
- (SearchFieldItem)searchItem;
- (void)_handleResponseForTicket:(id)a3 mapItems:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_submitTicket:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)loadSearchResultsWithRouteInfo:(id)a3 completion:(id)a4;
- (void)setCategorySearchResultSection:(id)a3;
- (void)setSearchTicket:(id)a3;
@end

@implementation GuidanceSearchResultsCategoryDataProvider

- (GuidanceSearchResultsCategoryDataProvider)initWithSearchItem:(id)a3 mapService:(id)a4 chromeViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GuidanceSearchResultsCategoryDataProvider;
  v12 = [(GuidanceSearchResultsCategoryDataProvider *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchItem, a3);
    objc_storeStrong((id *)&v13->_mapService, a4);
    objc_storeStrong((id *)&v13->_chromeViewController, a5);
    dispatch_queue_t v14 = dispatch_queue_create("GuidanceSearchResultsCategoryDataProvider.workerQueue", 0);
    workerQueue = v13->_workerQueue;
    v13->_workerQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

- (void)dealloc
{
  [(MKMapServiceTicket *)self->_searchTicket cancel];
  v3.receiver = self;
  v3.super_class = (Class)GuidanceSearchResultsCategoryDataProvider;
  [(GuidanceSearchResultsCategoryDataProvider *)&v3 dealloc];
}

- (void)_submitTicket:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(GuidanceSearchResultsCategoryDataProvider *)self searchTicket];
  [v8 cancel];

  [(GuidanceSearchResultsCategoryDataProvider *)self setSearchTicket:v6];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10067CB18;
  v11[3] = &unk_1012F3F70;
  v11[4] = self;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v9 submitWithHandler:v11 networkActivity:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleResponseForTicket:(id)a3 mapItems:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(GuidanceSearchResultsCategoryDataProvider *)self searchTicket];

  if (v14 == v13)
  {
    v15 = [(GuidanceSearchResultsCategoryDataProvider *)self searchTicket];
    v16 = [v15 categorySearchResultSection];
    [(GuidanceSearchResultsCategoryDataProvider *)self setCategorySearchResultSection:v16];

    [(GuidanceSearchResultsCategoryDataProvider *)self setSearchTicket:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10067CDD8;
    block[3] = &unk_1012EF330;
    id v20 = v12;
    id v18 = v10;
    id v19 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSString)title
{
  v2 = [(GuidanceSearchResultsCategoryDataProvider *)self searchItem];
  objc_super v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)subtitle
{
  v2 = [(GuidanceSearchResultsCategoryDataProvider *)self categorySearchResultSection];
  objc_super v3 = [v2 subHeaderDisplayName];

  return (NSString *)v3;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  v2 = [(GuidanceSearchResultsCategoryDataProvider *)self searchItem];
  objc_super v3 = [v2 searchCategory];
  v4 = [v3 styleAttributes];

  return (GEOFeatureStyleAttributes *)v4;
}

- (void)loadSearchResultsWithRouteInfo:(id)a3 completion:(id)a4
{
  id v27 = a4;
  id v6 = a3;
  id v7 = [(GuidanceSearchResultsCategoryDataProvider *)self chromeViewController];
  v8 = [v7 currentTraits];

  [v8 setNavigating:1];
  id v9 = +[MNNavigationService sharedService];
  v28 = v9;
  if ([v9 isInNavigatingState]) {
    id v10 = [v9 navigationTransportType];
  }
  else {
    id v10 = [v9 desiredTransportType];
  }
  [v8 setNavigationTransportType:v10];
  id v11 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  v26 = [v11 updatedTraitsForCurrentGarageState:v8];

  id v12 = [(GuidanceSearchResultsCategoryDataProvider *)self mapService];
  id v13 = [(GuidanceSearchResultsCategoryDataProvider *)self searchItem];
  id v14 = [v13 searchCategory];
  v15 = [v6 originalWaypointRouteRepresentation];
  v16 = [v6 legacyRouteRepresentation];
  [v6 sessionState];
  objc_super v17 = v25 = self;
  id v18 = [v6 routeId];
  id v19 = [v6 routeAttributes];

  LODWORD(v24) = 10;
  id v20 = [v12 ticketForSearchAlongRouteWithCategory:v14 searchQuery:0 completionItem:0 originalWaypointRouteData:v15 zilchData:v16 sessionState:v17 routeId:v18 routeAttributes:v19 maxResults:v24 traits:v26 searchSessionData:0];

  v21 = [(GuidanceSearchResultsCategoryDataProvider *)v25 workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10067D16C;
  block[3] = &unk_1012E80F0;
  void block[4] = v25;
  id v30 = v20;
  id v31 = v27;
  id v22 = v27;
  id v23 = v20;
  dispatch_async(v21, block);
}

- (SearchFieldItem)searchItem
{
  return self->_searchItem;
}

- (MKMapService)mapService
{
  return self->_mapService;
}

- (IOSBasedChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (MKMapServiceTicket)searchTicket
{
  return self->_searchTicket;
}

- (void)setSearchTicket:(id)a3
{
}

- (GEOCategorySearchResultSection)categorySearchResultSection
{
  return self->_categorySearchResultSection;
}

- (void)setCategorySearchResultSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySearchResultSection, 0);
  objc_storeStrong((id *)&self->_searchTicket, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->_mapService, 0);

  objc_storeStrong((id *)&self->_searchItem, 0);
}

@end