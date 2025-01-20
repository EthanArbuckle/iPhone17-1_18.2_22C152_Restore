@interface PFMetadataImage
+ (id)defaultOptionsForCGImageSource;
+ (id)stringByRemovingImageIoDotSuffixFromString:(id)a3;
- (BOOL)_anyImageHasProcessingFlag:(unint64_t)a3;
- (BOOL)_configureWithImageData:(id)a3 cacheImageSource:(BOOL)a4 cacheImageData:(BOOL)a5;
- (BOOL)_configureWithImageProperties:(id)a3;
- (BOOL)_configureWithImageSource:(CGImageSource *)a3 cacheImageSource:(BOOL)a4;
- (BOOL)_configureWithImageURL:(id)a3 cacheImageSource:(BOOL)a4 cacheImageData:(BOOL)a5;
- (BOOL)_customRenderedIsHDR;
- (BOOL)_hasFFCDimensions;
- (BOOL)_hasScreenshotDimensions;
- (BOOL)_isSpatialStereoGroup:(id)a3 inImageSource:(CGImageSource *)a4;
- (BOOL)configureWithMetadataPlist:(id)a3;
- (BOOL)containsCustomStylesMetadataBlob;
- (BOOL)containsSpatialCameraHEIFMetadata;
- (BOOL)flashFired;
- (BOOL)hasDepthDataAndIsNotRenderedSDOF;
- (BOOL)hasHDRGainMap;
- (BOOL)hasISOGainMap;
- (BOOL)hasSmartStyle;
- (BOOL)isAlchemist;
- (BOOL)isDeferredPhotoProxy;
- (BOOL)isDeferredPhotoProxyExpectingDepth;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrontFacingCamera;
- (BOOL)isHDR;
- (BOOL)isHDR_ExtendedRange;
- (BOOL)isHDR_TS22028_5;
- (BOOL)isImage;
- (BOOL)isPanorama;
- (BOOL)isPhotoBooth;
- (BOOL)isPortrait;
- (BOOL)isProRAW;
- (BOOL)isSDOF;
- (BOOL)isScreenshot;
- (BOOL)isSpatialMedia;
- (BOOL)isSpatialOverCapture;
- (BOOL)isThreeImageStereoHEIC;
- (BOOL)sourceIsImageSourceProxy;
- (CGColorSpace)cgColorSpace;
- (CGImageMetadata)cgImageMetadata;
- (CGImageSource)imageSource;
- (NSData)imageData;
- (NSDictionary)cgImageProperties;
- (NSNumber)exposureTime;
- (NSNumber)fNumber;
- (NSNumber)iso;
- (NSNumber)whiteBalance;
- (NSString)cameraSerialNumber;
- (PFMetadataImage)initWithEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadataImage)initWithImageData:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8;
- (PFMetadataImage)initWithImageProperties:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6;
- (PFMetadataImage)initWithImageSource:(CGImageSource *)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7;
- (PFMetadataImage)initWithImageSourceProxyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadataImage)initWithImageSourceProxyOrEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadataImage)initWithImageURL:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8;
- (id)GIFDelayTime;
- (id)HEICSDelayTime;
- (id)_formatValue:(id)a3 withPrecision:(unint64_t)a4;
- (id)_imageSourceProperties;
- (id)_makeDateTimeProperties;
- (id)_makeGPSProperties;
- (id)_makeGeometryProperties;
- (id)altitudeRef;
- (id)artworkContentDescription;
- (id)brightness;
- (id)burstUuid;
- (id)cameraMake;
- (id)cameraModel;
- (id)captionAbstract;
- (id)ciffDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credit;
- (id)deferredPhotoProcessingIdentifier;
- (id)digitalZoomRatio;
- (id)exifAuxDictionary;
- (id)exifDictionary;
- (id)exposureBias;
- (id)firmware;
- (id)flashCompensation;
- (id)flashValue;
- (id)focalLength;
- (id)focalLengthIn35mm;
- (id)focusDistance;
- (id)focusMode;
- (id)focusPoints;
- (id)generativeAIImageType;
- (id)gifDictionary;
- (id)gpsDictionary;
- (id)gpsHPositioningError;
- (id)groupingUuid;
- (id)hdrGain;
- (id)hdrGainMap;
- (id)hdrGainMapPercentageValue;
- (id)imageCaptureRequestIdentifier;
- (id)imageDirection;
- (id)imageDirectionRef;
- (id)imageSourceProxyData;
- (id)iptcDictionary;
- (id)keywords;
- (id)lensMake;
- (id)lensMaximumMM;
- (id)lensMinimumMM;
- (id)lensModel;
- (id)lightSource;
- (id)livePhotoPairingIdentifier;
- (id)makerAppleDictionary;
- (id)makerCanonDictionary;
- (id)makerNikonDictionary;
- (id)metadataForImagePropertiesAtIndex:(unint64_t)a3;
- (id)meteringMode;
- (id)nrfSrlStatus;
- (id)originatingAssetIdentifier;
- (id)ownerName;
- (id)photoProcessingIdentifier;
- (id)playbackVariation;
- (id)plistForEncoding;
- (id)portraitInLandscapeCamera;
- (id)profileName;
- (id)ptpMediaMetadata;
- (id)rawDictionary;
- (id)renderOriginatingAssetIdentifier;
- (id)semanticStylePreset;
- (id)semanticStyleRenderingVersion;
- (id)semanticStyleToneBias;
- (id)semanticStyleWarmthBias;
- (id)smartStyleColorBias;
- (id)smartStyleExpectingReversibility;
- (id)smartStyleIntensity;
- (id)smartStyleIsReversible;
- (id)smartStyleRenderingVersion;
- (id)smartStyleToneBias;
- (id)software;
- (id)spatialOverCaptureIdentifier;
- (id)speedRef;
- (id)syndicationProperties;
- (id)tiffDictionary;
- (id)title;
- (id)userComment;
- (id)whiteBalanceIndex;
- (int64_t)cameraUsedForCapture;
- (int64_t)customRendered;
- (signed)smartStyleCast;
- (unint64_t)photoCaptureFlags;
- (unint64_t)photoProcessingFlags;
- (unint64_t)photosAppFeatureFlags;
- (void)_computeCameraSerialNumber;
- (void)_computeExposureTime;
- (void)_computeFNumberValue;
- (void)_computeISOSetting;
- (void)_computeWhiteBalanceValue;
- (void)dealloc;
- (void)enumerateRawThumbnailInfoWithBlock:(id)a3;
- (void)fixupGPSWithDate:(id)a3 time:(id)a4;
- (void)setCameraSerialNumber:(id)a3;
- (void)setCgImageMetadata:(CGImageMetadata *)a3;
- (void)setCgImageProperties:(id)a3;
- (void)setExposureTime:(id)a3;
- (void)setFNumber:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageSource:(CGImageSource *)a3;
- (void)setImageSourceProperties:(id)a3;
- (void)setIso:(id)a3;
- (void)setKeysAndValues:(id)a3 inDictionary:(id)a4;
- (void)setWhiteBalance:(id)a3;
@end

@implementation PFMetadataImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteBalance, 0);
  objc_storeStrong((id *)&self->_cameraSerialNumber, 0);
  objc_storeStrong((id *)&self->_iso, 0);
  objc_storeStrong((id *)&self->_exposureTime, 0);
  objc_storeStrong((id *)&self->_fNumber, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_cgImageProperties, 0);
  objc_storeStrong((id *)&self->_isSpatialMediaValue, 0);

  objc_storeStrong((id *)&self->_cachedImageSourceProperties, 0);
}

- (CGImageMetadata)cgImageMetadata
{
  return self->_cgImageMetadata;
}

- (void)setWhiteBalance:(id)a3
{
}

- (void)setCameraSerialNumber:(id)a3
{
}

- (void)setIso:(id)a3
{
}

- (void)setExposureTime:(id)a3
{
}

- (void)setFNumber:(id)a3
{
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setCgImageProperties:(id)a3
{
}

- (NSDictionary)cgImageProperties
{
  return self->_cgImageProperties;
}

- (id)rawDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:@"{raw}" fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)iptcDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2FB80] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)tiffDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2FD40] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)gpsDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2FA18] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)gifDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2F990] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)ciffDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2F548] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)makerCanonDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2FC28] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)makerNikonDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2FC48] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)makerAppleDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2FC20] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)exifAuxDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2F6D8] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)exifDictionary
{
  v3 = [(PFMetadata *)self typeVerifier];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2F800] fromProperties:self->_cgImageProperties];

  return v4;
}

- (void)setKeysAndValues:(id)a3 inDictionary:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20 = self;
  v8 = (NSDictionary *)[(NSDictionary *)self->_cgImageProperties mutableCopy];
  v9 = v8;
  if (v7)
  {
    v10 = [(NSDictionary *)v8 objectForKeyedSubscript:v7];
    v11 = (NSDictionary *)[v10 mutableCopy];

    [(NSDictionary *)v9 setObject:v11 forKeyedSubscript:v7];
  }
  else
  {
    v11 = v8;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v18 = [v12 objectForKeyedSubscript:v17];
        [(NSDictionary *)v11 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  cgImageProperties = v20->_cgImageProperties;
  v20->_cgImageProperties = v9;
}

- (void)fixupGPSWithDate:(id)a3 time:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PFMetadata *)self gpsDateTime];

  if (!v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F2FA98];
    v11[0] = *MEMORY[0x1E4F2F9D0];
    v11[1] = v9;
    v12[0] = v6;
    v12[1] = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(PFMetadataImage *)self setKeysAndValues:v10 inDictionary:*MEMORY[0x1E4F2FA18]];

    [(PFMetadata *)self computeGPSValues];
  }
}

