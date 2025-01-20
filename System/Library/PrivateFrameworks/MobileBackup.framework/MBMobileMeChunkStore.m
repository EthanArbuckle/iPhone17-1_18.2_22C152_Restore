@interface MBMobileMeChunkStore
+ (id)_addSupplementalDictionaryFromMMCSError:(id)a3 toError:(id)a4;
+ (id)_errorWithMMCSError:(id)a3 description:(id)a4;
+ (id)_errorWithMMCSError:(id)a3 path:(id)a4 description:(id)a5;
+ (int64_t)_codeWithMMCSError:(id)a3;
- (BOOL)getBatch:(id)a3 error:(id *)a4;
- (BOOL)isOpen;
- (BOOL)putBatch:(id)a3 error:(id *)a4;
- (BOOL)registerItem:(id)a3 error:(id *)a4;
- (MBMobileMeChunkStore)initWithAccount:(id)a3 path:(id)a4;
- (MMCSItemReaderWriter)_itemReaderForItemID:(unint64_t)a3 error:(id *)a4;
- (NSDictionary)connectionProperties;
- (NSString)path;
- (void)_cleanup;
- (void)_didFinishGettingItemID:(unint64_t)a3 signature:(id)a4 path:(id)a5 error:(id)a6;
- (void)_didFinishPuttingItemID:(unint64_t)a3 signature:(id)a4 receipt:(id)a5 error:(id)a6;
- (void)_gettingItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6;
- (void)_itemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6;
- (void)_moveItem:(id)a3 fromPath:(id)a4;
- (void)_puttingItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 receipt:(id)a6 error:(id)a7;
- (void)_requestCompleted;
- (void)_runMMCSOnBackgroundThread;
- (void)_setupBatch:(id)a3;
- (void)_setupItem:(id)a3;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)remove;
- (void)setConnectionProperties:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation MBMobileMeChunkStore

- (void)setConnectionProperties:(id)a3
{
  connectionProperties = self->_connectionProperties;
  if (connectionProperties) {
    v6 = connectionProperties;
  }
  id v7 = objc_alloc((Class)NSDictionary);
  self->_connectionProperties = (NSDictionary *)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, kMMCSRequestOptionStreamOptions, 0);
}

- (NSDictionary)connectionProperties
{
  return self->_connectionProperties;
}

+ (int64_t)_codeWithMMCSError:(id)a3
{
  id v4 = [a3 domain];
  uint64_t v5 = kMMCSErrorDomain;
  if (![v4 isEqualToString:kMMCSErrorDomain]) {
    return 400;
  }
  v6 = (char *)[a3 code] - 3;
  int64_t result = 300;
  switch((unint64_t)v6)
  {
    case 0uLL:
    case 2uLL:
    case 8uLL:
    case 0xBuLL:
    case 0x14uLL:
    case 0x1EuLL:
    case 0x23uLL:
      return result;
    case 3uLL:
    case 5uLL:
    case 0x15uLL:
      return 302;
    case 4uLL:
      id v8 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
      if (v8)
      {
        v9 = v8;
        if (objc_msgSend(objc_msgSend(v8, "domain"), "isEqualToString:", v5))
        {
          if ([v9 code] == (id)11) {
            goto LABEL_10;
          }
        }
      }
      int64_t result = 300;
      break;
    case 6uLL:
    case 0x19uLL:
LABEL_10:
      int64_t result = 9;
      break;
    case 0xCuLL:
      int64_t result = 307;
      break;
    case 0xDuLL:
      int64_t result = 304;
      break;
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x1AuLL:
      int64_t result = 401;
      break;
    default:
      return 400;
  }
  return result;
}

