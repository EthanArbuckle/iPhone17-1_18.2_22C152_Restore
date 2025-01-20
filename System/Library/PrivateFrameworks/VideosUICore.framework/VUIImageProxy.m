@interface VUIImageProxy
+ (id)_imageDecoratorQueue;
+ (id)_imageReadWriteQueue;
- (BOOL)allowsSubstitutionForOriginal;
- (BOOL)cacheOnLoad;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageAvailable;
- (BOOL)isLoading;
- (BOOL)isOfSameOriginAs:(id)a3;
- (BOOL)loadSynchronouslyIfCached;
- (BOOL)optimizedImageRendering;
- (BOOL)returnImageAfterWrittenToDisk;
- (BOOL)writeToAssetLibrary;
- (CGSize)dynamicProxyRequestedSize;
- (CGSize)expectedSize;
- (VUIImageDecorator)decorator;
- (VUIImageProxy)initWithObject:(id)a3 imageLoader:(id)a4 groupType:(int64_t)a5;
- (VUINetworkRequestLoader)requestLoader;
- (_VUIDecoratorRequest)decoratorRequestToken;
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
- (void)setAllowsSubstitutionForOriginal:(BOOL)a3;
- (void)setCacheOnLoad:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDecorator:(id)a3;
- (void)setDecoratorRequestToken:(id)a3;
- (void)setDynamicProxyRequestedSize:(CGSize)a3;
- (void)setGroupType:(int64_t)a3;
- (void)setImageDidWriteObserver:(id)a3;
- (void)setImageDirection:(int64_t)a3;
- (void)setImageLoader:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLoadSynchronouslyIfCached:(BOOL)a3;
- (void)setOptimizedImageRendering:(BOOL)a3;
- (void)setRequestLoader:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setReturnImageAfterWrittenToDisk:(BOOL)a3;
- (void)setWriteCompletionHandler:(id)a3;
- (void)setWriteToAssetLibrary:(BOOL)a3;
@end

@implementation VUIImageProxy

- (CGSize)expectedSize
{
  v2 = [(VUIImageProxy *)self decorator];
  [v2 expectedSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (VUIImageDecorator)decorator
{
  return self->_decorator;
}

- (void)setOptimizedImageRendering:(BOOL)a3
{
  self->_optimizedImageRendering = a3;
}

- (void)setDecorator:(id)a3
{
}

uint64_t __21__VUIImageProxy_load__block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    double v4 = +[VUIImage imageWithPath:*(void *)(a1 + 32) cacheImmediately:WeakRetained[8]];
    +[VUICoreUtilities image:v4 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 40)];
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
    double v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VideosUICoreErrorDomain" code:107 userInfo:0];
    [v5 didFailWithError:v4];
  }

  double v3 = v7;
LABEL_6:
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)_callWriteCompletionHandlerWithPath:(id)a3 error:(id)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  v9 = [(VUIImageProxy *)self writeCompletionHandler];
  v10 = (void (**)(void, void, void, void))[v9 copy];

  if (v10) {
    ((void (**)(void, id, id, BOOL))v10)[2](v10, v11, v8, v5);
  }
}

- (id)writeCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setImageDirection:(int64_t)a3
{
  self->_imageDirection = a3;
}

