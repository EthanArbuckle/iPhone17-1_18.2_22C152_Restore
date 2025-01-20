@interface UIImage(SafariSharedExtras)
+ (id)safari_dynamicImageWithSize:()SafariSharedExtras generator:;
+ (id)safari_imageWithSVGData:()SafariSharedExtras;
+ (id)safari_imageWithSize:()SafariSharedExtras actions:;
+ (id)safari_imageWithSize:()SafariSharedExtras flipped:actions:;
+ (id)safari_largestSizedBitmapImageOrSVGFromImages:()SafariSharedExtras;
- (BOOL)safari_isSVGImage;
- (BOOL)safari_transparencyAnalysisResultIsNotOpaque;
- (double)safari_computeAverageLuminance;
- (double)safari_longestEdgeInPixels;
- (id)safari_dynamicImageWithSize:()SafariSharedExtras generator:;
- (id)safari_makeGrayscale;
- (id)safari_themeColor;
- (uint64_t)safari_isGrayscale;
- (uint64_t)safari_transparencyAnalysisResult;
- (void)safari_setThemeColor:()SafariSharedExtras;
- (void)safari_setTransparencyAnalysisResult:()SafariSharedExtras;
@end

@implementation UIImage(SafariSharedExtras)

- (uint64_t)safari_transparencyAnalysisResult
{
  v0 = (void *)MEMORY[0x1F4188790]();
  v42[256] = *MEMORY[0x1E4F143B8];
  v1 = objc_getAssociatedObject(v0, &transparencyAnalysisResultKey);
  v2 = v1;
  if (!v1)
  {
    CGImageRepresentation = (CGImage *)_UIImageGetCGImageRepresentation();
    if (!CGImageHasAlpha())
    {
      uint64_t v3 = 1;
      goto LABEL_7;
    }
    *((_DWORD *)&srcFormat.renderingIntent + 1) = 0;
    srcFormat.bitsPerComponent = CGImageGetBitsPerComponent(CGImageRepresentation);
    srcFormat.uint64_t bitsPerPixel = CGImageGetBitsPerPixel(CGImageRepresentation);
    srcFormat.colorSpace = CGImageGetColorSpace(CGImageRepresentation);
    srcFormat.bitmapInfo = CGImageGetBitmapInfo(CGImageRepresentation);
    srcFormat.version = 0;
    srcFormat.decode = CGImageGetDecode(CGImageRepresentation);
    srcFormat.renderingIntent = CGImageGetRenderingIntent(CGImageRepresentation);
    if (MEMORY[0x1AD1153F0](&srcs, &srcFormat, 0, CGImageRepresentation, 0))
    {
      uint64_t v3 = 0;
LABEL_7:
      objc_msgSend(v0, "safari_setTransparencyAnalysisResult:", v3);
      goto LABEL_8;
    }
    data = srcs.data;
    v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F983D8]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke;
    v35[3] = &__block_descriptor_40_e5_v8__0l;
    v35[4] = v7;
    [v8 setHandler:v35];
    *(void *)&destFormat.bitsPerComponent = 0x2000000008;
    destFormat.colorSpace = v7;
    destFormat.bitmapInfo = 3;
    memset(&destFormat.version, 0, 20);
    vImage_Buffer src = srcs;
    if (MEMORY[0x1AD115400](&srcFormat, &destFormat))
    {
      v9 = 0;
      goto LABEL_11;
    }
    v11 = vImageConverter_CreateWithCGImageFormat(&srcFormat, &destFormat, 0, 0, 0);
    uint64_t v3 = (uint64_t)v11;
    if (!v11)
    {
LABEL_43:

      if (data) {
        free(data);
      }
      goto LABEL_7;
    }
    uint64_t bitsPerPixel = destFormat.bitsPerPixel;
    vImagePixelCount width = srcs.width;
    if (srcs.rowBytes == srcs.width * destFormat.bitsPerPixel)
    {
      if (!vImageConverter_MustOperateOutOfPlace(v11, 0, 0, 0))
      {
        v9 = 0;
        goto LABEL_38;
      }
      vImagePixelCount width = srcs.width;
      uint64_t bitsPerPixel = destFormat.bitsPerPixel;
    }
    if (MEMORY[0x1AD1153E0](&src, srcs.height, width, bitsPerPixel, 0))
    {
      v9 = 0;
      goto LABEL_39;
    }
    v9 = src.data;
LABEL_38:
    if (!vImageConvert_AnyToAny((const vImageConverterRef)v3, &srcs, &src, 0, 0))
    {
      vImageConverter_Release((vImageConverterRef)v3);
LABEL_11:
      bzero(v42, 0x800uLL);
      bzero(v41, 0x800uLL);
      bzero(v40, 0x800uLL);
      bzero(v39, 0x800uLL);
      histogram[0] = v42;
      histogram[1] = (vImagePixelCount *)v41;
      histogram[2] = (vImagePixelCount *)v40;
      histogram[3] = (vImagePixelCount *)v39;
      if (!vImageHistogramCalculation_ARGB8888(&src, histogram, 0))
      {
        uint64_t v10 = 0;
        uint64_t v3 = 1;
        while (!*(void *)&v39[v10])
        {
          v10 += 8;
          if (v10 == 2040) {
            goto LABEL_41;
          }
        }
        uint64_t v14 = 0;
        uint64_t v3 = 3;
        while (!*(void *)&v39[v14])
        {
          v14 += 8;
          if (v14 == 1640) {
            goto LABEL_41;
          }
        }
        vImagePixelCount height = src.height;
        vImagePixelCount v15 = src.width;
        if (src.width < 0x11 || src.height < 0x11) {
          goto LABEL_48;
        }
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_2;
        v31[3] = &__block_descriptor_72_e11_B24__0Q8Q16l;
        v31[4] = src.data;
        vImage_Buffer v32 = src;
        v18 = (void *)MEMORY[0x1AD115160](v31);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_3;
        v28[3] = &unk_1E5E43098;
        id v19 = v18;
        id v29 = v19;
        vImagePixelCount v30 = v15 - 1;
        v20 = (unsigned int (**)(void, void))MEMORY[0x1AD115160](v28);
        vImagePixelCount v21 = height - 1;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_4;
        v25[3] = &unk_1E5E43098;
        id v22 = v19;
        id v26 = v22;
        vImagePixelCount v27 = height - 1;
        v23 = (unsigned int (**)(void, void))MEMORY[0x1AD115160](v25);
        if (!v20[2](v20, 0)) {
          goto LABEL_46;
        }
        if (v20[2](v20, v21)
          && v23[2](v23, 0)
          && (((uint64_t (*)(void, vImagePixelCount))v23[2])(v23, v15 - 1) & 1) != 0)
        {
          int v24 = 0;
          uint64_t v3 = 4;
        }
        else
        {
LABEL_46:
          uint64_t v3 = 0;
          int v24 = 1;
        }

        if (v24) {
LABEL_48:
        }
          uint64_t v3 = 2;
        goto LABEL_41;
      }
LABEL_40:
      uint64_t v3 = 0;
LABEL_41:
      if (v9) {
        free(v9);
      }
      goto LABEL_43;
    }
LABEL_39:
    vImageConverter_Release((vImageConverterRef)v3);
    goto LABEL_40;
  }
  uint64_t v3 = [v1 integerValue];
