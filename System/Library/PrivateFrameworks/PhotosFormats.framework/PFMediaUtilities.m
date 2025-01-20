@interface PFMediaUtilities
+ (BOOL)audioChannelLayoutIsCinematicVideoRender:(const AudioChannelLayout *)a3;
+ (BOOL)canGenerateImageDerivativesFromType:(id)a3;
+ (BOOL)canLoadAssetAsRawForInteractiveEditingWithImageProperties:(id)a3;
+ (BOOL)embeddedJPEGSuitableForDerivativesInImageOfType:(id)a3 url:(id)a4 imageProperties:(id)a5;
+ (BOOL)embeddedJPEGSuitableForDerivativesInRawImageSource:(CGImageSource *)a3 enforcePixelCountLimits:(BOOL)a4 timeZoneLookup:(id)a5;
+ (BOOL)enumerateImageSourceIndexesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5;
+ (BOOL)insertTimeRange:(id *)a3 ofAsset:(id)a4 atTime:(id *)a5 intoMutableComposition:(id)a6 error:(id *)a7;
+ (BOOL)isValidAVFileForURL:(id)a3;
+ (BOOL)isValidImageFileForURL:(id)a3;
+ (BOOL)typeRequiresRasterizationDPI:(id)a3;
+ (CGImage)copyCGImageFromImageGenerator:(id)a3 atTime:(id *)a4 actualTime:(id *)a5 error:(id *)a6;
+ (CGImage)createImageRefFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (CGImage)createImageRefFromAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (CGSize)maximumImageSizeFromProperties:(id)a3;
+ (__CVBuffer)_createPixelBufferFromAuxiliaryImageInfo:(id)a3;
+ (__CVBuffer)createPixelBufferFromAuxiliaryImageInfo:(id)a3;
+ (double)gainMapHeadroomForHDRGain:(double)a3 gainMapValue:(double)a4;
+ (id)_cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (id)_cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (id)_debugDescriptionForAssetURL:(id)a3;
+ (id)_debugDescriptionForAssetVariants:(id)a3;
+ (id)associatedTracksOfTypeForTrack:(id)a3 trackAssociationType:(id)a4;
+ (id)auxiliaryImageIdentifiersToPreserveForDerivatives;
+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4;
+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromPrimaryImageInImageSource:(CGImageSource *)a3;
+ (id)auxiliaryImagesToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4;
+ (id)cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (id)cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5;
+ (id)channelLayoutNameForAudioTrackFormatDescription:(opaqueCMFormatDescription *)a3;
+ (id)debugDescriptionForAssetOrPlayerItemTracks:(id)a3 asset:(id)a4 duration:(id *)a5;
+ (id)debugDescriptionForPlayerItem:(id)a3;
+ (id)dictionaryRepresentationForAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 metadata:(CGImageMetadata *)a4 colorSpace:(CGColorSpace *)a5 compatibilityMetadata:(CGImageMetadata *)a6;
+ (id)errorForExportSession:(id)a3;
+ (id)formatDebugDescriptionForAudioTrack:(id)a3;
+ (id)formatDebugDescriptionForMetadataTrack:(id)a3;
+ (id)formatDebugDescriptionForVideoTrack:(id)a3;
+ (id)formattedCameraModelFromCameraModel:(id)a3 cameraMake:(id)a4;
+ (id)hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:(id)a3 metadata:(id)a4 error:(id *)a5;
+ (id)hevcProfileInformationForVideoTrackFormatDescription:(opaqueCMFormatDescription *)a3;
+ (id)imagePropertiesFromImageSource:(CGImageSource *)a3;
+ (id)imagePropertiesFromImageSource:(CGImageSource *)a3 atIndex:(unint64_t)a4;
+ (id)mainVideoTrackForAsset:(id)a3;
+ (id)metadataForFormat:(id)a3 forAsset:(id)a4;
+ (id)metadataForFormat:(id)a3 forAssetTrack:(id)a4;
+ (id)outOfBandHintsForURL:(id)a3;
+ (id)outOfBandHintsForVideoAsset:(id)a3;
+ (id)protectedTemporaryItemsSubdirectoryName;
+ (id)segmentIdentifierDescriptionForMetadataTrack:(id)a3;
+ (id)stringFromFourCharCode:(unsigned int)a3;
+ (id)trackWithTrackID:(int)a3 forAsset:(id)a4;
+ (id)tracksWithMediaCharacteristic:(id)a3 forAsset:(id)a4;
+ (id)tracksWithMediaType:(id)a3 forAsset:(id)a4;
+ (id)transformAuxiliaryImages:(id)a3 scaleFactor:(double)a4 applyingOrientation:(unsigned int)a5;
+ (id)urlByAttachingOutOfBandHintsBase64String:(id)a3 toVideoURL:(id)a4;
+ (int64_t)defaultRasterizationDPI;
+ (int64_t)devicePerformanceMemoryClass;
+ (int64_t)rawSourceMaximumPixelCountForBackgroundProcessing;
+ (int64_t)rawSourceMaximumPixelCountForInteractiveEditing;
+ (int64_t)statusForExportSession:(id)a3;
+ (unsigned)fourCharCodeFromString:(id)a3;
+ (void)appendMetadataItemsFromAsset:(id)a3 toDebugDescription:(id)a4;
+ (void)enumerateVideoTrackFormatDescriptionsInAsset:(id)a3 withBlock:(id)a4;
+ (void)exportAsynchronously:(id)a3 completionHandler:(id)a4;
+ (void)preserveTrackAssociations:(id)a3 ofAsset:(id)a4 forMutableComposition:(id)a5 assetToCompositionTrackID:(id)a6;
+ (void)videoComposition:(id)a3 applier:(id)a4 completionHandler:(id)a5;
@end

@implementation PFMediaUtilities

+ (id)protectedTemporaryItemsSubdirectoryName
{
  return @"TemporaryItems";
}

+ (double)gainMapHeadroomForHDRGain:(double)a3 gainMapValue:(double)a4
{
  if (a3 >= 1.0)
  {
    if (a4 <= 0.01) {
      return exp2(a4 * -70.0 + 3.0);
    }
    double v4 = a4 * -0.303030303 + 2.0;
    double v5 = 0.303030303;
  }
  else
  {
    if (a4 <= 0.01) {
      return exp2(a4 * -20.0 + 1.8);
    }
    double v4 = a4 * -0.101010101 + 1.5;
    double v5 = 0.101010101;
  }
  return exp2(v4 + v5);
}

+ (id)_cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    v7 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:");
    v8 = [v7 imageByApplyingCGOrientation:v6];

    if (vabdd_f64(1.0, a5) > 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v11, a5, a5);
      uint64_t v9 = [v8 imageByApplyingTransform:&v11];

      v8 = (void *)v9;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (__CVBuffer)_createPixelBufferFromAuxiliaryImageInfo:(id)a3
{
  CVPixelBufferRef v16 = 0;
  uint64_t v3 = *MEMORY[0x1E4F2F378];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:v3];

  size_t v6 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2F538]), "unsignedLongValue");
  size_t v7 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FDD8]), "unsignedLongValue");
  size_t v8 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FB48]), "unsignedLongValue");
  LODWORD(v5) = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FCE0]), "unsignedIntValue");
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];

  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v11 = v9;
  v12 = (void *)[v11 bytes];
  id v13 = v11;
  CVPixelBufferCreateWithBytes(v10, v7, v8, (OSType)v5, v12, v6, (CVPixelBufferReleaseBytesCallback)_AuxiliaryImageCVPixelBufferReleaseBytesCallback_3487, v13, 0, &v16);
  v14 = v16;

  return v14;
}

