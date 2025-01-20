@interface FRFlintDataProvider
- (BOOL)areFontsLocallyAvailable;
- (BOOL)isDocumentLocallyAvailable;
- (BOOL)isThumbnailAvailableInDocument;
- (BOOL)shouldReturnThumbnail;
- (FCANFContent)anfContent;
- (FCAssetHandle)thumbnailAssetHandle;
- (FCCloudContext)cloudContext;
- (FCFlintResourceManager)resourceManager;
- (FCHeadlineProviding)headline;
- (FRFlintDataLoadingGroup)loadingGroup;
- (FRFlintDataProvider)initWithANFContent:(id)a3 headline:(id)a4 resourceManager:(id)a5 cloudContext:(id)a6 embedConfigurationManager:(id)a7;
- (FRFlintEmbedConfigurationManager)embedConfigurationManager;
- (NFUnfairLock)resourcesLock;
- (NSArray)requiredResourceIDs;
- (NSError)error;
- (NSMutableArray)fontResources;
- (NSMutableArray)fontsToRegister;
- (NSMutableDictionary)linkedHeadlines;
- (NSMutableDictionary)resourcesByID;
- (NSOperationQueue)operationQueue;
- (NUArticleResourceURLTranslator)resourceURLTranslator;
- (SXContext)context;
- (UIImage)thumbnailImage;
- (id)_loadAssetURLsWithCompletionBlock:(id)a3;
- (id)_loadAssetsWithCompletionBlock:(id)a3;
- (id)_loadFontsWithCompletionBlock:(id)a3;
- (id)_loadJSONWithCompletionBlock:(id)a3;
- (id)_loadLinkedContentWithCompletionBlock:(id)a3;
- (id)_resourceIDFromResourceURL:(id)a3;
- (id)fallbackResourceForImageRequest:(id)a3 originalResource:(id)a4;
- (id)headlineForIdentifier:(id)a3;
- (id)imageResourceResponseForFileURL:(id)a3 perserveColorSpace:(BOOL)a4 withSize:(CGSize)a5 andQuality:(unint64_t)a6;
- (id)loadAssetURLsWithCompletionBlock:(id)a3;
- (id)loadAssetsWithCompletionBlock:(id)a3;
- (id)loadContextWithCompletionBlock:(id)a3;
- (id)loadFontsWithCompletionBlock:(id)a3;
- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4;
- (id)loadJSONWithCompletionBlock:(id)a3;
- (id)loadLinkedContentWithCompletionBlock:(id)a3;
- (id)translateURL:(id)a3;
- (int64_t)relativePriority;
- (void)dealloc;
- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5;
- (void)initializeLoadingGroup;
- (void)resetFailedDownloads;
- (void)setCloudContext:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentRelativePriority:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setLinkedHeadlines:(id)a3;
- (void)setLoadingGroup:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setRequiredResourceIDs:(id)a3;
- (void)setShouldReturnThumbnail:(BOOL)a3;
- (void)setThumbnailAssetHandle:(id)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation FRFlintDataProvider