- (void)setImageSourceProperties:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PFMetadataImage;
  if ([(PFMetadata *)&v18 isEqual:v4])
  {
    v5 = v4;
    cgImageProperties = self->_cgImageProperties;
    BOOL v7 = (cgImageProperties != 0) ^ (v5[25] == 0);
    if (cgImageProperties) {
      BOOL v8 = !v7;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if (-[NSDictionary isEqualToDictionary:](cgImageProperties, "isEqualToDictionary:"))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        v10 = +[PFMetadata differencesBetweenDictionary:self->_cgImageProperties andDictionary:v5[25]];
        if ([v10 count])
        {
          v11 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v10;
            _os_log_debug_impl(&dword_1A41FE000, v11, OS_LOG_TYPE_DEBUG, "metadata != otherMetadata: %@", buf, 0xCu);
          }
        }

        LOBYTE(v7) = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v9;
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      __int16 v21 = 2112;
      long long v22 = v16;
      id v17 = v16;
      _os_log_debug_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_DEBUG, "Root object (%@ : %@) are not equal.", buf, 0x16u);
    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImage;
  id v4 = [(PFMetadata *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 25, self->_cgImageProperties);
  [v4 setImageSource:self->_imageSource];
  objc_storeStrong(v4 + 27, self->_imageData);
  [v4 setCgImageMetadata:self->_cgImageMetadata];
  return v4;
}

- (id)ptpMediaMetadata
{
  return self->_cgImageProperties;
}

- (void)setImageSource:(CGImageSource *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  self->_imageSource = a3;
}

- (id)plistForEncoding
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImage;
  v3 = [(PFMetadata *)&v6 plistForEncoding];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:self->_cgImageProperties forKeyedSubscript:PFMetadataPlistCgImageProperties];

  return v4;
}

- (id)_imageSourceProperties
{
  if (!self->_cachedImageSourceProperties)
  {
    imageSource = self->_imageSource;
    if (imageSource)
    {
      id v4 = 0;
    }
    else
    {
      BOOL v7 = [(PFMetadata *)self fileURL];

      if (!v7) {
        goto LABEL_8;
      }
      CFURLRef v8 = [(PFMetadata *)self fileURL];
      imageSource = CGImageSourceCreateWithURL(v8, 0);

      id v4 = imageSource;
      if (!imageSource) {
        goto LABEL_8;
      }
    }
    v5 = (NSDictionary *)CGImageSourceCopyProperties(imageSource, 0);
    cachedImageSourceProperties = self->_cachedImageSourceProperties;
    self->_cachedImageSourceProperties = v5;

    self->_cachedImageSourcePrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(imageSource);
    if (v4) {
      CFRelease(v4);
    }
  }
LABEL_8:
  uint64_t v9 = self->_cachedImageSourceProperties;

  return v9;
}

