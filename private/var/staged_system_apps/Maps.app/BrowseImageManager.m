@interface BrowseImageManager
+ (id)sharedImageCache;
- (BOOL)_isNightMode;
- (BOOL)isTransparencyEnabled;
- (BrowseImageManager)init;
- (BrowseManager)browseManager;
- (CGSize)desiredImageSize;
- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate;
- (NSOperationQueue)imageOperationQueue;
- (double)_screenScaleForScale:(double)a3 isCarplay:(BOOL)a4;
- (id)_cachedImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 outputCategoryKey:(id *)a7;
- (id)_createImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 nightMode:(BOOL)a7;
- (id)_scaleImage:(id)a3 ifNeededToFitSize:(CGSize)a4;
- (id)synchronousImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6;
- (id)transparentImageForCategory:(id)a3;
- (void)imageForCategory:(id)a3 resultHandler:(id)a4;
- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 isTouchBar:(BOOL)a7 resultHandler:(id)a8;
- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 resultHandler:(id)a7;
- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 resultHandler:(id)a6;
- (void)imageForCategory:(id)a3 traits:(id)a4 resultHandler:(id)a5;
- (void)maskedImage:(id)a3 inRect:(CGRect)a4 withColor:(CGColor *)a5 inContext:(CGContext *)a6;
- (void)setBrowseManager:(id)a3;
- (void)setDesiredImageSize:(CGSize)a3;
- (void)setTransparencyEnabled:(BOOL)a3;
- (void)setUserInterfaceDelegate:(id)a3;
@end

@implementation BrowseImageManager

- (BrowseImageManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)BrowseImageManager;
  v2 = [(BrowseImageManager *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    imageOperationQueue = v2->_imageOperationQueue;
    v2->_imageOperationQueue = v3;

    [(NSOperationQueue *)v2->_imageOperationQueue setName:@"com.apple.Maps.BrowseImageManager.CreateImage"];
    [(NSOperationQueue *)v2->_imageOperationQueue setMaxConcurrentOperationCount:2];
    [(NSOperationQueue *)v2->_imageOperationQueue setQualityOfService:25];
  }
  return v2;
}

+ (id)sharedImageCache
{
  if (qword_10160FF60 != -1) {
    dispatch_once(&qword_10160FF60, &stru_1013002C0);
  }
  v2 = (void *)qword_10160FF58;

  return v2;
}

- (void)maskedImage:(id)a3 inRect:(CGRect)a4 withColor:(CGColor *)a5 inContext:(CGContext *)a6
{
  if (a5 && a3 && a6)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    id v12 = a3;
    id v13 = +[UIColor clearColor];
    CGContextSetFillColorWithColor(a6, (CGColorRef)[v13 CGColor]);

    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGContextFillRect(a6, v21);
    id v14 = v12;
    v15 = (CGImage *)[v14 CGImage];

    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGContextClipToMask(a6, v22, v15);
    CGContextSetFillColorWithColor(a6, a5);
    CGFloat v16 = x;
    CGFloat v17 = y;
    CGFloat v18 = width;
    CGFloat v19 = height;
    CGContextFillRect(a6, *(CGRect *)&v16);
  }
}

- (void)imageForCategory:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BrowseImageManager *)self browseManager];
  v8 = [v9 traits];
  [(BrowseImageManager *)self imageForCategory:v7 traits:v8 resultHandler:v6];
}

- (void)imageForCategory:(id)a3 traits:(id)a4 resultHandler:(id)a5
{
}

- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 resultHandler:(id)a6
{
}

- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 resultHandler:(id)a7
{
}

- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 isTouchBar:(BOOL)a7 resultHandler:(id)a8
{
  BOOL v9 = a6;
  id v13 = a3;
  id v14 = a5;
  v15 = (void (**)(id, void *))a8;
  id v30 = 0;
  CGFloat v16 = [(BrowseImageManager *)self _cachedImageForCategory:v13 scale:v14 traits:v9 isCarplay:&v30 outputCategoryKey:a4];
  id v17 = v30;
  if (v16)
  {
    if (v15) {
      v15[2](v15, v16);
    }
  }
  else
  {
    unsigned __int8 v18 = [(BrowseImageManager *)self _isNightMode];
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1008F9440;
    v21[3] = &unk_1013002E8;
    objc_copyWeak(v26, &location);
    id v22 = v13;
    v26[1] = *(id *)&a4;
    id v23 = v14;
    BOOL v27 = v9;
    unsigned __int8 v28 = v18;
    id v24 = v17;
    v25 = v15;
    CGFloat v19 = +[NSBlockOperation blockOperationWithBlock:v21];
    v20 = [(BrowseImageManager *)self imageOperationQueue];
    [v20 addOperation:v19];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
}

- (id)synchronousImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  id v17 = 0;
  id v12 = [(BrowseImageManager *)self _cachedImageForCategory:v10 scale:v11 traits:v6 isCarplay:&v17 outputCategoryKey:a4];
  id v13 = v17;
  if (!v12)
  {
    id v12 = [(BrowseImageManager *)self _createImageForCategory:v10 scale:v11 traits:v6 isCarplay:[(BrowseImageManager *)self _isNightMode] nightMode:a4];
    if (v12)
    {
      id v14 = [(id)objc_opt_class() sharedImageCache];
      [v14 setObject:v12 forKey:v13];
    }
    else
    {
      id v14 = sub_1008F8168();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v10 name];
        *(_DWORD *)buf = 138412546;
        CGFloat v19 = v15;
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Failed to create image for category %@, key: %@", buf, 0x16u);
      }
    }
  }

  return v12;
}

- (id)_cachedImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 outputCategoryKey:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  BOOL v13 = [a5 mode] == 4;
  id v14 = [(BrowseImageManager *)self userInterfaceDelegate];
  id v15 = [v14 isNightMode];

  [(BrowseImageManager *)self _screenScaleForScale:v8 isCarplay:a4];
  double v17 = v16;
  unsigned __int8 v18 = objc_alloc_init(CategoryKey);
  CGFloat v19 = [v12 category];

  [(CategoryKey *)v18 setCategory:v19];
  [(CategoryKey *)v18 setTransitMode:v13];
  [(CategoryKey *)v18 setScale:v17];
  [(BrowseImageManager *)self desiredImageSize];
  -[CategoryKey setSize:](v18, "setSize:");
  [(CategoryKey *)v18 setIsCarPlay:v8];
  [(CategoryKey *)v18 setIsNightMode:v15];
  if ([(BrowseImageManager *)self isTransparencyEnabled]) {
    CFStringRef v20 = @"transparent";
  }
  else {
    CFStringRef v20 = 0;
  }
  [(CategoryKey *)v18 setPrefix:v20];
  id v21 = v18;
  *a7 = v21;
  id v22 = [(id)objc_opt_class() sharedImageCache];
  id v23 = [v22 objectForKey:v21];

  return v23;
}

- (BOOL)_isNightMode
{
  if (+[NSThread isMainThread])
  {
    v3 = [(BrowseImageManager *)self userInterfaceDelegate];
    unsigned __int8 v4 = [v3 isNightMode];

    return v4;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: NSThread.isMainThread", v6, 2u);
    }
    return 0;
  }
}

- (id)_createImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 nightMode:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  BOOL v13 = [a3 category];
  id v14 = [v13 styleAttributes];

  LODWORD(v13) = [v12 mode];
  BOOL v15 = v13 == 4;
  unsigned __int8 v16 = [(BrowseImageManager *)self isTransparencyEnabled];
  [(BrowseImageManager *)self desiredImageSize];
  double v18 = v17;
  double v20 = v19;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1008F9C28;
  v43[3] = &unk_101300308;
  *(double *)&v43[4] = v17;
  *(double *)&v43[5] = v19;
  id v21 = objc_retainBlock(v43);
  BOOL v22 = v20 == CGSizeZero.height && v18 == CGSizeZero.width;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1008F9C4C;
  v36[3] = &unk_101300330;
  id v23 = v14;
  id v37 = v23;
  unsigned __int8 v39 = v16;
  BOOL v40 = v15;
  BOOL v41 = a7;
  BOOL v42 = !v22;
  id v24 = v21;
  id v38 = v24;
  v25 = objc_retainBlock(v36);
  [(BrowseImageManager *)self _screenScaleForScale:v8 isCarplay:a4];
  double v27 = v26;
  unsigned __int8 v28 = ((void (*)(void *, uint64_t, BOOL))v25[2])(v25, 4, v8);
  if (!v28 && v8)
  {
    v29 = +[UIScreen mainScreen];
    [v29 scale];
    double v31 = v30;

    if (v27 <= v31) {
      uint64_t v32 = 4;
    }
    else {
      uint64_t v32 = 5;
    }
    unsigned __int8 v28 = ((void (*)(void *, uint64_t, uint64_t, double))v25[2])(v25, v32, 1, v31);
    if (v28) {
      goto LABEL_13;
    }
    unsigned __int8 v28 = ((void (*)(void *, uint64_t, void, double))v25[2])(v25, 5, 0, v31);
  }
  if (!v28)
  {
    unsigned __int8 v28 = +[UIImage imageNamed:@"browse-placeholder"];
  }