- (FRFlintDataProvider)initWithANFContent:(id)a3 headline:(id)a4 resourceManager:(id)a5 cloudContext:(id)a6 embedConfigurationManager:(id)a7
{
  id v34 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000772A0();
  }
  v35.receiver = self;
  v35.super_class = (Class)FRFlintDataProvider;
  v17 = [(FRFlintDataProvider *)&v35 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_anfContent, a3);
    objc_storeStrong((id *)&v18->_headline, a4);
    objc_storeStrong((id *)&v18->_resourceManager, a5);
    objc_storeStrong((id *)&v18->_embedConfigurationManager, a7);
    id v19 = objc_alloc((Class)NUArticleResourceURLTranslator);
    v20 = [v15 appConfigurationManager];
    v21 = (NUArticleResourceURLTranslator *)[v19 initWithAppConfigurationManager:v20];
    resourceURLTranslator = v18->_resourceURLTranslator;
    v18->_resourceURLTranslator = v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v23;

    [(NSOperationQueue *)v18->_operationQueue setMaxConcurrentOperationCount:2];
    [(NSOperationQueue *)v18->_operationQueue setQualityOfService:17];
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourcesByID = v18->_resourcesByID;
    v18->_resourcesByID = v25;

    v27 = (NFUnfairLock *)[objc_alloc((Class)NFUnfairLock) initWithOptions:1];
    resourcesLock = v18->_resourcesLock;
    v18->_resourcesLock = v27;

    uint64_t v29 = +[NSMutableArray array];
    fontResources = v18->_fontResources;
    v18->_fontResources = (NSMutableArray *)v29;

    uint64_t v31 = +[NSMutableArray array];
    fontsToRegister = v18->_fontsToRegister;
    v18->_fontsToRegister = (NSMutableArray *)v31;

    objc_storeStrong((id *)&v18->_cloudContext, a6);
    [(FRFlintDataProvider *)v18 initializeLoadingGroup];
  }

  return v18;
}

- (void)initializeLoadingGroup
{
  id v9 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadJSONWithCompletionBlock:"];
  id v3 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadFontsWithCompletionBlock:"];
  id v4 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadAssetURLsWithCompletionBlock:"];
  id v5 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadAssetsWithCompletionBlock:"];
  id v6 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadLinkedContentWithCompletionBlock:"];
  v7 = [[FRFlintDataLoadingGroup alloc] initWithLoadJSONOnce:v9 loadFontsOnce:v3 loadAssetURLsOnce:v4 loadAssetsOnce:v5 loadLinkedContentOnce:v6];
  loadingGroup = self->_loadingGroup;
  self->_loadingGroup = v7;
}

- (void)dealloc
{
  id v3 = [(FRFlintDataProvider *)self resourcesLock];
  [v3 lock];

  id v4 = [(FRFlintDataProvider *)self fontResources];
  id v5 = [v4 copy];

  id v6 = [(FRFlintDataProvider *)self resourcesLock];
  [v6 unlock];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 fileURL];
          +[FRFont unregisterFontWithURL:v13];
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v14.receiver = self;
  v14.super_class = (Class)FRFlintDataProvider;
  [(FRFlintDataProvider *)&v14 dealloc];
}

- (id)loadContextWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10004A240;
  v30[3] = &unk_1000C5680;
  id v7 = v6;
  uint64_t v31 = v7;
  id v8 = [(FRFlintDataProvider *)self loadJSONWithCompletionBlock:v30];
  dispatch_group_enter(v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004A248;
  v28[3] = &unk_1000C56D0;
  v28[4] = self;
  id v9 = v7;
  uint64_t v29 = v9;
  uint64_t v10 = [(FRFlintDataProvider *)self loadFontsWithCompletionBlock:v28];
  dispatch_group_enter(v9);
  v11 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    id v13 = [(FRFlintDataProvider *)self embedConfigurationManager];
    *(_DWORD *)buf = 134218240;
    v33 = self;
    __int16 v34 = 2048;
    objc_super v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%p will fetch embed configuration from manager=%p", buf, 0x16u);
  }
  objc_super v14 = [(FRFlintDataProvider *)self embedConfigurationManager];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10004A4E4;
  v26[3] = &unk_1000C87F0;
  v26[4] = self;
  long long v15 = v9;
  v27 = v15;
  [v14 fetchEmbedConfigurationWithCompletion:v26];

  dispatch_group_enter(v15);
  long long v16 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%p will fetch linked content", buf, 0xCu);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004A594;
  v24[3] = &unk_1000C56D0;
  v24[4] = self;
  long long v17 = v15;
  v25 = v17;
  id v18 = [(FRFlintDataProvider *)self loadLinkedContentWithCompletionBlock:v24];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A644;
  block[3] = &unk_1000C5BF8;
  block[4] = self;
  id v23 = v4;
  id v19 = v4;
  dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, block);
  if (v8) {
    [v5 addObject:v8];
  }
  if (v10) {
    [v5 addObject:v10];
  }
  v20 = +[FCGroupCancelHandler groupCancelHandlerWithCancelHandlers:v5];

  return v20;
}

