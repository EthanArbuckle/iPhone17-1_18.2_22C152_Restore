@interface UIImage(Utilities)
+ (double)ic_aspectFitImageFrameForViewWithFrame:()Utilities imageSize:;
+ (id)ic_UIImageFromCIImage:()Utilities;
+ (id)ic_fileIconForURL:()Utilities withPreferredSize:;
+ (id)ic_imageNamed:()Utilities withTint:;
+ (id)ic_imageNamed:()Utilities withTint:size:;
+ (id)ic_imageWithColor:()Utilities size:;
+ (id)ic_imageWithContentsOfURL:()Utilities;
+ (id)ic_orientationMetadataFromImageOrientation:()Utilities;
+ (id)ic_orientedImageFromCGImage:()Utilities scale:transform:;
+ (id)ic_orientedImageFromImage:()Utilities fromOrientation:;
+ (id)ic_orientedImageFromImage:()Utilities toOrientation:;
+ (id)ic_symbolsNeedingPrivateCatalog;
+ (id)ic_symbolsNeedingUIAsset;
+ (id)ic_systemImageNamed:()Utilities;
+ (id)ic_systemImageNamed:()Utilities usePrivateCatalog:;
+ (uint64_t)ic_imageWithCGImage:()Utilities scale:orientation:;
+ (uint64_t)ic_imageWithData:()Utilities;
+ (uint64_t)ic_systemImageNamed:()Utilities pointSize:;
+ (void)ic_cacheSystemImages;
- (CGContextRef)ic_newARGB8BitmapContextFromImage:()Utilities;
- (id)ic_JPEGDataWithOrientation:()Utilities;
- (id)ic_PDFData;
- (id)ic_PNGData;
- (id)ic_PNGDataWithOrientation:()Utilities;
- (id)ic_decodeInBackground;
- (id)ic_imageCenteredWithBackgroundColor:()Utilities size:cornerRadius:;
- (id)ic_imageDataWithUTType:()Utilities;
- (id)ic_imageDataWithUTType:()Utilities metadata:;
- (id)ic_imageFromRect:()Utilities;
- (id)ic_imageWithBackgroundColor:()Utilities;
- (id)ic_imageWithTint:()Utilities;
- (id)ic_imageWithTint:()Utilities size:;
- (id)ic_scaledImageWithSize:()Utilities scale:;
- (uint64_t)ic_CGImage;
- (uint64_t)ic_JPEGData;
- (uint64_t)ic_horizontallyMirroredImage;
- (uint64_t)ic_imageCenteredWithBackgroundColor:()Utilities size:;
- (uint64_t)ic_scaledImageMaxDimension:()Utilities scale:;
- (uint64_t)ic_scaledImageMinDimension:()Utilities scale:;
- (void)ic_cropRectZeroAlpha;
- (void)ic_decodeWithCompletion:()Utilities;
@end

@implementation UIImage(Utilities)

- (id)ic_decodeInBackground
{
  v2 = [a1 imageRendererFormat];
  [a1 scale];
  objc_msgSend(v2, "setScale:");
  id v3 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [a1 size];
  v4 = objc_msgSend(v3, "initWithSize:format:", v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__UIImage_Utilities__ic_decodeInBackground__block_invoke;
  v7[3] = &unk_1E5FD8F70;
  v7[4] = a1;
  v5 = [v4 imageWithActions:v7];

  return v5;
}

+ (id)ic_imageWithContentsOfURL:()Utilities
{
  id v3 = (objc_class *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 path];

  v7 = (void *)[v5 initWithContentsOfFile:v6];
  return v7;
}

- (uint64_t)ic_CGImage
{
  id v1 = a1;
  return [v1 CGImage];
}

+ (void)ic_cacheSystemImages
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (ic_systemImageCache)
  {
    v0 = (void *)MEMORY[0x1E4F836F8];
    [v0 handleFailedAssertWithCondition:"__objc_no" functionName:"+[UIImage(Utilities) ic_cacheSystemImages]" simulateCrash:1 showAlert:0 format:@"ic_cacheSystemImages should only be called once at launch"];
  }
  else
  {
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"![NSThread isMainThread]" functionName:"+[UIImage(Utilities) ic_cacheSystemImages]" simulateCrash:1 showAlert:0 format:@"Unexpected call from main thread"];
    }
    id v1 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v2 = [&unk_1F09A3EA8 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(&unk_1F09A3EA8);
          }
          uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          v7 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_systemImageNamed:", v6);
          [v1 setObject:v7 forKey:v6];
        }
        uint64_t v3 = [&unk_1F09A3EA8 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v3);
    }
    v8 = (void *)ic_systemImageCache;
    ic_systemImageCache = (uint64_t)v1;
  }
}

