@interface IMJPEGPrefetch
- (BOOL)isPrefetchCancelled;
- (CGImage)cachedImage;
- (CGImage)cachedImageIfAvailable;
- (IMJPEGPrefetch)initWithData:(id)a3 optimalSize:(CGSize)a4;
- (IMJPEGPrefetch)initWithData:(id)a3 optimalSize:(CGSize)a4 options:(unint64_t)a5;
- (id)_decodeSessionOptionsWithOptimalSize:(CGSize)a3 highPriority:(BOOL)a4;
- (void)_cancel;
- (void)_startDecodeWithData:(id)a3;
- (void)_uncancel;
- (void)addImageHandler:(id)a3 queue:(id)a4;
- (void)cancelPrefetchRequest;
- (void)dealloc;
@end

@implementation IMJPEGPrefetch

- (IMJPEGPrefetch)initWithData:(id)a3 optimalSize:(CGSize)a4
{
  return -[IMJPEGPrefetch initWithData:optimalSize:options:](self, "initWithData:optimalSize:options:", a3, 0, a4.width, a4.height);
}

- (IMJPEGPrefetch)initWithData:(id)a3 optimalSize:(CGSize)a4 options:(unint64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMJPEGPrefetch;
  id v10 = [(IMJPEGPrefetch *)&v16 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("IMJPEGPrefetch", 0);
    v12 = (void *)*((void *)v10 + 4);
    *((void *)v10 + 4) = v11;

    dispatch_group_t v13 = dispatch_group_create();
    v14 = (void *)*((void *)v10 + 5);
    *((void *)v10 + 5) = v13;

    *((_DWORD *)v10 + 12) = 0;
    *((CGFloat *)v10 + 2) = width;
    *((CGFloat *)v10 + 3) = height;
    *((void *)v10 + 9) = a5;
    dispatch_group_enter(*((dispatch_group_t *)v10 + 5));
    if (v9) {
      [v10 _startDecodeWithData:v9];
    }
  }

  return (IMJPEGPrefetch *)v10;
}

- (void)dealloc
{
  CGImageRelease(self->_cachedImage);
  v3.receiver = self;
  v3.super_class = (Class)IMJPEGPrefetch;
  [(IMJPEGPrefetch *)&v3 dealloc];
}

- (void)_startDecodeWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_options)
    {
      id v9 = dispatch_get_global_queue(2, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_137D8;
      block[3] = &unk_2C3DB0;
      id v23 = v4;
      v24 = self;
      dispatch_async(v9, block);
    }
    else
    {
      v5 = -[IMJPEGPrefetch _decodeSessionOptionsWithOptimalSize:highPriority:](self, "_decodeSessionOptionsWithOptimalSize:highPriority:", 1, self->_optimalSize.width, self->_optimalSize.height);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_13864;
      v21[3] = &unk_2C3E00;
      v21[4] = self;
      v6 = objc_retainBlock(v21);
      if ((self->_options & 2) != 0)
      {
        id v10 = dispatch_get_global_queue(2, 0);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_13A10;
        v12[3] = &unk_2C3E50;
        v8 = &v13;
        id v13 = v4;
        id v14 = v5;
        id v15 = v6;
        dispatch_queue_t v11 = v6;
        dispatch_async(v10, v12);
      }
      else
      {
        if (qword_345560 != -1) {
          dispatch_once(&qword_345560, &stru_2C3F10);
        }
        objc_super v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472;
        v18 = sub_139FC;
        v19 = &unk_2C3E28;
        v20 = v6;
        v7 = v6;
        v8 = (id *)&v20;
        self->_requestID = CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously();
      }
    }
  }
  else
  {
    dispatch_group_leave((dispatch_group_t)self->_requestGroup);
  }
}

- (id)_decodeSessionOptionsWithOptimalSize:(CGSize)a3 highPriority:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v15[0] = kCMPhotoJPEGDecodeSessionImageOptionKey_ApplyTransform;
  v15[1] = kCMPhotoJPEGDecodeSessionImageOptionKey_HighPriority;
  v16[0] = &__kCFBooleanFalse;
  v16[1] = &__kCFBooleanFalse;
  v15[2] = kCMPhotoJPEGDecodeSessionImageOptionKey_BackCGImageWithIOSurface;
  v15[3] = kCMPhotoJPEGDecodeSessionImageOptionKey_ForceHighSpeedDecode;
  v16[2] = &__kCFBooleanTrue;
  v16[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v7 = v6;
  double v8 = CGSizeZero.height;
  if (CGSizeZero.width != width || v8 != height)
  {
    id v10 = [v6 mutableCopy];
    if (width <= height) {
      double v11 = height;
    }
    else {
      double v11 = width;
    }
    v12 = +[NSNumber numberWithInt:(int)v11];
    [v10 setObject:v12 forKey:kCMPhotoJPEGDecodeSessionImageOptionKey_MaxPixelSize];

    id v13 = [v10 copy];
    v7 = v13;
  }

  return v7;
}

- (void)_cancel
{
}

- (void)_uncancel
{
}

- (CGImage)cachedImage
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13DB8;
  block[3] = &unk_2C3E78;
  void block[4] = self;
  block[5] = &v10;
  block[6] = &v14;
  dispatch_sync(sync, block);
  if (*((unsigned char *)v11 + 24))
  {
    dispatch_group_wait((dispatch_group_t)self->_requestGroup, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = self->_sync;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_13E08;
    v8[3] = &unk_2C3EA0;
    v8[4] = self;
    v8[5] = &v14;
    dispatch_sync(v4, v8);
  }
  v5 = (const void *)v15[3];
  if (v5) {
    v6 = (CGImage *)CFAutorelease(v5);
  }
  else {
    v6 = 0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (CGImage)cachedImageIfAvailable
{
  return 0;
}

- (void)cancelPrefetchRequest
{
  [(IMJPEGPrefetch *)self _cancel];
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13EC8;
  block[3] = &unk_2C3EC8;
  void block[4] = self;
  dispatch_sync(sync, block);
}

- (void)addImageHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14024;
  block[3] = &unk_2C3E50;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(sync, block);
}

- (BOOL)isPrefetchCancelled
{
  unsigned int v2 = atomic_load((unsigned int *)&self->_cancelled);
  return v2 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestGroup, 0);

  objc_storeStrong((id *)&self->_sync, 0);
}

@end