LABEL_8:

  return v3;
}

- (void)safari_setTransparencyAnalysisResult:()SafariSharedExtras
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &transparencyAnalysisResultKey, v2, (void *)1);
}

+ (id)safari_largestSizedBitmapImageOrSVGFromImages:()SafariSharedExtras
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v3;
  v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "size", (void)v23);
        double v14 = v13;
        double v16 = v15;
        int v17 = objc_msgSend(v12, "safari_isSVGImage");
        int v18 = v17;
        if (v7 && ((v17 ^ 1 | v9) & 1) != 0)
        {
          if ((v9 ^ v17)) {
            continue;
          }
          if ((v14 < v4 || v16 <= v5) && (v14 <= v4 || v16 < v5)) {
            continue;
          }
        }
        id v21 = v12;

        double v4 = v14;
        v7 = v21;
        int v9 = v18;
        double v5 = v16;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v7;
}

+ (id)safari_imageWithSize:()SafariSharedExtras actions:
{
  id v3 = objc_msgSend(a1, "safari_imageWithSize:flipped:actions:", 1, a3);
  return v3;
}

+ (id)safari_imageWithSize:()SafariSharedExtras flipped:actions:
{
  id v8 = a6;
  int v9 = [MEMORY[0x1E4F42A60] preferredFormat];
  [v9 setPreferredRange:2];
  [v9 setOpaque:0];
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v9, a1, a2);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__UIImage_SafariSharedExtras__safari_imageWithSize_flipped_actions___block_invoke;
  v14[3] = &unk_1E5E42F70;
  id v11 = v8;
  id v15 = v11;
  v12 = [v10 imageWithActions:v14];

  return v12;
}