- (BOOL)_hasScreenshotDimensions
{
  [(PFMetadata *)self exifPixelSize];
  double v4 = v3;
  [(PFMetadata *)self exifPixelSize];
  if (v4 == 320.0 && v5 == 480.0) {
    return 1;
  }
  if (v5 == 320.0 && v4 == 480.0) {
    return 1;
  }
  BOOL v8 = v5 == 480.0;
  if (v4 != 960.0) {
    BOOL v8 = 0;
  }
  BOOL v9 = v5 == 960.0 && v4 == 640.0;
  BOOL result = 1;
  if (!v9 && !v8 && (v4 != 768.0 || v5 != 1024.0) && (v5 != 768.0 || v4 != 1024.0) && (v4 != 1536.0 || v5 != 2048.0))
  {
    BOOL v11 = v5 == 768.0;
    BOOL v12 = v4 == 640.0;
    if (v5 != 1136.0) {
      BOOL v12 = 0;
    }
    if (v4 != 1136.0) {
      BOOL v11 = 0;
    }
    BOOL v13 = v4 == 2048.0 && v5 == 640.0;
    if (!v13
      && !v12
      && !v11
      && (v4 != 750.0 || v5 != 1334.0)
      && (v5 != 750.0 || v4 != 1334.0)
      && (v4 != 1080.0 || v5 != 1920.0)
      && (v5 != 1080.0 || v4 != 1920.0)
      && (v4 != 1242.0 || v5 != 2208.0)
      && (v5 != 1242.0 || v4 != 2208.0)
      && (v4 != 1125.0 || v5 != 2001.0)
      && (v5 != 1125.0 || v4 != 2001.0)
      && (v4 != 312.0 || v5 != 390.0)
      && (v5 != 312.0 || v4 != 390.0)
      && (v4 != 272.0 || v5 != 340.0))
    {
      BOOL v14 = v5 == 2732.0 && v4 == 2048.0;
      BOOL v15 = v4 == 2732.0 && v5 == 2048.0;
      BOOL v16 = v4 == 340.0 && v5 == 272.0;
      if (!v16 && !v14 && !v15 && (v4 != 1668.0 || v5 != 2224.0))
      {
        BOOL v17 = v5 == 1125.0;
        BOOL v18 = v4 == 1125.0;
        if (v5 != 2436.0) {
          BOOL v18 = 0;
        }
        if (v4 != 2436.0) {
          BOOL v17 = 0;
        }
        BOOL v19 = v4 == 2224.0 && v5 == 1668.0;
        if (!v19
          && !v18
          && !v17
          && (v4 != 324.0 || v5 != 394.0)
          && (v5 != 324.0 || v4 != 394.0)
          && (v4 != 368.0 || v5 != 448.0))
        {
          BOOL v20 = v5 == 1242.0;
          BOOL v21 = v4 == 1242.0;
          if (v5 != 2688.0) {
            BOOL v21 = 0;
          }
          if (v4 != 2688.0) {
            BOOL v20 = 0;
          }
          BOOL v22 = v4 == 448.0 && v5 == 368.0;
          if (!v22 && !v21 && !v20 && (v4 != 828.0 || v5 != 1792.0))
          {
            BOOL v23 = v4 == 1668.0;
            if (v5 != 2388.0) {
              BOOL v23 = 0;
            }
            BOOL v24 = v4 == 1792.0 && v5 == 828.0;
            if (!v24 && !v23) {
              return v4 == 2388.0 && v5 == 1668.0;
            }
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)_hasFFCDimensions
{
  [(PFMetadata *)self exifPixelSize];
  double v4 = v3;
  [(PFMetadata *)self exifPixelSize];
  if (v4 == 640.0 && v5 == 480.0) {
    return 1;
  }
  BOOL v7 = v5 == 640.0 && v4 == 480.0;
  if (v7 || v4 == 1280.0 && v5 == 960.0) {
    return 1;
  }
  if (v4 == 960.0) {
    return v5 == 1280.0;
  }
  return 0;
}

- (id)_formatValue:(id)a3 withPrecision:(unint64_t)a4
{
  double v5 = NSString;
  [a3 doubleValue];
  BOOL v7 = objc_msgSend(v5, "stringWithFormat:", @"%.*f", a4, v6);
  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_makeGeometryProperties
{
  return self->_cgImageProperties;
}

- (id)_makeDateTimeProperties
{
  return self->_cgImageProperties;
}

- (id)_makeGPSProperties
{
  double v3 = [(PFMetadata *)self typeVerifier];
  double v4 = [v3 valueForKey:*MEMORY[0x1E4F2FA18] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)syndicationProperties
{
  v5.receiver = self;
  v5.super_class = (Class)PFMetadataImage;
  v2 = [(PFMetadata *)&v5 syndicationProperties];
  double v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)_computeExposureTime
{
  v29[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F800];
  uint64_t v5 = *MEMORY[0x1E4F2F928];
  v29[0] = *MEMORY[0x1E4F2F800];
  v29[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  BOOL v7 = [v6 componentsJoinedByString:@"."];
  BOOL v8 = [v3 valueForKeyPath:v7 fromProperties:self->_cgImageProperties];
  BOOL v9 = [v8 objectAtIndex:1];

  if (v9) {
    goto LABEL_3;
  }
  v10 = [(PFMetadata *)self typeVerifier];
  uint64_t v11 = *MEMORY[0x1E4F2F828];
  v28[0] = v4;
  v28[1] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  BOOL v13 = [v12 componentsJoinedByString:@"."];
  BOOL v9 = [v10 valueForKeyPath:v13 fromProperties:self->_cgImageProperties];

  if (v9) {
    goto LABEL_3;
  }
  BOOL v16 = [(PFMetadata *)self typeVerifier];
  uint64_t v17 = *MEMORY[0x1E4F2F920];
  v27[0] = v4;
  v27[1] = v17;
  BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  BOOL v19 = [v18 componentsJoinedByString:@"."];
  BOOL v14 = [v16 valueForKeyPath:v19 fromProperties:self->_cgImageProperties];

  if (!v14)
  {
    BOOL v9 = 0;
    goto LABEL_77;
  }
  [v14 doubleValue];
  double v21 = v20;
  double v22 = exp2(-v20);
  double v23 = 1.0 / v22;
  if (v21 == floor(v21))
  {
    if (v23 > 1.0) {
      double v22 = v22 * 1.024;
    }
    if (v22 == 0.016) {
      double v22 = 0.0166666667;
    }
    double v24 = 0.0333333333;
    if (v22 != 0.032) {
      double v24 = v22;
    }
    if (v24 != 0.064) {
      goto LABEL_75;
    }
  }
  else
  {
    if (v23 > 3100.0 && v23 < 3300.0)
    {
      double v24 = 0.0003125;
      goto LABEL_75;
    }
    if (v23 > 2400.0 && v23 < 2600.0)
    {
      double v24 = 0.0004;
      goto LABEL_75;
    }
    if (v23 > 1500.0 && v23 < 1700.0)
    {
      double v24 = 0.000625;
      goto LABEL_75;
    }
    if (v23 > 1100.0 && v23 < 1300.0)
    {
      double v24 = 0.0008;
      goto LABEL_75;
    }
    if (v23 > 700.0 && v23 < 900.0)
    {
      double v24 = 0.00125;
      goto LABEL_75;
    }
    if (v23 > 600.0 && v23 < 700.0)
    {
      double v24 = 0.0015625;
      goto LABEL_75;
    }
    if (v23 > 350.0 && v23 < 450.0)
    {
      double v24 = 0.0025;
      goto LABEL_75;
    }
    if (v23 > 300.0 && v23 < 350.0)
    {
      double v24 = 0.003125;
      goto LABEL_75;
    }
    if (v23 > 175.0 && v23 < 225.0)
    {
      double v24 = 0.005;
      goto LABEL_75;
    }
    if (v23 > 150.0 && v23 < 170.0)
    {
      double v24 = 0.00625;
      goto LABEL_75;
    }
    if (v23 > 115.0 && v23 < 135.0)
    {
      double v24 = 0.008;
      goto LABEL_75;
    }
    if (v23 > 90.0 && v23 < 110.0)
    {
      double v24 = 0.01;
      goto LABEL_75;
    }
    if (v23 > 70.0 && v23 < 90.0)
    {
      double v24 = 0.0125;
      goto LABEL_75;
    }
    if (v23 > 55.0 && v23 < 65.0)
    {
      double v24 = 0.0166666667;
      goto LABEL_75;
    }
    if (v23 > 45.0 && v23 < 55.0)
    {
      double v24 = 0.02;
      goto LABEL_75;
    }
    if (v23 > 35.0 && v23 < 45.0)
    {
      double v24 = 0.025;
      goto LABEL_75;
    }
    if (v23 > 27.0 && v23 < 33.0)
    {
      double v24 = 0.0333333333;
      goto LABEL_75;
    }
    if (v23 > 23.0 && v23 < 27.0)
    {
      double v24 = 0.04;
      goto LABEL_75;
    }
    if (v23 > 18.0 && v23 < 22.0)
    {
      double v24 = 0.05;
      goto LABEL_75;
    }
    if (v23 <= 14.0 || v23 >= 17.0)
    {
      if (v23 <= 12.0 || v23 >= 14.0)
      {
        if (v23 <= 9.0 || v23 >= 11.0)
        {
          if (v23 <= 6.0 || v23 >= 7.0)
          {
            if (v23 <= 5.0 || v23 >= 6.0)
            {
              if (v23 <= 3.0 || v23 >= 4.0)
              {
                if (v23 <= 2.3 || v23 >= 3.0)
                {
                  BOOL v25 = v23 < 1.0;
                  double v24 = v22;
                  if (v25)
                  {
                    if (v22 <= 27.0 || (double v24 = 30.0, v22 >= 33.0))
                    {
                      if (v22 <= 23.0 || (double v24 = 25.0, v22 >= 27.0))
                      {
                        if (v22 <= 18.0 || (double v24 = 20.0, v22 >= 22.0))
                        {
                          if (v22 <= 14.0 || (double v24 = 15.0, v22 >= 17.0))
                          {
                            if (v22 <= 12.0 || (double v24 = 13.0, v22 >= 14.0))
                            {
                              if (v22 <= 9.0 || (double v24 = 10.0, v22 >= 11.0))
                              {
                                double v24 = 6.0;
                                if (v22 <= 6.0 || v22 >= 7.0)
                                {
                                  double v24 = 5.0;
                                  if (v22 <= 5.0 || v22 >= 6.0)
                                  {
                                    double v24 = 3.0;
                                    if (v22 <= 3.0 || v22 >= 4.0)
                                    {
                                      BOOL v26 = v22 >= 3.0 || v22 <= 2.3;
                                      double v24 = 2.5;
                                      if (v26) {
                                        double v24 = v22;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                else
                {
                  double v24 = 0.4;
                }
              }
              else
              {
                double v24 = 0.333333333;
              }
            }
            else
            {
              double v24 = 0.2;
            }
          }
          else
          {
            double v24 = 0.166666667;
          }
        }
        else
        {
          double v24 = 0.1;
        }
      }
      else
      {
        double v24 = 0.0769230769;
      }
      goto LABEL_75;
    }
  }
  double v24 = 0.0666666667;
LABEL_75:
  BOOL v9 = [NSNumber numberWithDouble:v24];

  if (v9)
  {
LABEL_3:
    BOOL v14 = [(PFMetadataImage *)self _formatValue:v9 withPrecision:8];
    char v15 = 0;
    goto LABEL_4;
  }
  BOOL v14 = 0;
LABEL_77:
  char v15 = 1;
LABEL_4:
  objc_storeStrong((id *)&self->_exposureTime, v14);
  if ((v15 & 1) == 0) {
}
  }

- (void)_computeCameraSerialNumber
{
  v14[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadata *)self typeVerifier];
  v14[0] = *MEMORY[0x1E4F2F800];
  v14[1] = @"CameraSerialNumber";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v5 = [v4 componentsJoinedByString:@"."];
  uint64_t v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  if (!v6)
  {
    BOOL v7 = [(PFMetadata *)self typeVerifier];
    uint64_t v8 = *MEMORY[0x1E4F2F7A0];
    v13[0] = *MEMORY[0x1E4F2F6D8];
    v13[1] = v8;
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v10 = [v9 componentsJoinedByString:@"."];
    uint64_t v6 = [v7 valueForKeyPath:v10 fromProperties:self->_cgImageProperties];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v6 stringValue];

    uint64_t v6 = (void *)v11;
  }
  cameraSerialNumber = self->_cameraSerialNumber;
  self->_cameraSerialNumber = (NSString *)v6;
}

- (void)_computeISOSetting
{
  v37[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F800];
  uint64_t v5 = *MEMORY[0x1E4F2F8E8];
  v37[0] = *MEMORY[0x1E4F2F800];
  v37[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  BOOL v7 = [v6 componentsJoinedByString:@"."];
  uint64_t v8 = [v3 valueForKeyPath:v7 fromProperties:self->_cgImageProperties];
  iso = self->_iso;
  self->_iso = v8;

  if (!self->_iso)
  {
    v10 = [(PFMetadata *)self typeVerifier];
    uint64_t v11 = *MEMORY[0x1E4F2FC60];
    v36[0] = *MEMORY[0x1E4F2FC48];
    v36[1] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    BOOL v13 = [v12 componentsJoinedByString:@"."];
    BOOL v14 = [v10 valueForKeyPath:v13 fromProperties:self->_cgImageProperties];

    if (v14)
    {
      uint64_t v15 = [v14 count];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = [(PFMetadata *)self typeVerifier];
        BOOL v18 = [v17 valueAtIndex:v16 - 1 forKey:v11 fromArray:v14];
        BOOL v19 = self->_iso;
        self->_iso = v18;
      }
    }

    if (!self->_iso)
    {
      double v20 = [(PFMetadata *)self typeVerifier];
      uint64_t v21 = *MEMORY[0x1E4F2F870];
      v35[0] = v4;
      v35[1] = v21;
      double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      double v23 = [v22 componentsJoinedByString:@"."];
      double v24 = [v20 valueForKeyPath:v23 fromProperties:self->_cgImageProperties];
      BOOL v25 = self->_iso;
      self->_iso = v24;

      if (!self->_iso)
      {
        BOOL v26 = [(PFMetadata *)self typeVerifier];
        uint64_t v27 = *MEMORY[0x1E4F2F878];
        v34[0] = v4;
        v34[1] = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        v29 = [v28 componentsJoinedByString:@"."];
        v30 = [v26 valueForKeyPath:v29 fromProperties:self->_cgImageProperties];

        if (v30)
        {
          if ([v30 count])
          {
            v31 = [(PFMetadata *)self typeVerifier];
            v32 = [v31 valueAtIndex:0 forKey:v27 fromArray:v30];
            v33 = self->_iso;
            self->_iso = v32;
          }
        }
      }
    }
  }
}

- (void)_computeWhiteBalanceValue
{
  v15[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F970];
  v15[0] = *MEMORY[0x1E4F2F800];
  v15[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  if ([(NSNumber *)v7 isEqualToNumber:&unk_1EF7CA8F8])
  {
    whiteBalance = self->_whiteBalance;
    self->_whiteBalance = v7;
    BOOL v9 = v7;
LABEL_5:
    uint64_t v11 = v9;
LABEL_6:

    goto LABEL_7;
  }
  v10 = [(PFMetadataImage *)self lightSource];

  if (v10)
  {
    whiteBalance = self->_whiteBalance;
    self->_whiteBalance = v10;
    BOOL v9 = v10;
    goto LABEL_5;
  }
  BOOL v12 = [(PFMetadataImage *)self whiteBalanceIndex];
  uint64_t v11 = v12;
  if (v12)
  {
    unint64_t v13 = [(NSNumber *)v12 integerValue];
    if (v13 <= 0x15)
    {
      BOOL v14 = [NSNumber numberWithUnsignedInteger:_computeWhiteBalanceValue_canonWhiteBalance[v13]];
      whiteBalance = self->_whiteBalance;
      self->_whiteBalance = v14;
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_computeFNumberValue
{
  v21[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v5 = *MEMORY[0x1E4F2F6D0];
  v21[0] = *MEMORY[0x1E4F2F800];
  uint64_t v4 = v21[0];
  v21[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  BOOL v7 = [v6 componentsJoinedByString:@"."];
  uint64_t v8 = [v3 valueForKeyPath:v7 fromProperties:self->_cgImageProperties];

  BOOL v9 = [(PFMetadata *)self typeVerifier];
  uint64_t v10 = *MEMORY[0x1E4F2F830];
  v20[0] = v4;
  v20[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  BOOL v12 = [v11 componentsJoinedByString:@"."];
  unint64_t v13 = [v9 valueForKeyPath:v12 fromProperties:self->_cgImageProperties];

  if (v8) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [v8 doubleValue];
    double v16 = round(exp2(v15 * 0.5) * 10.0) / 10.0;
    if (v16 == 0.0)
    {
      unint64_t v13 = 0;
      goto LABEL_14;
    }
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%.8f", *(void *)&v16);
    if (v17)
    {
      unint64_t v13 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v17];
    }
    else
    {
      unint64_t v13 = 0;
    }
  }
  if (v13)
  {
    BOOL v18 = [(PFMetadataImage *)self _formatValue:v13 withPrecision:3];
    char v19 = 0;
    goto LABEL_15;
  }
LABEL_14:
  BOOL v18 = 0;
  char v19 = 1;
LABEL_15:
  objc_storeStrong((id *)&self->_fNumber, v18);
  if ((v19 & 1) == 0) {
}
  }

- (BOOL)containsCustomStylesMetadataBlob
{
  v2 = self;
  v47[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadataImage *)self _imageSourceProperties];
  if (v3)
  {
    uint64_t v4 = [(PFMetadata *)v2 typeVerifier];
    uint64_t v5 = *MEMORY[0x1E4F2FBD8];
    v47[0] = *MEMORY[0x1E4F2F978];
    v47[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    BOOL v7 = [v6 componentsJoinedByString:@"."];
    uint64_t v8 = [v4 valueForKeyPath:v7 fromProperties:v3];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v8;
    uint64_t v35 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v35)
    {
      v33 = v3;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v42;
      uint64_t v12 = *MEMORY[0x1E4F2F510];
      uint64_t v13 = *MEMORY[0x1E4F2F518];
      uint64_t v14 = *MEMORY[0x1E4F561C8];
      uint64_t v31 = *(void *)v42;
      v32 = v2;
      v34 = v9;
      uint64_t v30 = *MEMORY[0x1E4F2F510];
      do
      {
        uint64_t v15 = 0;
        double v16 = v10;
        do
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
          BOOL v18 = [(PFMetadata *)v2 typeVerifier];
          uint64_t v10 = [v18 valueForKeyPath:v12 fromProperties:v17];

          if (v10)
          {
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v19 = v10;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v38;
              while (2)
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v38 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  double v24 = [*(id *)(*((void *)&v37 + 1) + 8 * i) objectForKeyedSubscript:v13];
                  char v25 = [v24 isEqual:v14];

                  if (v25)
                  {

                    BOOL v27 = 1;
                    double v3 = v33;
                    goto LABEL_27;
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }

            uint64_t v11 = v31;
            v2 = v32;
            id v9 = v34;
            uint64_t v12 = v30;
          }
          ++v15;
          double v16 = v10;
        }
        while (v15 != v35);
        uint64_t v35 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v35);

      double v3 = v33;
    }

    BOOL v26 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A41FE000, v26, OS_LOG_TYPE_ERROR, "No custom styles metadata present.", buf, 2u);
    }
  }
  else
  {
    v28 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A41FE000, v28, OS_LOG_TYPE_ERROR, "No fileURL associated with metadata to extract custom metadata.", buf, 2u);
    }
  }
  BOOL v27 = 0;
LABEL_27:

  return v27;
}

- (int64_t)cameraUsedForCapture
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15540];
  v10[0] = *MEMORY[0x1E4F2FC20];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];
  int64_t v8 = [v7 integerValue];

  return v8;
}

- (id)imageSourceProxyData
{
  if (self->_imageSource)
  {
    CGImageSourceRef v3 = 0;
  }
  else
  {
    uint64_t v4 = [(PFMetadata *)self fileURL];

    if (v4)
    {
      CFURLRef v5 = [(PFMetadata *)self fileURL];
      CGImageSourceRef v3 = CGImageSourceCreateWithURL(v5, 0);
    }
    else
    {
      CGImageSourceRef v3 = 0;
    }
  }
  ProxyData = (void *)CGImageSourceCreateProxyData();
  if (v3) {
    CFRelease(v3);
  }

  return ProxyData;
}

- (id)credit
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FB68];
  v9[0] = *MEMORY[0x1E4F2FB80];
  v9[1] = v4;
  CFURLRef v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)generativeAIImageType
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FBA8];
  v11[0] = *MEMORY[0x1E4F2FB80];
  v11[1] = v4;
  CFURLRef v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];
  int64_t v8 = [v7 lastPathComponent];

  if ([v8 isEqualToString:@"trainedAlgorithmicMedia"]) {
    id v9 = &unk_1EF7CA8C8;
  }
  else {
    id v9 = &unk_1EF7CA8B0;
  }
  if ([v8 isEqualToString:@"compositeWithTrainedAlgorithmicMedia"]) {
    id v9 = &unk_1EF7CA8E0;
  }

  return v9;
}

- (BOOL)containsSpatialCameraHEIFMetadata
{
  v26[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FB38];
  uint64_t v5 = *MEMORY[0x1E4F2FFF0];
  v26[0] = *MEMORY[0x1E4F2FB38];
  v26[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  BOOL v7 = [v6 componentsJoinedByString:@"."];
  int64_t v8 = [v3 valueForKeyPath:v7 fromProperties:self->_cgImageProperties];

  if (v8)
  {
    id v9 = [(PFMetadata *)self typeVerifier];
    uint64_t v10 = [v9 valueForKey:*MEMORY[0x1E4F2FFC0] fromProperties:v8];

    uint64_t v11 = [(PFMetadata *)self typeVerifier];
    uint64_t v12 = [v11 valueForKey:*MEMORY[0x1E4F2FFC8] fromProperties:v8];

    if (v10) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      BOOL v14 = 0;
    }
    else
    {
      uint64_t v15 = [(PFMetadata *)self typeVerifier];
      uint64_t v16 = *MEMORY[0x1E4F2FFF8];
      v25[0] = v4;
      v25[1] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      BOOL v18 = [v17 componentsJoinedByString:@"."];
      id v19 = [v15 valueForKeyPath:v18 fromProperties:self->_cgImageProperties];

      if (v19)
      {
        uint64_t v20 = [(PFMetadata *)self typeVerifier];
        uint64_t v21 = [v20 valueForKey:*MEMORY[0x1E4F2FFE0] fromProperties:v19];

        uint64_t v22 = [(PFMetadata *)self typeVerifier];
        double v23 = [v22 valueForKey:*MEMORY[0x1E4F2FFE8] fromProperties:v19];

        BOOL v14 = 0;
        if (v21 && v23) {
          BOOL v14 = ([v23 isEqualToString:*MEMORY[0x1E4F2FFD0]] & 1) != 0
        }
             || [v23 isEqualToString:*MEMORY[0x1E4F2FFD8]];
      }
      else
      {
        BOOL v14 = 0;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_anyImageHasProcessingFlag:(unint64_t)a3
{
  if (([(PFMetadataImage *)self photoProcessingFlags] & a3) != 0) {
    return 1;
  }
  if (![(PFMetadataImage *)self imageSource]) {
    return 0;
  }
  int64_t Count = CGImageSourceGetCount([(PFMetadataImage *)self imageSource]);
  if (Count < 2) {
    return 0;
  }
  int64_t v7 = Count;
  CFDictionaryRef v8 = +[PFMetadataImage defaultOptionsForCGImageSource];
  size_t v9 = 0;
  uint64_t v10 = *MEMORY[0x1E4F2FC20];
  uint64_t v17 = *MEMORY[0x1E4F15578];
  while (1)
  {
    CFDictionaryRef v11 = CGImageSourceCopyPropertiesAtIndex([(PFMetadataImage *)self imageSource], v9, v8);
    uint64_t v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:v10];
    BOOL v13 = v12;
    if (v12)
    {
      BOOL v14 = [v12 objectForKeyedSubscript:v17];
      unsigned int v15 = [v14 unsignedIntValue];

      if ((a3 & ~(unint64_t)v15) == 0) {
        break;
      }
    }

    if (v7 == ++v9)
    {
      BOOL v5 = 0;
      goto LABEL_12;
    }
  }

  BOOL v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)isAlchemist
{
  return [(PFMetadataImage *)self _anyImageHasProcessingFlag:0x400000];
}

- (BOOL)isThreeImageStereoHEIC
{
  return [(PFMetadataImage *)self _anyImageHasProcessingFlag:0x100000];
}

- (BOOL)_isSpatialStereoGroup:(id)a3 inImageSource:(CGImageSource *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    double v24 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A41FE000, v24, OS_LOG_TYPE_ERROR, "Unexpected missing image source for spatial stereo group check", buf, 2u);
    }
    BOOL v23 = 0;
    goto LABEL_34;
  }
  int64_t v7 = [(PFMetadata *)self typeVerifier];
  CFDictionaryRef v8 = [v7 valueForKey:*MEMORY[0x1E4F2FAD8] fromProperties:v6];

  if (!v8 || ![v8 isEqualToString:*MEMORY[0x1E4F2FAE0]])
  {
    BOOL v23 = 0;
    goto LABEL_33;
  }
  size_t v9 = [(PFMetadata *)self typeVerifier];
  uint64_t v10 = *MEMORY[0x1E4F2FAB8];
  CFDictionaryRef v11 = [v9 valueForKey:*MEMORY[0x1E4F2FAB8] fromProperties:v6];

  if (!v11)
  {
    char v25 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v10;
      __int16 v37 = 2114;
      id v38 = v6;
      _os_log_impl(&dword_1A41FE000, v25, OS_LOG_TYPE_INFO, "Not recognizing stereo group as spatial because %{public}@ key is missing: %{public}@", buf, 0x16u);
    }
    BOOL v23 = 0;
    goto LABEL_32;
  }
  v29 = v11;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v12 = *MEMORY[0x1E4F2FAC8];
  v41[0] = *MEMORY[0x1E4F2FAC0];
  v41[1] = v12;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (!v13)
  {
    BOOL v23 = 1;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v32 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      BOOL v18 = [(PFMetadata *)self typeVerifier];
      id v19 = [v18 valueForKey:v17 fromProperties:v6];

      if (!v19)
      {
        BOOL v26 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = (uint64_t)v17;
          __int16 v37 = 2114;
          id v38 = v6;
          _os_log_error_impl(&dword_1A41FE000, v26, OS_LOG_TYPE_ERROR, "Unexpected missing image index key %{public}@ in stereo group: %{public}@", buf, 0x16u);
        }
        goto LABEL_30;
      }
      uint64_t v20 = [v19 unsignedIntegerValue];
      uint64_t v21 = [(PFMetadataImage *)self metadataForImagePropertiesAtIndex:v20];
      if (!v21)
      {
        BOOL v27 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v36 = v20;
          __int16 v37 = 2114;
          id v38 = v17;
          __int16 v39 = 2114;
          id v40 = v6;
          _os_log_error_impl(&dword_1A41FE000, v27, OS_LOG_TYPE_ERROR, "Unable to get image properties for image index %tu for image index key %{public}@ in stereo group: %{public}@", buf, 0x20u);
        }
        uint64_t v22 = 0;
LABEL_29:

LABEL_30:
        BOOL v23 = 0;
        goto LABEL_31;
      }
      uint64_t v22 = v21;
      if (([v21 containsSpatialCameraHEIFMetadata] & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    BOOL v23 = 1;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_31:

  CFDictionaryRef v11 = v29;
LABEL_32:

LABEL_33:
LABEL_34:

  return v23;
}

- (BOOL)isSpatialMedia
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  isSpatialMediaValue = self->_isSpatialMediaValue;
  if (!isSpatialMediaValue)
  {
    uint64_t v4 = [(PFMetadataImage *)self _imageSourceProperties];
    if (v4)
    {
      BOOL v5 = [(PFMetadataImage *)self imageSource];
      id v6 = [(PFMetadata *)self typeVerifier];
      int64_t v7 = [v6 valueForKey:*MEMORY[0x1E4F2FAF8] fromProperties:v4];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            if (-[PFMetadataImage _isSpatialStereoGroup:inImageSource:](self, "_isSpatialStereoGroup:inImageSource:", *(void *)(*((void *)&v26 + 1) + 8 * i), v5, (void)v26))
            {
              uint64_t v13 = self->_isSpatialMediaValue;
              self->_isSpatialMediaValue = (NSNumber *)MEMORY[0x1E4F1CC38];

              goto LABEL_13;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if (self->_isSpatialMediaValue) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v14 = [(PFMetadata *)self typeVerifier];
      uint64_t v15 = *MEMORY[0x1E4F2FFF0];
      v30[0] = *MEMORY[0x1E4F2FB38];
      v30[1] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      uint64_t v17 = [v16 componentsJoinedByString:@"."];
      id v8 = [v14 valueForKeyPath:v17 fromProperties:self->_cgImageProperties];

      uint64_t v18 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FFB8]];
      if (v18)
      {
        id v19 = (void *)v18;
        uint64_t v20 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FFC0]];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          uint64_t v22 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FFC8]];

          if (v22)
          {
            BOOL v23 = (NSNumber *)MEMORY[0x1E4F1CC38];
LABEL_21:
            double v24 = self->_isSpatialMediaValue;
            self->_isSpatialMediaValue = v23;

LABEL_22:
            isSpatialMediaValue = self->_isSpatialMediaValue;
            return [(NSNumber *)isSpatialMediaValue BOOLValue];
          }
        }
        else
        {
        }
      }
    }
    BOOL v23 = (NSNumber *)MEMORY[0x1E4F1CC28];
    goto LABEL_21;
  }
  return [(NSNumber *)isSpatialMediaValue BOOLValue];
}

- (id)metadataForImagePropertiesAtIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PFMetadataImage *)self imageSource];
  size_t Count = CGImageSourceGetCount(v5);
  if (Count <= a3)
  {
    size_t v11 = Count;
    uint64_t v12 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134218240;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      size_t v18 = v11;
      _os_log_error_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_ERROR, "Invalid request for per-image-index %tu sub-metadata for image source with count %tu", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v10 = 0;
  }
  else
  {
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, a3, (CFDictionaryRef)+[PFMetadataImage defaultOptionsForCGImageSource]);
    if (v7)
    {
      id v8 = [PFMetadata alloc];
      uint64_t v9 = [(PFMetadata *)self timeZoneLookup];
      uint64_t v10 = [(PFMetadata *)v8 initWithImageProperties:v7 contentType:0 timeZoneLookup:v9];
    }
    else
    {
      uint64_t v13 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134217984;
        unint64_t v16 = a3;
        _os_log_error_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_ERROR, "Unable to get per-image-index %tu properties", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (void)enumerateRawThumbnailInfoWithBlock:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, unsigned char *, double, double))a3;
  BOOL v5 = [(PFMetadataImage *)self _imageSourceProperties];
  if (v5)
  {
    id v6 = [(PFMetadata *)self typeVerifier];
    v42[0] = @"{raw}";
    v42[1] = @"Thumbnails";
    CFDictionaryRef v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    id v8 = [v7 componentsJoinedByString:@"."];
    uint64_t v32 = v5;
    uint64_t v9 = [v6 valueForKeyPath:v8 fromProperties:v5];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v34 = *MEMORY[0x1E4F2FDD8];
      uint64_t v35 = *(void *)v38;
      uint64_t v12 = *MEMORY[0x1E4F2FB48];
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * v13);
        int v15 = [(PFMetadata *)self typeVerifier];
        unint64_t v16 = [v15 valueForKeyPath:v34 fromProperties:v14];
        [v16 floatValue];
        double v18 = v17;

        uint64_t v19 = [(PFMetadata *)self typeVerifier];
        uint64_t v20 = [v19 valueForKeyPath:v12 fromProperties:v14];
        [v20 floatValue];
        double v22 = v21;

        BOOL v23 = [(PFMetadata *)self typeVerifier];
        double v24 = [v23 valueForKeyPath:@"JPEGOffset" fromProperties:v14];
        uint64_t v25 = [v24 unsignedIntegerValue];

        long long v26 = [(PFMetadata *)self typeVerifier];
        long long v27 = [v26 valueForKeyPath:@"JPEGLength" fromProperties:v14];
        uint64_t v28 = [v27 unsignedIntegerValue];

        long long v29 = [(PFMetadata *)self typeVerifier];
        uint64_t v30 = [v29 valueForKeyPath:@"Orientation" fromProperties:v14];
        uint64_t v31 = [v30 intValue];

        char v36 = 0;
        v4[2](v4, v25, v28, v31, &v36, v18, v22);
        if (v36) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v11) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    BOOL v5 = v32;
  }
}

