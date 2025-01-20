@interface BCCacheManager
- (void)_addTUIPurgeableImage:(id)a3 withIdentifier:(id)a4;
- (void)addImageResource:(id)a3 withIdentifier:(id)a4 completion:(id)a5;
- (void)imageResourceDidChangeImage:(id)a3;
@end

@implementation BCCacheManager

- (void)addImageResource:(id)a3 withIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v9 length])
  {
    v11 = [v8 loadImage];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 image];
      [(BCCacheManager *)self _addTUIPurgeableImage:v13 withIdentifier:v9];

      id v14 = objc_retainBlock(v10);
      v15 = v14;
      if (v14) {
        (*((void (**)(id))v14 + 2))(v14);
      }
    }
    else
    {
      v16 = BCImageCacheLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1007E75F4((uint64_t)v9, v16);
      }

      objc_setAssociatedObject(v8, @"BCCoverCacheAssetIDKey", v9, (void *)3);
      id v17 = objc_retainBlock(v10);
      objc_setAssociatedObject(v8, @"BCCoverCacheCompletionKey", v17, (void *)1);

      [v8 addObserver:self];
    }
  }
}

- (void)_addTUIPurgeableImage:(id)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  v6 = (CGImage *)[a3 CGImage];
  if (v6)
  {
    v7 = v6;
    double Width = (double)CGImageGetWidth(v6);
    id v9 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v5, 0, Width, (double)CGImageGetHeight(v7));
    id v10 = +[BICImage imageWithCGImage:v7];
    [v9 setImage:v10];

    [v9 setQuality:203];
    [v9 setPriority:6];
    [v9 setRequestOptions:1024];
    v11 = +[BCCacheManager defaultCacheManager];
    id v14 = v9;
    v12 = +[NSArray arrayWithObjects:&v14 count:1];
    [v11 addDescribedImages:v12];

    v13 = BCImageCacheLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1007E766C((uint64_t)v5, v13);
    }
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  id object = a3;
  v4 = [object loadImage];
  id v5 = objc_getAssociatedObject(object, @"BCCoverCacheAssetIDKey");
  v6 = [v4 image];
  [(BCCacheManager *)self _addTUIPurgeableImage:v6 withIdentifier:v5];

  v7 = objc_getAssociatedObject(object, @"BCCoverCacheCompletionKey");
  id v8 = objc_retainBlock(v7);
  id v9 = v8;
  if (v8) {
    (*((void (**)(id))v8 + 2))(v8);
  }

  [object removeObserver:self];
  objc_setAssociatedObject(object, @"BCCoverCacheCompletionKey", 0, (void *)1);
}

@end