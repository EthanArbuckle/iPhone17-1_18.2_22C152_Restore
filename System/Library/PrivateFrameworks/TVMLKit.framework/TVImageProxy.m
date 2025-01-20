@interface TVImageProxy
+ (id)_imageDecoratorQueue;
- (BOOL)allowsSubstitutionForOriginal;
- (BOOL)cacheOnLoad;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageAvailable;
- (BOOL)isLoading;
- (BOOL)isOfSameOriginAs:(id)a3;
- (BOOL)loadSynchronouslyIfCached;
- (BOOL)writeToAssetLibrary;
- (CGSize)expectedSize;
- (IKNetworkRequestLoader)requestLoader;
- (TVImageDecorator)decorator;
- (TVImageProxy)initWithObject:(id)a3 imageLoader:(id)a4 groupType:(int64_t)a5;
- (_TVDecoratorRequest)decoratorRequestToken;
- (id)_assetKeyWithImageLoaderKey:(id)a3 decoratorIdentifier:(id)a4;
- (id)_decoratedImageAssetKey;
- (id)_decoratedImageAssetPath;
- (id)_decoratorIdentifier;
- (id)_imageAssetPathWithAssetKey:(id)a3;
- (id)_imageLoaderKey;
- (id)_originalImageAssetKey;
- (id)_originalImageAssetPath;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageDidWriteObserver;
- (id)imageLoader;
- (id)object;
- (id)requestToken;
- (id)writeCompletionHandler;
- (int64_t)groupType;
- (int64_t)imageDirection;
- (unint64_t)hash;
- (void)_callCompletionHandlerWithImage:(id)a3 error:(id)a4 finished:(BOOL)a5;
- (void)_callWriteCompletionHandlerWithPath:(id)a3 error:(id)a4 finished:(BOOL)a5;
- (void)_completeImageLoadWithImage:(id)a3 imagePath:(id)a4 error:(id)a5 assetKey:(id)a6 expiryDate:(id)a7 tags:(id)a8 requestRecord:(id)a9;
- (void)_decorateAndWriteImage:(id)a3 imagePath:(id)a4 scaleToSize:(CGSize)a5 cropToFit:(BOOL)a6 scalingResult:(unint64_t)a7 assetKey:(id)a8 expiryDate:(id)a9 tags:(id)a10 requestRecord:(id)a11;
- (void)_imageDidWriteHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)load;
- (void)loadWithWeakObject:(id)a3 completionHandler:(id)a4;
- (void)setAllowsSubstitutionForOriginal:(BOOL)a3;
- (void)setCacheOnLoad:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDecorator:(id)a3;
- (void)setDecoratorRequestToken:(id)a3;
- (void)setGroupType:(int64_t)a3;
- (void)setImageAvailable:(BOOL)a3;
- (void)setImageDidWriteObserver:(id)a3;
- (void)setImageDirection:(int64_t)a3;
- (void)setImageLoader:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLoadSynchronouslyIfCached:(BOOL)a3;
- (void)setRequestLoader:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setWriteCompletionHandler:(id)a3;
- (void)setWriteToAssetLibrary:(BOOL)a3;
@end

@implementation TVImageProxy

- (TVImageProxy)initWithObject:(id)a3 imageLoader:(id)a4 groupType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVImageProxy;
  v11 = [(TVImageProxy *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_object, a3);
    objc_storeStrong(&v12->_imageLoader, a4);
    v12->_writeToAssetLibrary = 1;
    v12->_imageDirection = 0;
    v12->_groupType = a5;
  }

  return v12;
}

