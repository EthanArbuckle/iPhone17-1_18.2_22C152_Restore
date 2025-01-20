@interface UGCARPPhotoCarouselController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UGCARPPhotoCarouselController)initWithDelegate:(id)a3 presentingViewController:(id)a4 maximumNumberOfPhotos:(unint64_t)a5 previouslySubmittedPhotosExist:(BOOL)a6 mapItemCoordinate:(CLLocationCoordinate2D)a7 showPhotoCarousel:(BOOL)a8;
- (double)lastContentOffset;
- (double)preferredCellHeight;
- (id)_buildSnapshotFromCurrentState;
- (id)_viewModelForIdentifier:(id)a3;
- (id)_viewModelForPhotoWithMetadata:(id)a3;
- (id)anchoringView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionViewBackgroundColor;
- (id)collectionViewButtonTitle;
- (id)collectionViewHeaderTitleForNumberOfSelectedPhotos:(unint64_t)a3;
- (id)configurePhotoCreditStringForCollectionViewHeader;
- (unint64_t)_numberOfSelectedPhotos;
- (void)_enableSelection:(BOOL)a3;
- (void)_handleAddFromSuggestionImage:(id)a3 atIndexPath:(id)a4;
- (void)_invokeChangeHandler;
- (void)_refreshCollectionViewWithAnimatingDifferences:(BOOL)a3;
- (void)_updateSelection;
- (void)addPhotoWithMetadata:(id)a3 forIdentifier:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)fetchPhotoCreditPreferences;
- (void)fetchSuggestedImageAssetsWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setLastContentOffset:(double)a3;
- (void)setupCollectionView:(id)a3;
- (void)setupSuggestedPhotosIfNeeded;
@end

@implementation UGCARPPhotoCarouselController

- (UGCARPPhotoCarouselController)initWithDelegate:(id)a3 presentingViewController:(id)a4 maximumNumberOfPhotos:(unint64_t)a5 previouslySubmittedPhotosExist:(BOOL)a6 mapItemCoordinate:(CLLocationCoordinate2D)a7 showPhotoCarousel:(BOOL)a8
{
  CLLocationDegrees longitude = a7.longitude;
  CLLocationDegrees latitude = a7.latitude;
  id v15 = a3;
  id v16 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UGCARPPhotoCarouselController;
  v17 = [(UGCARPPhotoCarouselController *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_addPhotosDelegate, v15);
    v18->_centerCoordinate.CLLocationDegrees latitude = latitude;
    v18->_centerCoordinate.CLLocationDegrees longitude = longitude;
    objc_storeWeak((id *)&v18->_presentingViewController, v16);
    v18->_previouslySubmittedPhotosExist = a6;
    v18->_showPhotoCarousel = a8;
    v18->_numberOfLoadingPhotos = 0;
    v18->_maximumNumberOfPhotos = a5;
    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    viewModels = v18->_viewModels;
    v18->_viewModels = v19;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.maps.ARPPhotoCarouselController.SuggestedPhotoFetch", v21);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = geo_dispatch_queue_create_with_qos();
    suggestedPhotosImageDownloadingQueue = v18->_suggestedPhotosImageDownloadingQueue;
    v18->_suggestedPhotosImageDownloadingQueue = (OS_dispatch_queue *)v24;

    [(UGCPhotoCarouselController *)v18 setPhotoSliderShouldEnablePagingScroll:1];
    if (v18->_showPhotoCarousel)
    {
      v26 = +[UGCPhotoAttributionPreferencesManager sharedManager];
      [v26 addObserver:v18];
    }
    v18->_allowSelection = 1;
  }

  return v18;
}

- (void)dealloc
{
  v3 = +[UGCPhotoAttributionPreferencesManager sharedManager];
  [v3 removeObserver:self];

  [(PHCachingImageManager *)self->_imageManager stopCachingImagesForAllAssets];
  v4.receiver = self;
  v4.super_class = (Class)UGCARPPhotoCarouselController;
  [(UGCPhotoCarouselController *)&v4 dealloc];
}

- (unint64_t)_numberOfSelectedPhotos
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addPhotosDelegate);
  objc_super v4 = (char *)[WeakRetained numberOfSelectedPhotosForAddPhotosController:self]
     + self->_numberOfLoadingPhotos;

  return (unint64_t)v4;
}