- (id)loadJSONWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FRFlintDataProvider *)self loadingGroup];
  id v6 = [v5 loadJSONOnce];
  id v7 = [v6 executeWithCompletionHandler:v4];

  return v7;
}

- (id)loadFontsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FRFlintDataProvider *)self loadingGroup];
  id v6 = [v5 loadFontsOnce];
  id v7 = FCDispatchQueueForQualityOfService();
  id v8 = [v6 executeWithCallbackQueue:v7 completionHandler:v4];

  return v8;
}

- (id)loadAssetURLsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FRFlintDataProvider *)self loadingGroup];
  id v6 = [v5 loadJSONOnce];
  unsigned int v7 = [v6 finishedExecuting];

  if (v7)
  {
    id v8 = [v5 loadAssetURLsOnce];
    id v9 = [v8 executeWithCompletionHandler:v4];
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    id v9 = 0;
  }

  return v9;
}

- (id)loadAssetsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100018B00;
  v16[4] = sub_100018A08;
  id v17 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004AA80;
  v12[3] = &unk_1000C8818;
  objc_copyWeak(&v15, &location);
  id v5 = v4;
  id v13 = v5;
  objc_super v14 = v16;
  [(FRFlintDataProvider *)self loadAssetURLsWithCompletionBlock:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004AB80;
  v9[3] = &unk_1000C72E0;
  v11 = v16;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v6;
  unsigned int v7 = +[FCCancelHandler cancelHandlerWithBlock:v9];

  objc_destroyWeak(&v15);
  _Block_object_dispose(v16, 8);

  objc_destroyWeak(&location);

  return v7;
}

- (id)loadLinkedContentWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FRFlintDataProvider *)self loadingGroup];
  id v6 = [v5 loadLinkedContentOnce];
  unsigned int v7 = [v6 executeWithCompletionHandler:v4];

  return v7;
}

- (void)resetFailedDownloads
{
  +[NSThread isMainThread];
  id v3 = [(FRFlintDataProvider *)self loadingGroup];
  id v4 = [v3 loadJSONOnce];
  unsigned int v5 = [v4 finishedExecutingWithFailure];

  id v6 = [v3 loadFontsOnce];
  unsigned int v7 = [v6 finishedExecutingWithFailure];

  id v8 = [v3 loadAssetURLsOnce];
  unsigned int v9 = [v8 finishedExecutingWithFailure];

  id v10 = [v3 loadAssetsOnce];
  unsigned int v11 = [v10 finishedExecutingWithFailure];

  v12 = [v3 loadLinkedContentOnce];
  unsigned int v13 = [v12 finishedExecutingWithFailure];

  if ((v5 & 1) == 0 && (v7 & 1) == 0 && (v9 & 1) == 0 && !v11) {
    goto LABEL_17;
  }
  unsigned int v37 = v13;
  objc_super v14 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    long long v16 = [(FRFlintDataProvider *)self anfContent];
    id v17 = [v16 anfDocumentAssetHandles];
    id v18 = [v17 firstObject];
    id v19 = [v18 remoteURL];
    *(_DWORD *)buf = 134218242;
    v39 = self;
    __int16 v40 = 2112;
    v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%p retrying failed downloads for Flint article with JSON URL %@", buf, 0x16u);
  }
  v20 = [v3 loadJSONOnce];
  v21 = [v3 loadFontsOnce];
  v22 = [v3 loadAssetURLsOnce];
  id v23 = [v3 loadAssetsOnce];
  v24 = [v3 loadLinkedContentOnce];
  if (v5)
  {
    id v25 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadJSONWithCompletionBlock:"];
    v26 = v20;
    unsigned int v27 = v9;
    v28 = v23;
    id v29 = v25;

    [(FRFlintDataProvider *)self setError:0];
    v30 = v29;
    id v23 = v28;
    unsigned int v9 = v27;
    v20 = v30;
    if (!v7) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v7)
  {
LABEL_11:
    id v31 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadFontsWithCompletionBlock:"];

    v21 = v31;
  }