+ (id)_cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = [a1 _createPixelBufferFromAuxiliaryImageInfo:a3];
  if (v8)
  {
    uint64_t v9 = (__CVBuffer *)v8;
    CFAllocatorRef v10 = [a1 _cIImageFromPixelBuffer:v8 applyingOrientation:v6 scaleFactor:a5];
    CVPixelBufferRelease(v9);
  }
  else
  {
    CFAllocatorRef v10 = 0;
  }

  return v10;
}

+ (CGImage)createImageRefFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  double v5 = [a1 _cIImageFromAuxiliaryImageInfo:a3 applyingOrientation:*(void *)&a4 scaleFactor:a5];
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
  CFAllocatorRef v10 = v9;
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
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28228];
      CVPixelBufferRef v16 = [NSString stringWithFormat:@"Unable to access input media through URL %@", v7];
      v21[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a4 = [v15 errorWithDomain:@"com.apple.PhotosFormats" code:2 userInfo:v17];
    }
  }
LABEL_11:

  return v12;
}

+ (unsigned)fourCharCodeFromString:(id)a3
{
  uint64_t v3 = (char *)[a3 cStringUsingEncoding:30];
  return (v3[1] << 16) | (*v3 << 24) | (v3[2] << 8) | v3[3];
}

+ (id)stringFromFourCharCode:(unsigned int)a3
{
  v5[0] = HIBYTE(a3);
  v5[1] = BYTE2(a3);
  v5[2] = BYTE1(a3);
  v5[3] = a3;
  v5[4] = 0;
  uint64_t v3 = (void *)[[NSString alloc] initWithCString:v5 encoding:30];

  return v3;
}

+ (id)urlByAttachingOutOfBandHintsBase64String:(id)a3 toVideoURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    CFURLRef v7 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:0];
    [v7 setFragment:v5];
    id v8 = [v7 URL];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

+ (id)outOfBandHintsForURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  id v4 = [v3 fragment];

  if (![v4 length])
  {
    id v8 = 0;
    goto LABEL_17;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v14 = v4;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring unexpected hints format: %@", buf, 0xCu);
    }
    id v8 = 0;
    goto LABEL_16;
  }
  id v12 = 0;
  id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v14 = v4;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error decoding hints plist (%@): %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      CFAllocatorRef v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412546;
      unint64_t v14 = v4;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error decoding hints plist (%@), unexpected type %@", buf, 0x16u);
    }
LABEL_14:
    id v8 = 0;
    goto LABEL_15;
  }
  id v8 = v6;
LABEL_15:

LABEL_16:
LABEL_17:

  return v8;
}

+ (id)outOfBandHintsForVideoAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 URL];
    if (v6 || ([v5 resolvedURL], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = [a1 outOfBandHintsForURL:v6];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else if ([v6 isFileURL])
      {
        CFAllocatorRef v10 = [[PFMetadata alloc] initWithAVAsset:v5 options:12 timeZoneLookup:0];
        id v9 = [(PFMetadata *)v10 outOfBandHints];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil URL for AVURLAsset %@", (uint8_t *)&v12, 0xCu);
      }
      id v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AVAsset is not URL-based: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)_debugDescriptionForAssetVariants:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v33 = [MEMORY[0x1E4F28E78] string];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v30 = v4;
    obuint64_t j = v4;
    uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v7 = [MEMORY[0x1E4F1CA48] array];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v8 = [v6 videoAttributes];
          id v9 = [v8 codecTypes];

          uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v36 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = objc_msgSend(a1, "stringFromFourCharCode:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * j), "unsignedIntValue"));
                [v7 addObject:v14];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v11);
          }

          __int16 v15 = [v7 componentsJoinedByString:@"|"];
          id v16 = [v6 videoAttributes];
          [v16 presentationSize];
          double v18 = v17;
          double v20 = v19;

          [v6 averageBitRate];
          uint64_t v21 = (int)v18;
          v22 = NSNumber;
          double v24 = v23 / 1000000.0;
          v25 = [v6 videoAttributes];
          [v25 nominalFrameRate];
          v26 = objc_msgSend(v22, "numberWithDouble:");
          v27 = [v6 videoAttributes];
          v28 = [v27 videoRange];
          [(__CFString *)v33 appendFormat:@"- %.02fmbit/s %@ %dx%d %@fps %@\n", *(void *)&v24, v15, v21, (int)v20, v26, v28];
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v34);
    }

    id v4 = v30;
  }
  else
  {
    v33 = @"(none)\n";
  }

  return v33;
}

+ (id)_debugDescriptionForAssetURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    id v5 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    id v6 = [v5 scheme];
    [(__CFString *)v4 appendFormat:@"Scheme: %@\n", v6];

    id v7 = [v5 host];
    [(__CFString *)v4 appendFormat:@"Host: %@\n", v7];

    id v8 = [v5 path];
    [(__CFString *)v4 appendFormat:@"Path: %@\n", v8];

    [(__CFString *)v4 appendFormat:@"Query:\n"];
    id v9 = [v5 queryItems];
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_246];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          double v17 = [v16 name];
          double v18 = [v16 value];
          [(__CFString *)v4 appendFormat:@"- %@=%@\n", v17, v18, (void)v28];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    double v19 = [v5 fragment];
    double v20 = v19;
    if (v19)
    {
      id v21 = v19;
      v22 = +[PFMediaUtilities outOfBandHintsForURL:v3];
      double v23 = v22;
      if (v22)
      {
        double v24 = NSString;
        v25 = [v22 description];
        uint64_t v26 = [v24 stringWithFormat:@"Out of band hints: %@\n", v25];

        id v21 = (id)v26;
      }
      [(__CFString *)v4 appendFormat:@"Fragment: %@\n", v21];
    }
    [(__CFString *)v4 appendFormat:@"\n%@\n", v3];
  }
  else
  {
    id v4 = @"(none)";
  }

  return v4;
}

uint64_t __49__PFMediaUtilities__debugDescriptionForAssetURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

+ (void)appendMetadataItemsFromAsset:(id)a3 toDebugDescription:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 appendFormat:@"\n*** Metadata ***\n"];
  uint64_t v7 = [v5 metadata];
  if ([v7 count])
  {
    id v26 = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    long long v28 = v6;
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          __int16 v15 = [v14 identifier];
          if (v11 <= (int)[v15 length])
          {
            id v16 = [v14 identifier];
            int v11 = [v16 length];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }
    else
    {
      int v11 = 0;
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v8;
    uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v22 = [v21 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = [v22 base64EncodedStringWithOptions:0];

            v22 = (void *)v23;
          }
          double v24 = [v21 identifier];
          id v25 = [v24 stringByAppendingString:@":"];
          [v28 appendFormat:@"%-*s %@\n", (v11 + 1), objc_msgSend(v25, "UTF8String"), v22];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }

    id v5 = v26;
    id v6 = v28;
  }
  else
  {
    [v6 appendFormat:@"(none)\n"];
  }
}

