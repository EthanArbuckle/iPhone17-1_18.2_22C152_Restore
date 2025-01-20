@interface BKLibraryActionHandler
- (BKLibraryBookshelfCollectionViewController)bookshelfCVC;
- (id)_dataModelForLibraryAsset:(id)a3 fromSourceView:(id)a4 inCollection:(id)a5;
- (id)analyticsAssetPropertyProviderForLibraryAsset:(id)a3 fromSourceView:(id)a4 inCollection:(id)a5;
- (id)menuWithLibraryAsset:(id)a3 sourceView:(id)a4 collection:(id)a5;
- (id)tracker;
- (void)_checkAudiobookAvailabilityForAsset:(id)a3 completion:(id)a4;
- (void)_showActionNotAvailableBecauseContentNotAvailableAlert;
- (void)bookCancelDownload:(id)a3;
- (void)bookMarkedFinished:(id)a3;
- (void)bookResumeDownload:(id)a3;
- (void)bookTapped:(id)a3;
- (void)bookTapped:(id)a3 completion:(id)a4;
- (void)bookUpdateStarRating:(id)a3 rating:(double)a4 completion:(id)a5;
- (void)bookWriteReview:(id)a3;
- (void)changeSortModeTo:(unint64_t)a3;
- (void)descriptionUpdated;
- (void)directBuyTapped:(id)a3 buyParameters:(id)a4;
- (void)directBuyTapped:(id)a3 buyParameters:(id)a4 completion:(id)a5;
- (void)setBookshelfCVC:(id)a3;
- (void)showGrid;
- (void)showList;
- (void)showReadingLists;
- (void)toggleEditMode;
@end

@implementation BKLibraryActionHandler

- (id)menuWithLibraryAsset:(id)a3 sourceView:(id)a4 collection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001EA54C;
  v18[3] = &unk_100A4B1C0;
  objc_copyWeak(&v22, &location);
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  v14 = +[UIDeferredMenuElement elementWithUncachedProvider:v18];
  v24 = v14;
  v15 = +[NSArray arrayWithObjects:&v24 count:1];
  v16 = +[UIMenu menuWithTitle:&stru_100A70340 children:v15];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v16;
}

- (id)tracker
{
  v2 = [(BKLibraryActionHandler *)self bookshelfCVC];
  v3 = [v2 ba_effectiveAnalyticsTracker];

  return v3;
}

- (id)analyticsAssetPropertyProviderForLibraryAsset:(id)a3 fromSourceView:(id)a4 inCollection:(id)a5
{
  v5 = [(BKLibraryActionHandler *)self _dataModelForLibraryAsset:a3 fromSourceView:a4 inCollection:a5];
  v6 = +[BKContextMenuProvider sharedProvider];
  v7 = [v6 analyticsAssetPropertyProviderForDataModel:v5];

  return v7;
}

- (id)_dataModelForLibraryAsset:(id)a3 fromSourceView:(id)a4 inCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKLibraryActionHandler *)self bookshelfCVC];
  id v12 = [v11 dataSourceAdaptor];
  id v13 = [v12 booksDataSource];
  v14 = [v10 assetID];
  v15 = [v13 productInfoForAssetID:v14];

  id v16 = objc_alloc((Class)BSUIContextActionDataModel);
  id v17 = [objc_alloc((Class)BSUIContextActionDataAssetModel) initWithLibraryAsset:v10 productProfile:v15];

  id v18 = [v16 initWithAssetModel:v17 sourceView:v9];
  [v18 setOriginatingLocation:v8];

  id v19 = [(BKLibraryActionHandler *)self bookshelfCVC];
  id v20 = [v19 im_ancestorConformingToProtocol:&OBJC_PROTOCOL___BCTransactionProviding];
  [v18 setTransactionProvider:v20];

  return v18;
}

- (void)showGrid
{
  id v2 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v2 changeViewModeTo:1];
}

- (void)showList
{
  id v2 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v2 changeViewModeTo:2];
}

