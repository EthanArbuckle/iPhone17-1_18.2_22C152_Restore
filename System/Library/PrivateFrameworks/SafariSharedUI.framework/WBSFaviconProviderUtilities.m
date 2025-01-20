@interface WBSFaviconProviderUtilities
+ (BOOL)isFaviconSize:(CGSize)a3 morePreferrableThanFaviconSize:(CGSize)a4 givenDesiredSize:(CGSize)a5;
+ (CGSize)sizeOfImageWithData:(id)a3 closestToPreferredSize:(CGSize)a4 isMultiResolution:(BOOL *)a5;
+ (id)imageWithURL:(id)a3 closetToPreferredSize:(CGSize)a4;
+ (id)multiResolutionImageFromImageData:(id)a3 withPreferredSize:(CGSize)a4 atScales:(id)a5 didGenerateResolutions:(BOOL *)a6;
+ (int64_t)computeRelativeSize:(CGSize)a3 referenceSize:(CGSize)a4;
@end

@implementation WBSFaviconProviderUtilities

+ (BOOL)isFaviconSize:(CGSize)a3 morePreferrableThanFaviconSize:(CGSize)a4 givenDesiredSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  double v9 = a3.height;
  double v10 = a3.width;
  if (objc_msgSend(a1, "computeRelativeSize:referenceSize:") == 6) {
    return 0;
  }
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v10 == *MEMORY[0x1E4F1DB30] && v9 == v12) {
    return 0;
  }
  if (v8 == *MEMORY[0x1E4F1DB30] && v7 == v12) {
    return 1;
  }
  uint64_t v15 = objc_msgSend(a1, "computeRelativeSize:referenceSize:", v10, v9, width, height);
  uint64_t v16 = objc_msgSend(a1, "computeRelativeSize:referenceSize:", v8, v7, width, height);
  if (v15 > v16) {
    return 1;
  }
  if (v15 < v16) {
    return 0;
  }
  BOOL v18 = v10 <= v8;
  if (v9 <= v7) {
    BOOL v18 = 1;
  }
  BOOL v19 = v10 >= v8;
  if (v9 >= v7) {
    BOOL v19 = 1;
  }
  BOOL v20 = v15 != 5 || v19;
  if (v15 == 4) {
    return v18;
  }
  else {
    return v20;
  }
}

+ (int64_t)computeRelativeSize:(CGSize)a3 referenceSize:(CGSize)a4
{
  if (a3.width == a4.width && a3.height == a4.height) {
    return 6;
  }
  if (a3.width == a4.width + a4.width && a3.height == a4.height + a4.height) {
    return 3;
  }
  if (a3.width == a4.width * 4.0 && a3.height == a4.height * 4.0) {
    return 2;
  }
  if (a3.width == a4.width * 8.0 && a3.height == a4.height * 8.0) {
    return 1;
  }
  if (a3.width < a4.width && a3.height < a4.height) {
    return 5;
  }
  if (a3.height <= a4.height || a3.width <= a4.width) {
    return 0;
  }
  else {
    return 4;
  }
}

+ (CGSize)sizeOfImageWithData:(id)a3 closestToPreferredSize:(CGSize)a4 isMultiResolution:(BOOL *)a5
{
  double height = a4.height;
  double width = a4.width;
  CFDataRef v9 = (const __CFData *)a3;
  CFDataRef v10 = v9;
  if (a5) {
    *a5 = 0;
  }
  v11 = (double *)MEMORY[0x1E4F1DB30];
  double v13 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (!v9)
  {
    double v18 = *MEMORY[0x1E4F1DB30];
    double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_17;
  }
  v14 = CGImageSourceCreateWithData(v9, 0);
  int Count = CGImageSourceGetCount(v14);
  if (Count < 1)
  {
    double v18 = v13;
    double v19 = v12;
    if (!a5) {
      goto LABEL_15;
    }
  }
  else
  {
    for (int i = 0; i != Count; ++i)
    {
      double v18 = sizeOfImageAtIndex(v14, i);
      double v19 = v17;
      BOOL v20 = v13 == *v11 && v12 == v11[1];
      if (!v20
        && !objc_msgSend(a1, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v18, v17, v13, v12, width, height))
      {
        double v18 = v13;
        double v19 = v12;
      }
      double v12 = v19;
      double v13 = v18;
    }
    if (!a5) {
      goto LABEL_15;
    }
  }
  *a5 = Count > 1;
LABEL_15:
  CFRelease(v14);
LABEL_17:

  double v21 = v18;
  double v22 = v19;
  result.double height = v22;
  result.double width = v21;
  return result;
}