+ (id)debugDescriptionForAssetOrPlayerItemTracks:(id)a3 asset:(id)a4 duration:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F28E78];
  id v10 = a3;
  int v11 = [v9 string];
  CMTime time = *(CMTime *)a5;
  objc_msgSend(v11, "appendFormat:", @"Duration: %.02fs\n\n", CMTimeGetSeconds(&time));
  [v11 appendString:@"*** Tracks ***\n"];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __78__PFMediaUtilities_debugDescriptionForAssetOrPlayerItemTracks_asset_duration___block_invoke;
  id v26 = &unk_1E5B2D728;
  id v12 = v11;
  id v27 = v12;
  [v10 enumerateObjectsUsingBlock:&v23];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    uint64_t v14 = [v13 variants];
    uint64_t v15 = [v14 count];
    objc_msgSend(v12, "appendFormat:", @"\n*** Variants (%tu) ***\n", v15, v23, v24, v25, v26);
    id v16 = [a1 _debugDescriptionForAssetVariants:v14];
    [v12 appendString:v16];

    [v12 appendFormat:@"\n*** URL ***\n"];
    uint64_t v17 = [v13 URL];

    uint64_t v18 = [a1 _debugDescriptionForAssetURL:v17];
    [v12 appendString:v18];
  }
  else
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v19);
    [v12 appendFormat:@"\n(no URL/variants info because asset is of type '%@')\n", v14, v23, v24, v25, v26];
  }

  [a1 appendMetadataItemsFromAsset:v8 toDebugDescription:v12];
  BOOL v20 = +[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback];
  id v21 = @"no";
  if (v20) {
    id v21 = @"yes";
  }
  [v12 appendFormat:@"\nCurrent Device Eligible for HDR Playback: %@\n\n", v21];

  return v12;
}

void __78__PFMediaUtilities_debugDescriptionForAssetOrPlayerItemTracks_asset_duration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v5 = [v9 mediaType];
  [*(id *)(a1 + 32) appendFormat:@"%2tu\t%@: "], a3 + 1, v5);
  if ([v5 isEqual:*MEMORY[0x1E4F15C18]])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[PFMediaUtilities formatDebugDescriptionForVideoTrack:v9];
  }
  else if ([v5 isEqual:*MEMORY[0x1E4F15BA8]])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[PFMediaUtilities formatDebugDescriptionForAudioTrack:v9];
  }
  else
  {
    if (![v5 isEqual:*MEMORY[0x1E4F15BE0]]) {
      goto LABEL_8;
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[PFMediaUtilities formatDebugDescriptionForMetadataTrack:v9];
  }
  id v8 = (void *)v7;
  [v6 appendString:v7];

LABEL_8:
  [*(id *)(a1 + 32) appendString:@"\n"];
}

+ (id)debugDescriptionForPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tracks];
  id v6 = [v5 valueForKey:@"assetTrack"];

  uint64_t v7 = [v4 asset];
  if (v4) {
    [v4 duration];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  id v8 = [a1 debugDescriptionForAssetOrPlayerItemTracks:v6 asset:v7 duration:v10];

  return v8;
}

+ (void)enumerateVideoTrackFormatDescriptionsInAsset:(id)a3 withBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, const opaqueCMFormatDescription *, uint64_t, char *))a4;
  char v33 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [a3 tracks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v10 = *MEMORY[0x1E4F15C18];
    uint64_t v23 = *(void *)v30;
    uint64_t v24 = v6;
    uint64_t v22 = *MEMORY[0x1E4F15C18];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = [v12 mediaType];
        int v14 = [v13 isEqual:v10];

        if (v14)
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v15 = [v12 formatDescriptions];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v15);
                }
                BOOL v20 = *(const opaqueCMFormatDescription **)(*((void *)&v25 + 1) + 8 * j);
                uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v20);
                v5[2](v5, v12, v20, MediaSubType, &v33);
                if (v33)
                {

                  id v6 = v24;
                  goto LABEL_20;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v23;
          id v6 = v24;
          uint64_t v10 = v22;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }
LABEL_20:
}

+ (id)hevcProfileInformationForVideoTrackFormatDescription:(opaqueCMFormatDescription *)a3
{
  if (CMFormatDescriptionGetMediaSubType(a3) == 1752589105)
  {
    id v4 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F1EE20]);
    id v5 = [v4 objectForKeyedSubscript:@"hvcC"];
    if (!v5
      || FigHEVCBridge_GetHEVCParameterSetAtIndex()
      || FigHEVCBridge_GetSPSProfileTierLevel())
    {
      id v6 = 0;
    }
    else
    {
      id v6 = objc_opt_new();
      uint64_t v8 = [NSNumber numberWithUnsignedChar:0];
      [v6 setProfile:v8];

      uint64_t v9 = [NSNumber numberWithUnsignedChar:0];
      [v6 setTier:v9];

      uint64_t v10 = [NSNumber numberWithUnsignedChar:0];
      [v6 setLevel:v10];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)segmentIdentifierDescriptionForMetadataTrack:(id)a3
{
  id v3 = a3;
  id v4 = [v3 asset];
  uint64_t v19 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v4 error:&v19];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v3 outputSettings:0];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F16390]) initWithAssetReaderTrackOutput:v6];
    uint64_t v8 = 0;
    if ([v5 canAddOutput:v6])
    {
      [v5 addOutput:v6];
      if ([v5 startReading])
      {
        uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v9 = [v7 nextTimedMetadataGroup];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          do
          {
            memset(v18, 0, sizeof(v18));
            long long v17 = 0u;
            [v10 timeRange];
            int v11 = NSString;
            *(_OWORD *)&time.value = v17;
            time.epoch = *(void *)&v18[0];
            Float64 Seconds = CMTimeGetSeconds(&time);
            CMTime time = *(CMTime *)((char *)v18 + 8);
            id v13 = objc_msgSend(v11, "stringWithFormat:", @"\n\t  - Segment start %.02fs duration %.02fs", *(void *)&Seconds, CMTimeGetSeconds(&time));
            [v8 addObject:v13];

            uint64_t v14 = [v7 nextTimedMetadataGroup];

            uint64_t v10 = (void *)v14;
          }
          while (v14);
        }
        [v5 cancelReading];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)formatDebugDescriptionForMetadataTrack:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 formatDescriptions];
    id v6 = (const opaqueCMFormatDescription *)[v5 firstObject];

    long long v35 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = CMFormatDescriptionGetExtensions(v6);
    uint64_t v8 = v7;
    unint64_t v9 = 0x1E4F29000uLL;
    if (v7)
    {
      long long v26 = v6;
      long long v28 = v4;
      long long v27 = v7;
      uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1ED18]];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v34 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v34)
      {
        uint64_t v33 = *(void *)v37;
        uint64_t v32 = *MEMORY[0x1E4F1F0D8];
        uint64_t v31 = *MEMORY[0x1E4F1F0F0];
        uint64_t v30 = *MEMORY[0x1E4F1F168];
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v37 != v33) {
              objc_enumerationMutation(v10);
            }
            id v12 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * i)];
            id v13 = [v12 objectForKeyedSubscript:v32];
            uint64_t v14 = +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", [v13 unsignedIntValue]);
            uint64_t v15 = [v12 objectForKeyedSubscript:v31];
            if (v15) {
              uint64_t v16 = (__CFString *)[objc_alloc(*(Class *)(v9 + 24)) initWithData:v15 encoding:30];
            }
            else {
              uint64_t v16 = @"(unknown metadata key value)";
            }
            long long v17 = [MEMORY[0x1E4F16558] identifierForKey:v16 keySpace:v14];
            unint64_t v18 = v9;
            uint64_t v19 = [*(id *)(v9 + 24) stringWithFormat:@"\n\t- %@", v17];
            [v35 addObject:v19];

            if ([v17 isEqualToString:v30])
            {
              BOOL v20 = [a1 segmentIdentifierDescriptionForMetadataTrack:v28];
              if (v20) {
                [v35 addObjectsFromArray:v20];
              }
            }
            unint64_t v9 = v18;
          }
          uint64_t v34 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v34);
      }

      uint64_t v8 = v27;
      id v4 = v28;
      id v6 = v26;
    }
    id v21 = *(void **)(v9 + 24);
    uint64_t v22 = +[PFMediaUtilities stringFromFourCharCode:CMFormatDescriptionGetMediaSubType(v6)];
    uint64_t v23 = [v35 componentsJoinedByString:&stru_1EF7AE1F8];
    uint64_t v24 = [v21 stringWithFormat:@"%@ %@", v22, v23];
  }
  else
  {
    uint64_t v24 = @"(nil metadata track)";
  }

  return v24;
}