- (void)setupSuggestedPhotosIfNeeded
{
  if (self->_showPhotoCarousel)
  {
    objc_initWeak(&location, self);
    id v3 = &_dispatch_main_q;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10093F3E4;
    v4[3] = &unk_1012E9BD0;
    objc_copyWeak(&v5, &location);
    [(UGCARPPhotoCarouselController *)self fetchSuggestedImageAssetsWithCallbackQueue:&_dispatch_main_q completion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)fetchSuggestedImageAssetsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (PHCachingImageManager *)objc_alloc_init((Class)PHCachingImageManager);
  imageManager = self->_imageManager;
  self->_imageManager = v8;

  [(PHCachingImageManager *)self->_imageManager setAllowsCachingHighQualityImages:0];
  v10 = +[PHPhotoLibrary sharedPhotoLibrary];
  library = self->_library;
  self->_library = v10;

  id v12 = objc_alloc_init((Class)PHFetchOptions);
  v13 = +[NSDate now];
  v14 = +[NSPredicate predicateWithFormat:@"creationDate <= %@", v13];
  [v12 setPredicate:v14];

  [v12 setFetchLimit:GEOConfigGetUInteger()];
  id v15 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:0];
  id v25 = v15;
  id v16 = +[NSArray arrayWithObjects:&v25 count:1];
  [v12 setSortDescriptors:v16];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10093F6EC;
  block[3] = &unk_1012ED778;
  block[4] = self;
  id v22 = v12;
  id v23 = v6;
  id v24 = v7;
  id v18 = v7;
  id v19 = v6;
  id v20 = v12;
  dispatch_async(serialQueue, block);
}

- (void)setupCollectionView:(id)a3
{
  id obj = a3;
  id v4 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v4 setScrollDirection:1];
  [v4 setMinimumInteritemSpacing:8.0];
  [v4 setSectionInset:0.0, 16.0, 0.0, 16.0];
  [obj setCollectionViewLayout:v4];
  uint64_t v5 = objc_opt_class();
  id v6 = +[UGCPhotoThumbnailCollectionViewCell reuseIdentifier];
  [obj registerClass:v5 forCellWithReuseIdentifier:v6];

  [obj setDelegate:self];
  [obj setScrollEnabled:1];
  objc_storeWeak((id *)&self->_collectionView, obj);
  diffableDataSource = self->_diffableDataSource;
  if (!diffableDataSource)
  {
    id v8 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v9 = sub_10001CBB8(self);
    v10 = (UICollectionViewDiffableDataSource *)[v8 initWithCollectionView:obj cellProvider:v9];
    v11 = self->_diffableDataSource;
    self->_diffableDataSource = v10;

    diffableDataSource = self->_diffableDataSource;
  }
  id v12 = sub_1005B38D0(self);
  [(UICollectionViewDiffableDataSource *)diffableDataSource setSupplementaryViewProvider:v12];

  v13 = [(UGCARPPhotoCarouselController *)self _buildSnapshotFromCurrentState];
  [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v13 animatingDifferences:0];
  if (!MapsFeature_IsEnabled_ARPCommunityID() || !GEOConfigGetBOOL())
  {
    if (self->_previouslySubmittedPhotosExist) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!self->_previouslySubmittedPhotosExist && MKGetHasUserConsentedToAddingContributions() == 1) {
LABEL_9:
  }
    [(UGCARPPhotoCarouselController *)self setupSuggestedPhotosIfNeeded];