+ (id)_addSupplementalDictionaryFromMMCSError:(id)a3 toError:(id)a4
{
  if (!+[MBError isError:a4 withCode:304])
  {
    if (+[MBError isError:a4 withCode:307])
    {
      id v13 = [a3 userInfo];
      id v14 = objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", kMMCSErrorSupplementalDictionaryKey), "objectForKeyedSubscript:", @"X-Apple-MMe-Host");
      if (v14)
      {
        id v9 = v14;
        id v10 = objc_msgSend(objc_msgSend(a4, "userInfo"), "mutableCopy");
        id v11 = v10;
        CFStringRef v12 = @"AccountMoved";
        goto LABEL_7;
      }
    }
    return a4;
  }
  id v6 = [a3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:kMMCSErrorSupplementalDictionaryKey];
  id v8 = [v7 objectForKeyedSubscript:kMMCSErrorRetryAfterKey];
  if (!v8) {
    return a4;
  }
  id v9 = v8;
  id v10 = objc_msgSend(objc_msgSend(a4, "userInfo"), "mutableCopy");
  id v11 = v10;
  CFStringRef v12 = @"RetryAfter";
LABEL_7:
  [v10 setObject:v9 forKeyedSubscript:v12];
  id v15 = [a4 domain];
  id v16 = [a4 code];
  return +[NSError errorWithDomain:v15 code:v16 userInfo:v11];
}

+ (id)_errorWithMMCSError:(id)a3 description:(id)a4
{
  uint64_t v5 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", +[MBMobileMeChunkStore _codeWithMMCSError:](MBMobileMeChunkStore, "_codeWithMMCSError:"), a3, @"%@", a4);
  return +[MBMobileMeChunkStore _addSupplementalDictionaryFromMMCSError:a3 toError:v5];
}

+ (id)_errorWithMMCSError:(id)a3 path:(id)a4 description:(id)a5
{
  id v6 = +[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", +[MBMobileMeChunkStore _codeWithMMCSError:](MBMobileMeChunkStore, "_codeWithMMCSError:"), a3, a4, @"%@", a5);
  return +[MBMobileMeChunkStore _addSupplementalDictionaryFromMMCSError:a3 toError:v6];
}

- (MBMobileMeChunkStore)initWithAccount:(id)a3 path:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MBMobileMeChunkStore;
  id v6 = [(MBChunkStore *)&v10 init];
  if (v6)
  {
    v6->_serviceAccount = (MBServiceAccount *)a3;
    v6->_path = (NSString *)a4;
    v6->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    id v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v6->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, 0);
  }
  return v6;
}

- (void)dealloc
{
  if (self->_engine)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MMCS engine not closed for %@", buf, 0xCu);
      _MBLog();
    }
  }

  dispatch_release((dispatch_object_t)self->_queue);
  dispatch_release((dispatch_object_t)self->_semaphore);
  v4.receiver = self;
  v4.super_class = (Class)MBMobileMeChunkStore;
  [(MBChunkStore *)&v4 dealloc];
}

- (BOOL)isOpen
{
  return self->_engine != 0;
}

- (void)_runMMCSOnBackgroundThread
{
  self->_engineRunLoop = +[NSRunLoop currentRunLoop];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  setpriority(3, 0, 4096);
  id v3 = [objc_alloc((Class)NSTimer) initWithFireDate:+[NSDate distantFuture](NSDate, "distantFuture"), self, NSSelectorFromString(@"this:should:not:fire:"), 0, 0, 0.0 interval target selector userInfo repeats];
  [+[NSRunLoop currentRunLoop] addTimer:v3 forMode:NSDefaultRunLoopMode];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  do
  {
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0) == kCFRunLoopRunFinished) {
      +[NSThread sleepForTimeInterval:0.001];
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021ADA0;
    block[3] = &unk_100416A48;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(queue, block);
  }
  while (*((unsigned char *)v8 + 24));
  [v3 invalidate];

  self->_engineRunLoop = 0;
  _Block_object_dispose(&v7, 8);
}

