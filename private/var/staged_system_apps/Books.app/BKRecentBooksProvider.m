@interface BKRecentBooksProvider
+ (id)getInstance:(int64_t)a3;
+ (void)recentBooksAssetIDs:(id)a3;
- (BKRecentBooksProvider)initWithLimit:(unint64_t)a3;
- (BSUIAsset)lastKnownTopMostAsset;
- (void)libraryProvider:(id)a3 contentDidChange:(id)a4;
- (void)libraryProvider:(id)a3 contentDidLoad:(id)a4;
- (void)setLastKnownTopMostAsset:(id)a3;
@end

@implementation BKRecentBooksProvider

- (void)setLastKnownTopMostAsset:(id)a3
{
}

- (void)libraryProvider:(id)a3 contentDidLoad:(id)a4
{
  id v5 = a4;
  v6 = [v5 firstObject];
  v7 = BCCurrentBookLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 assetID];
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting up with current book: %@", buf, 0xCu);
  }
  [(BKRecentBooksProvider *)self setLastKnownTopMostAsset:v6];
  CFStringRef v11 = @"BKRecentBooksProviderAssetsKey";
  id v12 = v5;
  v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v10 = +[NSNotificationCenter defaultCenter];

  [v10 postNotificationName:@"BKRecentBooksProviderDidChangeNotification" object:0 userInfo:v9];
}

- (BKRecentBooksProvider)initWithLimit:(unint64_t)a3
{
  id v5 = +[BKLibraryManager fetchRequestForRecentlyEngaged];
  [v5 setFetchLimit:a3];
  v6 = +[BSUIAsset propertiesNeededFromBKLibraryAsset];
  [v5 setPropertiesToFetch:v6];

  v7 = BCCurrentBookLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Initializing recent books provider with limit %ld", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)BKRecentBooksProvider;
  v8 = [(BKLibraryProvider *)&v12 initWithFetchRequest:v5 name:@"recents"];
  v9 = v8;
  if (v8)
  {
    [(BKLibraryProvider *)v8 setDelegate:v8];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E6F0;
    block[3] = &unk_100A43EF8;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v9;
}

+ (id)getInstance:(int64_t)a3
{
  id v5 = +[BCJSConfiguration sharedInstance];
  uint64_t v12 = BCJSNumberOfBooksInRecentsKey;
  v6 = +[NSNumber numberWithInteger:a3];
  v13 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v5 updateConfiguration:v7];

  id v8 = objc_alloc((Class)a1);
  v9 = [v5 numberOfBooksAllowedInRecentsList];
  id v10 = [v8 initWithLimit:[v9 integerValue]];

  return v10;
}

+ (void)recentBooksAssetIDs:(id)a3
{
  id v3 = a3;
  v4 = +[BKLibraryManager defaultManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DB52C;
  v6[3] = &unk_100A46300;
  id v7 = v3;
  id v5 = v3;
  [v4 performBlockOnWorkerQueue:v6];
}

- (void)libraryProvider:(id)a3 contentDidChange:(id)a4
{
  id v5 = a4;
  v6 = [v5 firstObject];
  id v7 = [(BKRecentBooksProvider *)self lastKnownTopMostAsset];
  id v8 = [v7 assetID];

  v9 = [v6 assetID];
  if ([v9 isEqualToString:v8])
  {
    unsigned int v10 = [v6 isLocal];
    CFStringRef v11 = [(BKRecentBooksProvider *)self lastKnownTopMostAsset];
    unsigned int v12 = [v11 isLocal];

    if (v10 == v12) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v13 = BCCurrentBookLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    unint64_t v14 = [v6 assetID];
    *(_DWORD *)buf = 138412546;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "New current book from a change in the FRC: %@ (was %@)", buf, 0x16u);
  }
  [(BKRecentBooksProvider *)self setLastKnownTopMostAsset:v6];
  CFStringRef v17 = @"BKRecentBooksProviderAssetsKey";
  id v18 = v5;
  v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v16 = +[NSNotificationCenter defaultCenter];
  [v16 postNotificationName:@"BKRecentBooksProviderDidChangeNotification" object:0 userInfo:v15];

LABEL_8:
}

- (BSUIAsset)lastKnownTopMostAsset
{
  return self->_lastKnownTopMostAsset;
}

- (void).cxx_destruct
{
}

@end