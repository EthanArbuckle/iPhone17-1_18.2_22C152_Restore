@interface VUIMediaLibraryImageLoader
+ (id)_scaledImageIdentifierWithImageIdentifier:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (NSMutableDictionary)imageLoadContextsByImageIdentifier;
- (NSOperationQueue)imageLoadOperationQueue;
- (VUIMediaLibraryImageLoader)init;
- (id)_imageIdentifierWithImageLoadParams:(id)a3;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)_cancelAllImageLoads;
- (void)cancelLoad:(id)a3;
- (void)dealloc;
- (void)setImageLoadContextsByImageIdentifier:(id)a3;
- (void)setImageLoadOperationQueue:(id)a3;
@end

@implementation VUIMediaLibraryImageLoader

- (VUIMediaLibraryImageLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIMediaLibraryImageLoader;
  v2 = [(VUIMediaLibraryImageLoader *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    imageLoadOperationQueue = v2->_imageLoadOperationQueue;
    v2->_imageLoadOperationQueue = v3;

    [(NSOperationQueue *)v2->_imageLoadOperationQueue setMaxConcurrentOperationCount:3];
  }
  return v2;
}

- (void)dealloc
{
  [(VUIMediaLibraryImageLoader *)self _cancelAllImageLoads];
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaLibraryImageLoader;
  [(VUIMediaLibraryImageLoader *)&v3 dealloc];
}

- (id)imageKeyForObject:(id)a3
{
  if (a3)
  {
    v4 = -[VUIMediaLibraryImageLoader _imageLoadParamsForImageLoaderObject:](self, "_imageLoadParamsForImageLoaderObject:");
    v5 = [(VUIMediaLibraryImageLoader *)self _imageIdentifierWithImageLoadParams:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a5;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  id v38 = a8;
  if (!v14) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"object" format];
  }
  v16 = [(VUIMediaLibraryImageLoader *)self _imageLoadParamsForImageLoaderObject:v14];
  v37 = [(VUIMediaLibraryImageLoader *)self _imageIdentifierWithImageLoadParams:v16];
  v17 = objc_msgSend((id)objc_opt_class(), "_scaledImageIdentifierWithImageIdentifier:scaleToSize:cropToFit:", v37, v10, width, height);
  v18 = self;
  objc_sync_enter(v18);
  v19 = [(VUIMediaLibraryImageLoader *)v18 imageLoadContextsByImageIdentifier];
  v20 = [v19 objectForKey:v17];

  if (v20)
  {
    v21 = [(VUIImageLoadContext *)v20 imageLoadOperation];
  }
  else
  {
    v21 = -[VUIMediaLibraryImageLoader _imageLoadOperationWithParams:scaleToSize:cropToFit:](v18, "_imageLoadOperationWithParams:scaleToSize:cropToFit:", v16, v10, width, height);
    v20 = objc_alloc_init(VUIImageLoadContext);
    [(VUIImageLoadContext *)v20 setImageLoadOperation:v21];
    v22 = [(VUIMediaLibraryImageLoader *)v18 imageLoadContextsByImageIdentifier];
    [v22 setObject:v20 forKey:v17];

    v23 = [(VUIMediaLibraryImageLoader *)v18 imageLoadOperationQueue];
    [v23 addOperation:v21];
  }
  [(VUIImageLoadContext *)v20 setRequestCount:[(VUIImageLoadContext *)v20 requestCount] + 1];

  objc_sync_exit(v18);
  if (v21)
  {
    objc_initWeak(location, v18);
    v24 = (void *)MEMORY[0x1E4F28B48];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v44[3] = &unk_1E6DF5490;
    objc_copyWeak(&v46, location);
    id v45 = v17;
    v25 = [v24 blockOperationWithBlock:v44];
    [v25 addDependency:v21];
    v26 = [(VUIMediaLibraryImageLoader *)v18 imageLoadOperationQueue];
    [v26 addOperation:v25];

    v27 = (void *)MEMORY[0x1E4F28B48];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    v41[3] = &unk_1E6DF41E8;
    id v43 = v38;
    id v28 = v21;
    id v42 = v28;
    v29 = [v27 blockOperationWithBlock:v41];
    [v29 addDependency:v28];
    v30 = [MEMORY[0x1E4F28F08] mainQueue];
    [v30 addOperation:v29];

    objc_destroyWeak(&v46);
    objc_destroyWeak(location);
    v31 = v38;
  }
  else
  {
    v31 = v38;
    if (v38)
    {
      v32 = (void *)MEMORY[0x1E4F28B48];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_3;
      v39[3] = &unk_1E6DF3DD0;
      id v40 = v38;
      v33 = [v32 blockOperationWithBlock:v39];
      v34 = [MEMORY[0x1E4F28F08] mainQueue];
      [v34 addOperation:v33];

      v31 = v38;
    }
  }
  v35 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:v21];

  return v35;
}

void __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = [v3 imageLoadContextsByImageIdentifier];
    v5 = [v4 objectForKey:*(void *)(a1 + 32)];

    if (v5)
    {
      uint64_t v6 = [v5 requestCount] - 1;
      [v5 setRequestCount:v6];
      if (!v6)
      {
        v7 = [v3 imageLoadContextsByImageIdentifier];
        [v7 removeObjectForKey:*(void *)(a1 + 32)];
      }
    }

    objc_sync_exit(v3);
    id WeakRetained = v8;
  }
}

void __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40) && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) image];
    [*(id *)(a1 + 32) scalingResult];
    v2 = [*(id *)(a1 + 32) error];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must be an instance of %@", @"requestToken", @"[VUIAsynchronousWorkToken class]" format];
  }
  [v3 cancel];
}

- (void)_cancelAllImageLoads
{
  id v2 = [(VUIMediaLibraryImageLoader *)self imageLoadOperationQueue];
  [v2 cancelAllOperations];
}

- (id)_imageLoaderIdentifier
{
  return 0;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  return 0;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  return 0;
}

- (id)_imageIdentifierWithImageLoadParams:(id)a3
{
  v4 = [a3 imageIdentifier];
  if (v4)
  {
    v5 = [(VUIMediaLibraryImageLoader *)self _imageLoaderIdentifier];
    uint64_t v6 = [NSString stringWithFormat:@"%@_%@", v5, v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_scaledImageIdentifierWithImageIdentifier:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  [v10 addObject:v9];

  if (width != 0.0 && height != 0.0)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lux%lu", (unint64_t)width, (unint64_t)height);
    [v10 addObject:v11];
  }
  if (v5) {
    [v10 addObject:@"crop"];
  }
  v12 = [v10 componentsJoinedByString:@"_"];

  return v12;
}

- (NSMutableDictionary)imageLoadContextsByImageIdentifier
{
  return self->_imageLoadContextsByImageIdentifier;
}

- (void)setImageLoadContextsByImageIdentifier:(id)a3
{
}

- (NSOperationQueue)imageLoadOperationQueue
{
  return self->_imageLoadOperationQueue;
}

- (void)setImageLoadOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadOperationQueue, 0);
  objc_storeStrong((id *)&self->_imageLoadContextsByImageIdentifier, 0);
}

@end