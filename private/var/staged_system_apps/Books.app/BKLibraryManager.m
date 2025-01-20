@interface BKLibraryManager
- (void)fetchCoverForAssetID:(id)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation BKLibraryManager

- (void)fetchCoverForAssetID:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100154A64;
  v16[3] = &unk_100A48760;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  CGFloat v19 = width;
  CGFloat v20 = height;
  id v12 = v10;
  id v18 = v12;
  v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100154B7C;
      v14[3] = &unk_100A442B8;
      v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    }
  }
}

@end