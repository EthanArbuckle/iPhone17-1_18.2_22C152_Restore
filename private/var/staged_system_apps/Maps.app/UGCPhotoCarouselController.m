@interface UGCPhotoCarouselController
- (BOOL)photoSliderShouldEnablePagingScroll;
- (NSString)downloadToken;
- (UGCPhotoCarouselController)initWithDelegate:(id)a3 maximumNumberOfPhotos:(unint64_t)a4;
- (UGCPhotoCarouselController)initWithDelegate:(id)a3 maximumNumberOfPhotos:(unint64_t)a4 prefersMenu:(BOOL)a5;
- (UGCPhotoCarouselRequestDelegate)delegate;
- (UIBarButtonItem)anchoringBarButtonItem;
- (UIColor)cellBackgroundColor;
- (UIColor)collectionViewBackgroundColor;
- (UIView)anchoringView;
- (UIViewController)presentingViewController;
- (double)preferredCellHeight;
- (id)_buildSnapshotFromCurrentState;
- (id)_viewModelForIdentifier:(id)a3;
- (id)changeHandler;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)visibleImageViewForIdentifier:(id)a3;
- (unint64_t)maximumNumberOfPhotos;
- (unint64_t)totalNumberOfItems;
- (void)_addViewModel:(id)a3;
- (void)_cellRequestsRemoveImageForIdentifier:(id)a3;
- (void)_invokeChangeHandler;
- (void)_removeImageForIdentifier:(id)a3;
- (void)_updateAddButtonState;
- (void)addImage:(id)a3 forIdentifier:(id)a4;
- (void)addImageURL:(id)a3 forIdentifier:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)photoCellDidCancel:(id)a3;
- (void)photoOptionsMenuButtonDidSelectAddFromLibrary;
- (void)photoOptionsMenuButtonDidSelectTakePhoto;
- (void)setCellBackgroundColor:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfPhotos:(unint64_t)a3;
- (void)setPhotoSliderShouldEnablePagingScroll:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation UGCPhotoCarouselController

- (NSString)downloadToken
{
  downloadToken = self->_downloadToken;
  if (!downloadToken)
  {
    v4 = +[UGCPhotoDownloadManager generateRandomizedDownloadTokenForClass:objc_opt_class()];
    v5 = self->_downloadToken;
    self->_downloadToken = v4;

    downloadToken = self->_downloadToken;
  }

  return downloadToken;
}

- (UGCPhotoCarouselController)initWithDelegate:(id)a3 maximumNumberOfPhotos:(unint64_t)a4
{
  return [(UGCPhotoCarouselController *)self initWithDelegate:a3 maximumNumberOfPhotos:a4 prefersMenu:0];
}

- (UGCPhotoCarouselController)initWithDelegate:(id)a3 maximumNumberOfPhotos:(unint64_t)a4 prefersMenu:(BOOL)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UGCPhotoCarouselController;
  v9 = [(UGCPhotoCarouselController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_maximumNumberOfPhotos = a4;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    viewModels = v10->_viewModels;
    v10->_viewModels = v11;

    uint64_t v13 = +[UIColor systemGroupedBackgroundColor];
    cellBackgroundColor = v10->_cellBackgroundColor;
    v10->_cellBackgroundColor = (UIColor *)v13;

    v10->_prefersMenu = a5;
  }

  return v10;
}

- (void)dealloc
{
  v3 = +[UGCPhotoDownloadManager sharedDownloadManager];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_viewModels;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        v10 = [(UGCPhotoCarouselController *)self downloadToken];
        [v3 cancelRequestForPhotoInfo:v9 downloadToken:v10];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)UGCPhotoCarouselController;
  [(UGCPhotoCarouselController *)&v11 dealloc];
}

- (void)setMaximumNumberOfPhotos:(unint64_t)a3
{
  if (self->_maximumNumberOfPhotos != a3)
  {
    self->_maximumNumberOfPhotos = a3;
    [(UGCPhotoCarouselController *)self _updateAddButtonState];
  }
}

- (void)addImage:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(_UGCPhotoCarouselViewModel);
  [(_UGCPhotoCarouselViewModel *)v8 setImage:v7];

  [(_UGCPhotoCarouselViewModel *)v8 setIdentifier:v6];
  [(UGCPhotoCarouselController *)self _addViewModel:v8];
}