+ (id)safari_imageWithSVGData:()SafariSharedExtras
{
  uint64_t v0 = CGSVGDocumentCreateFromData();
  if (v0)
  {
    v1 = [MEMORY[0x1E4F42A80] _imageWithCGSVGDocument:v0];
    CGSVGDocumentRelease();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

+ (id)safari_dynamicImageWithSize:()SafariSharedExtras generator:
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F42A88];
  int v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v9 UUIDString];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__UIImage_SafariSharedExtras__safari_dynamicImageWithSize_generator___block_invoke;
  v16[3] = &unk_1E5E42FC0;
  id v11 = v7;
  id v17 = v11;
  double v18 = a1;
  double v19 = a2;
  v12 = [v8 _dynamicAssetNamed:v10 generator:v16];
  double v13 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  double v14 = [v12 imageWithTraitCollection:v13];

  return v14;
}

- (BOOL)safari_isSVGImage
{
  return [a1 _CGSVGDocument] != 0;
}

- (void)safari_setThemeColor:()SafariSharedExtras
{
}

- (id)safari_themeColor
{
  return objc_getAssociatedObject(a1, (const void *)themeColorKey);
}

- (BOOL)safari_transparencyAnalysisResultIsNotOpaque
{
  return (objc_msgSend(a1, "safari_transparencyAnalysisResult") & 0xFFFFFFFFFFFFFFFDLL) != 1;
}