LABEL_13:
  if (v28) {
    char v33 = v22;
  }
  else {
    char v33 = 1;
  }
  if ((v33 & 1) == 0)
  {
    [(BrowseImageManager *)self desiredImageSize];
    uint64_t v34 = -[BrowseImageManager _scaleImage:ifNeededToFitSize:](self, "_scaleImage:ifNeededToFitSize:", v28);

    unsigned __int8 v28 = (void *)v34;
  }

  return v28;
}

- (double)_screenScaleForScale:(double)a3 isCarplay:(BOOL)a4
{
  double v4 = a3;
  if (a3 == 0.0)
  {
    if (a4)
    {
      v5 = +[CarDisplayController sharedInstance];
      BOOL v6 = [v5 screenTraitCollection];
      [v6 displayScale];
      double v4 = v7;
    }
    else
    {
      v5 = +[MKSystemController sharedInstance];
      [v5 screenScale];
      double v4 = v8;
    }
  }
  return v4;
}

- (id)transparentImageForCategory:(id)a3
{
  id v3 = a3;
  double v4 = +[MKSystemController sharedInstance];
  [v4 screenScale];
  double v6 = v5;

  double v7 = [v3 styleAttributes];
  double v8 = objc_alloc_init(CategoryKey);
  [(CategoryKey *)v8 setCategory:v3];

  [(CategoryKey *)v8 setTransitMode:0];
  [(CategoryKey *)v8 setPrefix:@"transparent"];
  [(CategoryKey *)v8 setRenderAsTemplate:1];
  BOOL v9 = [(id)objc_opt_class() sharedImageCache];
  id v10 = [v9 objectForKey:v8];

  if (!v10)
  {
    id v11 = +[MKIconManager imageForStyle:v7 size:4 forScale:1 format:1 transparent:0 transitMode:v6];
    if (v11
      || (+[UIImage systemImageNamed:@"magnifyingglass"],
          (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = [v11 imageWithRenderingMode:2];

      id v12 = [(id)objc_opt_class() sharedImageCache];
      [v12 setObject:v10 forKey:v8];
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)_scaleImage:(id)a3 ifNeededToFitSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 size];
  BOOL v9 = width == v7 && height == v8;
  if (v9 || ((v10 = v7, v11 = v8, width == CGSizeZero.width) ? (BOOL v12 = height == CGSizeZero.height) : (BOOL v12 = 0), v12))
  {
    id v16 = v6;
  }
  else
  {
    while (v10 > width || v11 > height)
    {
      BOOL v14 = v10 <= v11;
      double v15 = height * (v10 / v11);
      if (v10 > v11) {
        double v11 = width * (v11 / v10);
      }
      else {
        double v11 = height;
      }
      if (v14) {
        double v10 = v15;
      }
      else {
        double v10 = width;
      }
    }
    double y = CGPointZero.y;
    v21.double width = v10;
    v21.double height = v11;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
    [v6 drawInRect:CGPointZero.x, y, v10, v11];
    UIGraphicsGetImageFromCurrentImageContext();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v16;
}

- (BOOL)isTransparencyEnabled
{
  return self->_transparencyEnabled;
}

- (void)setTransparencyEnabled:(BOOL)a3
{
  self->_transparencyEnabled = a3;
}

- (CGSize)desiredImageSize
{
  double width = self->_desiredImageSize.width;
  double height = self->_desiredImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDesiredImageSize:(CGSize)a3
{
  self->_desiredImageSize = a3;
}

- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);

  return (MapsUIImageCacheUserInterfaceDelegate *)WeakRetained;
}

- (void)setUserInterfaceDelegate:(id)a3
{
}

- (BrowseManager)browseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browseManager);

  return (BrowseManager *)WeakRetained;
}

- (void)setBrowseManager:(id)a3
{
}

- (NSOperationQueue)imageOperationQueue
{
  return self->_imageOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOperationQueue, 0);
  objc_destroyWeak((id *)&self->_browseManager);

  objc_destroyWeak((id *)&self->_userInterfaceDelegate);
}

@end