- (void)setCacheOnLoad:(BOOL)a3
{
  self->_cacheOnLoad = a3;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (VUIImageProxy *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      double v6 = [(VUIImageProxy *)v5 object];
      id object = self->_object;
      id v8 = v6;
      v9 = (VUIImageDecorator *)object;
      if (v8 == v9)
      {
      }
      else
      {
        v10 = v9;
        if (!v8 || !v9) {
          goto LABEL_22;
        }
        BOOL v11 = [(VUIImageDecorator *)v8 isEqual:v9];

        if (!v11) {
          goto LABEL_23;
        }
      }
      v13 = [(VUIImageProxy *)v5 imageLoader];
      id imageLoader = self->_imageLoader;
      id v8 = v13;
      v15 = (VUIImageDecorator *)imageLoader;
      if (v8 == v15)
      {
      }
      else
      {
        v10 = v15;
        if (!v8 || !v15) {
          goto LABEL_22;
        }
        BOOL v16 = [(VUIImageDecorator *)v8 isEqual:v15];

        if (!v16) {
          goto LABEL_23;
        }
      }
      v17 = [(VUIImageProxy *)v5 decorator];
      decorator = self->_decorator;
      id v8 = v17;
      v19 = decorator;
      if (v8 == v19)
      {

LABEL_27:
        if ([(VUIImageProxy *)v5 groupType] == self->_groupType
          && [(VUIImageProxy *)v5 imageDirection] == self->_imageDirection)
        {
          BOOL v12 = self->_optimizedImageRendering == [(VUIImageProxy *)v5 optimizedImageRendering];
          goto LABEL_24;
        }
LABEL_23:
        BOOL v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v10 = v19;
      if (v8 && v19)
      {
        BOOL v20 = [(VUIImageDecorator *)v8 isEqual:v19];

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

- (void)load
{
  if (![(VUIImageProxy *)self isLoading])
  {
    +[VUIPagePerformanceController postNotificationForImageProxy:self withLoadingStatus:1 withError:0];
    objc_initWeak(location, self);
    double v3 = [(VUIImageProxy *)self _imageLoaderKey];
    double v4 = [(VUIImageProxy *)self imageLoader];
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [(VUIImageProxy *)self imageLoader];
      double v6 = [(VUIImageProxy *)self object];
      double v7 = [v5 URLForObject:v6];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F1CB10];
      BOOL v5 = [NSString stringWithFormat:@"imageKey://%@", v3];
      double v7 = [v8 URLWithString:v5];
    }

    v9 = [(VUIImageProxy *)self requestLoader];
    v10 = [v9 recordForResource:3 withInitiator:2];
    if ([(VUIImageProxy *)self optimizedImageRendering]
      || ([(VUIImageProxy *)self decorator], (BOOL v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v12 = [(VUIImageProxy *)self _originalImageAssetPath];
      if (!v12) {
        goto LABEL_13;
      }
    }
    else
    {
      id v12 = [(VUIImageProxy *)self _decoratedImageAssetPath];

      if (!v12) {
        goto LABEL_13;
      }
    }
    if (self->_writeToAssetLibrary)
    {
      v13 = [MEMORY[0x1E4F290D0] requestWithURL:v7];
      [v10 willSendRequest:v13];

      if (self->_loadSynchronouslyIfCached)
      {
        v14 = +[VUIImage imageWithPath:v12 cacheImmediately:self->_cacheOnLoad];
        +[VUICoreUtilities image:v14 didCompleteLoadingForCache:1 requestRecord:v10];
        [(VUIImageProxy *)self _callCompletionHandlerWithImage:v14 error:0 finished:1];
        [(VUIImageProxy *)self _callWriteCompletionHandlerWithPath:v12 error:0 finished:1];

LABEL_30:
        objc_destroyWeak(location);
        return;
      }
      v32 = [(id)objc_opt_class() _imageDecoratorQueue];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __21__VUIImageProxy_load__block_invoke;
      v60[3] = &unk_1E6DDD8C0;
      v30 = &v63;
      objc_copyWeak(&v63, location);
      id v12 = v12;
      id v61 = v12;
      id v62 = v10;
      dispatch_async(v32, v60);

      v31 = v61;
LABEL_19:

      objc_destroyWeak(v30);
      goto LABEL_30;
    }
LABEL_13:
    [(VUIImageProxy *)self setIsLoading:1];
    if (v3)
    {
      v15 = [(VUIImageProxy *)self _originalImageAssetKey];
      v43 = [(VUIImageProxy *)self _decoratedImageAssetKey];
      BOOL v16 = [(VUIImageProxy *)self decorator];

      v42 = v15;
      if (v16)
      {
        v17 = [(VUIImageProxy *)self decorator];
        [v17 loaderScaleToSize];
        v19 = v18;
        v21 = v20;

        v22 = [(VUIImageProxy *)self decorator];
        uint64_t v23 = [v22 loaderCropToFit];

        uint64_t v24 = [(VUIImageProxy *)self _originalImageAssetPath];

        if (v24)
        {
          v25 = [MEMORY[0x1E4F290D0] requestWithURL:v7];
          [v10 willSendRequest:v25];

          v26 = +[VUIAssetLibrary sharedInstance];
          v27 = objc_msgSend(v26, "assetExpiryDateForKey:inGroupOfType:", v42, -[VUIImageProxy groupType](self, "groupType"));

          v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
          -[VUIImageProxy _decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:](self, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", 0, v24, v23, 0, v43, v27, *(double *)&v19, *(double *)&v21, v28, v10);

          id v12 = (id)v24;
LABEL_29:

          goto LABEL_30;
        }
        id v12 = 0;
      }
      else
      {
        uint64_t v23 = 0;
        v19 = (void *)*MEMORY[0x1E4F1DB30];
        v21 = *(void **)(MEMORY[0x1E4F1DB30] + 8);
      }
      uint64_t v51 = 0;
      v52 = (id *)&v51;
      uint64_t v53 = 0x3042000000;
      v54 = __Block_byref_object_copy__2;
      v55 = __Block_byref_object_dispose__2;
      id v56 = 0;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __21__VUIImageProxy_load__block_invoke_35;
      v44[3] = &unk_1E6DDD8E8;
      objc_copyWeak(v49, location);
      v48 = &v51;
      v44[4] = self;
      id v45 = v15;
      id v46 = v3;
      v49[1] = v19;
      v49[2] = v21;
      char v50 = v23;
      id v47 = v43;
      v33 = (void *)MEMORY[0x1E4E604D0](v44);
      v34 = [(VUIImageProxy *)self imageLoader];
      char v35 = objc_opt_respondsToSelector();

      if (v35)
      {
        v36 = [(VUIImageProxy *)self imageLoader];
        v37 = [(VUIImageProxy *)self object];
        uint64_t v38 = objc_msgSend(v36, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v37, v23, -[VUIImageProxy imageDirection](self, "imageDirection"), v9, v33, *(double *)&v19, *(double *)&v21);
      }
      else
      {
        v39 = [(VUIImageProxy *)self imageLoader];
        char v40 = objc_opt_respondsToSelector();

        v36 = [(VUIImageProxy *)self imageLoader];
        [(VUIImageProxy *)self object];
        if (v40) {
          v37 = {;
        }
          objc_msgSend(v36, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", v37, v23, -[VUIImageProxy imageDirection](self, "imageDirection"), v33, *(double *)&v19, *(double *)&v21);
        }
        else {
          v37 = {;
        }
          objc_msgSend(v36, "loadImageForObject:scaleToSize:cropToFit:completionHandler:", v37, v23, v33, *(double *)&v19, *(double *)&v21);
        uint64_t v38 = };
      }
      v41 = (void *)v38;

      [(VUIImageProxy *)self setRequestToken:v41];
      objc_storeWeak(v52 + 5, v41);

      objc_destroyWeak(v49);
      _Block_object_dispose(&v51, 8);
      objc_destroyWeak(&v56);
      goto LABEL_29;
    }
    v29 = [(id)objc_opt_class() _imageReadWriteQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__VUIImageProxy_load__block_invoke_2;
    block[3] = &unk_1E6DDD738;
    v30 = &v59;
    objc_copyWeak(&v59, location);
    id v58 = v10;
    dispatch_async(v29, block);

    v31 = v58;
    goto LABEL_19;
  }
}

- (id)_imageLoaderKey
{
  double v3 = [(VUIImageProxy *)self imageLoader];
  double v4 = [(VUIImageProxy *)self object];
  BOOL v5 = [v3 imageKeyForObject:v4];

  return v5;
}

- (unint64_t)hash
{
  double v3 = [(VUIImageProxy *)self object];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(VUIImageProxy *)self imageLoader];
  uint64_t v6 = [v5 hash] + v4;
  unint64_t v7 = v6 + [(VUIImageProxy *)self groupType];

  return v7;
}

- (id)object
{
  return self->_object;
}

- (id)imageLoader
{
  return self->_imageLoader;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)_callCompletionHandlerWithImage:(id)a3 error:(id)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  +[VUIPagePerformanceController postNotificationForImageProxy:self withLoadingStatus:0 withError:v8];
  v9 = [(VUIImageProxy *)self completionHandler];
  v10 = (void (**)(void, void, void, void))[v9 copy];

  if (v10) {
    ((void (**)(void, id, id, BOOL))v10)[2](v10, v11, v8, v5);
  }
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (VUINetworkRequestLoader)requestLoader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestLoader);
  return (VUINetworkRequestLoader *)WeakRetained;
}

- (BOOL)optimizedImageRendering
{
  return self->_optimizedImageRendering;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (id)_originalImageAssetPath
{
  double v3 = [(VUIImageProxy *)self _originalImageAssetKey];
  uint64_t v4 = [(VUIImageProxy *)self _imageAssetPathWithAssetKey:v3];

  return v4;
}

- (id)_originalImageAssetKey
{
  double v3 = [(VUIImageProxy *)self _imageLoaderKey];
  uint64_t v4 = [(VUIImageProxy *)self _assetKeyWithImageLoaderKey:v3 decoratorIdentifier:0];
  if ([(VUIImageProxy *)self allowsSubstitutionForOriginal])
  {
    BOOL v5 = [(VUIImageProxy *)self _imageAssetPathWithAssetKey:v4];

    if (!v5)
    {
      uint64_t v6 = +[VUIAssetLibrary sharedInstance];
      unint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
      id v8 = objc_msgSend(v6, "keyForAssetWithTags:inGroupOfType:", v7, -[VUIImageProxy groupType](self, "groupType"));

      if (v8)
      {
        id v9 = v8;

        uint64_t v4 = v9;
      }
    }
  }
  if ((unint64_t)[v4 length] >= 0x100)
  {
    uint64_t v10 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v4, "length") - 255);

    uint64_t v4 = (void *)v10;
  }

  return v4;
}

- (BOOL)allowsSubstitutionForOriginal
{
  return self->_allowsSubstitutionForOriginal;
}

- (id)_imageAssetPathWithAssetKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = +[VUIAssetLibrary sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "assetPathForKey:inGroupOfType:", v4, -[VUIImageProxy groupType](self, "groupType"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)_assetKeyWithImageLoaderKey:(id)a3 decoratorIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F28E78] stringWithString:v6];
    [v8 appendString:@"_"];
    if ([(VUIImageProxy *)self imageDirection]) {
      id v9 = @"rtl";
    }
    else {
      id v9 = @"ltr";
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
    id v8 = 0;
  }

  return v8;
}

- (int64_t)imageDirection
{
  return self->_imageDirection;
}

+ (id)_imageDecoratorQueue
{
  if (_imageDecoratorQueue_onceToken != -1) {
    dispatch_once(&_imageDecoratorQueue_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)_imageDecoratorQueue_sImageDecoratorQueue;
  return v2;
}

- (VUIImageProxy)initWithObject:(id)a3 imageLoader:(id)a4 groupType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VUIImageProxy;
  id v11 = [(VUIImageProxy *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_object, a3);
    objc_storeStrong(&v12->_imageLoader, a4);
    v12->_groupType = a5;
    *(_WORD *)&v12->_writeToAssetLibrary = 257;
    v12->_imageDirection = 0;
    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v12->_returnImageAfterWrittenToDisk = [v13 BOOLForKey:@"ImageProxyReturnImageAfterWrittenToDisk"];
  }
  return v12;
}

uint64_t __37__VUIImageProxy__imageDecoratorQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.VUIAssetLibrary.decoratorQueue", 0);
  uint64_t v1 = _imageDecoratorQueue_sImageDecoratorQueue;
  _imageDecoratorQueue_sImageDecoratorQueue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)dealloc
{
  if (self->_imageDidWriteObserver)
  {
    double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_imageDidWriteObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIImageProxy;
  [(VUIImageProxy *)&v4 dealloc];
}

- (id)description
{
  double v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VUIImageProxy;
  objc_super v4 = [(VUIImageProxy *)&v9 description];
  BOOL v5 = [(VUIImageProxy *)self object];
  id v6 = [v5 description];
  id v7 = [v3 stringWithFormat:@"%@ - %@", v4, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(VUIImageProxy *)self object];
  id v6 = [(VUIImageProxy *)self imageLoader];
  id v7 = objc_msgSend(v4, "initWithObject:imageLoader:groupType:", v5, v6, -[VUIImageProxy groupType](self, "groupType"));

  id v8 = [(VUIImageProxy *)self decorator];
  [v7 setDecorator:v8];

  objc_msgSend(v7, "setCacheOnLoad:", -[VUIImageProxy cacheOnLoad](self, "cacheOnLoad"));
  objc_msgSend(v7, "setLoadSynchronouslyIfCached:", -[VUIImageProxy loadSynchronouslyIfCached](self, "loadSynchronouslyIfCached"));
  objc_msgSend(v7, "setWriteToAssetLibrary:", -[VUIImageProxy writeToAssetLibrary](self, "writeToAssetLibrary"));
  return v7;
}

- (BOOL)isOfSameOriginAs:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 object];
  if ([v5 isEqual:self->_object])
  {
    id v6 = [v4 imageLoader];
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

- (void)setWriteToAssetLibrary:(BOOL)a3
{
  self->_writeToAssetLibrary = a3;
  if (!a3) {
    [(VUIImageProxy *)self setReturnImageAfterWrittenToDisk:0];
  }
}

- (void)setIsLoading:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    if (!a3) {
      [(VUIImageProxy *)self setDecoratorRequestToken:0];
    }
  }
}

