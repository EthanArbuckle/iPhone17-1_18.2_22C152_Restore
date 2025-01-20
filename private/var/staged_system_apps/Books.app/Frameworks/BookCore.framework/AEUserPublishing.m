@interface AEUserPublishing
+ (id)p_keyForPrefix:(id)a3 storeId:(id)a4;
+ (id)sharedInstance;
- (AEUserPublishing)init;
- (BOOL)hasRecentlyTriedToFetchShortStoreURLFromNetwork;
- (BOOL)hasRecentlyTriedToFetchStoreURLFromNetwork;
- (BOOL)p_isConnectedToInternet;
- (BOOL)p_isDownloadEnabledForStoreId:(id)a3 dataSource:(id)a4;
- (BOOL)p_isLocalGenerationEnabledForStoreId:(id)a3 dataSource:(id)a4;
- (NSCache)cache;
- (OS_dispatch_queue)workQueue;
- (double)timeoutInterval;
- (id)bookInfoHTMLForStoreId:(id)a3 dataSource:(id)a4;
- (id)p_assetAuthorForStoreId:(id)a3 dataSource:(id)a4;
- (id)p_assetCategoryForStoreId:(id)a3 dataSource:(id)a4;
- (id)p_assetTitleForStoreId:(id)a3 dataSource:(id)a4;
- (id)p_downloadEmailContentForStoreId:(id)a3 dataSource:(id)a4 overrideClientVersion:(id)a5;
- (id)p_downloadedStoreUrlForStoreId:(id)a3 keyProfile:(id)a4 path:(id)a5 dataSource:(id)a6;
- (id)p_generatedEmailBodyForStoreId:(id)a3 dataSource:(id)a4;
- (id)p_storeShortURLForStoreId:(id)a3 dataSource:(id)a4;
- (id)p_storeURLForStoreId:(id)a3 dataSource:(id)a4;
- (id)storeShortURLForStoreId:(id)a3 dataSource:(id)a4;
- (id)storeURLForStoreId:(id)a3 dataSource:(id)a4;
- (id)wholeHTMLForStoreId:(id)a3 dataSource:(id)a4;
- (void)lockupProfilesForStoreIDs:(id)a3 completion:(id)a4;
- (void)productProfilesForStoreIDs:(id)a3 completion:(id)a4;
- (void)profilesForStoreIDs:(id)a3 keyProfile:(id)a4 completion:(id)a5;
- (void)setCache:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation AEUserPublishing

+ (id)p_keyForPrefix:(id)a3 storeId:(id)a4
{
  return [a3 stringByAppendingString:a4];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_173D70;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_349480 != -1) {
    dispatch_once(&qword_349480, block);
  }
  v2 = (void *)qword_349478;

  return v2;
}

- (AEUserPublishing)init
{
  v9.receiver = self;
  v9.super_class = (Class)AEUserPublishing;
  v2 = [(AEUserPublishing *)&v9 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iBooks.AEUserPublishing.workQueue", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    v2->_timeoutInterval = 2.0;
  }
  return v2;
}