+ (id)multiResolutionImageFromImageData:(id)a3 withPreferredSize:(CGSize)a4 atScales:(id)a5 didGenerateResolutions:(BOOL *)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  CFDataRef v10 = (const __CFData *)a3;
  id v11 = a5;
  double v12 = v11;
  if (a6) {
    *a6 = 0;
  }
  if (!v10) {
    goto LABEL_24;
  }
  if (![v11 count])
  {
LABEL_26:
    CFDataRef v30 = v10;
    CFDataRef v10 = 0;
    goto LABEL_27;
  }
  double v13 = CGImageSourceCreateWithData(v10, 0);
  size_t Count = CGImageSourceGetCount(v13);
  if (Count != 1)
  {
    if (!Count) {
      goto LABEL_25;
    }
    CFRelease(v13);
LABEL_24:
    CFDataRef v30 = 0;
    goto LABEL_27;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
  if (!ImageAtIndex)
  {
LABEL_25:
    CFRelease(v13);
    goto LABEL_26;
  }
  uint64_t v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC10]);
  cf = v13;
  Mutable = CFDataCreateMutable(0, 0);
  double v18 = [(id)*MEMORY[0x1E4F443F8] identifier];
  double v19 = CGImageDestinationCreateWithData(Mutable, v18, [v12 count], 0);
  v32 = Mutable;
  v34 = a6;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v35 = v12;
  id v20 = v12;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        unsigned int v25 = objc_msgSend(v24, "unsignedIntValue", v32, cf);
        double v26 = height * (double)[v24 unsignedIntValue];
        v27 = CGBitmapContextCreate(0, (unint64_t)(width * (double)v25), (unint64_t)v26, 8uLL, (int)vcvtd_n_s64_f64(width * (double)v25, 2uLL), v16, 1u);
        v28 = v27;
        if (v27)
        {
          CGContextSetInterpolationQuality(v27, kCGInterpolationHigh);
          v43.origin.x = 0.0;
          v43.origin.y = 0.0;
          v43.size.double width = width * (double)v25;
          v43.size.double height = v26;
          CGContextDrawImage(v28, v43, ImageAtIndex);
          Image = CGBitmapContextCreateImage(v28);
          if (Image)
          {
            CGImageDestinationAddImage(v19, Image, 0);
            CFRelease(Image);
          }
          CFRelease(v28);
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v21);
  }

  double v12 = v35;
  CGImageDestinationFinalize(v19);
  CGColorSpaceRelease(v16);
  CFRelease(v19);
  CFRelease(ImageAtIndex);
  CFRelease(cf);
  if (v34) {
    BOOL *v34 = 1;
  }
  CFDataRef v30 = v10;
  CFDataRef v10 = v32;
LABEL_27:

  return v10;
}

+ (id)imageWithURL:(id)a3 closetToPreferredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CFURLRef v7 = (const __CFURL *)a3;
  double v8 = (double *)MEMORY[0x1E4F1DB30];
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v11 = CGImageSourceCreateWithURL(v7, 0);
  if (!v11) {
    goto LABEL_15;
  }
  int v12 = 0;
  int v13 = 0;
  while (v12 < (int)CGImageSourceGetCount(v11))
  {
    double v15 = sizeOfImageAtIndex(v11, v12);
    double v16 = v14;
    if (v9 == *v8 && v10 == v8[1])
    {
      int v13 = v12;
    }
    else if (objc_msgSend(a1, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v15, v14, v9, v10, width, height))
    {
      int v13 = v12;
    }
    else
    {
      double v15 = v9;
      double v16 = v10;
    }
    ++v12;
    double v9 = v15;
    double v10 = v16;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, v13, 0);
  CFRelease(v11);
  if (ImageAtIndex)
  {
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:ImageAtIndex];
    CFRelease(ImageAtIndex);
  }
  else
  {
LABEL_15:
    double v19 = 0;
  }

  return v19;
}

@end