+ (id)ic_systemImageNamed:()Utilities
{
  id v4 = a3;
  id v5 = [(id)ic_systemImageCache objectForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = objc_msgSend(a1, "ic_symbolsNeedingUIAsset");
    int v9 = [v8 containsObject:v4];

    if (v9)
    {
      long long v10 = (void *)MEMORY[0x1E4F28B50];
      long long v11 = ICUIFrameworkBundleIdentifier();
      long long v12 = [v10 bundleWithIdentifier:v11];

      v13 = [MEMORY[0x1E4FB1818] imageNamed:v4 inBundle:v12];

      goto LABEL_7;
    }
    uint64_t v14 = objc_msgSend(a1, "ic_symbolsNeedingPrivateCatalog");
    uint64_t v15 = [v14 containsObject:v4];

    objc_msgSend(a1, "ic_systemImageNamed:usePrivateCatalog:", v4, v15);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v7;
LABEL_7:

  return v13;
}

+ (id)ic_systemImageNamed:()Utilities usePrivateCatalog:
{
  if (a4) {
    objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");
  }
  else {
  id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:");
  }
  return v4;
}

+ (id)ic_symbolsNeedingUIAsset
{
  if (ic_symbolsNeedingUIAsset_token[0] != -1) {
    dispatch_once(ic_symbolsNeedingUIAsset_token, &__block_literal_global_25);
  }
  v0 = (void *)ic_symbolsNeedingUIAsset_symbolsNeedingUIAsset;
  return v0;
}

+ (id)ic_symbolsNeedingPrivateCatalog
{
  if (ic_symbolsNeedingPrivateCatalog_token != -1) {
    dispatch_once(&ic_symbolsNeedingPrivateCatalog_token, &__block_literal_global_0);
  }
  v0 = (void *)ic_symbolsNeedingPrivateCatalog_symbolsNeedingPrivateCatalog;
  return v0;
}

+ (id)ic_imageNamed:()Utilities withTint:
{
  id v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = a4;
  id v7 = [v5 imageNamed:a3];
  v8 = objc_msgSend(v7, "ic_imageWithTint:", v6);

  return v8;
}

+ (id)ic_imageNamed:()Utilities withTint:size:
{
  int v9 = (void *)MEMORY[0x1E4FB1818];
  id v10 = a6;
  long long v11 = [v9 imageNamed:a5];
  long long v12 = objc_msgSend(v11, "ic_imageWithTint:size:", v10, a1, a2);

  return v12;
}

+ (uint64_t)ic_systemImageNamed:()Utilities pointSize:
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "ic_systemImageNamed:pointSize:");
}

- (id)ic_imageWithTint:()Utilities
{
  id v4 = a3;
  [a1 size];
  id v5 = objc_msgSend(a1, "ic_imageWithTint:size:", v4);

  return v5;
}

- (id)ic_imageWithTint:()Utilities size:
{
  id v8 = a5;
  int v9 = [MEMORY[0x1E4FB17E0] defaultFormat];
  id v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  objc_msgSend(v9, "setScale:");

  long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v9, a2, a3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__UIImage_Utilities__ic_imageWithTint_size___block_invoke;
  v15[3] = &unk_1E5FD8EA8;
  double v18 = a2;
  double v19 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  double v22 = a2;
  double v23 = a3;
  id v16 = v8;
  uint64_t v17 = a1;
  id v12 = v8;
  v13 = [v11 imageWithActions:v15];

  return v13;
}

