@interface THApplePubAssetPlugin
+ (id)sharedPlugin;
- (AEAnnotationProvider)sharedAnnotationProvider;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5;
- (BOOL)isDeviceSupported;
- (BOOL)shouldCheckMovieValidityOnImport;
- (BOOL)supportsAssetAtURL:(id)a3 quickCheck:(BOOL)a4;
- (NSMutableDictionary)bookCoverDescriptionCache;
- (NSMutableSet)currentBookViewControllers;
- (THApplePubAssetPlugin)init;
- (id)_helper:(id)a3 assetInfo:(id)a4 viewControllerForBookDescription:(id)a5 options:(id)a6 error:(id *)a7;
- (id)assetHelperForAsset:(id)a3;
- (id)assetInfoForURL:(id)a3;
- (id)associatedAssetType;
- (id)coverDescriptionForAsset:(id)a3;
- (id)coverDescriptionForURL:(id)a3;
- (id)descriptionForAsset:(id)a3;
- (id)existingBookViewControllerForDocumentRoot:(id)a3;
- (id)helper:(id)a3 coverImageForURL:(id)a4;
- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5;
- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6;
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)supportedFileExtensions;
- (id)supportedUrlSchemes;
- (id)uniqueIdForURL:(id)a3;
- (id)viewControllerForAsset:(id)a3 bookDescription:(id)a4 options:(id)a5;
- (id)viewControllerForAsset:(id)a3 options:(id)a4;
- (id)viewControllerForBook:(id)a3;
- (void)_helper:(id)a3 canRefetch:(BOOL)a4 viewControllerWithOptions:(id)a5 completion:(id)a6;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)didCloseBook:(id)a3;
- (void)didEnterBackground:(id)a3;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4;
- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5;
- (void)presentAlertController:(id)a3 options:(id)a4 animated:(BOOL)a5;
- (void)setBookCoverDescriptionCache:(id)a3;
- (void)setCurrentBookViewControllers:(id)a3;
- (void)setSharedAnnotationProvider:(id)a3;
- (void)willCloseBook:(id)a3;
- (void)willOpenBook:(id)a3;
@end

@implementation THApplePubAssetPlugin

+ (id)sharedPlugin
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7DAB4;
  block[3] = &unk_458270;
  block[4] = a1;
  if (qword_5731E0 != -1) {
    dispatch_once(&qword_5731E0, block);
  }
  v2 = (void *)qword_5731D8;

  return v2;
}

- (THApplePubAssetPlugin)init
{
  v8.receiver = self;
  v8.super_class = (Class)THApplePubAssetPlugin;
  v2 = [(THApplicationDelegate *)&v8 init];
  if (v2)
  {
    +[TSKApplicationDelegate setSurrogateDelegate:v2];
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    TSWPForegroundInit();
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentBookViewControllers = v2->_currentBookViewControllers;
    v2->_currentBookViewControllers = v5;
  }
  return v2;
}

- (void)dealloc
{
  if ([(NSMutableSet *)self->_currentBookViewControllers count])
  {
    v3 = +[TSUAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THApplePubAssetPlugin dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplePubAssetPlugin.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:93 description:@"Current book not closed."];
  }
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)THApplePubAssetPlugin;
  [(THApplicationDelegate *)&v7 dealloc];
}

- (BOOL)shouldCheckMovieValidityOnImport
{
  return 0;
}

- (id)viewControllerForBook:(id)a3
{
  id v3 = a3;
  v4 = [[THBookViewController alloc] initWithBookDescription:v3];

  return v4;
}

- (id)existingBookViewControllerForDocumentRoot:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableSet *)self->_currentBookViewControllers allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 documentViewController];
        id v11 = [v10 documentRoot];

        if (v11 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)willOpenBook:(id)a3
{
}