- (void)dealloc
{
  if (self->_imageDidWriteObserver)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_imageDidWriteObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)TVImageProxy;
  [(TVImageProxy *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TVImageProxy;
  objc_super v4 = [(TVImageProxy *)&v9 description];
  v5 = [(TVImageProxy *)self object];
  v6 = [v5 description];
  v7 = [v3 stringWithFormat:@"%@ - %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (TVImageProxy *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(TVImageProxy *)v5 object];
      id object = self->_object;
      v8 = v6;
      objc_super v9 = (TVImageDecorator *)object;
      if (v8 == v9)
      {
      }
      else
      {
        id v10 = v9;
        if (!v8 || !v9) {
          goto LABEL_22;
        }
        BOOL v11 = [(TVImageDecorator *)v8 isEqual:v9];

        if (!v11) {
          goto LABEL_23;
        }
      }
      v13 = [(TVImageProxy *)v5 imageLoader];
      id imageLoader = self->_imageLoader;
      v8 = v13;
      v15 = (TVImageDecorator *)imageLoader;
      if (v8 == v15)
      {
      }
      else
      {
        id v10 = v15;
        if (!v8 || !v15) {
          goto LABEL_22;
        }
        BOOL v16 = [(TVImageDecorator *)v8 isEqual:v15];

        if (!v16) {
          goto LABEL_23;
        }
      }
      v17 = [(TVImageProxy *)v5 decorator];
      decorator = self->_decorator;
      v8 = v17;
      v19 = decorator;
      if (v8 == v19)
      {

LABEL_27:
        if ([(TVImageProxy *)v5 groupType] == self->_groupType)
        {
          BOOL v12 = [(TVImageProxy *)v5 imageDirection] == self->_imageDirection;
          goto LABEL_24;
        }
LABEL_23:
        BOOL v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      id v10 = v19;
      if (v8 && v19)
      {
        BOOL v20 = [(TVImageDecorator *)v8 isEqual:v19];

        if (!v20) {
          goto LABEL_23;
        }
        goto LABEL_27;
      }
LABEL_22:

      goto LABEL_23;
    }
    BOOL v12 = 0;
  }
LABEL_25:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(TVImageProxy *)self object];
  uint64_t v4 = [v3 hash];
  v5 = [(TVImageProxy *)self imageLoader];
  uint64_t v6 = [v5 hash] + v4;
  unint64_t v7 = v6 + [(TVImageProxy *)self groupType];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(TVImageProxy *)self object];
  uint64_t v6 = [(TVImageProxy *)self imageLoader];
  unint64_t v7 = objc_msgSend(v4, "initWithObject:imageLoader:groupType:", v5, v6, -[TVImageProxy groupType](self, "groupType"));

  v8 = [(TVImageProxy *)self decorator];
  [v7 setDecorator:v8];

  objc_msgSend(v7, "setCacheOnLoad:", -[TVImageProxy cacheOnLoad](self, "cacheOnLoad"));
  objc_msgSend(v7, "setLoadSynchronouslyIfCached:", -[TVImageProxy loadSynchronouslyIfCached](self, "loadSynchronouslyIfCached"));
  objc_msgSend(v7, "setWriteToAssetLibrary:", -[TVImageProxy writeToAssetLibrary](self, "writeToAssetLibrary"));
  return v7;
}

- (BOOL)isOfSameOriginAs:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  if ([v5 isEqual:self->_object])
  {
    uint64_t v6 = [v4 imageLoader];
    BOOL v7 = [v6 isEqual:self->_imageLoader]
      && [v4 groupType] == self->_groupType
      && [v4 imageDirection] == self->_imageDirection;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGSize)expectedSize
{
  v2 = [(TVImageProxy *)self decorator];
  [v2 expectedSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setIsLoading:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    if (!a3) {
      [(TVImageProxy *)self setDecoratorRequestToken:0];
    }
  }
}

