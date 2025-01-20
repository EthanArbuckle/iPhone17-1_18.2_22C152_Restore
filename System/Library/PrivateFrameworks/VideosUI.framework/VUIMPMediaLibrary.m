@interface VUIMPMediaLibrary
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (unint64_t)_connectionStateFromMPMediaLibraryStatus:(int64_t)a3;
+ (void)initialize;
- (BOOL)hasImageCache;
- (MPMediaLibrary)mediaLibrary;
- (NSOperationQueue)serialOperationQueue;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIMPMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5;
- (VUIMPMediaLibrary)initWithMPMediaLibrary:(id)a3 type:(unint64_t)a4 manager:(id)a5;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4;
- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3;
- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4;
- (id)title;
- (unint64_t)connectionState;
- (void)_enqueueProcessingBlock:(id)a3;
- (void)_handleMediaLibraryStatusDidChangeNotification:(id)a3;
- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4;
- (void)dealloc;
- (void)setConnectionState:(unint64_t)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
@end

@implementation VUIMPMediaLibrary

- (VUIMPMediaLibrary)initWithMPMediaLibrary:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  if (!v11) {
LABEL_3:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"manager" format];
LABEL_4:
  v12 = [VUIMPMediaLibraryIdentifier alloc];
  v13 = [v9 uniqueIdentifier];
  v14 = [(VUIMPMediaLibraryIdentifier *)v12 initWithIdentifier:v13];

  v30.receiver = self;
  v30.super_class = (Class)VUIMPMediaLibrary;
  v15 = [(VUIMediaLibrary *)&v30 initWithIdentifier:v14 type:a4 manager:v11];
  if (v15)
  {
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.videosui.VUIMPMediaLibrary.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v15->_serialProcessingDispatchQueue;
    v15->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v16;

    v18 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialOperationQueue = v15->_serialOperationQueue;
    v15->_serialOperationQueue = v18;

    [(NSOperationQueue *)v15->_serialOperationQueue setMaxConcurrentOperationCount:1];
    objc_storeStrong((id *)&v15->_mediaLibrary, a3);
    v15->_connectionState = objc_msgSend((id)objc_opt_class(), "_connectionStateFromMPMediaLibraryStatus:", -[MPMediaLibrary status](v15->_mediaLibrary, "status"));
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v15 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:*MEMORY[0x1E4F31558] object:v15->_mediaLibrary];
    [v20 addObserver:v15 selector:sel__handleMediaLibraryStatusDidChangeNotification_ name:*MEMORY[0x1E4F31560] object:v15->_mediaLibrary];
    [(MPMediaLibrary *)v15->_mediaLibrary setCloudFilteringType:5];
    mediaLibrary = v15->_mediaLibrary;
    v22 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3D0B8 forProperty:*MEMORY[0x1E4F31420]];
    [(MPMediaLibrary *)mediaLibrary addLibraryFilterPredicate:v22];

    v23 = v15->_mediaLibrary;
    uint64_t v24 = MEMORY[0x1E4F1CC28];
    v25 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F31398]];
    [(MPMediaLibrary *)v23 addLibraryFilterPredicate:v25];

    v26 = v15->_mediaLibrary;
    v27 = [MEMORY[0x1E4F31968] predicateWithValue:v24 forProperty:*MEMORY[0x1E4F313E8]];
    [(MPMediaLibrary *)v26 addLibraryFilterPredicate:v27];

    [(MPMediaLibrary *)v15->_mediaLibrary beginGeneratingLibraryChangeNotifications];
    v28 = [(MPMediaLibrary *)v15->_mediaLibrary artworkDataSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v28 setUsesFallbackCache:0];
    }
  }
  return v15;
}

+ (unint64_t)_connectionStateFromMPMediaLibraryStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E4F31970];
    [v2 setFilteringDisabled:1];
  }
}

- (VUIMPMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The %@ initializer is not available.", v8 format];

  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIMPMediaLibrary;
  [(VUIMediaLibraryImageLoader *)&v4 dealloc];
}

- (id)title
{
  v2 = [(VUIMPMediaLibrary *)self mediaLibrary];
  v3 = [v2 name];

  return v3;
}

- (unint64_t)connectionState
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t connectionState = v2->_connectionState;
  objc_sync_exit(v2);

  return connectionState;
}

- (void)setConnectionState:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_connectionState != a3)
  {
    [(VUIMPMediaLibrary *)obj willChangeValueForKey:@"connectionState"];
    obj->_unint64_t connectionState = a3;
    [(VUIMPMediaLibrary *)obj didChangeValueForKey:@"connectionState"];
  }
  objc_sync_exit(obj);
}

- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke;
  v10[3] = &unk_1E6DF8E10;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(VUIMPMediaLibrary *)self _enqueueProcessingBlock:v10];
}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [VUIMPMediaLibraryConnectOperation alloc];
  v5 = [v3 mediaLibrary];
  id v6 = [(VUIMPMediaLibraryConnectOperation *)v4 initWithMediaLibrary:v5];

  if (*(void *)(a1 + 32))
  {
    objc_initWeak(&location, v3);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_2;
    v19[3] = &unk_1E6DF8DE8;
    objc_copyWeak(&v21, &location);
    id v20 = *(id *)(a1 + 32);
    [(VUIMPMediaLibraryConnectOperation *)v6 setProgressBlock:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  if (*(void *)(a1 + 40))
  {
    objc_initWeak(&location, v3);
    id v7 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_4;
    v15 = &unk_1E6DF43D0;
    objc_copyWeak(&v18, &location);
    id v8 = v6;
    dispatch_queue_t v16 = v8;
    id v17 = *(id *)(a1 + 40);
    id v9 = [v7 blockOperationWithBlock:&v12];
    objc_msgSend(v9, "addDependency:", v8, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [v3 serialOperationQueue];
  [v10 addOperation:v6];

  if (v9)
  {
    id v11 = [v3 serialOperationQueue];
    [v11 addOperation:v9];
  }
}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [WeakRetained manager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_3;
  v6[3] = &unk_1E6DF8DC0;
  id v7 = *(id *)(a1 + 32);
  float v8 = a2;
  [v5 _enqueueCompletionQueueBlock:v6];
}

uint64_t __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40));
}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained manager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_5;
  v4[3] = &unk_1E6DF4AD0;
  id v5 = a1[4];
  id v6 = a1[5];
  [v3 _enqueueCompletionQueueBlock:v4];
}