LABEL_12:
  if (v37)
  {
    id v32 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadLinkedContentWithCompletionBlock:"];

    v24 = v32;
  }
  if ((v5 | v9) == 1)
  {
    id v33 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadAssetURLsWithCompletionBlock:"];

    v22 = v33;
  }
  id v34 = [objc_alloc((Class)FCAsyncOnceOperation) initWithTarget:self selector:"_loadAssetsWithCompletionBlock:"];

  int64_t v35 = [(FRFlintDataProvider *)self relativePriority];
  [v20 setRelativePriority:v35];
  [v21 setRelativePriority:v35];
  [v22 setRelativePriority:v35];
  [v34 setRelativePriority:v35];
  [v24 setRelativePriority:v35];
  v36 = [[FRFlintDataLoadingGroup alloc] initWithLoadJSONOnce:v20 loadFontsOnce:v21 loadAssetURLsOnce:v22 loadAssetsOnce:v34 loadLinkedContentOnce:v24];
  [(FRFlintDataProvider *)self setLoadingGroup:v36];

LABEL_17:
}

- (void)setCurrentRelativePriority:(int64_t)a3
{
  +[NSThread isMainThread];
  [(FRFlintDataProvider *)self setRelativePriority:a3];
  unsigned int v5 = [(FRFlintDataProvider *)self loadingGroup];
  id v6 = [v5 loadJSONOnce];
  [v6 setRelativePriority:a3];

  unsigned int v7 = [(FRFlintDataProvider *)self loadingGroup];
  id v8 = [v7 loadFontsOnce];
  [v8 setRelativePriority:a3];

  unsigned int v9 = [(FRFlintDataProvider *)self loadingGroup];
  id v10 = [v9 loadAssetURLsOnce];
  [v10 setRelativePriority:a3];

  unsigned int v11 = [(FRFlintDataProvider *)self loadingGroup];
  v12 = [v11 loadAssetsOnce];
  [v12 setRelativePriority:a3];

  id v14 = [(FRFlintDataProvider *)self loadingGroup];
  unsigned int v13 = [v14 loadLinkedContentOnce];
  [v13 setRelativePriority:a3];
}

- (id)_loadJSONWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    if ([(FRFlintDataProvider *)self isDocumentLocallyAvailable]) {
      CFStringRef v7 = @"load cached";
    }
    else {
      CFStringRef v7 = @"download";
    }
    id v8 = [(FRFlintDataProvider *)self anfContent];
    unsigned int v9 = [v8 anfDocumentAssetHandles];
    id v10 = [v9 firstObject];
    unsigned int v11 = [v10 uniqueKey];
    *(_DWORD *)buf = 134218498;
    v20 = self;
    __int16 v21 = 2114;
    CFStringRef v22 = v7;
    __int16 v23 = 2114;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%p will %{public}@ JSON %{public}@", buf, 0x20u);
  }
  v12 = [(FRFlintDataProvider *)self anfContent];
  int64_t v13 = [(FRFlintDataProvider *)self relativePriority];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004B344;
  v17[3] = &unk_1000C8868;
  v17[4] = self;
  id v18 = v4;
  id v14 = v4;
  id v15 = [v12 fetchANFDocumentDataProviderWithPriority:v13 completion:v17];

  return v15;
}