- (BOOL)isImageAvailable
{
  v2 = [(TVImageProxy *)self _decoratedImageAssetPath];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)load
{
  if (![(TVImageProxy *)self isLoading])
  {
    +[_TVPagePerformanceController postNotificationForImageProxy:self withLoadingStatus:1];
    objc_initWeak(location, self);
    BOOL v3 = [(TVImageProxy *)self _imageLoaderKey];
    double v4 = [(TVImageProxy *)self imageLoader];
    if (objc_opt_respondsToSelector())
    {
      double v5 = [(TVImageProxy *)self imageLoader];
      double v6 = [(TVImageProxy *)self object];
      double v7 = [v5 URLForObject:v6];
    }
    else
    {
      double v8 = NSURL;
      double v5 = [NSString stringWithFormat:@"imageKey://%@", v3];
      double v7 = [v8 URLWithString:v5];
    }

    objc_super v9 = [(TVImageProxy *)self requestLoader];
    id v10 = [v9 recordForResource:3 withInitiator:2];

    BOOL v11 = [(TVImageProxy *)self decorator];
    if (v11) {
      [(TVImageProxy *)self _decoratedImageAssetPath];
    }
    else {
    id v12 = [(TVImageProxy *)self _originalImageAssetPath];
    }

    if (v12 && self->_writeToAssetLibrary)
    {
      v13 = [MEMORY[0x263F08BD8] requestWithURL:v7];
      [v10 willSendRequest:v13];

      if (self->_loadSynchronouslyIfCached)
      {
        objc_super v14 = +[TVImage imageWithPath:v12 cacheImmediately:self->_cacheOnLoad];
        +[ITMLUtilities image:v14 didCompleteLoadingForCache:1 requestRecord:v10];
        [(TVImageProxy *)self _callCompletionHandlerWithImage:v14 error:0 finished:1];
        [(TVImageProxy *)self _callWriteCompletionHandlerWithPath:v12 error:0 finished:1];

LABEL_29:
        objc_destroyWeak(location);
        return;
      }
      v33 = [(id)objc_opt_class() _imageDecoratorQueue];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __20__TVImageProxy_load__block_invoke;
      v63[3] = &unk_264BA7438;
      v31 = &v66;
      objc_copyWeak(&v66, location);
      id v12 = v12;
      id v64 = v12;
      id v65 = v10;
      dispatch_async(v33, v63);

      v32 = v64;
LABEL_18:

      objc_destroyWeak(v31);
      goto LABEL_29;
    }
    [(TVImageProxy *)self setIsLoading:1];
    if (!v3)
    {
      v30 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __20__TVImageProxy_load__block_invoke_2;
      block[3] = &unk_264BA6918;
      v31 = &v62;
      objc_copyWeak(&v62, location);
      id v61 = v10;
      dispatch_async(v30, block);

      v32 = v61;
      goto LABEL_18;
    }
    v15 = [(TVImageProxy *)self _originalImageAssetKey];
    BOOL v16 = [(TVImageProxy *)self _decoratedImageAssetKey];
    v17 = [(TVImageProxy *)self decorator];

    if (v17)
    {
      v18 = [(TVImageProxy *)self decorator];
      [v18 loaderScaleToSize];
      BOOL v20 = v19;
      v22 = v21;

      v23 = [(TVImageProxy *)self decorator];
      uint64_t v24 = [v23 loaderCropToFit];

      uint64_t v25 = [(TVImageProxy *)self _originalImageAssetPath];

      if (v25)
      {
        v26 = [MEMORY[0x263F08BD8] requestWithURL:v7];
        [v10 willSendRequest:v26];

        v27 = +[TVAssetLibrary sharedInstance];
        v28 = objc_msgSend(v27, "assetExpiryDateForKey:inGroupOfType:", v15, -[TVImageProxy groupType](self, "groupType"));

        v29 = [MEMORY[0x263EFFA08] setWithObject:v3];
        -[TVImageProxy _decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:](self, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", 0, v25, v24, 0, v16, v28, *(double *)&v20, *(double *)&v22, v29, v10);

        id v12 = (id)v25;
LABEL_28:

        goto LABEL_29;
      }
      id v12 = 0;
    }
    else
    {
      LODWORD(v24) = 0;
      BOOL v20 = (void *)*MEMORY[0x263F001B0];
      v22 = *(void **)(MEMORY[0x263F001B0] + 8);
    }
    uint64_t v54 = 0;
    v55 = (id *)&v54;
    uint64_t v56 = 0x3042000000;
    v57 = __Block_byref_object_copy__2;
    v58 = __Block_byref_object_dispose__2;
    id v59 = 0;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __20__TVImageProxy_load__block_invoke_31;
    v47[3] = &unk_264BA74D0;
    objc_copyWeak(v52, location);
    v51 = &v54;
    v45 = v15;
    id v48 = v15;
    id v49 = v3;
    v52[1] = v20;
    v52[2] = v22;
    unsigned int v46 = v24;
    char v53 = v24;
    v44 = v16;
    id v50 = v16;
    v34 = (void *)MEMORY[0x230FC9DC0](v47);
    v35 = [(TVImageProxy *)self imageLoader];
    char v36 = objc_opt_respondsToSelector();

    if (v36)
    {
      v37 = [(TVImageProxy *)self imageLoader];
      v38 = [(TVImageProxy *)self object];
      int64_t v39 = [(TVImageProxy *)self imageDirection];
      v40 = [(TVImageProxy *)self requestLoader];
      v41 = objc_msgSend(v37, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v38, v46, v39, v40, v34, *(double *)&v20, *(double *)&v22);
    }
    else
    {
      v42 = [(TVImageProxy *)self imageLoader];
      char v43 = objc_opt_respondsToSelector();

      v37 = [(TVImageProxy *)self imageLoader];
      [(TVImageProxy *)self object];
      if (v43) {
        v38 = {;
      }
        objc_msgSend(v37, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", v38, v24, -[TVImageProxy imageDirection](self, "imageDirection"), v34, *(double *)&v20, *(double *)&v22);
      }
      else {
        v38 = {;
      }
        objc_msgSend(v37, "loadImageForObject:scaleToSize:cropToFit:completionHandler:", v38, v24, v34, *(double *)&v20, *(double *)&v22);
      v41 = };
    }

    [(TVImageProxy *)self setRequestToken:v41];
    objc_storeWeak(v55 + 5, v41);

    objc_destroyWeak(v52);
    _Block_object_dispose(&v54, 8);
    objc_destroyWeak(&v59);
    BOOL v16 = v44;
    v15 = v45;
    goto LABEL_28;
  }
}

uint64_t __20__TVImageProxy_load__block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    double v4 = +[TVImage imageWithPath:*(void *)(a1 + 32) cacheImmediately:WeakRetained[8]];
    +[ITMLUtilities image:v4 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 40)];
    [v7 _callCompletionHandlerWithImage:v4 error:0 finished:1];
    [v7 _callWriteCompletionHandlerWithPath:*(void *)(a1 + 32) error:0 finished:1];
  }
  else
  {
    double v5 = *(void **)(a1 + 40);
    if (!v5) {
      goto LABEL_6;
    }
    double v7 = 0;
    double v4 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:11 userInfo:0];
    [v5 didFailWithError:v4];
  }

  BOOL v3 = v7;
