@interface UGCPhotoViewerDataSource
- (BOOL)hasDataToShow;
- (BOOL)hasReachedTotalCount;
- (BOOL)isActive;
- (BOOL)isAllowedToShowAddPhotosCallToAction;
- (BOOL)isSingleVendorThatHasPhotosNeedingObfuscation;
- (NSArray)albumCategories;
- (NSArray)currentPhotoList;
- (NSArray)currentVendorNameList;
- (UGCPhotoAlbumCategory)currentAlbumCategory;
- (UGCPhotoViewerDataProvider)currentDataProvider;
- (UGCPhotoViewerDataSource)initWithMapItem:(id)a3 delegate:(id)a4;
- (id)_dataProviderForAlbumIndex:(unint64_t)a3;
- (id)photoViewerDataProviderRequestsMapItem:(id)a3;
- (unint64_t)albumIndex;
- (unint64_t)indexOfTappedPhoto;
- (unint64_t)numberOfCategories;
- (unint64_t)totalNumberOfPhotosForCurrentDataProvider;
- (void)_createDataSourceIfNeeded;
- (void)_initComingledVendorPhotos;
- (void)_initSingleVendorPhotos;
- (void)fetchNextBatchRequestIfNeeded;
- (void)photoViewerDataProvider:(id)a3 didUpdateWithPhotos:(id)a4;
- (void)photoViewerDataProvider:(id)a3 failedBatchRequestWithError:(id)a4 range:(_NSRange)a5;
- (void)setActive:(BOOL)a3;
- (void)setAlbumIndex:(unint64_t)a3;
- (void)setIndexOfTappedPhoto:(unint64_t)a3;
@end

@implementation UGCPhotoViewerDataSource

- (UGCPhotoViewerDataSource)initWithMapItem:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCPhotoViewerDataSource;
  v9 = [(UGCPhotoViewerDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    v10->_albumIndex = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(UGCPhotoViewerDataSource *)self _createDataSourceIfNeeded];
    }
  }
}

- (void)_createDataSourceIfNeeded
{
  if (!self->_dataProviders)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dataProviders = self->_dataProviders;
    self->_dataProviders = v3;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = [WeakRetained userUploadDataProviderForDataSource:self];

    if (v12)
    {
      if ([v12 hasUserUploadedImages])
      {
        v6 = [[UGCUserUploadedPhotoDataProvider alloc] initWithLookupResult:v12 delegate:self];
        userUploadDataProvider = self->_userUploadDataProvider;
        self->_userUploadDataProvider = (UGCPhotoViewerDataProviding *)v6;

        if (self->_userUploadDataProvider) {
          -[NSMutableArray addObject:](self->_dataProviders, "addObject:");
        }
      }
    }
    if ([(MKMapItem *)self->_mapItem _mapkit_supportsFullScreenExperience])
    {
      id v8 = [(MKMapItem *)self->_mapItem _geoMapItem];
      unsigned int v9 = [v8 _hasCaptionedPhotoAlbum];

      if (v9) {
        [(UGCPhotoViewerDataSource *)self _initComingledVendorPhotos];
      }
      else {
        [(UGCPhotoViewerDataSource *)self _initSingleVendorPhotos];
      }
    }
    unint64_t indexOfTappedPhoto = self->_indexOfTappedPhoto;
    v11 = [(NSMutableArray *)self->_dataProviders firstObject];
    [v11 setIndexOfTappedPhoto:indexOfTappedPhoto];
  }
}

- (UGCPhotoAlbumCategory)currentAlbumCategory
{
  v2 = [(UGCPhotoViewerDataSource *)self _dataProviderForAlbumIndex:[(UGCPhotoViewerDataSource *)self albumIndex]];
  v3 = [v2 albumCategory];

  return (UGCPhotoAlbumCategory *)v3;
}

- (NSArray)albumCategories
{
  return (NSArray *)sub_100099700(self->_dataProviders, &stru_1013030C0);
}

