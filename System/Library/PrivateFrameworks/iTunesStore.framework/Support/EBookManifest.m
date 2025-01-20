@interface EBookManifest
+ (id)purchasedBookManifest;
+ (id)sharedPurchasedBookManifest;
+ (id)syncedBookManifest;
- (EBookManifest)init;
- (EBookManifest)initWithManifestPath:(id)a3;
- (NSString)manifestPath;
- (id)_entries;
- (id)_manifest;
- (id)bookPathForAdamID:(id)a3 withPublicationVersion:(id)a4;
- (id)bookPathPermalink:(id)a3;
- (id)manifestEntriesWithProperty:(id)a3 equalToValue:(id)a4 limitCount:(int64_t)a5;
- (void)_invalidateAfterExternalChange;
- (void)addManifestEntries:(id)a3;
- (void)addManifestEntry:(id)a3;
- (void)dealloc;
- (void)removeManifestEntryWithDownloadPermalink:(id)a3;
- (void)removeManifestEntryWithStoreItemID:(id)a3;
- (void)synchronizeData;
@end

@implementation EBookManifest

- (EBookManifest)init
{
  return [(EBookManifest *)self initWithManifestPath:0];
}

- (EBookManifest)initWithManifestPath:(id)a3
{
  if (![a3 length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"EBookManifest.m" lineNumber:35 description:@"Empty path"];
  }
  v9.receiver = self;
  v9.super_class = (Class)EBookManifest;
  v6 = [(EBookManifest *)&v9 init];
  if (v6)
  {
    v6->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.EBookManifest", 0);
    v6->_manifestPath = (NSString *)[a3 copy];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_10010B2C4, @"com.apple.books.plist.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.books.plist.changed", 0);
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)EBookManifest;
  [(EBookManifest *)&v4 dealloc];
}

+ (id)purchasedBookManifest
{
  if (qword_100401E18 != -1) {
    dispatch_once(&qword_100401E18, &stru_1003A6B40);
  }
  return (id)qword_100401E10;
}

+ (id)sharedPurchasedBookManifest
{
  if (qword_100401E28 != -1) {
    dispatch_once(&qword_100401E28, &stru_1003A6B60);
  }
  return (id)qword_100401E20;
}

+ (id)syncedBookManifest
{
  if (qword_100401E38 != -1) {
    dispatch_once(&qword_100401E38, &stru_1003A6B80);
  }
  return (id)qword_100401E30;
}

- (void)addManifestEntry:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(EBookManifest *)self addManifestEntries:v4];
}

- (void)addManifestEntries:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010B64C;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (id)bookPathPermalink:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [(EBookManifest *)self manifestEntriesWithProperty:@"iTunesU Permlink" equalToValue:a3 limitCount:1];
  if ([v3 count] != (id)1) {
    return 0;
  }
  id v4 = [v3 objectAtIndex:0];
  if (!v4) {
    return 0;
  }

  return [v4 objectForKey:@"Path"];
}

- (id)bookPathForAdamID:(id)a3 withPublicationVersion:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = [(EBookManifest *)self manifestEntriesWithProperty:@"s" equalToValue:a3 limitCount:1];
  if ([v5 count] != (id)1) {
    return 0;
  }
  id v6 = [v5 objectAtIndex:0];
  if (!v6) {
    return 0;
  }
  v7 = v6;
  if (!objc_msgSend(objc_msgSend(v6, "objectForKey:", @"Publication Version"), "isEqualToNumber:", a4))return 0; {

  }
  return [v7 objectForKey:@"Path"];
}

- (id)manifestEntriesWithProperty:(id)a3 equalToValue:(id)a4 limitCount:(int64_t)a5
{
  id v9 = +[NSMutableArray array];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B99C;
  block[3] = &unk_1003A3F90;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = v9;
  block[8] = a5;
  dispatch_sync(dispatchQueue, block);
  return v9;
}

- (NSString)manifestPath
{
  v2 = self->_manifestPath;

  return v2;
}

- (void)removeManifestEntryWithStoreItemID:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010BB64;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)removeManifestEntryWithDownloadPermalink:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010BDA8;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)synchronizeData
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010BFEC;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)_entries
{
  id v2 = [(EBookManifest *)self _manifest];
  id result = [v2 objectForKey:@"Books"];
  if (!result)
  {
    return [v2 objectForKey:@"Purchases"];
  }
  return result;
}

- (void)_invalidateAfterExternalChange
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
    manifestPath = self->_manifestPath;
    int v13 = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    v16 = manifestPath;
    LODWORD(v11) = 22;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      id v9 = (void *)v8;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v13, v11);
      free(v9);
      SSFileLog();
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C450;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)_manifest
{
  id result = self->_manifest;
  if (!result)
  {
    id v4 = objc_alloc_init((Class)NSFileManager);
    if ([v4 fileExistsAtPath:self->_manifestPath])
    {
      uint64_t v21 = 0;
      id v5 = [objc_alloc((Class)NSData) initWithContentsOfFile:self->_manifestPath options:0 error:&v21];
      if (v5)
      {
        uint64_t v6 = v5;
        v7 = (NSMutableDictionary *)+[NSPropertyListSerialization propertyListWithData:v5 options:2 format:0 error:&v21];
        self->_manifest = v7;
        if (!v7)
        {
          id v8 = +[SSLogConfig sharedDaemonConfig];
          if (!v8) {
            id v8 = +[SSLogConfig sharedConfig];
          }
          unsigned int v9 = [v8 shouldLog];
          if ([v8 shouldLogToDisk]) {
            int v10 = v9 | 2;
          }
          else {
            int v10 = v9;
          }
          if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            v10 &= 2u;
          }
          if (v10)
          {
            uint64_t v11 = objc_opt_class();
            int v22 = 138412546;
            uint64_t v23 = v11;
            __int16 v24 = 2112;
            uint64_t v25 = v21;
            LODWORD(v20) = 22;
            uint64_t v12 = _os_log_send_and_compose_impl();
            if (v12)
            {
              int v13 = (void *)v12;
              +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v22, v20);
              free(v13);
              SSFileLog();
            }
          }
          self->_manifest = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        }

        goto LABEL_28;
      }
      id v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14) {
        id v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v17 = objc_opt_class();
        int v22 = 138412546;
        uint64_t v23 = v17;
        __int16 v24 = 2112;
        uint64_t v25 = v21;
        LODWORD(v20) = 22;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v22, v20);
          free(v19);
          SSFileLog();
        }
      }
    }
    self->_manifest = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
LABEL_28:

    return self->_manifest;
  }
  return result;
}

@end