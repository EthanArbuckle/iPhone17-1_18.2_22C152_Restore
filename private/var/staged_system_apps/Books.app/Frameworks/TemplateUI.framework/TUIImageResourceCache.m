@interface TUIImageResourceCache
- (BOOL)shouldDeferLoadForResource:(id)a3;
- (NSBundle)customImageBundle;
- (TUIImageResourceCache)initWithLoader:(id)a3 filters:(id)a4 customImageBundle:(id)a5;
- (id)_largestResourceWithContentAndNaturalSize:(CGSize)a3 contentsScale:(double)a4 cachedResources:(id)a5;
- (id)_symbolImageForKey:(id)a3;
- (id)imageResource:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 withFilter:(id)a6 filterOptions:(id)a7;
- (id)imageResource:(id)a3 tintedWithColor:(id)a4;
- (id)imageResourceForImageResources:(id)a3 filters:(id)a4 imageSetFilter:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7;
- (id)imageResourceForTemplatedURL:(id)a3 baseURL:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6;
- (id)imageResourceForURL:(id)a3 contentsScale:(double)a4;
- (id)mediaBackdropImageResourceFrom:(id)a3 naturalSize:(CGSize)a4 contentScale:(double)a5;
- (id)symbolImageWithName:(id)a3 compatibleWithFontSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6 renderingMode:(unint64_t)a7 colors:(id)a8 style:(unint64_t)a9 contentsScale:(double)a10 layoutDirection:(unint64_t)a11 insets:(UIEdgeInsets)a12 baseline:(BOOL)a13;
- (void)debugDumpFilteredResources:(BOOL)a3;
- (void)deferLoadsBegin;
- (void)deferLoadsEnd;
- (void)refreshAllResources;
@end

@implementation TUIImageResourceCache

- (TUIImageResourceCache)initWithLoader:(id)a3 filters:(id)a4 customImageBundle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v43.receiver = self;
  v43.super_class = (Class)TUIImageResourceCache;
  v12 = [(TUIImageResourceCache *)&v43 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loader, a3);
    objc_storeStrong((id *)&v13->_filters, a4);
    objc_storeStrong((id *)&v13->_customImageBundle, a5);
    dispatch_queue_t v14 = dispatch_queue_create("TUIImageResourceCache.cacheQueue", 0);
    cacheQueue = v13->_cacheQueue;
    v13->_cacheQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("TUIImageResourceCache.resourceQueue", 0);
    resourceQueue = v13->_resourceQueue;
    v13->_resourceQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    cachedURLResources = v13->_cachedURLResources;
    v13->_cachedURLResources = (NSMapTable *)v18;

    uint64_t v20 = objc_opt_new();
    allCachedURLResources = v13->_allCachedURLResources;
    v13->_allCachedURLResources = (NSMutableDictionary *)v20;

    uint64_t v22 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    cachedTintedResources = v13->_cachedTintedResources;
    v13->_cachedTintedResources = (NSMapTable *)v22;

    uint64_t v24 = objc_opt_new();
    allCachedTintedResources = v13->_allCachedTintedResources;
    v13->_allCachedTintedResources = (NSMutableDictionary *)v24;

    uint64_t v26 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    cachedFilteredResources = v13->_cachedFilteredResources;
    v13->_cachedFilteredResources = (NSMapTable *)v26;

    uint64_t v28 = objc_opt_new();
    allCachedFilteredResources = v13->_allCachedFilteredResources;
    v13->_allCachedFilteredResources = (NSMutableDictionary *)v28;

    uint64_t v30 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    cachedSeriesStackResources = v13->_cachedSeriesStackResources;
    v13->_cachedSeriesStackResources = (NSMapTable *)v30;

    uint64_t v32 = objc_opt_new();
    allCachedSeriesStackResources = v13->_allCachedSeriesStackResources;
    v13->_allCachedSeriesStackResources = (NSMutableDictionary *)v32;

    uint64_t v34 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    cachedMediaBackdropResources = v13->_cachedMediaBackdropResources;
    v13->_cachedMediaBackdropResources = (NSMapTable *)v34;

    uint64_t v36 = objc_opt_new();
    allCachedMediaBackdropResources = v13->_allCachedMediaBackdropResources;
    v13->_allCachedMediaBackdropResources = (NSMutableDictionary *)v36;

    uint64_t v38 = +[NSHashTable hashTableWithOptions:517];
    deferLoadResources = v13->_deferLoadResources;
    v13->_deferLoadResources = (NSHashTable *)v38;

    uint64_t v40 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:5];
    cachedSymbolImages = v13->_cachedSymbolImages;
    v13->_cachedSymbolImages = (NSMapTable *)v40;
  }
  return v13;
}

