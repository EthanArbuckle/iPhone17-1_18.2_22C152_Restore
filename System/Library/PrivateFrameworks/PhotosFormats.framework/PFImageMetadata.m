@interface PFImageMetadata
+ (BOOL)enumerateImageSourceIndexesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)imageSourceIsSpatial:(CGImageSource *)a3;
+ (BOOL)metadataTypeRequiresImageSource:(unsigned __int8)a3;
+ (BOOL)queryImagePropertiesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)readMetadataType:(unsigned __int8)a3 fromCGImageProperties:(id)a4 value:(id *)a5 error:(id *)a6;
+ (BOOL)readMetadataType:(unsigned __int8)a3 fromFileURL:(id)a4 value:(id *)a5 error:(id *)a6;
+ (BOOL)readMetadataValueFromImageAtFileURL:(id)a3 dictionaryKey:(const void *)a4 key:(const void *)a5 value:(id *)a6 error:(id *)a7;
+ (BOOL)writeMetadataType:(unsigned __int8)a3 value:(id)a4 toCGImageProperties:(id)a5 error:(id *)a6;
+ (CGImage)createImageRefFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (CGImage)createImageRefFromAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (__CVBuffer)createPixelBufferFromAuxiliaryImageInfo:(id)a3;
+ (id)auxiliaryImageIdentifiersToPreserveForDerivatives;
+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4;
+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromPrimaryImageInImageSource:(CGImageSource *)a3;
+ (id)auxiliaryImagesToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4;
+ (id)cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (id)cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (id)imagePropertiesByRemovingKey:(const void *)a3 dictionaryKey:(const void *)a4 fromImageProperties:(id)a5;
+ (id)transformAuxiliaryImages:(id)a3 scaleFactor:(double)a4 applyingOrientation:(unsigned int)a5;
+ (id)valueFromCGImageProperties:(id)a3 dictionaryKey:(const void *)a4 key:(const void *)a5;
@end

@implementation PFImageMetadata

+ (BOOL)imageSourceIsSpatial:(CGImageSource *)a3
{
  v3 = [[PFMetadata alloc] initWithImageSource:a3 contentType:0 options:13 timeZoneLookup:0 cacheImageSource:1];
  BOOL v4 = [(PFMetadata *)v3 isSpatialMedia];

  return v4;
}

+ (CGImage)createImageRefFromAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  v5 = [a1 cIImageFromPixelBuffer:a3 applyingOrientation:*(void *)&a4 scaleFactor:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1E018] context];
    [v5 extent];
    v7 = (CGImage *)objc_msgSend(v6, "createCGImage:fromRect:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = [a1 createPixelBufferFromAuxiliaryImageInfo:a3];
  if (v8)
  {
    v9 = (__CVBuffer *)v8;
    v10 = [a1 cIImageFromPixelBuffer:v8 applyingOrientation:v6 scaleFactor:a5];
    CVPixelBufferRelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (__CVBuffer)createPixelBufferFromAuxiliaryImageInfo:(id)a3
{
  CVPixelBufferRef v16 = 0;
  uint64_t v3 = *MEMORY[0x1E4F2F378];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];

  size_t v6 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2F538]), "unsignedLongValue");
  size_t v7 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FDD8]), "unsignedLongValue");
  size_t v8 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FB48]), "unsignedLongValue");
  LODWORD(v5) = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FCE0]), "unsignedIntValue");
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];

  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v11 = v9;
  v12 = (void *)[v11 bytes];
  id v13 = v11;
  CVPixelBufferCreateWithBytes(v10, v7, v8, (OSType)v5, v12, v6, (CVPixelBufferReleaseBytesCallback)_AuxiliaryImageCVPixelBufferReleaseBytesCallback, v13, 0, &v16);
  v14 = v16;

  return v14;
}