- (id)nrfSrlStatus
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F510B8];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (unint64_t)photosAppFeatureFlags
{
  v10[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15580];
  v10[0] = *MEMORY[0x1E4F2FC20];
  v10[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (id)smartStyleExpectingReversibility
{
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesIsExpectingReversibility;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)smartStyleIsReversible
{
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesIsReversible;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (signed)smartStyleCast
{
  v2 = self;
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesCast;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:v2->_cgImageProperties];
  LOWORD(v2) = [v6 intValue];

  return (__int16)v2;
}

- (id)smartStyleIntensity
{
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesIntensity;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)smartStyleColorBias
{
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesColorBias;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)smartStyleToneBias
{
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesToneBias;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)smartStyleRenderingVersion
{
  v8[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  v8[2] = kPFImagePropertyMakerAppleSmartStylesRenderingVersion;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (BOOL)hasSmartStyle
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2FC20];
  v8[1] = kPFImagePropertyMakerAppleSmartStyles;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6 != 0;
}

- (BOOL)isProRAW
{
  return ([(PFMetadataImage *)self photoProcessingFlags] >> 16) & 1;
}

- (id)semanticStylePreset
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F155A8];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E4F155B0];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)semanticStyleRenderingVersion
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F155A8];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E4F155B8];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)semanticStyleWarmthBias
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F155A8];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E4F155C8];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)semanticStyleToneBias
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F155A8];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  v9[2] = *MEMORY[0x1E4F155C0];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)speedRef
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FA88];
  v9[0] = *MEMORY[0x1E4F2FA18];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)imageDirectionRef
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FA38];
  v9[0] = *MEMORY[0x1E4F2FA18];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)imageDirection
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FA30];
  v9[0] = *MEMORY[0x1E4F2FA18];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)gpsHPositioningError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FA28];
  v9[0] = *MEMORY[0x1E4F2FA18];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)altitudeRef
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F9B8];
  v9[0] = *MEMORY[0x1E4F2FA18];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)HEICSDelayTime
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FB10];
  v9[0] = *MEMORY[0x1E4F2FB18];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)GIFDelayTime
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F988];
  v9[0] = *MEMORY[0x1E4F2F990];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)lightSource
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F8A8];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)profileName
{
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = [v3 valueForKey:*MEMORY[0x1E4F2FD10] fromProperties:self->_cgImageProperties];

  return v4;
}