- (void)debugDumpFilteredResources:(BOOL)a3
{
  cacheQueue = self->_cacheQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A7E08;
  v4[3] = &unk_252AC0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(cacheQueue, v4);
}

- (BOOL)shouldDeferLoadForResource:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_deferLoadLock);
  unint64_t deferLoadCount = self->_deferLoadCount;
  if (deferLoadCount)
  {
    deferLoadResources = self->_deferLoadResources;
    ++self->_deferStats;
    [(NSHashTable *)deferLoadResources addObject:v4];
  }
  os_unfair_lock_unlock(&self->_deferLoadLock);

  return deferLoadCount != 0;
}

- (void)deferLoadsBegin
{
  p_deferLoadLock = &self->_deferLoadLock;
  os_unfair_lock_lock(&self->_deferLoadLock);
  unint64_t deferLoadCount = self->_deferLoadCount;
  self->_unint64_t deferLoadCount = deferLoadCount + 1;
  if (!deferLoadCount)
  {
    self->_deferStats = 0;
    BOOL v5 = TUIImageCacheLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_INFO, "Pausing Loads", v6, 2u);
    }
  }
  os_unfair_lock_unlock(p_deferLoadLock);
}

- (void)deferLoadsEnd
{
  p_deferLoadLock = &self->_deferLoadLock;
  os_unfair_lock_lock(&self->_deferLoadLock);
  unint64_t v4 = self->_deferLoadCount - 1;
  self->_unint64_t deferLoadCount = v4;
  if (v4)
  {
    os_unfair_lock_unlock(p_deferLoadLock);
  }
  else
  {
    BOOL v5 = [(NSHashTable *)self->_deferLoadResources allObjects];
    [(NSHashTable *)self->_deferLoadResources removeAllObjects];
    unint64_t deferStats = self->_deferStats;
    os_unfair_lock_unlock(p_deferLoadLock);
    if (v5)
    {
      v7 = TUIImageCacheLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = +[NSNumber numberWithUnsignedInteger:deferStats];
        id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        uint64_t v24 = v9;
        _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_INFO, "Resuming Loads: deferred-loads / post-loads : %@ / %@", buf, 0x16u);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v5;
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = [*(id *)(*((void *)&v16 + 1) + 8 * i) loadImage:v16];
          }
          id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
}

