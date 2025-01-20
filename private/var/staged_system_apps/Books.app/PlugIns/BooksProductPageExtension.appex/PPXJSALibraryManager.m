@interface PPXJSALibraryManager
- (id)mostRecentPurchaseDate;
- (void)addBookToWantToReadCollection:(id)a3 :(id)a4 :(id)a5;
- (void)assetsOfPurchasedBooks:(id)a3;
- (void)cancelDownloadForBook:(id)a3 :(id)a4 :(id)a5;
- (void)downloadBookWithRedownloadParameters:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6 :(BOOL)a7;
- (void)downloadBooks:(id)a3 :(id)a4;
- (void)filterPurchasedBooks:(id)a3 callback:(id)a4;
- (void)getCollectionNameForCollectionID:(id)a3 :(id)a4;
- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3;
- (void)getVersion:(id)a3;
- (void)markBookAsFinished:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6;
- (void)openBook:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)openSampleBook:(id)a3 downloadSampleURL:(id)a4 options:(id)a5 callback:(id)a6 tracker:(id)a7;
- (void)previewAudiobook:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)removeBookFromWantToReadCollection:(id)a3 :(id)a4 :(id)a5;
- (void)showCollection:(id)a3 :(id)a4;
- (void)updateBooks:(id)a3 :(id)a4;
@end

@implementation PPXJSALibraryManager

- (void)getVersion:(id)a3
{
  id v3 = a3;
  v4 = +[JSABridge sharedInstance];
  v6 = &off_1000324C8;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 enqueueValueCall:v3 arguments:v5 file:@"PPXJSALibraryManager.m" line:36];
}

- (void)addBookToWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a4;
  id v8 = a3;
  +[PPXBookDataStoreServices addStoreIDToWantToRead:v8 tracker:a5];
  v9 = BSUIGetLibraryItemStateUpdater();
  [v9 updateWantToReadState:1 identifier:v8];

  v10 = BSUIGetLibraryItemStateUpdater();
  [v10 updateItemOfInterestForItemIdentifier:v8];

  id v11 = +[JSABridge sharedInstance];
  [v11 enqueueValueCall:v7 arguments:0 file:@"PPXJSALibraryManager.m" line:44];
}

- (void)removeBookFromWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a4;
  id v8 = a3;
  +[PPXBookDataStoreServices removeAssetFromWantToRead:v8 tracker:a5];
  v9 = BSUIGetLibraryItemStateUpdater();
  [v9 updateWantToReadState:0 identifier:v8];

  v10 = BSUIGetLibraryItemStateUpdater();
  [v10 updateItemOfInterestForItemIdentifier:v8];

  id v11 = +[JSABridge sharedInstance];
  [v11 enqueueValueCall:v7 arguments:0 file:@"PPXJSALibraryManager.m" line:52];
}

- (void)downloadBooks:(id)a3 :(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PPXProductPageActions sharedInstance];
  [v7 downloadBooks:v6];

  id v8 = +[JSABridge sharedInstance];
  v10 = &off_1000324F0;
  v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [v8 enqueueValueCall:v5 arguments:v9 file:@"PPXJSALibraryManager.m" line:60];
}

- (void)downloadBookWithRedownloadParameters:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6 :(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = +[JSABridge sharedInstance];
  v15 = [v14 windowManager];

  v16 = +[PPXProductPageActions sharedInstance];
  [v16 downloadBookWithRedownloadParameters:v13 isAudiobook:v9 hasRacSupport:v7 uiManager:v15 tracker:v11];

  v17 = +[JSABridge sharedInstance];
  v19 = &off_100032518;
  v18 = +[NSArray arrayWithObjects:&v19 count:1];
  [v17 enqueueValueCall:v12 arguments:v18 file:@"PPXJSALibraryManager.m" line:70];
}

