@interface BKLibraryDataSourcePerformance
+ (void)initialize;
- (BKLibraryDataSourcePerformance)initWithResource:(id)a3 forceRandomBooks:(BOOL)a4;
- (BKLibraryManager)libraryManager;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)createSeriesContainers;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)profilesChecked;
- (BOOL)runningPPT;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSDate)creationDate;
- (NSString)identifier;
- (NSString)resourceName;
- (NSURL)cacheURL;
- (OS_dispatch_queue)queue;
- (id)_cachedProductProfiles;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (unint64_t)numRandomBooks;
- (unint64_t)randomBookBaseID;
- (void)_fetchProductProfiles;
- (void)_libraryDataSourcePerformanceChanged;
- (void)_updateCreationDate;
- (void)_updateEnabled;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setCacheURL:(id)a3;
- (void)setCreateSeriesContainers:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setLibraryManager:(id)a3;
- (void)setNumRandomBooks:(unint64_t)a3;
- (void)setProfilesChecked:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRandomBookBaseID:(unint64_t)a3;
- (void)setRank:(int64_t)a3;
- (void)setResourceName:(id)a3;
- (void)setRunningPPT:(BOOL)a3;
@end

@implementation BKLibraryDataSourcePerformance

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:&off_D9E08];
  }
}