- (id)_largestResourceWithContentAndNaturalSize:(CGSize)a3 contentsScale:(double)a4 cachedResources:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = a5;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    double v12 = width * a4;
    double v13 = height * a4;
    uint64_t v14 = *(void *)v34;
    double v15 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v8);
        }
        long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v17 naturalSize];
        double v19 = v18;
        double v21 = v20;
        [v17 contentsScale];
        double v23 = v22;
        uint64_t v24 = [v17 imageContentWithOptions:1];
        v25 = [v24 image];

        if (v25)
        {
          double v26 = v19 * v23;
          double v27 = v21 * v23;
          if (v19 * v23 >= v12 && v27 >= v13)
          {
            id v31 = v17;

            id v11 = v31;
            goto LABEL_18;
          }
          double v29 = v26 * v27;
          if (v26 * v27 > v15)
          {
            id v30 = v17;

            double v15 = v29;
            id v11 = v30;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
LABEL_18:

  return v11;
}

- (id)imageResourceForTemplatedURL:(id)a3 baseURL:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  double v13 = +[_TUICachedURLImageResource sizedURLFromTemplatedURL:baseURL:naturalSize:contentsScale:](_TUICachedURLImageResource, "sizedURLFromTemplatedURL:baseURL:naturalSize:contentsScale:", v11, v12, width, height, a6);
  uint64_t v14 = [[TUIImageResourceCacheKey alloc] initWithURL:v13];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_A2FB8;
  long long v34 = sub_A2FC8;
  id v35 = 0;
  cacheQueue = self->_cacheQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_A86A8;
  v21[3] = &unk_2546D0;
  id v25 = v12;
  double v26 = &v30;
  double v22 = v14;
  double v23 = self;
  id v24 = v11;
  double v27 = width;
  double v28 = height;
  double v29 = a6;
  id v16 = v12;
  id v17 = v11;
  double v18 = v14;
  dispatch_sync(cacheQueue, v21);
  id v19 = (id)v31[5];

  _Block_object_dispose(&v30, 8);

  return v19;
}

- (id)imageResourceForURL:(id)a3 contentsScale:(double)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = sub_A2FB8;
  double v23 = sub_A2FC8;
  id v24 = 0;
  v7 = +[_TUICachedURLImageResource sizedKeyFromURL:v6];
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A8A18;
  block[3] = &unk_2546F8;
  id v14 = v7;
  double v15 = self;
  id v16 = v6;
  id v17 = &v19;
  double v18 = a4;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(cacheQueue, block);
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v11;
}

- (id)imageResource:(id)a3 tintedWithColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_TUICachedTintedImageResource sizedKeyForColor:v7 imageResource:v6];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = sub_A2FB8;
  id v24 = sub_A2FC8;
  id v25 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A8CD0;
  block[3] = &unk_254720;
  id v18 = v6;
  uint64_t v19 = &v20;
  void block[4] = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_sync(cacheQueue, block);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

- (id)imageResource:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 withFilter:(id)a6 filterOptions:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(TUIFilterRegistry *)self->_filters imageFilterWithIdentifier:v14];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = sub_A2FB8;
  id v35 = sub_A2FC8;
  id v36 = 0;
  if (v16)
  {
    id v17 = +[_TUICachedFilterImageResource sizedKeyForFilter:naturalSize:contentsScale:imageResource:](_TUICachedFilterImageResource, "sizedKeyForFilter:naturalSize:contentsScale:imageResource:", v16, v13, width, height, a5);
    cacheQueue = self->_cacheQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_A8FD8;
    v23[3] = &unk_2546D0;
    double v27 = &v31;
    v23[4] = self;
    id v24 = v17;
    id v25 = v16;
    double v28 = a5;
    id v26 = v13;
    double v29 = width;
    double v30 = height;
    id v19 = v17;
    dispatch_sync(cacheQueue, v23);

    uint64_t v20 = (void *)v32[5];
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (!v20) {
    uint64_t v20 = v13;
  }
  id v21 = v20;
  _Block_object_dispose(&v31, 8);

  return v21;
}

