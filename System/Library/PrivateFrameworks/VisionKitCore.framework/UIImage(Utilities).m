@interface UIImage(Utilities)
+ (double)vk_aspectFitImageFrameForViewWithFrame:()Utilities imageSize:;
+ (id)vk_UIImageFromCIImage:()Utilities;
+ (id)vk_fileIconForURL:()Utilities withPreferredSize:;
+ (id)vk_imageNamed:()Utilities withTint:;
+ (id)vk_imageNamed:()Utilities withTint:size:;
+ (id)vk_imageWithCIImage:()Utilities;
+ (id)vk_imageWithCVPixelBuffer:()Utilities;
+ (id)vk_imageWithColor:()Utilities size:;
+ (id)vk_imageWithContentsOfURL:()Utilities;
+ (id)vk_orientationMetadataFromImageOrientation:()Utilities;
+ (id)vk_orientedImageFromCGImage:()Utilities scale:transform:;
+ (id)vk_orientedImageFromImage:()Utilities fromOrientation:;
+ (id)vk_orientedImageFromImage:()Utilities toOrientation:;
+ (uint64_t)vk_imageWithCGImage:()Utilities scale:orientation:;
+ (uint64_t)vk_imageWithData:()Utilities;
+ (uint64_t)vk_symbolImageWithName:()Utilities;
- (id)vk_HEICDataWithCompressionQuality:()Utilities orientation:;
- (id)vk_JPEGDataWithOrientation:()Utilities;
- (id)vk_PNGData;
- (id)vk_PNGDataWithOrientation:()Utilities;
- (id)vk_decodeInBackground;
- (id)vk_imageDataWithRequirements:()Utilities;
- (id)vk_imageDataWithUTType:()Utilities;
- (id)vk_imageDataWithUTType:()Utilities metadata:;
- (id)vk_imageFromSubrect:()Utilities;
- (id)vk_imageView;
- (id)vk_imageWithTint:()Utilities size:;
- (id)vk_scaledImageWithSize:()Utilities scale:;
- (uint64_t)vk_HEICData;
- (uint64_t)vk_HEICDataLossless;
- (uint64_t)vk_HEICDataWithCompressionQuality:()Utilities;
- (uint64_t)vk_JPEGData;
- (uint64_t)vk_cgImage;
- (uint64_t)vk_cgImageGeneratingIfNecessary;
- (uint64_t)vk_cgImagePropertyOrientation;
- (uint64_t)vk_horizontallyMirroredImage;
- (uint64_t)vk_scaledImageMaxDimension:()Utilities scale:;
- (uint64_t)vk_scaledImageMinDimension:()Utilities scale:;
- (void)vk_cgImageGeneratingIfNecessary;
- (void)vk_cropRectZeroAlpha;
- (void)vk_decodeWithCompletion:()Utilities;
- (void)vk_imageDataWithRequirements:()Utilities completion:;
@end

@implementation UIImage(Utilities)

+ (id)vk_imageWithContentsOfURL:()Utilities
{
  v3 = (objc_class *)MEMORY[0x1E4F42A80];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 path];

  v7 = (void *)[v5 initWithContentsOfFile:v6];
  return v7;
}

+ (id)vk_imageNamed:()Utilities withTint:
{
  id v5 = (void *)MEMORY[0x1E4F42A80];
  id v6 = a4;
  v7 = [v5 imageNamed:a3];
  [v7 size];
  v8 = objc_msgSend(v7, "vk_imageWithTint:size:", v6);

  return v8;
}

+ (id)vk_imageNamed:()Utilities withTint:size:
{
  v9 = (void *)MEMORY[0x1E4F42A80];
  id v10 = a6;
  v11 = [v9 imageNamed:a5];
  v12 = objc_msgSend(v11, "vk_imageWithTint:size:", v10, a1, a2);

  return v12;
}

- (id)vk_imageWithTint:()Utilities size:
{
  id v8 = a5;
  v9 = [MEMORY[0x1E4F42A60] defaultFormat];
  id v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 scale];
  objc_msgSend(v9, "setScale:");

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v9, a2, a3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__UIImage_Utilities__vk_imageWithTint_size___block_invoke;
  v15[3] = &unk_1E6BF4310;
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

- (id)vk_imageView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42AA0]);
  [a1 size];
  v3 = (void *)[v2 initWithFrame:VKMRectWithSize()];
  [v3 setImage:a1];
  return v3;
}