- (id)whiteBalanceIndex
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F570];
  v9[0] = *MEMORY[0x1E4F2F548];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (NSNumber)whiteBalance
{
  whiteBalance = self->_whiteBalance;
  if (!whiteBalance)
  {
    [(PFMetadataImage *)self _computeWhiteBalanceValue];
    whiteBalance = self->_whiteBalance;
  }

  return whiteBalance;
}

- (NSNumber)exposureTime
{
  exposureTime = self->_exposureTime;
  if (!exposureTime)
  {
    [(PFMetadataImage *)self _computeExposureTime];
    exposureTime = self->_exposureTime;
  }
  [(NSNumber *)exposureTime doubleValue];
  if (v4 <= 0.0) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = self->_exposureTime;
  }

  return v5;
}

- (id)meteringMode
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F8B8];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (NSString)cameraSerialNumber
{
  cameraSerialNumber = self->_cameraSerialNumber;
  if (!cameraSerialNumber)
  {
    [(PFMetadataImage *)self _computeCameraSerialNumber];
    cameraSerialNumber = self->_cameraSerialNumber;
  }

  return cameraSerialNumber;
}

- (id)lensMaximumMM
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F700];
  v9[0] = *MEMORY[0x1E4F2F6D8];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 index:1 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)lensMinimumMM
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F700];
  v9[0] = *MEMORY[0x1E4F2F6D8];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 index:0 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)lensMake
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F888];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)lensModel
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F890];
  v13[0] = *MEMORY[0x1E4F2F800];
  v13[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  if (!v7)
  {
    unint64_t v8 = [(PFMetadata *)self typeVerifier];
    v12[0] = *MEMORY[0x1E4F2F6D8];
    v12[1] = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v10 = [v9 componentsJoinedByString:@"."];
    CFDictionaryRef v7 = [v8 valueForKeyPath:v10 fromProperties:self->_cgImageProperties];
  }

  return v7;
}

