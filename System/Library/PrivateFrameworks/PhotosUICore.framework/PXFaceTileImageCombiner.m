@interface PXFaceTileImageCombiner
+ (id)_generateCombinedImageFromImages:(id)a3 context:(id)a4;
+ (id)placeholderImageForNumberOfItems:(unint64_t)a3 context:(id)a4;
+ (void)initialize;
- (void)_returnCombinedImage:(id)a3 generation:(unint64_t)a4 resultHandler:(id)a5;
- (void)requestCombinedImageForItems:(id)a3 context:(id)a4 resultHandler:(id)a5;
@end

@implementation PXFaceTileImageCombiner

- (void)_returnCombinedImage:(id)a3 generation:(unint64_t)a4 resultHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  unint64_t currentGeneration = self->_currentGeneration;
  v11 = PLUIGetLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (currentGeneration == a4)
  {
    if (v12)
    {
      int v15 = 138412802;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      id v13 = v16;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "<%@:%p> Returning a combined image for generation:%lu", (uint8_t *)&v15, 0x20u);
    }
    v9[2](v9, v8);
  }
  else
  {
    if (v12)
    {
      int v15 = 138412802;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      id v14 = v16;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "<%@:%p> Dropping request for out of date generation:%lu", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)requestCombinedImageForItems:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFaceTileImageCombiner.m", 78, @"%s must be called on the main thread", "-[PXFaceTileImageCombiner requestCombinedImageForItems:context:resultHandler:]");
  }
  BOOL v12 = (void *)[v9 count];
  if (v12)
  {
    if (v10) {
      goto LABEL_5;
    }
LABEL_10:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 81, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v11) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 80, @"Invalid parameter not satisfying: %@", @"numberOfItems > 0" object file lineNumber description];

  if (!v10) {
    goto LABEL_10;
  }
LABEL_5:
  if (v11) {
    goto LABEL_6;
  }
LABEL_11:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 82, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

LABEL_6:
  id v13 = (void *)(self->_currentGeneration + 1);
  self->_unint64_t currentGeneration = (unint64_t)v13;
  id v14 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  int v15 = PLUIGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v32 = v14;
    __int16 v33 = 2048;
    v34 = v12;
    __int16 v35 = 2048;
    v36 = v13;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "%@ Requested a combined image for:%lu, generation:%lu", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  id v16 = _serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke;
  block[3] = &unk_1E5DC16F8;
  id v26 = v10;
  id v27 = v9;
  v30[1] = v12;
  v30[2] = v13;
  id v28 = v14;
  id v17 = v14;
  id v18 = v9;
  id v19 = v10;
  objc_copyWeak(v30, (id *)buf);
  id v29 = v11;
  id v20 = v11;
  dispatch_async(v16, block);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
  [v2 setCount:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) imageSize];
  v4 = v3;
  [*(id *)(a1 + 32) displayScale];
  v6 = v5;
  char v7 = [*(id *)(a1 + 32) isRTL];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2;
  v12[3] = &unk_1E5DC16D0;
  id v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(void **)(a1 + 80);
  id v13 = v9;
  v17[1] = v10;
  v17[2] = v4;
  v17[3] = v4;
  v17[4] = v6;
  char v18 = v7;
  id v11 = v2;
  id v14 = v11;
  id v15 = *(id *)(a1 + 32);
  objc_copyWeak(v17, (id *)(a1 + 64));
  id v16 = *(id *)(a1 + 56);
  [v8 enumerateObjectsUsingBlock:v12];

  objc_destroyWeak(v17);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%@ Request image for item:%@, generation:%lu", buf, 0x20u);
  }

  double v9 = *(double *)(a1 + 96);
  BOOL v10 = *(unsigned char *)(a1 + 104) != 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_87;
  v13[3] = &unk_1E5DC16A8;
  id v14 = *(id *)(a1 + 32);
  id v11 = v5;
  BOOL v12 = *(void **)(a1 + 72);
  id v15 = v11;
  v19[1] = v12;
  id v16 = *(id *)(a1 + 40);
  v19[2] = a3;
  id v17 = *(id *)(a1 + 48);
  objc_copyWeak(v19, (id *)(a1 + 64));
  id v18 = *(id *)(a1 + 56);
  objc_msgSend(v11, "px_requestImageWithTargetSize:displayScale:isRTL:resultHandler:", v10, v13, *(double *)(a1 + 80), *(double *)(a1 + 88), v9);

  objc_destroyWeak(v19);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _serialQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2_88;
  v15[3] = &unk_1E5DCEAB0;
  id v16 = v5;
  id v17 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  double v9 = *(void **)(a1 + 80);
  id v18 = v8;
  v23[1] = v9;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(void **)(a1 + 88);
  id v19 = v10;
  v23[2] = v11;
  id v20 = *(id *)(a1 + 56);
  id v12 = v5;
  objc_copyWeak(v23, (id *)(a1 + 72));
  id v13 = *(id *)(a1 + 64);
  id v21 = v6;
  id v22 = v13;
  id v14 = v6;
  dispatch_async(v7, v15);

  objc_destroyWeak(v23);
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_2_88(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = PLUIGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 96);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      __int16 v26 = 2048;
      uint64_t v27 = v7;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%@ Received image for item:%@, generation:%lu", buf, 0x20u);
    }

    [*(id *)(a1 + 56) replacePointerAtIndex:*(void *)(a1 + 104) withPointer:*(void *)(a1 + 32)];
    id v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 96);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "%@ Generating a combined image for generation:%lu", buf, 0x16u);
    }

    id v11 = +[PXFaceTileImageCombiner _generateCombinedImageFromImages:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_89;
    v18[3] = &unk_1E5DC9D68;
    objc_copyWeak(v21, (id *)(a1 + 88));
    id v12 = *(void **)(a1 + 96);
    id v19 = v11;
    v21[1] = v12;
    id v20 = *(id *)(a1 + 80);
    id v13 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v18);

    objc_destroyWeak(v21);
  }
  else
  {
    if (v4)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 96);
      uint64_t v17 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138413058;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%@ No image for item:%@, generation:%lu, error:%@", buf, 0x2Au);
    }
  }
}

