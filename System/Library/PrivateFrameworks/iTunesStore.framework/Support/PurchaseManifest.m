@interface PurchaseManifest
+ (id)_sharedManifestWithManifestType:(int64_t)a3;
+ (id)sharedManifestForDownloadKind:(id)a3;
+ (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
+ (void)getPathsWithMessage:(id)a3 connection:(id)a4;
+ (void)jetsam;
+ (void)observeXPCServer:(id)a3;
+ (void)rebuildWithMessage:(id)a3 connection:(id)a4;
+ (void)removeItemWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_writeToFile;
- (NSArray)purchaseManifestItems;
- (NSString)path;
- (PurchaseManifest)init;
- (PurchaseManifest)initWithPurchaseDirectory:(id)a3;
- (id)_dictionary;
- (id)removeItemsWithAssetPaths:(id)a3 error:(id *)a4;
- (void)addCompletedItem:(id)a3;
- (void)dealloc;
- (void)jetsam;
- (void)rebuildManifest;
@end

@implementation PurchaseManifest

- (PurchaseManifest)init
{
  return [(PurchaseManifest *)self initWithPurchaseDirectory:0];
}

- (PurchaseManifest)initWithPurchaseDirectory:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"PurchaseManifest.m" lineNumber:66 description:@"Must have directory path"];
  }
  v7.receiver = self;
  v7.super_class = (Class)PurchaseManifest;
  v5 = [(PurchaseManifest *)&v7 init];
  if (v5)
  {
    v5->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.PurchaseManifest", 0);
    v5->_path = (NSString *)[a3 stringByAppendingPathComponent:@"StorePurchasesInfo.plist"];
  }
  return v5;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)PurchaseManifest;
  [(PurchaseManifest *)&v3 dealloc];
}

+ (void)jetsam
{
  pthread_mutex_lock(&stru_1004005A0);
  id v2 = [(id)qword_100401BF0 copy];
  pthread_mutex_unlock(&stru_1004005A0);
  [v2 makeObjectsPerformSelector:"jetsam"];
}

+ (id)sharedManifestForDownloadKind:(id)a3
{
  if ((SSDownloadKindIsMediaKind() & 1) == 0
    && (SSDownloadKindIsPodcastKind() & 1) == 0
    && !SSDownloadKindIsToneKind())
  {
    return 0;
  }
  pthread_mutex_lock(&stru_1004005A0);
  if (!qword_100401BF0) {
    qword_100401BF0 = (uint64_t)objc_alloc_init((Class)NSMutableArray);
  }
  id v4 = sub_10018A454(a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = (void *)qword_100401BF0;
  id v6 = [(id)qword_100401BF0 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_8:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(PurchaseManifest **)(*((void *)&v13 + 1) + 8 * v9);
      if ([[(NSString *)[(PurchaseManifest *)v10 path] stringByDeletingLastPathComponent] isEqualToString:v4])
      {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }
    if (v10) {
      goto LABEL_17;
    }
  }
LABEL_16:
  v10 = [[PurchaseManifest alloc] initWithPurchaseDirectory:v4];
  [(id)qword_100401BF0 addObject:v10];

LABEL_17:
  v11 = v10;
  pthread_mutex_unlock(&stru_1004005A0);
  return v10;
}

- (void)addCompletedItem:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013600;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)jetsam
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000138B0;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (NSString)path
{
  id v2 = self->_path;

  return v2;
}

