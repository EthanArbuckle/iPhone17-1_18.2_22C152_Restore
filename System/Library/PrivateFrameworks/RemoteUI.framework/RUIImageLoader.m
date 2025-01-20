@interface RUIImageLoader
+ (id)sharedImageLoader;
- (BOOL)_locked_URLIsLoading:(id)a3;
- (BOOL)isLoadingImages;
- (CGImage)imageForURL:(id)a3 loadIfAbsent:(BOOL)a4;
- (RUIImageLoader)init;
- (id)notificationCenter;
- (void)_callCompletionsForURL:(id)a3 image:(CGImage *)a4 error:(id)a5;
- (void)_imageLoadFinished:(id)a3;
- (void)_loadImageURL:(id)a3 completion:(id)a4;
- (void)_loadingStatusChanged;
- (void)_locked_imageLoadStarted:(id)a3;
- (void)_locked_loadImageForURL:(id)a3;
- (void)_mainThread_postLoadingStatusChanged;
- (void)_postImageLoadedNotification:(id)a3;
- (void)_postLoadingStatusChanged;
- (void)_setImageData:(id)a3 forURL:(id)a4 error:(id)a5;
- (void)_startLoader;
- (void)imageForURL:(id)a3 scale:(double)a4 completion:(id)a5;
@end

@implementation RUIImageLoader

+ (id)sharedImageLoader
{
  v2 = (void *)sharedImageLoader_sharedImageLoader;
  if (!sharedImageLoader_sharedImageLoader)
  {
    v3 = objc_alloc_init(RUIImageLoader);
    v4 = (void *)sharedImageLoader_sharedImageLoader;
    sharedImageLoader_sharedImageLoader = (uint64_t)v3;

    v2 = (void *)sharedImageLoader_sharedImageLoader;
  }
  return v2;
}

- (RUIImageLoader)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)RUIImageLoader;
  v2 = [(RUIImageLoader *)&v19 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    queueLock = v2->_queueLock;
    v2->_queueLock = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    cacheLock = v2->_cacheLock;
    v2->_cacheLock = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    loadsInProgress = v2->_loadsInProgress;
    v2->_loadsInProgress = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:100];
    imageCache = v2->_imageCache;
    v2->_imageCache = (NSMutableDictionary *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:100];
    imageCacheLRU = v2->_imageCacheLRU;
    v2->_imageCacheLRU = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    loadCompletions = v2->_loadCompletions;
    v2->_loadCompletions = (NSMutableDictionary *)v15;

    v20.__sig = 0;
    *(void *)v20.__opaque = 0;
    pthread_mutexattr_init(&v20);
    pthread_mutexattr_settype(&v20, 0);
    pthread_mutex_init(&v2->_startupLock, &v20);
    pthread_mutexattr_destroy(&v20);
    pthread_cond_init(&v2->_startupCondition, 0);
    pthread_mutex_lock(&v2->_startupLock);
    [MEMORY[0x263F08B88] detachNewThreadSelector:sel__startLoader toTarget:v2 withObject:0];
    pthread_cond_wait(&v2->_startupCondition, &v2->_startupLock);
    pthread_mutex_unlock(&v2->_startupLock);
    v17 = v2;
  }

  return v2;
}

- (BOOL)isLoadingImages
{
  [(NSLock *)self->_queueLock lock];
  if ([(NSMutableArray *)self->_loadQueue count]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(NSMutableSet *)self->_loadsInProgress count] != 0;
  }
  [(NSLock *)self->_queueLock unlock];
  return v3;
}

- (void)imageForURL:(id)a3 scale:(double)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a5;
  if (v8)
  {
    [(NSLock *)self->_cacheLock lock];
    uint64_t v10 = [(NSMutableDictionary *)self->_imageCache objectForKey:v8];
    if (v10)
    {
      uint64_t v11 = v10;
      [(NSMutableArray *)self->_imageCacheLRU removeObject:v8];
      [(NSMutableArray *)self->_imageCacheLRU addObject:v8];
      [(NSLock *)self->_cacheLock unlock];
      v12 = [MEMORY[0x263F827E8] imageWithCGImage:v11 scale:0 orientation:a4];
      v9[2](v9, v12, 0);
    }
    else
    {
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __47__RUIImageLoader_imageForURL_scale_completion___block_invoke;
      v16 = &unk_264211700;
      double v18 = a4;
      v17 = v9;
      [(RUIImageLoader *)self _loadImageURL:v8 completion:&v13];

      [(NSLock *)self->_cacheLock unlock];
    }
  }
}