void __66__VUIMPMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) success];
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionHandler" format];
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6DF8E38;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(VUIMPMediaLibrary *)self _enqueueProcessingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [VUIMPMediaItemEntityTypesOperation alloc];
  id v5 = [v3 mediaLibrary];
  id v6 = [(VUIMPMediaItemEntityTypesOperation *)v4 initWithMPMediaLibrary:v5];

  id v7 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E6DF4510;
  id v17 = v3;
  id v18 = v6;
  id v19 = *(id *)(a1 + 32);
  float v8 = v6;
  id v9 = v3;
  id v10 = [v7 blockOperationWithBlock:v16];
  [v10 addDependency:v8];
  uint64_t v11 = [v9 serialOperationQueue];
  [v11 addOperation:v8];

  uint64_t v12 = [v9 serialOperationQueue];
  [v12 addOperation:v10];

  uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:v8];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(id *a1)
{
  id v2 = [a1[4] manager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E6DF4AD0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 _enqueueCompletionQueueBlock:v3];
}

void __75__VUIMPMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v2 = VUIErrorCancelled();
    id v3 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) response];
    id v2 = [*(id *)(a1 + 32) error];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionHandler" format];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__14;
  id v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  v12[3] = &unk_1E6DF8E60;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  [(VUIMPMediaLibrary *)self _enqueueProcessingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[VUIMPMediaEntitiesFetchOperation alloc] initWithMediaLibrary:v3 requests:*(void *)(a1 + 32)];
  id v5 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
  v14[3] = &unk_1E6DF4510;
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = *(id *)(a1 + 40);
  id v6 = v4;
  id v7 = v3;
  id v8 = [v5 blockOperationWithBlock:v14];
  [v8 addDependency:v6];
  id v9 = [v7 serialOperationQueue];
  [v9 addOperation:v6];

  id v10 = [v7 serialOperationQueue];
  [v10 addOperation:v8];

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:v6];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(id *a1)
{
  id v2 = [a1[4] manager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
  v3[3] = &unk_1E6DF4AD0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 _enqueueCompletionQueueBlock:v3];
}

void __60__VUIMPMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v2 = VUIErrorCancelled();
    id v3 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) responses];
    id v2 = [*(id *)(a1 + 32) error];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(VUIMediaLibrary *)self manager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__VUIMPMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E6DF3DD0;
    id v10 = v5;
    [v6 _enqueueCompletionQueueBlock:v9];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];

  return v7;
}

uint64_t __55__VUIMPMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasImageCache
{
  return 1;
}

- (id)_imageLoaderIdentifier
{
  id v2 = [(VUIMPMediaLibrary *)self mediaLibrary];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v3 imageType:0];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    id v5 = v4;
    if (v4) {
      goto LABEL_7;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The imageLoaderObject parameter must be an instance of VUIPlistMediaEntityImageLoadParams or conform to VUIPlistMediaEntityImageLoadParamsCreating"];
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = -[VUIMPMediaEntityImageLoadOperation initWithParams:scaleToSize:]([VUIMPMediaEntityImageLoadOperation alloc], "initWithParams:scaleToSize:", v7, width, height);

  return v8;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (automaticallyNotifiesObserversForKey____onceToken != -1) {
    dispatch_once(&automaticallyNotifiesObserversForKey____onceToken, &__block_literal_global_85);
  }
  if ([(id)automaticallyNotifiesObserversForKey____keysToNotifyManually containsObject:v4])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VUIMPMediaLibrary;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

void __58__VUIMPMediaLibrary_automaticallyNotifiesObserversForKey___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"connectionState", 0);
  v1 = (void *)automaticallyNotifiesObserversForKey____keysToNotifyManually;
  automaticallyNotifiesObserversForKey____keysToNotifyManually = v0;
}

- (void)_handleMediaLibraryStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned __int8 v5 = [(VUIMediaLibrary *)self manager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__VUIMPMediaLibrary__handleMediaLibraryStatusDidChangeNotification___block_invoke;
  v6[3] = &unk_1E6DF5490;
  objc_copyWeak(&v7, &location);
  void v6[4] = self;
  [v5 _enqueueCompletionQueueBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__VUIMPMediaLibrary__handleMediaLibraryStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained mediaLibrary];
    uint64_t v3 = [v2 status];

    objc_msgSend(v4, "setConnectionState:", objc_msgSend((id)objc_opt_class(), "_connectionStateFromMPMediaLibraryStatus:", v3));
    id WeakRetained = v4;
  }
}

- (void)_enqueueProcessingBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned __int8 v5 = [(VUIMPMediaLibrary *)self serialProcessingDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VUIMPMediaLibrary__enqueueProcessingBlock___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__VUIMPMediaLibrary__enqueueProcessingBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void)setSerialOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end