- (BOOL)isImageAvailable
{
  v2 = [(VUIImageProxy *)self _decoratedImageAssetPath];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

void __21__VUIImageProxy_load__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VideosUICoreErrorDomain" code:106 userInfo:0];
    [WeakRetained _completeImageLoadWithImage:0 imagePath:0 error:v2 assetKey:0 expiryDate:0 tags:0 requestRecord:0];
    [*(id *)(a1 + 32) didFailWithError:v2];
  }
}

void __21__VUIImageProxy_load__block_invoke_35(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  unint64_t v11 = a2;
  unint64_t v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  BOOL v16 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v17 = [WeakRetained requestToken];
    if (v17)
    {
      v18 = (void *)v17;
      id v19 = [v16 requestToken];
      id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));

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
                uint64_t v23 = [(id)objc_opt_class() _imageReadWriteQueue];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __21__VUIImageProxy_load__block_invoke_2_38;
                block[3] = &unk_1E6DDD430;
                id v30 = (id)v11;
                id v31 = *(id *)(a1 + 40);
                v32 = v16;
                id v33 = v13;
                id v34 = *(id *)(a1 + 48);
                dispatch_async(v23, block);
              }
            }
            uint64_t v24 = *(unsigned __int8 *)(a1 + 96);
            uint64_t v25 = *(void *)(a1 + 56);
            v26 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
            objc_msgSend(v16, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", v11, v12, v24, a5, v25, v13, *(double *)(a1 + 80), *(double *)(a1 + 88), v26, 0);
          }
          else
          {
            uint64_t v27 = *(void *)(a1 + 56);
            v28 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
            [v16 _completeImageLoadWithImage:v11 imagePath:v12 error:v14 assetKey:v27 expiryDate:v13 tags:v28 requestRecord:0];
          }
        }
      }
    }
  }
}