- (uint64_t)vk_scaledImageMinDimension:()Utilities scale:
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
  return objc_msgSend(a1, "vk_scaledImageWithSize:scale:", v10, v11, a3);
}

- (uint64_t)vk_scaledImageMaxDimension:()Utilities scale:
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
  return objc_msgSend(a1, "vk_scaledImageWithSize:scale:", v10, v11, a3);
}

- (id)vk_scaledImageWithSize:()Utilities scale:
{
  double v8 = [a1 imageRendererFormat];
  [v8 setScale:a4];
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v8, a2, a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__UIImage_Utilities__vk_scaledImageWithSize_scale___block_invoke;
  v12[3] = &unk_1E6BF4338;
  v12[4] = a1;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  double v10 = [v9 imageWithActions:v12];

  return v10;
}

+ (uint64_t)vk_symbolImageWithName:()Utilities
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "_systemImageNamed:");
}

- (id)vk_imageFromSubrect:()Utilities
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
  id v15 = a1;
  if ([v15 CGImage])
  {
    id v16 = (CGImage *)objc_msgSend(v15, "vk_cgImage");
    v26.origin.x = a2;
    v26.origin.y = a3;
    v26.size.width = a4;
    v26.size.height = a5;
    uint64_t v17 = CGImageCreateWithImageInRect(v16, v26);
    double v18 = (void *)MEMORY[0x1E4F42A80];
    [v15 scale];
    uint64_t v20 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v19);
    CGImageRelease(v17);
  }
  else
  {
    uint64_t v21 = [v15 CIImage];

    if (v21)
    {
      double v22 = [v15 CIImage];
      double v23 = objc_msgSend(v22, "imageByCroppingToRect:", a2, a3, a4, a5);
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCIImage:v23];
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  return v20;
}

+ (id)vk_UIImageFromCIImage:()Utilities
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
  double v10 = [MEMORY[0x1E4F42A80] imageWithCIImage:v3];

  objc_msgSend(v10, "drawInRect:", v8, v9, v5, v7);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)vk_orientedImageFromCGImage:()Utilities scale:transform:
{
  CGFloat v8 = *MEMORY[0x1E4F1DAD8];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double Width = (double)CGImageGetWidth(image);
  double Height = (double)CGImageGetHeight(image);
  long long v12 = a5[1];
  *(_OWORD *)&v25.a = *a5;
  *(_OWORD *)&v25.c = v12;
  *(_OWORD *)&v25.tdouble x = a5[2];
  CGFloat v13 = v8;
  *(CGFloat *)&long long v12 = v9;
  double v14 = Width;
  double v15 = Height;
  CGRect v27 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &v25);
  double x = v27.origin.x;
  double y = v27.origin.y;
  double v18 = VKMCreateRGBABitmapContext(0, v27.size.width, v27.size.height, a4);
  if (!v18) {
    goto LABEL_4;
  }
  double v19 = v18;
  CGContextTranslateCTM(v18, -x, -y);
  long long v20 = a5[1];
  *(_OWORD *)&v25.a = *a5;
  *(_OWORD *)&v25.c = v20;
  *(_OWORD *)&v25.tdouble x = a5[2];
  CGContextConcatCTM(v19, &v25);
  v28.origin.double x = v8;
  v28.origin.double y = v9;
  v28.size.width = Width;
  v28.size.height = Height;
  CGContextDrawImage(v19, v28, image);
  uint64_t v21 = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  if (!v21
    || (objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:scale:orientation:", v21, 0, a4),
        double v22 = objc_claimAutoreleasedReturnValue(),
        CGImageRelease(v21),
        !v22))
  {
LABEL_4:
    double v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[UIImage(Utilities) vk_orientedImageFromCGImage:scale:transform:](v23);
    }

    double v22 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", image);
  }
  return v22;
}

+ (id)vk_orientedImageFromImage:()Utilities fromOrientation:
{
  uint64_t v5 = objc_msgSend(a3, "vk_cgImage");
  memset(&v10, 0, sizeof(v10));
  vk_transformToImageOrientation(a4, (uint64_t)&v10);
  CGAffineTransform v8 = v10;
  CGAffineTransformInvert(&v9, &v8);
  CGAffineTransform v10 = v9;
  CGFloat v6 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_orientedImageFromCGImage:scale:transform:", v5, &v9, 1.0);
  return v6;
}

