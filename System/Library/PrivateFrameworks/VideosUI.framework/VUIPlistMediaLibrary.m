@interface VUIPlistMediaLibrary
- (NSOperationQueue)serialOperationQueue;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIPlistMediaDatabase)database;
- (VUIPlistMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5;
- (VUIPlistMediaLibrary)initWithURL:(id)a3 manager:(id)a4;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4;
- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3;
- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4;
- (id)title;
- (void)_enqueueProcessingBlock:(id)a3;
- (void)dealloc;
- (void)setDatabase:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
@end

@implementation VUIPlistMediaLibrary

- (VUIPlistMediaLibrary)initWithURL:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[VUIPlistMediaLibraryIdentifier alloc] initWithURL:v6];
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaLibrary;
  v9 = [(VUIMediaLibrary *)&v18 initWithIdentifier:v8 type:0 manager:v7];

  if (v9)
  {
    v10 = [[VUIPlistMediaDatabase alloc] initWithURL:v6];
    database = v9->_database;
    v9->_database = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.videosui.VUIPlistMediaLibrary.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v9->_serialProcessingDispatchQueue;
    v9->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serialOperationQueue = v9->_serialOperationQueue;
    v9->_serialOperationQueue = v14;

    [(NSOperationQueue *)v9->_serialOperationQueue setMaxConcurrentOperationCount:1];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v9 selector:sel__handleMediaDatabaseContentsDidChangeNotification_ name:@"VUIPlistMediaDatabaseContentsDidChangeNotification" object:v9->_database];
  }
  return v9;
}

- (VUIPlistMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F1CA00];
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
  v4.super_class = (Class)VUIPlistMediaLibrary;
  [(VUIMediaLibraryImageLoader *)&v4 dealloc];
}

- (id)title
{
  return @"Plist Database";
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionHandler" format];
  }
  uint64_t v11 = 0;
  dispatch_queue_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__34;
  v15 = __Block_byref_object_dispose__34;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6DFD260;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(VUIPlistMediaLibrary *)self _enqueueProcessingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [VUIPlistMediaItemEntityTypesOperation alloc];
  id v5 = [v3 database];
  id v6 = [(VUIPlistMediaItemEntityTypesOperation *)v4 initWithDatabase:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E6DF4510;
  id v17 = v3;
  objc_super v18 = v6;
  id v19 = *(id *)(a1 + 32);
  v8 = v6;
  id v9 = v3;
  v10 = [v7 blockOperationWithBlock:v16];
  [v10 addDependency:v8];
  uint64_t v11 = [v9 serialOperationQueue];
  [v11 addOperation:v8];

  dispatch_queue_t v12 = [v9 serialOperationQueue];
  [v12 addOperation:v10];

  uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:v8];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(id *a1)
{
  v2 = [a1[4] manager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E6DF4AD0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 _enqueueCompletionQueueBlock:v3];
}

void __78__VUIPlistMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    v2 = VUIErrorCancelled();
    id v3 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) response];
    v2 = [*(id *)(a1 + 32) error];
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
  id v19 = __Block_byref_object_copy__34;
  v20 = __Block_byref_object_dispose__34;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  v12[3] = &unk_1E6DFD288;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  [(VUIPlistMediaLibrary *)self _enqueueProcessingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[VUIPlistMediaEntitiesFetchOperation alloc] initWithMediaLibrary:v3 requests:*(void *)(a1 + 32)];
  id v5 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
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

void __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(id *a1)
{
  v2 = [a1[4] manager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
  v3[3] = &unk_1E6DF4AD0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 _enqueueCompletionQueueBlock:v3];
}

void __63__VUIPlistMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    v2 = VUIErrorCancelled();
    id v3 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) responses];
    v2 = [*(id *)(a1 + 32) error];
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
    v9[2] = __58__VUIPlistMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E6DF3DD0;
    id v10 = v5;
    [v6 _enqueueCompletionQueueBlock:v9];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];

  return v7;
}

uint64_t __58__VUIPlistMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_imageLoaderIdentifier
{
  v2 = [(VUIPlistMediaLibrary *)self database];
  id v3 = [v2 fileURL];
  uint64_t v4 = [v3 absoluteString];

  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = @"PlistMediaLibrary";
  }
  return v5;
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
  id v5 = a3;
  id v6 = [[VUIPlistMediaEntityImageLoadOperation alloc] initWithParams:v5];

  return v6;
}

- (void)_enqueueProcessingBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VUIPlistMediaLibrary *)self serialProcessingDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VUIPlistMediaLibrary__enqueueProcessingBlock___block_invoke;
  block[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__VUIPlistMediaLibrary__enqueueProcessingBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (VUIPlistMediaDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
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
  objc_storeStrong((id *)&self->_database, 0);
}

@end