void __21__VUIImageProxy_load__block_invoke_2_38(uint64_t a1)
{
  id v7 = +[VUIAssetLibrary sharedInstance];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) groupType];
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 64)];
  [v7 setImageAsset:v2 forKey:v3 inGroupOfType:v4 expiryDate:v5 tags:v6];
}

+ (id)_imageReadWriteQueue
{
  if (_imageReadWriteQueue_onceToken != -1) {
    dispatch_once(&_imageReadWriteQueue_onceToken, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)_imageReadWriteQueue_sImageReadWriteQueue;
  return v2;
}

uint64_t __37__VUIImageProxy__imageReadWriteQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.videosuicore.VUIImageProxy.imageReadWriteQueue", 0);
  uint64_t v1 = _imageReadWriteQueue_sImageReadWriteQueue;
  _imageReadWriteQueue_sImageReadWriteQueue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_decorateAndWriteImage:(id)a3 imagePath:(id)a4 scaleToSize:(CGSize)a5 cropToFit:(BOOL)a6 scalingResult:(unint64_t)a7 assetKey:(id)a8 expiryDate:(id)a9 tags:(id)a10 requestRecord:(id)a11
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v35 = a3;
  id v34 = a4;
  id v33 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = [(VUIImageProxy *)self decorator];
  LOBYTE(a8) = self->_cacheOnLoad;
  v21 = objc_alloc_init(_VUIDecoratorRequest);
  [(VUIImageProxy *)self setDecoratorRequestToken:v21];
  objc_initWeak(location, self);
  v22 = [(id)objc_opt_class() _imageDecoratorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke;
  block[3] = &unk_1E6DDD960;
  objc_copyWeak(v46, location);
  id v37 = v35;
  id v38 = v34;
  char v47 = (char)a8;
  v39 = v21;
  char v40 = self;
  id v41 = v33;
  id v42 = v17;
  id v43 = v18;
  id v44 = v19;
  v46[2] = *(id *)&width;
  v46[3] = *(id *)&height;
  BOOL v48 = a6;
  v46[1] = (id)a7;
  id v45 = v20;
  id v32 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v33;
  uint64_t v27 = v21;
  id v28 = v34;
  id v29 = v35;
  dispatch_async(v22, block);

  objc_destroyWeak(v46);
  objc_destroyWeak(location);
}

void __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = +[VUIImage imageWithPath:*(void *)(a1 + 40) cacheImmediately:*(unsigned __int8 *)(a1 + 136)];
    }
    uint64_t v5 = v4;
    if ([WeakRetained optimizedImageRendering]
      && ([*(id *)(a1 + 48) statusCancelled] & 1) == 0)
    {
      if (v5)
      {
        id v13 = 0;
      }
      else
      {
        id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
      }
      id v18 = [(id)objc_opt_class() _imageReadWriteQueue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2;
      v27[3] = &unk_1E6DDD910;
      v27[4] = WeakRetained;
      id v28 = v5;
      id v29 = *(id *)(a1 + 40);
      id v30 = v13;
      id v31 = *(id *)(a1 + 64);
      id v32 = *(id *)(a1 + 72);
      id v33 = *(id *)(a1 + 80);
      id v34 = *(id *)(a1 + 88);
      id v16 = v13;
      dispatch_async(v18, v27);

      id v17 = v28;
    }
    else
    {
      if ([*(id *)(a1 + 48) statusCancelled])
      {
        id v6 = *(void **)(a1 + 88);
        if (v6)
        {
          id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VideosUICoreErrorDomain" code:107 userInfo:0];
          [v6 didFailWithError:v7];
        }
        goto LABEL_22;
      }
      uint64_t v8 = *(void *)(a1 + 112);
      if (v8 == 2)
      {
        id v10 = (double *)(a1 + 120);
        unint64_t v11 = (double *)(a1 + 128);
        BOOL v12 = *(unsigned char *)(a1 + 137) != 0;
      }
      else
      {
        BOOL v9 = v8 == 1;
        id v10 = (double *)(a1 + 120);
        if (v9)
        {
          unint64_t v11 = (double *)(a1 + 128);
        }
        else
        {
          id v10 = (double *)MEMORY[0x1E4F1DB30];
          unint64_t v11 = (double *)(MEMORY[0x1E4F1DB30] + 8);
        }
        BOOL v12 = 0;
      }
      id v14 = objc_msgSend(*(id *)(a1 + 96), "decorate:scaledWithSize:croppedToFit:", v5, v12, *v10, *v11);
      objc_super v15 = [(id)objc_opt_class() _imageReadWriteQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_3;
      block[3] = &unk_1E6DDD938;
      id v20 = *(id *)(a1 + 48);
      id v21 = v14;
      id v22 = WeakRetained;
      id v23 = *(id *)(a1 + 64);
      id v24 = *(id *)(a1 + 72);
      id v25 = *(id *)(a1 + 80);
      id v26 = *(id *)(a1 + 88);
      id v16 = v14;
      dispatch_async(v15, block);

      id v17 = v20;
    }

LABEL_22:
  }
}