- (void)open
{
  if ([(MBMobileMeChunkStore *)self isOpen]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:390 description:@"Already open"];
  }
  uint64_t v9 = 0;
  if (![+[NSFileManager defaultManager](NSFileManager, "defaultManager") createDirectoryAtPath:self->_path withIntermediateDirectories:1 attributes:0 error:&v9])+[NSException raise:NSGenericException, @"Error creating MMCS engine directory at %@: %@", self->_path, v9 format]; {
  v12[0] = kMMCSEnginePropertyEnableGetResume;
  }
  v12[1] = kMMCSEnginePropertyEnableLocallySatisfiedGets;
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  v12[2] = kMMCSEnginePropertyEnableGetChunks;
  v13[2] = &__kCFBooleanTrue;
  objc_super v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    id v11 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Creating MMCS engine at %@", buf, 0xCu);
    _MBLog();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021B424;
  block[3] = &unk_100416A70;
  block[4] = self;
  block[5] = v4;
  void block[6] = 9;
  block[7] = self;
  block[8] = 0;
  block[9] = sub_10021B0A0;
  block[10] = sub_10021B124;
  block[11] = sub_10021B1E8;
  block[12] = sub_10021B294;
  block[13] = sub_10021B354;
  block[15] = 0;
  block[16] = 0;
  block[14] = sub_10021B3A0;
  dispatch_sync(queue, block);
  if (!self->_engine) {
    +[NSException raise:NSGenericException format:@"Could not create MMCS engine"];
  }
  self->_itemsByID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_nextItemID = 1;
}

- (void)close
{
  if (+[NSRunLoop currentRunLoop] == self->_engineRunLoop) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:443 description:@"Must not make MMCS calls on it's own runloop"];
  }
  if (self->_engine)
  {
    objc_super v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Destroying MMCS engine", buf, 2u);
      _MBLog();
    }
    uint64_t v5 = dispatch_semaphore_create(0);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021B750;
    block[3] = &unk_100414998;
    block[4] = self;
    block[5] = v5;
    dispatch_sync(queue, block);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    uint64_t v7 = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10021B870;
    v8[3] = &unk_1004149C0;
    v8[4] = self;
    dispatch_sync(v7, v8);
  }

  self->_itemsByID = 0;
  self->_nextItemID = 0;
}

- (void)remove
{
  id v3 = +[NSFileManager defaultManager];
  path = self->_path;
  [(NSFileManager *)v3 removeItemAtPath:path error:0];
}

- (void)_setupItem:(id)a3
{
  if (![a3 itemID])
  {
    ++self->_nextItemID;
    objc_msgSend(a3, "setItemID:");
  }
  id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", objc_msgSend(a3, "itemID"));
  [(NSMutableDictionary *)self->_itemsByID setObject:a3 forKeyedSubscript:v5];
}

- (void)_setupBatch:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(a3, "items", 0);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MBMobileMeChunkStore *)self _setupItem:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_cleanup
{
}

- (BOOL)registerItem:(id)a3 error:(id *)a4
{
  if (+[NSRunLoop currentRunLoop] == self->_engineRunLoop) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:498 description:@"Must not make MMCS calls on it's own runloop"];
  }
  if ([(MBMobileMeChunkStore *)self isOpen])
  {
    if (a3) {
      goto LABEL_5;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:500 description:@"Closed"];
    if (a3) {
      goto LABEL_5;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:501 description:@"Null item"];
LABEL_5:
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3052000000;
  id v14 = sub_10021BCAC;
  id v15 = sub_10021BCBC;
  uint64_t v16 = 0;
  [(MBMobileMeChunkStore *)self _setupItem:a3];
  MBRunLoopPerformBlockAndWait();
  [(MBMobileMeChunkStore *)self _cleanup];
  id v8 = (id)v12[5];
  if (a4) {
    *a4 = (id)v12[5];
  }
  char v9 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)getBatch:(id)a3 error:(id *)a4
{
  if (+[NSRunLoop currentRunLoop] == self->_engineRunLoop) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:536 description:@"Must not make MMCS calls on it's own runloop"];
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [a3 itemCount];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Transferring %lu items with MMCS", (uint8_t *)&buf, 0xCu);
    id v13 = [a3 itemCount];
    _MBLog();
  }
  if ([(MBChunkStore *)self isCancelled])
  {
    BOOL v9 = 0;
    if (a4) {
      *a4 = +[MBError errorWithCode:202 format:@"Transfer cancelled"];
    }
  }
  else if ([a3 itemCount])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3052000000;
    char v20 = sub_10021BCAC;
    v21 = sub_10021BCBC;
    uint64_t v22 = 0;
    [(MBMobileMeChunkStore *)self _setupBatch:a3];
    MBRunLoopPerformBlockAndWait();
    if (*((unsigned char *)v15 + 24)) {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    }
    [(MBMobileMeChunkStore *)self _cleanup];
    id v10 = *(id *)(*((void *)&buf + 1) + 40);
    if ([(MBChunkStore *)self isCancelled])
    {
      *((unsigned char *)v15 + 24) = 0;
      uint64_t v11 = +[MBError errorWithCode:202 format:@"Transfer cancelled"];
      *(void *)(*((void *)&buf + 1) + 40) = v11;
    }
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    return 1;
  }
  return v9;
}