- (void)markBookAsFinished:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  +[PPXBookDataStoreServices setFinishedState:v7 storeID:v10 tracker:a6];
  id v11 = BSUIGetLibraryItemStateUpdater();
  [v11 updateFinishedState:v7 identifier:v10];

  id v12 = BSUIGetLibraryItemStateUpdater();
  [v12 updateItemOfInterestForItemIdentifier:v10];

  id v13 = +[JSABridge sharedInstance];
  [v13 enqueueValueCall:v9 arguments:0 file:@"PPXJSALibraryManager.m" line:78];
}

- (void)openBook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PPXProductPageActions sharedInstance];
  [v11 openBook:v10 options:v9];

  id v12 = +[JSABridge sharedInstance];
  [v12 enqueueValueCall:v8 arguments:0 file:@"PPXJSALibraryManager.m" line:84];
}

- (void)openSampleBook:(id)a3 downloadSampleURL:(id)a4 options:(id)a5 callback:(id)a6 tracker:(id)a7
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[PPXProductPageActions sharedInstance];
  [v12 openSampleBook:v11 withSampleURL:v10];

  id v13 = +[JSABridge sharedInstance];
  [v13 enqueueValueCall:v9 arguments:0 file:@"PPXJSALibraryManager.m" line:90];
}

- (void)previewAudiobook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[PPXProductPageActions sharedInstance];
  [v9 previewAudiobook:v8];

  id v10 = +[JSABridge sharedInstance];
  [v10 enqueueValueCall:v7 arguments:0 file:@"PPXJSALibraryManager.m" line:96];
}

- (void)updateBooks:(id)a3 :(id)a4
{
  id v4 = a4;
  id v5 = +[JSABridge sharedInstance];
  [v5 enqueueValueCall:v4 arguments:0 file:@"PPXJSALibraryManager.m" line:102];
}

- (void)cancelDownloadForBook:(id)a3 :(id)a4 :(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = +[PPXProductPageActions sharedInstance];
  [v8 cancelDownloadForBook:v7];

  id v9 = +[JSABridge sharedInstance];
  [v9 enqueueValueCall:v6 arguments:0 file:@"PPXJSALibraryManager.m" line:108];
}

- (void)showCollection:(id)a3 :(id)a4
{
  id v4 = a4;
  id v5 = +[JSABridge sharedInstance];
  [v5 enqueueValueCall:v4 arguments:0 file:@"PPXJSALibraryManager.m" line:114];
}

- (void)getCollectionNameForCollectionID:(id)a3 :(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isObject])
  {
    id v7 = +[BCCollection titleForDefaultCollectionID:v5];
    if (v7)
    {
      id v8 = +[JSABridge sharedInstance];
      id v13 = v7;
      id v9 = +[NSArray arrayWithObjects:&v13 count:1];
      [v8 enqueueValueCall:v6 arguments:v9 file:@"PPXJSALibraryManager.m" line:124];
    }
    else
    {
      id v10 = +[BCCloudCollectionsManager sharedManager];
      id v8 = [v10 collectionDetailManager];

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100004418;
      v11[3] = &unk_100031470;
      id v12 = v6;
      [v8 collectionDetailForCollectionID:v5 completion:v11];
      id v9 = v12;
    }
  }
}

- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[JSABridge sharedInstance];
  [v4 enqueueValueCall:v3 arguments:&off_100032540 file:@"PPXJSALibraryManager.m" line:136];
}

- (void)filterPurchasedBooks:(id)a3 callback:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 isArray])
  {
    id v6 = [v8 toArray];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }
  id v7 = +[JSABridge sharedInstance];
  [v7 enqueueValueCall:v5 arguments:v6 file:@"PPXJSALibraryManager.m" line:143];
}

- (id)mostRecentPurchaseDate
{
  return 0;
}

- (void)assetsOfPurchasedBooks:(id)a3
{
  id v3 = a3;
  id v4 = +[JSABridge sharedInstance];
  [v4 enqueueValueCall:v3 arguments:&__NSArray0__struct file:@"PPXJSALibraryManager.m" line:153];
}

@end