- (double)safari_longestEdgeInPixels
{
  objc_msgSend(a1, "size", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  if (result <= v2) {
    return v2;
  }
  return result;
}

- (uint64_t)safari_isGrayscale
{
  double v2 = objc_getAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_isGrayscale]::isGrayscaleImageKey);
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    CGImageRepresentation = (CGImage *)_UIImageGetCGImageRepresentation();
    ColorSpace = CGImageGetColorSpace(CGImageRepresentation);
    if (CGColorSpaceGetModel(ColorSpace))
    {
      unint64_t Width = CGImageGetWidth(CGImageRepresentation);
      unint64_t Height = CGImageGetHeight(CGImageRepresentation);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      uint64_t v10 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, DeviceRGB, 1u);
      CGColorSpaceRelease(DeviceRGB);
      v32.size.vImagePixelCount width = (double)Width;
      v32.size.vImagePixelCount height = (double)Height;
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      CGContextDrawImage(v10, v32, CGImageRepresentation);
      Data = (char *)CGBitmapContextGetData(v10);
      unint64_t v12 = Height * Width;
      if ((uint64_t)(4 * Height * Width) < 1)
      {
        unint64_t v14 = 0;
        double v28 = 0.0;
      }
      else
      {
        unint64_t v13 = 0;
        unint64_t v14 = 0;
        double v15 = (double)v12;
        double v16 = (unsigned __int8 *)(Data + 1);
        unint64_t v17 = (unint64_t)&Data[4 * v12];
        do
        {
          double v18 = v16 - 1;
          int v19 = *(v16 - 1);
          int v20 = v16[1];
          unsigned int v21 = v16[2];
          if (v21 > 0x18) {
            ++v13;
          }
          unsigned int v22 = v19 - v20;
          if (v19 - v20 < 0) {
            unsigned int v22 = v20 - v19;
          }
          if (v22 <= 0x18)
          {
            int v24 = *v16;
            int v25 = v20 - v24;
            if (v25 < 0) {
              int v25 = -v25;
            }
            int v26 = v19 - v24;
            if (v26 < 0) {
              int v26 = -v26;
            }
            BOOL v23 = v26 > 0x18;
            if (v25 > 0x18) {
              BOOL v23 = 1;
            }
          }
          else
          {
            BOOL v23 = 1;
          }
          if (v21 >= 0x19 && v23 && (double)++v14 / v15 >= 0.03) {
            break;
          }
          v16 += 4;
        }
        while ((unint64_t)(v18 + 4) < v17);
        double v28 = (double)v13;
      }
      CGContextRelease(v10);
      uint64_t v4 = (double)v14 / v28 < 0.03;
      id v29 = (const void *)-[UIImage(SafariSharedExtras) safari_isGrayscale]::isGrayscaleImageKey;
      vImagePixelCount v30 = [NSNumber numberWithBool:v4];
      objc_setAssociatedObject(a1, v29, v30, (void *)1);
    }
    else
    {
      uint64_t v4 = 1;
    }
  }

  return v4;
}

- (id)safari_makeGrayscale
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v2 = objc_getAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_makeGrayscale]::grayscaleImageKey);
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F1E050] imageWithCGImage:_UIImageGetCGImageRepresentation()];
    uint64_t v10 = *MEMORY[0x1E4F1E4E8];
    v11[0] = &unk_1F0341A60;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    double v5 = [v3 imageByApplyingFilter:@"CIColorControls" withInputParameters:v4];

    id v6 = (void *)MEMORY[0x1E4F982B8];
    id v7 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
    [v3 extent];
    id v8 = objc_msgSend(v6, "imageByAdoptingCGImage:", objc_msgSend(v7, "createCGImage:fromRect:", v5));

    double v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:", objc_msgSend(v8, "CGImage"));
    objc_setAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_makeGrayscale]::grayscaleImageKey, v2, (void *)1);
  }
  return v2;
}

- (double)safari_computeAverageLuminance
{
  double v2 = objc_getAssociatedObject(a1, (const void *)-[UIImage(SafariSharedExtras) safari_computeAverageLuminance]::averageLuminanceKey);
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    CGImageRepresentation = (CGImage *)_UIImageGetCGImageRepresentation();
    double v5 = WBSComputeAverageLuminance(CGImageRepresentation);
    id v7 = objc_msgSend(NSNumber, "numberWithDouble:");
    objc_setAssociatedObject(a1, &-[UIImage(SafariSharedExtras) safari_computeAverageLuminance]::averageLuminanceKey, v7, (void *)1);
  }
  return v5;
}

- (id)safari_dynamicImageWithSize:()SafariSharedExtras generator:
{
  id v8 = a5;
  objc_initWeak(&location, a1);
  int v9 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__UIImage_SafariSharedExtras__safari_dynamicImageWithSize_generator___block_invoke;
  v13[3] = &unk_1E5E42FE8;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v14 = v10;
  id v11 = objc_msgSend(v9, "safari_dynamicImageWithSize:generator:", v13, a2, a3);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

@end