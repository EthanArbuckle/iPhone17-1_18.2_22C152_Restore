@interface UIImage(PhotosUICore)
+ (id)px_imageNamed:()PhotosUICore withConfiguration:;
+ (id)px_playOverlayImage:()PhotosUICore;
+ (id)px_roundedCornerMaskImage:()PhotosUICore size:;
+ (id)px_systemImageNamed:()PhotosUICore;
+ (uint64_t)_px_createOverlayImageWithGlyphStyle:()PhotosUICore backgroundWhite:backgroundAlpha:glyphAlpha:;
+ (uint64_t)px_imageNamed:()PhotosUICore;
- (PXImageExtraction)px_extractPlayOverlayBackgroundImageFromLocation:()PhotosUICore inViewportWithSize:contentMode:contentsRect:asynchronously:handler:;
- (id)px_ASTCCompressedImageWithBlockSize:()PhotosUICore;
- (id)px_debugImageWithStrokeRect:()PhotosUICore color:text:;
- (id)px_imageByApplyingAlpha:()PhotosUICore;
- (id)px_imageByCroppingRect:()PhotosUICore pixelTargetSize:cornerRadius:;
- (uint64_t)px_debugImageWithStrokeRect:()PhotosUICore color:;
- (uint64_t)px_drawInRect:()PhotosUICore withContentMode:;
- (uint64_t)px_isLargerThan:()PhotosUICore;
@end

@implementation UIImage(PhotosUICore)

- (id)px_imageByCroppingRect:()PhotosUICore pixelTargetSize:cornerRadius:
{
  v15 = (CGImage *)[a1 CGImage];
  size_t Width = CGImageGetWidth(v15);
  size_t Height = CGImageGetHeight(v15);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v19 = CGBitmapContextCreate(0, (unint64_t)a6, (unint64_t)a7, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = a6;
  v26.size.height = a7;
  CGContextClipToRect(v19, v26);
  if (a8 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a6, a7, a8);
    id v20 = objc_claimAutoreleasedReturnValue();
    v21 = (const CGPath *)[v20 CGPath];

    CGContextAddPath(v19, v21);
    CGContextClip(v19);
  }
  CGContextScaleCTM(v19, a6 / a4, a7 / a5);
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  v28.origin.y = -((double)Height - CGRectGetMaxY(v27));
  v28.origin.x = -a2;
  v28.size.width = (double)Width;
  v28.size.height = (double)Height;
  CGContextDrawImage(v19, v28, v15);
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  v23 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
  CGImageRelease(Image);
  return v23;
}

- (uint64_t)px_isLargerThan:()PhotosUICore
{
  if (a3)
  {
    id v4 = a3;
    objc_msgSend(a1, "px_pixelSize");
    objc_msgSend(v4, "px_pixelSize");

    JUMPOUT(0x1AD10BB40);
  }
  return 1;
}

- (id)px_debugImageWithStrokeRect:()PhotosUICore color:text:
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = a8;
  [a1 size];
  UIGraphicsBeginImageContext(v31);
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  CurrentContext = UIGraphicsGetCurrentContext();
  [v14 setStroke];
  v32.origin.x = a2;
  v32.origin.y = a3;
  v32.size.width = a4;
  v32.size.height = a5;
  CGContextStrokeRectWithWidth(CurrentContext, v32, 5.0);
  if ([v15 length])
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    v28[0] = *MEMORY[0x1E4FB06F8];
    v18 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:40.0];
    v28[1] = *MEMORY[0x1E4FB0700];
    v29[0] = v18;
    v29[1] = v14;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    id v20 = (void *)[v17 initWithString:v15 attributes:v19];

    [v20 size];
    double v22 = v21;
    double v24 = v23;
    v33.origin.x = a2;
    v33.origin.y = a3;
    v33.size.width = a4;
    v33.size.height = a5;
    CGFloat v25 = CGRectGetMinX(v33) + 6.0;
    v34.origin.x = a2;
    v34.origin.y = a3;
    v34.size.width = a4;
    v34.size.height = a5;
    objc_msgSend(v20, "drawInRect:", v25, CGRectGetMaxY(v34) - v24 + -6.0, v22, v24);
  }
  CGRect v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v26;
}

- (uint64_t)px_debugImageWithStrokeRect:()PhotosUICore color:
{
  return objc_msgSend(a1, "px_debugImageWithStrokeRect:color:text:", a3, 0);
}

