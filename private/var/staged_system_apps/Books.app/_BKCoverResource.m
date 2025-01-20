@interface _BKCoverResource
- (BOOL)isImageLoaded;
- (BOOL)isImageLoading;
- (CGSize)naturalSize;
- (NSDictionary)resourceOptions;
- (NSString)assetID;
- (NSURL)url;
- (TUIImageResourceCacheKey)sizedKey;
- (TUIImageResourceCacheKey)unsizedKey;
- (TUIResource)resource;
- (UIImage)coverImage;
- (_BKCoverResource)initWithQueue:(id)a3 notifyQueue:(id)a4 assetID:(id)a5 resourceOptions:(id)a6 naturalSize:(CGSize)a7 contentsScale:(double)a8;
- (double)contentsScale;
- (id)debugFunctionalDescription;
- (id)imageContentWithOptions:(unint64_t)a3;
- (id)loadImage;
- (id)newImageResourceWithSize:(CGSize)a3;
- (void)_nq_loadedImage:(id)a3 withIntrinsicSize:(CGSize)a4;
- (void)_q_loadIfNeeded;
- (void)_q_unload;
- (void)addInterest;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)loadIntrinsicSize;
- (void)removeInterest;
- (void)removeObserver:(id)a3;
- (void)setCoverImage:(id)a3;
@end

@implementation _BKCoverResource

- (_BKCoverResource)initWithQueue:(id)a3 notifyQueue:(id)a4 assetID:(id)a5 resourceOptions:(id)a6 naturalSize:(CGSize)a7 contentsScale:(double)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v37.receiver = self;
  v37.super_class = (Class)_BKCoverResource;
  v20 = [(_BKCoverResource *)&v37 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_queue, a3);
    objc_storeStrong((id *)&v21->_notifyQueue, a4);
    v22 = (NSString *)[v18 copy];
    assetID = v21->_assetID;
    v21->_assetID = v22;

    objc_storeStrong((id *)&v21->_resourceOptions, a6);
    v21->_naturalSize.CGFloat width = width;
    v21->_naturalSize.CGFloat height = height;
    v21->_contentsScale = a8;
    uint64_t v24 = +[NSHashTable hashTableWithOptions:517];
    observers = v21->_observers;
    v21->_observers = (NSHashTable *)v24;

    v21->_interestCount = 0;
    long long v26 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v21->_imageContextInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v21->_imageContextInsets.bottom = v26;
    objc_opt_class();
    v27 = [v19 objectForKeyedSubscript:@"prefersAsyncIntrinsicAspectRatio"];
    v28 = BUDynamicCast();

    double v29 = 156.0;
    if ([v28 BOOLValue])
    {
      char v30 = 0;
      v31 = 0;
    }
    else
    {
      v32 = +[BCCacheManager defaultCacheManager];
      v33 = [v32 metadataForIdentifier:v18];

      v31 = [v33 intrinsicAspectRatio];

      if (v31 && ([v31 doubleValue], v34 > 0.0))
      {
        [v31 doubleValue];
        double v29 = v35 * 100.0;
        char v30 = 1;
      }
      else
      {
        char v30 = 0;
      }
    }
    v21->_intrinsicSize.CGFloat width = 100.0;
    v21->_intrinsicSize.CGFloat height = v29;
    v21->_hasIntrinsic = v30;
  }
  return v21;
}

- (id)debugFunctionalDescription
{
  return +[NSString stringWithFormat:@"assetid:%@", self->_assetID];
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [_BKCoverResource alloc];
  queue = self->_queue;
  notifyQueue = self->_notifyQueue;
  assetID = self->_assetID;
  resourceOptions = self->_resourceOptions;
  double contentsScale = self->_contentsScale;

  return -[_BKCoverResource initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:](v6, "initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:", queue, notifyQueue, assetID, resourceOptions, width, height, contentsScale);
}

- (TUIImageResourceCacheKey)sizedKey
{
  double contentsScale = self->_contentsScale;
  CGFloat v3 = self->_naturalSize.width * contentsScale;
  double v4 = contentsScale * self->_naturalSize.height;
  v5 = [(_BKCoverResource *)self unsizedKey];
  v6 = [v5 cacheKeyWithSize:v3, v4];

  return (TUIImageResourceCacheKey *)v6;
}