+ (id)cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    size_t v7 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:");
    size_t v8 = [v7 imageByApplyingCGOrientation:v6];

    if (vabdd_f64(1.0, a5) > 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v11, a5, a5);
      uint64_t v9 = [v8 imageByApplyingTransform:&v11];

      size_t v8 = (void *)v9;
    }
  }
  else
  {
    size_t v8 = 0;
  }

  return v8;
}

+ (CGImage)createImageRefFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  v5 = [a1 cIImageFromAuxiliaryImageInfo:a3 applyingOrientation:*(void *)&a4 scaleFactor:a5];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1E018] context];
    [v5 extent];
    size_t v7 = (CGImage *)objc_msgSend(v6, "createCGImage:fromRect:", v5);
  }
  else
  {
    size_t v7 = 0;
  }

  return v7;
}

+ (id)transformAuxiliaryImages:(id)a3 scaleFactor:(double)a4 applyingOrientation:(unsigned int)a5
{
  return +[PFMediaUtilities transformAuxiliaryImages:a3 scaleFactor:*(void *)&a5 applyingOrientation:a4];
}

+ (id)auxiliaryImageIdentifiersToPreserveForDerivatives
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2F3C0];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend(a1, "auxiliaryImagesToPreserveForDerivativesFromImageSource:imageIndex:");
  if ([v6 count])
  {
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
    size_t v8 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
    uint64_t v9 = v8;
    if (v8) {
      int v10 = [v8 intValue];
    }
    else {
      int v10 = 1;
    }
    v12 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    [v12 doubleValue];
    uint64_t v14 = v13;
    v15 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    [v15 doubleValue];
    uint64_t v17 = v16;

    v18 = [MEMORY[0x1E4F1CA48] array];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__PFImageMetadata_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke;
    v20[3] = &unk_1E5B2D700;
    int v24 = v10;
    uint64_t v22 = v14;
    uint64_t v23 = v17;
    id v11 = v18;
    id v21 = v11;
    [v6 enumerateKeysAndObjectsUsingBlock:v20];
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

void __91__PFImageMetadata_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setAuxiliaryImageInfo:v5];

  [v7 setIdentifier:v6];
  [v7 setSourceImageOrientation:*(unsigned int *)(a1 + 56)];
  objc_msgSend(v7, "setSourceImageSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [*(id *)(a1 + 32) addObject:v7];
}

+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromPrimaryImageInImageSource:(CGImageSource *)a3
{
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);

  return (id)[a1 auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:a3 imageIndex:PrimaryImageIndex];
}

+ (id)auxiliaryImagesToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(a1, "auxiliaryImageIdentifiersToPreserveForDerivatives", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v12 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * i);
          CFDictionaryRef v13 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a3, a4, v12);
          if (v13)
          {
            if (!v9)
            {
              uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
            }
            [v9 setObject:v13 forKeyedSubscript:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)enumerateImageSourceIndexesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a3;
  uint64_t v8 = (void (**)(id, const void *, uint64_t, unsigned char *))a5;
  uint64_t v9 = CGImageSourceCreateWithURL(v7, 0);
  if (!v9)
  {
    BOOL v12 = 0;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v10 = v9;
  size_t Count = CGImageSourceGetCount(v9);
  BOOL v12 = Count != 0;
  char v19 = 0;
  if (Count)
  {
    size_t v13 = Count;
    unint64_t v14 = 1;
    do
    {
      v8[2](v8, v10, v14 - 1, &v19);
      if (v14 >= v13) {
        break;
      }
      ++v14;
    }
    while (!v19);
  }
  CFRelease(v10);
  if (a4)
  {
LABEL_9:
    if (!v12)
    {
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28228];
      long long v16 = [NSString stringWithFormat:@"Unable to access input media through URL %@", v7];
      v21[0] = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a4 = [v15 errorWithDomain:@"com.apple.PhotosFormats" code:1 userInfo:v17];
    }
  }
LABEL_11:

  return v12;
}

