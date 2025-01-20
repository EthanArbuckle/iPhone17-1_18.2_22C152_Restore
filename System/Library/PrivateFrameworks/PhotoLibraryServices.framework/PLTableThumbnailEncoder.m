@interface PLTableThumbnailEncoder
+ (CGImage)_createDownscaledImageFromSource:(CGImageSource *)a3 toSize:(CGSize)a4 cropped:(BOOL)a5;
+ (CGImage)_createDownscaledImageFromSourceImage:(CGImage *)a3 toSize:(CGSize)a4 cropped:(BOOL)a5;
+ (CGImage)createCascadeSeedImageFromSourceImage:(CGImage *)a3 toFormats:(id)a4;
+ (CGSize)smallestSizeThatFitsSourceSize:(CGSize)a3 withinFitFormat:(id)a4 andLargerSquareFormat:(id)a5;
+ (id)_encodeDownscaledImage:(CGImage *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6;
+ (id)encodeThumbnailImage:(CGImage *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6;
+ (id)encodeThumbnailImage:(CGImage *)a3 toFormats:(id)a4 withUUID:(id)a5 error:(id *)a6;
+ (id)encodeThumbnailSource:(CGImageSource *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6;
+ (id)encodeThumbnailSource:(CGImageSource *)a3 toFormats:(id)a4 withUUID:(id)a5 error:(id *)a6;
@end

@implementation PLTableThumbnailEncoder

+ (CGImage)createCascadeSeedImageFromSourceImage:(CGImage *)a3 toFormats:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 && (unint64_t)[v6 count] >= 2)
  {
    v8 = [MEMORY[0x1E4F28BD0] setWithCapacity:5];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "formatMode", (void)v44));
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v11);
    }

    if ([v8 count] != 1
      || ([v9 objectAtIndexedSubscript:0],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v15 size],
          v18 = (CGImage *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, objc_msgSend(v15, "isCropped"), v16, v17), v15, !v18))
    {
      v19 = objc_msgSend(v9, "objectAtIndexedSubscript:", 0, (void)v44);
      if (([v19 isSquare] & 1) == 0)
      {

        goto LABEL_18;
      }
      v20 = [v9 objectAtIndexedSubscript:1];
      char v21 = [v20 isSquare];

      if (v21) {
        goto LABEL_18;
      }
      double Width = (double)CGImageGetWidth(a3);
      double Height = (double)CGImageGetHeight(a3);
      v24 = [v9 objectAtIndexedSubscript:1];
      v25 = [v9 objectAtIndexedSubscript:0];
      objc_msgSend(a1, "smallestSizeThatFitsSourceSize:withinFitFormat:andLargerSquareFormat:", v24, v25, Width, Height);
      double v27 = v26;
      double v29 = v28;

      v18 = (CGImage *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, 0, v27, v29);
      if (!v18)
      {
LABEL_18:
        v30 = [v9 objectAtIndexedSubscript:0];
        char v31 = [v30 isSquare];

        v18 = 0;
        if ((v31 & 1) == 0)
        {
          v32 = [v9 objectAtIndexedSubscript:0];
          v33 = 0;
          v18 = 0;
          if ((unint64_t)[v9 count] >= 2)
          {
            uint64_t v34 = 1;
            while (1)
            {
              v33 = [v9 objectAtIndexedSubscript:v34];
              if ([v33 isSquare]) {
                break;
              }

              if ([v9 count] <= (unint64_t)++v34)
              {
                v33 = 0;
LABEL_27:
                v18 = 0;
                goto LABEL_28;
              }
            }
            if (!v33) {
              goto LABEL_27;
            }
            [v32 size];
            PLSizeFromCGSize();
            CGImageGetWidth(a3);
            CGImageGetHeight(a3);
            PLSizeMake();
            PLCGSizeScaledToFitSize();
            double v36 = v35;
            double v38 = v37;
            [v33 dimension];
            if (v36 < v39) {
              goto LABEL_27;
            }
            [v33 dimension];
            if (v38 < v40) {
              goto LABEL_27;
            }
            [v32 size];
            v18 = (CGImage *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, objc_msgSend(v32, "isCropped"), v42, v43);
          }
LABEL_28:
        }
      }
    }

    goto LABEL_30;
  }
  v18 = 0;
LABEL_30:

  return v18;
}

