@interface MRImageUtilities
+ (CGSize)imageDimensionsForImageData:(id)a3 error:(id *)a4;
+ (CGSize)sizeFromSource:(CGImageSource *)a3 error:(id *)a4;
+ (id)resizeImageData:(id)a3 forFittingSize:(CGSize)a4 error:(id *)a5;
+ (int64_t)subsampleFactorForMaxPixelSize:(int64_t)a3 imageSize:(CGSize)a4;
@end

@implementation MRImageUtilities

+ (id)resizeImageData:(id)a3 forFittingSize:(CGSize)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = _MRLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRImageUtilities] resizeImageData", buf, 2u);
  }

  id v33 = 0;
  +[MRImageUtilities imageDimensionsForImageData:v6 error:&v33];
  double v9 = v8;
  double v11 = v10;
  id v12 = v33;
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    double v16 = v15;
    double v18 = v17;
    CFDataRef v19 = (const __CFData *)v6;
    uint64_t v20 = *MEMORY[0x1E4F2FF08];
    uint64_t v37 = *MEMORY[0x1E4F2FF08];
    uint64_t v21 = MEMORY[0x1E4F1CC28];
    v38[0] = MEMORY[0x1E4F1CC28];
    v22 = CGImageSourceCreateWithData(v19, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1]);
    if (v16 <= v18) {
      double v23 = v18;
    }
    else {
      double v23 = v16;
    }
    uint64_t v24 = (uint64_t)v23;
    int64_t v25 = +[MRImageUtilities subsampleFactorForMaxPixelSize:imageSize:](MRImageUtilities, "subsampleFactorForMaxPixelSize:imageSize:", (uint64_t)v23, v9, v11);
    v36[0] = v21;
    uint64_t v26 = *MEMORY[0x1E4F2FF58];
    v35[0] = v20;
    v35[1] = v26;
    v27 = [NSNumber numberWithInteger:v25];
    v36[1] = v27;
    v35[2] = *MEMORY[0x1E4F2F428];
    v28 = [NSNumber numberWithInteger:v24];
    v35[3] = *MEMORY[0x1E4F2F430];
    v36[2] = v28;
    v36[3] = &unk_1EE66F4B8;
    CFDictionaryRef v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

    v30 = (__CFData *)objc_opt_new();
    v31 = CGImageDestinationCreateWithData(v30, @"public.jpeg", 1uLL, v29);
    CGImageDestinationAddImageFromSource(v31, v22, 0, v29);
    CGImageDestinationFinalize(v31);
    CFRelease(v22);
    CFRelease(v31);
    if (v30 && [(__CFData *)v30 length])
    {
      v14 = v30;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MRImageUtilitiesError", 3, @"Could not produce resized image data for source data.");
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (CGSize)imageDimensionsForImageData:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4F2FF08];
  v15[0] = MEMORY[0x1E4F1CC28];
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  CFDataRef v6 = (const __CFData *)a3;
  CGImageSourceRef v7 = CGImageSourceCreateWithData(v6, (CFDictionaryRef)[v5 dictionaryWithObjects:v15 forKeys:&v14 count:1]);

  if (v7)
  {
    +[MRImageUtilities sizeFromSource:v7 error:a4];
    double v9 = v8;
    double v11 = v10;
    CFRelease(v7);
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MRImageUtilitiesError", 1, @"Provided data did not produce valid image source.");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v9 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)sizeFromSource:(CGImageSource *)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4F2FF08];
  v15[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1]);
  CFDataRef v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  uint64_t v7 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
  double v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MRImageUtilitiesError", 2, @"Could not decode image to obtain dimensions.");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v10 = (double)[v6 integerValue];
    double v11 = (double)[v8 integerValue];
  }

  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (int64_t)subsampleFactorForMaxPixelSize:(int64_t)a3 imageSize:(CGSize)a4
{
  if (a4.width <= a4.height) {
    a4.width = a4.height;
  }
  return vcvtmd_s64_f64(a4.width / (double)a3);
}

@end