+ (BOOL)queryImagePropertiesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v22 = *MEMORY[0x1E4F2FF08];
  v23[0] = MEMORY[0x1E4F1CC28];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PFImageMetadata_queryImagePropertiesOfFileAtURL_error_block___block_invoke;
  v14[3] = &unk_1E5B2D6A8;
  id v11 = v10;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  long long v17 = &v18;
  [a1 enumerateImageSourceIndexesOfFileAtURL:v8 error:a4 block:v14];
  LOBYTE(a4) = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return (char)a4;
}

void __63__PFImageMetadata_queryImagePropertiesOfFileAtURL_error_block___block_invoke(uint64_t a1, CGImageSourceRef isrc, size_t index, unsigned char *a4)
{
  CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(isrc, index, *(CFDictionaryRef *)(a1 + 32));
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    CFRelease(v7);
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

+ (BOOL)writeMetadataType:(unsigned __int8)a3 value:(id)a4 toCGImageProperties:(id)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if ([a1 metadataTypeRequiresImageSource:v8])
  {
    if (a6)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28228];
      size_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is only available when using URL-based methods", v8);
      v31[0] = v13;
      unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a6 = [v12 errorWithDomain:@"com.apple.PhotosFormats" code:3 userInfo:v14];

LABEL_16:
      BOOL v20 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v15 = convertTypeToKey(v8, 0);
      if (v15)
      {
        size_t v13 = (void *)v15;
        if (v10)
        {
          uint64_t v16 = *MEMORY[0x1E4F2FC20];
          long long v17 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            id v18 = (id)[v17 mutableCopy];
          }
          else {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          v25 = v18;
          [v11 setObject:v18 forKeyedSubscript:v16];
          [v25 setObject:v10 forKeyedSubscript:v13];

          BOOL v20 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        if (a6)
        {
          char v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *MEMORY[0x1E4F28228];
          uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is invalid for the media type %s", v8, "image");
          v27 = v22;
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          *a6 = [v21 errorWithDomain:@"com.apple.PhotosFormats" code:0 userInfo:v23];
        }
        size_t v13 = 0;
      }
      goto LABEL_16;
    }
    if (a6)
    {
      char v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28228];
      v29 = @"Invalid nil input properties";
      size_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      [v19 errorWithDomain:@"com.apple.PhotosFormats" code:2 userInfo:v13];
      BOOL v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

+ (BOOL)metadataTypeRequiresImageSource:(unsigned __int8)a3
{
  return a3 == 18;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromCGImageProperties:(id)a4 value:(id *)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (![a1 metadataTypeRequiresImageSource:v8])
  {
    if (v10)
    {
      uint64_t v14 = convertTypeToKey(v8, 0);
      if (!v14)
      {
        if (a6)
        {
          long long v17 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = *MEMORY[0x1E4F28228];
          id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is invalid for the media type %s", v8, "image");
          uint64_t v22 = v18;
          char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          *a6 = [v17 errorWithDomain:@"com.apple.PhotosFormats" code:0 userInfo:v19];
        }
        id v12 = 0;
        goto LABEL_13;
      }
      id v12 = (void *)v14;
      *a5 = [a1 valueFromCGImageProperties:v10 dictionaryKey:*MEMORY[0x1E4F2FC20] key:v14];
      BOOL v15 = 1;
    }
    else
    {
      if (!a6) {
        goto LABEL_9;
      }
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      int v24 = @"Invalid nil input properties";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v16 errorWithDomain:@"com.apple.PhotosFormats" code:2 userInfo:v12];
      BOOL v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (a6)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is only available when using URL-based methods", v8);
    v26[0] = v12;
    size_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a6 = [v11 errorWithDomain:@"com.apple.PhotosFormats" code:3 userInfo:v13];

LABEL_13:
    BOOL v15 = 0;
    goto LABEL_14;
  }
LABEL_9:
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromFileURL:(id)a4 value:(id *)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = convertTypeToKey(v8, 0);
  if (v11)
  {
    if ([a1 metadataTypeRequiresImageSource:v8])
    {
      *a5 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__PFImageMetadata_readMetadataType_fromFileURL_value_error___block_invoke;
      v16[3] = &unk_1E5B2D680;
      char v19 = v8;
      id v17 = v11;
      id v18 = a5;
      LOBYTE(a6) = [a1 enumerateImageSourceIndexesOfFileAtURL:v10 error:a6 block:v16];
    }
    else
    {
      LOBYTE(a6) = [a1 readMetadataValueFromImageAtFileURL:v10 dictionaryKey:*MEMORY[0x1E4F2FC20] key:v11 value:a5 error:a6];
    }
  }
  else if (a6)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    size_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is invalid for the media type %s", v8, "image");
    v21[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a6 = [v12 errorWithDomain:@"com.apple.PhotosFormats" code:0 userInfo:v14];

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

CFDictionaryRef __60__PFImageMetadata_readMetadataType_fromFileURL_value_error___block_invoke(CFDictionaryRef result, CGImageSourceRef isrc, size_t index, unsigned char *a4)
{
  if (*((unsigned char *)result + 48) == 18)
  {
    CFDictionaryRef v5 = result;
    result = CGImageSourceCopyAuxiliaryDataInfoAtIndex(isrc, index, *((CFStringRef *)result + 4));
    if (result)
    {
      result = result;
      **((void **)v5 + 5) = result;
      *a4 = 1;
    }
  }
  return result;
}

+ (id)imagePropertiesByRemovingKey:(const void *)a3 dictionaryKey:(const void *)a4 fromImageProperties:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  id v9 = v7;
  if (a4)
  {
    id v10 = [v7 objectForKey:a4];
    id v9 = v8;
    if (v10)
    {
      objc_opt_class();
      id v9 = v8;
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 objectForKey:a3];
        id v9 = v8;
        if (v11)
        {
          id v9 = (void *)[v8 mutableCopy];
          id v12 = (void *)[v10 mutableCopy];
          [v12 removeObjectForKey:a3];
          [v9 setObject:v12 forKey:a4];
        }
      }
    }
  }

  return v9;
}