- (id)portraitInLandscapeCamera
{
  CGImageSourceRef v3 = [(PFMetadataImage *)self cameraModel];
  uint64_t v4 = [(PFMetadataImage *)self cameraMake];
  if ([v3 isEqualToString:@"Canon PowerShot S95"])
  {
    BOOL v5 = @"S95";
  }
  else if ([v4 isEqualToString:@"OLYMPUS IMAGING CORP.  "] {
         && ([v3 isEqualToString:@"E-5             "] & 1) != 0)
  }
  {
    BOOL v5 = @"OLYMPUSE5";
  }
  else if ([v3 isEqualToString:@"Canon PowerShot G12"])
  {
    BOOL v5 = @"G12";
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSNumber)iso
{
  iso = self->_iso;
  if (!iso)
  {
    [(PFMetadataImage *)self _computeISOSetting];
    iso = self->_iso;
  }

  return iso;
}

- (id)focusDistance
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2F6D8];
  v8[1] = @"FocusDistance";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)focusMode
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2F6D8];
  v8[1] = @"FocusMode";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)focusPoints
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  v8[0] = *MEMORY[0x1E4F2F6D8];
  v8[1] = @"AFInfo";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v5 = [v4 componentsJoinedByString:@"."];
  id v6 = [v3 valueForKeyPath:v5 fromProperties:self->_cgImageProperties];

  return v6;
}

- (id)digitalZoomRatio
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F808];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)focalLengthIn35mm
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F848];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)focalLength
{
  v10[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F850];
  v10[0] = *MEMORY[0x1E4F2F800];
  v10[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  if (v7)
  {
    unint64_t v8 = [(PFMetadataImage *)self _formatValue:v7 withPrecision:2];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)flashFired
{
  CGImageSourceRef v3 = [(PFMetadataImage *)self flashCompensation];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PFMetadataImage *)self flashValue];
  }
  id v6 = v5;

  BOOL v7 = [v6 integerValue] & 1;
  return v7;
}

- (id)flashCompensation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F6E8];
  v9[0] = *MEMORY[0x1E4F2F6D8];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)flashValue
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F838];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (CGColorSpace)cgColorSpace
{
  BOOL result = self->_cgColorSpace;
  if (!result)
  {
    BOOL result = [(PFMetadataImage *)self _imageSourceProperties];
    if (result)
    {
      uint64_t v4 = result;
      id v5 = [(CGColorSpace *)result objectForKeyedSubscript:*MEMORY[0x1E4F2F978]];
      if (!v5)
      {

        return 0;
      }
      id v6 = v5;
      BOOL v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FBD8]];
      unint64_t v8 = v7;
      if (v7 && [v7 count])
      {
        unint64_t cachedImageSourcePrimaryImageIndex = self->_cachedImageSourcePrimaryImageIndex;
        if (cachedImageSourcePrimaryImageIndex >= [v8 count]) {
          unint64_t v10 = 0;
        }
        else {
          unint64_t v10 = self->_cachedImageSourcePrimaryImageIndex;
        }
        uint64_t v12 = [v8 objectAtIndexedSubscript:v10];
        CFStringRef v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F2FC90]];
        uint64_t v14 = (__CFString *)v13;
        if (v13)
        {
          int v11 = 0;
          self->_cgColorSpace = CGColorSpaceCreateWithName(v13);
        }
        else
        {
          int v11 = 1;
        }
      }
      else
      {
        int v11 = 1;
      }

      if (v11) {
        return 0;
      }
      return self->_cgColorSpace;
    }
  }
  return result;
}

- (id)brightness
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F7B0];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)exposureBias
{
  v10[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F810];
  v10[0] = *MEMORY[0x1E4F2F800];
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  if (v7)
  {
    unint64_t v8 = [(PFMetadataImage *)self _formatValue:v7 withPrecision:2];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (NSNumber)fNumber
{
  fNumber = self->_fNumber;
  if (!fNumber)
  {
    [(PFMetadataImage *)self _computeFNumberValue];
    fNumber = self->_fNumber;
  }
  [(NSNumber *)fNumber doubleValue];
  if (v4 <= 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = self->_fNumber;
  }

  return v5;
}

- (id)firmware
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F6E0];
  v9[0] = *MEMORY[0x1E4F2F6D8];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)ownerName
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F718];
  v9[0] = *MEMORY[0x1E4F2F6D8];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v5 componentsJoinedByString:@"."];
  BOOL v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (void)setCgImageMetadata:(CGImageMetadata *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  cgImageMetadata = self->_cgImageMetadata;
  if (cgImageMetadata) {
    CFRelease(cgImageMetadata);
  }
  self->_cgImageMetadata = a3;
}

- (id)hdrGainMap
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  CFStringRef v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__6379;
  unint64_t v16 = __Block_byref_object_dispose__6380;
  id v17 = 0;
  CGImageSourceRef v3 = [(PFMetadata *)self fileURL];

  if (v3)
  {
    uint64_t v4 = [(PFMetadata *)self fileURL];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__PFMetadataImage_hdrGainMap__block_invoke;
    void v10[3] = &unk_1E5B2E158;
    v10[5] = &v12;
    id v11 = 0;
    v10[4] = self;
    BOOL v5 = +[PFMediaUtilities enumerateImageSourceIndexesOfFileAtURL:v4 error:&v11 block:v10];
    id v6 = v11;

    if (!v5)
    {
      BOOL v7 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_error_impl(&dword_1A41FE000, v7, OS_LOG_TYPE_ERROR, "Failed to get HDR gain map from auxiliary image (Error: %@)", buf, 0xCu);
      }
    }
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __29__PFMetadataImage_hdrGainMap__block_invoke(uint64_t a1, CGImageSourceRef isrc, size_t index, unsigned char *a4)
{
  uint64_t v6 = *MEMORY[0x1E4F2F3C0];
  CFDictionaryRef v7 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(isrc, index, (CFStringRef)*MEMORY[0x1E4F2F3C0]);
  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    unint64_t v10 = [*(id *)(a1 + 32) typeVerifier];
    uint64_t v11 = [v10 verifiedImageValue:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:v6];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    CFStringRef v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

- (int64_t)customRendered
{
  v10[2] = *MEMORY[0x1E4F143B8];
  CGImageSourceRef v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F7E0];
  v10[0] = *MEMORY[0x1E4F2F800];
  v10[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  CFDictionaryRef v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];
  int64_t v8 = [v7 integerValue];

  return v8;
}

- (BOOL)isScreenshot
{
  BOOL v3 = [(PFMetadataImage *)self isImage];
  if (v3)
  {
    uint64_t v4 = [(PFMetadataImage *)self userComment];
    char v5 = [v4 isEqualToString:@"Screenshot"];

    if (v5)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      uint64_t v6 = [(PFMetadata *)self contentType];
      int v7 = [v6 conformsToType:*MEMORY[0x1E4F44460]];

      if (v7)
      {
        LOBYTE(v3) = [(PFMetadataImage *)self _hasScreenshotDimensions];
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (BOOL)isDeferredPhotoProxyExpectingDepth
{
  LODWORD(v3) = [(PFMetadataImage *)self isDeferredPhotoProxy];
  if (v3) {
    return ([(PFMetadataImage *)self photoCaptureFlags] >> 11) & 1;
  }
  return v3;
}

- (BOOL)isDeferredPhotoProxy
{
  return ([(PFMetadataImage *)self photoProcessingFlags] >> 12) & 1;
}

- (BOOL)hasDepthDataAndIsNotRenderedSDOF
{
  if (([(PFMetadataImage *)self photoProcessingFlags] & 0x60) != 0) {
    return ![(PFMetadataImage *)self isSDOF];
  }
  else {
    return 0;
  }
}

- (BOOL)isPortrait
{
  if (([(PFMetadataImage *)self photoProcessingFlags] & 0x60) != 0) {
    return 1;
  }

  return [(PFMetadataImage *)self isSDOF];
}

- (BOOL)isPanorama
{
  return ([(PFMetadataImage *)self photoProcessingFlags] & 0x100) != 0
      || [(PFMetadataImage *)self customRendered] == 6;
}

- (unint64_t)photoCaptureFlags
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F51108];
  v10[0] = *MEMORY[0x1E4F2FC20];
  v10[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (unint64_t)photoProcessingFlags
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15578];
  v10[0] = *MEMORY[0x1E4F2FC20];
  v10[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (id)photoProcessingIdentifier
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F510D0];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)imageCaptureRequestIdentifier
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F51078];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)deferredPhotoProcessingIdentifier
{
  BOOL v3 = [(PFMetadataImage *)self imageCaptureRequestIdentifier];
  uint64_t v4 = [(PFMetadataImage *)self photoProcessingIdentifier];
  char v5 = (void *)v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    int v7 = [v3 stringByAppendingString:@"/"];
    uint64_t v6 = [v7 stringByAppendingString:v5];
  }

  return v6;
}

- (id)groupingUuid
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15550];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)burstUuid
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15538];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)userComment
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2F958];
  v9[0] = *MEMORY[0x1E4F2F800];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (BOOL)isPhotoBooth
{
  v2 = [(PFMetadataImage *)self keywords];
  char v3 = [v2 containsObject:@"Photo Booth"];

  return v3;
}

