@interface _TUICachedImageResource
- (BOOL)_q_shouldLoadResourceIfNeededAllowDefer:(BOOL)a3;
- (BOOL)allowsMultipleUpdates;
- (BOOL)isImageLoaded;
- (BOOL)isImageLoading;
- (CGSize)naturalSize;
- (NSURL)url;
- (TUIImageResourceCacheKey)sizedKey;
- (TUIImageResourceCacheKey)unsizedKey;
- (TUIResource)resource;
- (_TUICachedImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7;
- (double)contentsScale;
- (id)debugFunctionalDescription;
- (id)imageContentWithOptions:(unint64_t)a3;
- (id)loadImage;
- (id)newImageResourceWithSize:(CGSize)a3;
- (void)_loadedImage:(id)a3 insets:(UIEdgeInsets)a4;
- (void)_loadedImage:(id)a3 insets:(UIEdgeInsets)a4 temporary:(BOOL)a5;
- (void)_q_loadIntrinsicSize:(CGSize)a3;
- (void)_q_loadedImage:(id)a3 insets:(UIEdgeInsets)a4;
- (void)_q_unloadResource;
- (void)_refresh;
- (void)addInterest;
- (void)addNonVolatileInterest;
- (void)addObserver:(id)a3;
- (void)deferredLoadImageIfNeeded;
- (void)loadIntrinsicSize;
- (void)loadLargestLoadedImageAsTemporary;
- (void)pauseUnload;
- (void)removeInterest;
- (void)removeNonVolatileInterest;
- (void)removeObserver:(id)a3;
- (void)resumeUnload;
- (void)updateImage:(id)a3;
- (void)updateImage:(id)a3 allowUnload:(BOOL)a4 temporary:(BOOL)a5;
@end

@implementation _TUICachedImageResource

- (_TUICachedImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_TUICachedImageResource;
  v16 = [(_TUICachedImageResource *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_cache, v13);
    objc_storeStrong((id *)&v17->_unsizedCacheSet, a4);
    objc_storeStrong((id *)&v17->_queue, a5);
    v17->_naturalSize.CGFloat width = width;
    v17->_naturalSize.CGFloat height = height;
    v17->_contentsScale = a7;
    uint64_t v18 = +[NSHashTable hashTableWithOptions:517];
    observers = v17->_observers;
    v17->_observers = (NSHashTable *)v18;

    *(unsigned char *)&v17->_state &= 0xF8u;
    v17->_intrinsicSize = CGSizeZero;
    [(_TUIImageResourceUnsizedCacheSet *)v17->_unsizedCacheSet addImageResource:v17];
  }

  return v17;
}

- (TUIImageResourceCacheKey)sizedKey
{
  v2 = objc_alloc_init(TUIImageResourceCacheKey);

  return v2;
}

- (TUIImageResourceCacheKey)unsizedKey
{
  v2 = objc_alloc_init(TUIImageResourceCacheKey);

  return v2;
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  return 0;
}

- (TUIResource)resource
{
  return (TUIResource *)self->_url;
}

- (BOOL)allowsMultipleUpdates
{
  return 0;
}

- (void)addInterest
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A2A40;
  v4[3] = &unk_2519E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(_TUICachedImageResource *)self loadResource];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)removeInterest
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A2AFC;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)addNonVolatileInterest
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A2BF8;
  v4[3] = &unk_2519E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(_TUICachedImageResource *)self loadResource];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)deferredLoadImageIfNeeded
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A2D54;
  v4[3] = &unk_2519E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(_TUICachedImageResource *)self loadResource];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)removeNonVolatileInterest
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A2E10;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)loadImage
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_A2FB8;
  v11 = sub_A2FC8;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A2FD0;
  block[3] = &unk_2544B8;
  block[4] = self;
  void block[5] = &v13;
  block[6] = &v7;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v14 + 24)) {
    [(_TUICachedImageResource *)self loadResource];
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

- (BOOL)_q_shouldLoadResourceIfNeededAllowDefer:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char state = (char)self->_state;
  if (state & 0xA) == 2 || (state) {
    return 0;
  }
  if (self->_image) {
    BOOL v7 = !v3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
    unsigned __int8 v9 = [WeakRetained shouldDeferLoadForResource:self];

    if (v9) {
      return 0;
    }
    char state = (char)self->_state;
  }
  *(unsigned char *)&self->_char state = state | 1;
  return 1;
}

- (void)_q_unloadResource
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  image = self->_image;
  self->_image = 0;

  long long v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_insets.bottom = v4;
  *(unsigned char *)&self->_state &= 0xFCu;
}

