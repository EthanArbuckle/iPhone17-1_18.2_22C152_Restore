@interface BKCoverResourceProvider
+ (id)sharedInstance;
- (BKCoverResourceProvider)init;
- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6;
- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4;
@end

@implementation BKCoverResourceProvider

- (BKCoverResourceProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKCoverResourceProvider;
  v2 = [(BKCoverResourceProvider *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BKCoverResourceProvider.resourceQueue", v3);
    resourceQueue = v2->_resourceQueue;
    v2->_resourceQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("BKCoverResourceProvider.notifyQueue", v6);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100B4A460 != -1) {
    dispatch_once(&qword_100B4A460, &stru_100A48058);
  }
  v2 = (void *)qword_100B4A458;

  return v2;
}

- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  id v12 = a5;
  objc_opt_class();
  v13 = BUDynamicCast();

  objc_opt_class();
  v14 = BUDynamicCast();

  if (!v13 || (width == CGSizeZero.width ? (BOOL v15 = height == CGSizeZero.height) : (BOOL v15 = 0), v15))
  {
    v17 = BCImageCacheLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = [v14 debugDescription];
      v28.double width = width;
      v28.double height = height;
      v20 = NSStringFromCGSize(v28);
      int v21 = 138412802;
      v22 = v13;
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "BKCoverResourceProvider: Can't generate image resource for assetID %@ with option %@ and size %@", (uint8_t *)&v21, 0x20u);
    }
    v16 = 0;
  }
  else
  {
    v16 = -[_BKCoverResource initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:]([_BKCoverResource alloc], "initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:", self->_resourceQueue, self->_notifyQueue, v13, v14, width, height, a4);
  }

  return v16;
}

- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4
{
  return -[BKCoverResourceProvider imageResourceForNaturalSize:contentsScale:instance:options:](self, "imageResourceForNaturalSize:contentsScale:instance:options:", a3, a4, 100.0, 156.0, 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong((id *)&self->_resourceQueue, 0);
}

@end