- (void)willCloseBook:(id)a3
{
  id v9 = a3;
  id v4 = [v9 bookDescription];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 asset];
    uint64_t v7 = [v6 url];

    if (v7)
    {
      objc_super v8 = self;
      objc_sync_enter(v8);
      [(THApplicationDelegate *)v8 uncacheBookDescriptionForURL:v7];
      objc_sync_exit(v8);
    }
  }
  [(NSMutableSet *)self->_currentBookViewControllers removeObject:v9];
}

- (void)didCloseBook:(id)a3
{
}

- (id)uniqueIdForURL:(id)a3
{
  id v3 = [a3 path];
  id v4 = THUniqueIdForPath(v3);

  return v4;
}

- (id)descriptionForAsset:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_opt_class();
  id v6 = [v4 url];
  uint64_t v7 = [(THApplicationDelegate *)v5 cachedBookDescriptionForURL:v6];
  objc_super v8 = TSUDynamicCast();

  if (v8)
  {
    id v9 = [v8 asset];
    v10 = [v9 assetID];
    id v11 = [v4 assetID];
    unsigned __int8 v12 = [v10 isEqual:v11];

    if (v12) {
      goto LABEL_9;
    }

    long long v13 = [v4 url];
    [(THApplicationDelegate *)v5 uncacheBookDescriptionForURL:v13];
  }
  long long v14 = [v4 url];
  long long v15 = [v14 path];
  int v16 = THIsApplePubAtPath(v15);

  if (v16)
  {
    [(THApplicationDelegate *)v5 clearBookDescriptionCache];
    objc_opt_class();
    v17 = TSUDynamicCast();
    objc_super v8 = +[THBookDescription descriptionWithAsset:v17];
    if (v8)
    {
      v18 = [v4 url];
      [(THApplicationDelegate *)v5 cacheBookDescription:v8 forURL:v18];
    }
  }
  else
  {
    objc_super v8 = 0;
  }
LABEL_9:
  objc_sync_exit(v5);

  return v8;
}