+ (CGSize)smallestSizeThatFitsSourceSize:(CGSize)a3 withinFitFormat:(id)a4 andLargerSquareFormat:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a4;
  id v11 = a5;
  if (!v10 || [v10 isSquare])
  {
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PLTableThumbnailEncoder.m", 424, @"Invalid parameter not satisfying: %@", @"fitFormat && !fitFormat.isSquare" object file lineNumber description];

    if (v11)
    {
LABEL_4:
      if ([v11 isSquare]) {
        goto LABEL_5;
      }
    }
  }
  else if (v11)
  {
    goto LABEL_4;
  }
  double v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, a1, @"PLTableThumbnailEncoder.m", 425, @"Invalid parameter not satisfying: %@", @"squareFormat && squareFormat.isSquare" object file lineNumber description];

LABEL_5:
  [v11 dimension];
  double v13 = v12;
  [v10 dimension];
  if (v13 < v14)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PLTableThumbnailEncoder.m", 426, @"Invalid parameter not satisfying: %@", @"squareFormat.dimension >= fitFormat.dimension" object file lineNumber description];
  }
  if (width <= 0.0 || height <= 0.0)
  {
    CGFloat v24 = *MEMORY[0x1E4F1DB30];
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [v10 size];
    [v10 size];
    PLSizeMake();
    PLSizeFromCGSize();
    PLCGSizeScaledToFitSize();
    double v16 = v15;
    double v18 = v17;
    [v11 dimension];
    if (height > width) {
      double v20 = v18 * (v19 / v16);
    }
    else {
      double v20 = v19;
    }
    if (height > width) {
      double v21 = v19;
    }
    else {
      double v21 = v16 * (v19 / v18);
    }
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    CGRect v32 = CGRectIntegral(*(CGRect *)(&v20 - 3));
    CGFloat v24 = v32.size.width;
    CGFloat v25 = v32.size.height;
  }

  double v26 = v24;
  double v27 = v25;
  result.double height = v27;
  result.double width = v26;
  return result;
}

+ (id)encodeThumbnailImage:(CGImage *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (!a3 || !v10)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61002 userInfo:0];
    if (v12) {
      goto LABEL_7;
    }
  }
  double v13 = objc_opt_class();
  [v10 size];
  uint64_t v16 = objc_msgSend(v13, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, objc_msgSend(v10, "isCropped"), v14, v15);
  if (!v16)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61001 userInfo:0];
    if (v12) {
      goto LABEL_7;
    }
LABEL_10:
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61004 userInfo:0];
    if (a6) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  double v17 = (CGImage *)v16;
  id v20 = 0;
  double v18 = [a1 _encodeDownscaledImage:v16 toFormat:v10 withUUID:v11 error:&v20];
  id v12 = v20;
  CGImageRelease(v17);
  if (v18) {
    goto LABEL_12;
  }
  if (!v12) {
    goto LABEL_10;
  }
LABEL_7:
  if (a6)
  {
LABEL_8:
    id v12 = v12;
    double v18 = 0;
    *a6 = v12;
    goto LABEL_12;
  }
LABEL_11:
  double v18 = 0;
LABEL_12:

  return v18;
}

+ (id)encodeThumbnailImage:(CGImage *)a3 toFormats:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  double v13 = (CGImage *)[a1 createCascadeSeedImageFromSourceImage:a3 toFormats:v10];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v23 = a6;
    CGFloat v24 = v13;
    id v16 = 0;
    uint64_t v17 = *(void *)v28;
    if (v13) {
      a3 = v13;
    }
    while (2)
    {
      uint64_t v18 = 0;
      double v19 = v16;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
        id v26 = v19;
        double v21 = objc_msgSend(a1, "encodeThumbnailImage:toFormat:withUUID:error:", a3, v20, v11, &v26, v23);
        id v16 = v26;

        if (!v21)
        {

          if (v23)
          {
            id v16 = v16;
            id v12 = 0;
            *uint64_t v23 = v16;
          }
          else
          {
            id v12 = 0;
          }
          goto LABEL_14;
        }
        [v12 addObject:v21];

        ++v18;
        double v19 = v16;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
LABEL_14:
    double v13 = v24;
  }
  CGImageRelease(v13);

  return v12;
}

+ (id)encodeThumbnailSource:(CGImageSource *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (a3 && v10)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61002 userInfo:0];
  }
  double v13 = objc_opt_class();
  [v10 size];
  uint64_t v16 = objc_msgSend(v13, "_createDownscaledImageFromSource:toSize:cropped:", a3, objc_msgSend(v10, "isCropped"), v14, v15);
  if (!v16)
  {
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61001 userInfo:0];

    if (v19) {
      goto LABEL_8;
    }
