@interface IMRenderingCacheOperation
- (CGSize)desiredSize;
- (IMRenderingCache)imageCache;
- (IMRenderingCacheOperation)initWithOptions:(int64_t)a3;
- (NSString)assetID;
- (NSString)masterImageKey;
- (NSString)storageKey;
- (SEL)selector;
- (id)callbackInvocationWithImage:(id)a3;
- (id)context;
- (id)description;
- (id)generateImage:(CGSize)a3;
- (id)renderingCacheCallbackInvocationWithImage:(id)a3;
- (id)renderingCacheCallbackInvocationWithImage:(id)a3 pageNumber:(int64_t)a4;
- (id)target;
- (int)serializeFormat;
- (int64_t)options;
- (void)cancel;
- (void)clearCallbackState;
- (void)dealloc;
- (void)main;
- (void)performCallbackWithImage:(id)a3;
- (void)performOperation;
- (void)setAssetID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDesiredSize:(CGSize)a3;
- (void)setImageCache:(id)a3;
- (void)setMasterImageKey:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setSerializeFormat:(int)a3;
- (void)setStorageKey:(id)a3;
- (void)setTarget:(id)a3;
- (void)storeImage:(id)a3 forKey:(id)a4 size:(CGSize)a5;
@end

@implementation IMRenderingCacheOperation

- (IMRenderingCacheOperation)initWithOptions:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMRenderingCacheOperation;
  v4 = [(IMRenderingCacheOperation *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(IMRenderingCacheOperation *)v4 setSerializeFormat:1];
    v5->_options = a3;
  }
  return v5;
}

- (void)dealloc
{
  [(IMRenderingCacheOperation *)self clearCallbackState];
  v3.receiver = self;
  v3.super_class = (Class)IMRenderingCacheOperation;
  [(IMRenderingCacheOperation *)&v3 dealloc];
}

- (void)clearCallbackState
{
  obj = self;
  objc_sync_enter(obj);
  objc_storeWeak(&obj->_target, 0);
  obj->_selector = 0;
  id context = obj->_context;
  obj->_id context = 0;

  objc_sync_exit(obj);
}

- (void)cancel
{
  [(IMRenderingCacheOperation *)self clearCallbackState];
  v3.receiver = self;
  v3.super_class = (Class)IMRenderingCacheOperation;
  [(IMRenderingCacheOperation *)&v3 cancel];
}

- (id)generateImage:(CGSize)a3
{
  return 0;
}

- (id)callbackInvocationWithImage:(id)a3
{
  return 0;
}

- (id)renderingCacheCallbackInvocationWithImage:(id)a3 pageNumber:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  objc_sync_enter(v7);
  v8 = [(IMRenderingCacheOperation *)v7 target];
  v9 = [(IMRenderingCacheOperation *)v7 selector];
  v10 = [(IMRenderingCacheOperation *)v7 context];
  objc_sync_exit(v7);

  v11 = 0;
  if (v8 && v9)
  {
    v12 = [[AEBookRenderingCallbackTargetProxy alloc] initWithTarget:v8];
    int64_t v18 = a4;
    v13 = [v8 methodSignatureForSelector:v9];
    v14 = (char *)[v13 numberOfArguments];
    v11 = +[NSInvocation invocationWithMethodSignature:v13];
    [v11 setSelector:v9];
    [v11 setTarget:v12];
    id v17 = v6;
    [v11 setArgument:&v17 atIndex:2];
    if ((unint64_t)(v14 - 2) >= 2)
    {
      v16 = v10;
      [v11 setArgument:&v16 atIndex:3];
      if ((unint64_t)(v14 - 2) >= 3) {
        [v11 setArgument:&v18 atIndex:4];
      }
    }
    [v11 retainArguments];

    v10 = 0;
    v8 = 0;
  }

  return v11;
}

- (id)renderingCacheCallbackInvocationWithImage:(id)a3
{
  return [(IMRenderingCacheOperation *)self renderingCacheCallbackInvocationWithImage:a3 pageNumber:1];
}

- (void)storeImage:(id)a3 forKey:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IMRenderingCacheOperation *)self imageCache];
  [v11 storeImage:v10 forKey:v9 size:width format:[self serializeFormat]];
}