- (uint64_t)ic_scaledImageMinDimension:()Utilities scale:
{
  [a1 size];
  if (v6 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double v9 = a2 / v8;
  double v10 = round(v6 * v9);
  double v11 = round(v7 * v9);
  return objc_msgSend(a1, "ic_scaledImageWithSize:scale:", v10, v11, a3);
}

- (uint64_t)ic_scaledImageMaxDimension:()Utilities scale:
{
  [a1 size];
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  double v9 = a2 / v8;
  double v10 = round(v6 * v9);
  double v11 = round(v7 * v9);
  return objc_msgSend(a1, "ic_scaledImageWithSize:scale:", v10, v11, a3);
}

- (id)ic_scaledImageWithSize:()Utilities scale:
{
  if (_UIApplicationIsExtension())
  {
    double v8 = objc_msgSend(a1, "imageByPreparingThumbnailOfSize:", a2, a3);
  }
  else
  {
    double v9 = [a1 imageRendererFormat];
    [v9 setScale:a4];
    double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v9, a2, a3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__UIImage_Utilities__ic_scaledImageWithSize_scale___block_invoke;
    v12[3] = &unk_1E5FD8ED0;
    v12[4] = a1;
    *(double *)&v12[5] = a2;
    *(double *)&v12[6] = a3;
    double v8 = [v10 imageWithActions:v12];
  }
  return v8;
}

- (id)ic_imageFromRect:()Utilities
{
  [a1 scale];
  if (v10 > 1.0)
  {
    [a1 scale];
    a2 = a2 * v11;
    [a1 scale];
    a3 = a3 * v12;
    [a1 scale];
    a4 = a4 * v13;
    [a1 scale];
    a5 = a5 * v14;
  }
  uint64_t v15 = (CGImage *)objc_msgSend(a1, "ic_CGImage");
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  id v16 = CGImageCreateWithImageInRect(v15, v22);
  uint64_t v17 = (void *)MEMORY[0x1E4FB1818];
  [a1 scale];
  double v19 = objc_msgSend(v17, "imageWithCGImage:scale:orientation:", v16, objc_msgSend(a1, "imageOrientation"), v18);
  CGImageRelease(v16);
  return v19;
}

- (id)ic_imageWithBackgroundColor:()Utilities
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [a1 size];
  double v6 = objc_msgSend(v5, "initWithSize:");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__UIImage_Utilities__ic_imageWithBackgroundColor___block_invoke;
  v10[3] = &unk_1E5FD8E18;
  id v11 = v4;
  double v12 = a1;
  id v7 = v4;
  double v8 = [v6 imageWithActions:v10];

  return v8;
}

+ (id)ic_UIImageFromCIImage:()Utilities
{
  id v3 = a3;
  [v3 extent];
  double v5 = v4;
  double v7 = v6;
  v14.width = v4;
  v14.height = v6;
  UIGraphicsBeginImageContext(v14);
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v10 = [MEMORY[0x1E4FB1818] imageWithCIImage:v3];

  objc_msgSend(v10, "drawInRect:", v8, v9, v5, v7);
  id v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)ic_orientedImageFromCGImage:()Utilities scale:transform:
{
  long long v8 = a5[1];
  *(_OWORD *)&v27.a = *a5;
  *(_OWORD *)&v27.c = v8;
  *(_OWORD *)&v27.tdouble x = a5[2];
  CGAffineTransformInvert(&transform, &v27);
  long long v9 = *(_OWORD *)&transform.c;
  *a5 = *(_OWORD *)&transform.a;
  a5[1] = v9;
  a5[2] = *(_OWORD *)&transform.tx;
  CGFloat v10 = *MEMORY[0x1E4F1DAD8];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double Width = (double)CGImageGetWidth(a4);
  double Height = (double)CGImageGetHeight(a4);
  long long v14 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v14;
  *(_OWORD *)&transform.tdouble x = a5[2];
  CGFloat v15 = v10;
  *(CGFloat *)&long long v14 = v11;
  double v16 = Width;
  double v17 = Height;
  CGRect v30 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v14 - 8), &transform);
  double x = v30.origin.x;
  double y = v30.origin.y;
  uint64_t v20 = (CGContext *)TSUCreateRGBABitmapContext();
  if (!v20) {
    goto LABEL_4;
  }
  uint64_t v21 = v20;
  CGContextTranslateCTM(v20, -x, -y);
  long long v22 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v22;
  *(_OWORD *)&transform.tdouble x = a5[2];
  CGContextConcatCTM(v21, &transform);
  v31.origin.double x = v10;
  v31.origin.double y = v11;
  v31.size.width = Width;
  v31.size.height = Height;
  CGContextDrawImage(v21, v31, a4);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  if (!Image
    || (objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithCGImage:scale:orientation:", Image, 0, a1),
        v24 = objc_claimAutoreleasedReturnValue(),
        CGImageRelease(Image),
        !v24))
  {
LABEL_4:
    v25 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[UIImage(Utilities) ic_orientedImageFromCGImage:scale:transform:](v25);
    }

    v24 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithCGImage:", a4);
  }
  return v24;
}