void __78__PXFaceTileImageCombiner_requestCombinedImageForItems_context_resultHandler___block_invoke_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _returnCombinedImage:*(void *)(a1 + 32) generation:*(void *)(a1 + 56) resultHandler:*(void *)(a1 + 40)];
}

+ (id)_generateCombinedImageFromImages:(id)a3 context:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 count];
  if (!v9)
  {
    __int16 v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PXFaceTileImageCombiner.m", 141, @"Invalid parameter not satisfying: %@", @"imagesCount > 0" object file lineNumber description];
  }
  [v7 displayScale];
  double v11 = v10;
  char v12 = [v7 isRTL];
  int v13 = [v7 isAscending];
  [v7 imageSize];
  double v15 = v14;
  [v7 imageOffset];
  double v17 = v16;
  id v18 = [v7 backgroundColor];
  id v19 = [v7 borderColor];
  [v7 borderWidth];
  double v21 = v20;

  id v22 = [MEMORY[0x1E4FB1618] clearColor];
  char v23 = [v19 isEqual:v22];

  double v24 = v11 * v15;
  double v25 = v11 * v21;
  CGFloat v26 = v11 * (v15 + (double)(unint64_t)(v9 - 1) * v17);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  __int16 v28 = CGBitmapContextCreate(0, (unint64_t)v26, (unint64_t)v24, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  id v29 = v18;
  CGContextSetFillColorWithColor(v28, (CGColorRef)[v29 CGColor]);
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.width = v26;
  v49.size.height = v24;
  CGContextFillRect(v28, v49);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__PXFaceTileImageCombiner__generateCombinedImageFromImages_context___block_invoke;
  v36[3] = &unk_1E5DC1720;
  char v46 = v12;
  double v38 = v11 * v17;
  CGFloat v39 = v26;
  if (v13) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = 2;
  }
  double v40 = v24;
  double v41 = v24;
  char v47 = v23;
  v42 = v28;
  id v37 = v19;
  double v43 = v25;
  double v44 = v24 + v25 * -2.0;
  double v45 = v44 * 0.5;
  id v31 = v19;
  objc_msgSend(v8, "px_enumeratePointersWithOptions:usingBlock:", v30, v36);

  Image = CGBitmapContextCreateImage(v28);
  CGContextRelease(v28);
  __int16 v33 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:v11];
  CGImageRelease(Image);

  return v33;
}

