@interface ThumbnailProvider
- (ThumbnailProvider)init;
- (id)_queue_createPreviewImageDataWithImage:(id)a3;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ThumbnailProvider

- (ThumbnailProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)ThumbnailProvider;
  v2 = [(ThumbnailProvider *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanotimekit.ThumbnailProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [a3 fileURL];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003314;
  v9[3] = &unk_100004168;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  +[NTKGreenfieldUtilities generateFacePreviewImageFromUrl:v7 completionBlock:v9];
}

- (id)_queue_createPreviewImageDataWithImage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  double v9 = v5 + 100.0;
  double v10 = v7 + 100.0;
  id v11 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v5 + 100.0, v7 + 100.0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003804;
  v15[3] = &unk_100004190;
  id v16 = v4;
  double v17 = v9;
  double v18 = v10;
  double v19 = v6;
  double v20 = v8;
  id v12 = v4;
  v13 = [v11 PNGDataWithActions:v15];

  return v13;
}

- (void).cxx_destruct
{
}

@end