- (id)px_ASTCCompressedImageWithBlockSize:()PhotosUICore
{
  id v4 = a1;
  v5 = (CGImage *)[v4 CGImage];
  if (PXCreateASTCCompressImage_onceToken != -1) {
    dispatch_once(&PXCreateASTCCompressImage_onceToken, &__block_literal_global_110_196440);
  }
  if (PXCreateASTCCompressImage_deviceSupportsASTC)
  {
    v6 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    CGImageDestinationRef v7 = CGImageDestinationCreateWithData(v6, @"org.khronos.ktx", 1uLL, 0);
    if (!v7) {
      goto LABEL_10;
    }
    v8 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __PXCreateASTCCompressImage_block_invoke_2;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    int v17 = a3;
    if (PXCreateASTCCompressImage_onceToken_118 != -1) {
      dispatch_once(&PXCreateASTCCompressImage_onceToken_118, block);
    }
    CGImageDestinationAddImage(v8, v5, (CFDictionaryRef)PXCreateASTCCompressImage_properties);
    BOOL v9 = CGImageDestinationFinalize(v8);
    CFRelease(v8);
    if (v9)
    {
      v10 = CGImageSourceCreateWithData(v6, 0);
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);
      CFRelease(v10);

      if (ImageAtIndex)
      {
        v12 = (void *)MEMORY[0x1E4FB1818];
        [v4 scale];
        id v14 = objc_msgSend(v12, "imageWithCGImage:scale:orientation:", ImageAtIndex, objc_msgSend(v4, "imageOrientation"), v13);
        CGImageRelease(ImageAtIndex);
        goto LABEL_12;
      }
    }
    else
    {
LABEL_10:
    }
  }
  id v14 = 0;
LABEL_12:
  return v14;
}

- (PXImageExtraction)px_extractPlayOverlayBackgroundImageFromLocation:()PhotosUICore inViewportWithSize:contentMode:contentsRect:asynchronously:handler:
{
  id v17 = a5;
  if (v17)
  {
    if (!a4) {
      goto LABEL_5;
    }
  }
  else
  {
    CGRect v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"UIImage+PhotosUICore.m", 195, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    if (!a4) {
      goto LABEL_5;
    }
  }
  if (px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken != -1) {
    dispatch_once(&px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken, &__block_literal_global_18_196452);
  }
LABEL_5:
  v18 = objc_alloc_init(PXImageExtraction);
  if (px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken_21 != -1) {
    dispatch_once(&px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__onceToken_21, &__block_literal_global_23_196453);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_3;
  aBlock[3] = &unk_1E5DC3D08;
  v19 = v18;
  double v31 = a6;
  double v32 = a7;
  double v33 = a8;
  double v34 = a9;
  CGRect v28 = v19;
  uint64_t v29 = a1;
  uint64_t v35 = a3;
  char v36 = a4;
  id v20 = v17;
  id v30 = v20;
  double v21 = _Block_copy(aBlock);
  double v22 = v21;
  if (a4)
  {
    double v23 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 2);
    (*((void (**)(id, void *, uint64_t, PXImageExtraction *))v20 + 2))(v20, v23, 1, v19);
    dispatch_async((dispatch_queue_t)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___extractionQueue, v22);
  }
  else
  {
    (*((void (**)(void *))v21 + 2))(v21);
  }
  double v24 = v19;

  return v24;
}

- (uint64_t)px_drawInRect:()PhotosUICore withContentMode:
{
  [a1 size];
  if (a3)
  {
    if (a3 == 1) {
      PXRectWithAspectRatioFittingRect();
    }
    if (a3 == 2) {
      PXRectWithAspectRatioFillingRect();
    }
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIImage+PhotosUICore.m", 187, @"support for content mode %i not implemented", a3);
  }
  return objc_msgSend(a1, "drawInRect:", a4, a5, a6, a7);
}

- (id)px_imageByApplyingAlpha:()PhotosUICore
{
  if (a2 >= 1.0)
  {
    id v10 = a1;
  }
  else
  {
    [a1 size];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    [a1 scale];
    CGFloat v9 = v8;
    v13.width = v5;
    v13.height = v7;
    UIGraphicsBeginImageContextWithOptions(v13, 0, v9);
    objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a2);
    UIGraphicsGetImageFromCurrentImageContext();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v10;
}

