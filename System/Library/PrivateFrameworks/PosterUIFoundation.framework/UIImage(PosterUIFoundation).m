@interface UIImage(PosterUIFoundation)
+ (double)minimumWallpaperSizeForCurrentDevice;
+ (id)pui_imageFromSceneSnapshot:()PosterUIFoundation;
+ (id)pui_imageSnapshotFromLayer:()PosterUIFoundation buffer:;
+ (id)pui_imageWithIOSurface:()PosterUIFoundation;
+ (id)pui_imageWithIOSurface:()PosterUIFoundation scale:orientation:;
+ (id)pui_thumbnailImageForImage:()PosterUIFoundation thumbnailWidthInPixels:;
- (BOOL)pui_canDetermineProminentColor;
- (CGImage)pui_colorSpace;
- (id)pui_CGImageBackedImageUsingDataProvider;
- (id)pui_CGImageBackedImageWithMaximumBitsPerComponent:()PosterUIFoundation skipCIF10FitsInSRGBCheck:;
- (id)pui_averageColorForRect:()PosterUIFoundation;
- (id)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:;
- (id)pui_imageByManipulatingInDeviceColorSpaceWithBlock:()PosterUIFoundation;
- (id)pui_imageHashData;
- (id)pui_resizeImageToSize:()PosterUIFoundation;
- (id)pui_resizeImageToSize:()PosterUIFoundation preservingAspectRatio:;
- (id)pui_scaleImage:()PosterUIFoundation canUseIOSurface:;
- (id)pui_wrappedIOSurface;
- (uint64_t)pui_CGImageBackedImage;
- (uint64_t)pui_CGImageBackedImageWithMaximumBitsPerComponent:()PosterUIFoundation;
- (uint64_t)pui_EXIFOrientation;
- (uint64_t)pui_averageColor;
- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:;
- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:canUseIOSurface:;
- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:;
- (uint64_t)pui_isSolidColor:()PosterUIFoundation;
- (uint64_t)pui_scaleImage:()PosterUIFoundation;
@end

@implementation UIImage(PosterUIFoundation)

+ (id)pui_imageWithIOSurface:()PosterUIFoundation scale:orientation:
{
  id v8 = a4;
  if ([v8 pixelFormat] == 1380411457)
  {
    id v9 = v8;
    [v9 lockWithOptions:1 seed:0];
    id v10 = v9;
    v11 = (const void *)[v10 baseAddress];
    size_t v12 = [v10 bytesPerRow];
    size_t v13 = [v10 width];
    size_t v14 = [v10 height];
    size_t v15 = [v10 allocationSize];
    id v16 = v10;
    v17 = CGDataProviderCreateWithData(v16, v11, v15, (CGDataProviderReleaseDataCallback)releaseIOSurface);
    [v16 incrementUseCount];
    CFTypeRef v18 = IOSurfaceCopyValue((IOSurfaceRef)v16, (CFStringRef)*MEMORY[0x263F0EDA0]);
    if (!v18 || (v19 = v18, v20 = CGColorSpaceCreateWithPropertyList(v18), CFRelease(v19), !v20)) {
      v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    }
    v21 = CGImageCreate(v13, v14, 0x10uLL, 0x40uLL, v12, v20, 0x1101u, v17, 0, 1, kCGRenderingIntentDefault);
    CGImageSetProperty();
    CGDataProviderRelease(v17);
    CGColorSpaceRelease(v20);
    if (v21)
    {
      v22 = [MEMORY[0x263F1C6B0] imageWithCGImage:v21 scale:a5 orientation:a2];
    }
    else
    {
      v22 = 0;
    }
    CGImageRelease(v21);
  }
  else
  {
    v22 = (void *)[[a1 alloc] _initWithIOSurface:v8 scale:a5 orientation:a2];
  }

  return v22;
}