+ (BOOL)audioChannelLayoutIsCinematicVideoRender:(const AudioChannelLayout *)a3
{
  if (a3->mChannelLayoutTag || a3->mNumberChannelDescriptions != 5) {
    return 0;
  }
  uint64_t v3 = 0;
  mChannelDescriptions = a3->mChannelDescriptions;
  do
  {
    AudioChannelLabel mChannelLabel = mChannelDescriptions->mChannelLabel;
    ++mChannelDescriptions;
    BOOL result = mChannelLabel == dword_1A42D37A0[v3];
    BOOL v7 = mChannelLabel != dword_1A42D37A0[v3] || v3 == 4;
    ++v3;
  }
  while (!v7);
  return result;
}

+ (id)channelLayoutNameForAudioTrackFormatDescription:(opaqueCMFormatDescription *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  size_t sizeOut = 0;
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(a3, &sizeOut);
  size_t v17 = 0;
  FormatList = CMAudioFormatDescriptionGetFormatList(a3, &v17);
  UInt32 ioPropertyDataSize = 8;
  uint64_t v15 = 0;
  if (v17 < 0x30)
  {
    OSStatus Property = AudioFormatGetProperty(0x6C6F6E6Du, sizeOut, ChannelLayout, &ioPropertyDataSize, &v15);
    if (Property)
    {
      OSStatus v12 = Property;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int inSpecifier = 67109120;
        LODWORD(v21) = v12;
        unint64_t v9 = MEMORY[0x1E4F14500];
        p_int inSpecifier = (uint8_t *)&inSpecifier;
        goto LABEL_17;
      }
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v21 = 0;
    int v24 = 0;
    uint64_t v23 = 0;
    int inSpecifier = FormatList->mChannelLayoutTag;
    OSStatus v7 = AudioFormatGetProperty(0x6C6F6E6Du, 0x20u, &inSpecifier, &ioPropertyDataSize, &v15);
    if (v7)
    {
      OSStatus v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v19[0] = 67109120;
        v19[1] = v8;
        unint64_t v9 = MEMORY[0x1E4F14500];
        p_int inSpecifier = (uint8_t *)v19;
LABEL_17:
        _os_log_error_impl(&dword_1A41FE000, v9, OS_LOG_TYPE_ERROR, "AudioFormatGetProperty returned non-success status %d", p_inSpecifier, 8u);
      }
    }
  }
  id v13 = v15;
  if (!v15)
  {
    if ([a1 audioChannelLayoutIsCinematicVideoRender:ChannelLayout])
    {
      id v13 = @"Cinematic Video Render";
    }
    else if (ChannelLayout->mChannelLayoutTag == -266338299)
    {
      id v13 = @"Non-POR Cinematic Video Render";
    }
    else
    {
      id v13 = @"(unknown channel layout)";
    }
  }

  return v13;
}

+ (id)formatDebugDescriptionForAudioTrack:(id)a3
{
  if (a3)
  {
    id v4 = [a3 formatDescriptions];
    id v5 = (const opaqueCMFormatDescription *)[v4 firstObject];

    id v6 = [a1 channelLayoutNameForAudioTrackFormatDescription:v5];
    OSStatus v7 = NSString;
    OSStatus v8 = +[PFMediaUtilities stringFromFourCharCode:CMFormatDescriptionGetMediaSubType(v5)];
    unint64_t v9 = [v7 stringWithFormat:@"%@ channel layout: %@", v8, v6];
  }
  else
  {
    unint64_t v9 = @"(nil audio track)";
  }

  return v9;
}

