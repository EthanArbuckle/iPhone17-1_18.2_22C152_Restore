@interface XBApplicationSnapshotImage
- (XBApplicationSnapshotImage)initWithSnapshot:(id)a3 interfaceOrientation:(int64_t)a4;
- (id)description;
- (int64_t)interfaceOrientation;
- (void)dealloc;
@end

@implementation XBApplicationSnapshotImage

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(XBApplicationSnapshot *)self->_snapshot endImageAccess];
  v3.receiver = self;
  v3.super_class = (Class)XBApplicationSnapshotImage;
  [(XBApplicationSnapshotImage *)&v3 dealloc];
}

- (XBApplicationSnapshotImage)initWithSnapshot:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = XBImageOrientationForInterfaceOrientationRotation(a4, 1);
  v9 = [v7 _cachedImage];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
    if ([v11 CGImage])
    {
      id v12 = v11;
      uint64_t v13 = [v12 CGImage];
      [v12 scale];
      v14 = -[XBApplicationSnapshotImage initWithCGImage:scale:orientation:](&v18, sel_initWithCGImage_scale_orientation_, v13, v8, v17.receiver, v17.super_class, self, XBApplicationSnapshotImage);
    }
    else
    {
      uint64_t v15 = [v11 ioSurface];
      [v11 scale];
      v14 = (XBApplicationSnapshotImage *)-[XBApplicationSnapshotImage _initWithIOSurface:scale:orientation:](&v17, sel__initWithIOSurface_scale_orientation_, v15, v8, self, XBApplicationSnapshotImage, v18.receiver, v18.super_class);
    }
    self = v14;
  }
  if (self)
  {
    self->_interfaceOrientation = a4;
    objc_storeStrong((id *)&self->_snapshot, a3);
    [(XBApplicationSnapshot *)self->_snapshot beginImageAccess];
  }

  return self;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __41__XBApplicationSnapshotImage_description__block_invoke;
  v10 = &unk_2646A5BC0;
  id v11 = v3;
  id v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return v5;
}

void __41__XBApplicationSnapshotImage_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) size];
  id v3 = (id)objc_msgSend(v2, "appendSize:withName:", @"size");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) scale];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", @"scale", 1);
  v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) imageOrientation];
  uint64_t v7 = XBImageOrientationDescription();
  id v8 = (id)[v6 appendObject:v7 withName:@"imageOrientation"];

  v9 = *(void **)(a1 + 32);
  v10 = XBStringForInterfaceOrientation(*(void *)(*(void *)(a1 + 40) + 152));
  id v11 = (id)[v9 appendObject:v10 withName:@"interfaceOrientation"];

  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 144), "isImageOpaque"), @"opaque");
  uint64_t v13 = *(void **)(a1 + 32);
  id v15 = [*(id *)(*(void *)(a1 + 40) + 144) path];
  id v14 = (id)[v13 appendObject:v15 withName:@"path" skipIfNil:1];
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

@end