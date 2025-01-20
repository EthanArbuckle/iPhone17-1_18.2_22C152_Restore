@interface AEPdfCache
+ (id)sharedInstance;
- (AEPdfCache)init;
- (BOOL)hasCachedObjectForURL:(id)a3;
- (NSMutableDictionary)urlToDocumentCache;
- (NSMutableDictionary)urlToStringCache;
- (OS_dispatch_queue)cacheQueue;
- (id)canonicalPathFromURL:(id)a3;
- (id)copyCacheObjectForBook:(id)a3;
- (id)copyCacheObjectForPdfPath:(id)a3;
- (id)copyCacheObjectForURL:(id)a3;
- (void)clearNativeObjectCache;
- (void)dealloc;
- (void)removeCacheObjectForURL:(id)a3;
- (void)setCacheQueue:(id)a3;
- (void)setUrlToDocumentCache:(id)a3;
- (void)setUrlToStringCache:(id)a3;
@end

@implementation AEPdfCache

+ (id)sharedInstance
{
  if (qword_22B5C8 != -1) {
    dispatch_once(&qword_22B5C8, &stru_1DCF18);
  }
  v2 = (void *)qword_22B5D0;

  return v2;
}

- (AEPdfCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)AEPdfCache;
  v2 = [(AEPdfCache *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    urlToDocumentCache = v2->_urlToDocumentCache;
    v2->_urlToDocumentCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    urlToStringCache = v2->_urlToStringCache;
    v2->_urlToStringCache = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.iBooks.pdfCacheQueue", v7, v8);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AEPdfCache;
  [(AEPdfCache *)&v4 dealloc];
}

- (void)clearNativeObjectCache
{
  v3 = [(AEPdfCache *)self cacheQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9EF88;
  block[3] = &unk_1DAB88;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)copyCacheObjectForBook:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  id v6 = [(AEPdfCache *)self copyCacheObjectForURL:v5];

  v7 = [v4 password];
  if (![v7 length])
  {
LABEL_7:

    goto LABEL_8;
  }
  v8 = [v4 isPasswordRequired];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    v10 = [v4 url];
    v7 = [v10 path];

    v11 = [v6 document];
    if (![v11 isLocked]
      || ([v4 password],
          v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v11 unlockWithPassword:v12],
          v12,
          v13))
    {
      v14 = [(AEPdfCache *)self cacheQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_9F168;
      block[3] = &unk_1DC1F8;
      block[4] = self;
      id v17 = v7;
      id v18 = v4;
      dispatch_sync(v14, block);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (id)copyCacheObjectForPdfPath:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_9F560;
  v34 = sub_9F570;
  id v35 = 0;
  if ([v4 length])
  {
    v5 = [(AEPdfCache *)self cacheQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9F578;
    block[3] = &unk_1DCE38;
    v29 = &v30;
    block[4] = self;
    id v6 = v4;
    id v28 = v6;
    dispatch_sync(v5, block);

    if (!v31[5])
    {
      [(AEPdfCache *)self clearNativeObjectCache];
      id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:v6 isDirectory:0];
      id v8 = [objc_alloc((Class)PDFDocument) initWithURL:v7];
      if (v8)
      {
        unsigned int v9 = [[AEPdfCacheObject alloc] initWithPdfDocument:v8];
        v10 = (void *)v31[5];
        v31[5] = (uint64_t)v9;

        if (v31[5])
        {
          v11 = [(AEPdfCache *)self cacheQueue];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_9F5E4;
          v24[3] = &unk_1DCF40;
          v24[4] = self;
          v26 = &v30;
          id v25 = v6;
          dispatch_sync(v11, v24);
        }
        if ([v8 isLocked])
        {
          uint64_t v18 = 0;
          v19 = &v18;
          uint64_t v20 = 0x3032000000;
          v21 = sub_9F560;
          v22 = sub_9F570;
          id v23 = 0;
          v12 = [(AEPdfCache *)self cacheQueue];
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_9F640;
          v15[3] = &unk_1DCE38;
          id v17 = &v18;
          v15[4] = self;
          id v16 = v6;
          dispatch_sync(v12, v15);

          if (v19[5]) {
            [v8 unlockWithPassword:];
          }

          _Block_object_dispose(&v18, 8);
        }
      }
    }
  }
  id v13 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v13;
}

- (id)canonicalPathFromURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    id v4 = [v3 path];

    v5 = [v4 stringByStandardizingPath];
  }
  else
  {
    id v4 = [v3 absoluteURL];

    id v6 = [v4 path];
    v5 = [v6 stringByStandardizingPath];
  }

  return v5;
}

- (id)copyCacheObjectForURL:(id)a3
{
  id v4 = a3;
  v5 = [(AEPdfCache *)self canonicalPathFromURL:v4];
  id v6 = [v4 path];

  id v7 = [v6 pathExtension];

  if ([v7 caseInsensitiveCompare:@"pdf"]) {
    id v8 = 0;
  }
  else {
    id v8 = [(AEPdfCache *)self copyCacheObjectForPdfPath:v5];
  }

  return v8;
}

- (BOOL)hasCachedObjectForURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(AEPdfCache *)self canonicalPathFromURL:v4];
  if ([v5 length])
  {
    id v6 = [(AEPdfCache *)self cacheQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9F91C;
    block[3] = &unk_1DCE38;
    v11 = &v12;
    block[4] = self;
    id v10 = v5;
    dispatch_sync(v6, block);
  }
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeCacheObjectForURL:(id)a3
{
  id v4 = [(AEPdfCache *)self canonicalPathFromURL:a3];
  if ([v4 length])
  {
    v5 = [(AEPdfCache *)self cacheQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_9FA4C;
    v6[3] = &unk_1DBF08;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

- (NSMutableDictionary)urlToStringCache
{
  return self->_urlToStringCache;
}

- (void)setUrlToStringCache:(id)a3
{
}

- (NSMutableDictionary)urlToDocumentCache
{
  return self->_urlToDocumentCache;
}

- (void)setUrlToDocumentCache:(id)a3
{
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_urlToDocumentCache, 0);

  objc_storeStrong((id *)&self->_urlToStringCache, 0);
}

@end