+ (id)formatDebugDescriptionForVideoTrack:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 formatDescriptions];
    OSStatus v7 = (const opaqueCMFormatDescription *)[v6 firstObject];

    OSStatus v8 = CMFormatDescriptionGetExtension(v7, (CFStringRef)*MEMORY[0x1E4F24BC8]);
    uint64_t v41 = CMFormatDescriptionGetExtension(v7, (CFStringRef)*MEMORY[0x1E4F24A90]);
    unint64_t v9 = CMFormatDescriptionGetExtensions(v7);
    uint64_t v10 = v9;
    if (v9)
    {
      int v11 = [v9 objectForKeyedSubscript:@"BitsPerComponent"];
      uint64_t v12 = [v11 integerValue];

      if ([v8 isEqualToString:*MEMORY[0x1E4F1EEF8]])
      {
        id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1EE20]];
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 objectForKeyedSubscript:@"dvvC"];
          BOOL v39 = v15 != 0;
        }
        else
        {
          BOOL v39 = 0;
        }
      }
      else
      {
        BOOL v39 = 0;
      }
    }
    else
    {
      BOOL v39 = 0;
      uint64_t v12 = 0;
    }
    uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v7);
    long long v40 = v10;
    if (MediaSubType == 1752589105)
    {
      unint64_t v18 = [a1 hevcProfileInformationForVideoTrackFormatDescription:v7];
      uint64_t v19 = v18;
      if (v18)
      {
        BOOL v20 = [v18 summaryDescription];
        long long v38 = [@" " stringByAppendingString:v20];
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v5;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to get HEVC profile/tier/level for video track %@", buf, 0xCu);
        }
        long long v38 = @" (profile/tier/level unavailable)";
      }
    }
    else
    {
      long long v38 = &stru_1EF7AE1F8;
    }
    if (v12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%tdbit ", v12);
      long long v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v37 = &stru_1EF7AE1F8;
    }
    int VideoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
    uint64_t v22 = @"SDR";
    if (VideoDynamicRange > 1) {
      uint64_t v22 = @"HDR";
    }
    uint64_t v23 = v22;
    [v5 naturalSize];
    CGFloat v25 = v24;
    [v5 naturalSize];
    CGFloat v27 = v26;
    [v5 preferredTransform];
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v47.size.double width = v25;
    v47.size.double height = v27;
    CGRect v48 = CGRectApplyAffineTransform(v47, &v42);
    double width = v48.size.width;
    double height = v48.size.height;
    uint64_t v30 = NSString;
    uint64_t v31 = +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", MediaSubType, v48.origin.x, v48.origin.y);
    uint64_t v32 = NSNumber;
    [v5 nominalFrameRate];
    uint64_t v33 = objc_msgSend(v32, "numberWithFloat:");
    uint64_t v34 = (void *)v33;
    long long v35 = @"no";
    if (v39) {
      long long v35 = @"yes";
    }
    [v30 stringWithFormat:@"%@ %@%@%@ %dx%d %@fps transfer=%@ color=%@ dv84=%@", v31, v37, v23, v38, (int)width, (int)height, v33, v8, v41, v35];
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = @"(nil video track)";
  }

  return v16;
}

+ (id)mainVideoTrackForAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15C18], a3, 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        OSStatus v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isEnabled])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isValidAVFileForURL:(id)a3
{
  id v3 = a3;
  if ([v3 checkResourceIsReachableAndReturnError:0])
  {
    id v4 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v3 options:0];
    char v5 = [v4 isReadable];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)formattedCameraModelFromCameraModel:(id)a3 cameraMake:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    OSStatus v7 = [v6 componentsSeparatedByString:@" "];
    if ([v7 count] == 1)
    {
      uint64_t v8 = [v6 componentsSeparatedByString:@"/"];

      OSStatus v7 = (void *)v8;
    }
    if ([v7 count] == 1)
    {
      long long v9 = [v7 objectAtIndexedSubscript:0];
      long long v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v11 = [v9 stringByTrimmingCharactersInSet:v10];

      if ([v5 rangeOfString:v11] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [NSString stringWithFormat:@"%@ %@", v11, v5];

        id v5 = (id)v12;
      }
    }
    else
    {
      uint64_t v11 = (uint64_t)v6;
    }

    id v6 = (id)v11;
  }

  return v5;
}

+ (int64_t)rawSourceMaximumPixelCountForInteractiveEditing
{
  if ([a1 devicePerformanceMemoryClass] >= 6) {
    return 60217344;
  }
  else {
    return 52664320;
  }
}

+ (int64_t)rawSourceMaximumPixelCountForBackgroundProcessing
{
  if ([a1 devicePerformanceMemoryClass] < 2) {
    return 25000000;
  }
  if ([a1 devicePerformanceMemoryClass] >= 6) {
    return 60217344;
  }
  return 52664320;
}

+ (BOOL)canLoadAssetAsRawForInteractiveEditingWithImageProperties:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];

  if (v5)
  {
    [a1 maximumImageSizeFromProperties:v4];
    BOOL v8 = [a1 rawSourceMaximumPixelCountForInteractiveEditing] >= (unint64_t)(v6 * v7);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (CGSize)maximumImageSizeFromProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"RawPixelWidth"];
  id v5 = [v3 objectForKey:@"RawPixelHeight"];
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  double v9 = v8;
  long long v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  [v10 doubleValue];
  double v12 = v11;
  id v13 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
  [v13 doubleValue];
  double v15 = v14;

  uint64_t v16 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F8D8]];
  [v16 doubleValue];
  double v18 = v17;
  uint64_t v19 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F8E0]];

  [v19 doubleValue];
  double v21 = v20;

  double v22 = *MEMORY[0x1E4F1DB30];
  double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v7 * v9 > *MEMORY[0x1E4F1DB30] * v23)
  {
    double v23 = v9;
    double v22 = v7;
  }
  if (v12 * v15 > v22 * v23)
  {
    double v23 = v15;
    double v22 = v12;
  }
  if (v18 * v21 <= v22 * v23) {
    double v24 = v23;
  }
  else {
    double v24 = v21;
  }
  if (v18 * v21 <= v22 * v23) {
    double v25 = v22;
  }
  else {
    double v25 = v18;
  }

  double v26 = v25;
  double v27 = v24;
  result.double height = v27;
  result.double width = v26;
  return result;
}

+ (CGImage)createImageRefFromAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  id v5 = [a1 cIImageFromPixelBuffer:a3 applyingOrientation:*(void *)&a4 scaleFactor:a5];
  if (v5)
  {
    double v6 = [MEMORY[0x1E4F1E018] context];
    [v5 extent];
    double v7 = (CGImage *)objc_msgSend(v6, "createCGImage:fromRect:", v5);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (id)cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    double v7 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:");
    double v8 = [v7 imageByApplyingCGOrientation:v6];

    if (vabdd_f64(1.0, a5) > 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v11, a5, a5);
      uint64_t v9 = [v8 imageByApplyingTransform:&v11];

      double v8 = (void *)v9;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (__CVBuffer)createPixelBufferFromAuxiliaryImageInfo:(id)a3
{
  CVPixelBufferRef v16 = 0;
  uint64_t v3 = *MEMORY[0x1E4F2F378];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];

  size_t v6 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2F538]), "unsignedLongValue");
  size_t v7 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FDD8]), "unsignedLongValue");
  size_t v8 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FB48]), "unsignedLongValue");
  LODWORD(v5) = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E4F2FCE0]), "unsignedIntValue");
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2F370]];

  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v11 = v9;
  double v12 = (void *)[v11 bytes];
  id v13 = v11;
  CVPixelBufferCreateWithBytes(v10, v7, v8, (OSType)v5, v12, v6, (CVPixelBufferReleaseBytesCallback)_AuxiliaryImageCVPixelBufferReleaseBytesCallback_3487, v13, 0, &v16);
  double v14 = v16;

  return v14;
}

