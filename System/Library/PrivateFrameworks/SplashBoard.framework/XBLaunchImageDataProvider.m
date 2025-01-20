@interface XBLaunchImageDataProvider
- (XBLaunchImageDataProvider)initWithRequest:(id)a3 contextID:(unsigned int)a4 opaque:(BOOL)a5;
- (XBSnapshotDataProviderContext)context;
- (id)fetchImage;
- (void)invalidateImage;
@end

@implementation XBLaunchImageDataProvider

- (XBLaunchImageDataProvider)initWithRequest:(id)a3 contextID:(unsigned int)a4 opaque:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  if (!v6)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"XBLaunchImageDataProvider.m", 33, @"Invalid parameter not satisfying: %@", @"contextID != 0" object file lineNumber description];
  }
  if (v6 == -1)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"XBLaunchImageDataProvider.m", 34, @"Invalid parameter not satisfying: %@", @"contextID != XBInvalidContextId" object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
  }
  else if (v9)
  {
    goto LABEL_5;
  }
  v33 = [MEMORY[0x263F08690] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"XBLaunchImageDataProvider.m", 35, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)XBLaunchImageDataProvider;
  v10 = [(XBLaunchImageDataProvider *)&v37 init];
  if (v10)
  {
    v11 = [v9 displayConfiguration];
    [v11 scale];
    double v13 = v12;
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeScale(&v36, v12, v12);
    id v14 = objc_alloc(MEMORY[0x263F3F830]);
    CGAffineTransform m = v36;
    CATransform3DMakeAffineTransform(&v35, &m);
    v15 = (void *)[v14 initWithContextID:v6 baseTransform:&v35];
    id v16 = objc_alloc(MEMORY[0x263F3F828]);
    v17 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v15];
    v18 = (void *)[v16 initWithDisplayConfiguration:v11 layers:v17];

    [v18 setOpaque:v5];
    [v18 setScale:v13];
    [v9 referenceSize];
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [v9 interfaceOrientation];
    if ((unint64_t)(v23 - 3) >= 2) {
      double v24 = v20;
    }
    else {
      double v24 = v22;
    }
    if ((unint64_t)(v23 - 3) >= 2) {
      double v25 = v22;
    }
    else {
      double v25 = v20;
    }
    objc_msgSend(v18, "setSnapshotSize:", v24, v25);
    uint64_t v26 = [objc_alloc(MEMORY[0x263F3F820]) initWithSnapshotContext:v18];
    snapshot = v10->_snapshot;
    v10->_snapshot = (_FBSSnapshot *)v26;

    v28 = objc_alloc_init(XBSnapshotDataProviderContext);
    context = v10->_context;
    v10->_context = v28;

    [(XBSnapshotDataProviderContext *)v10->_context setScale:v13];
    [(XBSnapshotDataProviderContext *)v10->_context setOpaque:v5];
  }
  return v10;
}

- (id)fetchImage
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cachedImage)
  {
    if ([(_FBSSnapshot *)v2->_snapshot hasProtectedContent])
    {
      uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6B0]), "initWithIOSurface:", -[_FBSSnapshot IOSurface](v2->_snapshot, "IOSurface"));
    }
    else
    {
      uint64_t v4 = [(_FBSSnapshot *)v2->_snapshot CGImage];
      if (!v4)
      {
LABEL_7:
        [(_FBSSnapshot *)v2->_snapshot invalidate];
        snapshot = v2->_snapshot;
        v2->_snapshot = 0;

        goto LABEL_8;
      }
      id v5 = objc_alloc(MEMORY[0x263F1C6B0]);
      [(XBSnapshotDataProviderContext *)v2->_context scale];
      uint64_t v3 = objc_msgSend(v5, "initWithCGImage:scale:orientation:", v4, 0);
    }
    cachedImage = v2->_cachedImage;
    v2->_cachedImage = (UIImage *)v3;

    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);

  v8 = v2->_cachedImage;
  return v8;
}

- (void)invalidateImage
{
  obj = self;
  objc_sync_enter(obj);
  [(_FBSSnapshot *)obj->_snapshot invalidate];
  snapshot = obj->_snapshot;
  obj->_snapshot = 0;

  cachedImage = obj->_cachedImage;
  obj->_cachedImage = 0;

  objc_sync_exit(obj);
}

- (XBSnapshotDataProviderContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end