void __68__PXFaceTileImageCombiner__generateCombinedImageFromImages_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(double *)(a1 + 40) * (double)a3;
  if (*(unsigned char *)(a1 + 104)) {
    double v5 = *(double *)(a1 + 48) - *(double *)(a1 + 64) - v5;
  }
  uint64_t v6 = *(CGContext **)(a1 + 72);
  if (*(unsigned char *)(a1 + 105))
  {
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    CGContextSetFillColorWithColor(v6, (CGColorRef)[v7 CGColor]);

    CGContextSetBlendMode(*(CGContextRef *)(a1 + 72), kCGBlendModeDestinationOut);
  }
  else
  {
    CGContextSetFillColorWithColor(v6, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  }
  v18.size.width = *(CGFloat *)(a1 + 64);
  v18.origin.y = 0.0;
  v18.origin.x = v5;
  v18.size.height = v18.size.width;
  CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 72), v18);
  if (*(unsigned char *)(a1 + 105)) {
    CGContextSetBlendMode(*(CGContextRef *)(a1 + 72), kCGBlendModeNormal);
  }
  double v9 = *(double *)(a1 + 80);
  CGFloat v8 = *(double *)(a1 + 88);
  double v10 = v5 + v9;
  id v16 = a2;
  if (v16)
  {
    v19.origin.x = v10;
    v19.origin.y = v9;
    v19.size.width = v8;
    v19.size.height = v8;
    double v11 = CGPathCreateWithRoundedRect(v19, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 96), 0);
    CGContextAddPath(*(CGContextRef *)(a1 + 72), v11);
    CGContextClip(*(CGContextRef *)(a1 + 72));
    CGContextBeginPath(*(CGContextRef *)(a1 + 72));
    CGPathRelease(v11);
    char v12 = *(CGContext **)(a1 + 72);
    int v13 = (CGImage *)[v16 CGImage];
    v20.origin.x = v10;
    v20.origin.y = v9;
    v20.size.width = v8;
    v20.size.height = v8;
    CGContextDrawImage(v12, v20, v13);
    CGContextResetClip(*(CGContextRef *)(a1 + 72));
  }
  else
  {
    double v14 = *(CGContext **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E4FB1618], "px_assetPlaceholderGray");
    id v15 = objc_claimAutoreleasedReturnValue();
    CGContextSetFillColorWithColor(v14, (CGColorRef)[v15 CGColor]);

    v21.origin.x = v10;
    v21.origin.y = v9;
    v21.size.width = v8;
    v21.size.height = v8;
    CGContextFillEllipseInRect(*(CGContextRef *)(a1 + 72), v21);
  }
}

+ (id)placeholderImageForNumberOfItems:(unint64_t)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = a4;
  if ([v7 isMainThread])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PXFaceTileImageCombiner.m", 66, @"Invalid parameter not satisfying: %@", @"numberOfItems > 0" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  double v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXFaceTileImageCombiner.m", 65, @"%s must be called on the main thread", "+[PXFaceTileImageCombiner placeholderImageForNumberOfItems:context:]");

  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  if (v8) {
    goto LABEL_4;
  }
LABEL_11:
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"PXFaceTileImageCombiner.m", 67, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_4:
  double v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    id v10 = v18;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "<%@> Generating a placeholder image for:%lu", buf, 0x16u);
  }
  double v11 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
  [v11 setCount:a3];
  char v12 = [a1 _generateCombinedImageFromImages:v11 context:v8];

  return v12;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BOOL v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.mobileslideshow.PXFaceTileImageCombiner", v4);
    v3 = (void *)_serialQueue;
    _serialQueue = (uint64_t)v2;
  }
}

@end