+ (BOOL)readMetadataValueFromImageAtFileURL:(id)a3 dictionaryKey:(const void *)a4 key:(const void *)a5 value:(id *)a6 error:(id *)a7
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PFImageMetadata_readMetadataValueFromImageAtFileURL_dictionaryKey_key_value_error___block_invoke;
  v8[3] = &__block_descriptor_64_e22_v16__0__NSDictionary_8l;
  v8[4] = a6;
  v8[5] = a1;
  v8[6] = a4;
  v8[7] = a5;
  return [a1 queryImagePropertiesOfFileAtURL:a3 error:a7 block:v8];
}

id __85__PFImageMetadata_readMetadataValueFromImageAtFileURL_dictionaryKey_key_value_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 40) valueFromCGImageProperties:a2 dictionaryKey:*(void *)(a1 + 48) key:*(void *)(a1 + 56)];
  **(void **)(a1 + 32) = result;
  return result;
}

+ (id)valueFromCGImageProperties:(id)a3 dictionaryKey:(const void *)a4 key:(const void *)a5
{
  CFDictionaryRef Value = 0;
  if (a3 && a4)
  {
    if (a5)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a3, a4);
      if (Value)
      {
        CFDictionaryRef v8 = Value;
        CFTypeID v9 = CFGetTypeID(Value);
        if (v9 == CFDictionaryGetTypeID())
        {
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v8, a5);
          if (Value) {
            CFDictionaryRef Value = Value;
          }
        }
        else
        {
          CFDictionaryRef Value = 0;
        }
      }
    }
    uint64_t v5 = vars8;
  }
  return Value;
}

@end