- (id)imageResourceForImageResources:(id)a3 filters:(id)a4 imageSetFilter:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [(TUIFilterRegistry *)self->_filters imageSetFilterWithIdentifier:v15];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_A2FB8;
  id v36 = sub_A2FC8;
  id v37 = 0;
  if (v16)
  {
    id v17 = +[_TUICachedSeriesStackImageResource sizedKeyForNaturalSize:contentsScale:imageResources:](_TUICachedSeriesStackImageResource, "sizedKeyForNaturalSize:contentsScale:imageResources:", v13, width, height, a7);
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A92F0;
    block[3] = &unk_254748;
    double v28 = &v32;
    void block[4] = self;
    id v24 = v17;
    double v29 = a7;
    id v25 = v13;
    id v26 = v14;
    double v30 = width;
    double v31 = height;
    id v27 = v16;
    id v19 = v17;
    dispatch_sync(cacheQueue, block);

    uint64_t v20 = (void *)v33[5];
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v21 = v20;
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (id)symbolImageWithName:(id)a3 compatibleWithFontSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6 renderingMode:(unint64_t)a7 colors:(id)a8 style:(unint64_t)a9 contentsScale:(double)a10 layoutDirection:(unint64_t)a11 insets:(UIEdgeInsets)a12 baseline:(BOOL)a13
{
  double right = a12.right;
  CGFloat bottom = a12.bottom;
  double left = a12.left;
  double top = a12.top;
  id v25 = a3;
  id v26 = a8;
  if ([v25 length])
  {
    id v27 = +[UIImageSymbolConfiguration tui_configurationWithPointSize:a5 weight:a6 scale:a7 renderingMode:v26 colors:a4];
    double v28 = [[_TUISymbolImageKey alloc] initWithName:v25 configuration:v27 style:a9 contentsScale:a11 layoutDirection:a7 renderingMode:a10];
    double v29 = v28;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = sub_A2FB8;
    v60 = sub_A2FC8;
    id v61 = 0;
    if (!a7) {
      goto LABEL_25;
    }
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A994C;
    block[3] = &unk_2528A0;
    v55 = &v56;
    void block[4] = self;
    v54 = v28;
    dispatch_sync(cacheQueue, block);

    if (!v57[5])
    {
LABEL_25:
      uint64_t v31 = [(TUIImageResourceCache *)self _symbolImageForKey:v29];
      uint64_t v32 = (void *)v57[5];
      v57[5] = v31;

      uint64_t v33 = (void *)v57[5];
      if (v33)
      {
        if ([v33 isMulticolor])
        {
          uint64_t v34 = self->_cacheQueue;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_A999C;
          v50[3] = &unk_251800;
          v50[4] = self;
          v51 = v29;
          v52 = &v56;
          dispatch_sync(v34, v50);
        }
      }
    }
    id v35 = (void *)v57[5];
    if (v35)
    {
      double v49 = bottom;
      if (a11 == 2) {
        double v36 = right;
      }
      else {
        double v36 = left;
      }
      if (a11 != 2) {
        double left = right;
      }
      [v35 alignmentInsets];
      [(id)v57[5] contentInsets];
      double v38 = v37;
      [(id)v57[5] size];
      double v48 = v39;
      [(id)v57[5] baselineOffsetFromBottom];
      double v40 = v38 - top;
      v42 = [v57[5] symbolImageWithContentInsets:top, v36, v49, left, 0.0, 0.0, 0.0, 0.0, v41];
      objc_super v43 = v42;
      if (a13)
      {
        [v42 size];
        [v43 symbolImageWithBaselineOffsetFromBottom:v44 - (v48 - v47 - v40)];
      }
      else
      {
        [v42 symbolImageWithoutBaseline];
      v45 = };
    }
    else
    {
      v45 = 0;
    }
    _Block_object_dispose(&v56, 8);
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (id)_symbolImageForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  id v6 = (char *)[v4 style];
  [v4 contentsScale];
  double v8 = v7;
  id v9 = (char *)[v4 layoutDirection];
  id v10 = [v4 configuration];
  id v11 = [v4 renderingMode];

  uint64_t v12 = v6 == (unsigned char *)&def_141F14 + 1;
  if (v6 == (unsigned char *)&def_141F14 + 2) {
    uint64_t v12 = 2;
  }
  if (v9 == (unsigned char *)&def_141F14 + 1) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = -1;
  }
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_A9DA0;
  v52[3] = &unk_254768;
  v52[4] = v12;
  if (v9 == (unsigned char *)&def_141F14 + 2) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13;
  }
  *(double *)&v52[5] = v8;
  v52[6] = v14;
  id v15 = +[UITraitCollection traitCollectionWithTraits:v52];
  id v16 = +[UIImage systemImageNamed:v5 compatibleWithTraitCollection:v15];
  id v17 = [v16 imageWithConfiguration:v10];

  if (!v17)
  {
    id v17 = +[UIImage imageNamed:v5 inBundle:self->_customImageBundle withConfiguration:v10];
    if (!v17)
    {
      id v17 = +[UIImage _systemImageNamed:v5 withConfiguration:v10];
    }
  }
  if (objc_msgSend(v17, "tui_isMulticolorSymbolWithSymbolRenderingMode:", v11))
  {
    [v17 size];
    double v20 = TUISizeRoundedForScale(v18, v19, v8);
    double v22 = v21;
    [v17 contentInsets];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v31 = v20 - (v25 + v29);
    double v32 = v22 - (v23 + v27);
    uint64_t v33 = +[UIGraphicsImageRendererFormat formatForTraitCollection:v15];
    id v34 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v33 format:v31];
    uint64_t v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    objc_super v43 = sub_A9E08;
    double v44 = &unk_254790;
    double v46 = v24;
    double v47 = v26;
    double v48 = v28;
    double v49 = v30;
    double v50 = v31;
    double v51 = v32;
    id v35 = v17;
    id v45 = v35;
    double v36 = [v34 imageWithActions:&v41];

    if (objc_msgSend(v35, "hasBaseline", v41, v42, v43, v44))
    {
      [v35 baselineOffsetFromBottom];
      uint64_t v37 = [v36 imageWithBaselineOffsetFromBottom:];

      double v36 = (void *)v37;
    }
    [v35 alignmentRectInsets];
    double v38 = [v36 imageWithAlignmentRectInsets:];

    double v39 = -[_TUISymbolImage initWithImage:contentInsets:isMulticolor:]([_TUISymbolImage alloc], "initWithImage:contentInsets:isMulticolor:", v38, 1, v24, v26, v28, v30);
  }
  else
  {
    double v39 = [[_TUISymbolImage alloc] initWithImage:v17];
  }

  return v39;
}