uint64_t __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeImageLoadWithImage:*(void *)(a1 + 40) imagePath:*(void *)(a1 + 48) error:*(void *)(a1 + 56) assetKey:*(void *)(a1 + 64) expiryDate:*(void *)(a1 + 72) tags:*(void *)(a1 + 80) requestRecord:*(void *)(a1 + 88)];
}

void __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) statusCancelled] & 1) == 0)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
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
    id v23 = [(VUIImageProxy *)self completionHandler];

    if (v23)
    {
      if (v15)
      {
        id v24 = v15;
      }
      else
      {
        id v24 = +[VUIImage imageWithPath:v16 cacheImmediately:self->_cacheOnLoad];
      }
      id v28 = v24;
      [(VUIImageProxy *)self _callCompletionHandlerWithImage:v24 error:0 finished:1];
    }
    +[VUICoreUtilities image:v15 didCompleteLoadingForCache:1 requestRecord:v22];
    id v29 = self;
    id v30 = v16;
    id v31 = 0;
LABEL_12:
    [(VUIImageProxy *)v29 _callWriteCompletionHandlerWithPath:v30 error:v31 finished:1];
LABEL_13:
    -[VUIImageProxy setIsLoading:](self, "setIsLoading:", 0, v37);
    goto LABEL_14;
  }
  if (!v15)
  {
    if (v21)
    {
      id v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VideosUICoreErrorDomain" code:107 userInfo:0];
      [v22 didFailWithError:v32];
    }
    [(VUIImageProxy *)self _callCompletionHandlerWithImage:0 error:v17 finished:1];
    id v29 = self;
    id v30 = 0;
    id v31 = v17;
    goto LABEL_12;
  }
  char v25 = [MEMORY[0x1E4F29060] isMainThread];
  if (!self->_writeToAssetLibrary)
  {
    char v33 = 0;
    goto LABEL_23;
  }
  char v26 = v25;
  uint64_t v27 = [(VUIImageProxy *)self writeCompletionHandler];
  if (v27)
  {

LABEL_20:
    objc_initWeak(&location, self);
    id v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v39 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v37 = @"VUIAssetDidWriteNotification";
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke;
    v40[3] = &unk_1E6DDD988;
    objc_copyWeak(&v42, &location);
    char v43 = v26;
    id v41 = v22;
    id v34 = [v38 addObserverForName:@"VUIAssetDidWriteNotification" object:v18 queue:v39 usingBlock:v40];
    id imageDidWriteObserver = self->_imageDidWriteObserver;
    self->_id imageDidWriteObserver = v34;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    char v33 = 1;
    goto LABEL_21;
  }
  if (self->_returnImageAfterWrittenToDisk) {
    goto LABEL_20;
  }
  char v33 = 0;
