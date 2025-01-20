@interface TSDImageAdjuster
- (CGImage)newFilteredImageForImage:(CGImage *)a3 enhancedImage:(CGImage *)a4;
- (CGImage)p_newImageFromCIImage:(id)a3 underlyingImage:(CGImage *)a4;
- (TSDImageAdjuster)init;
- (TSDImageAdjuster)initWithImageAdjustments:(id)a3;
- (void)dealloc;
@end

@implementation TSDImageAdjuster

- (TSDImageAdjuster)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDImageAdjuster init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageAdjuster.m"), 24, @"The -initWithImageAdjustments is the designated initializer of TSDImageAdjuster.");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"The -initWithImageAdjustments is the designated initializer of TSDImageAdjuster.", "-[TSDImageAdjuster init]"), 0 reason userInfo]);
}

- (TSDImageAdjuster)initWithImageAdjustments:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDImageAdjuster;
  v4 = [(TSDImageAdjuster *)&v6 init];
  if (v4) {
    v4->mImageAdjustments = (TSDImageAdjustments *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageAdjuster;
  [(TSDImageAdjuster *)&v3 dealloc];
}

- (CGImage)newFilteredImageForImage:(CGImage *)a3 enhancedImage:(CGImage *)a4
{
  v99[1] = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  v4 = a3;
  mImageAdjustments = self->mImageAdjustments;
  if (mImageAdjustments)
  {
    int v8 = [(TSDImageAdjustments *)mImageAdjustments enhance];
    BOOL v9 = 0;
    if (a4)
    {
      if (v8)
      {
        BOOL v9 = *a4 != 0;
        if (*a4) {
          v4 = *a4;
        }
      }
    }
    v82 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCGImage:v4];
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v11 = [(TSDImageAdjustments *)self->mImageAdjustments enhance];
    if (!v9 && v11)
    {
      uint64_t v98 = *MEMORY[0x263F008E0];
      v99[0] = MEMORY[0x263EFFA80];
      v12 = objc_msgSend(v82, "autoAdjustmentFiltersWithOptions:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, &v98, 1));
      if (v12) {
        [v10 addObjectsFromArray:v12];
      }
      if (a4 && [v12 count])
      {
        v80 = a4;
        v81 = v4;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v91 objects:v97 count:16];
        uint64_t v14 = (uint64_t)v82;
        if (v13)
        {
          uint64_t v15 = v13;
          uint64_t v16 = *(void *)v92;
          uint64_t v14 = (uint64_t)v82;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v92 != v16) {
                objc_enumerationMutation(v12);
              }
              v18 = *(void **)(*((void *)&v91 + 1) + 8 * i);
              [v18 setValue:v14 forKey:@"inputImage"];
              uint64_t v14 = [v18 valueForKey:@"outputImage"];
            }
            uint64_t v15 = [v12 countByEnumeratingWithState:&v91 objects:v97 count:16];
          }
          while (v15);
        }
        uint64_t v19 = v14;
        v4 = v81;
        *v80 = [(TSDImageAdjuster *)self p_newImageFromCIImage:v19 underlyingImage:v81];
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        uint64_t v20 = [v12 countByEnumeratingWithState:&v87 objects:v96 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v88;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v88 != v22) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v87 + 1) + 8 * j) setValue:0 forKey:@"inputImage"];
            }
            uint64_t v21 = [v12 countByEnumeratingWithState:&v87 objects:v96 count:16];
          }
          while (v21);
        }
      }
    }
    [(TSDImageAdjustments *)self->mImageAdjustments bottomLevel];
    if (v24 != 0.0 || ([(TSDImageAdjustments *)self->mImageAdjustments topLevel], v25 != 1.0))
    {
      v26 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIColorMatrix"];
      [v26 setDefaults];
      [(TSDImageAdjustments *)self->mImageAdjustments bottomLevel];
      double v28 = v27;
      [(TSDImageAdjustments *)self->mImageAdjustments topLevel];
      double v30 = v29 - v28;
      double v31 = 1.0 / v30;
      double v32 = -v28 / v30;
      objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 1.0 / v30, 0.0, 0.0, 0.0), @"inputRVector");
      objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, v31, 0.0, 0.0), @"inputGVector");
      objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, 0.0, v31, 0.0), @"inputBVector");
      objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), @"inputAVector");
      objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:Z:W:", v32, v32, v32, 0.0), @"inputBiasVector");
      [v10 addObject:v26];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments gamma];
    if (v33 != 0.0)
    {
      v34 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIGammaAdjust"];
      [v34 setDefaults];
      v35 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments gamma];
      objc_msgSend(v34, "setValue:forKey:", objc_msgSend(v35, "numberWithDouble:", (double)pow(v36 / 2.5 + 1.0, 3.0)), @"inputPower");
      [v10 addObject:v34];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments saturation];
    if (v37 != 0.0 || ([(TSDImageAdjustments *)self->mImageAdjustments contrast], v38 != 0.0))
    {
      v39 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIColorControls"];
      [v39 setDefaults];
      v40 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments saturation];
      objc_msgSend(v39, "setValue:forKey:", objc_msgSend(v40, "numberWithDouble:", v41 + 1.0), @"inputSaturation");
      v42 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments contrast];
      objc_msgSend(v39, "setValue:forKey:", objc_msgSend(v42, "numberWithDouble:", (double)exp2(v43 + v43)), @"inputContrast");
      [v10 addObject:v39];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments exposure];
    if (v44 != 0.0)
    {
      v45 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIExposureAdjust"];
      [v45 setDefaults];
      v46 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments exposure];
      objc_msgSend(v45, "setValue:forKey:", objc_msgSend(v46, "numberWithDouble:"), @"inputEV");
      [v10 addObject:v45];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments highlights];
    if (v47 != 0.0 || ([(TSDImageAdjustments *)self->mImageAdjustments shadows], v48 != 0.0))
    {
      v49 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIHighlightShadowAdjust"];
      [v49 setDefaults];
      v50 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments highlights];
      objc_msgSend(v49, "setValue:forKey:", objc_msgSend(v50, "numberWithDouble:", (1.0 - v51) * 0.6), @"inputHighlightAmount");
      v52 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments shadows];
      objc_msgSend(v49, "setValue:forKey:", objc_msgSend(v52, "numberWithDouble:", v53 * 0.4), @"inputShadowAmount");
      [v10 addObject:v49];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments sharpness];
    if (v54 != 0.0)
    {
      v55 = (void *)[MEMORY[0x263F00640] filterWithName:@"CIUnsharpMask"];
      [v55 setDefaults];
      v56 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments sharpness];
      objc_msgSend(v55, "setValue:forKey:", objc_msgSend(v56, "numberWithDouble:", v57 * 4.0), @"inputRadius");
      v58 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments sharpness];
      objc_msgSend(v55, "setValue:forKey:", objc_msgSend(v58, "numberWithDouble:", v59 * 0.75), @"inputIntensity");
      [v10 addObject:v55];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments denoise];
    if (v60 != 0.0)
    {
      v61 = (void *)[MEMORY[0x263F00640] filterWithName:@"CINoiseReduction"];
      [v61 setDefaults];
      v62 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments denoise];
      objc_msgSend(v61, "setValue:forKey:", objc_msgSend(v62, "numberWithDouble:", v63 * 0.04), @"inputNoiseLevel");
      v64 = NSNumber;
      [(TSDImageAdjustments *)self->mImageAdjustments denoise];
      objc_msgSend(v61, "setValue:forKey:", objc_msgSend(v64, "numberWithDouble:", v65 * 0.6), @"inputSharpness");
      [v10 addObject:v61];
    }
    [(TSDImageAdjustments *)self->mImageAdjustments temperature];
    if (v66 != 0.0 || ([(TSDImageAdjustments *)self->mImageAdjustments tint], v67 != 0.0))
    {
      v68 = (void *)[MEMORY[0x263F00640] filterWithName:@"CITemperatureAndTint"];
      [v68 setDefaults];
      objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:", 10000.0, 0.0), @"inputNeutral");
      [(TSDImageAdjustments *)self->mImageAdjustments temperature];
      double v70 = v69 * 3500.0 + 10000.0;
      [(TSDImageAdjustments *)self->mImageAdjustments tint];
      objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x263F00680], "vectorWithX:Y:", v70, v71 * 75.0), @"inputTargetNeutral");
      [v10 addObject:v68];
    }
    if ([v10 count])
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      uint64_t v72 = [v10 countByEnumeratingWithState:&v83 objects:v95 count:16];
      uint64_t v73 = (uint64_t)v82;
      if (v72)
      {
        uint64_t v74 = v72;
        uint64_t v75 = *(void *)v84;
        uint64_t v73 = (uint64_t)v82;
        do
        {
          for (uint64_t k = 0; k != v74; ++k)
          {
            if (*(void *)v84 != v75) {
              objc_enumerationMutation(v10);
            }
            v77 = *(void **)(*((void *)&v83 + 1) + 8 * k);
            [v77 setValue:v73 forKey:@"inputImage"];
            uint64_t v73 = [v77 valueForKey:@"outputImage"];
          }
          uint64_t v74 = [v10 countByEnumeratingWithState:&v83 objects:v95 count:16];
        }
        while (v74);
      }

      v78 = [(TSDImageAdjuster *)self p_newImageFromCIImage:v73 underlyingImage:v4];
    }
    else
    {

      return CGImageRetain(v4);
    }
    return v78;
  }

  return CGImageRetain(a3);
}

- (CGImage)p_newImageFromCIImage:(id)a3 underlyingImage:(CGImage *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  size_t Width = CGImageGetWidth(a4);
  CGImageGetHeight(a4);
  char v7 = 3;
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a4);
  if (AlphaInfo - 5 < 2) {
    goto LABEL_4;
  }
  if (AlphaInfo == kCGImageAlphaOnly)
  {
    char v7 = 2;
    goto LABEL_6;
  }
  if (AlphaInfo == kCGImageAlphaNone) {
LABEL_4:
  }
    char v7 = 1;
LABEL_6:
  BOOL v9 = TSDBitmapContextCreate(v7, (double)Width);
  double v10 = TSDRectWithSize();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = (void *)MEMORY[0x263F00628];
  uint64_t v21 = *MEMORY[0x263F00838];
  v22[0] = TSUDeviceRGBColorSpace();
  v18 = (CGImage *)objc_msgSend((id)objc_msgSend(v17, "contextWithOptions:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, &v21, 1)), "createCGImage:fromRect:", a3, v10, v12, v14, v16);
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  CGContextDrawImage(v9, v23, v18);
  CGImageRelease(v18);
  Image = CGBitmapContextCreateImage(v9);
  CGContextRelease(v9);
  return Image;
}

@end