+ (id)ic_orientedImageFromImage:()Utilities fromOrientation:
{
  id v3 = (CGImage *)objc_msgSend(a3, "ic_CGImage");
  CGImageGetWidth(v3);
  CGImageGetHeight(v3);
  ICTransformFromImageOrientation();
  memset(v6, 0, sizeof(v6));
  CGFloat v4 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_orientedImageFromCGImage:scale:transform:", v3, v6, 1.0);
  return v4;
}

+ (id)ic_orientedImageFromImage:()Utilities toOrientation:
{
  id v3 = (CGImage *)objc_msgSend(a3, "ic_CGImage");
  CGImageGetWidth(v3);
  CGImageGetHeight(v3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  ICTransformFromImageOrientation();
  CGFloat v4 = (void *)MEMORY[0x1E4FB1818];
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformInvert(&v8, &v7);
  double v5 = objc_msgSend(v4, "ic_orientedImageFromCGImage:scale:transform:", v3, &v8, 1.0);
  return v5;
}

+ (uint64_t)ic_imageWithCGImage:()Utilities scale:orientation:
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:");
}

+ (uint64_t)ic_imageWithData:()Utilities
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "imageWithData:");
}

- (uint64_t)ic_horizontallyMirroredImage
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v3 = objc_msgSend(a1, "ic_CGImage");
  [a1 scale];
  return objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v3, 4);
}

- (uint64_t)ic_imageCenteredWithBackgroundColor:()Utilities size:
{
  return objc_msgSend(a1, "ic_imageCenteredWithBackgroundColor:size:cornerRadius:", a3, a4, 0.0);
}

- (id)ic_imageCenteredWithBackgroundColor:()Utilities size:cornerRadius:
{
  id v10 = a6;
  long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a2, a3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__UIImage_Utilities__ic_imageCenteredWithBackgroundColor_size_cornerRadius___block_invoke;
  v15[3] = &unk_1E5FD8EF8;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;
  id v16 = v10;
  uint64_t v17 = a1;
  id v12 = v10;
  double v13 = [v11 imageWithActions:v15];

  return v13;
}

+ (id)ic_orientationMetadataFromImageOrientation:()Utilities
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = dword_1B0B98778[a3 - 1];
  }
  CGAffineTransform v7 = @"Orientation";
  CGFloat v4 = [NSNumber numberWithInt:v3];
  v8[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (uint64_t)ic_JPEGData
{
  uint64_t v2 = objc_msgSend(a1, "ic_imageOrientation");
  return objc_msgSend(a1, "ic_JPEGDataWithOrientation:", v2);
}

- (id)ic_JPEGDataWithOrientation:()Utilities
{
  double v5 = [(id)*MEMORY[0x1E4F44410] identifier];
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "ic_orientationMetadataFromImageOrientation:", a3);
  CGAffineTransform v7 = objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v5, v6);

  return v7;
}

- (id)ic_PNGData
{
  uint64_t v2 = [(id)*MEMORY[0x1E4F44460] identifier];
  uint64_t v3 = objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v2, 0);

  return v3;
}

- (id)ic_PNGDataWithOrientation:()Utilities
{
  double v5 = [(id)*MEMORY[0x1E4F44460] identifier];
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "ic_orientationMetadataFromImageOrientation:", a3);
  CGAffineTransform v7 = objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v5, v6);

  return v7;
}

- (id)ic_PDFData
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F38DA0]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F38DB0]) initWithImage:a1];
  [v2 insertPage:v3 atIndex:0];
  CGFloat v4 = [v2 dataRepresentation];

  return v4;
}

