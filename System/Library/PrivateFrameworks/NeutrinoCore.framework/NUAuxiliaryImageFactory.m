@interface NUAuxiliaryImageFactory
+ (id)auxiliaryImageFromCoreGraphicsInfoDictionary:(id)a3 forCGAuxiliaryImageTypeString:(id)a4 error:(id *)a5;
+ (id)auxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5 metadata:(CGImageMetadata *)a6;
+ (id)auxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5 originalProperties:(id)a6 error:(id *)a7;
@end

@implementation NUAuxiliaryImageFactory

+ (id)auxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5 originalProperties:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (a4 == 2)
  {
    v15 = [v13 auxiliaryImage:a7];

    if (v15)
    {
      v16 = [v15 auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:a3 error:a7];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend(a1, "auxiliaryImageWithPixelBuffer:auxiliaryImageType:identifier:metadata:", a3, a4, v12, objc_msgSend(v13, "auxiliaryDataInfoMetadata"));
    v17 = [v14 colorSpace];
    [v16 setColorSpace:v17];

    uint64_t v18 = [v14 compatibilityMetadata];
    [v16 setCompatibilityMetadata:v18];
  }

  return v16;
}

+ (id)auxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5 metadata:(CGImageMetadata *)a6
{
  id v9 = a5;
  v10 = [[NUAuxiliaryImageRawBuffer alloc] initWithPixelBuffer:a3 auxiliaryImageType:a4 identifier:v9];

  [(NUAuxiliaryImageRawBuffer *)v10 setMetadata:a6];

  return v10;
}

+ (id)auxiliaryImageFromCoreGraphicsInfoDictionary:(id)a3 forCGAuxiliaryImageTypeString:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:*MEMORY[0x1E4F2F3B8]])
  {
    v10 = [MEMORY[0x1E4F164F8] depthDataFromDictionaryRepresentation:v8 error:a5];
    if (v10)
    {
      v11 = [[NUAuxiliaryImageAVDepthData alloc] initAuxiliaryImageFromAVDepthData:v10];
LABEL_13:
      id v12 = v11;
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F2F3D0]])
  {
    v10 = [MEMORY[0x1E4F16668] portraitEffectsMatteFromDictionaryRepresentation:v8 error:a5];
    if (v10)
    {
      v11 = [[NUAuxiliaryImageAVPortraitEffectsMatte alloc] initAuxiliaryImageFromAVPortraitEffectMatte:v10];
      goto LABEL_13;
    }
LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  if (([v9 isEqualToString:*MEMORY[0x1E4F2F3E8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F2F3F8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F2F3E0]] & 1) != 0
    || [v9 isEqualToString:*MEMORY[0x1E4F2F3D8]])
  {
    v10 = [MEMORY[0x1E4F166B0] semanticSegmentationMatteFromImageSourceAuxiliaryDataType:v9 dictionaryRepresentation:v8 error:a5];
    if (v10)
    {
      v11 = [[NUAuxiliaryImageAVSemanticSegmentationMatte alloc] initAuxiliaryImageFromAVSemanticSegmentationMatte:v10];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F2F3F0]])
  {
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F378]];
    v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2F538]];
    size_t v15 = [v14 unsignedLongValue];

    v16 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FDD8]];
    size_t v17 = [v16 unsignedLongValue];

    uint64_t v18 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FB48]];
    size_t v19 = [v18 unsignedLongValue];

    v20 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE0]];
    OSType v21 = [v20 unsignedIntValue];

    CVPixelBufferRef pixelBuffer = 0;
    v22 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];
    CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v24 = v22;
    v25 = (void *)[v24 bytes];
    CFDictionaryRef v26 = (CFDictionaryRef)v24;
    CVPixelBufferCreateWithBytes(v23, v17, v19, v21, v25, v15, (CVPixelBufferReleaseBytesCallback)_NUAuxiliaryImageCVPixelBufferReleaseBytesCallback, v26, 0, &pixelBuffer);
    v27 = pixelBuffer;
    CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F24A00];
    v29 = +[NUColorSpace genericGrayColorSpace];
    CVBufferSetAttachment(v27, v28, (CFTypeRef)[v29 CGColorSpace], kCVAttachmentMode_ShouldPropagate);

    v30 = [NUAuxiliaryImageRawBuffer alloc];
    id v12 = [(NUAuxiliaryImageRawBuffer *)v30 initWithPixelBuffer:pixelBuffer auxiliaryImageType:9 identifier:v9];
    v31 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
    [(NUAuxiliaryImageRawBuffer *)v12 setMetadata:v31];
    goto LABEL_39;
  }
  uint64_t v32 = *MEMORY[0x1E4F2F3C0];
  char v33 = [v9 isEqualToString:*MEMORY[0x1E4F2F3C0]];
  v34 = (void *)MEMORY[0x1E4F2F3C8];
  if ((v33 & 1) != 0 || [v9 isEqualToString:*MEMORY[0x1E4F2F3C8]])
  {
    CVPixelBufferRef pixelBuffer = 0;
    if (!ImageIOLibraryCore_14948()
      || !getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc()
      || (getkCGImageAuxiliaryDataInfoPixelBuffer(),
          [v8 objectForKeyedSubscript:v35],
          (CVPixelBufferRef pixelBuffer = (CVPixelBufferRef)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F378]];
      v36 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2F538]];
      size_t v72 = [v36 unsignedLongValue];

      v37 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FDD8]];
      size_t v71 = [v37 unsignedLongValue];

      v38 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FB48]];
      size_t v39 = [v38 unsignedLongValue];

      v40 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE0]];
      OSType v41 = [v40 unsignedIntValue];

      v42 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];
      CFAllocatorRef v43 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      id v44 = v42;
      v45 = (void *)[v44 bytes];
      CFDictionaryRef v26 = (CFDictionaryRef)v44;
      CVPixelBufferCreateWithBytes(v43, v71, v39, v41, v45, v72, (CVPixelBufferReleaseBytesCallback)_NUAuxiliaryImageCVPixelBufferReleaseBytesCallback, v26, 0, &pixelBuffer);
      if (!pixelBuffer)
      {
        +[NUError failureError:@"Failed to create pixel buffer from auxiliary info" object:v8];
        id v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }

      v34 = (void *)MEMORY[0x1E4F2F3C8];
    }
    v10 = +[NUColorSpace linearGrayColorSpace];
    if ([v9 isEqualToString:v32]
      && !+[NUGlobalSettings forceMeteorPlusLinear])
    {
      uint64_t v46 = +[NUColorSpace genericGrayGamma2_2ColorSpace];

      v10 = (void *)v46;
    }
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    CFDictionaryRef v26 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
    v48 = [(__CFDictionary *)v26 objectForKeyedSubscript:*MEMORY[0x1E4F24EB0]];
    char v49 = [v48 BOOLValue];

    v50 = [(__CFDictionary *)v26 objectForKeyedSubscript:*MEMORY[0x1E4F24EB8]];
    int v51 = [v50 BOOLValue];

    if ((v49 & 1) != 0 || v51) {
      CVBufferRemoveAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24A00]);
    }
    else {
      CVBufferSetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24A00], (CFTypeRef)[v10 CGColorSpace], kCVAttachmentMode_ShouldPropagate);
    }
    v52 = [NUAuxiliaryImageRawBuffer alloc];
    id v12 = [(NUAuxiliaryImageRawBuffer *)v52 initWithPixelBuffer:pixelBuffer auxiliaryImageType:7 identifier:v9];
    v53 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
    [(NUAuxiliaryImageRawBuffer *)v12 setMetadata:v53];

    v54 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F368]];

    if (v54)
    {
      v55 = [[NUColorSpace alloc] initWithCGColorSpace:v54];
      [(NUAuxiliaryImageRawBuffer *)v12 setColorSpace:v55];
    }
    if (![v9 isEqualToString:*v34])
    {
LABEL_40:
      CVPixelBufferRelease(pixelBuffer);
LABEL_41:

      goto LABEL_15;
    }
    v31 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F388]];
    [(NUAuxiliaryImageRawBuffer *)v12 setCompatibilityMetadata:v31];