+ (id)dictionaryRepresentationForAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 metadata:(CGImageMetadata *)a4 colorSpace:(CGColorSpace *)a5 compatibilityMetadata:(CGImageMetadata *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  id v14 = 0;
  if (PixelFormatType)
  {
    if (Width)
    {
      if (Height)
      {
        size_t v15 = BytesPerRow;
        if (BytesPerRow)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          if (ImageIOLibraryCore() && getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc())
          {
            double v17 = (void *)getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc();
            if (!v17)
            {
              dlerror();
              abort_report_np();
            }
            [v16 setObject:a3 forKeyedSubscript:*v17];
            goto LABEL_15;
          }
          uint64_t v30 = a4;
          double v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v15 * Height];
          if (v18)
          {
            long long v29 = a5;
            CVReturn v19 = CVPixelBufferLockBaseAddress(a3, 1uLL);
            if (!v19)
            {
              BaseAddress = CVPixelBufferGetBaseAddress(a3);
              id v28 = v18;
              memcpy((void *)[v28 mutableBytes], BaseAddress, v15 * Height);
              CVPixelBufferUnlockBaseAddress(a3, 1uLL);
              v31[0] = *MEMORY[0x1E4F2FCE0];
              double v22 = [NSNumber numberWithUnsignedInt:PixelFormatType];
              v32[0] = v22;
              v31[1] = *MEMORY[0x1E4F2FDD8];
              double v23 = [NSNumber numberWithUnsignedLong:Width];
              v32[1] = v23;
              v31[2] = *MEMORY[0x1E4F2FB48];
              double v24 = [NSNumber numberWithUnsignedLong:Height];
              v32[2] = v24;
              v31[3] = *MEMORY[0x1E4F2F538];
              double v25 = [NSNumber numberWithUnsignedLong:v15];
              v32[3] = v25;
              double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

              [v16 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F2F378]];
              [v16 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F2F370]];

              a5 = v29;
              a4 = v30;
LABEL_15:
              [v16 setObject:a4 forKeyedSubscript:*MEMORY[0x1E4F2F380]];
              [v16 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F2F368]];
              if (a6) {
                [v16 setObject:a6 forKeyedSubscript:*MEMORY[0x1E4F2F388]];
              }
              id v14 = v16;
              goto LABEL_18;
            }
            CVReturn v20 = v19;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              CVReturn v34 = v20;
              _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "CVPixelBufferLockBaseAddress failed (%d)", buf, 8u);
            }
          }

          id v14 = 0;
LABEL_18:
        }
      }
    }
  }

  return v14;
}

+ (id)cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = [a1 createPixelBufferFromAuxiliaryImageInfo:a3];
  if (v8)
  {
    uint64_t v9 = (__CVBuffer *)v8;
    CFAllocatorRef v10 = [a1 cIImageFromPixelBuffer:v8 applyingOrientation:v6 scaleFactor:a5];
    CVPixelBufferRelease(v9);
  }
  else
  {
    CFAllocatorRef v10 = 0;
  }

  return v10;
}

+ (id)transformAuxiliaryImages:(id)a3 scaleFactor:(double)a4 applyingOrientation:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v7;
  uint64_t v40 = [v8 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v44;
    uint64_t v38 = *MEMORY[0x1E4F2F378];
    uint64_t v37 = *MEMORY[0x1E4F2FCE0];
    uint64_t v36 = *MEMORY[0x1E4F24D20];
    uint64_t v34 = *MEMORY[0x1E4F2F380];
    uint64_t v33 = *MEMORY[0x1E4F2F368];
    uint64_t v32 = *MEMORY[0x1E4F2F3C8];
    uint64_t v30 = *MEMORY[0x1E4F2F388];
    unsigned int v35 = v5;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v8);
        }
        CFAllocatorRef v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v11 = [v8 objectForKeyedSubscript:v10];
        double v12 = [a1 cIImageFromAuxiliaryImageInfo:v11 applyingOrientation:v5 scaleFactor:a4];
        id v13 = v12;
        if (v12)
        {
          [v12 extent];
          double v15 = v14;
          double v17 = v16;
          double v18 = [v11 objectForKeyedSubscript:v38];
          CVReturn v19 = [v18 objectForKeyedSubscript:v37];
          OSType v20 = [v19 unsignedIntValue];

          uint64_t v55 = v36;
          uint64_t v56 = MEMORY[0x1E4F1CC08];
          CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          CVPixelBufferRef pixelBufferOut = 0;
          CVReturn v22 = CVPixelBufferCreate(0, (unint64_t)v15, (unint64_t)v17, v20, v21, &pixelBufferOut);
          if (v22)
          {
            CVReturn v23 = v22;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109888;
              int v48 = (int)v15;
              __int16 v49 = 1024;
              int v50 = (int)v17;
              __int16 v51 = 1024;
              OSType v52 = v20;
              __int16 v53 = 1024;
              CVReturn v54 = v23;
              _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to allocate CVPixelBuffer of size: %dx%d, format: %d, error: %d", buf, 0x1Au);
            }
          }
          else
          {
            double v24 = [MEMORY[0x1E4F1E018] context];
            [v24 render:v13 toCVPixelBuffer:pixelBufferOut];

            double v25 = [v11 objectForKeyedSubscript:v34];

            double v26 = [v11 objectForKeyedSubscript:v33];

            if ([v10 isEqualToString:v32])
            {
              double v27 = [v11 objectForKeyedSubscript:v30];
            }
            else
            {
              double v27 = 0;
            }
            id v28 = [a1 dictionaryRepresentationForAuxiliaryImagePixelBuffer:pixelBufferOut metadata:v25 colorSpace:v26 compatibilityMetadata:v27];
            if (v28) {
              [v31 setObject:v28 forKeyedSubscript:v10];
            }
            CVPixelBufferRelease(pixelBufferOut);

            uint64_t v5 = v35;
          }
        }
      }
      uint64_t v40 = [v8 countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v40);
  }

  return v31;
}

+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend(a1, "auxiliaryImagesToPreserveForDerivativesFromImageSource:imageIndex:");
  if ([v6 count])
  {
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
    id v8 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
    uint64_t v9 = v8;
    if (v8) {
      int v10 = [v8 intValue];
    }
    else {
      int v10 = 1;
    }
    double v12 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    [v12 doubleValue];
    uint64_t v14 = v13;
    double v15 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    [v15 doubleValue];
    uint64_t v17 = v16;

    double v18 = [MEMORY[0x1E4F1CA48] array];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__PFMediaUtilities_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke;
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

void __92__PFMediaUtilities_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (a3) {
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
  }
  else {
    size_t PrimaryImageIndex = 0;
  }

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

+ (id)auxiliaryImageIdentifiersToPreserveForDerivatives
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2F3C0];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)imagePropertiesFromImageSource:(CGImageSource *)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    if (imagePropertiesFromImageSource_atIndex__onceToken[0] != -1) {
      dispatch_once(imagePropertiesFromImageSource_atIndex__onceToken, &__block_literal_global_86);
    }
    CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(a3, a4, (CFDictionaryRef)imagePropertiesFromImageSource_atIndex__options);
    if (!v6) {
      CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(a3, a4, (CFDictionaryRef)imagePropertiesFromImageSource_atIndex__optionsFallback);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "NULL image source, unable to query image properties", v8, 2u);
    }
    CFDictionaryRef v6 = 0;
  }

  return v6;
}