- (id)ic_imageDataWithUTType:()Utilities
{
  id v4 = a3;
  double v5 = [(id)*MEMORY[0x1E4F44410] identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    CGAffineTransform v7 = objc_msgSend((id)objc_opt_class(), "ic_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "ic_imageOrientation"));
  }
  else
  {
    CGAffineTransform v7 = 0;
  }
  CGAffineTransform v8 = objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v4, v7);

  return v8;
}

- (id)ic_imageDataWithUTType:()Utilities metadata:
{
  int v6 = a3;
  CFDictionaryRef v7 = a4;
  CGAffineTransform v8 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v9 = CGImageDestinationCreateWithData(v8, v6, 1uLL, 0);
  if (v9)
  {
    id v10 = v9;
    CGImageDestinationAddImage(v9, (CGImageRef)objc_msgSend(a1, "ic_CGImage"), v7);
    if (CGImageDestinationFinalize(v10))
    {
      CFRelease(v10);
      long long v11 = (void *)[(__CFData *)v8 copy];
      goto LABEL_11;
    }
    double v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[UIImage(Utilities) ic_imageDataWithUTType:metadata:]((uint64_t)v6, v13);
    }

    CFRelease(v10);
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[UIImage(Utilities) ic_imageDataWithUTType:metadata:](v12);
    }
  }
  long long v11 = 0;
LABEL_11:

  return v11;
}

+ (id)ic_fileIconForURL:()Utilities withPreferredSize:
{
  if (!a5)
  {
    long long v9 = 0;
    goto LABEL_33;
  }
  CFDictionaryRef v7 = [MEMORY[0x1E4F22430] documentProxyForURL:a5 isContentManaged:0 sourceAuditToken:0];
  CGAffineTransform v8 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v7 format:3];
  long long v9 = v8;
  if (!v8 || ([v8 size], v10 < a1) || (objc_msgSend(v9, "size"), v11 < a2))
  {
    id v12 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v7 format:6];
    if (v12)
    {
      double v13 = v12;
      if (!v9
        || ([v12 size], double v15 = v14, objc_msgSend(v9, "size"), v15 > v16)
        && ([v13 size], double v18 = v17, objc_msgSend(v9, "size"), v18 > v19))
      {
        id v20 = v13;

        long long v9 = v20;
      }
    }
    else if (!v9)
    {
      char v23 = 1;
      goto LABEL_16;
    }
  }
  [v9 size];
  if (v21 >= a1)
  {
    [v9 size];
    if (v22 >= a2) {
      goto LABEL_22;
    }
  }
  char v23 = 0;
LABEL_16:
  v24 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v7 format:4];
  v25 = v24;
  if (v24
    && ((v23 & 1) != 0
     || ([v24 size], double v27 = v26, objc_msgSend(v9, "size"), v27 > v28)
     && ([v25 size], double v30 = v29, objc_msgSend(v9, "size"), v30 > v31)))
  {

    long long v9 = v25;
  }
  else
  {

    if (!v9)
    {
      char v34 = 1;
LABEL_26:
      v35 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v7 format:7];
      v36 = v35;
      if (v35)
      {
        if ((v34 & 1) != 0
          || ([v35 size], double v38 = v37, objc_msgSend(v9, "size"), v38 > v39)
          && ([v36 size], double v41 = v40, objc_msgSend(v9, "size"), v41 > v42))
        {
          id v43 = v36;

          long long v9 = v43;
        }
      }

      goto LABEL_32;
    }
  }
LABEL_22:
  [v9 size];
  if (v32 < a1 || ([v9 size], v33 < a2))
  {
    char v34 = 0;
    goto LABEL_26;
  }
LABEL_32:

LABEL_33:
  return v9;
}

- (void)ic_decodeWithCompletion:()Utilities
{
  uint64_t v4 = ic_decodeWithCompletion__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&ic_decodeWithCompletion__onceToken, &__block_literal_global_67);
  }
  int v6 = (void *)[v5 copy];

  CFDictionaryRef v7 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_2;
  double v13 = &unk_1E5FD8F48;
  uint64_t v14 = a1;
  id v15 = v6;
  id v8 = v6;
  long long v9 = [v7 blockOperationWithBlock:&v10];
  objc_msgSend((id)ic_decodeWithCompletion__drawingDecodingOperationQueue, "addOperation:", v9, v10, v11, v12, v13, v14);
}