LABEL_21:
  if (self->_writeToAssetLibrary)
  {
    v36 = +[VUIAssetLibrary sharedInstance];
    objc_msgSend(v36, "setImageAsset:forKey:inGroupOfType:expiryDate:tags:", v15, v18, -[VUIImageProxy groupType](self, "groupType"), v19, v20);
  }
LABEL_23:
  if (!self->_returnImageAfterWrittenToDisk)
  {
    +[VUICoreUtilities image:v15 didCompleteLoadingForCache:1 requestRecord:v22];
    [(VUIImageProxy *)self _callCompletionHandlerWithImage:v15 error:0 finished:1];
  }
  if ((v33 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
}

void __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _imageDidWriteHandler:v3];
    if ([v5 returnImageAfterWrittenToDisk])
    {
      id v6 = [v3 userInfo];
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 objectForKeyedSubscript:@"VUIAssetDidWriteNotificationAssetPathKey"];
        if (v8)
        {
          BOOL v9 = +[VUIImage imageWithPath:v8];
          id v10 = v9;
          if (v9)
          {
            if (*(unsigned char *)(a1 + 48))
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke_2;
              block[3] = &unk_1E6DDD510;
              id v13 = v9;
              id v14 = *(id *)(a1 + 32);
              id v15 = v5;
              dispatch_async(MEMORY[0x1E4F14428], block);
            }
            else
            {
              +[VUICoreUtilities image:v9 didCompleteLoadingForCache:1 requestRecord:*(void *)(a1 + 32)];
              [v5 _callCompletionHandlerWithImage:v10 error:0 finished:1];
            }
          }
          else
          {
            unint64_t v11 = VUICImageLogObject();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v17 = v8;
              _os_log_impl(&dword_1E29E1000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create image from file path %@", buf, 0xCu);
            }
          }
        }
      }
    }
  }
}

