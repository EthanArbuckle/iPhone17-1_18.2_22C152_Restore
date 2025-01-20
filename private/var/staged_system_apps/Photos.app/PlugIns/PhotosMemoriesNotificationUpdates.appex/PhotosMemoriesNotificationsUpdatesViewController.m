@interface PhotosMemoriesNotificationsUpdatesViewController
- (void)_dismissOneUpViewController;
- (void)_presentViewControllerForMemoryUUID:(id)a3 photoLibraryURLString:(id)a4;
- (void)_updatePreferredContentSizeForPreferredPreviewSize:(CGSize)a3;
- (void)didReceiveNotification:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PhotosMemoriesNotificationsUpdatesViewController

- (void).cxx_destruct
{
}

- (void)didReceiveNotification:(id)a3
{
  id v11 = [a3 request];
  v5 = [v11 content];
  v6 = [v5 userInfo];
  v7 = [v6 objectForKey:kNotificationKeyMemoryUUID];
  if (!v7)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PhotosMemoriesNotificationsUpdatesViewController.m" lineNumber:107 description:@"Missing memory UUID for Memories Notification."];
  }
  v8 = [v6 objectForKey:kNotificationKeyPhotoLibraryURLString];
  if (!v8)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PhotosMemoriesNotificationsUpdatesViewController.m" lineNumber:110 description:@"Missing photoLibraryURLString for Memories Notification."];
  }
  [(PhotosMemoriesNotificationsUpdatesViewController *)self _presentViewControllerForMemoryUUID:v7 photoLibraryURLString:v8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhotosMemoriesNotificationsUpdatesViewController;
  [(PhotosMemoriesNotificationsUpdatesViewController *)&v4 viewDidDisappear:a3];
  [(PhotosMemoriesNotificationsUpdatesViewController *)self _dismissOneUpViewController];
}

- (void)_dismissOneUpViewController
{
  [(UIViewController *)self->_previewViewController willMoveToParentViewController:0];
  v3 = [(UIViewController *)self->_previewViewController view];
  [v3 removeFromSuperview];

  [(UIViewController *)self->_previewViewController removeFromParentViewController];
  previewViewController = self->_previewViewController;
  self->_previewViewController = 0;
}

- (void)_presentViewControllerForMemoryUUID:(id)a3 photoLibraryURLString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PhotosMemoriesNotificationsUpdatesViewController.m", 45, @"Invalid parameter not satisfying: %@", @"memoryUUID" object file lineNumber description];
  }
  if (self->_previewViewController) {
    [(PhotosMemoriesNotificationsUpdatesViewController *)self _dismissOneUpViewController];
  }
  v9 = +[PHMemory localIdentifierWithUUID:v7];
  id v10 = objc_alloc((Class)PHPhotoLibrary);
  id v11 = +[NSURL URLWithString:v8];
  id v12 = [v10 initWithPhotoLibraryURL:v11];

  if (![v12 openAndWaitWithUpgrade:0 error:0]) {
    goto LABEL_8;
  }
  v13 = [v12 librarySpecificFetchOptions];
  [v13 setIncludePendingMemories:1];
  v31 = v9;
  v14 = +[NSArray arrayWithObjects:&v31 count:1];
  v15 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v14 options:v13];

  v16 = [v15 firstObject];

  if (v16)
  {
    v17 = +[PXPhotosDetailsContext photosDetailsContextForMemory:v16];
    v18 = (UIViewController *)[objc_alloc((Class)PXPhotosDetailsUIViewController) initWithContext:v17 options:8];
    previewViewController = self->_previewViewController;
    self->_previewViewController = v18;

    v20 = [(PhotosMemoriesNotificationsUpdatesViewController *)self view];
    [v20 bounds];
    double v22 = v21;
    double v24 = v23;

    -[UIViewController setPreferredContentSize:](self->_previewViewController, "setPreferredContentSize:", v22, v24);
    [(PhotosMemoriesNotificationsUpdatesViewController *)self addChildViewController:self->_previewViewController];
    v25 = [(UIViewController *)self->_previewViewController view];
    v26 = [(PhotosMemoriesNotificationsUpdatesViewController *)self view];
    [v26 bounds];
    [v25 setFrame:];

    v27 = [(PhotosMemoriesNotificationsUpdatesViewController *)self view];
    [v27 addSubview:v25];

    [(UIViewController *)self->_previewViewController didMoveToParentViewController:self];
    [(UIViewController *)self->_previewViewController preferredContentSize];
    -[PhotosMemoriesNotificationsUpdatesViewController _updatePreferredContentSizeForPreferredPreviewSize:](self, "_updatePreferredContentSizeForPreferredPreviewSize:");
  }
  else
  {
LABEL_8:
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No memory was fetchable with memory UUID: \"%@\", hence can't present detail view context for that memory.", buf, 0xCu);
    }
  }
}

- (void)_updatePreferredContentSizeForPreferredPreviewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(PhotosMemoriesNotificationsUpdatesViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  double v9 = 0.0;
  if (width > 0.0) {
    double v9 = floor(height * (v8 / width));
  }
  [(PhotosMemoriesNotificationsUpdatesViewController *)self preferredContentSize];
  if (v11 != v8 || v10 != v9)
  {
    -[PhotosMemoriesNotificationsUpdatesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);
  }
}

@end