+ (id)ic_imageWithColor:()Utilities size:
{
  id v7 = a5;
  v14.width = a1;
  v14.height = a2;
  UIGraphicsBeginImageContext(v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v7;
  uint64_t v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.width = a1;
  v15.size.height = a2;
  CGContextFillRect(CurrentContext, v15);
  uint64_t v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

+ (double)ic_aspectFitImageFrameForViewWithFrame:()Utilities imageSize:
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  float v13 = CGRectGetWidth(*(CGRect *)(&a3 - 2)) / a5;
  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  v19.size.width = a3;
  v19.size.height = a4;
  float v14 = CGRectGetHeight(v19) / a6;
  double v15 = a5 * fminf(v13, v14);
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.width = a3;
  v20.size.height = a4;
  float v16 = (CGRectGetWidth(v20) - v15) * 0.5;
  double v17 = roundf(v16);
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectGetHeight(v21);
  return a1 + v17;
}

- (void)ic_cropRectZeroAlpha
{
  id v2 = (CGImage *)objc_msgSend(a1, "ic_CGImage");
  uint64_t v3 = objc_msgSend(a1, "ic_newARGB8BitmapContextFromImage:", v2);
  if (v3)
  {
    uint64_t v4 = (CGContext *)v3;
    size_t Width = CGImageGetWidth(v2);
    size_t Height = CGImageGetHeight(v2);
    v22.size.height = (double)Height;
    v22.origin.double x = 0.0;
    v22.origin.double y = 0.0;
    v22.size.width = (double)Width;
    CGContextDrawImage(v4, v22, v2);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v4);
    CGContextRelease(v4);
    if (Data)
    {
      if (Height)
      {
        size_t v8 = 0;
        size_t v9 = 0;
        size_t v10 = 0;
        uint64_t v11 = Data;
        size_t v12 = Height;
        size_t v13 = Width;
        do
        {
          if (Width)
          {
            size_t v14 = 0;
            double v15 = v11;
            do
            {
              int v17 = *v15;
              v15 += 4;
              int v16 = v17;
              if (v13 >= v14) {
                size_t v18 = v14;
              }
              else {
                size_t v18 = v13;
              }
              if (v10 <= v14) {
                size_t v19 = v14;
              }
              else {
                size_t v19 = v10;
              }
              if (v12 >= v8) {
                size_t v20 = v8;
              }
              else {
                size_t v20 = v12;
              }
              if (v9 <= v8) {
                size_t v21 = v8;
              }
              else {
                size_t v21 = v9;
              }
              if (v16)
              {
                size_t v13 = v18;
                size_t v12 = v20;
                size_t v10 = v19;
                size_t v9 = v21;
              }
              ++v14;
            }
            while (Width != v14);
            v11 += 4 * Width;
          }
          ++v8;
        }
        while (v8 != Height);
      }
      free(Data);
      [a1 scale];
    }
  }
}

- (CGContextRef)ic_newARGB8BitmapContextFromImage:()Utilities
{
  size_t Width = CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(image);
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB) {
    return 0;
  }
  id v7 = DeviceRGB;
  size_t v8 = malloc_type_malloc(4 * Width * Height, 0xBB5841ABuLL);
  if (v8)
  {
    size_t v9 = v8;
    CGContextRef v10 = CGBitmapContextCreate(v8, Width, Height, 8uLL, 4 * Width, v7, 2u);
    if (!v10) {
      free(v9);
    }
  }
  else
  {
    CGContextRef v10 = 0;
  }
  CGColorSpaceRelease(v7);
  return v10;
}

+ (void)ic_orientedImageFromCGImage:()Utilities scale:transform:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", v1, 2u);
}

- (void)ic_imageDataWithUTType:()Utilities metadata:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestinationRef", v1, 2u);
}

- (void)ic_imageDataWithUTType:()Utilities metadata:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[UIImage(Utilities) ic_imageDataWithUTType:metadata:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
}

@end