uint64_t __59__PFMediaUtilities_imagePropertiesFromImageSource_atIndex___block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F2FDF8];
  v7[1] = @"kCGImageSourceKeepOriginalProfile";
  v11[0] = MEMORY[0x1E4F1CC38];
  v11[1] = MEMORY[0x1E4F1CC38];
  uint64_t v1 = *MEMORY[0x1E4F2FF20];
  uint64_t v8 = *MEMORY[0x1E4F2FF40];
  uint64_t v0 = v8;
  uint64_t v9 = v1;
  v11[2] = MEMORY[0x1E4F1CC38];
  v11[3] = MEMORY[0x1E4F1CC38];
  uint64_t v10 = *MEMORY[0x1E4F2FEC8];
  v11[4] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v7 count:5];
  uint64_t v3 = (void *)imagePropertiesFromImageSource_atIndex__options;
  imagePropertiesFromImageSource_atIndex__options = v2;

  uint64_t v4 = [(id)imagePropertiesFromImageSource_atIndex__options mutableCopy];
  id v5 = (void *)imagePropertiesFromImageSource_atIndex__optionsFallback;
  imagePropertiesFromImageSource_atIndex__optionsFallback = v4;

  return [(id)imagePropertiesFromImageSource_atIndex__optionsFallback setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v0];
}

+ (id)imagePropertiesFromImageSource:(CGImageSource *)a3
{
  return (id)[a1 imagePropertiesFromImageSource:a3 atIndex:0];
}

+ (id)hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:(id)a3 metadata:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v8 = (const __CFURL *)a3;
  uint64_t v9 = (PFMetadata *)a4;
  uint64_t v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*MEMORY[0x1E4F15A90]];
  if (v8 && !v9) {
    uint64_t v9 = [[PFMetadata alloc] initWithImageURL:v8 contentType:0 timeZoneLookup:0];
  }
  if (!v10)
  {
    if (!a5)
    {
LABEL_15:
      id v13 = 0;
      goto LABEL_17;
    }
    CVReturn v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    uint64_t v20 = [NSString stringWithFormat:@"Unable to check for presence of embedded preview: failed to resolved DNG type."];
    v32[0] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v22 = v19;
    uint64_t v23 = 8;
LABEL_14:
    *a5 = [v22 errorWithDomain:@"com.apple.PhotosFormats" code:v23 userInfo:v21];

    goto LABEL_15;
  }
  id v11 = [(PFMetadata *)v9 contentType];
  if (![v11 conformsToType:v10])
  {

    id v13 = (id)MEMORY[0x1E4F1CC28];
    goto LABEL_17;
  }
  BOOL v12 = [(PFMetadata *)v9 isProRAW];

  id v13 = (id)MEMORY[0x1E4F1CC28];
  if (!v12) {
    goto LABEL_17;
  }
  if (!v8)
  {
    if (!a5) {
      goto LABEL_15;
    }
    double v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = [NSString stringWithFormat:@"Unable to check for presence of embedded preview: invalid URL: %@", 0, *MEMORY[0x1E4F28228]];
    id v28 = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v22 = v25;
    uint64_t v23 = 2;
    goto LABEL_14;
  }
  CGImageSourceRef v14 = CGImageSourceCreateWithURL(v8, 0);
  if (!v14)
  {
    if (!a5) {
      goto LABEL_15;
    }
    double v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    uint64_t v20 = [NSString stringWithFormat:@"Unable to check for presence of embedded preview: unable to create image source from %@", v8];
    uint64_t v30 = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v22 = v26;
    uint64_t v23 = 1;
    goto LABEL_14;
  }
  CGImageSourceRef v15 = v14;
  long long v16 = (void *)MEMORY[0x1A6259880]();
  int v17 = [a1 embeddedJPEGSuitableForDerivativesInRawImageSource:v15 enforcePixelCountLimits:0 timeZoneLookup:0];
  CFRelease(v15);
  long long v18 = (void *)MEMORY[0x1E4F1CC38];
  if (!v17) {
    long long v18 = v13;
  }
  id v13 = v18;
LABEL_17:

  return v13;
}

+ (BOOL)embeddedJPEGSuitableForDerivativesInImageOfType:(id)a3 url:(id)a4 imageProperties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[PFMetadata alloc] initWithImageProperties:v8 contentType:v10 timeZoneLookup:0];

  BOOL v12 = [a1 hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:v9 metadata:v11 error:0];

  LOBYTE(v9) = [v12 BOOLValue];
  return (char)v9;
}

