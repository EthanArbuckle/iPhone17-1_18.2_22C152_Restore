@interface VenueCategoryContentDownloader
- (BOOL)currentSearchShouldFrameMapViewport;
- (GEOSearchCategory)searchCategory;
- (MKMapItem)mapItem;
- (VenueCategoryContentDownloader)initWithDelegate:(id)a3 venueAutoCompleteCategoryCardItem:(id)a4;
- (VenueCategoryContentDownloader)initWithDelegate:(id)a3 venueCategoryCardItem:(id)a4;
- (VenueCategoryContentDownloaderDelegate)delegate;
- (void)fetchVenueMapItemWithBusinessID:(unint64_t)a3 completion:(id)a4;
- (void)performSearchWithSearchCategory:(id)a3 subcategoriesType:(int)a4 filter:(id)a5 shouldFrameMapViewport:(BOOL)a6 actionCoordination:(id)a7;
- (void)performSearchWithVenueCategoryItem:(id)a3 actionCoordination:(id)a4;
- (void)searchDidCancel;
- (void)searchDidFail;
- (void)searchDidReceiveAutoCompleteSubcategories:(id)a3;
- (void)searchDidReceiveEVChargerUpdates:(id)a3;
- (void)searchDidReceiveResults:(id)a3;
- (void)searchWillStart;
- (void)setCurrentSearchShouldFrameMapViewport:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setSearchCategory:(id)a3;
@end

@implementation VenueCategoryContentDownloader

- (VenueCategoryContentDownloader)initWithDelegate:(id)a3 venueCategoryCardItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VenueCategoryContentDownloader;
  v8 = [(VenueCategoryContentDownloader *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 venueMapItem];
    mapItem = v9->_mapItem;
    v9->_mapItem = (MKMapItem *)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
    [WeakRetained venueCategoryContentDownloader:v9 didChangeMapItem:v9->_mapItem];
  }
  return v9;
}

- (VenueCategoryContentDownloader)initWithDelegate:(id)a3 venueAutoCompleteCategoryCardItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VenueCategoryContentDownloader;
  v8 = [(VenueCategoryContentDownloader *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 venueIdentifier];
    id v11 = [v10 businessID];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10074EAA4;
    v13[3] = &unk_1012E8738;
    objc_super v14 = v9;
    [(VenueCategoryContentDownloader *)v14 fetchVenueMapItemWithBusinessID:v11 completion:v13];
  }
  return v9;
}

- (void)fetchVenueMapItemWithBusinessID:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)MKMapItemIdentifier);
  id v7 = [v6 initWithMUID:a3 resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];
  if (v7)
  {
    v8 = +[MKMapService sharedService];
    id v13 = v7;
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
    uint64_t v10 = [v8 ticketForIdentifiers:v9 traits:0];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10074ECB4;
    v11[3] = &unk_1012E7710;
    id v12 = v5;
    [v10 submitWithHandler:v11 networkActivity:0];
  }
}

- (void)performSearchWithSearchCategory:(id)a3 subcategoriesType:(int)a4 filter:(id)a5 shouldFrameMapViewport:(BOOL)a6 actionCoordination:(id)a7
{
  BOOL v8 = a6;
  id v23 = a3;
  id v12 = a5;
  id v13 = a7;
  objc_super v14 = [(VenueCategoryContentDownloader *)self mapItem];

  if (v14)
  {
    [(VenueCategoryContentDownloader *)self setCurrentSearchShouldFrameMapViewport:v8];
    objc_super v15 = [(VenueCategoryContentDownloader *)self mapItem];
    v16 = [v15 _venueInfo];
    v17 = [v16 venueIdentifier];

    if (a4 == 2)
    {
      uint64_t v18 = [v12 filterID];
      v19 = (void *)v18;
      if (v18) {
        v20 = (void *)v18;
      }
      else {
        v20 = v17;
      }
      id v21 = v20;

      v17 = v21;
    }
    v22 = -[VenueCategoryItem initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:]([VenueCategoryItem alloc], "initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:", v23, v17, [v23 displayMode], 0, -[VenueCategoryContentDownloader currentSearchShouldFrameMapViewport](self, "currentSearchShouldFrameMapViewport"));
    [(VenueCategoryContentDownloader *)self performSearchWithVenueCategoryItem:v22 actionCoordination:v13];
  }
}

- (void)performSearchWithVenueCategoryItem:(id)a3 actionCoordination:(id)a4
{
  id v6 = a4;
  id v10 = +[SearchFieldItem searchFieldItemWithObject:a3];
  id v7 = [(VenueCategoryContentDownloader *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = v8;

  [v6 viewController:v9 doSearchItem:v10 withUserInfo:0];
}

- (void)searchWillStart
{
  id v3 = [(VenueCategoryContentDownloader *)self delegate];
  [v3 venueCategoryContentDownloaderDidStart:self];
}

- (void)searchDidFail
{
  id v3 = [(VenueCategoryContentDownloader *)self delegate];
  [v3 venueCategoryContentDownloaderDidFail:self];
}

- (void)searchDidCancel
{
  id v3 = [(VenueCategoryContentDownloader *)self delegate];
  [v3 venueCategoryContentDownloaderDidCancel:self];
}

- (void)searchDidReceiveEVChargerUpdates:(id)a3
{
  id v7 = a3;
  v4 = [(VenueCategoryContentDownloader *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VenueCategoryContentDownloader *)self delegate];
    [v6 venueDidReceiveEVChargerUpdates:v7];
  }
}

- (void)searchDidReceiveResults:(id)a3
{
  id v4 = a3;
  id v5 = [(VenueCategoryContentDownloader *)self delegate];
  [v5 venueCategoryContentDownloader:self didReceiveSearchResults:v4 shouldSwitchToBestFloor:[self currentSearchShouldFrameMapViewport]];
}

- (void)searchDidReceiveAutoCompleteSubcategories:(id)a3
{
  id v6 = [a3 firstObject];
  id v4 = [(VenueCategoryContentDownloader *)self delegate];
  id v5 = [v6 subcategories];
  [v4 venueCategoryContentDownloader:self didReceiveAutoCompleteSubcategories:v5 subcategoriesType:[v6 subCategoryType]];
}

- (VenueCategoryContentDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VenueCategoryContentDownloaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
}

- (BOOL)currentSearchShouldFrameMapViewport
{
  return self->_currentSearchShouldFrameMapViewport;
}

- (void)setCurrentSearchShouldFrameMapViewport:(BOOL)a3
{
  self->_currentSearchShouldFrameMapViewport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end