- (id)bookInfoHTMLForStoreId:(id)a3 dataSource:(id)a4
{
  if (a4)
  {
    v5 = -[AEUserPublishing p_generatedEmailBodyForStoreId:dataSource:](self, "p_generatedEmailBodyForStoreId:dataSource:", a3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)wholeHTMLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 longLongValue])
  {
    v8 = [objc_opt_class() p_keyForPrefix:@"kWholeHTMLPrefix~" storeId:v6];
    objc_super v9 = [(AEUserPublishing *)self cache];
    v10 = [v9 objectForKey:v8];

    if (!v10)
    {
      if ([(AEUserPublishing *)self p_isConnectedToInternet])
      {
        v11 = +[NSString stringWithFormat:@"%.1f", 0x4014000000000000];
        v10 = [(AEUserPublishing *)self p_downloadEmailContentForStoreId:v6 dataSource:v7 overrideClientVersion:v11];
        if ([v10 length])
        {
          v12 = [(AEUserPublishing *)self cache];
          [v12 setObject:v10 forKey:v8];
        }
        else
        {
          v12 = v10;
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)storeURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 longLongValue])
  {
    v8 = [objc_opt_class() p_keyForPrefix:@"kStoreURLPrefix~" storeId:v6];
    objc_super v9 = [(AEUserPublishing *)self cache];
    v10 = [v9 objectForKey:v8];

    if (!v10)
    {
      if ([(AEUserPublishing *)self p_isConnectedToInternet]
        && ![(AEUserPublishing *)self hasRecentlyTriedToFetchStoreURLFromNetwork]&& (+[NSDate now], v11 = (NSDate *)objc_claimAutoreleasedReturnValue(), lastFetchStoreURLDate = self->lastFetchStoreURLDate, self->lastFetchStoreURLDate = v11, lastFetchStoreURLDate, [(AEUserPublishing *)self p_downloadedStoreUrlForStoreId:v6 keyProfile:@"kAEUserPublishingLookProfileURL" path:@"url" dataSource:v7], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v10 = (void *)v13;
        v14 = [(AEUserPublishing *)self cache];
        [v14 setObject:v10 forKey:v8];
      }
      else
      {
        v10 = [(AEUserPublishing *)self p_storeURLForStoreId:v6 dataSource:v7];
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasRecentlyTriedToFetchStoreURLFromNetwork
{
  if (!self->lastFetchStoreURLDate) {
    return 0;
  }
  v3 = +[NSDate now];
  [v3 timeIntervalSinceDate:self->lastFetchStoreURLDate];
  double v5 = v4;

  return v5 < 30.0;
}

- (id)storeShortURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 longLongValue])
  {
    v8 = [objc_opt_class() p_keyForPrefix:@"kStoreShortURLPrefix~" storeId:v6];
    objc_super v9 = [(AEUserPublishing *)self cache];
    v10 = [v9 objectForKey:v8];

    if (!v10)
    {
      if ([(AEUserPublishing *)self p_isConnectedToInternet]
        && ![(AEUserPublishing *)self hasRecentlyTriedToFetchShortStoreURLFromNetwork]&& (+[NSDate now], v11 = (NSDate *)objc_claimAutoreleasedReturnValue(), lastFetchShortStoreURLDate = self->lastFetchShortStoreURLDate, self->lastFetchShortStoreURLDate = v11, lastFetchShortStoreURLDate, [(AEUserPublishing *)self p_downloadedStoreUrlForStoreId:v6 keyProfile:@"kAEUserPublishingLookProfileURL" path:@"shortUrl" dataSource:v7], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v10 = (void *)v13;
        v14 = [(AEUserPublishing *)self cache];
        [v14 setObject:v10 forKey:v8];
      }
      else
      {
        v10 = [(AEUserPublishing *)self p_storeShortURLForStoreId:v6 dataSource:v7];
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasRecentlyTriedToFetchShortStoreURLFromNetwork
{
  if (!self->lastFetchShortStoreURLDate) {
    return 0;
  }
  v3 = +[NSDate now];
  [v3 timeIntervalSinceDate:self->lastFetchShortStoreURLDate];
  double v5 = v4;

  return v5 < 30.0;
}

- (void)productProfilesForStoreIDs:(id)a3 completion:(id)a4
{
}

- (void)lockupProfilesForStoreIDs:(id)a3 completion:(id)a4
{
}

- (void)profilesForStoreIDs:(id)a3 keyProfile:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  Class v11 = NSClassFromString(@"AEUserPublishingLookUpRequest");
  if ([(objc_class *)v11 isEnabled])
  {
    if ([v8 count])
    {
      v12 = [(AEUserPublishing *)self workQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_17451C;
      v14[3] = &unk_2CAB18;
      id v15 = v8;
      Class v18 = v11;
      id v16 = v9;
      id v17 = v10;
      dispatch_async(v12, v14);
    }
    else
    {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:@"AEUserPublishingErrorDomain" code:-1000 userInfo:0];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
  }
}

- (BOOL)p_isConnectedToInternet
{
  v2 = +[BKReachability sharedReachabilityForInternetConnection];
  if ([v2 currentReachabilityStatus]) {
    unsigned int v3 = [v2 connectionRequired] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)p_downloadEmailContentForStoreId:(id)a3 dataSource:(id)a4 overrideClientVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  Class v11 = [(AEUserPublishing *)self p_downloadedStoreUrlForStoreId:v8 keyProfile:@"kAEUserPublishingLookProfileProduct" path:@"tellAFriendMessageContentsUrl" dataSource:0];
  if (!v11)
  {
    v12 = [v9 userPublishing:self tellAFriendEmailBaseURLForStoreId:v8];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      +[NSURL URLWithString:@"https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/tellAFriendEmailBody?displayable-kind=25"];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v15 = v14;

    id v16 = [v15 absoluteString];
    id v17 = +[NSString stringWithFormat:@"%@&id=%@", v16, v8];

    Class v11 = +[NSURL URLWithString:v17];
  }
  Class v18 = +[NSMutableURLRequest requestWithURL:v11];
  [(AEUserPublishing *)self timeoutInterval];
  [v18 setTimeoutInterval:];
  v19 = +[BCUserAgent clientUserAgentWithOverrideVersion:v10];
  [v18 setValue:v19 forHTTPHeaderField:@"User-Agent"];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_1748B8;
  v47 = sub_1748C8;
  id v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_1748B8;
  v41[4] = sub_1748C8;
  id v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1748B8;
  v39 = sub_1748C8;
  id v40 = 0;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v21 = +[NSURLSession sharedSession];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_175274;
  v30[3] = &unk_2CAB40;
  v32 = &v35;
  v33 = v41;
  v34 = &v43;
  v22 = v20;
  v31 = v22;
  v23 = [v21 dataTaskWithRequest:v18 completionHandler:v30];
  [v23 resume];
  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  if (v36[5] && (v24 = (void *)v44[5]) != 0 && [v24 statusCode] == stru_B8.segname)
  {
    id v25 = objc_alloc((Class)NSString);
    id v26 = [v25 initWithData:v36[5] encoding:4];
    id v27 = [v26 rangeOfString:@"<html"];
    if (v27 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v28 = [v26 substringFromIndex:v27];

      id v26 = (id)v28;
    }
  }
  else
  {
    id v26 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);

  return v26;
}

- (id)p_generatedEmailBodyForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AEUserPublishing *)self p_isLocalGenerationEnabledForStoreId:v6 dataSource:v7])
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 pathForResource:@"AEAssetInfo.html" ofType:@"tmpl"];

    if (v9)
    {
      uint64_t v27 = 0;
      id v10 = +[NSMutableString stringWithContentsOfFile:v9 encoding:4 error:&v27];
      if (v10)
      {
        Class v11 = [(AEUserPublishing *)self p_assetAuthorForStoreId:v6 dataSource:v7];
        v12 = [(AEUserPublishing *)self p_assetTitleForStoreId:v6 dataSource:v7];
        id v26 = [(AEUserPublishing *)self p_storeURLForStoreId:v6 dataSource:v7];
        uint64_t v13 = [(AEUserPublishing *)self p_assetCategoryForStoreId:v6 dataSource:v7];
        id v14 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
        if ([v11 length])
        {
          id v15 = IMCommonCoreBundle();
          id v16 = [v15 localizedStringForKey:@"by %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
          id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v11);

          id v14 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
          [v10 replaceOccurrencesOfString:@"<!-- %%AUTHOR%% -->" withString:v17 options:0 range:NSMakeRange(0, [v10 length])];
        }
        if ([v12 length])
        {
          id v18 = v12;
          if (v26)
          {
            v19 = [v26 absoluteString];
            uint64_t v20 = +[NSString stringWithFormat:@"<a href=\"%@\">%@</a>", v19, v18];

            id v18 = (id)v20;
            id v14 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
          }
          [v10 replaceOccurrencesOfString:@"<!-- %%TITLE%% -->" withString:v18 options:0 range:[v10 length]];
        }
        if ([v13 length])
        {
          v21 = IMCommonCoreBundle();
          v22 = [v21 localizedStringForKey:@"Category: %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v13);

          [v10 replaceOccurrencesOfString:@"<!-- %%CATEGORY%% -->" withString:v23 options:0 range:NSMakeRange(0, [v10 length])];
          id v14 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
        }
        else
        {
          [v10 replaceOccurrencesOfString:@"<!-- %%CATEGORY%% -->" withString:&stru_2CE418 options:0 range:[v10 length]];
        }
        v24 = [v14[397] stringWithString:v10];
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)p_downloadedStoreUrlForStoreId:(id)a3 keyProfile:(id)a4 path:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(AEUserPublishing *)self p_isDownloadEnabledForStoreId:v10 dataSource:a6]&& (uint64_t v13 = NSClassFromString(@"AEUserPublishingLookUpRequest"), [(objc_class *)v13 isEnabled]))
  {
    id v14 = [v13 alloc];
    id v32 = v10;
    id v15 = +[NSArray arrayWithObjects:&v32 count:1];
    id v16 = [v14 initWithAdamIDs:v15 keyProfile:v11];

    [(AEUserPublishing *)self timeoutInterval];
    id v25 = 0;
    id v17 = [v16 resultWithTimeout:&v25];
    id v18 = (char *)v25;
    if (v18)
    {
      v19 = BCIMLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v27 = "-[AEUserPublishing p_downloadedStoreUrlForStoreId:keyProfile:path:dataSource:]";
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Sharing/Annotations/Private/AEUserPublishing.m";
        __int16 v30 = 1024;
        int v31 = 484;
        _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      uint64_t v20 = BCIMLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v18;
        _os_log_impl(&def_7D91C, v20, OS_LOG_TYPE_INFO, "@\"Failed to get storeURL -- Error {%@}\"", buf, 0xCu);
      }
      id v21 = 0;
    }
    else
    {
      uint64_t v20 = [(id)objc_opt_class() resultsDictionaryFromLookupResult:v17];
      v22 = [v20 objectForKey:v10];
      v23 = [v22 objectForKey:v12];
      if ([v23 length]) {
        id v21 = [objc_alloc((Class)NSURL) initWithString:v23];
      }
      else {
        id v21 = 0;
      }
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)p_isDownloadEnabledForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v8 = [v7 userPublishing:self isDownloadEnabledForStoreId:v6];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)p_isLocalGenerationEnabledForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v8 = [v7 userPublishing:self isLocalGenerationEnabledForStoreId:v6];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (id)p_assetAuthorForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [v7 userPublishing:self assetAuthorForStoreId:v6];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)p_assetTitleForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [v7 userPublishing:self assetTitleForStoreId:v6];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)p_assetCategoryForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [v7 userPublishing:self assetCategoryForStoreId:v6];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)p_storeURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [v7 userPublishing:self storeURLForStoreId:v6];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)p_storeShortURLForStoreId:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [v7 userPublishing:self storeShortURLForStoreId:v6];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->lastFetchShortStoreURLDate, 0);

  objc_storeStrong((id *)&self->lastFetchStoreURLDate, 0);
}

@end