+ (id)pui_imageWithIOSurface:()PosterUIFoundation
{
  v4 = kPaperboardIOSurfaceInterfaceOrientationPropertiesKey;
  id v5 = a3;
  v6 = [v5 attachmentForKey:v4];
  [v6 unsignedIntegerValue];

  v7 = [v5 attachmentForKey:kPaperboardIOSurfaceDeviceOrientationPropertiesKey];
  [v7 unsignedIntegerValue];

  id v8 = [v5 attachmentForKey:kPaperboardIOSurfaceDeviceScalePropertiesKey];
  [v8 doubleValue];
  if (v9 == 0.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = v9;
  }

  v11 = objc_msgSend(a1, "pui_imageWithIOSurface:scale:orientation:", v5, PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), v10);

  return v11;
}

- (id)pui_wrappedIOSurface
{
  v2 = (void *)[a1 ioSurface];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    PUIIOSurfaceFromCGImage( (id) [a1 CGImage], 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)pui_imageSnapshotFromLayer:()PosterUIFoundation buffer:
{
  id v5 = a3;
  v6 = [v5 context];
  [v6 contextId];
  [v5 bounds];
  double v8 = v7;

  CARenderServerRenderLayer();
  double v9 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) _initWithIOSurface:a4 scale:0 orientation:(double)IOSurfaceGetWidth(a4) / v8];

  return v9;
}

+ (id)pui_imageFromSceneSnapshot:()PosterUIFoundation
{
  id v3 = a3;
  if (![v3 capture])
  {
    size_t v12 = 0;
    goto LABEL_15;
  }
  v4 = [v3 context];
  id v5 = [v4 settings];

  [v5 interfaceOrientation];
  objc_msgSend(v5, "pui_deviceOrientation");
  uint64_t v6 = PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation();
  double v7 = [v3 IOSurface];
  if (v7)
  {
    double v8 = [v3 context];
    [v8 scale];
    if (v9 == 0.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = v9;
    }

    uint64_t v11 = objc_msgSend(MEMORY[0x263F1C6B0], "pui_imageWithIOSurface:scale:orientation:", v7, v6, v10);
  }
  else
  {
    id v13 = v3;
    uint64_t v14 = [v13 CGImage];
    if (!v14)
    {
      size_t v12 = 0;
      goto LABEL_14;
    }
    uint64_t v15 = v14;
    id v16 = [v13 context];
    [v16 scale];
    if (v17 == 0.0) {
      double v18 = 1.0;
    }
    else {
      double v18 = v17;
    }

    uint64_t v11 = [objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v15 scale:v6 orientation:v18];
  }
  size_t v12 = (void *)v11;
LABEL_14:

LABEL_15:
  return v12;
}

- (uint64_t)pui_CGImageBackedImage
{
  return objc_msgSend(a1, "pui_CGImageBackedImageWithMaximumBitsPerComponent:", -1);
}

- (uint64_t)pui_CGImageBackedImageWithMaximumBitsPerComponent:()PosterUIFoundation
{
  return objc_msgSend(a1, "pui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", a3, 0);
}