- (void)toggleEditMode
{
  id v4 = [(BKLibraryActionHandler *)self bookshelfCVC];
  v3 = [(BKLibraryActionHandler *)self bookshelfCVC];
  +[BKLibraryBookshelfController reconfigureBookshelfCollectionViewController:forEditModeState:](BKLibraryBookshelfController, "reconfigureBookshelfCollectionViewController:forEditModeState:", v4, [v3 isEditing] ^ 1);
}

- (void)changeSortModeTo:(unint64_t)a3
{
  id v4 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v4 changeSortModeTo:a3];
}

- (void)bookTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v5 bookTapped:v4 completion:0];
}

- (void)bookTapped:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v8 bookTapped:v7 completion:v6];
}

- (void)directBuyTapped:(id)a3 buyParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v8 directBuyTapped:v7 buyParameters:v6 completion:0];
}

- (void)directBuyTapped:(id)a3 buyParameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v11 directBuyTapped:v10 buyParameters:v9 completion:v8];
}

- (void)showReadingLists
{
  id v3 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v3 showReadingListsForActionHandler:self];
}

- (void)bookMarkedFinished:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetID];
  if (v5)
  {
    id v6 = +[BKAppDelegate delegate];
    id v7 = [v6 serviceCenter];
    id v8 = [v7 readingActivityService];

    +[BKLibraryManager defaultManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001EAD34;
    v11[3] = &unk_100A4A050;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v5;
    id v14 = v8;
    id v15 = v4;
    id v16 = self;
    id v9 = v8;
    id v10 = v12;
    [v10 performBlockOnWorkerQueue:v11];
  }
}

- (void)bookCancelDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v5 cancelDownloadBook:v4];
}

- (void)bookResumeDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v5 resumeDownloadBook:v4];
}

- (void)bookWriteReview:(id)a3
{
  id v4 = a3;
  id v5 = [v4 storeID];

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001EB20C;
    v6[3] = &unk_100A447C8;
    id v7 = v4;
    id v8 = self;
    [(BKLibraryActionHandler *)self _checkAudiobookAvailabilityForAsset:v7 completion:v6];
  }
}

- (void)bookUpdateStarRating:(id)a3 rating:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(BKLibraryActionHandler *)self bookshelfCVC];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001EB3A4;
  v13[3] = &unk_100A4B238;
  double v18 = a4;
  id v14 = v8;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = self;
  id v17 = v9;
  id v10 = v9;
  id v11 = v15;
  id v12 = v8;
  [(BKLibraryActionHandler *)self _checkAudiobookAvailabilityForAsset:v12 completion:v13];
}

- (void)descriptionUpdated
{
  id v3 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v3 ba_effectiveAnalyticsTracker];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [(BKLibraryActionHandler *)self bookshelfCVC];
  id v5 = [v4 collectionID];

  id v6 = +[BAEventReporter sharedReporter];
  [v6 emitCollectionDescriptionEventWithTracker:v7 collectionID:v5];
}

- (void)_checkAudiobookAvailabilityForAsset:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void))a4;
  if ([v9 isStore]
    && ([v9 isContainer] & 1) == 0
    && (([v9 isAudiobook] & 1) != 0
     || ([v9 isStoreAudiobook],
         id v6 = objc_claimAutoreleasedReturnValue(),
         unsigned int v7 = [v6 BOOLValue],
         v6,
         v7)))
  {
    id v8 = [v9 storeID];
    +[BSUIStoreServices checkAudiobookAvailabilityForStoreID:v8 completion:v5];
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (void)_showActionNotAvailableBecauseContentNotAvailableAlert
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Audiobook Unavailable" value:&stru_100A70340 table:0];
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"This audiobook can’t be rated or reviewed, because it is no longer available on Apple Books.", &stru_100A70340, 0 value table];
  id v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_100A70340 table:0];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:0];

  [v11 addAction:v9];
  id v10 = [(BKLibraryActionHandler *)self bookshelfCVC];
  [v10 presentViewController:v11 animated:1 completion:0];
}

- (BKLibraryBookshelfCollectionViewController)bookshelfCVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookshelfCVC);

  return (BKLibraryBookshelfCollectionViewController *)WeakRetained;
}

- (void)setBookshelfCVC:(id)a3
{
}

- (void).cxx_destruct
{
}

@end