- (id)_loadFontsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    unsigned int v7 = [(FRFlintDataProvider *)self areFontsLocallyAvailable];
    CFStringRef v8 = @"download";
    if (v7) {
      CFStringRef v8 = @"load cached";
    }
    *(_DWORD *)buf = 134218242;
    v24 = self;
    __int16 v25 = 2114;
    CFStringRef v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%p will %{public}@ fonts", buf, 0x16u);
  }
  unsigned int v9 = [(FRFlintDataProvider *)self anfContent];
  id v10 = [v9 fontResourceIDs];

  if ([v10 count])
  {
    unsigned int v11 = [(FRFlintDataProvider *)self resourceManager];
    int64_t v12 = [(FRFlintDataProvider *)self relativePriority];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004BA70;
    v20[3] = &unk_1000C88F8;
    v20[4] = self;
    id v21 = v10;
    id v22 = v4;
    id v13 = v4;
    id v14 = [v11 fetchFontResourcesWithIdentifiers:v21 downloadAssets:1 relativePriority:v12 completionBlock:v20];
  }
  else
  {
    id v15 = FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%p requires no fonts", buf, 0xCu);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004BD8C;
    v18[3] = &unk_1000C6E28;
    id v19 = v4;
    id v16 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

    id v14 = 0;
  }

  return v14;
}

- (id)_loadAssetURLsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FRFlintDataProvider *)self context];

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077484();
  }
  id v6 = [(FRFlintDataProvider *)self context];

  unsigned int v7 = FRArticleLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%p will load asset URLs", buf, 0xCu);
    }
    id v8 = [(FRFlintDataProvider *)self resourceManager];
    unsigned int v9 = [(FRFlintDataProvider *)self requiredResourceIDs];
    int64_t v10 = [(FRFlintDataProvider *)self relativePriority];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004C044;
    v20[3] = &unk_1000C8920;
    v20[4] = self;
    id v21 = v4;
    unsigned int v11 = [v8 fetchResourcesWithIdentifiers:v9 downloadAssets:0 relativePriority:v10 callBackQueue:&_dispatch_main_q completionBlock:v20];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR)) {
      sub_10007740C((uint64_t)self, v7);
    }
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10004C284;
    id v18 = &unk_1000C6E28;
    id v19 = v4;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004C298;
    v13[3] = &unk_1000C6E28;
    id v14 = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    unsigned int v11 = 0;
    id v8 = v19;
  }

  return v11;
}