- (void)addImageURL:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(_UGCPhotoCarouselViewModel);
  [(_UGCPhotoCarouselViewModel *)v8 setImageURL:v7];

  [(_UGCPhotoCarouselViewModel *)v8 setIdentifier:v6];
  [(UGCPhotoCarouselController *)self _addViewModel:v8];
}

- (id)visibleImageViewForIdentifier:(id)a3
{
  v4 = [(UGCPhotoCarouselController *)self _viewModelForIdentifier:a3];
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    id v6 = [WeakRetained visibleCells];

    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            long long v12 = [v11 identifier];
            long long v13 = [v4 _maps_diffableDataSourceIdentifier];
            unsigned __int8 v14 = [v12 isEqual:v13];

            if (v14)
            {
              id v7 = [v11 imageView];

              goto LABEL_15;
            }
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addViewModel:(id)a3
{
  id v5 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_viewModels count] < self->_maximumNumberOfPhotos)
  {
    [(NSMutableArray *)self->_viewModels addObject:v5];
    [(UGCPhotoCarouselController *)self _updateAddButtonState];
    v4 = [(UGCPhotoCarouselController *)self _buildSnapshotFromCurrentState];
    [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v4 animatingDifferences:1];
    [(UGCPhotoCarouselController *)self _invokeChangeHandler];
  }
}

- (void)_invokeChangeHandler
{
  v3 = [(UGCPhotoCarouselController *)self changeHandler];

  if (v3)
  {
    v4 = [(UGCPhotoCarouselController *)self changeHandler];
    v4[2]();
  }
}

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = +[UGCPhotoCollectionViewCell reuseIdentifier];
  [v4 registerClass:v5 forCellWithReuseIdentifier:v6];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = +[UGCAddPhotoCollectionViewCell reuseIdentifier];
  [v4 registerClass:v7 forCellWithReuseIdentifier:v8];

  [v4 setDelegate:self];
  objc_storeWeak((id *)&self->_collectionView, v4);
  id v9 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v10 = sub_10001CBB8(self);
  id v11 = (UICollectionViewDiffableDataSource *)[v9 initWithCollectionView:v4 cellProvider:v10];

  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v11;

  id v13 = [(UGCPhotoCarouselController *)self _buildSnapshotFromCurrentState];
  [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v13 animatingDifferences:0];
}

- (void)_cellRequestsRemoveImageForIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B617F4;
  v7[3] = &unk_1012E5D30;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [WeakRetained photoCarouselController:self requestsRemovingImageForIdentifier:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (unint64_t)totalNumberOfItems
{
  return (unint64_t)[(NSMutableArray *)self->_viewModels count] + 1;
}

- (void)_removeImageForIdentifier:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_viewModels;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      v10 = 0;
      unint64_t v11 = (unint64_t)v7 + v8;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v12 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) identifier:(void)v15];
        unsigned __int8 v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          unint64_t v11 = (unint64_t)v10 + v8;
          goto LABEL_12;
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      unint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_12:

  if (v11 < (unint64_t)[(NSMutableArray *)self->_viewModels count])
  {
    [(NSMutableArray *)self->_viewModels removeObjectAtIndex:v11];
    [(UGCPhotoCarouselController *)self _updateAddButtonState];
    unsigned __int8 v14 = [(UGCPhotoCarouselController *)self _buildSnapshotFromCurrentState];
    [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v14 animatingDifferences:1];
    [(UGCPhotoCarouselController *)self _invokeChangeHandler];
  }
}

- (void)_updateAddButtonState
{
  BOOL v3 = (unint64_t)[(NSMutableArray *)self->_viewModels count] >= self->_maximumNumberOfPhotos;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addCell);
  [WeakRetained setDimmed:v3];
}