+ (BOOL)embeddedJPEGSuitableForDerivativesInRawImageSource:(CGImageSource *)a3 enforcePixelCountLimits:(BOOL)a4 timeZoneLookup:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v13 = 0;
  CGImageSourceRef v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v8 = [[PFMetadata alloc] initWithImageSource:a3 contentType:0 options:13 timeZoneLookup:v7 cacheImageSource:1];
  id v9 = v8;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __110__PFMediaUtilities_embeddedJPEGSuitableForDerivativesInRawImageSource_enforcePixelCountLimits_timeZoneLookup___block_invoke;
    v12[3] = &unk_1E5B2D6D8;
    v12[4] = &v13;
    [(PFMetadata *)v8 enumerateRawThumbnailInfoWithBlock:v12];
    BOOL v10 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v10 = 1;
    *((unsigned char *)v14 + 24) = 1;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __110__PFMediaUtilities_embeddedJPEGSuitableForDerivativesInRawImageSource_enforcePixelCountLimits_timeZoneLookup___block_invoke(uint64_t result, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((unint64_t)(a2 * a3) - 1000001 <= 0xD59F7E)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

+ (int64_t)defaultRasterizationDPI
{
  return 150;
}

+ (BOOL)typeRequiresRasterizationDPI:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if (([v3 conformsToType:*MEMORY[0x1E4F44450]] & 1) != 0
      || (+[PFUniformTypeUtilities adobeIllustratorType],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v4 conformsToType:v5],
          v5,
          (v6 & 1) != 0))
    {
      char v7 = 1;
    }
    else
    {
      char v7 = [v4 conformsToType:*MEMORY[0x1E4F444C0]];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidImageFileForURL:(id)a3
{
  id v3 = a3;
  if ([v3 checkResourceIsReachableAndReturnError:0]
    && (uint64_t v4 = CGImageSourceCreateWithURL((CFURLRef)v3, 0)) != 0)
  {
    BOOL v5 = v4;
    char v6 = +[PFUniformTypeUtilities typeWithIdentifier:CGImageSourceGetType(v4)];
    char v7 = [v6 conformsToType:*MEMORY[0x1E4F44400]];
    CFRelease(v5);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (int64_t)devicePerformanceMemoryClass
{
  if (devicePerformanceMemoryClass_onceToken != -1) {
    dispatch_once(&devicePerformanceMemoryClass_onceToken, &__block_literal_global_3627);
  }
  return devicePerformanceMemoryClass_deviceMemoryClass;
}

void __48__PFMediaUtilities_devicePerformanceMemoryClass__block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  uint64_t v0 = [v1 objectForKeyedSubscript:@"DevicePerformanceMemoryClass"];
  devicePerformanceMemoryClass_deviceMemoryClass = [v0 integerValue];
}

+ (BOOL)canGenerateImageDerivativesFromType:(id)a3
{
  id v3 = a3;
  if (([v3 conformsToType:*MEMORY[0x1E4F44400]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F44448]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 conformsToType:*MEMORY[0x1E4F44450]];
  }

  return v4;
}

+ (id)associatedTracksOfTypeForTrack:(id)a3 trackAssociationType:(id)a4
{
  return (id)[a3 associatedTracksOfType:a4];
}

+ (id)errorForExportSession:(id)a3
{
  return (id)[a3 error];
}

+ (int64_t)statusForExportSession:(id)a3
{
  return [a3 status];
}

+ (void)exportAsynchronously:(id)a3 completionHandler:(id)a4
{
}

+ (void)videoComposition:(id)a3 applier:(id)a4 completionHandler:(id)a5
{
}

+ (id)metadataForFormat:(id)a3 forAsset:(id)a4
{
  return (id)[a4 metadataForFormat:a3];
}

+ (id)metadataForFormat:(id)a3 forAssetTrack:(id)a4
{
  return (id)[a4 metadataForFormat:a3];
}

+ (BOOL)insertTimeRange:(id *)a3 ofAsset:(id)a4 atTime:(id *)a5 intoMutableComposition:(id)a6 error:(id *)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [v10 tracks];
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    uint64_t v15 = *MEMORY[0x1E4F15BA8];
    id v30 = a1;
    id v31 = v10;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v18 = objc_msgSend(v17, "mediaType", v30);
        id v19 = v11;
        uint64_t v20 = objc_msgSend(v11, "addMutableTrackWithMediaType:preferredTrackID:", v18, objc_msgSend(v17, "trackID"));

        LODWORD(v18) = [v20 trackID];
        if (v18 != [v17 trackID])
        {
          if (a7)
          {
            double v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v41 = *MEMORY[0x1E4F28228];
            uint64_t v27 = [NSString stringWithFormat:@"Unable to preserve trackID"];
            CGAffineTransform v42 = v27;
            id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            *a7 = [v26 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v28];
          }
LABEL_15:

          BOOL v25 = 0;
          id v10 = v31;
          id v11 = v19;
          goto LABEL_16;
        }
        id v21 = [v17 mediaType];
        int v22 = [v21 isEqualToString:v15];

        if (v22)
        {
          objc_msgSend(v20, "setAlternateGroupID:", objc_msgSend(v17, "alternateGroupID"));
          uint64_t v23 = [v17 languageCode];
          [v20 setLanguageCode:v23];
        }
        long long v24 = *(_OWORD *)&a3->var0.var3;
        v36[0] = *(_OWORD *)&a3->var0.var0;
        v36[1] = v24;
        v36[2] = *(_OWORD *)&a3->var1.var1;
        long long v34 = *MEMORY[0x1E4F1FA48];
        uint64_t v35 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        if (![v20 insertTimeRange:v36 ofTrack:v17 atTime:&v34 error:a7]) {
          goto LABEL_15;
        }

        id v11 = v19;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      id v10 = v31;
      if (v13) {
        continue;
      }
      break;
    }
  }

  [(id)objc_opt_class() preserveTrackAssociations:0 ofAsset:v10 forMutableComposition:v11 assetToCompositionTrackID:0];
  BOOL v25 = 1;
LABEL_16:

  return v25;
}

+ (void)preserveTrackAssociations:(id)a3 ofAsset:(id)a4 forMutableComposition:(id)a5 assetToCompositionTrackID:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v39 = a5;
  id v11 = a6;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __140__PFMediaUtilities_DeprecatedAVFoundationSyncAPIHelpers__preserveTrackAssociations_ofAsset_forMutableComposition_assetToCompositionTrackID___block_invoke;
  v52[3] = &unk_1E5B2D770;
  id v27 = v11;
  id v53 = v27;
  uint64_t v12 = (uint64_t (**)(void, void))MEMORY[0x1A6259AE0](v52);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v28 = v10;
  obuint64_t j = [v10 tracks];
  uint64_t v31 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v49;
    id v34 = v9;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v39, "trackWithTrackID:", ((uint64_t (**)(void, void *))v12)[2](v12, v14));
        if (v15)
        {
          uint64_t v32 = i;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v33 = [v14 availableTrackAssociationTypes];
          uint64_t v37 = [v33 countByEnumeratingWithState:&v44 objects:v55 count:16];
          if (v37)
          {
            uint64_t v35 = v14;
            uint64_t v36 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v45 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                if (!v9
                  || [v9 containsObject:*(void *)(*((void *)&v44 + 1) + 8 * j)])
                {
                  uint64_t v38 = j;
                  long long v42 = 0u;
                  long long v43 = 0u;
                  long long v40 = 0u;
                  long long v41 = 0u;
                  long long v18 = +[PFMediaUtilities associatedTracksOfTypeForTrack:v14 trackAssociationType:v17];
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
                  if (v19)
                  {
                    uint64_t v20 = v19;
                    uint64_t v21 = *(void *)v41;
                    do
                    {
                      for (uint64_t k = 0; k != v20; ++k)
                      {
                        if (*(void *)v41 != v21) {
                          objc_enumerationMutation(v18);
                        }
                        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * k);
                        long long v24 = objc_msgSend(v39, "trackWithTrackID:", ((uint64_t (**)(void, void *))v12)[2](v12, v23));
                        if (!v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                        {
                          int v25 = [v23 trackID];
                          *(_DWORD *)buf = 67109120;
                          int v57 = v25;
                          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Could not find associated composition track for asset track %i, skipping", buf, 8u);
                        }
                        [v15 addTrackAssociationToTrack:v24 type:v17];
                      }
                      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
                    }
                    while (v20);
                  }

                  id v9 = v34;
                  uint64_t v14 = v35;
                  uint64_t j = v38;
                }
              }
              uint64_t v37 = [v33 countByEnumeratingWithState:&v44 objects:v55 count:16];
            }
            while (v37);
          }

          uint64_t i = v32;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v26 = [v14 trackID];
          *(_DWORD *)buf = 67109120;
          int v57 = v26;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Could not find composition track for asset track %i, skipping", buf, 8u);
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v31);
  }
}

uint64_t __140__PFMediaUtilities_DeprecatedAVFoundationSyncAPIHelpers__preserveTrackAssociations_ofAsset_forMutableComposition_assetToCompositionTrackID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 trackID];
  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    char v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "trackID"));
    char v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      uint64_t v4 = [v7 intValue];
    }
  }
  return v4;
}

+ (CGImage)copyCGImageFromImageGenerator:(id)a3 atTime:(id *)a4 actualTime:(id *)a5 error:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  return (CGImage *)[a3 copyCGImageAtTime:&v7 actualTime:a5 error:a6];
}

+ (id)tracksWithMediaCharacteristic:(id)a3 forAsset:(id)a4
{
  return (id)[a4 tracksWithMediaCharacteristic:a3];
}

+ (id)trackWithTrackID:(int)a3 forAsset:(id)a4
{
  return (id)[a4 trackWithTrackID:*(void *)&a3];
}

+ (id)tracksWithMediaType:(id)a3 forAsset:(id)a4
{
  return (id)[a4 tracksWithMediaType:a3];
}

@end