- (id)coverDescriptionForURL:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_opt_class();
  id v6 = [(NSMutableDictionary *)v5->mBookCoverDescriptionCache objectForKey:v4];
  uint64_t v7 = TSUDynamicCast();

  if (!v7)
  {
    objc_super v8 = [v4 path];
    int v9 = THIsApplePubAtPath(v8);

    if (v9)
    {
      [(NSMutableDictionary *)v5->mBookCoverDescriptionCache removeAllObjects];
      uint64_t v7 = +[THBookCoverDescription descriptionWithURL:v4];
      if (v7) {
        [(NSMutableDictionary *)v5->mBookCoverDescriptionCache setObject:v7 forKey:v4];
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)coverDescriptionForAsset:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_opt_class();
  mBookCoverDescriptionCache = v5->mBookCoverDescriptionCache;
  uint64_t v7 = [v4 url];
  objc_super v8 = [(NSMutableDictionary *)mBookCoverDescriptionCache objectForKey:v7];
  int v9 = TSUDynamicCast();

  if (v9)
  {
    v10 = [v9 asset];
    id v11 = [v10 assetID];
    unsigned __int8 v12 = [v4 assetID];
    unsigned __int8 v13 = [v11 isEqual:v12];

    if (v13) {
      goto LABEL_8;
    }

    long long v14 = [v4 url];
    [(THApplicationDelegate *)v5 uncacheBookDescriptionForURL:v14];
  }
  long long v15 = [v4 url];
  int v16 = [v15 path];
  int v17 = THIsApplePubAtPath(v16);

  if (v17)
  {
    [(THApplicationDelegate *)v5 clearBookDescriptionCache];
    v18 = [v4 url];
    v19 = [v4 assetID];
    int v9 = +[THBookCoverDescription descriptionWithURL:v18 assetID:v19];

    if (v9)
    {
      v20 = v5->mBookCoverDescriptionCache;
      v21 = [v4 url];
      [(NSMutableDictionary *)v20 setObject:v9 forKey:v21];
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_8:
  objc_sync_exit(v5);

  return v9;
}

- (BOOL)supportsAssetAtURL:(id)a3 quickCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if (v4)
    {
      objc_super v8 = [v6 pathExtension];
      if ([v8 caseInsensitiveCompare:@"ibooks"]) {
        LOBYTE(v9) = [v8 caseInsensitiveCompare:@"epub"] == 0;
      }
      else {
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      objc_super v8 = [(THApplePubAssetPlugin *)self assetInfoForURL:v6];
      BOOL v9 = v8 != 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)assetInfoForURL:(id)a3
{
  id v3 = [(THApplicationDelegate *)self descriptionForURL:a3];
  BOOL v4 = [v3 asset];

  return v4;
}

- (id)assetHelperForAsset:(id)a3
{
  id v4 = a3;
  v5 = [(THApplePubAssetPlugin *)self descriptionForAsset:v4];
  id v6 = [(THApplePubAssetPlugin *)self coverDescriptionForAsset:v4];

  uint64_t v7 = [[THAssetHelper alloc] initWithBookDescription:v5 bookCoverDescription:v6];

  return v7;
}

- (id)viewControllerForAsset:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(THApplePubAssetPlugin *)self descriptionForAsset:v7];
  [v8 loadMetadata];
  BOOL v9 = [(THApplePubAssetPlugin *)self viewControllerForAsset:v7 bookDescription:v8 options:v6];

  return v9;
}

- (id)viewControllerForAsset:(id)a3 bookDescription:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(THApplePubAssetPlugin *)self isDeviceSupported])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_7E7FC;
    v11[3] = &unk_458298;
    id v12 = v7;
    +[THPerformanceRegressionLogger logEventWithBlock:v11];
    BOOL v9 = [(THApplePubAssetPlugin *)self viewControllerForBook:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  sharedAnnotationProvider = self->_sharedAnnotationProvider;
  if (!sharedAnnotationProvider)
  {
    id v4 = (AEAnnotationProvider *)objc_alloc_init((Class)AEAnnotationProvider);
    v5 = self->_sharedAnnotationProvider;
    self->_sharedAnnotationProvider = v4;

    [(AEAnnotationProvider *)self->_sharedAnnotationProvider loadCoreData];
    sharedAnnotationProvider = self->_sharedAnnotationProvider;
  }

  return sharedAnnotationProvider;
}

- (BOOL)isDeviceSupported
{
  if (isPad()) {
    return 1;
  }

  return isPhone();
}

- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5
{
  return -[THApplePubAssetPlugin helper:coverImageForURL:](self, "helper:coverImageForURL:", a3, a4, a5.width, a5.height);
}