LABEL_10:
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[UGCPhotoThumbnailCollectionViewCell reuseIdentifier];
  id v12 = [v10 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

  v13 = [(UGCARPPhotoCarouselController *)self _viewModelForIdentifier:v8];

  [v12 _setContinuousCornerRadius:4.0];
  [v12 setClipsToBounds:1];
  v14 = [v13 _maps_diffableDataSourceIdentifier];
  [v12 setIdentifier:v14];

  [v12 setViewModel:v13];
  id v15 = [v12 traitCollection];
  [v15 displayScale];
  uint64_t v17 = v16;

  suggestedPhotosImageDownloadingQueue = self->_suggestedPhotosImageDownloadingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10093FE4C;
  block[3] = &unk_1012EA9E0;
  id v25 = v13;
  uint64_t v27 = v17;
  id v19 = v12;
  id v26 = v19;
  id v20 = v13;
  dispatch_async(suggestedPhotosImageDownloadingQueue, block);
  v21 = v26;
  id v22 = v19;

  return v22;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v5 = -[self->_viewModels objectAtIndexedSubscript:[a5 row:a3, a4]];
  [v5 imageSizeForCell];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 cellForItemAtIndexPath:v7];
  double v9 = [v8 identifier];
  double v10 = [(UGCARPPhotoCarouselController *)self _viewModelForIdentifier:v9];

  if ([v10 enabled])
  {
    if ([v10 checked])
    {
      [v10 setChecked:0];
      [v10 setIsLoading:0];
      [v8 setViewModel:v10];
      objc_initWeak(&location, self);
      double v11 = [(UGCPhotoCarouselController *)self delegate];
      id v12 = [v10 photoWithMetadata];
      v13 = [v12 photoMetadata];
      v14 = [v13 clientImageUuid];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10094035C;
      v32[3] = &unk_1012E5D30;
      objc_copyWeak(&v34, &location);
      id v33 = v10;
      [v11 photoCarouselController:self requestsRemovingImageForIdentifier:v14 completion:v32];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else if (([v10 checked] & 1) == 0)
    {
      if ([(UGCARPPhotoCarouselController *)self _numberOfSelectedPhotos] >= self->_maximumNumberOfPhotos) {
        goto LABEL_9;
      }
      id v15 = [v10 _maps_diffableDataSourceIdentifier];
      [v8 setIdentifier:v15];

      [v10 setChecked:1];
      [v10 setIsLoading:1];
      [v8 setViewModel:v10];
      ++self->_numberOfLoadingPhotos;
      [(UGCARPPhotoCarouselController *)self _updateSelection];
      uint64_t v16 = [v8 traitCollection];
      [v16 displayScale];
      uint64_t v18 = v17;

      suggestedPhotosImageDownloadingQueue = self->_suggestedPhotosImageDownloadingQueue;
      id v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      id v25 = sub_1009403F0;
      id v26 = &unk_1012EAB70;
      uint64_t v27 = self;
      id v28 = v10;
      uint64_t v31 = v18;
      id v29 = v8;
      id v30 = v7;
      dispatch_async(suggestedPhotosImageDownloadingQueue, &v23);
    }
    id v20 = [(UGCPhotoCarouselController *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [(UGCPhotoCarouselController *)self delegate];
      [v22 photoCarouselControllerDidToggleImage:self];
    }
  }
LABEL_9:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [a3 contentOffset];

  -[UGCARPPhotoCarouselController setLastContentOffset:](self, "setLastContentOffset:");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  [(UGCARPPhotoCarouselController *)self lastContentOffset];
  if (v6 - a5->x <= 0.0) {
    uint64_t v7 = 325;
  }
  else {
    uint64_t v7 = 333;
  }

  +[GEOAPPortal captureUserAction:v7 target:666 value:0];
}

- (id)configurePhotoCreditStringForCollectionViewHeader
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"[UGC Contribution Card] Add Photo Credit" value:@"localized string not found" table:0];

  photoCreditName = self->_photoCreditName;
  if (photoCreditName && self->_isPhotoCreditOn)
  {
    double v6 = photoCreditName;
  }
  else
  {
    uint64_t v7 = +[NSBundle mainBundle];
    double v6 = [v7 localizedStringForKey:@"[UGC Contribution Card] Off" value:@"localized string not found" table:0];
  }
  double v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"[UGC Contribution Card] Photo Credit: (Name)" value:@"localized string not found" table:0];
  double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6);

  if (self->_photoCreditNotSetupYet) {
    double v11 = v4;
  }
  else {
    double v11 = v10;
  }
  id v12 = v11;

  return v12;
}

- (id)collectionViewHeaderTitleForNumberOfSelectedPhotos:(unint64_t)a3
{
  if (a3)
  {
    id v4 = +[NSBundle mainBundle];
    uint64_t v5 = [v4 localizedStringForKey:@"[UGC Contribution Card] # of Photos Selected photo carousel header" value:@"localized string not found" table:0];
    double v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3);
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    double v6 = [v4 localizedStringForKey:@"[UGC Contribution Card] Add Your Photos collection view header" value:@"localized string not found" table:0];
  }

  return v6;
}

- (id)collectionViewButtonTitle
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[UGC Contribution Card] More" value:@"localized string not found" table:0];

  return v3;
}

