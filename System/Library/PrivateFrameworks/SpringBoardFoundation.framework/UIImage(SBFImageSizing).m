@interface UIImage(SBFImageSizing)
- (id)sbf_cropImageWithRect:()SBFImageSizing outputSize:preservingAspectRatio:canUseIOSurface:;
- (id)sbf_resizeImageToSize:()SBFImageSizing;
- (id)sbf_resizeImageToSize:()SBFImageSizing preservingAspectRatio:;
- (id)sbf_scaleImage:()SBFImageSizing canUseIOSurface:;
- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:;
- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:canUseIOSurface:;
- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:preservingAspectRatio:;
- (uint64_t)sbf_scaleImage:()SBFImageSizing;
@end

@implementation UIImage(SBFImageSizing)

- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:
{
  return objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:canUseIOSurface:", 1);
}

- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:preservingAspectRatio:
{
  return objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", a3, 1);
}

- (uint64_t)sbf_cropImageWithRect:()SBFImageSizing outputSize:canUseIOSurface:
{
  return objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:preservingAspectRatio:canUseIOSurface:", 1, a3);
}

- (id)sbf_cropImageWithRect:()SBFImageSizing outputSize:preservingAspectRatio:canUseIOSurface:
{
  CGFloat v19 = *MEMORY[0x1E4F1DAD8];
  CGFloat v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [a1 size];
  v63.size.CGFloat width = v21;
  v63.size.CGFloat height = v22;
  v56.origin.CGFloat x = a2;
  v56.origin.CGFloat y = a3;
  v56.size.CGFloat width = a4;
  v56.size.CGFloat height = a5;
  v63.origin.CGFloat x = v19;
  v63.origin.CGFloat y = v20;
  BOOL v23 = CGRectEqualToRect(v56, v63);
  BOOL v24 = a5 != a7 || a4 != a6;
  v57.origin.CGFloat x = a2;
  v57.origin.CGFloat y = a3;
  v57.size.CGFloat width = a4;
  v57.size.CGFloat height = a5;
  if (CGRectIsEmpty(v57)
    || v23 && !v24
    || (BSFloatLessThanOrEqualToFloat() & 1) != 0
    || BSFloatLessThanOrEqualToFloat())
  {
    id v25 = a1;
    goto LABEL_9;
  }
  [a1 scale];
  double v28 = v27;
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeScale(&v52, v27, v27);
  CGAffineTransform v51 = v52;
  v58.origin.CGFloat x = a2;
  v58.origin.CGFloat y = a3;
  v58.size.CGFloat width = a4;
  v58.size.CGFloat height = a5;
  CGRect v59 = CGRectApplyAffineTransform(v58, &v51);
  CGFloat x = v59.origin.x;
  CGFloat y = v59.origin.y;
  CGFloat width = v59.size.width;
  CGFloat height = v59.size.height;
  if (!a10)
  {
LABEL_38:
    v42 = SBLogCommon();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v51.a) = 0;
      _os_log_impl(&dword_18B52E000, v42, OS_LOG_TYPE_DEFAULT, "Falling back to cropping/resizing on CPU", (uint8_t *)&v51, 2u);
    }

    v43 = objc_msgSend(a1, "sbf_CGImageBackedImage");
    v44 = v43;
    if (v23)
    {
      id v25 = 0;
      v45 = 0;
      if (!v24) {
        goto LABEL_48;
      }
    }
    else
    {
      v46 = (CGImage *)[v43 CGImage];
      v62.origin.CGFloat x = x;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      v62.size.CGFloat height = height;
      v45 = CGImageCreateWithImageInRect(v46, v62);
      id v25 = (id)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v45 scale:0 orientation:v28];
      if (!v24)
      {
LABEL_48:
        if (v45) {
          CGImageRelease(v45);
        }

        goto LABEL_9;
      }
    }
    if (v25) {
      v47 = v25;
    }
    else {
      v47 = v44;
    }
    uint64_t v48 = objc_msgSend(v47, "sbf_resizeImageToSize:preservingAspectRatio:", a9, a6, a7, *(void *)&d);

    id v25 = (id)v48;
    goto LABEL_48;
  }
  uint64_t v50 = 0;
  v33 = SBFCreateIOSurfaceForImage(a1, &v50, 1);
  v34 = v33;
  if (!v33) {
    goto LABEL_34;
  }
  CGFloat d = v52.d;
  id v35 = v33;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  if (CGRectIsEmpty(v60) || (BSFloatLessThanOrEqualToFloat() & 1) != 0 || (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    id v25 = 0;
LABEL_18:

    goto LABEL_35;
  }
  v51.a = 0.0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CVPixelBufferRef texture = 0;
  CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int IOSurfaceBackedCVPixelBufferWithAttributes = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (IOSurfaceRef)v35, 0, (CVPixelBufferRef *)&v51);
  v38 = 0;
  if (!IOSurfaceBackedCVPixelBufferWithAttributes)
  {
    if (*(void *)&v51.a)
    {
      int IOSurfaceBackedCVPixelBufferWithAttributes = VTPixelTransferSessionCreate(v36, &pixelTransferSessionOut);
      v38 = 0;
      if (!IOSurfaceBackedCVPixelBufferWithAttributes)
      {
        if (pixelTransferSessionOut)
        {
          v61.origin.CGFloat x = x;
          v61.origin.CGFloat y = y;
          v61.size.CGFloat width = width;
          v61.size.CGFloat height = height;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v61);
          int IOSurfaceBackedCVPixelBufferWithAttributes = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
          CFRelease(DictionaryRepresentation);
          if (IOSurfaceBackedCVPixelBufferWithAttributes)
          {
LABEL_26:
            v38 = 0;
            goto LABEL_27;
          }
          OSStatus v40 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F450D0], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
          if (v40)
          {
            int IOSurfaceBackedCVPixelBufferWithAttributes = v40;
            goto LABEL_26;
          }
          IOSurfaceGetPixelFormat((IOSurfaceRef)v35);
          int IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
          v38 = 0;
          if (!IOSurfaceBackedCVPixelBufferWithAttributes && texture)
          {
            int IOSurfaceBackedCVPixelBufferWithAttributes = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, *(CVPixelBufferRef *)&v51.a, texture);
            if (IOSurfaceBackedCVPixelBufferWithAttributes) {
              goto LABEL_26;
            }
            v38 = CVPixelBufferGetIOSurface(texture);
          }
        }
      }
    }
  }