- (BOOL)isFrontFacingCamera
{
  int64_t v3 = [(PFMetadataImage *)self cameraUsedForCapture];
  if ((unint64_t)(v3 - 5) >= 2)
  {
    if (v3) {
      return 0;
    }
    char v5 = [(PFMetadataImage *)self lensMake];
    uint64_t v6 = [(PFMetadataImage *)self lensModel];
    int v7 = [v6 lowercaseString];

    if (v5 && v7)
    {
      if ([v5 isEqualToString:@"Apple"]
        && [v7 containsString:@"front"])
      {
        char v4 = [v7 containsString:@"camera"];
LABEL_14:

        return v4;
      }
    }
    else
    {
      unint64_t v8 = [(PFMetadataImage *)self cameraMake];
      if ([v8 isEqualToString:@"Apple"])
      {
        char v4 = [(PFMetadataImage *)self _hasFFCDimensions];

        goto LABEL_14;
      }
    }
    char v4 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (id)keywords
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FBC0];
  v9[0] = *MEMORY[0x1E4F2FB80];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (BOOL)isSDOF
{
  return (unint64_t)([(PFMetadataImage *)self customRendered] - 7) < 2;
}

- (id)title
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FBC8];
  v9[0] = *MEMORY[0x1E4F2FB80];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)hdrGainMapPercentageValue
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F510A0];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (BOOL)hasHDRGainMap
{
  v2 = [(PFMetadataImage *)self hdrGainMapPercentageValue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hdrGain
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F51098];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  int v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (BOOL)hasISOGainMap
{
  v2 = self;
  v42[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadataImage *)self _imageSourceProperties];
  if (v3)
  {
    uint64_t v4 = [(PFMetadata *)v2 typeVerifier];
    uint64_t v5 = *MEMORY[0x1E4F2FBD8];
    v42[0] = *MEMORY[0x1E4F2F978];
    v42[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    int v7 = [v6 componentsJoinedByString:@"."];
    uint64_t v31 = v3;
    unint64_t v8 = [v4 valueForKeyPath:v7 fromProperties:v3];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v8;
    uint64_t v30 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v30)
    {
      uint64_t v10 = *(void *)v37;
      uint64_t v11 = *MEMORY[0x1E4F2F510];
      uint64_t v12 = *MEMORY[0x1E4F2F518];
      uint64_t v13 = *MEMORY[0x1E4F2F3C8];
      uint64_t v28 = *(void *)v37;
      long long v29 = v2;
      uint64_t v27 = *MEMORY[0x1E4F2F510];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * v14);
          unint64_t v16 = [(PFMetadata *)v2 typeVerifier];
          id v17 = [v16 valueForKeyPath:v11 fromProperties:v15];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v33;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v33 != v21) {
                  objc_enumerationMutation(v18);
                }
                BOOL v23 = [*(id *)(*((void *)&v32 + 1) + 8 * i) objectForKeyedSubscript:v12];
                char v24 = [v23 isEqual:v13];

                if (v24)
                {

                  BOOL v25 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          ++v14;
          v2 = v29;
          uint64_t v11 = v27;
          uint64_t v10 = v28;
        }
        while (v14 != v30);
        BOOL v25 = 0;
        uint64_t v30 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v30);
    }
    else
    {
      BOOL v25 = 0;
    }
LABEL_21:

    BOOL v3 = v31;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)isHDR_ExtendedRange
{
  BOOL v3 = [(PFMetadataImage *)self cgColorSpace];
  if (v3)
  {
    return CGColorSpaceUsesExtendedRange(v3);
  }
  else
  {
    uint64_t v5 = [(PFMetadata *)self contentType];
    if (v5
      && (+[PFUniformTypeUtilities openEXRImageType],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v5 conformsToType:v6],
          v6,
          (v7 & 1) != 0))
    {
      char v8 = 1;
    }
    else
    {
      id v9 = [(PFMetadata *)self typeVerifier];
      uint64_t v10 = [v9 valueForKey:*MEMORY[0x1E4F2FBE0] fromProperties:self->_cgImageProperties];

      char v8 = [v10 BOOLValue];
    }

    return v8;
  }
}

- (BOOL)isHDR_TS22028_5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadataImage *)self cgColorSpace];
  if (v3)
  {
    return CGColorSpaceUsesITUR_2100TF(v3);
  }
  else
  {
    uint64_t v5 = [(PFMetadataImage *)self profileName];
    if (v5
      && (long long v13 = 0u,
          long long v14 = 0u,
          long long v11 = 0u,
          long long v12 = 0u,
          (uint64_t v6 = [&unk_1EF7CADA8 countByEnumeratingWithState:&v11 objects:v15 count:16]) != 0))
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(&unk_1EF7CADA8);
          }
          if ([v5 containsString:*(void *)(*((void *)&v11 + 1) + 8 * i)])
          {
            BOOL v10 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v7 = [&unk_1EF7CADA8 countByEnumeratingWithState:&v11 objects:v15 count:16];
        BOOL v10 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
LABEL_17:

    return v10;
  }
}

- (BOOL)_customRenderedIsHDR
{
  return ([(PFMetadataImage *)self customRendered] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isHDR
{
  if ([(PFMetadataImage *)self _customRenderedIsHDR]
    || ([(PFMetadataImage *)self isHDR_TS22028] & 1) != 0)
  {
    return 1;
  }

  return [(PFMetadataImage *)self isHDR_ExtendedRange];
}

- (BOOL)isSpatialOverCapture
{
  return ([(PFMetadataImage *)self photoProcessingFlags] >> 11) & 1;
}

- (id)spatialOverCaptureIdentifier
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15608];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)artworkContentDescription
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FB98];
  v9[0] = *MEMORY[0x1E4F2FB80];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)captionAbstract
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FB58];
  v9[0] = *MEMORY[0x1E4F2FB80];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)renderOriginatingAssetIdentifier
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15598];
  v10[0] = *MEMORY[0x1E4F2FC20];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  uint64_t v8 = [(id)objc_opt_class() stringByRemovingImageIoDotSuffixFromString:v7];

  return v8;
}

- (id)originatingAssetIdentifier
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15588];
  v10[0] = *MEMORY[0x1E4F2FC20];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  uint64_t v8 = [(id)objc_opt_class() stringByRemovingImageIoDotSuffixFromString:v7];

  return v8;
}

- (id)software
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FD88];
  v9[0] = *MEMORY[0x1E4F2FD40];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)cameraModel
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FD68];
  v9[0] = *MEMORY[0x1E4F2FD40];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)cameraMake
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F2FD60];
  v9[0] = *MEMORY[0x1E4F2FD40];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)playbackVariation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15590];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (id)livePhotoPairingIdentifier
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PFMetadata *)self typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15530];
  v9[0] = *MEMORY[0x1E4F2FC20];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 valueForKeyPath:v6 fromProperties:self->_cgImageProperties];

  return v7;
}

- (BOOL)isImage
{
  return 1;
}

- (BOOL)_configureWithImageProperties:(id)a3
{
  p_cgImageProperties = &self->_cgImageProperties;
  objc_storeStrong((id *)&self->_cgImageProperties, a3);
  [(PFMetadata *)self setSourceType:4];
  return *p_cgImageProperties != 0;
}

- (BOOL)sourceIsImageSourceProxy
{
  if ([(PFMetadata *)self sourceType] != 3 || ![(PFMetadataImage *)self imageSource]) {
    return 0;
  }

  return MEMORY[0x1F40E9A58]();
}