- (TUIImageResourceCacheKey)unsizedKey
{
  id v2 = [objc_alloc((Class)TUIImageResourceCacheKey) initWithID:self->_assetID];

  return (TUIImageResourceCacheKey *)v2;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140030;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)_BKCoverResource;
  [(_BKCoverResource *)&v4 dealloc];
}

- (NSURL)url
{
  return 0;
}

- (TUIResource)resource
{
  return 0;
}

- (BOOL)isImageLoaded
{
  return 0;
}

- (BOOL)isImageLoading
{
  return 0;
}

- (id)imageContentWithOptions:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100007040;
  v11 = sub_1000071FC;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014015C;
  block[3] = &unk_100A47F20;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)loadIntrinsicSize
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140304;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)loadImage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100007040;
  v10 = sub_1000071FC;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100140408;
  v5[3] = &unk_100A44170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001405A8;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014065C;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)addInterest
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001406DC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeInterest
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140768;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_q_loadIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_loading)
  {
    id v3 = [(_BKCoverResource *)self coverImage];

    if (!v3)
    {
      self->_loading = 1;
      objc_initWeak(&location, self);
      mainScreenScaleFactor();
      v5 = v4;
      double width = self->_naturalSize.width;
      double height = self->_naturalSize.height;
      id v8 = [(NSDictionary *)self->_resourceOptions objectForKeyedSubscript:@"filter"];
      if ([v8 isEqualToString:BCUCoverEffectsIdentifierSeriesStackDiagonal])
      {
        uint64_t v9 = 32;
      }
      else if ([v8 isEqualToString:BCUCoverEffectsIdentifierSeriesStackHorizontal])
      {
        uint64_t v9 = 4128;
      }
      else if ([v8 isEqualToString:BCUCoverEffectsIdentifierSeriesStackHorizontalRTL])
      {
        uint64_t v9 = 4256;
      }
      else
      {
        uint64_t v9 = 0;
      }
      float v10 = *(double *)&v5 * width;
      float v11 = *(double *)&v5 * height;
      id v12 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", self->_assetID, v9, floorf(v10), floorf(v11));
      [v12 setRequestOptions:8];
      [v12 setPriority:5];
      v13 = _os_activity_create((void *)&_mh_execute_header, "BKCoverResourceProvider/fetching-cover", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001409C4;
      block[3] = &unk_100A47FE8;
      id v17 = v12;
      id v18 = v8;
      id v14 = v8;
      id v15 = v12;
      objc_copyWeak(v19, &location);
      v19[1] = v5;
      os_activity_apply(v13, block);
      objc_destroyWeak(v19);

      objc_destroyWeak(&location);
    }
  }
}

- (void)_q_unload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(_BKCoverResource *)self setCoverImage:0];
  long long v3 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_imageContextInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_imageContextInsets.bottom = v3;
}

- (void)_nq_loadedImage:(id)a3 withIntrinsicSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notifyQueue);
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100007040;
  objc_super v37 = sub_1000071FC;
  id v38 = 0;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_imageContextInsets.top, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_imageContextInsets.bottom, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))))
  {
    double v8 = height / width;
    double width = 100.0;
    double height = v8 * 100.0;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141734;
  block[3] = &unk_100A48010;
  void block[4] = self;
  v25 = &v33;
  double v27 = width;
  double v28 = height;
  id v10 = v7;
  id v24 = v10;
  long long v26 = &v29;
  dispatch_sync(queue, block);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)v34[5];
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v14);
        if (objc_opt_respondsToSelector()) {
          [v15 imageResourceDidChangeImage:self];
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v39 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v30 + 24))
  {
    id v16 = +[TUITransactionOptions noAnimationOptions];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001417D0;
    v18[3] = &unk_100A48038;
    v18[4] = self;
    v18[5] = &v33;
    id v17 = +[TUITransaction currentOrNewTransactionWithOptions:v16 block:v18];
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSDictionary)resourceOptions
{
  return self->_resourceOptions;
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

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverImage, 0);
  objc_storeStrong((id *)&self->_resourceOptions, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end