- (id)helper:(id)a3 coverImageForURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = TSUDynamicCast();

  if (v8
    || (objc_opt_class(),
        [(THApplePubAssetPlugin *)self helperForURL:v6 withOptions:0],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        TSUDynamicCast(),
        id v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    v10 = [v8 helperCoverImage];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_helper:(id)a3 assetInfo:(id)a4 viewControllerForBookDescription:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(THApplePubAssetPlugin *)self isDeviceSupported])
  {
    if (![(THApplePubAssetPlugin *)self isDeviceSupported])
    {
      if (a7)
      {
        v26 = [v11 url];
        v27 = +[NSDictionary dictionaryWithObject:v26 forKey:AssetEngineErrorAssetURLUserInfoKey];

        *a7 = +[NSError errorWithDomain:AssetEngineErrorDomain code:1003 userInfo:v27];
      }
      v28 = THBundle();
      v29 = [v28 localizedStringForKey:@"Device not supported" value:&stru_46D7E8 table:0];
      v30 = THBundle();
      v31 = [v30 localizedStringForKey:@"This document can only be experienced on iPad." value:&stru_46D7E8 table:0];
      long long v14 = +[UIAlertController alertControllerWithTitle:v29 message:v31 preferredStyle:1];

      v32 = THBundle();
      v33 = [v32 localizedStringForKey:@"OK" value:&stru_46D7E8 table:0];
      v34 = +[UIAlertAction actionWithTitle:v33 style:1 handler:0];
      [v14 addAction:v34];

      [(THApplePubAssetPlugin *)self presentAlertController:v14 options:v13 animated:1];
      v25 = 0;
      goto LABEL_18;
    }
LABEL_8:
    v25 = 0;
    goto LABEL_19;
  }
  if (!v12) {
    goto LABEL_8;
  }
  long long v14 = [v13 objectForKey:AEHelperNumberIsPreorderKey];
  [v12 setIsPreorderBook:[v14 BOOLValue]];
  long long v15 = [v12 requiredVersion];
  int v16 = v15;
  if (!v15 || ([v15 floatValue], v17 <= 2.2))
  {
    if ([v12 containsUnknownContentVersions])
    {
      v46 = THBundle();
      v35 = [v46 localizedStringForKey:@"New Features" value:&stru_46D7E8 table:0];
      v36 = THBundle();
      [v36 localizedStringForKey:@"This book has new interactive features. For the best reading experience, you’ll need to update Apple Books.", &stru_46D7E8, 0 value table];
      v37 = v48 = v16;
      v38 = +[UIAlertController alertControllerWithTitle:v35 message:v37 preferredStyle:1];

      v39 = THBundle();
      v40 = [v39 localizedStringForKey:@"OK" value:&stru_46D7E8 table:0];
      v41 = +[UIAlertAction actionWithTitle:v40 style:1 handler:0];
      [v38 addAction:v41];

      int v16 = v48;
      [(THApplePubAssetPlugin *)self presentAlertController:v38 options:v13 animated:1];
    }
    v25 = [(THApplePubAssetPlugin *)self viewControllerForAsset:v11 bookDescription:v12 options:0];
    if (!a7) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  v45 = THBundle();
  v18 = [v45 localizedStringForKey:@"New Features" value:&stru_46D7E8 table:0];
  v19 = THBundle();
  [v19 localizedStringForKey:@"This book has new interactive features. To open it, you’ll need to update Apple Books.", &stru_46D7E8, 0 value table];
  v20 = v47 = v16;
  v21 = +[UIAlertController alertControllerWithTitle:v18 message:v20 preferredStyle:1];

  v22 = THBundle();
  v23 = [v22 localizedStringForKey:@"OK" value:&stru_46D7E8 table:0];
  v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:0];
  [v21 addAction:v24];

  int v16 = v47;
  [(THApplePubAssetPlugin *)self presentAlertController:v21 options:v13 animated:1];

  v25 = 0;
  if (a7)
  {
LABEL_15:
    if (!v25)
    {
      v42 = [v11 url];
      v43 = +[NSDictionary dictionaryWithObject:v42 forKey:AssetEngineErrorAssetURLUserInfoKey];

      *a7 = +[NSError errorWithDomain:AssetEngineErrorDomain code:1000 userInfo:v43];
    }
  }
LABEL_17:

LABEL_18:
LABEL_19:

  return v25;
}

- (void)presentAlertController:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  uint64_t v6 = BCTransactionOptionsTransactionKey;
  id v7 = a3;
  id v9 = [a4 objectForKeyedSubscript:v6];
  if (!v9) {
    BCReportAssertionFailureWithMessage();
  }
  id v8 = +[AEAssetEngine appInfoMgr];
  [v8 presentViewController:v7 transaction:v9 animated:1 completion:0];
}

- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  objc_opt_class();
  id v13 = TSUDynamicCast();

  if (v13)
  {
    long long v14 = [v13 helperMetadataForKey:v10 needsCoordination:v6];
    goto LABEL_13;
  }
  long long v15 = [(THApplicationDelegate *)self descriptionForURL:v11];
  if (!v15) {
    goto LABEL_11;
  }
  if (![v10 isEqual:AEHelperStringMetadataAuthorKey])
  {
    if ([v10 isEqual:AEHelperStringMetadataTitleKey])
    {
      uint64_t v16 = [v15 bookTitle];
      goto LABEL_10;
    }
    if ([v10 isEqual:AEHelperStringMetadataGenreKey])
    {
      uint64_t v16 = [v15 genre];
      goto LABEL_10;
    }
LABEL_11:
    long long v14 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = [v15 bookAuthor];
LABEL_10:
  long long v14 = (void *)v16;
LABEL_12:

LABEL_13:

  return v14;
}

- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THApplicationDelegate *)self descriptionForURL:v7];
  id v9 = [v8 contextDirectoryPath];
  if (v9)
  {
    char v13 = 0;
    id v10 = +[NSFileManager defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:v9 isDirectory:&v13];
    if (v13) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = 0;
    }
    if (v12 == 1) {
      [v10 removeItemAtPath:v9 error:0];
    }
  }
}

- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5
{
}

- (void)_helper:(id)a3 canRefetch:(BOOL)a4 viewControllerWithOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  long long v14 = [v13 url];
  long long v15 = +[NSFileAccessIntent readingIntentWithURL:v14 options:1];
  uint64_t v16 = objc_opt_new();
  v30 = v15;
  float v17 = +[NSArray arrayWithObjects:&v30 count:1];
  v18 = objc_opt_new();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_7F508;
  v23[3] = &unk_4583B0;
  id v27 = v11;
  id v28 = v12;
  id v24 = v14;
  v25 = self;
  id v26 = v13;
  BOOL v29 = a4;
  id v19 = v11;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  [v16 coordinateAccessWithIntents:v17 queue:v18 byAccessor:v23];
}

- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  objc_opt_class();
  id v8 = TSUDynamicCast();

  if (v8) {
    unsigned __int8 v9 = [v8 helperValidateBookAuthorizationWithError:a4 needsCoordination:v5];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(NSMutableSet *)self->_currentBookViewControllers allObjects];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) documentViewController];
        unsigned __int8 v9 = [v8 documentRoot];

        id v10 = [v9 userDataManager];
        id v11 = [v9 moc];
        [v10 save:v11];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = +[TSUFlushingManager sharedManager];
  [v3 didEnterBackground];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = +[TSUFlushingManager sharedManager];
  [v3 willEnterForeground];
}

- (void)didReceiveMemoryWarning:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  [(THApplePubAssetPlugin *)self applicationDidReceiveMemoryWarning:v4];
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(THApplicationDelegate *)v4 clearBookDescriptionCache];
  objc_sync_exit(v4);
}

- (void)didEnterBackground:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(THApplicationDelegate *)v4 clearBookDescriptionCache];
  objc_sync_exit(v4);
}

- (id)associatedAssetType
{
  return @"application/ibooks";
}

- (id)supportedFileExtensions
{
  v4[0] = @"ibooks";
  v4[1] = @"epub";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)supportedUrlSchemes
{
  return +[NSArray array];
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_80700;
  v11[3] = &unk_458298;
  id v8 = v6;
  id v12 = v8;
  +[THPerformanceRegressionLogger logEventWithBlock:v11];
  if ([(THApplePubAssetPlugin *)self supportsAssetAtURL:v8 quickCheck:1]) {
    unsigned __int8 v9 = [[THAEHelper alloc] initWithURL:v8 withOptions:v7];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSMutableDictionary)bookCoverDescriptionCache
{
  return self->mBookCoverDescriptionCache;
}

- (void)setBookCoverDescriptionCache:(id)a3
{
}

- (void)setSharedAnnotationProvider:(id)a3
{
}

- (NSMutableSet)currentBookViewControllers
{
  return self->_currentBookViewControllers;
}

- (void)setCurrentBookViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBookViewControllers, 0);
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);

  objc_storeStrong((id *)&self->mBookCoverDescriptionCache, 0);
}

@end