LABEL_11:
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61004 userInfo:0];
    if (a6) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v17 = (CGImage *)v16;
  id v21 = v12;
  uint64_t v18 = [a1 _encodeDownscaledImage:v16 toFormat:v10 withUUID:v11 error:&v21];
  id v19 = v21;

  CGImageRelease(v17);
  if (v18) {
    goto LABEL_13;
  }
  if (!v19) {
    goto LABEL_11;
  }
LABEL_8:
  if (a6)
  {
LABEL_9:
    id v19 = v19;
    uint64_t v18 = 0;
    *a6 = v19;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v18 = 0;
LABEL_13:

  return v18;
}

+ (id)encodeThumbnailSource:(CGImageSource *)a3 toFormats:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (a3)
  {
    if ([v10 count])
    {
      size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
      uint64_t v20 = *MEMORY[0x1E4F2FF88];
      v21[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, PrimaryImageIndex, v13);
      if (ImageAtIndex)
      {
        double v15 = ImageAtIndex;
        a3 = [a1 encodeThumbnailImage:ImageAtIndex toFormats:v10 withUUID:v11 error:a6];
        CGImageRelease(v15);
      }
      else
      {
        uint64_t v16 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138543362;
          id v19 = a3;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unable to decode full sized image from source: %{public}@", (uint8_t *)&v18, 0xCu);
        }

        a3 = 0;
      }
    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

+ (id)_encodeDownscaledImage:(CGImage *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!a3 || !v9)
  {
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61002 userInfo:0];
    if (v12) {
      goto LABEL_6;
    }
  }
  unint64_t v13 = [v9 thumbnailKind];
  if (v13 < 3)
  {
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61002 userInfo:0];
    if (v12)
    {
LABEL_6:
      double v14 = (void *)v12;
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:v11 code:61001 userInfo:0];

      CFDictionaryRef v16 = 0;
      goto LABEL_25;
    }
    goto LABEL_10;
  }
  if (v13 == 3)
  {
    uint64_t v22 = *MEMORY[0x1E4F2F4F0];
    uint64_t v23 = *MEMORY[0x1E4F2F4E0];
    v49[0] = *MEMORY[0x1E4F2F6C8];
    v49[1] = v23;
    v50[0] = v22;
    v50[1] = &unk_1EEBEE148;
    id v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = v50;
    id v21 = v49;
  }
  else
  {
    if (v13 != 4)
    {
LABEL_10:
      CFDictionaryRef v16 = 0;
      goto LABEL_13;
    }
    uint64_t v17 = *MEMORY[0x1E4F2F520];
    uint64_t v18 = *MEMORY[0x1E4F2F528];
    v51[0] = *MEMORY[0x1E4F2F6C8];
    v51[1] = v18;
    v52[0] = v17;
    v52[1] = &unk_1EEBEE130;
    id v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = v52;
    id v21 = v51;
  }
  CFDictionaryRef v16 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:2];
LABEL_13:
  double Width = (double)CGImageGetWidth(a3);
  CGFloat v25 = off_1E585F000;
  unint64_t v26 = +[PLTableThumbnailEncoderResult _minKtxDataLengthFromImageSize:](PLTableThumbnailEncoderResult, "_minKtxDataLengthFromImageSize:", Width, (double)CGImageGetHeight(a3));
  Mutable = CFDataCreateMutable(0, v26 + 1024);
  CGImageDestinationRef v28 = CGImageDestinationCreateWithData(Mutable, @"org.khronos.ktx", 1uLL, 0);
  if (!v28)
  {
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F8C500];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    long long v44 = @"Can't create destination";
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v15 = [v32 errorWithDomain:v33 code:61003 userInfo:v34];

    CFRelease(Mutable);
    goto LABEL_25;
  }
  long long v29 = v28;
  if ([v9 thumbnailKind] == 4)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(a3, DeviceRGB);
    CGFloat v25 = off_1E585F000;
    CGColorSpaceRelease(DeviceRGB);
    CGImageDestinationAddImage(v29, CopyWithColorSpace, v16);
    CGImageRelease(CopyWithColorSpace);
  }
  else
  {
    CGImageDestinationAddImage(v29, a3, v16);
  }
  if (!CGImageDestinationFinalize(v29))
  {
    double v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F8C500];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    long long v46 = @"Finalize failed";
    double v37 = (void *)MEMORY[0x1E4F1C9E8];
    double v38 = &v46;
    double v39 = &v45;
    goto LABEL_22;
  }
  if (CFDataGetLength(Mutable) < v26)
  {
    double v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F8C500];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48 = @"KTX data too short";
    double v37 = (void *)MEMORY[0x1E4F1C9E8];
    double v38 = &v48;
    double v39 = &v47;