LABEL_6:
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

void __20__TVImageProxy_load__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:10 userInfo:0];
    [WeakRetained _completeImageLoadWithImage:0 imagePath:0 error:v2 assetKey:0 expiryDate:0 tags:0 requestRecord:0];
    [*(id *)(a1 + 32) didFailWithError:v2];
  }
}

void __20__TVImageProxy_load__block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  unint64_t v11 = a2;
  unint64_t v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v16 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v17 = [WeakRetained requestToken];
    if (v17)
    {
      v18 = (void *)v17;
      id v19 = [v16 requestToken];
      id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));

      if (v19 == v20)
      {
        [v16 setRequestToken:0];
        if ([v16 isLoading])
        {
          v21 = [v16 decorator];
          if (v21 && (v21, v11 | v12))
          {
            if (v11 && [v16 writeToAssetLibrary])
            {
              v22 = [v16 imageLoader];
              if ((objc_opt_respondsToSelector() & 1) == 0 || ([v22 hasImageCache] & 1) == 0)
              {
                v23 = dispatch_get_global_queue(0, 0);
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __20__TVImageProxy_load__block_invoke_2_34;
                block[3] = &unk_264BA74A8;
                id v30 = (id)v11;
                id v31 = *(id *)(a1 + 32);
                v32 = v16;
                id v33 = v13;
                id v34 = *(id *)(a1 + 40);
                dispatch_async(v23, block);
              }
            }
            uint64_t v24 = *(unsigned __int8 *)(a1 + 88);
            uint64_t v25 = *(void *)(a1 + 48);
            v26 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
            objc_msgSend(v16, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", v11, v12, v24, a5, v25, v13, *(double *)(a1 + 72), *(double *)(a1 + 80), v26, 0);
          }
          else
          {
            uint64_t v27 = *(void *)(a1 + 48);
            v28 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
            [v16 _completeImageLoadWithImage:v11 imagePath:v12 error:v14 assetKey:v27 expiryDate:v13 tags:v28 requestRecord:0];
          }
        }
      }
    }
  }
}