- (BOOL)putBatch:(id)a3 error:(id *)a4
{
  if (+[NSRunLoop currentRunLoop] == self->_engineRunLoop) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:611 description:@"Must not make MMCS calls on it's own runloop"];
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [a3 itemCount];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Transferring %lu items with MMCS", (uint8_t *)&buf, 0xCu);
    id v13 = [a3 itemCount];
    _MBLog();
  }
  if ([(MBChunkStore *)self isCancelled])
  {
    BOOL v9 = 0;
    if (a4) {
      *a4 = +[MBError errorWithCode:202 format:@"Transfer cancelled"];
    }
  }
  else if ([a3 itemCount])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3052000000;
    char v20 = sub_10021BCAC;
    v21 = sub_10021BCBC;
    uint64_t v22 = 0;
    [(MBMobileMeChunkStore *)self _setupBatch:a3];
    MBRunLoopPerformBlockAndWait();
    if (*((unsigned char *)v15 + 24)) {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    }
    [(MBMobileMeChunkStore *)self _cleanup];
    id v10 = *(id *)(*((void *)&buf + 1) + 40);
    if ([(MBChunkStore *)self isCancelled])
    {
      *((unsigned char *)v15 + 24) = 0;
      uint64_t v11 = +[MBError errorWithCode:202 format:@"Transfer cancelled"];
      *(void *)(*((void *)&buf + 1) + 40) = v11;
    }
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    return 1;
  }
  return v9;
}

- (void)cancel
{
  if (+[NSRunLoop currentRunLoop] == self->_engineRunLoop) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMobileMeChunkStore.m" lineNumber:691 description:@"Must not make MMCS calls on it's own runloop"];
  }
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cancelling MMCS transfer", buf, 2u);
    _MBLog();
  }
  id v5 = dispatch_semaphore_create(0);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021CD40;
  v7[3] = &unk_100414998;
  v7[4] = self;
  v7[5] = v5;
  dispatch_sync(queue, v7);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_itemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  long long v12 = MBGetDefaultLog();
  id v13 = v12;
  if (a6)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 134218754;
    unint64_t v20 = a3;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2048;
    double v24 = a5;
    __int16 v25 = 2112;
    id v26 = +[MBError descriptionForError:a6];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Progress of MMCS item %llu: %d %0.2f %@", buf, 0x26u);
    id v18 = +[MBError descriptionForError:a6];
    double v17 = a5;
    unint64_t v15 = a3;
    uint64_t v16 = v8;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 134218496;
    unint64_t v20 = a3;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2048;
    double v24 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Progress of MMCS item %llu: %d %0.2f", buf, 0x1Cu);
    double v17 = a5;
    unint64_t v15 = a3;
    uint64_t v16 = v8;
  }
  _MBLog();
LABEL_7:
  id v14 = [(NSMutableDictionary *)self->_itemsByID objectForKeyedSubscript:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, v15, v16, *(void *)&v17, v18)];
  if (!v14) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBMobileMeChunkStore.m", 720, @"Item not registered: %llu", a3 object file lineNumber description];
  }
  if (a5 > 0.0 && !a6)
  {
    [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] updatingProgress:v14 forItem:a5];
    [v14 setProgress:a5];
  }
}

- (void)_gettingItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6
{
  if (a4 != 3) {
    a5 = -1.0;
  }
  -[MBMobileMeChunkStore _itemID:state:progress:error:](self, "_itemID:state:progress:error:", a3, a5);
}