- (BOOL)_configureWithImageSource:(CGImageSource *)a3 cacheImageSource:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    uint64_t v7 = CGImageSourceGetType(a3);
    if (v7
      && ([MEMORY[0x1E4F442D8] typeWithIdentifier:v7],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 conformsToType:*MEMORY[0x1E4F44498]],
          v8,
          (v9 & 1) != 0))
    {
      size_t PrimaryImageIndex = 0;
    }
    else
    {
      size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
    }
    CFDictionaryRef v11 = +[PFMetadataImage defaultOptionsForCGImageSource];
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(a3, PrimaryImageIndex, v11);
    long long v13 = (void *)[(__CFDictionary *)v12 mutableCopy];

    BOOL v14 = [(PFMetadataImage *)self _configureWithImageProperties:v13];
    if (v14)
    {
      self->_unint64_t cachedImageSourcePrimaryImageIndex = PrimaryImageIndex;
      if (v4) {
        [(PFMetadataImage *)self setImageSource:a3];
      }
      if ([(PFMetadata *)self shouldLookForXmpSidecar])
      {
        uint64_t v15 = (void *)CGImageSourceCopyMetadataPropertiesAtIndex();
        if (v15)
        {
          uint64_t v16 = CGImageMetadataCreateFromMetadataProperties();
          if (v16)
          {
            id v17 = (const void *)v16;
            [(PFMetadataImage *)self setCgImageMetadata:v16];
            CFRelease(v17);
          }
        }
      }
    }
    [(PFMetadata *)self setSourceType:3];
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)_configureWithImageData:(id)a3 cacheImageSource:(BOOL)a4 cacheImageData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  CFDataRef v9 = (const __CFData *)a3;
  if (v9)
  {
    BOOL v10 = +[PFMetadataImage defaultOptionsForCGImageSource];
    CFDictionaryRef v11 = (void *)[v10 mutableCopy];

    CFDictionaryRef v12 = [(PFMetadata *)self contentType];

    if (v12)
    {
      long long v13 = [(PFMetadata *)self contentType];
      BOOL v14 = [v13 identifier];
      [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2FF78]];
    }
    CGImageSourceRef v15 = CGImageSourceCreateWithData(v9, (CFDictionaryRef)v11);
    if (v15)
    {
      CGImageSourceRef v16 = v15;
      BOOL v17 = [(PFMetadataImage *)self _configureWithImageSource:v15 cacheImageSource:v6];
      if (v17 && v5) {
        objc_storeStrong((id *)&self->_imageData, a3);
      }
      CFRelease(v16);
    }
    else
    {
      LOBYTE(v17) = 0;
    }
    [(PFMetadata *)self setSourceType:2];
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)_configureWithImageURL:(id)a3 cacheImageSource:(BOOL)a4 cacheImageData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    [(PFMetadata *)self setFileURL:v8];
    if ([(PFMetadata *)self noFileAccess])
    {
      CFDataRef v9 = [(PFMetadata *)self contentType];

      if (!v9)
      {
        id v42 = 0;
        BOOL v10 = +[PFUniformTypeUtilities typeForURL:v8 error:&v42];
        id v11 = v42;
        [(PFMetadata *)self setContentType:v10];

        CFDictionaryRef v12 = [(PFMetadata *)self contentType];

        if (!v12)
        {
          long long v13 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
          {
            v43.st_dev = 138412290;
            *(void *)&v43.st_mode = v11;
            _os_log_error_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_ERROR, "Failed to get a content type (%@)", (uint8_t *)&v43, 0xCu);
          }
        }
      }
    }
    BOOL v14 = [(PFMetadata *)self fileSystemProperties];
    CGImageSourceRef v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
    uint64_t v16 = [v15 unsignedLongLongValue];

    if ([(PFMetadata *)self useJpegFastPath])
    {
      if (v16)
      {
        uint64_t v17 = [(PFMetadata *)self contentType];
        if (v17)
        {
          id v18 = (void *)v17;
          uint64_t v19 = [(PFMetadata *)self contentType];
          if ([v19 conformsToType:*MEMORY[0x1E4F44410]])
          {

            if (!v6 && !v5)
            {
              uint64_t v20 = [v8 path];
              uint64_t v21 = (void *)CopyMetadataFromFileAtPath();
              double v22 = (void *)[v21 mutableCopy];

              BOOL v23 = [(PFMetadataImage *)self _configureWithImageProperties:v22];
LABEL_40:

              [(PFMetadata *)self setSourceType:1];
              goto LABEL_41;
            }
          }
          else
          {
          }
        }
      }
    }
    char v24 = +[PFMetadataImage defaultOptionsForCGImageSource];
    double v22 = (void *)[v24 mutableCopy];

    if ([(PFMetadata *)self shouldLookForXmpSidecar])
    {
      BOOL v25 = [v8 path];
      long long v26 = [v25 stringByDeletingPathExtension];

      uint64_t v27 = [v26 stringByAppendingPathExtension:@"xmp"];
      memset(&v43, 0, sizeof(v43));
      id v28 = v27;
      if (!stat((const char *)[v28 fileSystemRepresentation], &v43) && (__int16)v43.st_mode < 0
        || ([v26 stringByAppendingPathExtension:@"XMP"],
            long long v29 = objc_claimAutoreleasedReturnValue(),
            v28,
            memset(&v43, 0, sizeof(v43)),
            id v28 = v29,
            uint64_t v30 = 0,
            !stat((const char *)[v28 fileSystemRepresentation], &v43))
        && (__int16)v43.st_mode < 0)
      {
        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v28];
        if (v30)
        {
          if (*MEMORY[0x1E4F2FF98]) {
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v30);
          }
        }
      }
    }
    if (v5 && ![(PFMetadata *)self noFileAccess])
    {
      id v41 = 0;
      long long v35 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:1 error:&v41];
      id v36 = v41;
      BOOL v23 = [(PFMetadataImage *)self _configureWithImageData:v35 cacheImageSource:v6 cacheImageData:1];
      if (!v23)
      {
        long long v37 = (void *)metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          long long v39 = v37;
          long long v40 = [(PFMetadata *)self contentType];
          v43.st_dev = 134218754;
          *(void *)&v43.st_mode = v35;
          WORD2(v43.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v43.st_ino + 6) = (__darwin_ino64_t)v40;
          HIWORD(v43.st_gid) = 2112;
          *(void *)&v43.st_rdev = v8;
          LOWORD(v43.st_atimespec.tv_sec) = 2112;
          *(__darwin_time_t *)((char *)&v43.st_atimespec.tv_sec + 2) = (__darwin_time_t)v36;
          _os_log_error_impl(&dword_1A41FE000, v39, OS_LOG_TYPE_ERROR, "Asked to cache image data. Unable to configure with data (%p) and contentType (%p) from path '%@'. (%@)", (uint8_t *)&v43, 0x2Au);
        }
      }
    }
    else
    {
      CGImageSourceRef v31 = CGImageSourceCreateWithURL((CFURLRef)v8, (CFDictionaryRef)v22);
      if (v31)
      {
        CGImageSourceRef v32 = v31;
        BOOL v23 = [(PFMetadataImage *)self _configureWithImageSource:v31 cacheImageSource:v6];
        if (!v23)
        {
          long long v33 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
          {
            v43.st_dev = 138412290;
            *(void *)&v43.st_mode = v8;
            _os_log_error_impl(&dword_1A41FE000, v33, OS_LOG_TYPE_ERROR, "Failed to get an image source from path '%@'", (uint8_t *)&v43, 0xCu);
          }
        }
        CFRelease(v32);
      }
      else
      {
        long long v34 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          v43.st_dev = 138412290;
          *(void *)&v43.st_mode = v8;
          _os_log_error_impl(&dword_1A41FE000, v34, OS_LOG_TYPE_ERROR, "Failed to get an image source from path '%@'", (uint8_t *)&v43, 0xCu);
        }
        BOOL v23 = 0;
      }
    }
    goto LABEL_40;
  }
  BOOL v23 = 0;
LABEL_41:

  return v23;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFMetadataImage;
  if ([(PFMetadata *)&v8 configureWithMetadataPlist:v4])
  {
    BOOL v5 = [v4 objectForKeyedSubscript:PFMetadataPlistCgImageProperties];
    BOOL v6 = [(PFMetadataImage *)self _configureWithImageProperties:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (PFMetadataImage)initWithImageProperties:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFMetadataImage;
  id v11 = [(PFMetadata *)&v14 initWithContentType:a4 options:v7 timeZoneLookup:a6];
  CFDictionaryRef v12 = v11;
  if (v11 && ![(PFMetadataImage *)v11 _configureWithImageProperties:v10])
  {

    CFDictionaryRef v12 = 0;
  }

  return v12;
}

- (PFMetadataImage)initWithImageSourceProxyOrEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PFMetadataImage *)self initWithImageSourceProxyData:v8 contentType:v9 timeZoneLookup:v10];
  CFDictionaryRef v12 = v11;
  if (v11) {
    long long v13 = v11;
  }
  else {
    long long v13 = [[PFMetadataImage alloc] initWithEncodedImagePropertyData:v8 contentType:v9 timeZoneLookup:v10];
  }
  objc_super v14 = v13;

  return v14;
}

- (PFMetadataImage)initWithImageSourceProxyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (PFMetadataImage *)CGImageSourceCreateWithProxyData();
  if (v9)
  {
    id v10 = [(PFMetadataImage *)self initWithImageSource:v9 contentType:v7 options:12 timeZoneLookup:v8 cacheImageSource:1];
    CFRelease(v9);
    self = v10;
    id v9 = self;
  }

  return v9;
}

- (PFMetadataImage)initWithEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(PFMetadata *)self initWithContentType:a4 options:12 timeZoneLookup:a5];
  if (v9)
  {
    id v16 = 0;
    id v10 = +[PFMetadata propertyListObjectFromEncodedData:v8 expectedClass:objc_opt_class() options:0 error:&v16];
    id v11 = v16;
    if (![(PFMetadataImage *)v9 _configureWithImageProperties:v10])
    {
      CFDictionaryRef v12 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        objc_super v14 = v12;
        uint64_t v15 = [v8 length];
        *(_DWORD *)buf = 134218498;
        id v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = v15;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_error_impl(&dword_1A41FE000, v14, OS_LOG_TYPE_ERROR, "failed to deserialize a property list object from plist data: %p, length: %lu, error: %{public}@", buf, 0x20u);
      }
      id v9 = 0;
    }
    [(PFMetadata *)v9 setSourceType:5];
  }
  return v9;
}

- (PFMetadataImage)initWithImageSource:(CGImageSource *)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7
{
  BOOL v7 = a7;
  id v9 = [(PFMetadata *)self initWithContentType:a4 options:a5 timeZoneLookup:a6];
  id v10 = v9;
  if (v9
    && ![(PFMetadataImage *)v9 _configureWithImageSource:a3 cacheImageSource:v7])
  {

    return 0;
  }
  return v10;
}

- (PFMetadataImage)initWithImageData:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v11 = a5;
  id v14 = a3;
  uint64_t v15 = [(PFMetadata *)self initWithContentType:a4 options:v11 timeZoneLookup:a6];
  id v16 = v15;
  if (v15
    && ![(PFMetadataImage *)v15 _configureWithImageData:v14 cacheImageSource:v9 cacheImageData:v8])
  {

    id v16 = 0;
  }

  return v16;
}

- (PFMetadataImage)initWithImageURL:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v11 = a5;
  id v14 = a3;
  uint64_t v15 = [(PFMetadata *)self initWithContentType:a4 options:v11 timeZoneLookup:a6];
  id v16 = v15;
  if (v15
    && ![(PFMetadataImage *)v15 _configureWithImageURL:v14 cacheImageSource:v9 cacheImageData:v8])
  {

    id v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  cgImageMetadata = self->_cgImageMetadata;
  if (cgImageMetadata) {
    CFRelease(cgImageMetadata);
  }
  cgColorSpace = self->_cgColorSpace;
  if (cgColorSpace) {
    CFRelease(cgColorSpace);
  }
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImage;
  [(PFMetadataImage *)&v6 dealloc];
}

+ (id)defaultOptionsForCGImageSource
{
  if (defaultOptionsForCGImageSource_onceToken[0] != -1) {
    dispatch_once(defaultOptionsForCGImageSource_onceToken, &__block_literal_global_6432);
  }
  v2 = (void *)[(id)defaultOptionsForCGImageSource_options mutableCopy];

  return v2;
}

void __49__PFMetadataImage_defaultOptionsForCGImageSource__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F2FDF8];
  v2[1] = @"kCGImageSourceKeepOriginalProfile";
  v3[0] = MEMORY[0x1E4F1CC38];
  v3[1] = MEMORY[0x1E4F1CC38];
  v2[2] = *MEMORY[0x1E4F2FF40];
  v3[2] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)defaultOptionsForCGImageSource_options;
  defaultOptionsForCGImageSource_options = v0;
}

+ (id)stringByRemovingImageIoDotSuffixFromString:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"."])
  {
    uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"." withString:&stru_1EF7AE1F8];

    id v3 = (id)v4;
  }

  return v3;
}

@end