+ (id)px_roundedCornerMaskImage:()PhotosUICore size:
{
  BOOL v12 = a1 == *(float *)off_1E5DAAF50
     && a2 == *((float *)off_1E5DAAF50 + 1)
     && a3 == *((float *)off_1E5DAAF50 + 2)
     && a4 == *((float *)off_1E5DAAF50 + 3);
  if (v12 || (a5 == *MEMORY[0x1E4F1DB30] ? (BOOL v15 = a6 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v15 = 0), v15))
  {
    id v20 = 0;
  }
  else
  {
    v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v16 scale];
    CGFloat v18 = v17;
    v23.width = a5;
    v23.height = a6;
    UIGraphicsBeginImageContextWithOptions(v23, 0, v18);

    v19 = objc_msgSend(MEMORY[0x1E4FB14C0], "px_bezierPathWithRoundedRect:topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:", 0.0, 0.0, a5, a6, a1, a2, a3, a4);
    [v19 fill];
    id v20 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v20;
}

+ (uint64_t)_px_createOverlayImageWithGlyphStyle:()PhotosUICore backgroundWhite:backgroundAlpha:glyphAlpha:
{
  id v10 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 1);
  v11 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", a6);
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v10 size];
  CGFloat width = v19.width;
  CGFloat height = v19.height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a1, a2);
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v20);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
  objc_msgSend(v11, "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
  objc_msgSend(v11, "drawAtPoint:blendMode:alpha:", 0, v12, v13, a3);
  uint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

+ (id)px_playOverlayImage:()PhotosUICore
{
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  switch(a3)
  {
    case 0:
      if (px_playOverlayImage__onceToken != -1) {
        dispatch_once(&px_playOverlayImage__onceToken, &__block_literal_global_27_196466);
      }
      CGFloat v5 = &px_playOverlayImage__overlayGlyphMask;
      goto LABEL_32;
    case 1:
      if (px_playOverlayImage__onceToken_31[0] != -1) {
        dispatch_once(px_playOverlayImage__onceToken_31, &__block_literal_global_33);
      }
      CGFloat v5 = &px_playOverlayImage__overlayBackgroundMask;
      goto LABEL_32;
    case 2:
      if (px_playOverlayImage__onceToken_37 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_37, &__block_literal_global_39_196467);
      }
      CGFloat v5 = &px_playOverlayImage__approximationImage;
      goto LABEL_32;
    case 3:
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_4;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = a1;
      if (px_playOverlayImage__onceToken_43 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_43, v11);
      }
      CGFloat v5 = &px_playOverlayImage__normalButtonImage;
      goto LABEL_32;
    case 4:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_5;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      void block[4] = a1;
      if (px_playOverlayImage__onceToken_44 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_44, block);
      }
      CGFloat v5 = &px_playOverlayImage__highlightedButtonImage;
      goto LABEL_32;
    case 5:
      if (px_playOverlayImage__onceToken_46 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_46, &__block_literal_global_48_196468);
      }
      CGFloat v5 = &px_playOverlayImage__overlayGlyphMask_45;
      goto LABEL_32;
    case 6:
      if (px_playOverlayImage__onceToken_53 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_53, &__block_literal_global_55_196469);
      }
      CGFloat v5 = &px_playOverlayImage__approximationImage_52;
      goto LABEL_32;
    case 7:
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_8;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = a1;
      if (px_playOverlayImage__onceToken_60 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_60, v9);
      }
      CGFloat v5 = &px_playOverlayImage__normalButtonImage_59;
      goto LABEL_32;
    case 8:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_9;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      if (px_playOverlayImage__onceToken_62 != -1) {
        dispatch_once(&px_playOverlayImage__onceToken_62, v8);
      }
      CGFloat v5 = &px_playOverlayImage__highlightedButtonImage_61;
LABEL_32:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)px_systemImageNamed:()PhotosUICore
{
  id v3 = a3;
  if ([v3 hasPrefix:@"PX"]) {
    objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v3);
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  }

  return v4;
}

+ (id)px_imageNamed:()PhotosUICore withConfiguration:
{
  CGFloat v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  double v8 = objc_msgSend(v5, "px_bundle");
  CGFloat v9 = objc_msgSend((id)objc_opt_class(), "px_imageNamed:configuration:bundle:", v7, v6, v8);

  return v9;
}

+ (uint64_t)px_imageNamed:()PhotosUICore
{
  return objc_msgSend(a1, "px_imageNamed:withConfiguration:", a3, 0);
}

@end