- (void)performOperation
{
  if ([(IMRenderingCacheOperation *)self isCancelled]) {
    return;
  }
  objc_super v3 = [(IMRenderingCacheOperation *)self target];

  v4 = [(IMRenderingCacheOperation *)self imageCache];
  v5 = [(IMRenderingCacheOperation *)self storageKey];

  if (v5)
  {
    id v6 = [(IMRenderingCacheOperation *)self storageKey];
    if (v3)
    {
      id v24 = [v4 fetchImageForKey:v6];

      if (v24)
      {
LABEL_22:
        if (([(IMRenderingCacheOperation *)self isCancelled] & 1) == 0) {
          [(IMRenderingCacheOperation *)self performCallbackWithImage:v24];
        }
        goto LABEL_24;
      }
LABEL_9:
      [v4 primaryImageSize];
      double v11 = v9;
      double v12 = v10;
      BOOL v13 = v9 == CGSizeZero.width && v10 == CGSizeZero.height;
      if (v13
        || ((p_desiredSize = &self->_desiredSize, self->_desiredSize.width == v9)
          ? (BOOL v15 = self->_desiredSize.height == v10)
          : (BOOL v15 = 0),
            v15
         || ([(IMRenderingCacheOperation *)self masterImageKey],
             v16 = objc_claimAutoreleasedReturnValue(),
             id v17 = [v16 length],
             v16,
             !v17)
         || p_desiredSize->width > v11
         || self->_desiredSize.height > v12))
      {
        -[IMRenderingCacheOperation generateImage:](self, "generateImage:", self->_desiredSize.width, self->_desiredSize.height);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        int64_t v18 = [(IMRenderingCacheOperation *)self storageKey];
        double width = self->_desiredSize.width;
        double height = self->_desiredSize.height;
      }
      else
      {
        v21 = [(IMRenderingCacheOperation *)self masterImageKey];
        v22 = [v4 fetchImageForKey:v21 canAcceptSurfaceBacked:0];

        if (!v22)
        {
          v22 = -[IMRenderingCacheOperation generateImage:](self, "generateImage:", v11, v12);
          v23 = [(IMRenderingCacheOperation *)self masterImageKey];
          -[IMRenderingCacheOperation storeImage:forKey:size:](self, "storeImage:forKey:size:", v22, v23, v11, v12);
        }
        +[IMThumbnailUtilities scaleImage:toSize:options:](IMThumbnailUtilities, "scaleImage:toSize:options:", v22, [(IMRenderingCacheOperation *)self options], self->_desiredSize.width, self->_desiredSize.height);
        id v24 = (id)objc_claimAutoreleasedReturnValue();

        int64_t v18 = [(IMRenderingCacheOperation *)self storageKey];
        double width = p_desiredSize->width;
        double height = self->_desiredSize.height;
      }
      -[IMRenderingCacheOperation storeImage:forKey:size:](self, "storeImage:forKey:size:", v24, v18, width, height);

      goto LABEL_22;
    }
    uint64_t v8 = [v4 hasImageForKey:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    [(IMRenderingCacheOperation *)self desiredSize];
    id v7 = -[IMRenderingCacheOperation generateImage:](self, "generateImage:");
  }
  id v24 = 0;
LABEL_24:
}

- (void)performCallbackWithImage:(id)a3
{
  id v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id WeakRetained = objc_loadWeakRetained(&v4->_target);
  if (!WeakRetained || !v4->_selector)
  {

    objc_sync_exit(v4);
    goto LABEL_9;
  }

  objc_sync_exit(v4);
  if (([(IMRenderingCacheOperation *)v4 isCancelled] & 1) == 0)
  {
    unsigned __int8 v6 = +[NSThread isMainThread];
    id v7 = [(IMRenderingCacheOperation *)v4 callbackInvocationWithImage:v8];
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      [(IMRenderingCacheOperation *)v7 performSelectorOnMainThread:"invoke" withObject:0 waitUntilDone:1];
      goto LABEL_14;
    }
    if (v7)
    {
      [(IMRenderingCacheOperation *)v7 invoke];
LABEL_14:
      [(IMRenderingCacheOperation *)v4 setTarget:0];
    }
LABEL_9:
  }
}

- (void)main
{
  if (([(IMRenderingCacheOperation *)self isCancelled] & 1) == 0)
  {
    [(IMRenderingCacheOperation *)self performOperation];
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  assetID = self->_assetID;
  storageKey = self->_storageKey;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  id context = self->_context;
  id v8 = NSStringFromCGSize(self->_desiredSize);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> [AssetID: %@] [Key: %@] [Target: %p; %p] [Size: %@]",
    v3,
    self,
    assetID,
    storageKey,
    WeakRetained,
    context,
  double v9 = v8);

  return v9;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_selector = v3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (CGSize)desiredSize
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->_desiredSize = a3;
}

- (NSString)storageKey
{
  return self->_storageKey;
}

- (void)setStorageKey:(id)a3
{
}

- (NSString)masterImageKey
{
  return self->_masterImageKey;
}

- (void)setMasterImageKey:(id)a3
{
}

- (IMRenderingCache)imageCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageCache);

  return (IMRenderingCache *)WeakRetained;
}

- (void)setImageCache:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (int)serializeFormat
{
  return self->_serializeFormat;
}

- (void)setSerializeFormat:(int)a3
{
  self->_serializeFormat = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageCache);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_masterImageKey, 0);

  objc_storeStrong((id *)&self->_storageKey, 0);
}

@end