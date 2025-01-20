@interface _TUICachedSeriesStackImageResource
+ (id)sizedKeyForNaturalSize:(CGSize)a3 contentsScale:(double)a4 imageResources:(id)a5;
+ (id)unsizedKeyForContentsScale:(double)a3 imageResources:(id)a4;
- (BCUImageSetFilter)imageSetFilter;
- (BCUOperation)filterOperation;
- (BOOL)allowsMultipleUpdates;
- (NSArray)filters;
- (NSArray)imageResources;
- (NSMapTable)cgImages;
- (_TUICachedSeriesStackImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resources:(id)a8 filters:(id)a9 imageSetFilter:(id)a10;
- (id)newImageResourceWithSize:(CGSize)a3;
- (id)sizedKey;
- (id)unsizedKey;
- (void)_applyToImages:(id)a3 completion:(id)a4;
- (void)_endFilterOperation:(id)a3;
- (void)_startFilterOperation:(id)a3;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)loadResource;
@end

@implementation _TUICachedSeriesStackImageResource

+ (id)sizedKeyForNaturalSize:(CGSize)a3 contentsScale:(double)a4 imageResources:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  v9 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, width, height, a4);
  v10 = [v8 bu_arrayByInvokingBlock:&stru_254610];

  v11 = [[TUIImageResourceCacheKey alloc] initWithChildren:v10];
  v12 = [(TUIImageResourceCacheKey *)v11 cacheKeyWithFilterInfo:v9];

  return v12;
}

+ (id)unsizedKeyForContentsScale:(double)a3 imageResources:(id)a4
{
  id v5 = a4;
  v6 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, CGSizeZero.width, CGSizeZero.height, a3);
  v7 = [v5 bu_arrayByInvokingBlock:&stru_254630];

  id v8 = [[TUIImageResourceCacheKey alloc] initWithChildren:v7];
  v9 = [(TUIImageResourceCacheKey *)v8 cacheKeyWithFilterInfo:v6];

  return v9;
}

- (_TUICachedSeriesStackImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resources:(id)a8 filters:(id)a9 imageSetFilter:(id)a10
{
  double height = a6.height;
  double width = a6.width;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)_TUICachedSeriesStackImageResource;
  v23 = -[_TUICachedImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:](&v37, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:", a3, a4, a5, width, height, a7);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_imageResources, a8);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = v24->_imageResources;
    id v26 = [(NSArray *)v25 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * (void)v29) addObserver:v24 v33];
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [(NSArray *)v25 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v27);
    }

    objc_storeStrong((id *)&v24->_filters, a9);
    objc_storeStrong((id *)&v24->_imageSetFilter, a10);
    uint64_t v30 = +[NSMapTable strongToStrongObjectsMapTable];
    cgImages = v24->_cgImages;
    v24->_cgImages = (NSMapTable *)v30;

    v24->_operationLock._os_unfair_lock_opaque = 0;
  }

  return v24;
}

- (id)sizedKey
{
  v3 = objc_opt_class();
  [(_TUICachedImageResource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  [(_TUICachedImageResource *)self contentsScale];
  double v9 = v8;
  v10 = [(_TUICachedSeriesStackImageResource *)self imageResources];
  v11 = [v3 sizedKeyForNaturalSize:v10 contentsScale:v5 imageResources:v7];

  return v11;
}

- (id)unsizedKey
{
  v3 = objc_opt_class();
  [(_TUICachedImageResource *)self contentsScale];
  double v5 = v4;
  double v6 = [(_TUICachedSeriesStackImageResource *)self imageResources];
  double v7 = [v3 unsizedKeyForContentsScale:v6 imageResources:v5];

  return v7;
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(_TUICachedSeriesStackImageResource *)self imageResources];
  double v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    double v12 = CGSizeZero.height;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v13) newImageResourceWithSize:CGSizeZero.width v12, (void)v23];
        [v7 addObject:v14];

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cache);
  v16 = [(_TUICachedSeriesStackImageResource *)self filters];
  v17 = [v16 valueForKeyPath:@"identifier"];
  v18 = [(_TUICachedSeriesStackImageResource *)self imageSetFilter];
  v19 = [v18 identifier];
  [(_TUICachedImageResource *)self contentsScale];
  id v21 = [WeakRetained imageResourceForImageResources:v7 filters:v17 imageSetFilter:v19 naturalSize:CGSizeMake(width, height) contentsScale:v20];

  return v21;
}