LABEL_22:
    double v40 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
    id v15 = [v35 errorWithDomain:v36 code:61003 userInfo:v40];

    v41 = 0;
    goto LABEL_24;
  }
  v41 = (void *)[objc_alloc(v25[351]) initWithKtxData:Mutable uuid:v10 format:v9];
  id v15 = 0;
LABEL_24:
  CFRelease(v29);
  CFRelease(Mutable);
  if (v41) {
    goto LABEL_30;
  }
LABEL_25:
  if (v15)
  {
    if (a6)
    {
LABEL_27:
      id v15 = v15;
      v41 = 0;
      *a6 = v15;
      goto LABEL_30;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:61004 userInfo:0];
    if (a6) {
      goto LABEL_27;
    }
  }
  v41 = 0;
LABEL_30:

  return v41;
}

+ (CGImage)_createDownscaledImageFromSource:(CGImageSource *)a3 toSize:(CGSize)a4 cropped:(BOOL)a5
{
  v5 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    if (a4.width == *MEMORY[0x1E4F1DB30] && a4.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      return 0;
    }
    else
    {
      BOOL v9 = a5;
      size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
      uint64_t v19 = *MEMORY[0x1E4F2FF88];
      v20[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, PrimaryImageIndex, v12);
      if (ImageAtIndex)
      {
        double v14 = ImageAtIndex;
        v5 = (CGImageSource *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", ImageAtIndex, v9, width, height);
        CGImageRelease(v14);
      }
      else
      {
        id v15 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138543362;
          uint64_t v18 = v5;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unable to decode full sized image from source: %{public}@", (uint8_t *)&v17, 0xCu);
        }

        v5 = 0;
      }
    }
  }
  return v5;
}

+ (CGImage)_createDownscaledImageFromSourceImage:(CGImage *)a3 toSize:(CGSize)a4 cropped:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_createDownscaledImageFromSourceImage_toSize_cropped__s_onceToken != -1) {
    dispatch_once(&_createDownscaledImageFromSourceImage_toSize_cropped__s_onceToken, &__block_literal_global_23182);
  }
  CGImageGetColorSpace(a3);
  int v9 = CGColorSpaceEqualToColorSpace();
  double v10 = (double)CGImageGetWidth(a3);
  double v11 = (double)CGImageGetHeight(a3);
  if (width != v10 || height != v11 || v9 == 0)
  {
    if (v5) {
      CGImageRef SquareCroppedImage = PLThumbnailCreateSquareCroppedImage(a3);
    }
    else {
      CGImageRef SquareCroppedImage = CGImageRetain(a3);
    }
    CFDictionaryRef v16 = SquareCroppedImage;
    if (SquareCroppedImage)
    {
      int v17 = PLSizeMake();
      CGImageGetWidth(v16);
      CGImageGetHeight(v16);
      PLSizeMake();
      PLCGSizeScaledToFitSize();
      v33.size.double width = v18;
      v33.size.double height = v19;
      v33.origin.CGFloat x = 0.0;
      v33.origin.CGFloat y = 0.0;
      CGRect v34 = CGRectIntegral(v33);
      CGFloat x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat v22 = v34.size.width;
      CGFloat v23 = v34.size.height;
      CGFloat v24 = CGBitmapContextCreate(0, (unint64_t)v34.size.width, (unint64_t)v34.size.height, 8uLL, 4 * v17, (CGColorSpaceRef)_createDownscaledImageFromSourceImage_toSize_cropped__s_targetColorSpace, 0x2002u);
      if (v24)
      {
        CGFloat v25 = v24;
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.double width = v22;
        v35.size.double height = v23;
        CGContextDrawImage(v24, v35, v16);
        Image = CGBitmapContextCreateImage(v25);
        CGContextRelease(v25);
      }
      else
      {
        CGImageDestinationRef v28 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v29 = 138543362;
          long long v30 = v16;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Unable to create CGContext to downscale image: %{public}@", (uint8_t *)&v29, 0xCu);
        }

        Image = 0;
      }
      CGImageRelease(v16);
    }
    else
    {
      long long v27 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138543362;
        long long v30 = a3;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Unable to create square-cropped image from full size image: %{public}@", (uint8_t *)&v29, 0xCu);
      }

      return 0;
    }
    return Image;
  }
  else
  {
    return CGImageRetain(a3);
  }
}

CGColorSpaceRef __80__PLTableThumbnailEncoder__createDownscaledImageFromSourceImage_toSize_cropped___block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  _createDownscaledImageFromSourceImage_toSize_cropped__s_targetColorSpace = (uint64_t)result;
  return result;
}

@end