LABEL_39:

    goto LABEL_40;
  }
  if (([v9 isEqualToString:@"tag:apple.com,2023:photo:aux:linearthumbnail"] & 1) != 0
    || [v9 isEqualToString:@"tag:apple.com,2023:photo:aux:styledeltamap"])
  {
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F378]];
    v56 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2F538]];
    size_t v57 = [v56 unsignedLongValue];

    v58 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FDD8]];
    size_t v59 = [v58 unsignedLongValue];

    v60 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FB48]];
    size_t v61 = [v60 unsignedLongValue];

    v62 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE0]];
    OSType v63 = [v62 unsignedIntValue];

    CVPixelBufferRef pixelBuffer = 0;
    v64 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];
    CFAllocatorRef v65 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v66 = v64;
    v67 = (void *)[v66 bytes];
    id v68 = v66;
    CVPixelBufferCreateWithBytes(v65, v59, v61, v63, v67, v57, (CVPixelBufferReleaseBytesCallback)_NUAuxiliaryImageCVPixelBufferReleaseBytesCallback, v68, 0, &pixelBuffer);
    if ([v9 isEqualToString:@"tag:apple.com,2023:photo:aux:styledeltamap"]) {
      uint64_t v69 = 11;
    }
    else {
      uint64_t v69 = 10;
    }
    v70 = [NUAuxiliaryImageRawBuffer alloc];
    id v12 = [(NUAuxiliaryImageRawBuffer *)v70 initWithPixelBuffer:pixelBuffer auxiliaryImageType:v69 identifier:v9];
    CVPixelBufferRelease(pixelBuffer);

    goto LABEL_15;
  }
  +[NUError errorWithCode:7 reason:@"Unable to convert auxiliary data to NUAuxiliaryImage" object:a1 underlyingError:*a5];
  id v12 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v12;
}

@end