+ (id)vk_orientedImageFromImage:()Utilities toOrientation:
{
  uint64_t v5 = objc_msgSend(a3, "vk_cgImage");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  vk_transformFromImageOrientation(a4, (uint64_t)&v9);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  CGFloat v6 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_orientedImageFromCGImage:scale:transform:", v5, v8, 1.0);
  return v6;
}

+ (id)vk_imageWithCIImage:()Utilities
{
  id v3 = (objc_class *)MEMORY[0x1E4F42A80];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithCIImage:v4];

  return v5;
}

- (uint64_t)vk_cgImage
{
  id v1 = a1;
  return [v1 CGImage];
}

- (uint64_t)vk_cgImageGeneratingIfNecessary
{
  uint64_t v2 = objc_msgSend(a1, "vk_cgImage");
  if (!v2)
  {
    uint64_t v3 = objc_msgSend(a1, "vk_ciImage");
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
      [v4 extent];
      CGFloat v6 = (const void *)objc_msgSend(v5, "createCGImage:fromRect:", v4);
      if (v6)
      {
        uint64_t v2 = (uint64_t)v6;
        CFAutorelease(v6);

        return v2;
      }
    }
    double v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(UIImage(Utilities) *)(uint64_t)a1 vk_cgImageGeneratingIfNecessary];
    }

    return 0;
  }
  return v2;
}

+ (uint64_t)vk_imageWithCGImage:()Utilities scale:orientation:
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:");
}

+ (id)vk_imageWithCVPixelBuffer:()Utilities
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:");
  uint64_t v3 = [a1 imageWithCIImage:v2];

  return v3;
}

+ (uint64_t)vk_imageWithData:()Utilities
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "imageWithData:");
}

- (uint64_t)vk_horizontallyMirroredImage
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v3 = objc_msgSend(a1, "vk_cgImage");
  [a1 scale];
  return objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v3, 4);
}

- (uint64_t)vk_cgImagePropertyOrientation
{
  uint64_t v1 = objc_msgSend(a1, "vk_imageOrientation");
  return vk_cgImagePropertyOrientationFromVKOrientation(v1);
}

+ (id)vk_orientationMetadataFromImageOrientation:()Utilities
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = dword_1DB33ED98[a3 - 1];
  }
  double v7 = @"Orientation";
  id v4 = [NSNumber numberWithInt:v3];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (uint64_t)vk_JPEGData
{
  uint64_t v2 = objc_msgSend(a1, "vk_imageOrientation");
  return objc_msgSend(a1, "vk_JPEGDataWithOrientation:", v2);
}

- (id)vk_JPEGDataWithOrientation:()Utilities
{
  uint64_t v5 = [(id)*MEMORY[0x1E4F44410] identifier];
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", a3);
  double v7 = objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v5, v6);

  return v7;
}

- (id)vk_PNGData
{
  uint64_t v2 = [(id)*MEMORY[0x1E4F44460] identifier];
  uint64_t v3 = objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v2, 0);

  return v3;
}

- (id)vk_PNGDataWithOrientation:()Utilities
{
  uint64_t v5 = [(id)*MEMORY[0x1E4F44460] identifier];
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", a3);
  double v7 = objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v5, v6);

  return v7;
}

- (uint64_t)vk_HEICDataWithCompressionQuality:()Utilities
{
  uint64_t v4 = objc_msgSend(a1, "vk_imageOrientation");
  return objc_msgSend(a1, "vk_HEICDataWithCompressionQuality:orientation:", v4, a2);
}

- (id)vk_HEICDataWithCompressionQuality:()Utilities orientation:
{
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", a4);
  double v7 = (void *)[v6 mutableCopy];

  CGAffineTransform v8 = [NSNumber numberWithDouble:a2];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2F430]];

  long long v9 = [(id)*MEMORY[0x1E4F443E0] identifier];
  long long v10 = objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v9, v7);

  return v10;
}

- (uint64_t)vk_HEICData
{
  return objc_msgSend(a1, "vk_HEICDataWithCompressionQuality:", 0.7);
}

- (uint64_t)vk_HEICDataLossless
{
  return objc_msgSend(a1, "vk_HEICDataWithCompressionQuality:", 1.0);
}