- (void)_moveItem:(id)a3 fromPath:(id)a4
{
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = [a3 itemID];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Finished getting item %llu from MMCS", buf, 0xCu);
    id v28 = [a3 itemID];
    _MBLog();
  }
  uint64_t v8 = +[NSFileManager defaultManager];
  -[NSFileManager removeItemAtPath:error:](v8, "removeItemAtPath:error:", [a3 path], 0);
  uint64_t v40 = 0;
  if (-[NSFileManager moveItemAtPath:toPath:error:](v8, "moveItemAtPath:toPath:error:", a4, [a3 path], &v40))
  {
    [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] updatingProgress:a3 forItem:1.0];
    [a3 setProgress:1.0];
    BOOL v9 = 0;
  }
  else
  {
    v30 = self;
    id v10 = +[NSMutableArray array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v31 = a3;
    v42[0] = [a3 path];
    v42[1] = a4;
    uint64_t v11 = +[NSArray arrayWithObjects:v42 count:2];
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v36 + 1) + 8 * i) pathComponents];
          uint64_t v17 = (uint64_t)[v16 count];
          if (v17 >= 1)
          {
            unint64_t v18 = v17;
            do
              objc_msgSend(v10, "addObject:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", objc_msgSend(v16, "subarrayWithRange:", 0, v18)));
            while (v18-- > 1);
          }
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v13);
    }
    id v20 = +[NSMutableString string];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v10);
          }
          uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
          *(void *)long long buf = 0;
          id v26 = [(NSFileManager *)v8 attributesOfItemAtPath:v25 error:buf];
          if (v26) {
            [v20 appendFormat:@"path '%@' %@\n", v25, -[NSDictionary fileType](v26, "fileType")];
          }
          else {
            [v20 appendFormat:@"path '%@' error %@\n", v25, *(void *)buf];
          }
        }
        id v22 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v22);
    }
    v27 = MBGetDefaultLog();
    a3 = v31;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "MMCS -[NSFileManager moveItemAtPath:toPath:] failed\n%@", buf, 0xCu);
      id v29 = v20;
      _MBLog();
    }
    [(MBChunkStoreProgressModel *)[(MBChunkStore *)v30 progressModel] failedToTransferItem:v31];
    BOOL v9 = +[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 400, v40, [v31 path], @"Error moving MMCS item %llu into place", objc_msgSend(v31, "itemID"));
  }
  [a3 setError:v9];
}

- (void)_didFinishGettingItemID:(unint64_t)a3 signature:(id)a4 path:(id)a5 error:(id)a6
{
  id v11 = [(NSMutableDictionary *)self->_itemsByID objectForKeyedSubscript:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, a4)];
  if (v11)
  {
    if (a6)
    {
LABEL_3:
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218242;
        id v20 = [v11 itemID];
        __int16 v21 = 2112;
        id v22 = +[MBError descriptionForError:a6];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Error getting item %llu from MMCS: %@", buf, 0x16u);
        id v17 = [v11 itemID];
        id v18 = +[MBError descriptionForError:a6];
        _MBLog();
      }
      [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v11];
      objc_msgSend(v11, "setError:", +[MBMobileMeChunkStore _errorWithMMCSError:path:description:](MBMobileMeChunkStore, "_errorWithMMCSError:path:description:", a6, objc_msgSend(v11, "path"), @"Error getting item from MMCS"));
      id v13 = [a6 domain];
      if ([v13 isEqualToString:kMMCSErrorDomain]
        && ([a6 code] == (id)28
         || [a6 code] == (id)29
         || [a6 code] == (id)32))
      {
        uint64_t v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v11 path];
          id v16 = [v11 fileID];
          *(_DWORD *)long long buf = 134218498;
          id v20 = (id)a3;
          __int16 v21 = 2112;
          id v22 = v15;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unregistering MMCS item %llu: %@ (%@)", buf, 0x20u);
          [v11 path];
          [v11 fileID];
          _MBLog();
        }
        MMCSUnregisterFile();
      }
      return;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBMobileMeChunkStore.m", 776, @"Item not registered: %llu", a3 object file lineNumber description];
    if (a6) {
      goto LABEL_3;
    }
  }
  [(MBMobileMeChunkStore *)self _moveItem:v11 fromPath:a5];
}