- (id)pui_CGImageBackedImageWithMaximumBitsPerComponent:()PosterUIFoundation skipCIF10FitsInSRGBCheck:
{
  v19[3] = *MEMORY[0x263EF8340];
  id v6 = a1;
  if ([v6 CGImage])
  {
    id v7 = v6;
  }
  else
  {
    double v8 = [v6 ioSurface];
    double v9 = v8;
    if (v8)
    {
      int v10 = [v8 pixelFormat];
      if (a3 <= 8 && v10 == 1999843442)
      {
        uint64_t v11 = *MEMORY[0x263F0F038];
        v18[0] = *MEMORY[0x263F0EFC0];
        v18[1] = v11;
        v19[0] = &unk_27081B260;
        v19[1] = &unk_27081B278;
        v18[2] = *MEMORY[0x263F0F598];
        size_t v12 = [NSNumber numberWithBool:a4];
        v19[2] = v12;
        id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

        uint64_t v14 = (CGImage *)CGImageCreateFromIOSurface();
      }
      else
      {
        uint64_t v14 = (CGImage *)UICreateCGImageFromIOSurface();
      }
      id v15 = objc_alloc(MEMORY[0x263F1C6B0]);
      [v6 scale];
      id v7 = (id)objc_msgSend(v15, "initWithCGImage:scale:orientation:", v14, objc_msgSend(v6, "imageOrientation"), v16);
      CGImageRelease(v14);
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (id)pui_CGImageBackedImageUsingDataProvider
{
  id v1 = a1;
  if ([v1 CGImage])
  {
    id v2 = v1;
  }
  else
  {
    id v3 = [v1 ioSurface];
    v4 = v3;
    if (v3)
    {
      if ([v3 pixelFormat] == 1999843442)
      {
        [v1 scale];
        double v6 = v5;
        uint64_t v7 = [v1 imageOrientation];
        id v8 = v4;
        [v8 lockWithOptions:1 seed:0];
        id v9 = v8;
        int v10 = (const void *)[v9 baseAddress];
        size_t v11 = [v9 bytesPerRow];
        size_t v12 = [v9 width];
        size_t v13 = [v9 height];
        size_t v14 = [v9 allocationSize];
        id v15 = v9;
        double v16 = CGDataProviderCreateWithData(v15, v10, v14, (CGDataProviderReleaseDataCallback)releaseIOSurface);
        [v15 incrementUseCount];
        CFTypeRef v17 = IOSurfaceCopyValue((IOSurfaceRef)v15, (CFStringRef)*MEMORY[0x263F0EDA0]);
        if (!v17 || (double v18 = v17, v19 = CGColorSpaceCreateWithPropertyList(v17), CFRelease(v18), !v19)) {
          v19 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
        }
        v20 = CGImageCreate(v12, v13, 0xAuLL, 0x20uLL, v11, v19, 0x42000u, v16, 0, 0, kCGRenderingIntentDefault);
        CGImageSetProperty();
        CGDataProviderRelease(v16);
        CGColorSpaceRelease(v19);
        if (v20)
        {
          id v2 = [MEMORY[0x263F1C6B0] imageWithCGImage:v20 scale:v7 orientation:v6];
        }
        else
        {
          id v2 = 0;
        }
        CGImageRelease(v20);
      }
      else
      {
        v21 = (CGImage *)UICreateCGImageFromIOSurface();
        id v22 = objc_alloc(MEMORY[0x263F1C6B0]);
        [v1 scale];
        id v2 = (id)objc_msgSend(v22, "initWithCGImage:scale:orientation:", v21, objc_msgSend(v1, "imageOrientation"), v23);
        CGImageRelease(v21);
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:canUseIOSurface:", 1);
}

- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", a3, 1);
}

- (uint64_t)pui_cropImageWithRect:()PosterUIFoundation outputSize:canUseIOSurface:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", 1, a3);
}

- (id)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  v19 = PUILogRendering();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  v21 = PUILogRendering();
  id v22 = v21;
  unint64_t v23 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25A0AF000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "pui_cropImage", (const char *)&unk_25A117B91, buf, 2u);
  }

  CGFloat v24 = *MEMORY[0x263F00148];
  CGFloat v25 = *(double *)(MEMORY[0x263F00148] + 8);
  [a1 size];
  v100.size.CGFloat width = v26;
  v100.size.CGFloat height = v27;
  v95.origin.CGFloat x = a2;
  v95.origin.CGFloat y = a3;
  v95.size.CGFloat width = a4;
  v95.size.CGFloat height = a5;
  v100.origin.CGFloat x = v24;
  v100.origin.CGFloat y = v25;
  BOOL v28 = CGRectEqualToRect(v95, v100);
  BOOL v29 = v28;
  int v30 = !v28;
  BOOL v31 = a5 != a7 || a4 != a6;
  v96.origin.CGFloat x = a2;
  v96.origin.CGFloat y = a3;
  v96.size.CGFloat width = a4;
  v96.size.CGFloat height = a5;
  if (CGRectIsEmpty(v96)
    || !(v30 | v31)
    || (BSFloatLessThanOrEqualToFloat() & 1) != 0
    || BSFloatLessThanOrEqualToFloat())
  {
    v32 = PUILogRendering();
    v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&buf[4] = v30;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v31;
      *(_WORD *)&buf[14] = 2048;
      *(CGFloat *)v80 = a4;
      *(_WORD *)&v80[8] = 2048;
      *(CGFloat *)&v80[10] = a5;
      *(_WORD *)&v80[18] = 2048;
      *(double *)&v80[20] = a6;
      *(_WORD *)&v80[28] = 2048;
      *(double *)&v80[30] = a7;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v33, OS_SIGNPOST_INTERVAL_END, v20, "pui_cropImage", "No work to do: needsCrop=%u, needsScale=%u, cropRect.size=(%f, %f), outputSize=(%f, %f)", buf, 0x36u);
    }

    id v34 = a1;
    goto LABEL_15;
  }
  unint64_t v36 = [a1 imageOrientation];
  double v37 = *(double *)(MEMORY[0x263F000D0] + 8);
  uint64_t v38 = *(void *)(MEMORY[0x263F000D0] + 32);
  double v63 = *MEMORY[0x263F000D0];
  double v65 = *(double *)(MEMORY[0x263F000D0] + 24);
  uint64_t v67 = *(void *)(MEMORY[0x263F000D0] + 40);
  double v69 = *(double *)(MEMORY[0x263F000D0] + 16);
  double v74 = a6;
  double v75 = a7;
  CGFloat v72 = a2;
  CGFloat v73 = a3;
  if (v36 && ([a1 size], v36 <= 7))
  {
    if (((1 << v36) & 0x22) != 0)
    {
      double v44 = 1.0;
      double v43 = -1.0;
      uint64_t v38 = 0;
      uint64_t v42 = v40;
      double v41 = 0.0;
      double v37 = 0.0;
    }
    else
    {
      if (((1 << v36) & 0x44) != 0)
      {
        double v37 = 1.0;
        double v41 = -1.0;
        uint64_t v42 = 0;
        uint64_t v38 = v40;
        goto LABEL_27;
      }
      uint64_t v42 = v67;
      double v41 = v69;
      double v44 = v63;
      double v43 = v65;
      if (((1 << v36) & 0x88) != 0)
      {
        double v37 = -1.0;
        double v41 = 1.0;
        uint64_t v38 = 0;
        uint64_t v42 = v39;
LABEL_27:
        double v43 = 0.0;
        double v44 = 0.0;
      }
    }
  }
  else
  {
    uint64_t v42 = v67;
    double v41 = v69;
    double v44 = v63;
    double v43 = v65;
  }
  [a1 scale];
  memset(&v78, 0, sizeof(v78));
  double v66 = v45;
  CGAffineTransformMakeScale(&v78, v45, v45);
  *(double *)buf = v44;
  *(double *)&buf[8] = v37;
  *(double *)v80 = v41;
  *(double *)&v80[8] = v43;
  *(void *)&v80[16] = v38;
  *(void *)&v80[24] = v42;
  CGAffineTransform t2 = v78;
  memset(&v77, 0, sizeof(v77));
  CGAffineTransformConcat(&v77, (CGAffineTransform *)buf, &t2);
  *(_OWORD *)buf = *(_OWORD *)&v77.a;
  *(_OWORD *)v80 = *(_OWORD *)&v77.c;
  *(_OWORD *)&v80[16] = *(_OWORD *)&v77.tx;
  v97.origin.CGFloat x = v72;
  v97.origin.CGFloat y = v73;
  v97.size.CGFloat width = a4;
  v97.size.CGFloat height = a5;
  CGRect v98 = CGRectApplyAffineTransform(v97, (CGAffineTransform *)buf);
  CGFloat x = v98.origin.x;
  CGFloat y = v98.origin.y;
  CGFloat height = v98.size.height;
  CGFloat width = v98.size.width;
  unint64_t v71 = v36;
  if (!a10) {
    goto LABEL_41;
  }
  *(void *)buf = 0;
  v48 = PUICreateIOSurfaceForImage(a1, (uint64_t *)buf, 1);
  v49 = v48;
  if (v48)
  {
    int v64 = a10;
    v50 = __PUICreateCroppedIOSurface(v48, x, y, width, height);
    if (v50)
    {
      objc_msgSend(MEMORY[0x263F1C6B0], "pui_imageWithIOSurface:scale:orientation:", v50, v71, v66);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = PUILogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        -[UIImage(PosterUIFoundation) pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:](v51);
      }

      id v34 = 0;
    }

    a10 = v64;
  }
  else
  {
    id v34 = 0;
  }
  if (*(void *)buf) {
    CGImageBlockSetRelease();
  }

  unint64_t v36 = v71;
  if (!v34)
  {
LABEL_41:
    v53 = PUILogCommon();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[UIImage(PosterUIFoundation) pui_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:](v53);
    }

    v54 = objc_msgSend(a1, "pui_CGImageBackedImage");
    v55 = v54;
    if (v29)
    {
      id v34 = 0;
      v56 = 0;
      if (!v31) {
        goto LABEL_51;
      }
    }
    else
    {
      v57 = (CGImage *)[v54 CGImage];
      v99.origin.CGFloat x = x;
      v99.origin.CGFloat y = y;
      v99.size.CGFloat height = height;
      v99.size.CGFloat width = width;
      v56 = CGImageCreateWithImageInRect(v57, v99);
      id v34 = (id)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v56 scale:v36 orientation:v66];
      if (!v31)
      {
LABEL_51:
        if (v56) {
          CGImageRelease(v56);
        }

        int v52 = 1;
        goto LABEL_54;
      }
    }
    if (v34) {
      v58 = v34;
    }
    else {
      v58 = v55;
    }
    uint64_t v59 = objc_msgSend(v58, "pui_resizeImageToSize:preservingAspectRatio:", a9, v74, v75);

    id v34 = (id)v59;
    goto LABEL_51;
  }
  int v52 = 0;