- (void)fetchPhotoCreditPreferences
{
  if (self->_showPhotoCarousel)
  {
    objc_initWeak(&location, self);
    id v3 = +[UGCPhotoAttributionPreferencesManager sharedManager];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100940DE0;
    v4[3] = &unk_1012EE6B8;
    objc_copyWeak(&v5, &location);
    void v4[4] = self;
    [v3 photoAttributionPreferencesWithCompletion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (id)anchoringView
{
  headerView = self->_headerView;
  if (headerView)
  {
    id v3 = headerView;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _headerView != ((void *)0)", v5, 2u);
  }

  return headerView;
}

- (double)preferredCellHeight
{
  +[UGCARPPhotoCarouselViewModel preferredCellHeight];
  return result;
}

- (id)collectionViewBackgroundColor
{
  return +[MapsTheme ugcPOIEnrichmentEditorBackgroundColor];
}

- (void)_handleAddFromSuggestionImage:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  [v8 addObject:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_addPhotosDelegate);
  id v7 = [v8 copy];
  [WeakRetained suggestedPhotoController:self didSelectPhotosWithMetadata:v7];
}

- (void)_invokeChangeHandler
{
  id v3 = [(UGCPhotoCarouselController *)self changeHandler];

  if (v3)
  {
    id v4 = [(UGCPhotoCarouselController *)self changeHandler];
    v4[2]();
  }
}

- (void)_updateSelection
{
  if ([(UGCARPPhotoCarouselController *)self _numberOfSelectedPhotos] >= self->_maximumNumberOfPhotos
    || self->_allowSelection)
  {
    if ([(UGCARPPhotoCarouselController *)self _numberOfSelectedPhotos] < self->_maximumNumberOfPhotos
      || !self->_allowSelection)
    {
      return;
    }
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }

  [(UGCARPPhotoCarouselController *)self _enableSelection:v3];
}

- (void)_enableSelection:(BOOL)a3
{
  if (self->_allowSelection != a3)
  {
    self->_allowSelection = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_viewModels;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (self->_allowSelection) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = (uint64_t)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "checked", (void)v11);
          }
          [v9 setEnabled:v10, v11];
        }
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(UGCARPPhotoCarouselController *)self _refreshCollectionViewWithAnimatingDifferences:1];
  }
}

- (id)_buildSnapshotFromCurrentState
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  CFStringRef v19 = @"DefaultCarouselSection";
  id v4 = +[NSArray arrayWithObjects:&v19 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_viewModels;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _maps_diffableDataSourceIdentifier:v14];
        [v5 addObject:v11];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];
  [v3 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:@"DefaultCarouselSection"];

  return v3;
}

- (void)_refreshCollectionViewWithAnimatingDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UGCARPPhotoCarouselController *)self _buildSnapshotFromCurrentState];
  [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v5 animatingDifferences:v3];
  [(UGCARPPhotoCarouselController *)self _invokeChangeHandler];
}

- (id)_viewModelForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_viewModels;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 _maps_diffableDataSourceIdentifier:v13];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_viewModelForPhotoWithMetadata:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_viewModels;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 photoWithMetadata:v13];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addPhotoWithMetadata:(id)a3 forIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!self->_photoCreditFetchStatus)
  {
    self->_photoCreditFetchStatus = 1;
    [(UGCARPPhotoCarouselController *)self fetchPhotoCreditPreferences];
  }
  uint64_t v7 = [(UGCARPPhotoCarouselController *)self _viewModelForPhotoWithMetadata:v8];
  if (!v7)
  {
    uint64_t v7 = [[UGCARPPhotoCarouselViewModel alloc] initWithImageManager:self->_imageManager];
    [(UGCARPPhotoCarouselViewModel *)v7 setPhotoWithMetadata:v8];
    [(UGCARPPhotoCarouselViewModel *)v7 setIdentifier:v6];
    [(UGCARPPhotoCarouselViewModel *)v7 setChecked:1];
    [(NSMutableArray *)self->_viewModels insertObject:v7 atIndex:0];
  }
  [(UGCARPPhotoCarouselController *)self _updateSelection];
  [(UGCARPPhotoCarouselController *)self _refreshCollectionViewWithAnimatingDifferences:1];
}

- (double)lastContentOffset
{
  return self->_lastContentOffset;
}

- (void)setLastContentOffset:(double)a3
{
  self->_lastContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPhotosImageDownloadingQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_photoCreditName, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_addPhotosDelegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_destroyWeak((id *)&self->_collectionView);
}

@end