- (NSArray)purchaseManifestItems
{
  objc_super v3 = (NSArray *)+[NSMutableArray array];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000139A0;
  v6[3] = &unk_1003A3380;
  v6[4] = self;
  v6[5] = v3;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

- (void)rebuildManifest
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013B3C;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)removeItemsWithAssetPaths:(id)a3 error:(id *)a4
{
  id v5 = +[NSMutableSet set];
  id v74 = objc_alloc_init((Class)NSMutableOrderedSet);
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3052000000;
  v91 = sub_100014A08;
  v92 = sub_100014A18;
  uint64_t v93 = 0;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  v75 = v6;
  v77 = self;
  v73 = v5;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v84 objects:v101 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v85;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v85 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "length", v68, v71);
        if (v12 > (id)-[NSString length](v7, "length") && ([v11 hasPrefix:v7] & 1) != 0)
        {
          objc_msgSend(v75, "addObject:", objc_msgSend(v11, "substringFromIndex:", (char *)-[NSString length](v7, "length") + 1));
        }
        else
        {
          id v13 = +[SSLogConfig sharedDaemonConfig];
          if (!v13) {
            id v13 = +[SSLogConfig sharedConfig];
          }
          unsigned int v14 = [v13 shouldLog];
          unsigned int v15 = [v13 shouldLogToDisk];
          long long v16 = [v13 OSLogObject];
          if (v15) {
            int v17 = v14 | 2;
          }
          else {
            int v17 = v14;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            int v18 = v17;
          }
          else {
            int v18 = v17 & 2;
          }
          if (v18)
          {
            uint64_t v19 = objc_opt_class();
            int v95 = 138412802;
            uint64_t v96 = v19;
            __int16 v97 = 2112;
            id v98 = v11;
            __int16 v99 = 2112;
            v100 = v7;
            LODWORD(v71) = 32;
            v68 = &v95;
            uint64_t v20 = _os_log_send_and_compose_impl();
            if (v20)
            {
              v21 = (void *)v20;
              v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v95, v71);
              free(v21);
              v68 = (int *)v22;
              SSFileLog();
            }
          }
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v84 objects:v101 count:16];
    }
    while (v8);
  }
  v23 = v73;
  id v24 = objc_msgSend(v75, "count", v68);
  if (v24 != [a3 count])
  {
    v25 = +[NSError errorWithDomain:SSErrorDomain code:601 userInfo:0];
    v89[5] = (uint64_t)v25;
  }
  if ([v75 count])
  {
    dispatchQueue = v77->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014A24;
    block[3] = &unk_1003A33E8;
    block[4] = v77;
    void block[5] = v75;
    block[6] = v73;
    block[7] = v7;
    block[8] = v74;
    block[9] = &v88;
    dispatch_sync(dispatchQueue, block);
  }

  id v27 = [v73 count];
  if (v27 == [a3 count])
  {
    if ([v74 count])
    {
      id v28 = objc_alloc_init((Class)NSFileManager);
      id v29 = +[SSLogConfig sharedDaemonConfig];
      if (!v29) {
        id v29 = +[SSLogConfig sharedConfig];
      }
      unsigned int v30 = [v29 shouldLog];
      unsigned int v31 = [v29 shouldLogToDisk];
      v32 = [v29 OSLogObject];
      if (v31) {
        int v33 = v30 | 2;
      }
      else {
        int v33 = v30;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        int v34 = v33;
      }
      else {
        int v34 = v33 & 2;
      }
      if (v34)
      {
        uint64_t v35 = objc_opt_class();
        id v36 = [v74 count];
        v37 = (NSString *)[v73 count];
        int v95 = 138412802;
        uint64_t v96 = v35;
        __int16 v97 = 2048;
        id v98 = v36;
        __int16 v99 = 2048;
        v100 = v37;
        LODWORD(v71) = 32;
        v69 = &v95;
        uint64_t v38 = _os_log_send_and_compose_impl();
        if (v38)
        {
          v39 = (void *)v38;
          v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v95, v71);
          free(v39);
          v69 = (int *)v40;
          SSFileLog();
        }
      }
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v41 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v79, v94, 16, v69);
      if (v41)
      {
        uint64_t v42 = *(void *)v80;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(void *)v80 != v42) {
              objc_enumerationMutation(v74);
            }
            v44 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
            uint64_t v78 = 0;
            if (objc_msgSend(v28, "removeItemAtPath:error:", v44, &v78, v70, v71))
            {
              id v45 = +[SSLogConfig sharedDaemonConfig];
              if (!v45) {
                id v45 = +[SSLogConfig sharedConfig];
              }
              unsigned int v46 = [v45 shouldLog];
              unsigned int v47 = [v45 shouldLogToDisk];
              v48 = [v45 OSLogObject];
              if (v47) {
                int v49 = v46 | 2;
              }
              else {
                int v49 = v46;
              }
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
                int v50 = v49;
              }
              else {
                int v50 = v49 & 2;
              }
              if (v50)
              {
                uint64_t v51 = objc_opt_class();
                int v95 = 138412546;
                uint64_t v96 = v51;
                __int16 v97 = 2112;
                id v98 = v44;
                LODWORD(v71) = 22;
                v70 = &v95;
                uint64_t v52 = _os_log_send_and_compose_impl();
                if (v52)
                {
                  v53 = (void *)v52;
                  v54 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v95, v71);
                  free(v53);
                  v70 = (int *)v54;
                  SSFileLog();
                }
              }
            }
            else
            {
              id v55 = +[SSLogConfig sharedDaemonConfig];
              if (!v55) {
                id v55 = +[SSLogConfig sharedConfig];
              }
              unsigned int v56 = [v55 shouldLog];
              unsigned int v57 = [v55 shouldLogToDisk];
              v58 = [v55 OSLogObject];
              if (v57) {
                int v59 = v56 | 2;
              }
              else {
                int v59 = v56;
              }
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
                int v60 = v59;
              }
              else {
                int v60 = v59 & 2;
              }
              if (v60)
              {
                uint64_t v61 = objc_opt_class();
                v62 = (void *)v89[5];
                int v95 = 138412802;
                uint64_t v96 = v61;
                __int16 v97 = 2112;
                id v98 = v62;
                __int16 v99 = 2112;
                v100 = (NSString *)v44;
                LODWORD(v71) = 32;
                v70 = &v95;
                uint64_t v63 = _os_log_send_and_compose_impl();
                if (v63)
                {
                  v64 = (void *)v63;
                  v65 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, &v95, v71);
                  free(v64);
                  v70 = (int *)v65;
                  SSFileLog();
                }
              }
            }
          }
          id v41 = [v74 countByEnumeratingWithState:&v79 objects:v94 count:16];
        }
        while (v41);
      }

      v23 = v73;
    }
  }
  else if (a4)
  {
    *a4 = (id)v89[5];
  }

  id v66 = (id)v89[5];
  _Block_object_dispose(&v88, 8);
  return v23;
}