void __20__TVImageProxy_load__block_invoke_2_34(uint64_t a1)
{
  id v7 = +[TVAssetLibrary sharedInstance];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) groupType];
  uint64_t v5 = *(void *)(a1 + 56);
  double v6 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
  [v7 setImageAsset:v2 forKey:v3 inGroupOfType:v4 expiryDate:v5 tags:v6];
}

+ (id)_imageDecoratorQueue
{
  if (_imageDecoratorQueue_onceToken != -1) {
    dispatch_once(&_imageDecoratorQueue_onceToken, &__block_literal_global_21);
  }
  uint64_t v2 = (void *)_imageDecoratorQueue_sImageDecoratorQueue;
  return v2;
}

uint64_t __36__TVImageProxy__imageDecoratorQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TVAssetLibrary.decoratorQueue", 0);
  uint64_t v1 = _imageDecoratorQueue_sImageDecoratorQueue;
  _imageDecoratorQueue_sImageDecoratorQueue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)_decorateAndWriteImage:(id)a3 imagePath:(id)a4 scaleToSize:(CGSize)a5 cropToFit:(BOOL)a6 scalingResult:(unint64_t)a7 assetKey:(id)a8 expiryDate:(id)a9 tags:(id)a10 requestRecord:(id)a11
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v36 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v22 = [(TVImageProxy *)self decorator];
  BOOL cacheOnLoad = self->_cacheOnLoad;
  uint64_t v24 = objc_alloc_init(_TVDecoratorRequest);
  [(TVImageProxy *)self setDecoratorRequestToken:v24];
  objc_initWeak(location, self);
  uint64_t v25 = [(id)objc_opt_class() _imageDecoratorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke;
  block[3] = &unk_264BA7520;
  objc_copyWeak(v46, location);
  id v38 = v36;
  id v39 = v17;
  BOOL v47 = cacheOnLoad;
  v46[1] = (id)a7;
  v46[2] = *(id *)&width;
  v46[3] = *(id *)&height;
  BOOL v48 = a6;
  v40 = v24;
  id v41 = v22;
  id v42 = v18;
  id v43 = v19;
  id v44 = v20;
  id v45 = v21;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = v22;
  id v31 = v24;
  id v32 = v17;
  id v33 = v36;
  dispatch_async(v25, block);

  objc_destroyWeak(v46);
  objc_destroyWeak(location);
}

void __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = +[TVImage imageWithPath:*(void *)(a1 + 40) cacheImmediately:*(unsigned __int8 *)(a1 + 128)];
    }
    uint64_t v5 = v4;
    if ([*(id *)(a1 + 48) statusCancelled])
    {
      double v6 = *(void **)(a1 + 88);
      if (v6)
      {
        id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:11 userInfo:0];
        [v6 didFailWithError:v7];
      }
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 104);
      if (v8 == 2)
      {
        id v10 = (double *)(a1 + 112);
        unint64_t v11 = (double *)(a1 + 120);
        BOOL v12 = *(unsigned char *)(a1 + 129) != 0;
      }
      else
      {
        BOOL v9 = v8 == 1;
        id v10 = (double *)(a1 + 112);
        if (v9)
        {
          unint64_t v11 = (double *)(a1 + 120);
        }
        else
        {
          id v10 = (double *)MEMORY[0x263F001B0];
          unint64_t v11 = (double *)(MEMORY[0x263F001B0] + 8);
        }
        BOOL v12 = 0;
      }
      id v13 = objc_msgSend(*(id *)(a1 + 56), "decorate:scaledWithSize:croppedToFit:", v5, v12, *v10, *v11);
      id v14 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2;
      block[3] = &unk_264BA74F8;
      id v17 = *(id *)(a1 + 48);
      id v18 = v13;
      id v19 = WeakRetained;
      id v20 = *(id *)(a1 + 64);
      id v21 = *(id *)(a1 + 72);
      id v22 = *(id *)(a1 + 80);
      id v23 = *(id *)(a1 + 88);
      id v15 = v13;
      dispatch_async(v14, block);
    }
  }
}