- (BKLibraryDataSourcePerformance)initWithResource:(id)a3 forceRandomBooks:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BKLibraryDataSourcePerformance;
  v8 = [(BKLibraryDataSourcePerformance *)&v26 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resourceName, a3);
    dispatch_queue_t v10 = dispatch_queue_create("BKLibraryDataSourcePerformance", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[NSString stringWithFormat:@"com.apple.ibooks.library.datasource.performance.%@", v7];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;

    v14 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v15 = [v14 BOOLForKey:@"BKLibraryDataSourcePerformance-PPT"];

    if ((v15 & 1) != 0 || v4)
    {
      [(BKLibraryDataSourcePerformance *)v9 setRunningPPT:1];
      [(BKLibraryDataSourcePerformance *)v9 setIsEnabled:1];
      [(BKLibraryDataSourcePerformance *)v9 setNumRandomBooks:500];
      [(BKLibraryDataSourcePerformance *)v9 setRandomBookBaseID:1000000];
      [(BKLibraryDataSourcePerformance *)v9 setCreateSeriesContainers:1];
    }
    else
    {
      v16 = +[NSUserDefaults standardUserDefaults];
      [v16 addObserver:v9 forKeyPath:@"BKLibraryPerformanceDataSource" options:0 context:off_ED5E8];

      v17 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v18 = [v17 lastObject];
      v19 = [v18 stringByAppendingPathComponent:@"BKLibraryDataSourcePerformance"];

      if (v19)
      {
        v20 = +[NSFileManager defaultManager];
        [v20 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:0];

        v21 = +[NSString stringWithFormat:@"ProductProfiles-%@.plist", v7];
        v22 = [v19 stringByAppendingPathComponent:v21];
        uint64_t v23 = +[NSURL fileURLWithPath:v22];
        cacheURL = v9->_cacheURL;
        v9->_cacheURL = (NSURL *)v23;
      }
      [(BKLibraryDataSourcePerformance *)v9 _updateEnabled];
    }
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"BKLibraryPerformanceDataSource" context:off_ED5E8];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryDataSourcePerformance;
  [(BKLibraryDataSourcePerformance *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_ED5E8 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_59348;
    v18[3] = &unk_D2680;
    objc_copyWeak(&v19, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread])
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_59388;
        block[3] = &unk_D2878;
        v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKLibraryDataSourcePerformance;
    [(BKLibraryDataSourcePerformance *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_libraryDataSourcePerformanceChanged
{
  unsigned int v3 = [(BKLibraryDataSourcePerformance *)self isEnabled];
  [(BKLibraryDataSourcePerformance *)self _updateEnabled];
  if (v3 != [(BKLibraryDataSourcePerformance *)self isEnabled])
  {
    objc_super v4 = [(BKLibraryDataSourcePerformance *)self libraryManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_59450;
    v5[3] = &unk_D30B0;
    v5[4] = self;
    [v4 libraryDataSource:self updateWithName:@"performance enabled changed" block:v5];
  }
}

- (void)_updateEnabled
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  self->_isEnabled = [v3 BOOLForKey:@"BKLibraryPerformanceDataSource"];
}

- (void)_updateCreationDate
{
  id v3 = [(BKLibraryDataSourcePerformance *)self cacheURL];
  id v6 = 0;
  [v3 getResourceValue:&v6 forKey:NSURLCreationDateKey error:0];
  objc_super v4 = (NSDate *)v6;

  creationDate = self->_creationDate;
  self->_creationDate = v4;
}

- (void)_fetchProductProfiles
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [(BKLibraryDataSourcePerformance *)self resourceName];
  v5 = [v3 URLForResource:v4 withExtension:@"plist"];

  if (v5) {
    id v6 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = [v6 objectForKeyedSubscript:@"adamIds"];
  v8 = +[NSSet setWithArray:v7];
  v9 = [v8 allObjects];

  id v10 = +[AEUserPublishing sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_59708;
  v11[3] = &unk_D2DE8;
  v11[4] = self;
  [v10 productProfilesForStoreIDs:v9 completion:v11];
}

- (id)_cachedProductProfiles
{
  id v3 = [(BKLibraryDataSourcePerformance *)self cacheURL];
  objc_super v4 = +[NSData dataWithContentsOfURL:v3];

  id v15 = 0;
  id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v15];
  id v6 = v15;
  if (v6)
  {
    id v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_92E28(self, (uint64_t)v6, v7);
    }
    v8 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    objc_opt_class();
    v13 = [v5 decodeObjectOfClasses:v7 forKey:@"Root"];
    v8 = BUDynamicCast();
  }

  return v8;
}

- (int64_t)coverSourceRank
{
  return 1;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v9 = a3;
  id v6 = a5;
  if (!qword_EE6A0)
  {
    BKGenericBookCoverDefaultSettings();
    qword_EE6A0 = BKGenericBookCoverCreateImage();
  }
  id v7 = objc_retainBlock(v6);
  if (v7)
  {
    v8 = +[UIImage im_imageWithCGImage:qword_EE6A0];
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v8, 0, 0);
  }
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    id v5 = v6;
  }
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v4 = objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    id v4 = v5;
  }
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  if ([(BKLibraryDataSourcePerformance *)self runningPPT])
  {
    id v5 = +[NSMutableArray array];
    if ([(BKLibraryDataSourcePerformance *)self numRandomBooks])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = +[NSNumber numberWithInteger:(char *)[(BKLibraryDataSourcePerformance *)self randomBookBaseID] + v6];
        v8 = [v7 stringValue];
        [v5 addObject:v8];

        ++v6;
      }
      while (v6 < [(BKLibraryDataSourcePerformance *)self numRandomBooks]);
    }
    kdebug_trace();
    id v9 = objc_retainBlock(v4);
    uint64_t v10 = v9;
    if (v9) {
      (*((void (**)(id, void *, void))v9 + 2))(v9, v5, 0);
    }
  }
  else
  {
    uint64_t v11 = [(BKLibraryDataSourcePerformance *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_5A00C;
    v12[3] = &unk_D1548;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v11, v12);
  }
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  unsigned int v8 = [(BKLibraryDataSourcePerformance *)self runningPPT];
  id v9 = [(BKLibraryDataSourcePerformance *)self queue];
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5A264;
    block[3] = &unk_D22F0;
    id v19 = v6;
    v20 = self;
    id v21 = v7;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(v9, block);

    uint64_t v12 = v19;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5A4D4;
    v15[3] = &unk_D22F0;
    v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    id v13 = v7;
    id v14 = v6;
    dispatch_async(v9, v15);

    uint64_t v12 = v16;
  }
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (unint64_t)numRandomBooks
{
  return self->_numRandomBooks;
}

- (void)setNumRandomBooks:(unint64_t)a3
{
  self->_numRandomBooks = a3;
}

- (unint64_t)randomBookBaseID
{
  return self->_randomBookBaseID;
}

- (void)setRandomBookBaseID:(unint64_t)a3
{
  self->_randomBookBaseID = a3;
}

- (BOOL)createSeriesContainers
{
  return self->_createSeriesContainers;
}

- (void)setCreateSeriesContainers:(BOOL)a3
{
  self->_createSeriesContainers = a3;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)profilesChecked
{
  return self->_profilesChecked;
}

- (void)setProfilesChecked:(BOOL)a3
{
  self->_profilesChecked = a3;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end