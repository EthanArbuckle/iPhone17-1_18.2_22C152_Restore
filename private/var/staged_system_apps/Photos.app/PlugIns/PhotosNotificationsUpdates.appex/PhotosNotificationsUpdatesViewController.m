@interface PhotosNotificationsUpdatesViewController
- (id)_photosDataSourceForAssetUUID:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)_dismissOneUpViewController;
- (void)_likeAssetWithCloudAssetUUID:(id)a3;
- (void)_presentOneUpViewControllerForAssetUUID:(id)a3;
- (void)_sendComment:(id)a3 toAssetWithCloudAssetUUID:(id)a4;
- (void)_updatePreferredContentSizeForPreferredPreviewSize:(CGSize)a3;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PhotosNotificationsUpdatesViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewViewController, 0);

  objc_storeStrong((id *)&self->_oneUpPresentationHelper, 0);
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  PLProcessNotificationResponse();
  v5[2](v5, 1);
}

- (void)didReceiveNotification:(id)a3
{
  v4 = [a3 request];
  v5 = [v4 content];

  id v6 = [v5 userInfo];
  v7 = [v6 objectForKey:kNotificationKeyAssetUUID];
  v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received notification for asset UUID: \"%@\"", buf, 0xCu);
  }

  if (v7)
  {
    [(PhotosNotificationsUpdatesViewController *)self _presentOneUpViewControllerForAssetUUID:v7];
    v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000018D8;
    block[3] = &unk_1000041B0;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

- (void)_sendComment:(id)a3 toAssetWithCloudAssetUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = +[PLPhotoLibrary systemPhotoLibrary];
    [v7 assetWithUUID:v6];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100001A6C;
    v9[3] = &unk_1000041D8;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v5;
    id v8 = v10;
    [v7 performTransaction:v9];
  }
}

- (void)_likeAssetWithCloudAssetUUID:(id)a3
{
  id v3 = a3;
  v4 = +[PLPhotoLibrary systemPhotoLibrary];
  id v5 = [v4 assetWithUUID:v3];
  id v6 = +[NSSet setWithObject:v5];
  id v12 = 0;
  unsigned int v7 = +[PLPhotoSharingHelper canSetUserCloudSharedLiked:1 forAssets:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100001C3C;
    v10[3] = &unk_1000041B0;
    id v11 = v5;
    [v4 performTransaction:v10];
    v9 = v11;
  }
  else
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot like asset with UUID: \"%@\", Error: %@", buf, 0x16u);
    }
  }
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 38;
}

- (void)_dismissOneUpViewController
{
  [(UIViewController *)self->_previewViewController willMoveToParentViewController:0];
  id v3 = [(UIViewController *)self->_previewViewController view];
  [v3 removeFromSuperview];

  [(UIViewController *)self->_previewViewController removeFromParentViewController];
  previewViewController = self->_previewViewController;
  self->_previewViewController = 0;

  [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper setDelegate:0];
  oneUpPresentationHelper = self->_oneUpPresentationHelper;
  self->_oneUpPresentationHelper = 0;
}

- (void)_presentOneUpViewControllerForAssetUUID:(id)a3
{
  id v16 = [(PhotosNotificationsUpdatesViewController *)self _photosDataSourceForAssetUUID:a3];
  v4 = (PUOneUpPresentationHelper *)[objc_alloc((Class)PUOneUpPresentationHelper) initWithPhotosDataSource:v16];
  oneUpPresentationHelper = self->_oneUpPresentationHelper;
  self->_oneUpPresentationHelper = v4;

  [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper setDelegate:self];
  id v6 = [v16 indexPathForFirstAsset];
  unsigned int v7 = [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper previewViewControllerForItemAtIndexPath:v6 allowingActions:0];
  previewViewController = self->_previewViewController;
  self->_previewViewController = v7;

  [(PhotosNotificationsUpdatesViewController *)self addChildViewController:self->_previewViewController];
  [(UIViewController *)self->_previewViewController preferredContentSize];
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIViewController *)self->_previewViewController view];
  [v13 setFrame:0.0, 0.0, v10, v12];
  id v14 = [(PhotosNotificationsUpdatesViewController *)self view];
  [v14 addSubview:v13];

  __int16 v15 = [(PhotosNotificationsUpdatesViewController *)self view];
  [v15 addSubview:v13];

  [(UIViewController *)self->_previewViewController didMoveToParentViewController:self];
  -[PhotosNotificationsUpdatesViewController _updatePreferredContentSizeForPreferredPreviewSize:](self, "_updatePreferredContentSizeForPreferredPreviewSize:", v10, v12);
}

- (void)_updatePreferredContentSizeForPreferredPreviewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(PhotosNotificationsUpdatesViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  double v9 = 0.0;
  if (width > 0.0) {
    double v9 = floor(height * (v8 / width));
  }
  [(PhotosNotificationsUpdatesViewController *)self preferredContentSize];
  if (v11 != v8 || v10 != v9)
  {
    -[PhotosNotificationsUpdatesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);
  }
}

- (id)_photosDataSourceForAssetUUID:(id)a3
{
  id v3 = +[PHAsset localIdentifierWithUUID:a3];
  id v16 = v3;
  v4 = +[NSArray arrayWithObjects:&v16 count:1];
  id v5 = +[PHFetchOptions px_standardFetchOptions];
  id v6 = +[PHAsset fetchAssetsWithLocalIdentifiers:v4 options:v5];

  double v7 = +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:v6 title:0];
  __int16 v15 = v7;
  double v8 = +[NSArray arrayWithObjects:&v15 count:1];
  double v9 = +[PHCollectionList transientCollectionListWithCollections:v8 title:0];

  double v10 = +[PHFetchOptions px_standardFetchOptions];
  double v11 = +[PHCollectionList fetchCollectionsInCollectionList:v9 options:v10];

  id v12 = [objc_alloc((Class)PXPhotosDataSourceConfiguration) initWithCollectionListFetchResult:v11 options:0];
  id v13 = [objc_alloc((Class)PXPhotosDataSource) initWithPhotosDataSourceConfiguration:v12];

  return v13;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper presentingViewControllerViewDidDisappear:v3];
  [(PhotosNotificationsUpdatesViewController *)self _dismissOneUpViewController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper presentingViewControllerViewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewDidAppear:](&v5, "viewDidAppear:");
  [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper presentingViewControllerViewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewWillAppear:](&v5, "viewWillAppear:");
  [(PUOneUpPresentationHelper *)self->_oneUpPresentationHelper presentingViewControllerViewWillAppear:v3];
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(PhotosNotificationsUpdatesViewController *)self setView:v3];
}

@end