void __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) statusCancelled] & 1) == 0)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
    }
    id v3 = (id)v2;
    [*(id *)(a1 + 48) _completeImageLoadWithImage:*(void *)(a1 + 40) imagePath:0 error:v2 assetKey:*(void *)(a1 + 56) expiryDate:*(void *)(a1 + 64) tags:*(void *)(a1 + 72) requestRecord:*(void *)(a1 + 80)];
  }
}

- (void)_completeImageLoadWithImage:(id)a3 imagePath:(id)a4 error:(id)a5 assetKey:(id)a6 expiryDate:(id)a7 tags:(id)a8 requestRecord:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = v21;
  if (v16)
  {
    id v23 = [(TVImageProxy *)self completionHandler];

    if (v23)
    {
      if (v15)
      {
        id v24 = v15;
      }
      else
      {
        id v24 = +[TVImage imageWithPath:v16 cacheImmediately:self->_cacheOnLoad];
      }
      id v29 = v24;
      [(TVImageProxy *)self _callCompletionHandlerWithImage:v24 error:0 finished:1];
    }
    +[ITMLUtilities image:v15 didCompleteLoadingForCache:1 requestRecord:v22];
    id v30 = self;
    id v31 = v16;
    id v32 = 0;
LABEL_16:
    [(TVImageProxy *)v30 _callWriteCompletionHandlerWithPath:v31 error:v32 finished:1];
LABEL_17:
    [(TVImageProxy *)self setIsLoading:0];
    goto LABEL_18;
  }
  if (!v15)
  {
    if (v21)
    {
      id v33 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:11 userInfo:0];
      [v22 didFailWithError:v33];
    }
    [(TVImageProxy *)self _callCompletionHandlerWithImage:0 error:v17 finished:1];
    id v30 = self;
    id v31 = 0;
    id v32 = v17;
    goto LABEL_16;
  }
  if (!self->_writeToAssetLibrary)
  {
    +[ITMLUtilities image:v15 didCompleteLoadingForCache:1 requestRecord:v21];
    [(TVImageProxy *)self _callCompletionHandlerWithImage:v15 error:0 finished:1];
    goto LABEL_17;
  }
  uint64_t v25 = [(TVImageProxy *)self writeCompletionHandler];

  if (v25)
  {
    objc_initWeak(&location, self);
    v35 = [MEMORY[0x263F08A00] defaultCenter];
    id v36 = objc_alloc_init(MEMORY[0x263F08A48]);
    id v34 = @"ATVAssetDidWriteNotification";
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __99__TVImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke;
    v37[3] = &unk_264BA7548;
    objc_copyWeak(&v38, &location);
    id v26 = [v35 addObserverForName:@"ATVAssetDidWriteNotification" object:v18 queue:v36 usingBlock:v37];
    id imageDidWriteObserver = self->_imageDidWriteObserver;
    self->_id imageDidWriteObserver = v26;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  if (self->_writeToAssetLibrary)
  {
    id v28 = +[TVAssetLibrary sharedInstance];
    objc_msgSend(v28, "setImageAsset:forKey:inGroupOfType:expiryDate:tags:", v15, v18, -[TVImageProxy groupType](self, "groupType"), v19, v20);
  }
  +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v15, 1, v22, v34);
  [(TVImageProxy *)self _callCompletionHandlerWithImage:v15 error:0 finished:1];
  if (!v25) {
    goto LABEL_17;
  }
LABEL_18:
}

void __99__TVImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _imageDidWriteHandler:v5];
  }
}

