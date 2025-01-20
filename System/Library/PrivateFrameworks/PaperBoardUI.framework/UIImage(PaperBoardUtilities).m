@interface UIImage(PaperBoardUtilities)
+ (id)pbui_thumbnailImageForImage:()PaperBoardUtilities;
- (CGImage)pbui_colorSpace;
- (id)pbui_resizedImageForCurrentMagnifyMode;
- (uint64_t)pbui_CGImageBackedImageWithMaximumBitsPerComponent:()PaperBoardUtilities;
- (uint64_t)pbui_EXIFOrientation;
- (uint64_t)pbui_cropImageWithRect:()PaperBoardUtilities outputSize:;
- (uint64_t)pbui_scaleImage:()PaperBoardUtilities;
@end

@implementation UIImage(PaperBoardUtilities)

+ (id)pbui_thumbnailImageForImage:()PaperBoardUtilities
{
  id v3 = a3;
  [v3 scale];
  double v5 = v4;
  uint64_t v6 = [v3 size];
  v8 = 0;
  if (v9 > 0.0 && v7 > 0.0)
  {
    v10 = (void *)MEMORY[0x1C1872330](v6);
    v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [v11 scale];
    double v13 = v12;

    v14 = [MEMORY[0x1E4F42D90] mainScreen];
    [v14 _referenceBounds];
    double v16 = v15;
    double v18 = v17;

    double v19 = v13 * v16;
    double v20 = v13 * v18;
    +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForCurrentDevice];
    UIRectCenteredIntegralRect();
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGAffineTransformMakeScale(&v30, v13, v13);
    CGAffineTransformInvert(&v31, &v30);
    v33.origin.x = v22;
    v33.origin.y = v24;
    v33.size.width = v26;
    v33.size.height = v28;
    CGRect v34 = CGRectApplyAffineTransform(v33, &v31);
    v8 = objc_msgSend(v3, "pbui_cropImageWithRect:outputSize:preservingAspectRatio:", 0, v34.origin.x, v34.origin.y, v34.size.width, v34.size.height, v13 / v5 * 206.0 / v13, v13 / v5 * round(v20 * (206.0 / v19)) / v13);
  }

  return v8;
}

- (uint64_t)pbui_CGImageBackedImageWithMaximumBitsPerComponent:()PaperBoardUtilities
{
  return objc_msgSend(a1, "pui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", a3, 0);
}

- (uint64_t)pbui_cropImageWithRect:()PaperBoardUtilities outputSize:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:canUseIOSurface:", 1);
}

- (uint64_t)pbui_scaleImage:()PaperBoardUtilities
{
  return objc_msgSend(a1, "pui_scaleImage:canUseIOSurface:", 1);
}

- (CGImage)pbui_colorSpace
{
  result = (CGImage *)[a1 CGImage];
  if (result)
  {
    return CGImageGetColorSpace(result);
  }
  return result;
}

- (id)pbui_resizedImageForCurrentMagnifyMode
{
  v2 = +[PBUIMagnifyMode currentMagnifyMode];
  [v2 zoomFactor];
  *(float *)&double v3 = fabsf(*(float *)&v3 + -1.0);
  if (v2) {
    BOOL v4 = *(float *)&v3 < 2.2204e-16;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v11 = a1;
  }
  else
  {
    objc_msgSend(v2, "zoomFactor", v3);
    CGFloat v6 = 1.0 / v5;
    [a1 size];
    double v8 = v7;
    double v10 = v9;
    CGAffineTransformMakeScale(&v14, v6, v6);
    objc_msgSend(a1, "pui_resizeImageToSize:", v10 * v14.c + v14.a * v8, v10 * v14.d + v14.b * v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v12 = v11;

  return v12;
}

- (uint64_t)pbui_EXIFOrientation
{
  uint64_t v1 = [a1 imageOrientation];
  return MEMORY[0x1F4102E50](v1);
}

@end