- (id)_loadAssetsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100018B00;
  __int16 v25 = sub_100018A08;
  id v26 = 0;
  unsigned int v5 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p will download assets", buf, 0xCu);
  }
  id v6 = [(FRFlintDataProvider *)self resourcesLock];
  [v6 lock];

  unsigned int v7 = [(FRFlintDataProvider *)self resourcesByID];
  id v8 = [v7 copy];
  unsigned int v9 = (void *)v22[5];
  v22[5] = (uint64_t)v8;

  int64_t v10 = [(FRFlintDataProvider *)self resourcesLock];
  [v10 unlock];

  unsigned int v11 = [(id)v22[5] allValues];
  int64_t v12 = [v11 fc_arrayByTransformingWithBlock:&stru_1000C8940];

  id v13 = [objc_alloc((Class)FCAssetsFetchOperation) initWithAssetHandles:v12];
  [v13 setPurpose:FCOperationPurposeArticle];
  [v13 setQualityOfService:25];
  [v13 setRelativePriority:[self relativePriority]];
  id v14 = &_dispatch_main_q;
  [v13 setFetchCompletionQueue:&_dispatch_main_q];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004C60C;
  v18[3] = &unk_1000C8988;
  v20 = &v21;
  void v18[4] = self;
  id v15 = v4;
  id v19 = v15;
  [v13 setFetchCompletionBlock:v18];
  uint64_t v16 = +[NSOperationQueue fc_sharedConcurrentQueue];
  [v16 addOperation:v13];

  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)_loadLinkedContentWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FRFlintDataProvider *)self headline];
  id v6 = [v5 linkedArticleIDs];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = objc_alloc((Class)FCArticleHeadlinesFetchOperation);
    unsigned int v9 = [(FRFlintDataProvider *)self cloudContext];
    int64_t v10 = [(FRFlintDataProvider *)self headline];
    unsigned int v11 = [v10 linkedArticleIDs];
    id v12 = [v8 initWithContext:v9 articleIDs:v11 ignoreCacheForArticleIDs:0];

    [v12 setQualityOfService:17];
    [v12 setRelativePriority:1];
    [v12 setFetchCompletionQueue:&_dispatch_main_q];
    objc_initWeak(&location, self);
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10004CB44;
    id v18 = &unk_1000C89D8;
    objc_copyWeak(&v20, &location);
    id v19 = v4;
    [v12 setFetchCompletionBlock:&v15];
    id v13 = +[NSOperationQueue fc_sharedConcurrentQueue];
    [v13 addOperation:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004CAA4;
    v22[3] = &unk_1000C89B0;
    id v23 = v4;
    sub_10004CAA4((uint64_t)v22);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_resourceIDFromResourceURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 isEqualToString:@"asset"])
  {
    unsigned int v5 = [v3 host];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(FRFlintDataProvider *)self _resourceIDFromResourceURL:v8];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004CF98;
  v16[3] = &unk_1000C8A28;
  objc_copyWeak(&v21, &location);
  id v12 = v10;
  id v19 = v12;
  id v13 = v11;
  id v17 = v13;
  id v18 = self;
  id v14 = v9;
  id v20 = v14;
  id v15 = [(FRFlintDataProvider *)self loadAssetURLsWithCompletionBlock:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (id)translateURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FRFlintDataProvider *)self resourceURLTranslator];
  id v6 = [v5 translateFileURLForURL:v4];

  return v6;
}

- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  +[NSThread isMainThread];
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077564();
  }
  uint64_t v9 = +[NSMutableArray array];
  group = dispatch_group_create();
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = sub_100018B00;
  v81[4] = sub_100018A08;
  id v82 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_10004D9C8;
  v73[3] = &unk_1000C8A50;
  v75 = v81;
  v76 = &v77;
  id v45 = v8;
  id v74 = v45;
  v46 = objc_retainBlock(v73);
  unsigned __int8 v47 = [v7 qualities];
  if (([v7 qualities] & 2) != 0)
  {
    unsigned int v11 = [(FRFlintDataProvider *)self thumbnailImage];
    if (v11
      || ([(FRFlintDataProvider *)self thumbnailAssetHandle],
          (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unsigned int v10 = [(FRFlintDataProvider *)self shouldReturnThumbnail];
      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v10 = 0;
    }

    goto LABEL_12;
  }
  unsigned int v10 = 0;
LABEL_13:
  id v12 = [v7 imageIdentifier];
  id v13 = [(FRFlintDataProvider *)self context];
  id v14 = [v13 documentController];
  id v15 = [v14 metadata];
  uint64_t v16 = [v15 thumbnailImageIdentifier];
  unsigned int v17 = [v12 isEqualToString:v16];

  id v18 = [v7 URL];
  id v19 = [(FRFlintDataProvider *)self _resourceIDFromResourceURL:v18];

  id v20 = [(FRFlintDataProvider *)self resourcesByID];
  id v21 = (void *)v9;
  id v22 = [v20 objectForKey:v19];

  unsigned int v23 = [v22 isOnDisk];
  if ((v10 & v17 | v23) == 1 && !*((unsigned char *)v78 + 24))
  {
    [v7 size];
    double v25 = v24;
    double v27 = v26;
    if (v23)
    {
      v28 = [v22 fileURL];
      uint64_t v29 = 4;
    }
    else
    {
      v28 = 0;
      uint64_t v29 = 2;
    }
    unsigned int v30 = +[FRAnimationHelpers synchronousImageLoadingEnabled];
    dispatch_group_enter(group);
    if (v30)
    {
      if (!*((unsigned char *)v78 + 24))
      {
        if ((v29 & 2) != 0)
        {
          id v31 = objc_alloc_init((Class)SXImageResourceResponse);
          id v33 = [(FRFlintDataProvider *)self thumbnailImage];
          [v31 setImage:v33];

          [v31 setImageQuality:v29];
        }
        else
        {
          -[FRFlintDataProvider imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:](self, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", v28, [v7 preserveColorspace], v29, v25, v27);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v31) {
          [v21 addObject:v31];
        }
        id v34 = [v7 loadingBlock];

        if (v34)
        {
          int64_t v35 = [v7 loadingBlock];
          ((void (**)(void, id))v35)[2](v35, v31);
        }
      }
      dispatch_group_leave(group);
    }
    else
    {
      id v32 = [(FRFlintDataProvider *)self operationQueue];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10004DA3C;
      v64[3] = &unk_1000C8A78;
      v69 = &v77;
      uint64_t v70 = v29;
      v64[4] = self;
      id v65 = v28;
      id v66 = v7;
      double v71 = v25;
      double v72 = v27;
      id v67 = v21;
      v68 = group;
      [v32 addOperationWithBlock:v64];
    }
  }
  dispatch_group_enter(group);
  objc_initWeak(&location, self);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10004DC90;
  v52[3] = &unk_1000C8B18;
  objc_copyWeak(&v60, &location);
  BOOL v61 = (v47 & 4) != 0;
  char v62 = v23;
  id v36 = v19;
  v58 = &v77;
  v59 = v81;
  id v53 = v36;
  v54 = self;
  id v37 = v7;
  id v55 = v37;
  id v38 = v21;
  id v56 = v38;
  v39 = group;
  v57 = v39;
  id v40 = [(FRFlintDataProvider *)self loadAssetURLsWithCompletionBlock:v52];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E1FC;
  block[3] = &unk_1000C5BF8;
  id v41 = v45;
  id v51 = v41;
  id v42 = v38;
  id v50 = v42;
  dispatch_group_notify(v39, (dispatch_queue_t)&_dispatch_main_q, block);
  id v43 = [v46 copy];

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(v81, 8);

  return v43;
}

- (id)imageResourceResponseForFileURL:(id)a3 perserveColorSpace:(BOOL)a4 withSize:(CGSize)a5 andQuality:(unint64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  unsigned int v10 = +[NSData dataWithContentsOfURL:v9];
  unsigned int v11 = +[SXImageDecodingTools sharedInstance];
  unsigned int v12 = [v11 dataIsAnimatedImage:v10];

  id v13 = +[SXImageDecodingTools sharedInstance];
  id v14 = v13;
  if (v12)
  {
    id v15 = [v13 loadAnimatedImageFromImageData:v10 size:width, height];

    id v16 = objc_alloc_init((Class)SXAnimatedImageResourceResponse);
    [v16 setAnimatedImage:v15];
  }
  else
  {
    id v15 = [v13 imageFromData:v10 size:width, height];

    id v16 = objc_alloc_init((Class)SXImageResourceResponse);
    [v16 setImage:v15];
  }
  [v16 setFileURL:v9];

  [v16 setImageQuality:a6];

  return v16;
}

- (id)fallbackResourceForImageRequest:(id)a3 originalResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FRFlintDataProvider *)self cloudContext];
  id v9 = [v8 networkReachability];
  unsigned int v10 = [v9 isNetworkReachable];

  if (v10)
  {
    unsigned int v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    id v32 = sub_10004E5D8;
    id v33 = &unk_1000C7918;
    id v34 = v7;
    id v11 = v34;
    id v12 = v11;
  }
  else
  {
    id v13 = [(FRFlintDataProvider *)self context];
    id v14 = [v13 documentController];
    id v25 = v6;
    id v15 = [v6 imageIdentifier];
    id v11 = [v14 allResourcesForImageIdentifier:v15];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = [v11 reverseObjectEnumerator];
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [*(id *)(*((void *)&v26 + 1) + 8 * i) URL];
          id v22 = [(FRFlintDataProvider *)self _resourceIDFromResourceURL:v21];

          unsigned int v23 = [(FRFlintDataProvider *)self resourceManager];
          id v12 = [v23 cachedResourceWithIdentifier:v22];

          if (v12 && ([v12 isOnDisk] & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v12 = v7;
LABEL_14:
    id v6 = v25;
  }

  return v12;
}

- (BOOL)isDocumentLocallyAvailable
{
  v2 = [(FRFlintDataProvider *)self anfContent];
  unsigned __int8 v3 = [v2 isANFDocumentCached];

  return v3;
}

- (BOOL)areFontsLocallyAvailable
{
  unsigned __int8 v3 = [(FRFlintDataProvider *)self anfContent];
  uint64_t v4 = [v3 fontResourceIDs];
  unsigned int v5 = (void *)v4;
  id v6 = &__NSArray0__struct;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [(FRFlintDataProvider *)self resourceManager];
  id v9 = [v8 cachedResourcesWithIdentifiers:v7];

  id v10 = [v9 count];
  id v11 = [v7 count];

  if (v10 == v11) {
    unsigned __int8 v12 = [v9 fc_allObjectsPassTest:&stru_1000C8B58];
  }
  else {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)isThumbnailAvailableInDocument
{
  v2 = [(FRFlintDataProvider *)self context];
  unsigned __int8 v3 = [v2 documentController];
  uint64_t v4 = [v3 componentIdentifierUsingThumbnail];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)headlineForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FRFlintDataProvider *)self headline];
  id v6 = [v5 articleID];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = [(FRFlintDataProvider *)self headline];
  }
  else
  {
    id v9 = [(FRFlintDataProvider *)self linkedHeadlines];
    id v8 = [v9 objectForKey:v4];
  }

  return v8;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (FCAssetHandle)thumbnailAssetHandle
{
  return self->_thumbnailAssetHandle;
}

