@interface FRArticleNotificationArticleSource
- (FCArticle)loadedArticle;
- (FCContentContext)contentContext;
- (FRArticleNotificationArticleSource)init;
- (FRArticleNotificationArticleSource)initWithCachesDirectory:(id)a3;
- (NSURL)archiveFileURL;
- (NSURL)cachesDirectory;
- (void)dealloc;
- (void)fetchArticleWithID:(id)a3 completion:(id)a4;
- (void)setArchiveFileURL:(id)a3;
- (void)setCachesDirectory:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setLoadedArticle:(id)a3;
@end

@implementation FRArticleNotificationArticleSource

- (FRArticleNotificationArticleSource)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRArticleNotificationArticleSource init]";
    __int16 v7 = 2080;
    v8 = "FRArticleNotificationArticleSource.m";
    __int16 v9 = 1024;
    int v10 = 28;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRArticleNotificationArticleSource init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)dealloc
{
  +[FCExcerptURLProtocol unregister];
  v3.receiver = self;
  v3.super_class = (Class)FRArticleNotificationArticleSource;
  [(FRArticleNotificationArticleSource *)&v3 dealloc];
}

- (FRArticleNotificationArticleSource)initWithCachesDirectory:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100005748();
  }
  v11.receiver = self;
  v11.super_class = (Class)FRArticleNotificationArticleSource;
  v5 = [(FRArticleNotificationArticleSource *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[NSURL URLWithString:@"News" relativeToURL:v4];
    archiveFileURL = v5->_archiveFileURL;
    v5->_archiveFileURL = (NSURL *)v6;

    v8 = (NSURL *)[v4 copy];
    cachesDirectory = v5->_cachesDirectory;
    v5->_cachesDirectory = v8;
  }
  return v5;
}

- (FCContentContext)contentContext
{
  contentContext = self->_contentContext;
  if (!contentContext)
  {
    id v4 = +[FCFeldsparIDProvider sharedInstance];
    id v5 = objc_alloc((Class)FCConfigurationManager);
    uint64_t v6 = +[FCContextConfiguration defaultConfiguration];
    __int16 v7 = [(FRArticleNotificationArticleSource *)self cachesDirectory];
    id v8 = [v5 initWithContextConfiguration:v6 contentHostDirectoryFileURL:v7 feldsparIDProvider:v4];

    id v9 = objc_alloc((Class)FCContentContext);
    int v10 = +[FCContextConfiguration defaultConfiguration];
    objc_super v11 = [(FRArticleNotificationArticleSource *)self cachesDirectory];
    id v12 = +[FCNetworkReachability sharedNetworkReachability];
    id v13 = [v9 initWithConfiguration:v10 configurationManager:v8 contentHostDirectory:v11 networkBehaviorMonitor:0 networkReachability:v12 desiredHeadlineFieldOptions:82368 feedUsage:1 assetKeyManagerDelegate:0 appActivityMonitor:0 backgroundTaskable:0 pptContext:0];

    [v13 enableFlushingWithFlushingThreshold:0];
    v14 = self->_contentContext;
    self->_contentContext = (FCContentContext *)v13;

    contentContext = self->_contentContext;
  }

  return contentContext;
}

- (void)fetchArticleWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100005828();
  }
  id v8 = [(FRArticleNotificationArticleSource *)self contentContext];
  id v9 = [v8 articleController];
  int v10 = [v9 articleWithID:v6 qualityOfService:25 relativePriority:2];

  [(FRArticleNotificationArticleSource *)self setLoadedArticle:v10];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003EE8;
  v12[3] = &unk_100008300;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [v10 performBlockWhenFullyLoaded:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)setContentContext:(id)a3
{
}

- (NSURL)cachesDirectory
{
  return self->_cachesDirectory;
}

- (void)setCachesDirectory:(id)a3
{
}

- (NSURL)archiveFileURL
{
  return self->_archiveFileURL;
}

- (void)setArchiveFileURL:(id)a3
{
}

- (FCArticle)loadedArticle
{
  return self->_loadedArticle;
}

- (void)setLoadedArticle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedArticle, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end