- (id)vk_imageDataWithUTType:()Utilities
{
  id v4 = a3;
  uint64_t v5 = [(id)*MEMORY[0x1E4F44410] identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    double v7 = objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "vk_imageOrientation"));
  }
  else
  {
    double v7 = 0;
  }
  CGAffineTransform v8 = objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v4, v7);

  return v8;
}

- (id)vk_imageDataWithUTType:()Utilities metadata:
{
  id v6 = a4;
  id v7 = a3;
  CGAffineTransform v8 = vk_dataFromCGImage((CGImage *)objc_msgSend(a1, "vk_cgImage"), v7, v6);

  return v8;
}

- (id)vk_imageDataWithRequirements:()Utilities
{
  id v4 = a3;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__24;
  long long v12 = __Block_byref_object_dispose__24;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__UIImage_Utilities__vk_imageDataWithRequirements___block_invoke;
  v7[3] = &unk_1E6BF4360;
  v7[4] = &v8;
  objc_msgSend(a1, "vk_imageDataWithRequirements:completion:", v4, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)vk_imageDataWithRequirements:()Utilities completion:
{
  v35[6] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v33 = a4;
  id v6 = [v34 uti];
  id v7 = [(id)*MEMORY[0x1E4F443E0] identifier];
  if (![v6 isEqual:v7])
  {
    uint64_t v8 = [v34 uti];
    long long v9 = [(id)*MEMORY[0x1E4F44410] identifier];
    if (([v8 isEqual:v9] & 1) == 0)
    {
      v30 = [v34 uti];
      v31 = [(id)*MEMORY[0x1E4F44460] identifier];
      char v32 = [v30 isEqual:v31];

      if ((v32 & 1) == 0) {
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "validUTI", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, @"UTI should be HEIC, JPEG, or PNG.");
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (![v34 maxLength]) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.maxLength > 0", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, @"The max length requirement should be greater than zero.");
  }
  if (![v34 minLength]) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.minLength > 0", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, @"The min length requirement should be greater than zero.");
  }
  if (![v34 maxDataLength]) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.maxDataLength > 0", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, @"The max data length requirement should be greater than zero.");
  }
  unint64_t v10 = [v34 maxLength];
  if (v10 <= [v34 minLength]) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.maxLength > requirements.minLength", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, @"The max length requirement should not be less than the min length requirement.");
  }
  long long v11 = (CGImage *)objc_msgSend(a1, "vk_cgImage");
  long long v12 = objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "vk_imageOrientation"));
  id v13 = (void *)[v12 mutableCopy];

  double Width = (double)CGImageGetWidth(v11);
  double Height = (double)CGImageGetHeight(v11);
  v35[0] = VKMClampSizeToMaxLength(Width, Height, (double)(unint64_t)[v34 maxLength]);
  v35[1] = v16;
  v35[2] = VKMClampSizeToMaxLength(Width, Height, (double)(unint64_t)([v34 maxLength] - objc_msgSend(v34, "minLength")) * 0.5+ (double)(unint64_t)objc_msgSend(v34, "minLength"));
  v35[3] = v17;
  uint64_t v18 = 0;
  v35[4] = VKMClampSizeToMaxLength(Width, Height, (double)(unint64_t)[v34 minLength]);
  v35[5] = v19;
  uint64_t v20 = *MEMORY[0x1E4F2F430];
  do
  {
    uint64_t v21 = (double *)&v35[2 * v18];
    double v22 = *v21;
    double v23 = v21[1];
    ResizedCGImage = vk_createResizedCGImage(v11, (unint64_t)*v21, (unint64_t)v23);
    uint64_t v25 = 0;
    while (1)
    {
      CGRect v26 = [NSNumber numberWithDouble:*(double *)&qword_1DB33ED80[v25]];
      [v13 setObject:v26 forKeyedSubscript:v20];

      CGRect v27 = [v34 uti];
      CGRect v28 = vk_dataFromCGImage(ResizedCGImage, v27, v13);

      unint64_t v29 = [v28 length];
      if (v29 <= [v34 maxDataLength]) {
        break;
      }

      if (++v25 == 3)
      {
        CGImageRelease(ResizedCGImage);
        goto LABEL_19;
      }
    }
    CGImageRelease(ResizedCGImage);
    double Height = v23;
    double Width = v22;
    if (v28) {
      goto LABEL_21;
    }
LABEL_19:
    ++v18;
  }
  while (v18 != 3);
  CGRect v28 = 0;
  double v22 = Width;
  double v23 = Height;