- (id)_dataProviderForAlbumIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_dataProviders count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_dataProviders objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)_initComingledVendorPhotos
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v4 = [v3 _captionedPhotoAlbums];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v8);
        v10 = [UGCPhotoViewerComingledBatchRequester alloc];
        mapItem = self->_mapItem;
        id v12 = [v9 categoryId];
        v13 = [(UGCPhotoViewerComingledBatchRequester *)v10 initWithMapItem:mapItem categoryId:v12];

        v14 = [v9 categoryName];
        id v15 = [v14 length];

        v16 = [UGCPhotoAlbumCategory alloc];
        if (v15)
        {
          v17 = [v9 categoryName];
          v18 = [(UGCPhotoAlbumCategory *)v16 initWithTitle:v17 categoryType:1];
        }
        else
        {
          v17 = +[NSBundle mainBundle];
          v19 = [v17 localizedStringForKey:@"Other [More Photos]" value:@"localized string not found" table:0];
          v18 = [(UGCPhotoAlbumCategory *)v16 initWithTitle:v19 categoryType:0];
        }
        if ([v9 totalNumberOfPhotosAvailable])
        {
          v20 = [UGCPlaceDataPhotoListDataProvider alloc];
          uint64_t UInteger = GEOConfigGetUInteger();
          id v22 = -[UGCPlaceDataPhotoListDataProvider initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:](v20, "initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:", v13, UInteger, GEOConfigGetUInteger(), [v9 totalNumberOfPhotosAvailable], v18, self);
          [(NSMutableArray *)self->_dataProviders addObject:v22];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)_initSingleVendorPhotos
{
  v3 = [(MKMapItem *)self->_mapItem _mapkit_resolvedFlatPhotoList];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [UGCPhotoAlbumCategory alloc];
    id v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Other [More Photos]" value:@"localized string not found" table:0];
    v14 = [(UGCPhotoAlbumCategory *)v5 initWithTitle:v7 categoryType:0];

    id v8 = [[UGCPhotoViewerBatchRequester alloc] initWithMapItem:self->_mapItem];
    unsigned int v9 = [UGCPlaceDataPhotoListDataProvider alloc];
    uint64_t UInteger = GEOConfigGetUInteger();
    uint64_t v11 = GEOConfigGetUInteger();
    id v12 = [(MKMapItem *)self->_mapItem _geoMapItem];
    id v13 = -[UGCPlaceDataPhotoListDataProvider initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:](v9, "initWitBatchRequester:initialCount:batchCount:totalCount:albumCategory:delegate:", v8, UInteger, v11, [v12 _totalPhotoCount], v14, self);

    [(NSMutableArray *)self->_dataProviders addObject:v13];
  }
}

- (unint64_t)numberOfCategories
{
  return (unint64_t)[(NSMutableArray *)self->_dataProviders count];
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  if (self->_indexOfTappedPhoto != a3)
  {
    self->_unint64_t indexOfTappedPhoto = a3;
    id v4 = [(NSMutableArray *)self->_dataProviders firstObject];
    [v4 setIndexOfTappedPhoto:a3];
  }
}

- (BOOL)hasReachedTotalCount
{
  v2 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  unsigned __int8 v3 = [v2 hasReachedTotalCount];

  return v3;
}

- (void)fetchNextBatchRequestIfNeeded
{
  if ([(UGCPhotoViewerDataSource *)self isActive])
  {
    id v4 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
    [v4 fetchNextBatchRequestIfNeeded];
  }
  else
  {
    unsigned __int8 v3 = sub_1005778DC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Trying to fetch the next request while it is not active", buf, 2u);
    }
  }
}

- (NSArray)currentPhotoList
{
  v2 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  unsigned __int8 v3 = [v2 photoList];

  return (NSArray *)v3;
}

- (NSArray)currentVendorNameList
{
  v2 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  unsigned __int8 v3 = [v2 attributionNames];

  return (NSArray *)v3;
}

- (UGCPhotoViewerDataProvider)currentDataProvider
{
  unint64_t albumIndex = self->_albumIndex;
  if (albumIndex >= (unint64_t)[(NSMutableArray *)self->_dataProviders count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_dataProviders objectAtIndexedSubscript:self->_albumIndex];
  }

  return (UGCPhotoViewerDataProvider *)v4;
}

- (void)photoViewerDataProvider:(id)a3 didUpdateWithPhotos:(id)a4
{
  id v5 = a3;
  id v6 = [(UGCPhotoViewerDataSource *)self currentDataProvider];

  if (v6 == v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained photoViewerDataSourceDidUpdate:self];
  }
}

- (void)photoViewerDataProvider:(id)a3 failedBatchRequestWithError:(id)a4 range:(_NSRange)a5
{
  id v10 = a4;
  id v7 = a3;
  id v8 = [(UGCPhotoViewerDataSource *)self currentDataProvider];

  if (v8 == v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained photoViewerDataSourceDidUpdate:self withError:v10];
  }
}

- (id)photoViewerDataProviderRequestsMapItem:(id)a3
{
  return self->_mapItem;
}

- (BOOL)hasDataToShow
{
  v2 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  unsigned __int8 v3 = [v2 hasDataToShow];

  return v3;
}

- (BOOL)isAllowedToShowAddPhotosCallToAction
{
  unsigned __int8 v3 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  unsigned int v4 = [v3 isAllowedToShowAddPhotoCallToAction];

  if (!v4) {
    return 0;
  }
  mapItem = self->_mapItem;

  return +[MKPOIEnrichmentAvailibility shouldShowPhotosCallToActionForMapItem:mapItem];
}

- (BOOL)isSingleVendorThatHasPhotosNeedingObfuscation
{
  unsigned __int8 v3 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  unsigned int v4 = [v3 hasPhotosThatShouldBeObfuscatedWhenInFullScreen];

  if (!v4) {
    return 0;
  }
  id v5 = [(MKMapItem *)self->_mapItem _allPhotoAttributions];
  BOOL v6 = [v5 count] == (id)1;

  return v6;
}

- (unint64_t)totalNumberOfPhotosForCurrentDataProvider
{
  v2 = [(UGCPhotoViewerDataSource *)self currentDataProvider];
  id v3 = [v2 totalNumberOfPhotos];

  return (unint64_t)v3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)albumIndex
{
  return self->_albumIndex;
}

- (void)setAlbumIndex:(unint64_t)a3
{
  self->_unint64_t albumIndex = a3;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->_indexOfTappedPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUploadDataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataProviders, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end