- (void)_imageDidWriteHandler:(id)a3
{
  id v7 = self;
  id v4 = [a3 userInfo];
  if ([(TVImageProxy *)v7 isLoading])
  {
    id v5 = [v4 objectForKey:@"ATVAssetDidWriteNotificationAssetPathKey"];
    double v6 = [v4 objectForKey:@"ATVAssetDidWriteNotificationErrorKey"];
    [(TVImageProxy *)v7 _callWriteCompletionHandlerWithPath:v5 error:v6 finished:1];
  }
  [(TVImageProxy *)v7 setIsLoading:0];
}

- (id)_decoratorIdentifier
{
  uint64_t v2 = [(TVImageProxy *)self decorator];
  id v3 = [v2 decoratorIdentifier];

  return v3;
}

- (id)_assetKeyWithImageLoaderKey:(id)a3 decoratorIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263F089D8] stringWithString:v6];
    [v8 appendString:@"_"];
    if ([(TVImageProxy *)self imageDirection]) {
      BOOL v9 = @"rtl";
    }
    else {
      BOOL v9 = @"ltr";
    }
    [v8 appendString:v9];
    if (v7)
    {
      [v8 appendString:@"_"];
      [v8 appendString:v7];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_imageLoaderKey
{
  id v3 = [(TVImageProxy *)self imageLoader];
  id v4 = [(TVImageProxy *)self object];
  id v5 = [v3 imageKeyForObject:v4];

  return v5;
}

- (id)_originalImageAssetKey
{
  id v3 = [(TVImageProxy *)self _imageLoaderKey];
  id v4 = [(TVImageProxy *)self _assetKeyWithImageLoaderKey:v3 decoratorIdentifier:0];
  if ([(TVImageProxy *)self allowsSubstitutionForOriginal])
  {
    id v5 = [(TVImageProxy *)self _imageAssetPathWithAssetKey:v4];

    if (!v5)
    {
      id v6 = +[TVAssetLibrary sharedInstance];
      id v7 = [MEMORY[0x263EFFA08] setWithObject:v3];
      uint64_t v8 = objc_msgSend(v6, "keyForAssetWithTags:inGroupOfType:", v7, -[TVImageProxy groupType](self, "groupType"));

      if (v8)
      {
        id v9 = v8;

        id v4 = v9;
      }
    }
  }

  return v4;
}

- (id)_decoratedImageAssetKey
{
  id v3 = [(TVImageProxy *)self _imageLoaderKey];
  id v4 = [(TVImageProxy *)self _decoratorIdentifier];
  id v5 = [(TVImageProxy *)self _assetKeyWithImageLoaderKey:v3 decoratorIdentifier:v4];

  return v5;
}

- (id)_originalImageAssetPath
{
  id v3 = [(TVImageProxy *)self _originalImageAssetKey];
  id v4 = [(TVImageProxy *)self _imageAssetPathWithAssetKey:v3];

  return v4;
}

- (id)_decoratedImageAssetPath
{
  id v3 = [(TVImageProxy *)self _decoratedImageAssetKey];
  id v4 = [(TVImageProxy *)self _imageAssetPathWithAssetKey:v3];

  return v4;
}

- (id)_imageAssetPathWithAssetKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[TVAssetLibrary sharedInstance];
    id v6 = objc_msgSend(v5, "assetPathForKey:inGroupOfType:", v4, -[TVImageProxy groupType](self, "groupType"));
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)cancel
{
  if ([(TVImageProxy *)self isLoading])
  {
    id v9 = self;
    if (v9->_imageDidWriteObserver)
    {
      id v3 = [MEMORY[0x263F08A00] defaultCenter];
      [v3 removeObserver:v9->_imageDidWriteObserver];

      id imageDidWriteObserver = v9->_imageDidWriteObserver;
      v9->_id imageDidWriteObserver = 0;
    }
    id v5 = [(TVImageProxy *)v9 requestToken];

    if (v5)
    {
      id v6 = [(TVImageProxy *)v9 imageLoader];
      id v7 = [(TVImageProxy *)v9 requestToken];
      [v6 cancelLoad:v7];

      [(TVImageProxy *)v9 setRequestToken:0];
    }
    uint64_t v8 = [(TVImageProxy *)v9 decoratorRequestToken];
    [v8 setStatusCancelled:1];

    [(TVImageProxy *)v9 setDecoratorRequestToken:0];
    [(TVImageProxy *)v9 setIsLoading:0];
    [(TVImageProxy *)v9 _callCompletionHandlerWithImage:0 error:0 finished:0];
    [(TVImageProxy *)v9 _callWriteCompletionHandlerWithPath:0 error:0 finished:0];
  }
}