- (BOOL)allowsMultipleUpdates
{
  return 1;
}

- (void)loadResource
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(_TUICachedSeriesStackImageResource *)self imageResources];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) loadImage];
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_TUICachedSeriesStackImageResource *)self cgImages];
  if ([v4 isImageLoaded])
  {
    double v6 = [v4 imageContentWithOptions:1];
    id v7 = [v6 image];
    id v8 = [v7 CGImage];

    if (v8)
    {
      [v5 setObject:v8 forKey:v4];
    }
    else
    {
      long long v9 = TUIImageCacheLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1917D8(v4, v9);
      }
    }
  }
  long long v10 = [(_TUICachedSeriesStackImageResource *)self imageResources];
  id v11 = [v10 count];
  id v12 = [v5 count];
  v13 = TUIImageCacheLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12 == v11)
  {
    long long v25 = self;
    if (v14) {
      sub_191750((uint64_t)v5, (uint64_t)v11, v13);
    }

    v13 = +[NSMutableArray arrayWithCapacity:v11];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v24 = v10;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v21 = [v5 objectForKey:v20, v24];
          if (v21)
          {
            [v13 addObject:v21];
          }
          else
          {
            id v22 = TUIImageCacheLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              long long v23 = [v4 url];
              *(_DWORD *)buf = 134218242;
              id v34 = v20;
              __int16 v35 = 2112;
              id v36 = v23;
              _os_log_error_impl(&def_141F14, v22, OS_LOG_TYPE_ERROR, "Map tapble for key ImageResouce %p (%@) has no CGImageRef.", buf, 0x16u);
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v17);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_A6EE0;
    v26[3] = &unk_254658;
    id v27 = v5;
    uint64_t v28 = v25;
    [(_TUICachedSeriesStackImageResource *)v25 _applyToImages:v13 completion:v26];

    long long v10 = v24;
  }
  else if (v14)
  {
    *(_DWORD *)buf = 134218496;
    id v34 = v12;
    __int16 v35 = 2048;
    id v36 = v11;
    __int16 v37 = 2048;
    v38 = v5;
    _os_log_debug_impl(&def_141F14, v13, OS_LOG_TYPE_DEBUG, "Got %ld out of %ld images, skip series cover generation. <%p>", buf, 0x20u);
  }
}

- (void)_startFilterOperation:(id)a3
{
  id v4 = (BCUOperation *)a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  filterOperation = self->_filterOperation;
  self->_filterOperation = v4;
  id v8 = v4;
  id v7 = filterOperation;

  os_unfair_lock_unlock(p_operationLock);
  [(BCUOperation *)v7 cancel];
  [(BCUOperation *)v8 start];
}

- (void)_endFilterOperation:(id)a3
{
  id v4 = (BCUOperation *)a3;
  os_unfair_lock_lock(&self->_operationLock);
  if (self->_filterOperation == v4)
  {
    self->_filterOperation = 0;
  }
  os_unfair_lock_unlock(&self->_operationLock);
}

- (void)_applyToImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TUICachedSeriesStackImageResource *)self imageSetFilter];
  long long v9 = [(_TUICachedSeriesStackImageResource *)self filters];
  [(_TUICachedImageResource *)self naturalSize];
  double v11 = v10;
  double v13 = v12;
  [(_TUICachedImageResource *)self contentsScale];
  double v15 = v14;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  double v20 = sub_A71E4;
  id v21 = &unk_254680;
  id v22 = self;
  id v23 = v6;
  id v16 = v6;
  id v17 = [v8 newOperationWithImages:v7 filters:v9 size:1 contentsScale:&v18 waitForCPUSynchronization:v11 completion:v13];

  -[_TUICachedSeriesStackImageResource _startFilterOperation:](self, "_startFilterOperation:", v17, v18, v19, v20, v21, v22);
}

- (BCUOperation)filterOperation
{
  return self->_filterOperation;
}

- (NSArray)imageResources
{
  return self->_imageResources;
}

- (NSArray)filters
{
  return self->_filters;
}

- (BCUImageSetFilter)imageSetFilter
{
  return self->_imageSetFilter;
}

- (NSMapTable)cgImages
{
  return self->_cgImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cgImages, 0);
  objc_storeStrong((id *)&self->_imageSetFilter, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);

  objc_storeStrong((id *)&self->_filterOperation, 0);
}

@end