- (void)_puttingItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 receipt:(id)a6 error:(id)a7
{
  if (a4 != 4) {
    a5 = -1.0;
  }
  -[MBMobileMeChunkStore _itemID:state:progress:error:](self, "_itemID:state:progress:error:", a3, a5);
}

- (void)_didFinishPuttingItemID:(unint64_t)a3 signature:(id)a4 receipt:(id)a5 error:(id)a6
{
  id v9 = [(NSMutableDictionary *)self->_itemsByID objectForKeyedSubscript:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, a4)];
  id v10 = MBGetDefaultLog();
  id v11 = v10;
  if (a6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218242;
      id v16 = [v9 itemID];
      __int16 v17 = 2112;
      id v18 = +[MBError descriptionForError:a6];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Error putting item %llu into MMCS: %@", buf, 0x16u);
      id v13 = [v9 itemID];
      id v14 = +[MBError descriptionForError:a6];
      _MBLog();
    }
    [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v9];
    id v12 = +[MBMobileMeChunkStore _errorWithMMCSError:path:description:](MBMobileMeChunkStore, "_errorWithMMCSError:path:description:", a6, [v9 path], @"Error putting item into MMCS");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      id v16 = [v9 itemID];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Finished putting item %llu into MMCS", buf, 0xCu);
      id v13 = [v9 itemID];
      _MBLog();
    }
    [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] updatingProgress:v9 forItem:1.0];
    [v9 setProgress:1.0];
    [v9 setReceipt:a5];
    id v12 = 0;
  }
  [v9 setError:v12];
}

- (void)_requestCompleted
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MMCS request completed", v4, 2u);
    _MBLog();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (MMCSItemReaderWriter)_itemReaderForItemID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Creating item reader for MMCS item %llu", (uint8_t *)&buf, 0xCu);
    unint64_t v16 = a3;
    _MBLog();
  }
  id v8 = [(NSMutableDictionary *)self->_itemsByID objectForKeyedSubscript:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, v16)];
  if (v8) {
    goto LABEL_4;
  }
  [(MBChunkStore *)self delegate];
  NSSelectorFromString(@"chunkStore:fdForItemID:");
  if (objc_opt_respondsToSelector())
  {
    id v10 = objc_msgSend(-[MBChunkStore delegate](self, "delegate"), "chunkStore:pathForItemID:", self, a3);
    if (v10)
    {
LABEL_11:
      if ([v8 encryptedKey]) {
        id v11 = -[MBMMCSEncryptedItemReaderInfo initWithItemID:path:encryptedKey:]([MBMMCSEncryptedItemReaderInfo alloc], "initWithItemID:path:encryptedKey:", a3, v10, [v8 encryptedKey]);
      }
      else {
        id v11 = [[MBMMCSUnencryptedItemReaderInfo alloc] initWithItemID:a3 path:v10];
      }
      id v12 = v11;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = v12;
      id v18 = [v10 pathExtension];
      id v19 = v10;
      id v20 = j__objc_retain;
      __int16 v21 = j__objc_release;
      id v22 = sub_10021DD6C;
      __int16 v23 = sub_10021DD88;
      id v24 = sub_10021DDF8;
      uint64_t v25 = sub_10021DE14;
      return (MMCSItemReaderWriter *)MMCSItemReaderWriterCreate();
    }
LABEL_4:
    if ([v8 temporaryPath]) {
      id v9 = [v8 temporaryPath];
    }
    else {
      id v9 = [v8 path];
    }
    id v10 = v9;
    goto LABEL_11;
  }
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Unable to open a fd for MMCS item %llu because it was not found in the batch", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }
  if (!a4) {
    return 0;
  }
  id v15 = +[MBError posixErrorWithCode:2, @"Item %llu not found in batch", a3 format];
  int64_t result = 0;
  *a4 = v15;
  return result;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

@end