- (id)_viewModelForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_viewModels;
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
        v10 = [v9 _maps_diffableDataSourceIdentifier:v13];
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

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v8 isEqualToString:@"AddPhotoCellIdentifier"])
  {
    unsigned __int8 v11 = +[UGCAddPhotoCollectionViewCell reuseIdentifier];
    long long v12 = [v10 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

    [v12 setDelegate:self];
    [v12 setPrefersMenu:self->_prefersMenu];
    id v13 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_addCell);

    if (WeakRetained != v13) {
      objc_storeWeak((id *)&self->_addCell, v13);
    }
    [(UGCPhotoCarouselController *)self _updateAddButtonState];
  }
  else
  {
    long long v15 = +[UGCPhotoCollectionViewCell reuseIdentifier];
    id v13 = [v10 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v9];

    [v13 setDelegate:self];
    long long v16 = [(UGCPhotoCarouselController *)self _viewModelForIdentifier:v8];
    long long v17 = [v16 identifier];
    [v13 setIdentifier:v17];

    long long v18 = [v16 image];

    if (v18)
    {
      long long v19 = [v16 image];
      [v13 setImage:v19];
    }
    else
    {
      long long v19 = +[UGCPhotoDownloadManager sharedDownloadManager];
      [v13 beginAnimatingActivityIndicator];
      v20 = [(UGCPhotoCarouselController *)self downloadToken];
      v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      v25 = sub_100B61E58;
      v26 = &unk_101313AC8;
      id v27 = v13;
      id v28 = v16;
      [v19 fetchImageForPhotoInfo:v28 downloadToken:v20 completion:&v23];
    }
  }
  [v13 _setContinuousCornerRadius:4.0 v23, v24, v25, v26];
  [v13 setClipsToBounds:1];
  v21 = [(UGCPhotoCarouselController *)self cellBackgroundColor];
  [v13 setBackgroundColor:v21];

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a4];
  if ([v8 isEqualToString:@"AddPhotoCellIdentifier"])
  {
    if ((unint64_t)[(NSMutableArray *)self->_viewModels count] >= self->_maximumNumberOfPhotos) {
      goto LABEL_7;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained photoCarouselControllerRequestsAddingNewPhoto:self];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained photoCarouselController:self didSelectImageWithIdentifier:v8];
  }

LABEL_7:
}

- (id)_buildSnapshotFromCurrentState
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  CFStringRef v21 = @"DefaultCarouselSection";
  id v4 = +[NSArray arrayWithObjects:&v21 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_viewModels;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) _maps_diffableDataSourceIdentifier:v16];
        [v5 addObject:v11];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v12 = +[UIDevice currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)5) {
    [v5 addObject:@"AddPhotoCellIdentifier"];
  }
  else {
    [v5 insertObject:@"AddPhotoCellIdentifier" atIndex:0];
  }
  id v14 = [v5 copy:v16];
  [v3 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:@"DefaultCarouselSection"];

  return v3;
}

- (UIView)anchoringView
{
  p_addCell = &self->_addCell;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addCell);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_addCell);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _addCell != ((void *)0)", v6, 2u);
    }
    id v4 = 0;
  }

  return (UIView *)v4;
}

- (double)preferredCellHeight
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  double result = 90.0;
  if (v3 == (id)5) {
    return 48.0;
  }
  return result;
}

- (UIColor)collectionViewBackgroundColor
{
  return +[MapsTheme ugcPhotoCarouselCellBackgroundColor];
}

- (void)photoCellDidCancel:(id)a3
{
  id v4 = [a3 identifier];
  [(UGCPhotoCarouselController *)self _cellRequestsRemoveImageForIdentifier:v4];
}

- (void)photoOptionsMenuButtonDidSelectTakePhoto
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 photoCarouselControllerRequestsAddingNewPhoto:self forSourceType:1];
  }
}

- (void)photoOptionsMenuButtonDidSelectAddFromLibrary
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 photoCarouselControllerRequestsAddingNewPhoto:self forSourceType:2];
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UGCPhotoCarouselRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPhotoCarouselRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIBarButtonItem)anchoringBarButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_anchoringBarButtonItem);

  return (UIBarButtonItem *)WeakRetained;
}

- (BOOL)photoSliderShouldEnablePagingScroll
{
  return self->_photoSliderShouldEnablePagingScroll;
}

- (void)setPhotoSliderShouldEnablePagingScroll:(BOOL)a3
{
  self->_photoSliderShouldEnablePagingScroll = a3;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
}

- (unint64_t)maximumNumberOfPhotos
{
  return self->_maximumNumberOfPhotos;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_anchoringBarButtonItem);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_addCell);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);

  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end