void __47__RUIImageLoader_imageForURL_scale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    a2 = [MEMORY[0x263F827E8] imageWithCGImage:a2 scale:0 orientation:*(double *)(a1 + 40)];
  }
  if (a2) {
    id v5 = 0;
  }
  else {
    id v5 = v6;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v5);
}

- (CGImage)imageForURL:(id)a3 loadIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(NSLock *)self->_cacheLock lock];
    v7 = (CGImage *)[(NSMutableDictionary *)self->_imageCache objectForKey:v6];
    if (v7)
    {
      [(NSMutableArray *)self->_imageCacheLRU removeObject:v6];
      [(NSMutableArray *)self->_imageCacheLRU addObject:v6];
    }
    else if (v4)
    {
      [(RUIImageLoader *)self _loadImageURL:v6 completion:0];
    }
    [(NSLock *)self->_cacheLock unlock];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)notificationCenter
{
  notificationCenter = self->_notificationCenter;
  if (!notificationCenter)
  {
    BOOL v4 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x263F08A00]);
    id v5 = self->_notificationCenter;
    self->_notificationCenter = v4;

    notificationCenter = self->_notificationCenter;
  }
  return notificationCenter;
}

- (void)_mainThread_postLoadingStatusChanged
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:RUIImageLoaderLoadingStatusDidChangeNotification object:self];
}

- (void)_postLoadingStatusChanged
{
  [(NSTimer *)self->_loadStatusNotificationTimer invalidate];
  loadStatusNotificationTimer = self->_loadStatusNotificationTimer;
  self->_loadStatusNotificationTimer = 0;

  [(RUIImageLoader *)self performSelectorOnMainThread:sel__mainThread_postLoadingStatusChanged withObject:0 waitUntilDone:0];
}

- (void)_loadingStatusChanged
{
  if (!self->_loadStatusNotificationTimer)
  {
    id v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__postLoadingStatusChanged selector:0 userInfo:0 repeats:0.0];
    loadStatusNotificationTimer = self->_loadStatusNotificationTimer;
    self->_loadStatusNotificationTimer = v3;
    MEMORY[0x270F9A758](v3, loadStatusNotificationTimer);
  }
}

- (void)_startLoader
{
  self->_loaderRunLoop = CFRunLoopGetCurrent();
  v7.version = 0;
  memset(&v7.retain, 0, 56);
  v7.info = self;
  v7.perform = (void (__cdecl *)(void *))_loadImages;
  id v3 = CFRunLoopSourceCreate(0, 0, &v7);
  self->_loaderSource = v3;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE88];
  CFRunLoopAddSource(self->_loaderRunLoop, v3, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  pthread_mutex_lock(&self->_startupLock);
  pthread_cond_signal(&self->_startupCondition);
  uint64_t v5 = pthread_mutex_unlock(&self->_startupLock);
  while (1)
  {
    id v6 = (void *)MEMORY[0x2166A4940](v5);
    CFRunLoopRunInMode(v4, 6.31139904e10, 1u);
  }
}

- (BOOL)_locked_URLIsLoading:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_loadsInProgress objectEnumerator];
  id v6 = 0;
  while (1)
  {
    CFRunLoopSourceContext v7 = v6;
    id v6 = [v5 nextObject];

    if (!v6) {
      break;
    }
    id v8 = [v6 URL];
    char v9 = [v8 isEqual:v4];

    if (v9)
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
  }
  uint64_t v11 = [(NSMutableArray *)self->_loadQueue objectEnumerator];

  do
  {
    v12 = v6;
    id v6 = [v11 nextObject];

    BOOL v10 = v6 != 0;
    if (!v6) {
      break;
    }
    uint64_t v13 = [v6 URL];
    int v14 = [v13 isEqual:v4];
  }
  while (!v14);
  uint64_t v5 = v11;
LABEL_9:

  return v10;
}

- (void)_locked_loadImageForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(RUIImageLoad);
  [(RUIImageLoad *)v5 setURL:v4];

  [(NSMutableArray *)self->_loadQueue addObject:v5];
}