- (void)_callCompletionHandlerWithImage:(id)a3 error:(id)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  +[_TVPagePerformanceController postNotificationForImageProxy:self withLoadingStatus:0];
  id v9 = [(TVImageProxy *)self completionHandler];
  id v10 = (void (**)(void, void, void, void))[v9 copy];

  if (v10) {
    ((void (**)(void, id, id, BOOL))v10)[2](v10, v11, v8, v5);
  }
}

- (void)_callWriteCompletionHandlerWithPath:(id)a3 error:(id)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(TVImageProxy *)self writeCompletionHandler];
  id v10 = (void (**)(void, void, void, void))[v9 copy];

  if (v10) {
    ((void (**)(void, id, id, BOOL))v10)[2](v10, v11, v8, v5);
  }
}

- (id)object
{
  return self->_object;
}

- (id)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
}

- (BOOL)cacheOnLoad
{
  return self->_cacheOnLoad;
}

- (void)setCacheOnLoad:(BOOL)a3
{
  self->_BOOL cacheOnLoad = a3;
}

- (BOOL)allowsSubstitutionForOriginal
{
  return self->_allowsSubstitutionForOriginal;
}

- (void)setAllowsSubstitutionForOriginal:(BOOL)a3
{
  self->_allowsSubstitutionForOriginal = a3;
}

- (TVImageDecorator)decorator
{
  return self->_decorator;
}

- (void)setDecorator:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)writeCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setWriteCompletionHandler:(id)a3
{
}

- (void)setImageAvailable:(BOOL)a3
{
  self->_imageAvailable = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (int64_t)imageDirection
{
  return self->_imageDirection;
}

- (void)setImageDirection:(int64_t)a3
{
  self->_imageDirection = a3;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (id)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
}

- (_TVDecoratorRequest)decoratorRequestToken
{
  return self->_decoratorRequestToken;
}

- (void)setDecoratorRequestToken:(id)a3
{
}

- (id)imageDidWriteObserver
{
  return self->_imageDidWriteObserver;
}

- (void)setImageDidWriteObserver:(id)a3
{
}

- (IKNetworkRequestLoader)requestLoader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestLoader);
  return (IKNetworkRequestLoader *)WeakRetained;
}

- (void)setRequestLoader:(id)a3
{
}

- (BOOL)loadSynchronouslyIfCached
{
  return self->_loadSynchronouslyIfCached;
}

- (void)setLoadSynchronouslyIfCached:(BOOL)a3
{
  self->_loadSynchronouslyIfCached = a3;
}

- (BOOL)writeToAssetLibrary
{
  return self->_writeToAssetLibrary;
}

- (void)setWriteToAssetLibrary:(BOOL)a3
{
  self->_writeToAssetLibrary = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong(&self->_imageDidWriteObserver, 0);
  objc_storeStrong((id *)&self->_decoratorRequestToken, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong(&self->_writeCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong(&self->_imageLoader, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)loadWithWeakObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v6);
  objc_initWeak(&from, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__TVImageProxy_TVMLKitAdditions__loadWithWeakObject_completionHandler___block_invoke;
  v9[3] = &unk_264BA77D8;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v10 = v8;
  [(TVImageProxy *)self setCompletionHandler:v9];
  [(TVImageProxy *)self load];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __71__TVImageProxy_TVMLKitAdditions__loadWithWeakObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v11 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCompletionHandler:0];

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id, id, id, uint64_t))(v10 + 16))(v10, v9, v11, v7, a4);
    }
  }
}

@end