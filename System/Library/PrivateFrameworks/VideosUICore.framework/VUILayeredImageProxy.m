@interface VUILayeredImageProxy
+ (id)_loadingQueue;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageAvailable;
- (BOOL)isLoading;
- (NSString)assetKey;
- (NSURL)url;
- (VUILayeredImageProxy)initWithURL:(id)a3;
- (VUILayeredImageProxy)initWithURL:(id)a3 groupType:(int64_t)a4;
- (VUILayeredImageProxy)initWithURL:(id)a3 groupType:(int64_t)a4 assetKey:(id)a5;
- (id)_assetPathWithAssetKey:(id)a3;
- (id)description;
- (int64_t)groupType;
- (unint64_t)hash;
- (void)cancel;
- (void)dealloc;
- (void)loadWithCompletion:(id)a3;
- (void)setCancelled:(BOOL)a3;
@end

@implementation VUILayeredImageProxy

- (VUILayeredImageProxy)initWithURL:(id)a3
{
  return [(VUILayeredImageProxy *)self initWithURL:a3 groupType:0];
}

- (VUILayeredImageProxy)initWithURL:(id)a3 groupType:(int64_t)a4
{
  return [(VUILayeredImageProxy *)self initWithURL:a3 groupType:0 assetKey:0];
}

- (VUILayeredImageProxy)initWithURL:(id)a3 groupType:(int64_t)a4 assetKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)VUILayeredImageProxy;
  v10 = [(VUILayeredImageProxy *)&v21 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    v10->_groupType = a4;
    uint64_t v13 = [v9 copy];
    assetKey = v10->_assetKey;
    v10->_assetKey = (NSString *)v13;

    if (!v10->_assetKey)
    {
      v15 = [(NSURL *)v10->_url absoluteString];
      uint64_t v16 = objc_msgSend(v15, "vui_SHA256String");
      v17 = v10->_assetKey;
      v10->_assetKey = (NSString *)v16;
    }
    v18 = [[_TVURLSessionDownloadTaskWrapper alloc] initWithURL:v10->_url];
    downloadTaskWrapper = v10->_downloadTaskWrapper;
    v10->_downloadTaskWrapper = v18;

    v10->_cancelled = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(VUILayeredImageProxy *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)VUILayeredImageProxy;
  [(VUILayeredImageProxy *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VUILayeredImageProxy;
  v4 = [(VUILayeredImageProxy *)&v8 description];
  v5 = [(VUILayeredImageProxy *)self url];
  v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(VUILayeredImageProxy *)self url];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 url];
    v6 = [(VUILayeredImageProxy *)self url];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      v7 = [v4 url];
      objc_super v8 = [(VUILayeredImageProxy *)self url];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)cancel
{
  if ([(VUILayeredImageProxy *)self isLoading]) {
    [(_TVURLSessionDownloadTaskWrapper *)self->_downloadTaskWrapper cancel];
  }
  [(VUILayeredImageProxy *)self setCancelled:1];
}

- (BOOL)isLoading
{
  return [(_TVURLSessionDownloadTaskWrapper *)self->_downloadTaskWrapper state] == 0;
}

- (BOOL)isImageAvailable
{
  unint64_t v3 = [(VUILayeredImageProxy *)self assetKey];
  id v4 = [(VUILayeredImageProxy *)self _assetPathWithAssetKey:v3];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (void)loadWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(VUILayeredImageProxy *)self isLoading])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-loadWithCompletion: called on an already loading VUILayeredImageProxy"];
  }
  else
  {
    [(VUILayeredImageProxy *)self setCancelled:0];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__VUILayeredImageProxy_loadWithCompletion___block_invoke;
    v16[3] = &unk_1E6DDDA78;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    id v17 = v4;
    BOOL v5 = (void (**)(void, void, void))MEMORY[0x1E4E604D0](v16);
    +[VUIPagePerformanceController postNotificationForImageProxy:self withLoadingStatus:1 withError:0];
    v6 = [(VUILayeredImageProxy *)self assetKey];
    v7 = [(VUILayeredImageProxy *)self _assetPathWithAssetKey:v6];
    if (v7
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          objc_super v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 fileExistsAtPath:v7],
          v8,
          v9))
    {
      ((void (**)(void, void *, void))v5)[2](v5, v7, 0);
    }
    else
    {
      objc_initWeak(&from, self);
      downloadTaskWrapper = self->_downloadTaskWrapper;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_3;
      v11[3] = &unk_1E6DDDAA0;
      objc_copyWeak(&v14, &from);
      id v12 = v6;
      uint64_t v13 = v5;
      [(_TVURLSessionDownloadTaskWrapper *)downloadTaskWrapper resumeWithCompletionHandler:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __43__VUILayeredImageProxy_loadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    +[VUIPagePerformanceController postNotificationForImageProxy:WeakRetained withLoadingStatus:0 withError:v6];
  }
  objc_super v8 = [(id)objc_opt_class() _loadingQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6DDDA50;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v9;
  id v13 = v6;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);

  objc_destroyWeak(&v16);
}

void __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(void *)(a1 + 48))
  {
    id v7 = WeakRetained;
    unint64_t v3 = *(void **)(a1 + 32);
    if (v3 || ([WeakRetained isCancelled] & 1) == 0)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
    }
    id v5 = v4;
    id v6 = 0;
    if (*(void *)(a1 + 40) && !v4) {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithContentsOfFile:*(void *)(a1 + 40)];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    id WeakRetained = v7;
  }
}

void __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_opt_class();
    BOOL v10 = (objc_opt_isKindOfClass() & 1) == 0 || [v7 statusCode] == 200;
    id v11 = [v16 path];

    id v12 = 0;
    if (v11 && v10)
    {
      id v13 = +[VUIAssetLibrary sharedInstance];
      id v14 = objc_msgSend(v13, "assetExpiryDateForKey:inGroupOfType:", *(void *)(a1 + 32), objc_msgSend(WeakRetained, "groupType"));
      id v15 = [v16 path];
      [v13 setImageAssetFromPath:v15 forKey:*(void *)(a1 + 32) inGroupOfType:0 expiryDate:v14];

      id v12 = objc_msgSend(v13, "assetPathForKey:inGroupOfType:", *(void *)(a1 + 32), objc_msgSend(WeakRetained, "groupType"));
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)_loadingQueue
{
  if (_loadingQueue___once != -1) {
    dispatch_once(&_loadingQueue___once, &__block_literal_global_19);
  }
  v2 = (void *)_loadingQueue___loadingQueue;
  return v2;
}

void __37__VUILayeredImageProxy__loadingQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.videosuicore.VUILayeredImageProxy", 0);
  v1 = (void *)_loadingQueue___loadingQueue;
  _loadingQueue___loadingQueue = (uint64_t)v0;

  v2 = _loadingQueue___loadingQueue;
  unint64_t v3 = dispatch_get_global_queue(17, 0);
  dispatch_set_target_queue(v2, v3);
}

- (id)_assetPathWithAssetKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[VUIAssetLibrary sharedInstance];
    id v6 = [v5 assetPathForKey:v4 inGroupOfType:self->_groupType];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_downloadTaskWrapper, 0);
}

@end