- (void)_loadImageURL:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NSLock *)self->_queueLock lock];
  id v7 = v10;
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_loadCompletions objectForKey:v10];
    if (!v8)
    {
      id v8 = objc_opt_new();
      [(NSMutableDictionary *)self->_loadCompletions setObject:v8 forKey:v10];
    }
    char v9 = _Block_copy(v6);
    [v8 addObject:v9];

    id v7 = v10;
  }
  if ([(RUIImageLoader *)self _locked_URLIsLoading:v7])
  {
    [(NSLock *)self->_queueLock unlock];
  }
  else
  {
    [(RUIImageLoader *)self _locked_loadImageForURL:v10];
    [(NSLock *)self->_queueLock unlock];
    CFRunLoopSourceSignal(self->_loaderSource);
    CFRunLoopWakeUp(self->_loaderRunLoop);
  }
}

- (void)_callCompletionsForURL:(id)a3 image:(CGImage *)a4 error:(id)a5
{
  id v8 = a5;
  loadCompletions = self->_loadCompletions;
  id v10 = a3;
  uint64_t v11 = [(NSMutableDictionary *)loadCompletions objectForKey:v10];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__RUIImageLoader__callCompletionsForURL_image_error___block_invoke;
  block[3] = &unk_264211728;
  id v16 = v8;
  v17 = a4;
  id v15 = v11;
  id v12 = v8;
  id v13 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
  [(NSMutableDictionary *)self->_loadCompletions removeObjectForKey:v10];
}

void __53__RUIImageLoader__callCompletionsForURL_image_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_setImageData:(id)a3 forURL:(id)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CFDataRef v9 = (const __CFData *)a3;
  id v10 = a4;
  id v11 = a5;
  if (_isInternalInstall())
  {
    id v12 = _RUILoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "Image load for %@ complete, error %@", buf, 0x16u);
    }
  }
  [(NSLock *)self->_cacheLock lock];
  if (!v9) {
    goto LABEL_11;
  }
  id v13 = CGImageSourceCreateWithData(v9, 0);
  if (!v13)
  {
    id v15 = NSStringFromSelector(a2);
    NSLog(&cfstr_NoImageSource.isa, v15);
    goto LABEL_10;
  }
  int v14 = v13;
  if (CGImageSourceGetStatus(v13))
  {
    CFRelease(v14);
    id v15 = NSStringFromSelector(a2);
    NSLog(&cfstr_InvalidImageSo.isa, v15);
LABEL_10:

LABEL_11:
    [(RUIImageLoader *)self _callCompletionsForURL:v10 image:0 error:v11];
    [(NSLock *)self->_cacheLock unlock];
    goto LABEL_12;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, 0, 0);
  CFRelease(v14);
  [(NSMutableDictionary *)self->_imageCache setObject:ImageAtIndex forKey:v10];
  [(NSMutableArray *)self->_imageCacheLRU addObject:v10];
  CGImageRelease(ImageAtIndex);
  unint64_t v17 = [(NSMutableArray *)self->_imageCacheLRU count];
  if (v17 >= 0x65)
  {
    uint64_t v18 = 0;
    unint64_t v19 = v17 - 100;
    do
    {
      pthread_mutexattr_t v20 = [(NSMutableArray *)self->_imageCacheLRU objectAtIndex:v18];
      [(NSMutableDictionary *)self->_imageCache removeObjectForKey:v20];

      ++v18;
    }
    while (v19 != v18);
    -[NSMutableArray removeObjectsInRange:](self->_imageCacheLRU, "removeObjectsInRange:", 0, v19);
  }
  [(RUIImageLoader *)self _callCompletionsForURL:v10 image:ImageAtIndex error:0];
  [(NSLock *)self->_cacheLock unlock];
  [(RUIImageLoader *)self performSelectorOnMainThread:sel__postImageLoadedNotification_ withObject:v10 waitUntilDone:0];
LABEL_12:
}

- (void)_postImageLoadedNotification:(id)a3
{
  notificationCenter = self->_notificationCenter;
  if (notificationCenter)
  {
    uint64_t v4 = RUIImageLoaderDidLoadImageNotification;
    id v6 = [a3 absoluteString];
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:v6];
    [(NSNotificationCenter *)notificationCenter postNotificationName:v5 object:0];
  }
}

- (void)_locked_imageLoadStarted:(id)a3
{
}

- (void)_imageLoadFinished:(id)a3
{
  queueLock = self->_queueLock;
  id v5 = a3;
  [(NSLock *)queueLock lock];
  [(NSMutableSet *)self->_loadsInProgress removeObject:v5];

  [(NSLock *)self->_queueLock unlock];
  [(RUIImageLoader *)self _loadingStatusChanged];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadStatusNotificationTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_loadCompletions, 0);
  objc_storeStrong((id *)&self->_imageCacheLRU, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_loadsInProgress, 0);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
}

@end