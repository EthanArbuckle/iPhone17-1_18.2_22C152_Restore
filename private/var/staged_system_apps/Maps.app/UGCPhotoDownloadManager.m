@interface UGCPhotoDownloadManager
+ (id)generateRandomizedDownloadTokenForClass:(Class)a3;
+ (id)sharedDownloadManager;
- (BOOL)_canCancelDownloadOperation:(id)a3;
- (UGCPhotoDownloadManager)init;
- (id)_cachedImageForDownloadIdentifier:(id)a3;
- (id)_completionOperationForPhotoInfo:(id)a3 downloadToken:(id)a4;
- (id)_currentDownloadOperationForPhotoInfo:(id)a3;
- (void)_updateCacheWithImage:(id)a3 forDownloadIdentifier:(id)a4;
- (void)cancelRequestForPhotoInfo:(id)a3 downloadToken:(id)a4;
- (void)fetchImageForPhotoInfo:(id)a3 callerIdentifier:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
- (void)fetchImageForPhotoInfo:(id)a3 downloadToken:(id)a4 completion:(id)a5;
@end

@implementation UGCPhotoDownloadManager

+ (id)generateRandomizedDownloadTokenForClass:(Class)a3
{
  v3 = NSStringFromClass(a3);
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];

  v9[0] = v3;
  v9[1] = v5;
  v6 = +[NSArray arrayWithObjects:v9 count:2];
  v7 = [v6 componentsJoinedByString:@":"];

  return v7;
}

+ (id)sharedDownloadManager
{
  if (qword_10160F138 != -1) {
    dispatch_once(&qword_10160F138, &stru_1012EF2E0);
  }
  v2 = (void *)qword_10160F130;

  return v2;
}

- (UGCPhotoDownloadManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)UGCPhotoDownloadManager;
  v2 = [(UGCPhotoDownloadManager *)&v12 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

    [(NSCache *)v2->_imageCache setCountLimit:GEOConfigGetUInteger()];
    [(NSCache *)v2->_imageCache setTotalCostLimit:GEOConfigGetUInteger()];
    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    downloadOperationQueue = v2->_downloadOperationQueue;
    v2->_downloadOperationQueue = v5;

    [(NSOperationQueue *)v2->_downloadOperationQueue setMaxConcurrentOperationCount:GEOConfigGetUInteger()];
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    completionOperationQueue = v2->_completionOperationQueue;
    v2->_completionOperationQueue = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Maps.UGCPhotoDownloadManager", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)fetchImageForPhotoInfo:(id)a3 downloadToken:(id)a4 completion:(id)a5
{
}

- (void)fetchImageForPhotoInfo:(id)a3 callerIdentifier:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 url];

  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: downloadablePhotoInfo.url != ((void *)0)";
LABEL_15:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v16, buf, 2u);
    goto LABEL_6;
  }
  if (![v11 length])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: callerIdentifier.length > 0";
    goto LABEL_15;
  }
  if (!v12)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: callbackQueue != ((void *)0)";
    goto LABEL_15;
  }
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    v16 = "Assertion failed: completion != ((void *)0)";
    goto LABEL_15;
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10056A5EC;
  block[3] = &unk_1012EF380;
  block[4] = self;
  id v18 = v10;
  id v19 = v12;
  id v21 = v13;
  id v20 = v11;
  dispatch_async(workQueue, block);

LABEL_6:
}

- (void)cancelRequestForPhotoInfo:(id)a3 downloadToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    v8 = [v6 downloadIdentifier];
    *(void *)buf = @"DOWNLOAD_COMPLETION";
    id v19 = v7;
    id v20 = v8;
    id v9 = v7;
    id v10 = +[NSArray arrayWithObjects:buf count:3];

    id v11 = [v10 componentsJoinedByString:@"_"];

    workQueue = self->_workQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10056B214;
    v14[3] = &unk_1012E85E0;
    v14[4] = self;
    id v15 = v6;
    id v16 = v9;
    id v17 = v11;
    id v13 = v11;
    dispatch_async(workQueue, v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: downloadToken.length > 0", buf, 2u);
  }
}

- (id)_currentDownloadOperationForPhotoInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = [v4 downloadIdentifier];
  v21[0] = @"DOWNLOAD_OPERATION";
  v21[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v21 count:2];
  id v7 = [v6 componentsJoinedByString:@"_"];

  [(NSOperationQueue *)self->_downloadOperationQueue operations];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 name];
        unsigned __int8 v14 = [v13 isEqualToString:v7];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_completionOperationForPhotoInfo:(id)a3 downloadToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v8 = [v6 downloadIdentifier];
  v25[0] = @"DOWNLOAD_COMPLETION";
  v25[1] = v7;
  v25[2] = v8;
  id v9 = v7;
  uint64_t v10 = +[NSArray arrayWithObjects:v25 count:3];

  id v11 = [v10 componentsJoinedByString:@"_"];

  [(NSOperationQueue *)self->_completionOperationQueue operations];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v17 = [v16 name];
        unsigned __int8 v18 = [v17 isEqualToString:v11];

        if (v18)
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (BOOL)_canCancelDownloadOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    [(NSOperationQueue *)self->_completionOperationQueue operations];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dependencies:v14];
          unsigned __int8 v11 = [v10 containsObject:v4];

          if (v11)
          {
            BOOL v12 = 0;
            goto LABEL_12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_12:
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_updateCacheWithImage:(id)a3 forDownloadIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    LOWORD(v10) = 0;
    id v9 = "Assertion failed: image != ((void *)0)";
LABEL_11:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v9, (uint8_t *)&v10, 2u);
    goto LABEL_6;
  }
  if (![v7 length])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    LOWORD(v10) = 0;
    id v9 = "Assertion failed: downloadIdentifier.length > 0";
    goto LABEL_11;
  }
  uint64_t v8 = sub_1005777AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Adding image %@ to cache", (uint8_t *)&v10, 0xCu);
  }

  [(NSCache *)self->_imageCache setObject:v6 forKey:v7 cost:1];
LABEL_6:
}

- (id)_cachedImageForDownloadIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([v4 length])
  {
    id v5 = [(NSCache *)self->_imageCache objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOperationQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end