LABEL_54:
  v60 = PUILogRendering();
  v61 = v60;
  if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    uint64_t v62 = [v34 imageOrientation];
    *(_DWORD *)buf = 67112192;
    *(_DWORD *)&buf[4] = v34 != 0;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v30;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)v80 = v31;
    *(_WORD *)&v80[4] = 2048;
    *(CGFloat *)&v80[6] = v72;
    *(_WORD *)&v80[14] = 2048;
    *(CGFloat *)&v80[16] = v73;
    *(_WORD *)&v80[24] = 2048;
    *(CGFloat *)&v80[26] = a4;
    *(_WORD *)&v80[34] = 2048;
    *(CGFloat *)&v80[36] = a5;
    __int16 v81 = 2048;
    double v82 = v74;
    __int16 v83 = 2048;
    double v84 = v75;
    __int16 v85 = 2048;
    unint64_t v86 = v71;
    __int16 v87 = 2048;
    uint64_t v88 = v62;
    __int16 v89 = 1024;
    int v90 = a10;
    __int16 v91 = 1024;
    int v92 = v52;
    _os_signpost_emit_with_name_impl(&dword_25A0AF000, v61, OS_SIGNPOST_INTERVAL_END, v20, "pui_cropImage", "Complete: success=%u needsCrop=%u, needsScale=%u, cropRect=((%f, %f), (%f, %f)), outputSize=(%f, %f), imageOrientation=%lu, outputImage.imageOrientation=%lu canUseIOSurface=%u, usedCPU=%u", buf, 0x70u);
  }

