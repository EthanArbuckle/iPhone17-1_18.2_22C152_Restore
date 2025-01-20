@interface BKLibraryCollectionsFlowController
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKLibraryCollectionsFlowController)initWithLibraryAssetProvider:(id)a3;
- (BOOL)collectionListView:(id)a3 collectionDeleted:(id)a4;
- (OS_dispatch_queue)queue;
- (id)collectionListView:(id)a3 alertControllerForDeletingCollection:(id)a4 completionHandler:(id)a5;
- (id)libraryCollectionListViewControllerWithAssetIDs:(id)a3 knownAssetTypes:(id)a4 knownStoreAssetIDs:(id)a5 containsSeriesContainer:(BOOL)a6 showDivider:(BOOL)a7;
- (id)sceneManager;
- (id)successfulAddFinishedBlock;
- (void)collectionListView:(id)a3 addSelectedAssetIDs:(id)a4 toCollection:(id)a5 knownAssetTypes:(id)a6 animationDestination:(CGRect)a7;
- (void)collectionListView:(id)a3 cancelSelected:(BOOL)a4;
- (void)collectionListView:(id)a3 collectionSelected:(id)a4;
- (void)setLibraryAssetProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSuccessfulAddFinishedBlock:(id)a3;
- (void)showLibraryCollectionInPlaceWithTransaction:(id)a3 collectionID:(id)a4;
- (void)showLibraryCollectionInPlaceWithTransaction:(id)a3 collectionID:(id)a4 replaceExistingPresentedCollection:(BOOL)a5;
- (void)showLibraryWithTransaction:(id)a3;
- (void)showLibraryWithTransaction:(id)a3 animated:(BOOL)a4 assetID:(id)a5 completion:(id)a6;
- (void)showLibraryWithTransaction:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation BKLibraryCollectionsFlowController

- (BKLibraryCollectionsFlowController)initWithLibraryAssetProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryCollectionsFlowController;
  v6 = [(BKLibraryCollectionsFlowController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryAssetProvider, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("BKLibraryCollectionsFlowController.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (id)libraryCollectionListViewControllerWithAssetIDs:(id)a3 knownAssetTypes:(id)a4 knownStoreAssetIDs:(id)a5 containsSeriesContainer:(BOOL)a6 showDivider:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[BKLibraryCollectionsListViewController alloc] initWithSelectedBookIDs:v14 knownAssetTypes:v13 knownStoreAssetIDs:v12 containsSeriesContainer:v8 showDivider:v7];

  [(BKLibraryCollectionsListViewController *)v15 setDelegate:self];
  v16 = +[BKLibraryManager defaultManager];
  v17 = [v16 uiChildContext];
  [(BKLibraryCollectionsListViewController *)v15 setManagedObjectContext:v17];

  return v15;
}

- (void)collectionListView:(id)a3 cancelSelected:(BOOL)a4
{
  v4 = [a3 bc_windowForViewController];
  id v5 = [v4 rootViewController];

  id v6 = v5;
  BOOL v7 = [v6 presentedViewController];

  if (v7)
  {
    id v12 = v6;
    do
    {
      id v8 = v12;

      id v12 = [v8 presentedViewController];

      dispatch_queue_t v9 = [v12 presentedViewController];

      id v6 = v8;
    }
    while (v9);
  }
  else
  {
    id v12 = v6;
    id v8 = v6;
  }
  v10 = [v8 navigationController];
  id v11 = [v10 popToViewController:v8 animated:1];
}

- (void)collectionListView:(id)a3 collectionSelected:(id)a4
{
  id v5 = a3;
  id v6 = [a4 collectionID];
  [v5 bk_presentCollectionWithID:v6];
}

- (void)collectionListView:(id)a3 addSelectedAssetIDs:(id)a4 toCollection:(id)a5 knownAssetTypes:(id)a6 animationDestination:(CGRect)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  v15 = [v14 collectionID];
  v16 = [v14 title];

  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000FC3FC;
  v23[3] = &unk_100A462A0;
  id v24 = v12;
  id v25 = v15;
  id v26 = v13;
  id v27 = v11;
  id v28 = v16;
  v29 = self;
  id v18 = v16;
  id v19 = v11;
  id v20 = v13;
  id v21 = v15;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (BOOL)collectionListView:(id)a3 collectionDeleted:(id)a4
{
  id v4 = a4;
  id v5 = +[BKLibraryManager defaultManager];
  id v6 = [v5 collectionController];
  unsigned __int8 v7 = [v6 deleteCollectionOnMainQueue:v4];

  return v7;
}

- (id)collectionListView:(id)a3 alertControllerForDeletingCollection:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [a4 title];
  id v8 = (void *)v7;
  if (v7) {
    dispatch_queue_t v9 = (__CFString *)v7;
  }
  else {
    dispatch_queue_t v9 = &stru_100A70340;
  }
  v10 = v9;

  id v11 = +[NSBundle mainBundle];
  id v28 = [v11 localizedStringForKey:@"…" value:&stru_100A70340 table:0];

  id v12 = [(__CFString *)v10 stringByTruncatingToLength:50 options:3 truncationString:v28];

  id v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"Delete Collection?" value:&stru_100A70340 table:0];

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"If you delete the collection “%@”, its content will remain in your library.", &stru_100A70340, 0 value table];
  v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v12);

  id v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"Delete" value:&stru_100A70340 table:0];

  id v20 = +[NSBundle mainBundle];
  id v21 = [v20 localizedStringForKey:@"Cancel" value:&stru_100A70340 table:0];

  id v22 = +[UIAlertController alertControllerWithTitle:v14 message:v17 preferredStyle:1];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000FD1C8;
  v31[3] = &unk_100A45B60;
  id v23 = v6;
  id v32 = v23;
  id v24 = +[UIAlertAction actionWithTitle:v19 style:2 handler:v31];
  [v22 addAction:v24];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000FD218;
  v29[3] = &unk_100A45B60;
  id v30 = v23;
  id v25 = v23;
  id v26 = +[UIAlertAction actionWithTitle:v21 style:1 handler:v29];
  [v22 addAction:v26];

  return v22;
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager];
}

- (void)showLibraryWithTransaction:(id)a3
{
}

- (void)showLibraryWithTransaction:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FD328;
  v7[3] = &unk_100A43E28;
  BOOL v9 = a4;
  v7[4] = self;
  id v8 = a5;
  id v6 = v8;
  [a3 commit:v7];
}

- (void)showLibraryWithTransaction:(id)a3 animated:(BOOL)a4 assetID:(id)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FD50C;
  v10[3] = &unk_100A46160;
  BOOL v13 = a4;
  v10[4] = self;
  id v11 = a5;
  id v12 = a6;
  id v8 = v12;
  id v9 = v11;
  [a3 commit:v10];
}

- (void)showLibraryCollectionInPlaceWithTransaction:(id)a3 collectionID:(id)a4
{
}

- (void)showLibraryCollectionInPlaceWithTransaction:(id)a3 collectionID:(id)a4 replaceExistingPresentedCollection:(BOOL)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FD6E4;
  v8[3] = &unk_100A44818;
  v8[4] = self;
  id v9 = a4;
  BOOL v10 = a5;
  id v7 = v9;
  [a3 commit:v8];
}

- (id)successfulAddFinishedBlock
{
  return self->successfulAddFinishedBlock;
}

- (void)setSuccessfulAddFinishedBlock:(id)a3
{
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return self->_libraryAssetProvider;
}

- (void)setLibraryAssetProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_libraryAssetProvider, 0);

  objc_storeStrong(&self->successfulAddFinishedBlock, 0);
}

@end