LABEL_21:
  v33[2](v33, v28, v22, v23);
}

+ (id)vk_fileIconForURL:()Utilities withPreferredSize:
{
  if (!a5)
  {
    long long v9 = 0;
    goto LABEL_33;
  }
  id v7 = [MEMORY[0x1E4F22430] documentProxyForURL:a5 isContentManaged:0 sourceAuditToken:0];
  uint64_t v8 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v7 format:3];
  long long v9 = v8;
  if (!v8 || ([v8 size], v10 < a1) || (objc_msgSend(v9, "size"), v11 < a2))
  {
    long long v12 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v7 format:6];
    if (v12)
    {
      id v13 = v12;
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
  v24 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v7 format:4];
  uint64_t v25 = v24;
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
      v35 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v7 format:7];
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

- (void)vk_decodeWithCompletion:()Utilities
{
  uint64_t v4 = vk_decodeWithCompletion__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&vk_decodeWithCompletion__onceToken, &__block_literal_global_42);
  }
  id v6 = (void *)[v5 copy];

  id v7 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __46__UIImage_Utilities__vk_decodeWithCompletion___block_invoke_2;
  id v13 = &unk_1E6BF1308;
  uint64_t v14 = a1;
  id v15 = v6;
  id v8 = v6;
  long long v9 = [v7 blockOperationWithBlock:&v10];
  objc_msgSend((id)vk_decodeWithCompletion__drawingDecodingOperationQueue, "addOperation:", v9, v10, v11, v12, v13, v14);
}

- (id)vk_decodeInBackground
{
  uint64_t v2 = [a1 imageRendererFormat];
  [a1 scale];
  objc_msgSend(v2, "setScale:");
  id v3 = objc_alloc(MEMORY[0x1E4F42A58]);
  [a1 size];
  uint64_t v4 = objc_msgSend(v3, "initWithSize:format:", v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__UIImage_Utilities__vk_decodeInBackground__block_invoke;
  v7[3] = &unk_1E6BF3228;
  v7[4] = a1;
  id v5 = [v4 imageWithActions:v7];

  return v5;
}

+ (id)vk_imageWithColor:()Utilities size:
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

+ (double)vk_aspectFitImageFrameForViewWithFrame:()Utilities imageSize:
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

- (void)vk_cropRectZeroAlpha
{
  uint64_t v2 = (CGImage *)objc_msgSend(a1, "vk_cgImage");
  id v3 = vk_newARGB8BitmapContextFromImage(v2);
  if (v3)
  {
    uint64_t v4 = v3;
    size_t Width = CGImageGetWidth(v2);
    size_t Height = CGImageGetHeight(v2);
    v21.size.height = (double)Height;
    v21.origin.double x = 0.0;
    v21.origin.double y = 0.0;
    v21.size.width = (double)Width;
    CGContextDrawImage(v4, v21, v2);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v4);
    if (Data)
    {
      if (Height)
      {
        size_t v8 = 0;
        size_t v9 = 0;
        size_t v10 = 0;
        size_t v11 = Height;
        size_t v12 = Width;
        do
        {
          if (Width)
          {
            size_t v13 = 0;
            float v14 = Data;
            do
            {
              int v16 = *v14;
              v14 += 4;
              int v15 = v16;
              if (v12 >= v13) {
                size_t v17 = v13;
              }
              else {
                size_t v17 = v12;
              }
              if (v10 <= v13) {
                size_t v18 = v13;
              }
              else {
                size_t v18 = v10;
              }
              if (v11 >= v8) {
                size_t v19 = v8;
              }
              else {
                size_t v19 = v11;
              }
              if (v9 <= v8) {
                size_t v20 = v8;
              }
              else {
                size_t v20 = v9;
              }
              if (v15)
              {
                size_t v12 = v17;
                size_t v11 = v19;
                size_t v10 = v18;
                size_t v9 = v20;
              }
              ++v13;
            }
            while (Width != v13);
            Data += 4 * Width;
          }
          ++v8;
        }
        while (v8 != Height);
      }
      CGContextRelease(v4);
      [a1 scale];
    }
    else
    {
      CGContextRelease(v4);
    }
  }
}

+ (void)vk_orientedImageFromCGImage:()Utilities scale:transform:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", v1, 2u);
}

- (void)vk_cgImageGeneratingIfNecessary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error creating CGImage from image: %@", (uint8_t *)&v2, 0xCu);
}

@end