uint64_t __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke_2(void *a1)
{
  +[VUICoreUtilities image:a1[4] didCompleteLoadingForCache:1 requestRecord:a1[5]];
  uint64_t v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  return [v2 _callCompletionHandlerWithImage:v3 error:0 finished:1];
}

- (void)_imageDidWriteHandler:(id)a3
{
  id v7 = self;
  id v4 = [a3 userInfo];
  if ([(VUIImageProxy *)v7 isLoading])
  {
    uint64_t v5 = [v4 objectForKey:@"VUIAssetDidWriteNotificationAssetPathKey"];
    id v6 = [v4 objectForKey:@"VUIAssetDidWriteNotificationErrorKey"];
    [(VUIImageProxy *)v7 _callWriteCompletionHandlerWithPath:v5 error:v6 finished:1];
  }
  [(VUIImageProxy *)v7 setIsLoading:0];
}

- (id)_decoratorIdentifier
{
  uint64_t v2 = [(VUIImageProxy *)self decorator];
  uint64_t v3 = [v2 decoratorIdentifier];

  return v3;
}

- (id)_decoratedImageAssetKey
{
  uint64_t v3 = [(VUIImageProxy *)self _imageLoaderKey];
  id v4 = [(VUIImageProxy *)self _decoratorIdentifier];
  uint64_t v5 = [(VUIImageProxy *)self _assetKeyWithImageLoaderKey:v3 decoratorIdentifier:v4];
  if ((unint64_t)[v5 length] >= 0x100)
  {
    uint64_t v6 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 255);

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

- (id)_decoratedImageAssetPath
{
  uint64_t v3 = [(VUIImageProxy *)self _decoratedImageAssetKey];
  id v4 = [(VUIImageProxy *)self _imageAssetPathWithAssetKey:v3];

  return v4;
}

- (void)cancel
{
  if ([(VUIImageProxy *)self isLoading])
  {
    BOOL v9 = self;
    if (v9->_imageDidWriteObserver)
    {
      uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 removeObserver:v9->_imageDidWriteObserver];

      id imageDidWriteObserver = v9->_imageDidWriteObserver;
      v9->_id imageDidWriteObserver = 0;
    }
    uint64_t v5 = [(VUIImageProxy *)v9 requestToken];

    if (v5)
    {
      uint64_t v6 = [(VUIImageProxy *)v9 imageLoader];
      id v7 = [(VUIImageProxy *)v9 requestToken];
      [v6 cancelLoad:v7];

      [(VUIImageProxy *)v9 setRequestToken:0];
    }
    uint64_t v8 = [(VUIImageProxy *)v9 decoratorRequestToken];
    [v8 setStatusCancelled:1];

    [(VUIImageProxy *)v9 setDecoratorRequestToken:0];
    [(VUIImageProxy *)v9 setIsLoading:0];
    [(VUIImageProxy *)v9 _callCompletionHandlerWithImage:0 error:0 finished:0];
    [(VUIImageProxy *)v9 _callWriteCompletionHandlerWithPath:0 error:0 finished:0];
  }
}

- (void)setImageLoader:(id)a3
{
}

- (CGSize)dynamicProxyRequestedSize
{
  double width = self->_dynamicProxyRequestedSize.width;
  double height = self->_dynamicProxyRequestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDynamicProxyRequestedSize:(CGSize)a3
{
  self->_dynamicProxyRequestedSize = a3;
}

- (BOOL)cacheOnLoad
{
  return self->_cacheOnLoad;
}

- (void)setAllowsSubstitutionForOriginal:(BOOL)a3
{
  self->_allowsSubstitutionForOriginal = a3;
}

- (void)setWriteCompletionHandler:(id)a3
{
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

- (_VUIDecoratorRequest)decoratorRequestToken
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

- (BOOL)returnImageAfterWrittenToDisk
{
  return self->_returnImageAfterWrittenToDisk;
}

- (void)setReturnImageAfterWrittenToDisk:(BOOL)a3
{
  self->_returnImageAfterWrittenToDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageDidWriteObserver, 0);
  objc_storeStrong((id *)&self->_decoratorRequestToken, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong(&self->_writeCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong(&self->_imageLoader, 0);
  objc_storeStrong(&self->_object, 0);
}

@end