LABEL_15:
  return v34;
}

- (uint64_t)pui_scaleImage:()PosterUIFoundation
{
  return objc_msgSend(a1, "pui_scaleImage:canUseIOSurface:", 1);
}

- (id)pui_scaleImage:()PosterUIFoundation canUseIOSurface:
{
  if (fabs(a2 + -1.0) >= 2.22044605e-16)
  {
    double v8 = *MEMORY[0x263F00148];
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
    [a1 size];
    double v11 = v10;
    double v13 = v12;
    [a1 size];
    double v15 = v14;
    double v17 = v16;
    CGAffineTransformMakeScale(&v19, a2, a2);
    objc_msgSend(a1, "pui_cropImageWithRect:outputSize:canUseIOSurface:", a4, v8, v9, v11, v13, v17 * v19.c + v19.a * v15, v17 * v19.d + v19.b * v15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }
  return v6;
}

- (id)pui_resizeImageToSize:()PosterUIFoundation preservingAspectRatio:
{
  [a1 size];
  if (v9 == a2 && v10 == a3)
  {
    id v15 = a1;
  }
  else
  {
    if (a5)
    {
      double v12 = v9;
      double v13 = v10;
      double v14 = v9 / v10;
      if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        if (v12 >= v13) {
          a3 = floor(a2 * v14);
        }
        else {
          a2 = floor(a3 * v14);
        }
      }
    }
    objc_msgSend(a1, "pui_resizeImageToSize:", a2, a3);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (id)pui_resizeImageToSize:()PosterUIFoundation
{
  [a1 size];
  if (v7 == a2 && v6 == a3)
  {
    id v27 = a1;
    goto LABEL_26;
  }
  [a1 scale];
  double v10 = v9;
  UIRectIntegralWithScale();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = a1;
  os_signpost_id_t v20 = (CGImage *)[v19 CGImage];
  int v21 = MGGetBoolAnswer();
  int v22 = v21;
  if (!v20 || (v21 & 1) != 0)
  {
    if (v21) {
      size_t BitsPerComponent = 16;
    }
    else {
      size_t BitsPerComponent = 8;
    }
    if (v21) {
      uint32_t v24 = 4353;
    }
    else {
      uint32_t v24 = 1;
    }
    if (!v20) {
      goto LABEL_22;
    }
    if ((v21 ^ 1)) {
      goto LABEL_22;
    }
    ColorSpace = CGImageGetColorSpace(v20);
    if (!ColorSpace) {
      goto LABEL_22;
    }
    BOOL v29 = ColorSpace;
    if (!CGColorSpaceIsWideGamutRGB(ColorSpace)) {
      goto LABEL_22;
    }
    CGFloat v25 = v29;
  }
  else
  {
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v20);
    uint32_t v24 = CGImageGetBitmapInfo(v20) & 0xFFFFFFE0 | 1;
    CGFloat v25 = CGImageGetColorSpace(v20);
  }
  CGFloat v26 = CGColorSpaceRetain(v25);
  if (!v26)
  {
LABEL_22:
    int v30 = (CFStringRef *)MEMORY[0x263F00238];
    if (!v22) {
      int v30 = (CFStringRef *)MEMORY[0x263F002D8];
    }
    CGFloat v26 = CGColorSpaceCreateWithName(*v30);
  }
  v38.origin.CGFloat x = v12;
  v38.origin.CGFloat y = v14;
  v38.size.CGFloat width = v16;
  v38.size.CGFloat height = v18;
  size_t v31 = (unint64_t)(v10 * CGRectGetWidth(v38));
  v39.origin.CGFloat x = v12;
  v39.origin.CGFloat y = v14;
  v39.size.CGFloat width = v16;
  v39.size.CGFloat height = v18;
  size_t v32 = (unint64_t)(v10 * CGRectGetHeight(v39));
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v26);
  id v34 = CGBitmapContextCreate(0, v31, v32, BitsPerComponent, (BitsPerComponent >> 3) * v31 + (BitsPerComponent >> 3) * v31 * NumberOfComponents, v26, v24);
  CGContextTranslateCTM(v34, 0.0, (double)v32);
  CGContextScaleCTM(v34, v10, -v10);
  UIGraphicsPushContext(v34);
  objc_msgSend(v19, "drawInRect:", v12, v14, v16, v18);
  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v34);
  CGColorSpaceRelease(v26);
  CGContextRelease(v34);
  id v27 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image scale:0 orientation:v10];
  CGImageRelease(Image);
