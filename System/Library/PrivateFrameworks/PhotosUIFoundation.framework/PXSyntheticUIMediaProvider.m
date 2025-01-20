@interface PXSyntheticUIMediaProvider
- (NSCache)imageCache;
- (NSCache)urlCache;
- (OS_dispatch_queue)queue;
- (PXSyntheticUIMediaProvider)init;
- (id)_imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 outInfo:(id *)a7;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
@end

@implementation PXSyntheticUIMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSCache)urlCache
{
  return self->_urlCache;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  v15 = (void (**)(id, id, void))a7;
  if ([v14 isSynchronous])
  {
    uint64_t v32 = 0;
    -[PXSyntheticUIMediaProvider _imageForAsset:targetSize:contentMode:options:outInfo:](self, "_imageForAsset:targetSize:contentMode:options:outInfo:", v13, a5, v14, &v32, width, height);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v16, v32);
    int64_t v17 = 0;
  }
  else
  {
    v18 = [v14 resultHandlerQueue];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = (id)MEMORY[0x263EF83A0];
      id v21 = MEMORY[0x263EF83A0];
    }

    v22 = [(PXSyntheticUIMediaProvider *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    block[3] = &unk_26545B440;
    block[4] = self;
    id v25 = v13;
    double v29 = width;
    double v30 = height;
    int64_t v31 = a5;
    id v26 = v14;
    id v27 = v20;
    v28 = v15;
    id v16 = v20;
    dispatch_async(v22, block);

    int64_t v17 = 1;
  }

  return v17;
}

void __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 88);
  id v16 = 0;
  v6 = objc_msgSend(v2, "_imageForAsset:targetSize:contentMode:options:outInfo:", v3, v5, v4, &v16, *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v7 = v16;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
  v12[3] = &unk_26545B418;
  v8 = *(NSObject **)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v14 = v7;
  id v15 = v9;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, v12);
}

uint64_t __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  return 0;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v6 = (void *)MEMORY[0x263EFF8F8];
  id v7 = a5;
  v8 = [v6 data];
  (*((void (**)(id, void *, __CFString *, void, void))a5 + 2))(v7, v8, @"dummy", 0, 0);

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (id)_imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 outInfo:(id *)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = [v10 uuid];
  id v14 = [(PXSyntheticUIMediaProvider *)self imageCache];
  id v15 = [v14 objectForKey:v13];

  if (!v15)
  {
    [v10 size];
    double v17 = v16;
    double v19 = v18;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __84__PXSyntheticUIMediaProvider__imageForAsset_targetSize_contentMode_options_outInfo___block_invoke;
    v42[3] = &unk_26545B3D8;
    id v43 = v10;
    id v20 = PXCreateCGImageWithDrawBlock(0, 0, v42, v17, v19);
    id v15 = (UIImage *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v20];
    CGImageRelease(v20);
    id v21 = [(PXSyntheticUIMediaProvider *)self imageCache];
    [v21 setObject:v15 forKey:v13];
  }
  uint64_t v22 = [v11 loadingMode];
  if (a7 && v22 == 0x10000)
  {
    v23 = [(PXSyntheticUIMediaProvider *)self urlCache];
    v24 = [v23 objectForKey:v13];

    if (v24 && ([v24 checkResourceIsReachableAndReturnError:0] & 1) != 0)
    {
      id v25 = v24;
LABEL_14:
      [v12 setObject:v25 forKeyedSubscript:@"PHImageFileURLKey"];

      goto LABEL_15;
    }
    id v38 = v11;
    v40 = a7;
    id v26 = NSString;
    id v27 = [v10 uuid];
    uint64_t v28 = [v26 stringWithFormat:@"%@.jpg", v27];

    double v29 = NSURL;
    double v30 = NSTemporaryDirectory();
    v39 = (void *)v28;
    int64_t v31 = [v30 stringByAppendingPathComponent:v28];
    id v25 = [v29 fileURLWithPath:v31];

    uint64_t v32 = UIImageJPEGRepresentation(v15, 1.0);
    v33 = v32;
    if (v32)
    {
      id v41 = 0;
      int v34 = [v32 writeToURL:v25 options:0 error:&v41];
      id v35 = v41;
      id v11 = v38;
      if (v34)
      {
        v36 = [(PXSyntheticUIMediaProvider *)self urlCache];
        [v36 setObject:v25 forKey:v13];
LABEL_13:
        a7 = v40;

        goto LABEL_14;
      }
    }
    else
    {
      id v35 = 0;
      id v11 = v38;
    }
    v36 = objc_msgSend(MEMORY[0x263F087E8], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXErrorDomain", -1, v35, @"Failed to get a URL for a synthetic image");
    [v12 setObject:v36 forKeyedSubscript:@"PHImageErrorKey"];
    goto LABEL_13;
  }
LABEL_15:
  if (v15) {
    [v12 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"PHImageResultIsDegradedKey"];
  }
  if (a7) {
    *a7 = v12;
  }

  return v15;
}