- (id)mediaBackdropImageResourceFrom:(id)a3 naturalSize:(CGSize)a4 contentScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = +[_TUICachedMediaBackdropImageResource sizedKeyForNaturalSize:contentsScale:imageResource:](_TUICachedMediaBackdropImageResource, "sizedKeyForNaturalSize:contentsScale:imageResource:", v9, width, height, a5);
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = sub_A2FB8;
  double v27 = sub_A2FC8;
  id v28 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AA008;
  block[3] = &unk_2547B8;
  void block[4] = self;
  id v17 = v10;
  id v18 = v9;
  double v19 = &v23;
  double v20 = a5;
  double v21 = width;
  double v22 = height;
  id v12 = v9;
  id v13 = v10;
  dispatch_sync(cacheQueue, block);
  id v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v14;
}

- (void)refreshAllResources
{
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AA18C;
  block[3] = &unk_251990;
  void block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (NSBundle)customImageBundle
{
  return self->_customImageBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageBundle, 0);
  objc_storeStrong((id *)&self->_deferLoadResources, 0);
  objc_storeStrong((id *)&self->_cachedSymbolImages, 0);
  objc_storeStrong((id *)&self->_allCachedMediaBackdropResources, 0);
  objc_storeStrong((id *)&self->_cachedMediaBackdropResources, 0);
  objc_storeStrong((id *)&self->_allCachedSeriesStackResources, 0);
  objc_storeStrong((id *)&self->_cachedSeriesStackResources, 0);
  objc_storeStrong((id *)&self->_allCachedFilteredResources, 0);
  objc_storeStrong((id *)&self->_cachedFilteredResources, 0);
  objc_storeStrong((id *)&self->_allCachedTintedResources, 0);
  objc_storeStrong((id *)&self->_cachedTintedResources, 0);
  objc_storeStrong((id *)&self->_allCachedURLResources, 0);
  objc_storeStrong((id *)&self->_cachedURLResources, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_filters, 0);

  objc_storeStrong((id *)&self->_loader, 0);
}

@end