LABEL_26:
  return v27;
}

- (CGImage)pui_colorSpace
{
  result = (CGImage *)[a1 CGImage];
  if (result)
  {
    return CGImageGetColorSpace(result);
  }
  return result;
}

- (id)pui_imageByManipulatingInDeviceColorSpaceWithBlock:()PosterUIFoundation
{
  v4 = a3;
  if (v4)
  {
    double v5 = (void *)MEMORY[0x25A2F5E70]();
    double v6 = CGColorSpaceRetain((CGColorSpaceRef)objc_msgSend(a1, "pui_colorSpace"));
    if (v6)
    {
      __PUIImageByApplyingColorSpace(a1, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = a1;
    }
    double v9 = v7;
    double v10 = v4[2](v4, v7);
    double v11 = v10;
    if (v10)
    {
      __PUIImageByApplyingColorSpace(v10, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
    CGColorSpaceRelease(v6);
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

- (id)pui_imageHashData
{
  Hash = (void *)[a1 CGImage];
  if (Hash)
  {
    Hash = (void *)CGImageGetHash();
    id v3 = Hash;
    if (Hash)
    {
      Hash = [MEMORY[0x263EFF8F8] dataWithBytes:&v3 length:8];
    }
  }
  return Hash;
}

- (uint64_t)pui_EXIFOrientation
{
  uint64_t v1 = [a1 imageOrientation];
  return MEMORY[0x270F062C0](v1);
}

+ (double)minimumWallpaperSizeForCurrentDevice
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 bounds];
  double v2 = v1;

  if ([MEMORY[0x263F1CB60] _motionEffectsEnabled]) {
    double v3 = PUIPosterParallaxRequiredOverhangForCurrentDeviceClass();
  }
  else {
    double v3 = *MEMORY[0x263F001B0];
  }
  return v2 + v3 * 2.0;
}

+ (id)pui_thumbnailImageForImage:()PosterUIFoundation thumbnailWidthInPixels:
{
  id v6 = a4;
  [v6 scale];
  double v8 = v7;
  uint64_t v9 = [v6 size];
  double v11 = 0;
  if (v12 > 0.0 && v10 > 0.0)
  {
    double v13 = (void *)MEMORY[0x25A2F5E70](v9);
    double v14 = [MEMORY[0x263F1C920] mainScreen];
    [v14 scale];
    double v16 = v15;

    double v17 = [MEMORY[0x263F1C920] mainScreen];
    [v17 _referenceBounds];
    double v19 = v18;
    double v21 = v20;

    double v22 = v16 * v19;
    double v33 = a2;
    double v23 = v16 * v21;
    [a1 minimumWallpaperSizeForCurrentDevice];
    UIRectCenteredIntegralRect();
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGAffineTransformMakeScale(&v34, v16, v16);
    CGAffineTransformInvert(&v35, &v34);
    v37.origin.CGFloat x = v25;
    v37.origin.CGFloat y = v27;
    v37.size.CGFloat width = v29;
    v37.size.CGFloat height = v31;
    CGRect v38 = CGRectApplyAffineTransform(v37, &v35);
    double v11 = objc_msgSend(v6, "pui_cropImageWithRect:outputSize:preservingAspectRatio:", 0, v38.origin.x, v38.origin.y, v38.size.width, v38.size.height, round(v33) * (v16 / v8) / v16, v16 / v8 * round(v23 * (v33 / v22)) / v16);
  }

  return v11;
}

- (BOOL)pui_canDetermineProminentColor
{
  [a1 size];
  if (v3 == *MEMORY[0x263F001B0] && v2 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    return 0;
  }
  double v5 = (__IOSurface *)objc_msgSend(a1, "pui_wrappedIOSurface");
  if (!v5) {
    return [a1 CGImage] != 0;
  }
  uint32_t oldState = 0;
  return IOSurfaceSetPurgeable(v5, 3u, &oldState) || oldState == 0;
}

- (uint64_t)pui_averageColor
{
  [a1 size];
  BSRectWithSize();
  return objc_msgSend(a1, "pui_averageColorForRect:");
}

- (id)pui_averageColorForRect:()PosterUIFoundation
{
  v32[2] = *MEMORY[0x263EF8340];
  [a1 size];
  double v11 = v10;
  double v13 = v12;
  v34.origin.CGFloat x = a2;
  v34.origin.CGFloat y = a3;
  v34.size.CGFloat width = a4;
  v34.size.CGFloat height = a5;
  if (CGRectGetMaxX(v34) > v11) {
    goto LABEL_3;
  }
  v35.origin.CGFloat x = a2;
  v35.origin.CGFloat y = a3;
  v35.size.CGFloat width = a4;
  v35.size.CGFloat height = a5;
  if (CGRectGetMaxY(v35) > v13) {
    goto LABEL_3;
  }
  id v15 = objc_alloc(MEMORY[0x263F00650]);
  id v16 = a1;
  double v17 = objc_msgSend(v15, "initWithCGImage:", objc_msgSend(v16, "CGImage"));
  if (v17
    || (double v17 = objc_msgSend(objc_alloc(MEMORY[0x263F00650]), "initWithIOSurface:", objc_msgSend(v16, "pui_wrappedIOSurface"))) != 0)
  {
    double v18 = objc_msgSend(objc_alloc(MEMORY[0x263F00680]), "initWithCGRect:", a2, a3, a4, a5);
    double v19 = (void *)MEMORY[0x263F00640];
    uint64_t v20 = *MEMORY[0x263F00960];
    v31[0] = *MEMORY[0x263F00968];
    v31[1] = v20;
    v32[0] = v17;
    v32[1] = v18;
    double v21 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    double v22 = [v19 filterWithName:@"CIAreaAverage" withInputParameters:v21];

    double v23 = [v22 outputImage];
    if (v23)
    {
      int v30 = 0;
      double v24 = [MEMORY[0x263F00628] context];
      objc_msgSend(v24, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v23, &v30, 4, *MEMORY[0x263F008B0], objc_msgSend(v16, "pui_colorSpace"), 0.0, 0.0, 1.0, 1.0);

      LOBYTE(v26) = BYTE1(v30);
      LOBYTE(v25) = v30;
      LOBYTE(v28) = HIBYTE(v30);
      LOBYTE(v27) = BYTE2(v30);
      double v14 = [MEMORY[0x263F1C550] colorWithRed:(double)v25 / 255.0 green:(double)v26 / 255.0 blue:(double)v27 / 255.0 alpha:(double)v28 / 255.0];
    }
    else
    {
      double v14 = 0;
    }
  }
  else
  {
LABEL_3:
    double v14 = 0;
  }
  return v14;
}

- (uint64_t)pui_isSolidColor:()PosterUIFoundation
{
  [a1 size];
  double v7 = v6;
  double v8 = v5;
  if (v6 == *MEMORY[0x263F001B0] && v5 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    return 0;
  }
  uint64_t v10 = a1;
  if (v7 > 100.0 || v8 > 100.0)
  {
    objc_msgSend(MEMORY[0x263F1C6B0], "pui_thumbnailImageForImage:thumbnailWidthInPixels:", v10, 100.0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = (uint64_t)v12;
    if (!v12) {
      goto LABEL_23;
    }
  }
  uint64_t v13 = [(id)v10 size];
  double v15 = v14;
  *(float *)&double v14 = v16 / 10.0;
  unint64_t v17 = vcvtms_u32_f32(*(float *)&v14);
  if (!v17)
  {

    id v12 = 0;
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  unint64_t v18 = 0;
  id v12 = 0;
  while (1)
  {
    double v19 = (void *)MEMORY[0x25A2F5E70](v13);
    uint64_t v20 = objc_msgSend((id)v10, "pui_averageColorForRect:", 0.0, (double)v18 * 10.0, v15, 10.0);
    double v21 = v20;
    if (!v12)
    {
      id v12 = v20;
      goto LABEL_16;
    }
    if (([v12 _isSimilarToColor:v20 withinPercentage:0.01] & 1) == 0) {
      break;
    }
LABEL_16:

    if (v17 == ++v18) {
      goto LABEL_20;
    }
  }

LABEL_20:

  uint64_t v10 = v12 != 0;
  if (a3 && v12)
  {
    id v12 = v12;
    *a3 = v12;
    uint64_t v10 = 1;
  }
LABEL_23:

  return v10;
}

- (void)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:.cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_debug_impl(&dword_25A0AF000, log, OS_LOG_TYPE_DEBUG, "Falling back to cropping/resizing on CPU", v1, 2u);
}

- (void)pui_cropImageWithRect:()PosterUIFoundation outputSize:preservingAspectRatio:canUseIOSurface:.cold.2(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_debug_impl(&dword_25A0AF000, log, OS_LOG_TYPE_DEBUG, "Failed to create cropped IOSurface", v1, 2u);
}

@end