+ (void)getPathsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014EE0;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = a1;
  [a1 _handleMessage:a3 connection:a4 usingBlock:v4];
}

+ (void)observeXPCServer:(id)a3
{
  [a3 addObserver:a1 selector:"getPathsWithMessage:connection:" forMessage:46];
  [a3 addObserver:a1 selector:"rebuildWithMessage:connection:" forMessage:47];

  [a3 addObserver:a1 selector:"removeItemWithMessage:connection:" forMessage:44];
}

+ (void)rebuildWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015210;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = a1;
  [a1 _handleMessage:a3 connection:a4 usingBlock:v4];
}

+ (void)removeItemWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015304;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = a1;
  [a1 _handleMessage:a3 connection:a4 usingBlock:v4];
}

+ (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"PurchaseManifest");
  xpc_retain(a3);
  xpc_retain(a4);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000155A8;
  block[3] = &unk_1003A3438;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

+ (id)_sharedManifestWithManifestType:(int64_t)a3
{
  if (!a3)
  {
    objc_super v3 = &SSDownloadKindMusic;
    return [a1 sharedManifestForDownloadKind:*v3];
  }
  if (a3 == 1)
  {
    objc_super v3 = &SSDownloadKindPodcast;
    return [a1 sharedManifestForDownloadKind:*v3];
  }
  return 0;
}

- (id)_dictionary
{
  if (!self->_dictionary
    && +[NSFileManager ensureDirectoryExists:[(NSString *)self->_path stringByDeletingLastPathComponent]])
  {
    memset(&v21, 0, sizeof(v21));
    if (stat([(NSString *)self->_path fileSystemRepresentation], &v21))
    {
      if (*__error() == 2)
      {
        id v3 = +[SSLogConfig sharedDaemonConfig];
        if (!v3) {
          id v3 = +[SSLogConfig sharedConfig];
        }
        unsigned int v4 = [v3 shouldLog];
        if ([v3 shouldLogToDisk]) {
          int v5 = v4 | 2;
        }
        else {
          int v5 = v4;
        }
        if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
          v5 &= 2u;
        }
        if (v5)
        {
          uint64_t v6 = objc_opt_class();
          path = self->_path;
          int v22 = 138412546;
          uint64_t v23 = v6;
          __int16 v24 = 2112;
          v25 = path;
          LODWORD(v20) = 22;
          uint64_t v8 = _os_log_send_and_compose_impl();
          if (v8)
          {
            uint64_t v9 = (void *)v8;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v22, v20);
            free(v9);
            SSFileLog();
          }
        }
        self->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      }
    }
    else if ((__int16)v21.st_mode < 0)
    {
      CFDictionaryRef v10 = sub_100047DEC((uint64_t)self->_path);
      if ([(__CFDictionary *)v10 length])
      {
        v11 = (NSMutableDictionary *)+[NSPropertyListSerialization propertyListWithData:v10 options:1 format:0 error:0];
      }
      else
      {
        id v12 = +[SSLogConfig sharedDaemonConfig];
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig];
        }
        unsigned int v13 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          int v14 = v13 | 2;
        }
        else {
          int v14 = v13;
        }
        if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
          v14 &= 2u;
        }
        if (v14)
        {
          uint64_t v15 = objc_opt_class();
          long long v16 = self->_path;
          int v22 = 138412546;
          uint64_t v23 = v15;
          __int16 v24 = 2112;
          v25 = v16;
          LODWORD(v20) = 22;
          uint64_t v17 = _os_log_send_and_compose_impl();
          if (v17)
          {
            int v18 = (void *)v17;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v22, v20);
            free(v18);
            SSFileLog();
          }
        }
        v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      }
      self->_dictionary = v11;
    }
  }
  return self->_dictionary;
}

- (BOOL)_writeToFile
{
  dictionary = self->_dictionary;
  if (!dictionary) {
    return 0;
  }
  unsigned int v4 = +[NSPropertyListSerialization dataWithPropertyList:dictionary format:200 options:0 error:0];
  if (![(NSData *)v4 length]) {
    return 0;
  }
  unsigned int v5 = sub_100047BF8((const __CFData *)v4, (uint64_t)self->_path);
  BOOL v6 = v5 != 0;
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 1024;
    BOOL v17 = v5 != 0;
    LODWORD(v13) = 18;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v14, v13);
      free(v11);
      SSFileLog();
    }
  }
  return v6;
}

@end