void __84__PXSyntheticUIMediaProvider__imageForAsset_targetSize_contentMode_options_outInfo___block_invoke(uint64_t a1, CGContextRef context, CGFloat a3, CGFloat a4, double a5, double a6)
{
  v55[2] = *MEMORY[0x263EF8340];
  UIGraphicsPushContext(context);
  CGContextTranslateCTM(context, 0.0, a6);
  CGContextScaleCTM(context, 1.0, -1.0);
  if (a5 >= a6) {
    double v12 = a6;
  }
  else {
    double v12 = a5;
  }
  double v52 = v12;
  [*(id *)(a1 + 32) preferredCropRect];
  double x = v57.origin.x;
  double y = v57.origin.y;
  double width = v57.size.width;
  double height = v57.size.height;
  IsEmptdouble y = CGRectIsEmpty(v57);
  double v18 = 1.0;
  if (IsEmpty) {
    double v19 = 1.0;
  }
  else {
    double v19 = height;
  }
  if (!IsEmpty) {
    double v18 = width;
  }
  double v20 = 0.0;
  if (IsEmpty) {
    double v21 = 0.0;
  }
  else {
    double v21 = y;
  }
  if (!IsEmpty) {
    double v20 = x;
  }
  double v51 = a3 + v20 * a5;
  double v22 = a4 + v21 * a6;
  double v23 = v18 * a5;
  double v24 = v19 * a6;
  [*(id *)(a1 + 32) acceptableCropRect];
  double v49 = v26;
  double v50 = v25;
  double v47 = v28;
  double v48 = v27;
  id v29 = [MEMORY[0x263F825C8] whiteColor];
  CGContextSetFillColorWithColor(context, (CGColorRef)[v29 CGColor]);
  v58.origin.double x = a3;
  v58.origin.double y = a4;
  v58.size.double width = a5;
  v58.size.double height = a6;
  CGContextFillRect(context, v58);
  double v30 = [*(id *)(a1 + 32) tintColor];
  if (v30)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v55[0] = [v29 CGColor];
    id v32 = [v30 colorWithAlphaComponent:0.75];
    v55[1] = [v32 CGColor];
    v33 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)[MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2], 0);

    CGColorSpaceRelease(DeviceRGB);
    double v46 = v22;
    CGFloat v34 = hypot(a5, a6) * 0.5;
    v56.double x = a3 + a5 * 0.5;
    v56.double y = a4 + a6 * 0.5;
    CGContextDrawRadialGradient(context, v33, v56, 0.0, v56, v34, 3u);
    CGGradientRelease(v33);
    CGContextSetStrokeColorWithColor(context, (CGColorRef)[v30 CGColor]);
    v59.origin.double x = v51;
    v59.origin.double y = v22;
    v59.size.double width = v23;
    v59.size.double height = v24;
    CGContextStrokeRectWithWidth(context, v59, v52 * 0.01);
    v60.origin.double y = v49;
    v60.origin.double x = v50;
    v60.size.double height = v47;
    v60.size.double width = v48;
    if (!CGRectIsNull(v60))
    {
      id v35 = [MEMORY[0x263F825C8] orangeColor];
      CGContextSetStrokeColorWithColor(context, (CGColorRef)[v35 CGColor]);

      v61.origin.double x = a3 + v50 * a5;
      v61.origin.double y = a4 + v49 * a6;
      v61.size.double width = v48 * a5;
      v61.size.double height = v47 * a6;
      CGContextStrokeRectWithWidth(context, v61, v52 * 0.01);
    }
  }
  v36 = objc_msgSend(*(id *)(a1 + 32), "label", *(void *)&v46);
  if ([v36 length])
  {
    id v37 = objc_alloc_init(MEMORY[0x263F81650]);
    [v37 setLineBreakMode:4];
    [v37 setAlignment:1];
    v53[0] = *MEMORY[0x263F814F0];
    id v38 = [MEMORY[0x263F81708] monospacedSystemFontOfSize:v52 * 0.2 weight:*MEMORY[0x263F81840]];
    v54[0] = v38;
    v53[1] = *MEMORY[0x263F81500];
    v39 = v30;
    if (!v30)
    {
      v39 = [MEMORY[0x263F825C8] labelColor];
    }
    v53[2] = *MEMORY[0x263F81540];
    v54[1] = v39;
    v54[2] = v37;
    v40 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];
    if (!v30) {

    }
    double v41 = v22 + v24 * 0.5;
    [v36 sizeWithAttributes:v40];
    if (v42 >= v23) {
      double v44 = v23;
    }
    else {
      double v44 = v42;
    }
    if (v43 >= v24) {
      double v45 = v24;
    }
    else {
      double v45 = v43;
    }
    objc_msgSend(v36, "drawInRect:withAttributes:", v40, v51 + v23 * 0.5 + v44 * -0.5, v41 + v45 * -0.5);
  }
  UIGraphicsPopContext();
}

- (PXSyntheticUIMediaProvider)init
{
  v15.receiver = self;
  v15.super_class = (Class)PXSyntheticUIMediaProvider;
  v2 = [(PXSyntheticUIMediaProvider *)&v15 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    id v10 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v10;

    [(NSCache *)v2->_imageCache setCountLimit:100];
    double v12 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    urlCache = v2->_urlCache;
    v2->_urlCache = v12;

    [(NSCache *)v2->_urlCache setCountLimit:100];
  }
  return v2;
}

@end