LABEL_27:
  CVPixelBufferRelease(*(CVPixelBufferRef *)&v51.a);
  CVPixelBufferRelease(texture);
  if (pixelTransferSessionOut)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
  }
  if (IOSurfaceBackedCVPixelBufferWithAttributes) {
    id v41 = 0;
  }
  else {
    id v41 = v38;
  }

  if (v41)
  {
    objc_msgSend(MEMORY[0x1E4F42A80], "sbf_imageWithIOSurface:scale:orientation:", v41, 0, v28);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = v41;
    goto LABEL_18;
  }
LABEL_34:
  id v25 = 0;
LABEL_35:
  if (v50) {
    CGImageBlockSetRelease();
  }

  if (!v25) {
    goto LABEL_38;
  }
LABEL_9:
  return v25;
}

- (uint64_t)sbf_scaleImage:()SBFImageSizing
{
  return objc_msgSend(a1, "sbf_scaleImage:canUseIOSurface:", 1);
}

- (id)sbf_scaleImage:()SBFImageSizing canUseIOSurface:
{
  if (fabs(a2 + -1.0) >= 2.22044605e-16)
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [a1 size];
    double v11 = v10;
    double v13 = v12;
    [a1 size];
    double v15 = v14;
    double v17 = v16;
    CGAffineTransformMakeScale(&v19, a2, a2);
    objc_msgSend(a1, "sbf_cropImageWithRect:outputSize:canUseIOSurface:", a4, v8, v9, v11, v13, v17 * v19.c + v19.a * v15, v17 * v19.d + v19.b * v15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }
  return v6;
}

- (id)sbf_resizeImageToSize:()SBFImageSizing preservingAspectRatio:
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
    objc_msgSend(a1, "sbf_resizeImageToSize:", a2, a3);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (id)sbf_resizeImageToSize:()SBFImageSizing
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
  CGFloat v20 = (CGImage *)[v19 CGImage];
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
    v29 = ColorSpace;
    if (!CGColorSpaceIsWideGamutRGB(ColorSpace)) {
      goto LABEL_22;
    }
    id v25 = v29;
  }
  else
  {
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v20);
    uint32_t v24 = CGImageGetBitmapInfo(v20) & 0xFFFFFFE0 | 1;
    id v25 = CGImageGetColorSpace(v20);
  }
  v26 = CGColorSpaceRetain(v25);
  if (!v26)
  {
LABEL_22:
    v30 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
    if (!v22) {
      v30 = (CFStringRef *)MEMORY[0x1E4F1DC98];
    }
    v26 = CGColorSpaceCreateWithName(*v30);
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
  v34 = CGBitmapContextCreate(0, v31, v32, BitsPerComponent, (BitsPerComponent >> 3) * v31 + (BitsPerComponent >> 3) * v31 * NumberOfComponents, v26, v24);
  CGContextTranslateCTM(v34, 0.0, (double)v32);
  CGContextScaleCTM(v34, v10, -v10);
  UIGraphicsPushContext(v34);
  objc_msgSend(v19, "drawInRect:", v12, v14, v16, v18);
  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v34);
  CGColorSpaceRelease(v26);
  CGContextRelease(v34);
  objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v19, "imageOrientation"), v10);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
LABEL_26:
  return v27;
}

@end