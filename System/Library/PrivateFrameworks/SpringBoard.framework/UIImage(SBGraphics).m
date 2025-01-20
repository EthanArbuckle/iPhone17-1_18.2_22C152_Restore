@interface UIImage(SBGraphics)
- (BOOL)isAnimated;
- (CGImageRef)_newThumbnailWithImageSource:()SBGraphics forMaxPixelDimension:;
- (CGImageSourceRef)_newSource;
- (double)pixelSize;
- (id)_thumbnailFitToSize:()SBGraphics;
- (id)sbg_squareImage;
- (uint64_t)_newThumbnailWithJPEG:()SBGraphics forMaxPixelDimension:;
- (uint64_t)sbs_hasAlpha;
@end

@implementation UIImage(SBGraphics)

- (uint64_t)sbs_hasAlpha
{
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo((CGImageRef)[a1 CGImage]);
  return (AlphaInfo > kCGImageAlphaNoneSkipFirst) | (0x1Eu >> AlphaInfo) & 1;
}

- (double)pixelSize
{
  v1 = (CGImage *)[a1 CGImage];
  if (!v1) {
    return *MEMORY[0x1E4F1DB30];
  }
  v2 = v1;
  double Width = (double)CGImageGetWidth(v1);
  CGImageGetHeight(v2);
  return Width;
}

- (BOOL)isAnimated
{
  v1 = [a1 images];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)sbg_squareImage
{
  [a1 size];
  if (v2 == v3)
  {
    id v4 = a1;
  }
  else
  {
    if (v2 <= v3) {
      CGFloat v5 = v2;
    }
    else {
      CGFloat v5 = v3;
    }
    [a1 scale];
    CGFloat v7 = v6;
    v10.width = v5;
    v10.height = v5;
    UIGraphicsBeginImageContextWithOptions(v10, 0, v7);
    objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    UIGraphicsGetImageFromCurrentImageContext();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v4;
}

- (CGImageSourceRef)_newSource
{
  v1 = (CGImage *)[a1 CGImage];
  if (!v1) {
    return 0;
  }
  CGDataProviderRef DataProvider = CGImageGetDataProvider(v1);
  if (!DataProvider) {
    return 0;
  }
  double v3 = DataProvider;
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  CGImageSourceRef v5 = CGImageSourceCreateWithDataProvider(v3, v4);

  return v5;
}

- (id)_thumbnailFitToSize:()SBGraphics
{
  double v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  double v8 = v7;

  if (a2 >= a3) {
    double v9 = a2;
  }
  else {
    double v9 = a3;
  }
  double v10 = v9 * v8;
  v11 = UIImageJPEGRepresentation(a1, 1.0);
  if (v11
    && (v12 = [(UIImage *)a1 _newThumbnailWithJPEG:v11 forMaxPixelDimension:v10]) != 0|| (uint64_t v13 = [(UIImage *)a1 _newSource]) != 0&& (v14 = (const void *)v13, v12 = [(UIImage *)a1 _newThumbnailWithImageSource:v13 forMaxPixelDimension:v10], CFRelease(v14), v12))
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:scale:orientation:", v12, -[UIImage imageOrientation](a1, "imageOrientation"), v8);
    CFRelease(v12);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGImageRef)_newThumbnailWithImageSource:()SBGraphics forMaxPixelDimension:
{
  if (!a4) {
    return 0;
  }
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  double v7 = [NSNumber numberWithBool:1];
  [v6 setObject:v7 forKey:*MEMORY[0x1E4F2FE28]];

  *(float *)&double v8 = a1;
  double v9 = [NSNumber numberWithFloat:v8];
  [v6 setObject:v9 forKey:*MEMORY[0x1E4F2FF68]];

  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a4, 0, (CFDictionaryRef)v6);
  return ThumbnailAtIndex;
}

- (uint64_t)_newThumbnailWithJPEG:()SBGraphics forMaxPixelDimension:
{
  uint64_t v11 = 0;
  if (!a4) {
    return 0;
  }
  CGImageSourceRef v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  double v7 = (void *)[[v5 alloc] initWithCapacity:1];
  *(float *)&double v8 = a1;
  double v9 = [NSNumber numberWithFloat:v8];
  [v7 setObject:v9 forKey:*MEMORY[0x1E4F2FF68]];

  LODWORD(v9) = MEMORY[0x1D9489520](v6, v7, &v11);
  if (v9) {
    uint64_t v11 = 0;
  }

  return v11;
}

@end