- (void)setThumbnailAssetHandle:(id)a3
{
}

- (BOOL)shouldReturnThumbnail
{
  return self->_shouldReturnThumbnail;
}

- (void)setShouldReturnThumbnail:(BOOL)a3
{
  self->_shouldReturnThumbnail = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSArray)requiredResourceIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequiredResourceIDs:(id)a3
{
}

- (NFUnfairLock)resourcesLock
{
  return self->_resourcesLock;
}

- (NSMutableDictionary)resourcesByID
{
  return self->_resourcesByID;
}

- (SXContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NUArticleResourceURLTranslator)resourceURLTranslator
{
  return self->_resourceURLTranslator;
}

- (NSMutableArray)fontsToRegister
{
  return self->_fontsToRegister;
}

- (NSMutableArray)fontResources
{
  return self->_fontResources;
}

- (FRFlintDataLoadingGroup)loadingGroup
{
  return (FRFlintDataLoadingGroup *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLoadingGroup:(id)a3
{
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
}

- (NSMutableDictionary)linkedHeadlines
{
  return self->_linkedHeadlines;
}

- (void)setLinkedHeadlines:(id)a3
{
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (FRFlintEmbedConfigurationManager)embedConfigurationManager
{
  return self->_embedConfigurationManager;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_embedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_linkedHeadlines, 0);
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_storeStrong((id *)&self->_fontResources, 0);
  objc_storeStrong((id *)&self->_fontsToRegister, 0);
  objc_storeStrong((id *)&self->_resourceURLTranslator, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourcesByID, 0);
  objc_storeStrong((id *)&self->_resourcesLock, 0);
  objc_storeStrong((id *)&self->_requiredResourceIDs, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailAssetHandle, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_anfContent, 0);

  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end