- (void)_refresh
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A323C;
  v4[3] = &unk_2519E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(_TUICachedImageResource *)self loadResource];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)pauseUnload
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A32F8;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resumeUnload
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A3380;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_loadedImage:(id)a3 insets:(UIEdgeInsets)a4
{
}

- (void)_loadedImage:(id)a3 insets:(UIEdgeInsets)a4 temporary:(BOOL)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v11 = a3;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_A2FB8;
  v53 = sub_A2FC8;
  id v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A3770;
  block[3] = &unk_2544E0;
  BOOL v39 = a5;
  block[4] = self;
  v31 = &v45;
  v32 = v44;
  id v13 = v11;
  CGFloat v35 = top;
  CGFloat v36 = left;
  CGFloat v37 = bottom;
  CGFloat v38 = right;
  id v30 = v13;
  v33 = &v40;
  v34 = &v49;
  dispatch_sync(queue, block);
  id v14 = (void *)v50[5];
  if (v14)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v26;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v18);
          if (objc_opt_respondsToSelector()) {
            [v19 imageResourceDidChangeImage:self];
          }
          uint64_t v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v15 countByEnumeratingWithState:&v25 objects:v55 count:16];
      }
      while (v16);
    }

    if (*((unsigned char *)v41 + 24))
    {
      v20 = +[TUITransactionOptions defaultImplicitOptions];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_A398C;
      v24[3] = &unk_254508;
      v24[4] = self;
      v24[5] = &v49;
      id v21 = +[TUITransaction currentOrNewTransactionWithOptions:v20 block:v24];
    }
  }
  if (*((unsigned char *)v46 + 24))
  {
    v22 = self->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_A3AB4;
    v23[3] = &unk_2519E0;
    v23[4] = self;
    v23[5] = v44;
    dispatch_sync(v22, v23);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

- (void)_q_loadIntrinsicSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_intrinsicSize.CGFloat width = width;
  self->_intrinsicSize.CGFloat height = height;
  *(unsigned char *)&self->_state |= 4u;
}

- (void)_q_loadedImage:(id)a3 insets:(UIEdgeInsets)a4
{
}

- (void)updateImage:(id)a3
{
}

- (void)updateImage:(id)a3 allowUnload:(BOOL)a4 temporary:(BOOL)a5
{
  id v8 = a3;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = sub_A2FB8;
  v52 = sub_A2FC8;
  id v53 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  unsigned __int8 v9 = [v8 image];
  [v8 insets];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A3E74;
  block[3] = &unk_254530;
  block[4] = self;
  id v19 = v9;
  uint64_t v37 = v11;
  uint64_t v38 = v13;
  uint64_t v39 = v15;
  uint64_t v40 = v17;
  BOOL v41 = a5;
  id v33 = v19;
  v34 = &v44;
  BOOL v42 = a4;
  CGFloat v35 = v43;
  CGFloat v36 = &v48;
  dispatch_sync(queue, block);
  v20 = (void *)v49[5];
  if (v20)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v54 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v29;
      do
      {
        v24 = 0;
        do
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v24);
          if (objc_opt_respondsToSelector()) {
            [v25 imageResourceDidChangeImage:self];
          }
          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v21 countByEnumeratingWithState:&v28 objects:v54 count:16];
      }
      while (v22);
    }
  }
  if (*((unsigned char *)v45 + 24))
  {
    long long v26 = self->_queue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_A3FC0;
    v27[3] = &unk_2519E0;
    v27[4] = self;
    v27[5] = v43;
    dispatch_sync(v26, v27);
  }

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

- (id)imageContentWithOptions:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_A2FB8;
  uint64_t v11 = sub_A2FC8;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A40DC;
  block[3] = &unk_254558;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)isImageLoaded
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A4244;
  v5[3] = &unk_252B50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isImageLoading
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A431C;
  v5[3] = &unk_252B50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadIntrinsicSize
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A4408;
  v4[3] = &unk_2519E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(_TUICachedImageResource *)self loadResource];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_A44F0;
    v7[3] = &unk_251828;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_A45A4;
    v7[3] = &unk_251828;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)loadLargestLoadedImageAsTemporary
{
  -[_TUIImageResourceUnsizedCacheSet largestResourceWithContentAndNaturalSize:contentsScale:](self->_unsizedCacheSet, "largestResourceWithContentAndNaturalSize:contentsScale:", self->_naturalSize.width, self->_naturalSize.height, self->_contentsScale);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = [v5 imageContentWithOptions:1];
  id v4 = [v3 image];

  if (v4) {
    [(_TUICachedImageResource *)self updateImage:v3 allowUnload:0 temporary:1];
  }
}

- (id)debugFunctionalDescription
{
  return @"unknown";
}

- (NSURL)url
{
  return self->_url;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_unsizedCacheSet, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end