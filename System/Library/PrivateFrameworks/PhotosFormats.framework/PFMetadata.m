@interface PFMetadata
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionForAsset:(SEL)a3;
+ (BOOL)_canEncodeInPropertyList:(id)a3;
+ (BOOL)parseISO6709String:(id)a3 outLatitude:(double *)a4 outLongitude:(double *)a5;
+ (id)_filterArray:(id)a3;
+ (id)_filterDictionary:(id)a3;
+ (id)_filterPropertyListObject:(id)a3;
+ (id)burstUuidMetadataKey;
+ (id)defaultOptionsForCGImageSource;
+ (id)differencesBetweenDictionary:(id)a3 andDictionary:(id)a4;
+ (id)encodedDataWithPropertyListObject:(id)a3;
+ (id)exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4;
+ (id)hdrGainMetadataKey;
+ (id)livePhotoPairingIdentifierMetadataIdentifier;
+ (id)livePhotoPairingIdentifierMetadataKey;
+ (id)originatingAssetIdentifierMetadataIdentifier;
+ (id)originatingAssetIdentifierMetadataKey;
+ (id)photoProcessingFlagsMetadataKey;
+ (id)photosFeatureFlagsMetadataKey;
+ (id)playbackVariationMetadataIdentifier;
+ (id)playbackVariationMetadataKey;
+ (id)propertyListObjectFromEncodedData:(id)a3 expectedClass:(Class)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)renderOriginatingAssetIdentifierMetadataIdentifier;
+ (id)renderOriginatingAssetIdentifierMetadataKey;
+ (id)spatialOverCaptureIdentifierMetadataIdentifier;
+ (id)spatialOverCaptureIdentifierMetadataKey;
+ (void)firstAudioTrackForAsset:(id)a3 resultBlock:(id)a4;
+ (void)firstVideoTrackForAsset:(id)a3 resultBlock:(id)a4;
+ (void)metadataForAsset:(id)a3 completionHandler:(id)a4;
+ (void)setDefaultTimeZoneLookup:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime;
- (BOOL)_convertTimeZoneOffsetString:(id)a3 toSeconds:(double *)a4;
- (BOOL)allowExportForProxy;
- (BOOL)configureWithMetadataPlist:(id)a3;
- (BOOL)containsCustomStylesMetadataBlob;
- (BOOL)containsSpatialCameraHEIFMetadata;
- (BOOL)doImmediateCompute;
- (BOOL)flashFired;
- (BOOL)hasCustomRendered;
- (BOOL)hasDepthDataAndIsNotRenderedSDOF;
- (BOOL)hasHDRGainMap;
- (BOOL)hasISOGainMap;
- (BOOL)hasSmartStyle;
- (BOOL)hasSpatialAudio;
- (BOOL)hasVitality;
- (BOOL)isActionCam;
- (BOOL)isAlchemist;
- (BOOL)isAnimatedImage;
- (BOOL)isAutoLivePhoto;
- (BOOL)isAutoloop;
- (BOOL)isCinematicVideo;
- (BOOL)isDecodable;
- (BOOL)isDeferredPhotoProxy;
- (BOOL)isDeferredPhotoProxyExpectingDepth;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrontFacingCamera;
- (BOOL)isHDR;
- (BOOL)isHDR_ExtendedRange;
- (BOOL)isHDR_TS22028_5;
- (BOOL)isImage;
- (BOOL)isLongExposure;
- (BOOL)isLoopingVideo;
- (BOOL)isMirror;
- (BOOL)isMovie;
- (BOOL)isPanorama;
- (BOOL)isPhotoBooth;
- (BOOL)isPlayable;
- (BOOL)isPortrait;
- (BOOL)isProRAW;
- (BOOL)isProRes;
- (BOOL)isSDOF;
- (BOOL)isSameForURL:(id)a3 andOptions:(unsigned __int16)a4;
- (BOOL)isScreenshot;
- (BOOL)isSloMo;
- (BOOL)isSpatialMedia;
- (BOOL)isSpatialOverCapture;
- (BOOL)isSyndicationOriginated;
- (BOOL)isThreeImageStereoHEIC;
- (BOOL)isTimelapse;
- (BOOL)livePhotoVitalityLimitingAllowed;
- (BOOL)noFileAccess;
- (BOOL)noOutOfProcess;
- (BOOL)shouldCreateProxy;
- (BOOL)shouldLoadTrackMetadata;
- (BOOL)shouldLoadValues;
- (BOOL)shouldLookForXmpSidecar;
- (BOOL)sourceIsImageSourceProxy;
- (BOOL)useJpegFastPath;
- (CGColorSpace)cgColorSpace;
- (CGImageMetadata)cgImageMetadata;
- (CGImageSource)imageSource;
- (CGSize)exifPixelSize;
- (CGSize)orientedPixelSize;
- (CLLocation)gpsLocation;
- (NSArray)focusPoints;
- (NSArray)keywords;
- (NSData)imageData;
- (NSData)imageSourceProxyData;
- (NSDate)creationDate;
- (NSDate)fileCreationDate;
- (NSDate)fileModificationDate;
- (NSDate)gpsDateTime;
- (NSDate)utcCreationDate;
- (NSDictionary)cgImageProperties;
- (NSDictionary)fileSystemProperties;
- (NSDictionary)hdrGainMap;
- (NSDictionary)outOfBandHints;
- (NSDictionary)syndicationProperties;
- (NSNumber)GIFDelayTime;
- (NSNumber)HEICSDelayTime;
- (NSNumber)altitude;
- (NSNumber)apacAudioTrackBedChannelCount;
- (NSNumber)apacAudioTrackChannelCount;
- (NSNumber)apacAudioTrackHoaChannelCount;
- (NSNumber)audioDataRate;
- (NSNumber)audioSampleRate;
- (NSNumber)audioTrackFormat;
- (NSNumber)audioTrackFormatFlags;
- (NSNumber)brightness;
- (NSNumber)digitalZoomRatio;
- (NSNumber)durationTimeInterval;
- (NSNumber)exposureBias;
- (NSNumber)exposureTime;
- (NSNumber)fNumber;
- (NSNumber)flashCompensation;
- (NSNumber)flashValue;
- (NSNumber)focalLength;
- (NSNumber)focalLengthIn35mm;
- (NSNumber)focusDistance;
- (NSNumber)focusMode;
- (NSNumber)generativeAIImageType;
- (NSNumber)gpsHPositioningError;
- (NSNumber)hdrGain;
- (NSNumber)hdrGainMapPercentageValue;
- (NSNumber)imageDirection;
- (NSNumber)iso;
- (NSNumber)latitude;
- (NSNumber)lensMaximumMM;
- (NSNumber)lensMinimumMM;
- (NSNumber)lightSource;
- (NSNumber)livePhotoMinimumClientVersion;
- (NSNumber)livePhotoVitalityScore;
- (NSNumber)livePhotoVitalityTransitionScore;
- (NSNumber)longitude;
- (NSNumber)meteringMode;
- (NSNumber)nominalFrameRate;
- (NSNumber)nrfSrlStatus;
- (NSNumber)playbackVariation;
- (NSNumber)semanticStylePreset;
- (NSNumber)semanticStyleRenderingVersion;
- (NSNumber)semanticStyleToneBias;
- (NSNumber)semanticStyleWarmthBias;
- (NSNumber)smartStyleColorBias;
- (NSNumber)smartStyleExpectingReversibility;
- (NSNumber)smartStyleIntensity;
- (NSNumber)smartStyleIsReversible;
- (NSNumber)smartStyleRenderingVersion;
- (NSNumber)smartStyleToneBias;
- (NSNumber)speed;
- (NSNumber)srlCompensationValue;
- (NSNumber)timeZoneOffset;
- (NSNumber)videoDataRate;
- (NSNumber)videoDynamicRange;
- (NSNumber)whiteBalance;
- (NSNumber)whiteBalanceIndex;
- (NSString)apacAudioTrackCodecProfileLevelDescription;
- (NSString)artworkContentDescription;
- (NSString)author;
- (NSString)burstUuid;
- (NSString)cameraMake;
- (NSString)cameraModel;
- (NSString)cameraSerialNumber;
- (NSString)captionAbstract;
- (NSString)captureMode;
- (NSString)colorPrimaries;
- (NSString)creationDateString;
- (NSString)credit;
- (NSString)defaultProfileName;
- (NSString)deferredPhotoProcessingIdentifier;
- (NSString)firmware;
- (NSString)firstVideoTrackCodecString;
- (NSString)firstVideoTrackFormatDebugDescription;
- (NSString)groupingUuid;
- (NSString)imageCaptureRequestIdentifier;
- (NSString)imageDirectionRef;
- (NSString)lensMake;
- (NSString)lensModel;
- (NSString)livePhotoPairingIdentifier;
- (NSString)montageString;
- (NSString)originalFileName;
- (NSString)originatingAssetIdentifier;
- (NSString)outOfBandHintsBase64String;
- (NSString)ownerName;
- (NSString)photoProcessingIdentifier;
- (NSString)portraitInLandscapeCamera;
- (NSString)profileName;
- (NSString)renderOriginatingAssetIdentifier;
- (NSString)spatialOverCaptureIdentifier;
- (NSString)speedRef;
- (NSString)timeZoneName;
- (NSString)title;
- (NSString)transferFunction;
- (NSString)userComment;
- (NSString)videoCodecName;
- (NSTimeZone)timeZone;
- (NSURL)fileURL;
- (PFHEVCProfileInformation)hevcProfileInfo;
- (PFMetadata)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithAVAsset:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadata)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadata)initWithAVURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithAVURL:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadata)initWithContentType:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithImageCaptureMovieProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithImageData:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8;
- (PFMetadata)initWithImageProperties:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6;
- (PFMetadata)initWithImageProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithImageSource:(CGImageSource *)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7;
- (PFMetadata)initWithImageSourceProxyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithImageSourceProxyOrEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithImageURL:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8;
- (PFMetadata)initWithImageURL:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
- (PFMetadata)initWithMediaURL:(id)a3 detail:(unsigned __int16)a4 timeZoneLookup:(id)a5 shouldCache:(BOOL)a6;
- (PFMetadata)initWithMediaURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5 shouldCache:(BOOL)a6;
- (PFMetadata)initWithMediaURL:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadata)initWithMetadataPlist:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadata)initWithPropertyListRepresentationData:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadata)initWithSyndicationProperties:(id)a3;
- (PFMetadataTypeVerifier)typeVerifier;
- (PFTimeZoneLookup)timeZoneLookup;
- (UTType)contentType;
- (UTType)contentTypeFromFastModernizeVideoMedia;
- (id)_dateTimeOffsetOriginalForSyndicationProperties;
- (id)_dateTimeOriginalForSyndicationProperties;
- (id)_dateTimeSubsecOriginalForSyndicationProperties;
- (id)_makeDateTimeProperties;
- (id)_makeGPSProperties;
- (id)_makeGeometryProperties;
- (id)altitudeRef;
- (id)audioBitsPerChannel;
- (id)audioBytesPerFrame;
- (id)audioBytesPerPacket;
- (id)audioChannelsPerFrame;
- (id)audioFramesPerPacket;
- (id)burstUuidMetadataKey;
- (id)ciffDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)exifAuxDictionary;
- (id)exifDictionary;
- (id)firstVideoTrackFullDebugDescription;
- (id)formatDebugDescription;
- (id)gifDictionary;
- (id)gpsDictionary;
- (id)hdrGainFromValue:(id)a3;
- (id)hdrGainMetadataKey;
- (id)initForLimitedPropertiesWithPath:(id)a3;
- (id)iptcDictionary;
- (id)jsonFormattedDescriptionWithError:(id *)a3;
- (id)livePhotoPairingIdentifierMetadataKey;
- (id)makerAppleDictionary;
- (id)makerCanonDictionary;
- (id)makerNikonDictionary;
- (id)metadataForImagePropertiesAtIndex:(unint64_t)a3;
- (id)originatingAssetIdentifierMetadataKey;
- (id)photoProcessingFlagsMetadataKey;
- (id)photosFeatureFlagsMetadataKey;
- (id)pixelHeight;
- (id)pixelWidth;
- (id)playbackVariationMetadataKey;
- (id)plistForEncoding;
- (id)propertyListRepresentationData;
- (id)ptpMediaMetadata;
- (id)renderOriginatingAssetIdentifierMetadataKey;
- (id)software;
- (id)sourceTypeName;
- (id)spatialOverCaptureIdentifierMetadataKey;
- (id)tiffDictionary;
- (int64_t)cameraUsedForCapture;
- (int64_t)creationDateSource;
- (int64_t)customRendered;
- (int64_t)orientation;
- (int64_t)sourceType;
- (int64_t)spatialVideoRecommendationForImmersiveMode;
- (opaqueCMFormatDescription)videoTrackFormatDescription;
- (signed)smartStyleCast;
- (signed)smartStyleVideoCastValue;
- (unint64_t)_stillImageProcessingFlags;
- (unint64_t)fileSize;
- (unint64_t)photoCaptureFlags;
- (unint64_t)photoProcessingFlags;
- (unint64_t)photosAppFeatureFlags;
- (unsigned)firstVideoTrackCodec;
- (unsigned)options;
- (void)_addCommonPropertiesToSyndicationProperties:(id)a3;
- (void)_addImageGPSPropertiesToSyndicationProperties:(id)a3;
- (void)_addImageLivePhotoPropertiesToSyndicationProperties:(id)a3;
- (void)_addImageMiscPropertiesToSyndicationProperties:(id)a3;
- (void)_addImagePropertiesToSyndicationProperties:(id)a3;
- (void)_addImageSemanticStylePropertiesToSyndicationProperties:(id)a3;
- (void)_addImageSmartStylePropertiesToSyndicationProperties:(id)a3;
- (void)_addMoviePropertiesToSyndicationProperties:(id)a3;
- (void)_computeAlttitude:(id)a3;
- (void)_computeGPSLocation;
- (void)_computeGPSTimeStamp:(id)a3;
- (void)_computeLattitudeLongitude:(id)a3;
- (void)_computeOrientationValue;
- (void)_computePixelWidthAndHeightValue;
- (void)_computeSpeed:(id)a3;
- (void)_computeSubSecondString:(id *)a3 timeZoneOffsetString:(id *)a4 unqualifiedDateString:(id *)a5 fromProperties:(id)a6;
- (void)_computeTimeZoneFromString:(id)a3;
- (void)_computeUnqualifiedDateFromDateString:(id)a3 subSecondString:(id)a4;
- (void)computeDateTimeValues;
- (void)computeGPSValues;
- (void)loadMetadataWithCompletionHandler:(id)a3;
- (void)setAltitude:(id)a3;
- (void)setContentType:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreationDateSource:(int64_t)a3;
- (void)setCreationDateString:(id)a3;
- (void)setFileSystemProperties:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setGpsDateTime:(id)a3;
- (void)setGpsLocation:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setOptions:(unsigned __int16)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setSpeed:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTimeZoneLookup:(id)a3;
- (void)setTypeVerifier:(id)a3;
- (void)setUtcCreationDate:(id)a3;
@end

@implementation PFMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpsDateTime, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_gpsLocation, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDateString, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_utcCreationDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_typeVerifier, 0);
  objc_storeStrong((id *)&self->_cachedTimeZoneLookup, 0);
  objc_storeStrong((id *)&self->_pixelHeight, 0);
  objc_storeStrong((id *)&self->_pixelWidth, 0);

  objc_storeStrong((id *)&self->_fileSystemProperties, 0);
}

- (BOOL)useJpegFastPath
{
  return self->_useJpegFastPath;
}

- (void)setGpsDateTime:(id)a3
{
}

- (void)setSpeed:(id)a3
{
}

- (void)setAltitude:(id)a3
{
}

- (void)setLongitude:(id)a3
{
}

- (void)setLatitude:(id)a3
{
}

- (void)setGpsLocation:(id)a3
{
}

- (void)setTimeZone:(id)a3
{
}

- (void)setCreationDateString:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (void)setCreationDateSource:(int64_t)a3
{
  self->_creationDateSource = a3;
}

- (void)setUtcCreationDate:(id)a3
{
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setContentType:(id)a3
{
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setTypeVerifier:(id)a3
{
}

- (PFMetadataTypeVerifier)typeVerifier
{
  return self->_typeVerifier;
}

- (void)setTimeZoneLookup:(id)a3
{
}

- (unsigned)options
{
  return self->_options;
}

- (void)setFileSystemProperties:(id)a3
{
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  v3 = (void (**)(void))a3;
  v4 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A41FE000, v4, OS_LOG_TYPE_ERROR, "Called on base class. This should not happen.", v5, 2u);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    v3[2](v3);
LABEL_4:
}

- (id)iptcDictionary
{
  return 0;
}

- (id)tiffDictionary
{
  return 0;
}

- (id)gpsDictionary
{
  return 0;
}

- (id)gifDictionary
{
  return 0;
}

- (id)ciffDictionary
{
  return 0;
}

- (id)makerCanonDictionary
{
  return 0;
}

- (id)makerNikonDictionary
{
  return 0;
}

- (id)makerAppleDictionary
{
  return 0;
}

- (id)exifAuxDictionary
{
  return 0;
}

- (id)exifDictionary
{
  return 0;
}

- (id)sourceTypeName
{
  int64_t v2 = [(PFMetadata *)self sourceType];
  if ((unint64_t)(v2 - 1) > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E5B2D4E8[v2 - 1];
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v4 = (PFMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    v7 = v6;
    int options = self->_options;
    if (options == v6->_options)
    {
      fileURL = self->_fileURL;
      if ((fileURL != 0) != (v6->_fileURL == 0))
      {
        if (fileURL && (-[NSURL isEqual:](self->_fileURL, "isEqual:") & 1) == 0)
        {
          v33 = (void *)metadataLog;
          if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_46;
          }
          v34 = self->_fileURL;
          v23 = v33;
          v24 = [(PFMetadata *)v7 fileURL];
          int v45 = 138412546;
          v46 = v34;
          __int16 v47 = 2112;
          v48 = v24;
          v29 = "PFMetadata object not equal: fileURL %@ != %@";
        }
        else
        {
          contentType = self->_contentType;
          if ((contentType != 0) != (v7->_contentType == 0))
          {
            if (!contentType
              || ([(PFMetadata *)v7 contentType],
                  v11 = objc_claimAutoreleasedReturnValue(),
                  char v12 = [(UTType *)contentType isEqual:v11],
                  v11,
                  (v12 & 1) != 0))
            {
              v13 = [(PFMetadata *)self fileSystemProperties];
              v14 = [(PFMetadata *)v7 fileSystemProperties];
              char v15 = (v13 == 0) ^ (v14 != 0);

              if (v15)
              {
                uint64_t v16 = [(PFMetadata *)self fileSystemProperties];
                if (!v16) {
                  goto LABEL_12;
                }
                v17 = (void *)v16;
                v18 = [(PFMetadata *)self fileSystemProperties];
                v19 = [(PFMetadata *)v7 fileSystemProperties];
                char v20 = [v18 isEqual:v19];

                if (v20)
                {
LABEL_12:
                  BOOL v21 = 1;
LABEL_47:

                  goto LABEL_48;
                }
                v44 = (void *)metadataLog;
                if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
                {
                  v36 = v44;
                  v37 = [(PFMetadata *)self fileSystemProperties];
                  v39 = [(PFMetadata *)v7 fileSystemProperties];
                  int v45 = 138412546;
                  v46 = v37;
                  __int16 v47 = 2112;
                  v48 = v39;
LABEL_51:
                  _os_log_debug_impl(&dword_1A41FE000, v36, OS_LOG_TYPE_DEBUG, "PFMetadata object not equal: fileSystemProperties %@ != %@", (uint8_t *)&v45, 0x16u);
                }
              }
              else
              {
                v35 = (void *)metadataLog;
                if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
                {
                  v36 = v35;
                  v37 = [(PFMetadata *)self fileSystemProperties];
                  if (v37) {
                    v38 = @"not nil";
                  }
                  else {
                    v38 = @"nil";
                  }
                  v39 = [(PFMetadata *)v7 fileSystemProperties];
                  if (v39) {
                    v40 = @"not nil";
                  }
                  else {
                    v40 = @"nil";
                  }
                  int v45 = 138412546;
                  v46 = v38;
                  __int16 v47 = 2112;
                  v48 = v40;
                  goto LABEL_51;
                }
              }
LABEL_46:
              BOOL v21 = 0;
              goto LABEL_47;
            }
            v41 = (void *)metadataLog;
            if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_46;
            }
            v42 = self->_contentType;
            v23 = v41;
            v24 = [(PFMetadata *)v7 contentType];
            int v45 = 138412546;
            v46 = v42;
            __int16 v47 = 2112;
            v48 = v24;
            v29 = "PFMetadata object not equal: contentType %@ != %@";
          }
          else
          {
            v30 = (void *)metadataLog;
            if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_46;
            }
            if (contentType) {
              v31 = @"not nil";
            }
            else {
              v31 = @"nil";
            }
            v23 = v30;
            v24 = [(PFMetadata *)v7 contentType];
            if (v24) {
              v32 = @"not nil";
            }
            else {
              v32 = @"nil";
            }
            int v45 = 138412546;
            v46 = v31;
            __int16 v47 = 2112;
            v48 = v32;
            v29 = "PFMetadata object not equal: contentType %@ != %@";
          }
        }
      }
      else
      {
        v26 = (void *)metadataLog;
        if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_46;
        }
        if (fileURL) {
          v27 = @"not nil";
        }
        else {
          v27 = @"nil";
        }
        v23 = v26;
        v24 = [(PFMetadata *)v7 fileURL];
        if (v24) {
          v28 = @"not nil";
        }
        else {
          v28 = @"nil";
        }
        int v45 = 138412546;
        v46 = v27;
        __int16 v47 = 2112;
        v48 = v28;
        v29 = "PFMetadata object not equal: fileURL %@ != %@";
      }
      _os_log_debug_impl(&dword_1A41FE000, v23, OS_LOG_TYPE_DEBUG, v29, (uint8_t *)&v45, 0x16u);
    }
    else
    {
      v22 = (void *)metadataLog;
      if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_46;
      }
      v23 = v22;
      PFMetadataStringForMetadataLoadOptions(options);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PFMetadataStringForMetadataLoadOptions(v7->_options);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v45 = 138412546;
      v46 = v24;
      __int16 v47 = 2112;
      v48 = v25;
      _os_log_debug_impl(&dword_1A41FE000, v23, OS_LOG_TYPE_DEBUG, "PFMetadata object not equal: detail %@ != %@", (uint8_t *)&v45, 0x16u);
    }
    goto LABEL_46;
  }
  BOOL v21 = 1;
LABEL_48:

  return v21;
}

- (id)description
{
  int64_t v2 = [(PFMetadata *)self plistForEncoding];
  v3 = [v2 description];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 40), self->_cachedTimeZoneLookup);
  *(_WORD *)(v4 + 32) = self->_options;
  objc_storeStrong((id *)(v4 + 64), self->_fileURL);
  objc_storeStrong((id *)(v4 + 72), self->_contentType);
  uint64_t v5 = [(PFMetadata *)self fileSystemProperties];
  v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  return (id)v4;
}

- (id)ptpMediaMetadata
{
  return 0;
}

- (id)jsonFormattedDescriptionWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PFMetadata *)self plistForEncoding];
  uint64_t v5 = (void *)[v4 mutableCopy];

  cleanJSON(v5);
  v11[0] = 0;
  v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:v11];
  id v7 = v11[0];
  if (v6)
  {
    v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    goto LABEL_8;
  }
  v9 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_error_impl(&dword_1A41FE000, v9, OS_LOG_TYPE_ERROR, "Invalid JSON output from metadata description. Error: %@", buf, 0xCu);
    if (a3) {
      goto LABEL_5;
    }
  }
  else if (a3)
  {
LABEL_5:
    v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (id)plistForEncoding
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  fileURL = self->_fileURL;
  if (fileURL)
  {
    uint64_t v5 = [(NSURL *)fileURL path];
    [v3 setObject:v5 forKeyedSubscript:PFMetadataPlistFilePath];
  }
  v6 = [(UTType *)self->_contentType identifier];

  if (v6)
  {
    id v7 = [(UTType *)self->_contentType identifier];
    [v3 setObject:v7 forKeyedSubscript:PFMetadataPlistContentTypeIdentifier];
  }
  v8 = [(PFMetadata *)self creationDate];

  if (v8)
  {
    v9 = [(PFMetadata *)self creationDate];
    [v3 setObject:v9 forKeyedSubscript:PFMetadataPlistCreationDate];
  }
  v10 = [(PFMetadata *)self fileSystemProperties];

  if (v10)
  {
    v11 = [(PFMetadata *)self fileSystemProperties];
    [v3 setObject:v11 forKeyedSubscript:PFMetadataPlistFileSystemProperties];
  }
  int64_t v12 = [(PFMetadata *)self orientation];
  if ((unint64_t)(v12 - 1) >= 8) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = v12;
  }

  int64_t v14 = [(PFMetadata *)self orientation];
  if ((unint64_t)(v14 - 1) >= 8) {
    int64_t v15 = 0;
  }
  else {
    int64_t v15 = v14;
  }
  uint64_t v16 = PFOrientationName_names[v15];
  [v3 setObject:v16 forKeyedSubscript:PFMetadataPlistOrientation];

  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[PFMetadata sourceType](self, "sourceType"));
  [v3 setObject:v17 forKeyedSubscript:PFMetadataPlistSourceType];

  int64_t v18 = [(PFMetadata *)self sourceType];
  if ((unint64_t)(v18 - 1) > 0xA) {
    v19 = @"Unknown";
  }
  else {
    v19 = off_1E5B2D4E8[v18 - 1];
  }
  [v3 setObject:v19 forKeyedSubscript:PFMetadataPlistSourceTypeName];
  char v20 = [NSNumber numberWithUnsignedShort:self->_options];
  [v3 setObject:v20 forKeyedSubscript:PFMetadataPlistOptions];

  BOOL v21 = PFMetadataStringForMetadataLoadOptions(self->_options);
  [v3 setObject:v21 forKeyedSubscript:PFMetadataPlistOptionsString];

  return v3;
}

- (id)propertyListRepresentationData
{
  int64_t v2 = [(PFMetadata *)self plistForEncoding];
  v3 = +[PFMetadata encodedDataWithPropertyListObject:v2];

  return v3;
}

- (id)metadataForImagePropertiesAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)hdrGainFromValue:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSNumber;
    [a3 floatValue];
    uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)_convertTimeZoneOffsetString:(id)a3 toSeconds:(double *)a4
{
  uint64_t v5 = [a3 componentsSeparatedByString:@":"];
  uint64_t v6 = [v5 count];
  if (v6 == 2)
  {
    id v7 = [v5 objectAtIndex:0];
    [v7 doubleValue];
    double v9 = v8;

    v10 = [v5 objectAtIndex:1];
    [v10 doubleValue];
    double v12 = v11;

    if (a4)
    {
      double v13 = 1.0;
      if ((uint64_t)v9 < 0) {
        double v13 = -1.0;
      }
      *a4 = v13 * (v12 * 60.0 + (double)(uint64_t)(v13 * (double)(uint64_t)v9) * 3600.0);
    }
  }

  return v6 == 2;
}

- (id)_dateTimeSubsecOriginalForSyndicationProperties
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PFMetadata *)self _makeDateTimeProperties];
  typeVerifier = self->_typeVerifier;
  uint64_t v5 = *MEMORY[0x1E4F2F950];
  v13[0] = *MEMORY[0x1E4F2F800];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v7 = [v6 componentsJoinedByString:@"."];
  double v8 = [(PFMetadataTypeVerifier *)typeVerifier valueForKeyPath:v7 fromProperties:v3];

  if (v8)
  {
    double v9 = NSNumber;
    v10 = [NSString stringWithFormat:@"0.%@", v8];
    [v10 doubleValue];
    double v11 = objc_msgSend(v9, "numberWithDouble:");
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)_dateTimeOffsetOriginalForSyndicationProperties
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PFMetadata *)self _makeDateTimeProperties];
  typeVerifier = self->_typeVerifier;
  uint64_t v5 = *MEMORY[0x1E4F2F8D0];
  v13[0] = *MEMORY[0x1E4F2F800];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v7 = [v6 componentsJoinedByString:@"."];
  double v8 = [(PFMetadataTypeVerifier *)typeVerifier valueForKeyPath:v7 fromProperties:v3];

  if (v8)
  {
    double v12 = 0.0;
    BOOL v9 = [(PFMetadata *)self _convertTimeZoneOffsetString:v8 toSeconds:&v12];
    v10 = 0;
    if (v9)
    {
      v10 = [NSNumber numberWithDouble:v12];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dateTimeOriginalForSyndicationProperties
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PFMetadata *)self _makeDateTimeProperties];
  typeVerifier = self->_typeVerifier;
  uint64_t v5 = *MEMORY[0x1E4F2F7F0];
  v11[0] = *MEMORY[0x1E4F2F800];
  v11[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v7 = [v6 componentsJoinedByString:@"."];
  double v8 = [(PFMetadataTypeVerifier *)typeVerifier valueForKeyPath:v7 fromProperties:v3];

  if (v8)
  {
    BOOL v9 = PFDateFromString(v8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_makeGeometryProperties
{
  return 0;
}

- (id)_makeDateTimeProperties
{
  return 0;
}

- (id)_makeGPSProperties
{
  return 0;
}

- (void)_computeSpeed:(id)a3
{
  id v13 = a3;
  uint64_t v4 = -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E4F2FA80]);
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
    double v8 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FA88] fromProperties:v13];
    BOOL v9 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:@"K"])
      {
        double v10 = 0.277777778;
      }
      else if ([v9 isEqualToString:@"M"])
      {
        double v10 = 0.44704;
      }
      else
      {
        int v11 = [v9 isEqualToString:@"N"];
        double v10 = 0.51444;
        if (!v11) {
          double v10 = 1.0;
        }
      }
    }
    else
    {
      double v10 = 1.0;
    }
    double v12 = [NSNumber numberWithDouble:v7 * v10];
    [(PFMetadata *)self setSpeed:v12];
  }
}

- (void)_computeAlttitude:(id)a3
{
  id v13 = a3;
  uint64_t v4 = -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E4F2F9B0]);
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
    double v8 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2F9B8] fromProperties:v13];
    BOOL v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 integerValue];
      if (v7 > 0.0 && v10 == 1) {
        double v7 = -v7;
      }
    }
    double v12 = [NSNumber numberWithDouble:v7];
    [(PFMetadata *)self setAltitude:v12];
  }
}

- (void)_computeGPSTimeStamp:(id)a3
{
  typeVerifier = self->_typeVerifier;
  uint64_t v5 = *MEMORY[0x1E4F2FA98];
  id v6 = a3;
  id v14 = [(PFMetadataTypeVerifier *)typeVerifier valueForKey:v5 fromProperties:v6];
  double v7 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2F9D0] fromProperties:v6];

  if (v7) {
    BOOL v8 = v14 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    BOOL v9 = [NSString stringWithFormat:@"%@ %@", v7, v14];
    uint64_t v10 = PFGMTTimeZone();
    PFDateFromStringTimeZoneFormat(v9, v10, @"yyyy:MM:dd HH:mm:ss.SSSS");
    int v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      double v12 = PFGMTTimeZone();
      PFDateFromStringTimeZoneFormat(v9, v12, 0);
      int v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    gpsDateTime = self->_gpsDateTime;
    self->_gpsDateTime = v11;
  }
}

- (void)_computeLattitudeLongitude:(id)a3
{
  id v25 = a3;
  uint64_t v4 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FA40] fromProperties:v25];
  uint64_t v5 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FA50] fromProperties:v25];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v4 doubleValue];
    double v9 = v8;
    [v6 doubleValue];
    double v11 = v10;
    v27.latitude = v9;
    v27.longitude = v11;
    if (CLLocationCoordinate2DIsValid(v27))
    {
      BOOL v12 = v9 != 0.0;
      if (v11 != 0.0) {
        BOOL v12 = 1;
      }
      if (v12 && (v9 != 40.0 || v11 != -100.0))
      {
        [v4 doubleValue];
        double v15 = v14;
        uint64_t v16 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FA48] fromProperties:v25];
        v17 = v16;
        if (v16 && ([v16 isEqualToString:@"S"] & (v15 > 0.0)) != 0) {
          double v15 = -v15;
        }
        int64_t v18 = [NSNumber numberWithDouble:v15];
        latitude = self->_latitude;
        self->_latitude = v18;

        [v6 doubleValue];
        double v21 = v20;
        v22 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FA58] fromProperties:v25];

        if (v22 && ([v22 isEqualToString:@"W"] & (v21 > 0.0)) != 0) {
          double v21 = -v21;
        }
        v23 = [NSNumber numberWithDouble:v21];
        longitude = self->_longitude;
        self->_longitude = v23;
      }
    }
  }
}

- (void)computeGPSValues
{
  id v3 = [(PFMetadata *)self _makeGPSProperties];
  [(PFMetadata *)self _computeLattitudeLongitude:v3];
  [(PFMetadata *)self _computeGPSTimeStamp:v3];
  [(PFMetadata *)self _computeAlttitude:v3];
  [(PFMetadata *)self _computeSpeed:v3];
}

- (void)_computeGPSLocation
{
  id v25 = [(PFMetadata *)self latitude];
  id v3 = [(PFMetadata *)self longitude];
  if (v25 && v3)
  {
    [v25 doubleValue];
    double v5 = v4;
    [v3 doubleValue];
    double v7 = v6;
    double v8 = [(PFMetadata *)self gpsHPositioningError];
    [v8 doubleValue];
    double v10 = v9;

    if (v10 == 0.0) {
      double v10 = -1.0;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    BOOL v12 = [(PFMetadata *)self altitude];
    [v12 doubleValue];
    double v14 = v13;
    double v15 = [(PFMetadata *)self imageDirection];
    [v15 doubleValue];
    double v17 = v16;
    int64_t v18 = [(PFMetadata *)self speed];
    [v18 doubleValue];
    double v20 = v19;
    double v21 = [(PFMetadata *)self gpsDateTime];
    v22 = v21;
    if (!v21)
    {
      v22 = [(PFMetadata *)self creationDate];
    }
    v23 = (CLLocation *)objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v22, v5, v7, v14, v10, 0.0, v17, v20);
    gpsLocation = self->_gpsLocation;
    self->_gpsLocation = v23;

    if (!v21) {
  }
    }
}

- (void)_computeUnqualifiedDateFromDateString:(id)a3 subSecondString:(id)a4
{
  id v30 = a3;
  id v7 = a4;
  if (v30)
  {
    objc_storeStrong((id *)&self->_creationDateString, a3);
    double v8 = PFGMTTimeZone();
    double v9 = PFDateFromStringTimeZoneFormat(v30, v8, 0);

    self->_creationDateSource = 1;
  }
  else
  {
    double v9 = 0;
  }
  double v10 = [(PFMetadata *)self gpsDateTime];
  id v11 = v10;
  if (!v9 && v10)
  {
    PFStringFromDateTimeZoneFormat(v10, self->_timeZone, 0);
    BOOL v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    creationDateString = self->_creationDateString;
    self->_creationDateString = v12;

    double v9 = PFDateFromGMTDateTimeZone(v11, self->_timeZone);
    self->_creationDateSource = 2;
  }
  if (v9)
  {
    if (v7)
    {
      double v14 = [NSString stringWithFormat:@"0.%@", v7];
      [v14 doubleValue];
      double v16 = v15;

      uint64_t v17 = [v9 dateByAddingTimeInterval:v16];

      double v9 = (void *)v17;
    }
    PFGMTDateFromDateTimeZone(v9, self->_timeZone);
    int64_t v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
    utcCreationDate = self->_utcCreationDate;
    self->_utcCreationDate = v18;
  }
  double v20 = self->_utcCreationDate;
  if (v20) {
    goto LABEL_21;
  }
  double v21 = [(PFMetadata *)self fileCreationDate];
  v22 = self->_utcCreationDate;
  self->_utcCreationDate = v21;

  v23 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  timeZone = self->_timeZone;
  self->_timeZone = v23;

  self->_creationDateSource = 3;
  double v20 = self->_utcCreationDate;
  if (v20)
  {
LABEL_21:
    id v25 = self->_timeZone;
    if (v25)
    {
      PFDateFromGMTDateTimeZone(v20, v25);
      v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
      creationDate = self->_creationDate;
      self->_creationDate = v26;

      if (!self->_creationDateString)
      {
        PFStringFromDate(self->_creationDate);
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        v29 = self->_creationDateString;
        self->_creationDateString = v28;
      }
    }
  }
}

- (void)_computeTimeZoneFromString:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 componentsSeparatedByString:@":"];
    if ([v6 count] == 2)
    {
      id v7 = [v6 objectAtIndex:0];
      [v7 doubleValue];
      double v9 = v8;
      uint64_t v10 = (uint64_t)v8;

      if (v10 >= 0) {
        double v11 = 1.0;
      }
      else {
        double v11 = -1.0;
      }
      uint64_t v12 = (uint64_t)(v11 * (double)(uint64_t)v9);
      double v13 = [v6 objectAtIndex:1];
      [v13 doubleValue];
      double v15 = v14;

      double v16 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)(v11 * ((double)(3600 * v12) + v15 * 60.0))];
      timeZone = self->_timeZone;
      self->_timeZone = v16;
    }
    else
    {
      int64_t v18 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
      {
        int v32 = 138412290;
        v33 = v5;
        _os_log_debug_impl(&dword_1A41FE000, v18, OS_LOG_TYPE_DEBUG, "ERROR: timezone offset string has invalid format (%@).", (uint8_t *)&v32, 0xCu);
      }
    }
  }
  if (!self->_timeZone)
  {
    if ((self->_options & 0x80) != 0) {
      goto LABEL_18;
    }
    double v19 = [(PFMetadata *)self longitude];
    double v20 = [(PFMetadata *)self latitude];
    double v21 = v20;
    if (v19 && v20)
    {
      [v20 doubleValue];
      CLLocationDegrees v23 = v22;
      [v19 doubleValue];
      CLLocationCoordinate2D v25 = CLLocationCoordinate2DMake(v23, v24);
      v26 = [(PFMetadata *)self timeZoneLookup];
      CLLocationCoordinate2D v27 = objc_msgSend(v26, "timeZoneNameForCoordinate:", v25.latitude, v25.longitude);

      if (v27)
      {
        v28 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v27];
        v29 = self->_timeZone;
        self->_timeZone = v28;
      }
    }

    if (!self->_timeZone)
    {
LABEL_18:
      id v30 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      v31 = self->_timeZone;
      self->_timeZone = v30;
    }
  }
}

- (void)_computeSubSecondString:(id *)a3 timeZoneOffsetString:(id *)a4 unqualifiedDateString:(id *)a5 fromProperties:(id)a6
{
  id v18 = a6;
  uint64_t v10 = -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E4F2F800]);
  id v11 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2F7F0] fromProperties:v10];
  *a5 = v11;
  typeVerifier = self->_typeVerifier;
  if (v11)
  {
    *a3 = [(PFMetadataTypeVerifier *)typeVerifier valueForKey:*MEMORY[0x1E4F2F950] fromProperties:v10];
    double v13 = self->_typeVerifier;
    double v14 = (void *)MEMORY[0x1E4F2F8D0];
LABEL_5:
    *a4 = [(PFMetadataTypeVerifier *)v13 valueForKey:*v14 fromProperties:v10];
    goto LABEL_6;
  }
  id v15 = [(PFMetadataTypeVerifier *)typeVerifier valueForKey:*MEMORY[0x1E4F2F7E8] fromProperties:v10];
  *a5 = v15;
  double v16 = self->_typeVerifier;
  if (v15)
  {
    *a3 = [(PFMetadataTypeVerifier *)v16 valueForKey:*MEMORY[0x1E4F2F948] fromProperties:v10];
    double v13 = self->_typeVerifier;
    double v14 = (void *)MEMORY[0x1E4F2F8C8];
    goto LABEL_5;
  }
  uint64_t v17 = [(PFMetadataTypeVerifier *)v16 valueForKey:*MEMORY[0x1E4F2FD40] fromProperties:v18];
  *a5 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FD38] fromProperties:v17];

LABEL_6:
}

- (void)computeDateTimeValues
{
  id v3 = [(PFMetadata *)self _makeDateTimeProperties];
  id v8 = 0;
  id v9 = 0;
  id v7 = 0;
  [(PFMetadata *)self _computeSubSecondString:&v9 timeZoneOffsetString:&v8 unqualifiedDateString:&v7 fromProperties:v3];
  id v4 = v9;
  id v5 = v8;
  id v6 = v7;
  [(PFMetadata *)self _computeTimeZoneFromString:v5];
  [(PFMetadata *)self _computeUnqualifiedDateFromDateString:v6 subSecondString:v4];
}

- (void)_computeOrientationValue
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PFMetadata *)self _makeGeometryProperties];
  id v4 = [(PFMetadata *)self typeVerifier];
  id v5 = [v4 valueForKey:*MEMORY[0x1E4F2FCA0] fromProperties:v3];

  if (!v5)
  {
    id v6 = [(PFMetadata *)self typeVerifier];
    uint64_t v7 = *MEMORY[0x1E4F2FD70];
    v12[0] = *MEMORY[0x1E4F2FD40];
    v12[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v9 = [v8 componentsJoinedByString:@"."];
    id v5 = [v6 valueForKeyPath:v9 fromProperties:v3];
  }
  uint64_t v10 = [v5 integerValue];
  if ((unint64_t)(v10 - 1) >= 8) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = v10;
  }
  self->_orientation = v11;
}

- (void)_computePixelWidthAndHeightValue
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PFMetadata *)self _makeGeometryProperties];
  id v4 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FD00] fromProperties:v3];
  [v4 floatValue];
  float v6 = v5;

  uint64_t v7 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2FCE8] fromProperties:v3];
  [v7 floatValue];
  float v9 = v8;

  if (v6 != 0.0 && v9 != 0.0) {
    goto LABEL_5;
  }
  uint64_t v10 = *MEMORY[0x1E4F2F8D8];
  int64_t v11 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2F8D8] fromProperties:v3];
  [v11 floatValue];
  float v6 = v12;

  uint64_t v13 = *MEMORY[0x1E4F2F8E0];
  double v14 = [(PFMetadataTypeVerifier *)self->_typeVerifier valueForKey:*MEMORY[0x1E4F2F8E0] fromProperties:v3];
  [v14 floatValue];
  float v9 = v15;

  if (v6 != 0.0 && v9 != 0.0)
  {
LABEL_5:
    double Width = v6;
    double Height = v9;
    goto LABEL_6;
  }
  typeVerifier = self->_typeVerifier;
  v50[0] = *MEMORY[0x1E4F2F800];
  uint64_t v23 = v50[0];
  v50[1] = v10;
  CLLocationDegrees v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  CLLocationCoordinate2D v25 = [v24 componentsJoinedByString:@"."];
  v26 = [(PFMetadataTypeVerifier *)typeVerifier valueForKeyPath:v25 fromProperties:v3];
  [v26 floatValue];
  float v28 = v27;
  double Width = v27;

  v29 = self->_typeVerifier;
  v49[0] = v23;
  v49[1] = v13;
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v31 = [v30 componentsJoinedByString:@"."];
  int v32 = [(PFMetadataTypeVerifier *)v29 valueForKeyPath:v31 fromProperties:v3];
  [v32 floatValue];
  float v34 = v33;
  double Height = v33;

  if (v28 == 0.0 || v34 == 0.0)
  {
    v35 = [(PFMetadata *)self imageSource];
    if (v35) {
      goto LABEL_10;
    }
    v38 = [(PFMetadata *)self fileURL];

    if (!v38) {
      goto LABEL_6;
    }
    CFURLRef v39 = [(PFMetadata *)self fileURL];
    uint64_t v47 = *MEMORY[0x1E4F2FE28];
    uint64_t v48 = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v35 = CGImageSourceCreateWithURL(v39, v40);

    if (v35)
    {
      CFAutorelease(v35);
LABEL_10:
      CFDictionaryRef v36 = +[PFMetadataImage defaultOptionsForCGImageSource];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v35, 0, v36);

      if (ImageAtIndex)
      {
        double Width = (double)CGImageGetWidth(ImageAtIndex);
        double Height = (double)CGImageGetHeight(ImageAtIndex);
        CGImageRelease(ImageAtIndex);
      }
      goto LABEL_6;
    }
    v41 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      v42 = v41;
      v43 = [(PFMetadata *)self fileURL];
      v44 = [v43 path];
      int v45 = 138412290;
      v46 = v44;
      _os_log_error_impl(&dword_1A41FE000, v42, OS_LOG_TYPE_ERROR, "Unable to create image source for %@", (uint8_t *)&v45, 0xCu);
    }
  }
LABEL_6:
  id v18 = [NSNumber numberWithDouble:Width];
  pixeldouble Width = self->_pixelWidth;
  self->_pixeldouble Width = v18;

  double v20 = [NSNumber numberWithDouble:Height];
  pixeldouble Height = self->_pixelHeight;
  self->_pixeldouble Height = v20;
}

- (BOOL)isLoopingVideo
{
  if ([(PFMetadata *)self isAutoloop]) {
    return 1;
  }

  return [(PFMetadata *)self isMirror];
}

- (BOOL)isLongExposure
{
  int64_t v2 = [(PFMetadata *)self playbackVariation];
  BOOL v3 = [v2 unsignedIntegerValue] == 3;

  return v3;
}

- (BOOL)isMirror
{
  int64_t v2 = [(PFMetadata *)self playbackVariation];
  BOOL v3 = [v2 unsignedIntegerValue] == 2;

  return v3;
}

- (BOOL)isAutoloop
{
  int64_t v2 = [(PFMetadata *)self playbackVariation];
  BOOL v3 = [v2 unsignedIntegerValue] == 1;

  return v3;
}

- (NSNumber)durationTimeInterval
{
  memset(&v4[1], 0, sizeof(CMTime));
  [(PFMetadata *)self duration];
  int64_t v2 = 0;
  if (v4[1].flags)
  {
    v4[0] = v4[1];
    int64_t v2 = [NSNumber numberWithDouble:CMTimeGetSeconds(v4)];
  }

  return (NSNumber *)v2;
}

- (NSString)defaultProfileName
{
  int64_t v2 = [(PFMetadata *)self profileName];
  BOOL v3 = v2;
  if (!v2) {
    int64_t v2 = @"sRGB IEC61966-2.1";
  }
  id v4 = v2;

  return v4;
}

- (BOOL)hasCustomRendered
{
  return [(PFMetadata *)self customRendered] != 0;
}

- (void)_addMoviePropertiesToSyndicationProperties:(id)a3
{
  id v4 = a3;
  float v5 = [(PFMetadata *)self videoDynamicRange];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"videoDynamicRange"];
  }

  if ([(PFMetadata *)self isCinematicVideo])
  {
    float v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isCinematicVideo](self, "isCinematicVideo"));
    if (v6) {
      [v4 setObject:v6 forKeyedSubscript:@"videoContainsCinematicData"];
    }
  }
  [(PFMetadata *)self duration];
  uint64_t v7 = [(PFMetadata *)self nominalFrameRate];
  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"framesPerSecond"];
  }

  float v8 = [(PFMetadata *)self firstVideoTrackCodecString];
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"fourCharCode"];
  }

  float v9 = [(PFMetadata *)self captureMode];
  if (v9) {
    [v4 setObject:v9 forKeyedSubscript:@"com.apple.photos.captureMode"];
  }

  uint64_t v10 = [(PFMetadata *)self montageString];
  if (v10) {
    [v4 setObject:v10 forKeyedSubscript:@"isMontage"];
  }

  int64_t v11 = [(PFMetadata *)self audioDataRate];
  if (v11) {
    [v4 setObject:v11 forKeyedSubscript:@"estimatedDataRate"];
  }

  float v12 = [(PFMetadata *)self audioTrackFormat];
  if (v12) {
    [v4 setObject:v12 forKeyedSubscript:@"audioTrackFormat"];
  }

  uint64_t v13 = [(PFMetadata *)self audioSampleRate];
  if (v13) {
    [v4 setObject:v13 forKeyedSubscript:@"audioTrackSampleRate"];
  }

  double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isProRes](self, "isProRes"));
  if (v14) {
    [v4 setObject:v14 forKeyedSubscript:@"isProRes"];
  }

  float v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isTimelapse](self, "isTimelapse"));
  if (v15) {
    [v4 setObject:v15 forKeyedSubscript:@"Time-lapse"];
  }
}

- (void)_addImageSmartStylePropertiesToSyndicationProperties:(id)a3
{
  id v13 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithShort:", -[PFMetadata smartStyleCast](self, "smartStyleCast"));
  if (v4) {
    [v13 setObject:v4 forKeyedSubscript:@"smartStyleCast"];
  }

  float v5 = [(PFMetadata *)self smartStyleIntensity];
  if (v5) {
    [v13 setObject:v5 forKeyedSubscript:@"smartStyleIntensity"];
  }

  float v6 = [(PFMetadata *)self smartStyleToneBias];
  if (v6) {
    [v13 setObject:v6 forKeyedSubscript:@"smartStyleToneBias"];
  }

  uint64_t v7 = [(PFMetadata *)self smartStyleColorBias];
  if (v7) {
    [v13 setObject:v7 forKeyedSubscript:@"smartStyleColorBias"];
  }

  float v8 = [(PFMetadata *)self smartStyleRenderingVersion];
  if (v8) {
    [v13 setObject:v8 forKeyedSubscript:@"smartStyleRenderingVersion"];
  }

  float v9 = [(PFMetadata *)self smartStyleIsReversible];
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"smartStyleIsReversible"];
  }

  uint64_t v10 = [(PFMetadata *)self smartStyleExpectingReversibility];
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:@"smartStyleExpectingReversibility"];
  }

  int64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata hasSmartStyle](self, "hasSmartStyle"));
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:@"hasSmartStyle"];
  }

  float v12 = objc_msgSend(NSNumber, "numberWithShort:", -[PFMetadata smartStyleVideoCastValue](self, "smartStyleVideoCastValue"));
  if (v12) {
    [v13 setObject:v12 forKeyedSubscript:@"smartStyleVideoCastValue"];
  }
}

- (void)_addImageGPSPropertiesToSyndicationProperties:(id)a3
{
  id v11 = a3;
  id v4 = [(PFMetadata *)self speed];
  if (v4 && *MEMORY[0x1E4F2FA80]) {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v4);
  }

  float v5 = [(PFMetadata *)self speedRef];
  if (v5 && *MEMORY[0x1E4F2FA88]) {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5);
  }

  float v6 = [(PFMetadata *)self gpsDateTime];
  if (v6) {
    [v11 setObject:v6 forKeyedSubscript:@"gpsDateTime"];
  }

  uint64_t v7 = [(PFMetadata *)self gpsHPositioningError];
  if (v7 && *MEMORY[0x1E4F2FA28]) {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7);
  }

  float v8 = [(PFMetadata *)self altitude];
  if (v8 && *MEMORY[0x1E4F2F9B0]) {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8);
  }

  float v9 = [(PFMetadata *)self imageDirection];
  if (v9 && *MEMORY[0x1E4F2FA30]) {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9);
  }

  uint64_t v10 = [(PFMetadata *)self imageDirectionRef];
  if (v10 && *MEMORY[0x1E4F2FA38]) {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10);
  }
}

- (void)_addImageLivePhotoPropertiesToSyndicationProperties:(id)a3
{
  id v4 = a3;
  [(PFMetadata *)self duration];
  [(PFMetadata *)self stillImageDisplayTime];
  float v5 = [(PFMetadata *)self livePhotoPairingIdentifier];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"livePhotoParingIdentifier"];
  }

  float v6 = [(PFMetadata *)self playbackVariation];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"playbackVariation"];
  }
}

- (void)_addImageMiscPropertiesToSyndicationProperties:(id)a3
{
  id v39 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isFrontFacingCamera](self, "isFrontFacingCamera"));
  if (v4) {
    [v39 setObject:v4 forKeyedSubscript:@"kPFImagePropertyFrontFacingCamera"];
  }

  float v5 = [(PFMetadata *)self focalLengthIn35mm];
  if (v5 && *MEMORY[0x1E4F2F848]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v5);
  }

  float v6 = [(PFMetadata *)self digitalZoomRatio];
  if (v6 && *MEMORY[0x1E4F2F808]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v6);
  }

  uint64_t v7 = [(PFMetadata *)self profileName];
  if (v7 && *MEMORY[0x1E4F2FD10]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v7);
  }

  float v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PFMetadata photoProcessingFlags](self, "photoProcessingFlags"));
  if (v8) {
    [v39 setObject:v8 forKeyedSubscript:@"photoProcessingFlags"];
  }

  if ([(PFMetadata *)self hasCustomRendered])
  {
    float v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[PFMetadata customRendered](self, "customRendered"));
    if (v9 && *MEMORY[0x1E4F2F7E0]) {
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v9);
    }
  }
  uint64_t v10 = [(PFMetadata *)self fNumber];
  if (v10 && *MEMORY[0x1E4F2F830]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v10);
  }

  id v11 = [(PFMetadata *)self exposureBias];
  if (v11 && *MEMORY[0x1E4F2F810]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v11);
  }

  float v12 = [(PFMetadata *)self flashValue];
  if (v12 && *MEMORY[0x1E4F2F838]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v12);
  }

  id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata flashFired](self, "flashFired"));
  if (v13) {
    [v39 setObject:v13 forKeyedSubscript:@"flashFired"];
  }

  double v14 = [(PFMetadata *)self flashCompensation];
  if (v14 && *MEMORY[0x1E4F2F6E8]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v14);
  }

  float v15 = [(PFMetadata *)self focalLength];
  if (v15 && *MEMORY[0x1E4F2F850]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v15);
  }

  double v16 = [(PFMetadata *)self iso];
  if (v16 && *MEMORY[0x1E4F2F870]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v16);
  }

  uint64_t v17 = [(PFMetadata *)self meteringMode];
  if (v17 && *MEMORY[0x1E4F2F8B8]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v17);
  }

  id v18 = [(PFMetadata *)self exposureTime];
  if (v18 && *MEMORY[0x1E4F2F828]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v18);
  }

  double v19 = [(PFMetadata *)self whiteBalance];
  if (v19 && *MEMORY[0x1E4F2F970]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v19);
  }

  double v20 = [(PFMetadata *)self lightSource];
  if (v20 && *MEMORY[0x1E4F2F8A8]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v20);
  }

  double v21 = [(PFMetadata *)self whiteBalanceIndex];
  if (v21 && *MEMORY[0x1E4F2F570]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v21);
  }

  double v22 = [(PFMetadata *)self GIFDelayTime];
  if (v22 && *MEMORY[0x1E4F2F988]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v22);
  }

  uint64_t v23 = [(PFMetadata *)self HEICSDelayTime];
  if (v23 && *MEMORY[0x1E4F2FB10]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v23);
  }

  CLLocationDegrees v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isHDR](self, "isHDR"));
  if (v24) {
    [v39 setObject:v24 forKeyedSubscript:@"isHDR"];
  }

  CLLocationCoordinate2D v25 = [(PFMetadata *)self hdrGain];
  if (v25) {
    [v39 setObject:v25 forKeyedSubscript:@"hdrGain"];
  }

  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata hasHDRGainMap](self, "hasHDRGainMap"));
  if (v26) {
    [v39 setObject:v26 forKeyedSubscript:@"hasHDRGainMap"];
  }

  float v27 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isPhotoBooth](self, "isPhotoBooth"));
  if (v27) {
    [v39 setObject:v27 forKeyedSubscript:@"isPhotoBooth"];
  }

  float v28 = [(PFMetadata *)self userComment];
  if (v28 && *MEMORY[0x1E4F2F958]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v28);
  }

  v29 = [(PFMetadata *)self burstUuid];
  if (v29) {
    [v39 setObject:v29 forKeyedSubscript:@"burstUuid"];
  }

  id v30 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata hasISOGainMap](self, "hasISOGainMap"));
  if (v30) {
    [v39 setObject:v30 forKeyedSubscript:@"hasISOGainMap"];
  }

  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isAnimatedImage](self, "isAnimatedImage"));
  if (v31) {
    [v39 setObject:v31 forKeyedSubscript:@"isAnimatedImage"];
  }

  int v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PFMetadata photoCaptureFlags](self, "photoCaptureFlags"));
  if (v32) {
    [v39 setObject:v32 forKeyedSubscript:@"stillImageCaptureFlags"];
  }

  float v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[PFMetadata cameraUsedForCapture](self, "cameraUsedForCapture"));
  if (v33) {
    [v39 setObject:v33 forKeyedSubscript:@"cameraUsedForCapture"];
  }

  float v34 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata hasSpatialAudio](self, "hasSpatialAudio"));
  if (v34) {
    [v39 setObject:v34 forKeyedSubscript:@"hasSpatialAudio"];
  }

  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isAlchemist](self, "isAlchemist"));
  if (v35) {
    [v39 setObject:v35 forKeyedSubscript:@"isAlchemist"];
  }

  CFDictionaryRef v36 = objc_msgSend(NSNumber, "numberWithBool:", -[PFMetadata isThreeImageStereoHEIC](self, "isThreeImageStereoHEIC"));
  if (v36) {
    [v39 setObject:v36 forKeyedSubscript:@"isThreeImageStereoHEIC"];
  }

  v37 = [(PFMetadata *)self generativeAIImageType];
  if (v37) {
    [v39 setObject:v37 forKeyedSubscript:@"generativeAIImageType"];
  }

  v38 = [(PFMetadata *)self credit];
  if (v38 && *MEMORY[0x1E4F2FB68]) {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v38);
  }
}

- (void)_addImageSemanticStylePropertiesToSyndicationProperties:(id)a3
{
  id v8 = a3;
  id v4 = [(PFMetadata *)self semanticStyleToneBias];
  if (v4) {
    [v8 setObject:v4 forKeyedSubscript:@"semanticStyleToneBias"];
  }

  float v5 = [(PFMetadata *)self semanticStyleWarmthBias];
  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:@"semanticStyleWarmthBias"];
  }

  float v6 = [(PFMetadata *)self semanticStyleRenderingVersion];
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:@"semanticStyleRenderingVersion"];
  }

  uint64_t v7 = [(PFMetadata *)self semanticStylePreset];
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:@"semanticStylePreset"];
  }
}

- (void)_addImagePropertiesToSyndicationProperties:(id)a3
{
  id v4 = a3;
  [(PFMetadata *)self _addImageSemanticStylePropertiesToSyndicationProperties:v4];
  [(PFMetadata *)self _addImageLivePhotoPropertiesToSyndicationProperties:v4];
  [(PFMetadata *)self _addImageMiscPropertiesToSyndicationProperties:v4];
  [(PFMetadata *)self _addImageGPSPropertiesToSyndicationProperties:v4];
  [(PFMetadata *)self _addImageSmartStylePropertiesToSyndicationProperties:v4];
}

- (void)_addCommonPropertiesToSyndicationProperties:(id)a3
{
  id v24 = a3;
  id v4 = [(PFMetadata *)self contentType];
  float v5 = [v4 identifier];
  if (v5) {
    [v24 setObject:v5 forKeyedSubscript:@"uti"];
  }

  float v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PFMetadata fileSize](self, "fileSize"));
  if (v6 && *MEMORY[0x1E4F28390]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v6);
  }

  uint64_t v7 = [(PFMetadata *)self originalFileName];
  if (v7) {
    [v24 setObject:v7 forKeyedSubscript:@"originalFilename"];
  }

  id v8 = NSNumber;
  [(PFMetadata *)self exifPixelSize];
  float v9 = objc_msgSend(v8, "numberWithDouble:");
  if (v9 && *MEMORY[0x1E4F2FD00]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v9);
  }

  uint64_t v10 = NSNumber;
  [(PFMetadata *)self exifPixelSize];
  float v12 = [v10 numberWithDouble:v11];
  if (v12 && *MEMORY[0x1E4F2FCE8]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v12);
  }

  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[PFMetadata orientation](self, "orientation"));
  if (v13 && *MEMORY[0x1E4F2FCA0]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v13);
  }

  double v14 = [(PFMetadata *)self lensModel];
  if (v14 && *MEMORY[0x1E4F2F890]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14);
  }

  float v15 = [(PFMetadata *)self lensMake];
  if (v15 && *MEMORY[0x1E4F2F888]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v15);
  }

  double v16 = [(PFMetadata *)self _dateTimeOriginalForSyndicationProperties];
  if (v16) {
    [v24 setObject:v16 forKeyedSubscript:@"creationDate"];
  }

  uint64_t v17 = [(PFMetadata *)self _dateTimeOffsetOriginalForSyndicationProperties];
  if (v17) {
    [v24 setObject:v17 forKeyedSubscript:@"timeZoneOffset"];
  }

  id v18 = [(PFMetadata *)self _dateTimeSubsecOriginalForSyndicationProperties];
  if (v18 && *MEMORY[0x1E4F2F950]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v18);
  }

  double v19 = [(PFMetadata *)self cameraModel];
  if (v19 && *MEMORY[0x1E4F2FD68]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v19);
  }

  double v20 = [(PFMetadata *)self cameraMake];
  if (v20 && *MEMORY[0x1E4F2FD60]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v20);
  }

  double v21 = [(PFMetadata *)self longitude];
  if (v21 && *MEMORY[0x1E4F2FA50]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v21);
  }

  double v22 = [(PFMetadata *)self latitude];
  if (v22 && *MEMORY[0x1E4F2FA40]) {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v22);
  }

  uint64_t v23 = [(PFMetadata *)self spatialOverCaptureIdentifier];
  if (v23) {
    [v24 setObject:v23 forKeyedSubscript:@"socIdentifier"];
  }
}

- (NSDictionary)syndicationProperties
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PFMetadata *)self _addCommonPropertiesToSyndicationProperties:v3];
  [(PFMetadata *)self _addImagePropertiesToSyndicationProperties:v3];
  [(PFMetadata *)self _addMoviePropertiesToSyndicationProperties:v3];

  return (NSDictionary *)v3;
}

- (NSString)originalFileName
{
  int64_t v2 = [(PFMetadata *)self fileURL];
  id v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (NSNumber)speed
{
  speed = self->_speed;
  if (!speed)
  {
    [(PFMetadata *)self computeGPSValues];
    speed = self->_speed;
  }

  return speed;
}

- (NSNumber)altitude
{
  altitude = self->_altitude;
  if (!altitude)
  {
    [(PFMetadata *)self computeGPSValues];
    altitude = self->_altitude;
  }

  return altitude;
}

- (NSNumber)latitude
{
  latitude = self->_latitude;
  if (!latitude)
  {
    [(PFMetadata *)self computeGPSValues];
    latitude = self->_latitude;
  }

  return latitude;
}

- (NSNumber)longitude
{
  longitude = self->_longitude;
  if (!longitude)
  {
    [(PFMetadata *)self computeGPSValues];
    longitude = self->_longitude;
  }

  return longitude;
}

- (NSDate)gpsDateTime
{
  gpsDateTime = self->_gpsDateTime;
  if (!gpsDateTime)
  {
    [(PFMetadata *)self computeGPSValues];
    gpsDateTime = self->_gpsDateTime;
  }

  return gpsDateTime;
}

- (CLLocation)gpsLocation
{
  gpsLocation = self->_gpsLocation;
  if (!gpsLocation)
  {
    [(PFMetadata *)self _computeGPSLocation];
    gpsLocation = self->_gpsLocation;
  }

  return gpsLocation;
}

- (NSString)creationDateString
{
  creationDateString = self->_creationDateString;
  if (!creationDateString)
  {
    [(PFMetadata *)self computeDateTimeValues];
    creationDateString = self->_creationDateString;
  }

  return creationDateString;
}

- (NSNumber)timeZoneOffset
{
  id v3 = NSNumber;
  id v4 = [(PFMetadata *)self timeZone];
  float v5 = [(PFMetadata *)self creationDate];
  float v6 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "secondsFromGMTForDate:", v5));

  return (NSNumber *)v6;
}

- (NSString)timeZoneName
{
  int64_t v2 = [(PFMetadata *)self timeZone];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (NSTimeZone)timeZone
{
  timeZone = self->_timeZone;
  if (!timeZone)
  {
    [(PFMetadata *)self computeDateTimeValues];
    timeZone = self->_timeZone;
  }

  return timeZone;
}

- (NSDate)creationDate
{
  creationDate = self->_creationDate;
  if (!creationDate)
  {
    [(PFMetadata *)self computeDateTimeValues];
    creationDate = self->_creationDate;
  }

  return creationDate;
}

- (int64_t)creationDateSource
{
  if (!self->_creationDate) {
    [(PFMetadata *)self computeDateTimeValues];
  }
  return self->_creationDateSource;
}

- (NSDate)utcCreationDate
{
  utcCreationDate = self->_utcCreationDate;
  if (!utcCreationDate)
  {
    [(PFMetadata *)self computeDateTimeValues];
    utcCreationDate = self->_utcCreationDate;
  }

  return utcCreationDate;
}

- (int64_t)orientation
{
  int64_t result = self->_orientation;
  if (!result)
  {
    [(PFMetadata *)self _computeOrientationValue];
    return self->_orientation;
  }
  return result;
}

- (CGSize)orientedPixelSize
{
  int64_t v3 = [(PFMetadata *)self orientation];
  [(PFMetadata *)self exifPixelSize];
  if ((unint64_t)(v3 - 5) >= 4) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  if ((unint64_t)(v3 - 5) < 4) {
    double v5 = v4;
  }
  double v7 = v6;
  result.height = v5;
  result.width = v7;
  return result;
}

- (CGSize)exifPixelSize
{
  int64_t v3 = [(PFMetadata *)self pixelWidth];
  [v3 floatValue];
  double v5 = v4;
  double v6 = [(PFMetadata *)self pixelHeight];
  [v6 floatValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)pixelHeight
{
  pixeldouble Height = self->_pixelHeight;
  if (!pixelHeight)
  {
    [(PFMetadata *)self _computePixelWidthAndHeightValue];
    pixeldouble Height = self->_pixelHeight;
  }

  return pixelHeight;
}

- (id)pixelWidth
{
  pixeldouble Width = self->_pixelWidth;
  if (!pixelWidth)
  {
    [(PFMetadata *)self _computePixelWidthAndHeightValue];
    pixeldouble Width = self->_pixelWidth;
  }

  return pixelWidth;
}

- (UTType)contentType
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  contentType = self->_contentType;
  if (!contentType)
  {
    if ((self->_options & 0x80) != 0 || (float v4 = self->_fileURL) == 0)
    {
      contentType = 0;
    }
    else
    {
      id v11 = 0;
      double v5 = +[PFUniformTypeUtilities typeForURL:v4 error:&v11];
      id v6 = v11;
      float v7 = self->_contentType;
      self->_contentType = v5;

      if (!self->_contentType)
      {
        double v8 = metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          fileURL = self->_fileURL;
          *(_DWORD *)buf = 138412546;
          id v13 = fileURL;
          __int16 v14 = 2112;
          id v15 = v6;
        }
      }

      contentType = self->_contentType;
    }
  }

  return contentType;
}

- (NSDate)fileModificationDate
{
  int64_t v2 = [(PFMetadata *)self fileSystemProperties];
  int64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];

  return (NSDate *)v3;
}

- (NSDate)fileCreationDate
{
  int64_t v3 = [(PFMetadata *)self fileSystemProperties];
  float v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    float v7 = [(PFMetadata *)self fileSystemProperties];
    id v6 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
  }

  return (NSDate *)v6;
}

- (unint64_t)fileSize
{
  int64_t v2 = [(PFMetadata *)self fileSystemProperties];
  int64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (NSDictionary)fileSystemProperties
{
  fileSystemProperties = self->_fileSystemProperties;
  if (fileSystemProperties || (self->_options & 0x80) != 0)
  {
    double v10 = fileSystemProperties;
  }
  else
  {
    unint64_t v4 = [(PFMetadata *)self fileURL];
    if (v4)
    {
      id v5 = [(PFMetadata *)self fileURL];
      id v23 = 0;
      id v6 = [MEMORY[0x1E4F1CB10] bookmarkDataWithContentsOfURL:v5 error:&v23];
      id v7 = v23;
      if (v6)
      {
        id v22 = v7;
        double v8 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v6 options:768 relativeToURL:v5 bookmarkDataIsStale:0 error:&v22];
        id v9 = v22;

        id v7 = v9;
      }
      else
      {
        double v8 = v5;
      }

      if (v8)
      {
        float v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v13 = [v8 path];
        uint64_t v21 = 0;
        unint64_t v4 = [v12 attributesOfItemAtPath:v13 error:&v21];

        uint64_t v14 = *MEMORY[0x1E4F282C0];
        id v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-*MEMORY[0x1E4F1CF68]];
        if ([v15 isEqualToDate:v16])
        {
          uint64_t v17 = (void *)[v4 mutableCopy];
          id v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
          [v17 setObject:v18 forKeyedSubscript:v14];

          unint64_t v4 = v17;
        }
      }
      else
      {
        unint64_t v4 = 0;
      }
    }
    else
    {
      double v8 = 0;
    }
    double v19 = (NSDictionary *)[v4 copy];
    double v20 = self->_fileSystemProperties;
    self->_fileSystemProperties = v19;

    double v10 = self->_fileSystemProperties;
  }

  return v10;
}

- (signed)smartStyleVideoCastValue
{
  return 0;
}

- (PFHEVCProfileInformation)hevcProfileInfo
{
  return 0;
}

- (NSDictionary)outOfBandHints
{
  return 0;
}

- (NSString)outOfBandHintsBase64String
{
  return 0;
}

- (NSString)apacAudioTrackCodecProfileLevelDescription
{
  return 0;
}

- (NSNumber)apacAudioTrackBedChannelCount
{
  return 0;
}

- (NSNumber)apacAudioTrackHoaChannelCount
{
  return 0;
}

- (NSNumber)apacAudioTrackChannelCount
{
  return 0;
}

- (BOOL)isDecodable
{
  return 0;
}

- (BOOL)isPlayable
{
  return 0;
}

- (opaqueCMFormatDescription)videoTrackFormatDescription
{
  return 0;
}

- (id)firstVideoTrackFullDebugDescription
{
  return 0;
}

- (id)formatDebugDescription
{
  return 0;
}

- (NSNumber)livePhotoVitalityTransitionScore
{
  return 0;
}

- (NSString)transferFunction
{
  return 0;
}

- (NSString)colorPrimaries
{
  return 0;
}

- (UTType)contentTypeFromFastModernizeVideoMedia
{
  return 0;
}

- (NSString)firstVideoTrackFormatDebugDescription
{
  return 0;
}

- (NSString)captureMode
{
  return 0;
}

- (NSString)author
{
  return 0;
}

- (NSString)montageString
{
  return 0;
}

- (BOOL)isProRes
{
  return 0;
}

- (BOOL)isActionCam
{
  return 0;
}

- (BOOL)isTimelapse
{
  return 0;
}

- (BOOL)hasSpatialAudio
{
  return 0;
}

- (BOOL)isCinematicVideo
{
  return 0;
}

- (BOOL)isSloMo
{
  return 0;
}

- (NSNumber)videoDynamicRange
{
  return 0;
}

- (NSString)videoCodecName
{
  return 0;
}

- (NSString)firstVideoTrackCodecString
{
  return 0;
}

- (unsigned)firstVideoTrackCodec
{
  return 0;
}

- (NSNumber)livePhotoMinimumClientVersion
{
  return 0;
}

- (BOOL)livePhotoVitalityLimitingAllowed
{
  return 0;
}

- (BOOL)hasVitality
{
  return 0;
}

- (NSNumber)livePhotoVitalityScore
{
  return 0;
}

- (BOOL)isAutoLivePhoto
{
  return 0;
}

- (NSNumber)playbackVariation
{
  return 0;
}

- (id)audioBitsPerChannel
{
  return 0;
}

- (id)audioChannelsPerFrame
{
  return 0;
}

- (id)audioBytesPerFrame
{
  return 0;
}

- (id)audioFramesPerPacket
{
  return 0;
}

- (id)audioBytesPerPacket
{
  return 0;
}

- (NSNumber)audioTrackFormatFlags
{
  return 0;
}

- (NSNumber)audioTrackFormat
{
  return 0;
}

- (NSNumber)audioSampleRate
{
  return 0;
}

- (NSNumber)videoDataRate
{
  return 0;
}

- (NSNumber)audioDataRate
{
  return 0;
}

- (NSNumber)nominalFrameRate
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (BOOL)containsCustomStylesMetadataBlob
{
  return 0;
}

- (BOOL)containsSpatialCameraHEIFMetadata
{
  return 0;
}

- (int64_t)cameraUsedForCapture
{
  return 0;
}

- (BOOL)isAlchemist
{
  return 0;
}

- (BOOL)isThreeImageStereoHEIC
{
  return 0;
}

- (NSData)imageSourceProxyData
{
  return 0;
}

- (NSString)credit
{
  return 0;
}

- (NSNumber)generativeAIImageType
{
  return 0;
}

- (NSNumber)smartStyleExpectingReversibility
{
  return 0;
}

- (NSNumber)smartStyleIsReversible
{
  return 0;
}

- (BOOL)hasSmartStyle
{
  return 0;
}

- (NSNumber)smartStyleRenderingVersion
{
  return 0;
}

- (NSNumber)smartStyleColorBias
{
  return 0;
}

- (NSNumber)smartStyleToneBias
{
  return 0;
}

- (NSNumber)smartStyleIntensity
{
  return 0;
}

- (signed)smartStyleCast
{
  return 0;
}

- (NSNumber)srlCompensationValue
{
  int64_t v2 = [(PFMetadata *)self nrfSrlStatus];
  int64_t v3 = v2;
  if (v2 && (unsigned int v4 = [v2 unsignedIntValue], v4 >= 0x80000001))
  {
    *(float *)&double v5 = (float)v4 * 0.0039062;
    id v6 = [NSNumber numberWithFloat:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)nrfSrlStatus
{
  return 0;
}

- (unint64_t)photosAppFeatureFlags
{
  return 0;
}

- (BOOL)isProRAW
{
  return 0;
}

- (NSNumber)semanticStylePreset
{
  return 0;
}

- (NSNumber)semanticStyleRenderingVersion
{
  return 0;
}

- (NSNumber)semanticStyleWarmthBias
{
  return 0;
}

- (NSNumber)semanticStyleToneBias
{
  return 0;
}

- (NSString)userComment
{
  return 0;
}

- (NSString)portraitInLandscapeCamera
{
  return 0;
}

- (unint64_t)photoCaptureFlags
{
  return 0;
}

- (unint64_t)photoProcessingFlags
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  int64_t v3 = [(PFMetadata *)self contentType];
  int v4 = [v3 isEqual:*MEMORY[0x1E4F443D0]];
  if (v4)
  {
    double v5 = [(PFMetadata *)self GIFDelayTime];
    if (v5)
    {
      BOOL v6 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  id v7 = [(PFMetadata *)self contentType];
  double v8 = +[PFUniformTypeUtilities heicSequenceType];
  if ([v7 isEqual:v8])
  {
    id v9 = [(PFMetadata *)self HEICSDelayTime];
    BOOL v6 = v9 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  if (v4)
  {
    double v5 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (NSNumber)HEICSDelayTime
{
  return 0;
}

- (NSNumber)GIFDelayTime
{
  return 0;
}

- (NSNumber)lightSource
{
  return 0;
}

- (NSString)profileName
{
  return 0;
}

- (NSNumber)whiteBalanceIndex
{
  return 0;
}

- (NSNumber)whiteBalance
{
  return 0;
}

- (NSNumber)exposureTime
{
  return 0;
}

- (NSNumber)meteringMode
{
  return 0;
}

- (NSString)cameraSerialNumber
{
  return 0;
}

- (NSNumber)lensMaximumMM
{
  return 0;
}

- (NSNumber)lensMinimumMM
{
  return 0;
}

- (NSString)lensMake
{
  return 0;
}

- (NSString)lensModel
{
  return 0;
}

- (NSNumber)iso
{
  return 0;
}

- (NSNumber)focusDistance
{
  return 0;
}

- (NSNumber)focusMode
{
  return 0;
}

- (NSArray)focusPoints
{
  return 0;
}

- (NSNumber)digitalZoomRatio
{
  return 0;
}

- (NSNumber)focalLengthIn35mm
{
  return 0;
}

- (NSNumber)focalLength
{
  return 0;
}

- (BOOL)flashFired
{
  return 0;
}

- (NSNumber)flashCompensation
{
  return 0;
}

- (NSNumber)flashValue
{
  return 0;
}

- (CGColorSpace)cgColorSpace
{
  return 0;
}

- (NSNumber)brightness
{
  return 0;
}

- (NSNumber)exposureBias
{
  return 0;
}

- (NSNumber)fNumber
{
  return 0;
}

- (NSString)firmware
{
  return 0;
}

- (NSString)ownerName
{
  return 0;
}

- (BOOL)isSDOF
{
  return 0;
}

- (CGImageMetadata)cgImageMetadata
{
  return 0;
}

- (int64_t)customRendered
{
  return 0;
}

- (BOOL)isDeferredPhotoProxyExpectingDepth
{
  return 0;
}

- (BOOL)isDeferredPhotoProxy
{
  return 0;
}

- (BOOL)hasDepthDataAndIsNotRenderedSDOF
{
  return 0;
}

- (BOOL)isPortrait
{
  return 0;
}

- (BOOL)isPanorama
{
  return 0;
}

- (unint64_t)_stillImageProcessingFlags
{
  return 0;
}

- (NSString)photoProcessingIdentifier
{
  return 0;
}

- (NSString)imageCaptureRequestIdentifier
{
  return 0;
}

- (NSString)deferredPhotoProcessingIdentifier
{
  return 0;
}

- (NSString)groupingUuid
{
  return 0;
}

- (NSString)burstUuid
{
  return 0;
}

- (BOOL)isPhotoBooth
{
  return 0;
}

- (BOOL)hasISOGainMap
{
  return 0;
}

- (NSNumber)hdrGainMapPercentageValue
{
  return 0;
}

- (BOOL)hasHDRGainMap
{
  return 0;
}

- (NSDictionary)hdrGainMap
{
  return 0;
}

- (NSNumber)hdrGain
{
  return 0;
}

- (BOOL)isScreenshot
{
  return 0;
}

- (BOOL)sourceIsImageSourceProxy
{
  return 0;
}

- (int64_t)spatialVideoRecommendationForImmersiveMode
{
  return 0;
}

- (BOOL)isSpatialMedia
{
  return 0;
}

- (BOOL)isFrontFacingCamera
{
  return 0;
}

- (BOOL)isSyndicationOriginated
{
  return 0;
}

- (NSString)speedRef
{
  return 0;
}

- (NSString)imageDirectionRef
{
  return 0;
}

- (NSNumber)imageDirection
{
  return 0;
}

- (NSNumber)gpsHPositioningError
{
  return 0;
}

- (id)altitudeRef
{
  return 0;
}

- (NSArray)keywords
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (BOOL)isHDR_ExtendedRange
{
  return 0;
}

- (BOOL)isHDR_TS22028_5
{
  return 0;
}

- (BOOL)isHDR
{
  return 0;
}

- (BOOL)isSpatialOverCapture
{
  return 0;
}

- (NSString)spatialOverCaptureIdentifier
{
  return 0;
}

- (NSString)artworkContentDescription
{
  return 0;
}

- (NSString)captionAbstract
{
  return 0;
}

- (NSString)renderOriginatingAssetIdentifier
{
  return 0;
}

- (NSString)originatingAssetIdentifier
{
  return 0;
}

- (id)software
{
  return 0;
}

- (NSString)cameraModel
{
  return 0;
}

- (NSString)cameraMake
{
  return 0;
}

- (NSString)livePhotoPairingIdentifier
{
  return 0;
}

- (NSData)imageData
{
  return 0;
}

- (CGImageSource)imageSource
{
  return 0;
}

- (NSDictionary)cgImageProperties
{
  return 0;
}

- (BOOL)isMovie
{
  return 0;
}

- (BOOL)isImage
{
  return 0;
}

- (void)setOptions:(unsigned __int16)a3
{
  self->_options |= a3;
}

- (BOOL)shouldLoadTrackMetadata
{
  return (self->_options >> 2) & 1;
}

- (BOOL)shouldLoadValues
{
  return (self->_options >> 3) & 1;
}

- (BOOL)allowExportForProxy
{
  return (self->_options >> 5) & 1;
}

- (BOOL)shouldLookForXmpSidecar
{
  return (self->_options >> 1) & 1;
}

- (BOOL)noOutOfProcess
{
  return HIBYTE(self->_options) & 1;
}

- (BOOL)noFileAccess
{
  return (self->_options >> 7) & 1;
}

- (BOOL)shouldCreateProxy
{
  return (self->_options >> 4) & 1;
}

- (BOOL)doImmediateCompute
{
  return (self->_options >> 6) & 1;
}

- (PFTimeZoneLookup)timeZoneLookup
{
  cachedTimeZoneLookup = self->_cachedTimeZoneLookup;
  if (!cachedTimeZoneLookup)
  {
    int v4 = objc_alloc_init(PFTimeZoneLookup);
    double v5 = self->_cachedTimeZoneLookup;
    self->_cachedTimeZoneLookup = v4;

    BOOL v6 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_error_impl(&dword_1A41FE000, v6, OS_LOG_TYPE_ERROR, "Initialialized PFMetadata without a PFTimeZoneLookup. It is better performance to use a cached instance.", v8, 2u);
    }
    cachedTimeZoneLookup = self->_cachedTimeZoneLookup;
  }

  return cachedTimeZoneLookup;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  if (!a3) {
    return 0;
  }
  int v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = PFMetadataPlistFilePath;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:v5];
  double v8 = [v4 fileURLWithPath:v7];
  fileURL = self->_fileURL;
  self->_fileURL = v8;

  double v10 = [v6 objectForKeyedSubscript:PFMetadataPlistCreationDate];
  creationDate = self->_creationDate;
  self->_creationDate = v10;

  float v12 = [v6 objectForKeyedSubscript:PFMetadataPlistFileSystemProperties];
  fileSystemProperties = self->_fileSystemProperties;
  self->_fileSystemProperties = v12;

  uint64_t v14 = [v6 objectForKeyedSubscript:PFMetadataPlistSourceType];

  self->_sourceType = [v14 integerValue];
  return self->_sourceType != 0;
}

- (BOOL)isSameForURL:(id)a3 andOptions:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [(PFMetadata *)self fileURL];
  int v8 = [v7 isEqual:v6];

  return v8 && (v4 & ~self->_options) == 0;
}

- (PFMetadata)initWithImageCaptureMovieProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;

  id v11 = [[PFMetadataImageCaptureMovieProperties alloc] initWithImageCaptureMovieProperties:v10 contentType:v9 timeZoneLookup:v8];
  return &v11->super;
}

- (PFMetadata)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;

  id v10 = [[PFMetadataMovie alloc] initWithAVAsset:v9 options:v5 timeZoneLookup:v8];
  return &v10->super;
}

- (PFMetadata)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[PFMetadataMovie alloc] initWithAVProxyData:v6 timeZoneLookup:v7];
  if (!v8) {
    id v8 = [[PFMetadataLegacyMovieProperties alloc] initWithAVProxyData:v6 timeZoneLookup:v7];
  }

  return &v8->super;
}

- (PFMetadata)initWithAVURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;

  id v10 = [[PFMetadataMovie alloc] initWithAVURL:v9 options:v5 timeZoneLookup:v8];
  return &v10->super;
}

- (PFMetadata)initWithImageProperties:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;

  id v13 = [[PFMetadataImage alloc] initWithImageProperties:v12 contentType:v11 options:v6 timeZoneLookup:v10];
  return &v13->super;
}

- (PFMetadata)initWithImageSourceProxyOrEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;

  id v11 = [[PFMetadataImage alloc] initWithImageSourceProxyOrEncodedImagePropertyData:v10 contentType:v9 timeZoneLookup:v8];
  return &v11->super;
}

- (PFMetadata)initWithImageSourceProxyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;

  id v11 = [[PFMetadataImage alloc] initWithImageSourceProxyData:v10 contentType:v9 timeZoneLookup:v8];
  return &v11->super;
}

- (PFMetadata)initWithEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;

  id v11 = [[PFMetadataImage alloc] initWithEncodedImagePropertyData:v10 contentType:v9 timeZoneLookup:v8];
  return &v11->super;
}

- (PFMetadata)initWithImageSource:(CGImageSource *)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a5;
  id v12 = a6;
  id v13 = a4;

  uint64_t v14 = [[PFMetadataImage alloc] initWithImageSource:a3 contentType:v13 options:v8 timeZoneLookup:v12 cacheImageSource:v7];
  return &v14->super;
}

- (PFMetadata)initWithImageData:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v10 = a5;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;

  uint64_t v17 = [[PFMetadataImage alloc] initWithImageData:v16 contentType:v15 options:v10 timeZoneLookup:v14 cacheImageSource:v9 cacheImageData:v8];
  return &v17->super;
}

- (PFMetadata)initWithImageURL:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v11 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if (!v15)
  {
    id v21 = 0;
    id v15 = +[PFUniformTypeUtilities typeForURL:v14 error:&v21];
    id v17 = v21;
    if (!v15)
    {
      id v18 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v17;
        _os_log_fault_impl(&dword_1A41FE000, v18, OS_LOG_TYPE_FAULT, "Failed to get a content type for URL '%@' (ERROR: %@)", buf, 0x16u);
      }
    }
  }
  double v19 = [[PFMetadataImage alloc] initWithImageURL:v14 contentType:v15 options:v11 timeZoneLookup:v16 cacheImageSource:v9 cacheImageData:v8];

  return &v19->super;
}

- (PFMetadata)initWithContentType:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PFMetadata;
  uint64_t v11 = [(PFMetadata *)&v17 init];
  if (v11)
  {
    if (initWithContentType_options_timeZoneLookup__onceToken != -1) {
      dispatch_once(&initWithContentType_options_timeZoneLookup__onceToken, &__block_literal_global_2807);
    }
    objc_storeStrong((id *)&v11->_contentType, a3);
    v11->_int options = a4;
    if (v10) {
      WeakRetained = (PFTimeZoneLookup *)v10;
    }
    else {
      WeakRetained = (PFTimeZoneLookup *)objc_loadWeakRetained(&gDefaultTimeZoneLookup);
    }
    cachedTimeZoneLookup = v11->_cachedTimeZoneLookup;
    v11->_cachedTimeZoneLookup = WeakRetained;

    id v14 = objc_alloc_init(PFMetadataTypeVerifier);
    typeVerifier = v11->_typeVerifier;
    v11->_typeVerifier = v14;
  }
  return v11;
}

uint64_t __57__PFMetadata_initWithContentType_options_timeZoneLookup___block_invoke()
{
  metadataLog = (uint64_t)os_log_create("com.apple.photos.photosformats.pfmetadata", "PFMetadata");

  return MEMORY[0x1F41817F8]();
}

- (PFMetadata)initWithAVAsset:(id)a3 timeZoneLookup:(id)a4
{
  return [(PFMetadata *)self initWithAVAsset:a3 options:13 timeZoneLookup:a4];
}

- (PFMetadata)initWithAVURL:(id)a3 timeZoneLookup:(id)a4
{
  return [(PFMetadata *)self initWithAVURL:a3 options:13 timeZoneLookup:a4];
}

- (PFMetadata)initWithImageURL:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  return [(PFMetadata *)self initWithImageURL:a3 contentType:a4 options:13 timeZoneLookup:a5 cacheImageSource:0 cacheImageData:0];
}

- (id)initForLimitedPropertiesWithPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFURLRef v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    CFDictionaryRef v6 = +[PFMetadataImage defaultOptionsForCGImageSource];
    BOOL v7 = CGImageSourceCreateWithURL(v5, v6);
    if (v7)
    {
      BOOL v8 = v7;
      CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v6);
      id v10 = objc_alloc_init(PFTimeZoneLookup);
      if (v9)
      {
        uint64_t v11 = [(PFMetadata *)self initWithImageProperties:v9 contentType:0 options:460 timeZoneLookup:v10];

        if (v11) {
          [(PFMetadata *)v11 setFileURL:v5];
        }
      }
      else
      {
        uint64_t v11 = [(PFMetadata *)self initWithAVURL:v5 options:460 timeZoneLookup:v10];
      }
      CFRelease(v8);

      self = v11;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    id v12 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_ERROR, "Expected path to be non-nil", v14, 2u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (PFMetadata)initWithMetadataPlist:(id)a3 timeZoneLookup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = PFMetadataPlistContentTypeIdentifier;
  id v8 = a4;
  CFDictionaryRef v9 = [v6 objectForKeyedSubscript:v7];
  id v10 = +[PFUniformTypeUtilities typeWithIdentifier:v9];

  uint64_t v11 = [v6 objectForKeyedSubscript:PFMetadataPlistOptions];
  id v12 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", v10, (unsigned __int16)[v11 integerValue], v8);

  if (v12 && ![(PFMetadata *)v12 configureWithMetadataPlist:v6])
  {

    id v12 = 0;
  }

  return v12;
}

- (PFMetadata)initWithPropertyListRepresentationData:(id)a3 timeZoneLookup:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v16 = 0;
  id v8 = +[PFMetadata propertyListObjectFromEncodedData:v7 expectedClass:objc_opt_class() options:0 error:&v16];

  id v9 = v16;
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:PFMetadataPlistSourceType];
    uint64_t v11 = [v10 unsignedIntegerValue];

    switch(v11)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        id v12 = PFMetadataImage;
        break;
      case 6:
      case 7:
      case 9:
        id v12 = PFMetadataMovie;
        break;
      case 8:
        id v12 = PFMetadataLegacyMovieProperties;
        break;
      case 10:
        id v12 = PFMetadataSyndication;
        break;
      case 11:
        id v12 = PFMetadataImageCaptureMovieProperties;
        break;
      default:
        goto LABEL_6;
    }
    id v14 = (PFMetadata *)[[v12 alloc] initWithMetadataPlist:v8 timeZoneLookup:v6];
  }
  else
  {
    id v13 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_error_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_ERROR, "Failed to decode PFMetadata plist (%@)", buf, 0xCu);
    }
LABEL_6:
    id v14 = 0;
  }

  return v14;
}

- (PFMetadata)initWithImageProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  return [(PFMetadata *)self initWithImageProperties:a3 contentType:a4 options:12 timeZoneLookup:a5];
}

- (PFMetadata)initWithMediaURL:(id)a3 detail:(unsigned __int16)a4 timeZoneLookup:(id)a5 shouldCache:(BOOL)a6
{
  if (a4 == 1) {
    unsigned int v6 = 460;
  }
  else {
    unsigned int v6 = 12;
  }
  if (a4 == 2) {
    uint64_t v7 = 13;
  }
  else {
    uint64_t v7 = v6;
  }
  return [(PFMetadata *)self initWithMediaURL:a3 options:v7 timeZoneLookup:a5 shouldCache:a6];
}

- (PFMetadata)initWithSyndicationProperties:(id)a3
{
  id v4 = a3;

  CFURLRef v5 = [[PFMetadataSyndication alloc] initWithSyndicationProperties:v4];
  return &v5->super;
}

- (PFMetadata)initWithMediaURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5 shouldCache:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    id v18 = 0;
    id v12 = +[PFUniformTypeUtilities typeForURL:v10 error:&v18];
    id v13 = v18;
    if (v12)
    {
      if ([v12 conformsToType:*MEMORY[0x1E4F44400]])
      {
        id v14 = [(PFMetadata *)self initWithImageURL:v10 contentType:v12 options:v8 timeZoneLookup:v11 cacheImageSource:v6 cacheImageData:v6];
LABEL_10:
        id v15 = v14;
LABEL_12:

        goto LABEL_13;
      }
      if ([v12 conformsToType:*MEMORY[0x1E4F44448]])
      {
        id v14 = [(PFMetadata *)self initWithAVURL:v10 options:v8 timeZoneLookup:v11];
        goto LABEL_10;
      }
    }
    else
    {
      id v16 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl(&dword_1A41FE000, v16, OS_LOG_TYPE_ERROR, "Couldn't determine UTI for URL '%@' (ERROR: %@)", buf, 0x16u);
      }
    }

    id v15 = 0;
    goto LABEL_12;
  }

  id v15 = 0;
LABEL_13:

  return v15;
}

- (PFMetadata)initWithMediaURL:(id)a3 timeZoneLookup:(id)a4
{
  return [(PFMetadata *)self initWithMediaURL:a3 options:13 timeZoneLookup:a4 shouldCache:0];
}

- (id)hdrGainMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    int64_t v2 = (void *)*MEMORY[0x1E4F51098];
  }
  else {
    int64_t v2 = 0;
  }

  return v2;
}

- (id)burstUuidMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    int64_t v2 = (void *)*MEMORY[0x1E4F15538];
  }
  else {
    int64_t v2 = 0;
  }

  return v2;
}

- (id)photosFeatureFlagsMetadataKey
{
  if ([(PFMetadata *)self isImage])
  {
    int64_t v2 = +[PFMetadata photosFeatureFlagsMetadataKey];
  }
  else
  {
    int64_t v2 = 0;
  }

  return v2;
}

- (id)photoProcessingFlagsMetadataKey
{
  if ([(PFMetadata *)self isImage])
  {
    int64_t v2 = +[PFMetadata photoProcessingFlagsMetadataKey];
  }
  else
  {
    int64_t v2 = 0;
  }

  return v2;
}

- (id)playbackVariationMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    +[PFMetadata playbackVariationMetadataKey];
  }
  else {
  int64_t v2 = +[PFMetadata playbackVariationMetadataIdentifier];
  }

  return v2;
}

- (id)spatialOverCaptureIdentifierMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    +[PFMetadata spatialOverCaptureIdentifierMetadataKey];
  }
  else {
  int64_t v2 = +[PFMetadata spatialOverCaptureIdentifierMetadataIdentifier];
  }

  return v2;
}

- (id)livePhotoPairingIdentifierMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    +[PFMetadata livePhotoPairingIdentifierMetadataKey];
  }
  else {
  int64_t v2 = +[PFMetadata livePhotoPairingIdentifierMetadataIdentifier];
  }

  return v2;
}

- (id)renderOriginatingAssetIdentifierMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    +[PFMetadata renderOriginatingAssetIdentifierMetadataKey];
  }
  else {
  int64_t v2 = +[PFMetadata renderOriginatingAssetIdentifierMetadataIdentifier];
  }

  return v2;
}

- (id)originatingAssetIdentifierMetadataKey
{
  if ([(PFMetadata *)self isImage]) {
    +[PFMetadata originatingAssetIdentifierMetadataKey];
  }
  else {
  int64_t v2 = +[PFMetadata originatingAssetIdentifierMetadataIdentifier];
  }

  return v2;
}

+ (void)firstAudioTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PFMetadata_firstAudioTrackForAsset_resultBlock___block_invoke;
  v7[3] = &unk_1E5B2D4C8;
  id v8 = v5;
  id v6 = v5;
  +[PFMetadataMovie firstAudioTrackForAsset:a3 resultBlock:v7];
}

uint64_t __50__PFMetadata_firstAudioTrackForAsset_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)firstVideoTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PFMetadata_firstVideoTrackForAsset_resultBlock___block_invoke;
  v7[3] = &unk_1E5B2D4C8;
  id v8 = v5;
  id v6 = v5;
  +[PFMetadataMovie firstVideoTrackForAsset:a3 resultBlock:v7];
}

uint64_t __50__PFMetadata_firstVideoTrackForAsset_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)differencesBetweenDictionary:(id)a3 andDictionary:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__PFMetadata_differencesBetweenDictionary_andDictionary___block_invoke;
  v15[3] = &unk_1E5B2D4A0;
  id v16 = v6;
  id v10 = v9;
  id v17 = v10;
  id v18 = a1;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];

  id v12 = v17;
  id v13 = v10;

  return v13;
}

void __57__PFMetadata_differencesBetweenDictionary_andDictionary___block_invoke(id *a1, void *a2, void *a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = a1[5];
    id v9 = [a1[6] differencesBetweenDictionary:v6 andDictionary:v7];
    [v8 addEntriesFromDictionary:v9];
  }
  else if (([v6 isEqual:v7] & 1) == 0)
  {
    id v10 = v6;
    if (!v6)
    {
      id v10 = [MEMORY[0x1E4F1CA98] null];
    }
    v13[0] = v10;
    id v11 = v7;
    if (!v7)
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
    }
    v13[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    [a1[5] setObject:v12 forKeyedSubscript:v5];

    if (v7)
    {
      if (v6) {
        goto LABEL_10;
      }
    }
    else
    {

      if (v6) {
        goto LABEL_10;
      }
    }
  }
LABEL_10:
}

+ (id)exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4
{
  return +[PFMetadataMovie exifTimezoneOffsetFromDateString:a3 offsetInSeconds:a4];
}

+ (BOOL)parseISO6709String:(id)a3 outLatitude:(double *)a4 outLongitude:(double *)a5
{
  return +[PFMetadataMovie parseISO6709String:a3 outLatitude:a4 outLongitude:a5];
}

+ (id)defaultOptionsForCGImageSource
{
  return +[PFMetadataImage defaultOptionsForCGImageSource];
}

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionForAsset:(SEL)a3
{
  return +[PFMetadataMovie audioStreamBasicDescriptionForAsset:a4];
}

+ (id)propertyListObjectFromEncodedData:(id)a3 expectedClass:(Class)a4 options:(unint64_t)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (![v9 length])
  {
    id v10 = objc_alloc_init(a4);
    goto LABEL_12;
  }
  id v22 = 0;
  id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:a5 format:0 error:&v22];
  id v11 = v22;
  id v12 = v11;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a6)
      {
        id v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F281F8];
        uint64_t v23 = *MEMORY[0x1E4F28588];
        id v15 = NSString;
        id v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        id v18 = NSStringFromClass(a4);
        uint64_t v19 = [v15 stringWithFormat:@"Deserialized object was of class %@, expected class %@", v17, v18];
        v24[0] = v19;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
        *a6 = [v13 errorWithDomain:v14 code:2048 userInfo:v20];
      }
      goto LABEL_10;
    }
  }
  else
  {
    if (!a6)
    {
LABEL_10:
      id v10 = 0;
      goto LABEL_11;
    }
    id v10 = 0;
    *a6 = v11;
  }
LABEL_11:

LABEL_12:

  return v10;
}

+ (BOOL)_canEncodeInPropertyList:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)_filterPropertyListObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 _filterDictionary:v4];
LABEL_7:
    id v6 = v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 _filterArray:v4];
    goto LABEL_7;
  }
  if ([a1 _canEncodeInPropertyList:v4])
  {
    id v5 = v4;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

+ (id)_filterArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "_filterPropertyListObject:", *(void *)(*((void *)&v15 + 1) + 8 * v10), (void)v15);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v12 = v5;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (id)_filterDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v17);
        id v13 = [a1 _filterPropertyListObject:v12];

        if (v13) {
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    uint64_t v14 = v5;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

+ (id)encodedDataWithPropertyListObject:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F98];
  id v6 = [a1 _filterPropertyListObject:v4];
  id v14 = 0;
  uint64_t v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:&v14];
  id v8 = v14;

  if (!v7)
  {
    uint64_t v9 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v9;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = 0;
      __int16 v17 = 2114;
      long long v18 = v13;
      __int16 v19 = 2050;
      id v20 = v4;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_error_impl(&dword_1A41FE000, v11, OS_LOG_TYPE_ERROR, "Failed to encode data: %{public}@ for object <%{public}@:%{public}p> error: %{public}@", buf, 0x2Au);
    }
  }

  return v7;
}

+ (void)setDefaultTimeZoneLookup:(id)a3
{
}

+ (void)metadataForAsset:(id)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [[PFMetadata alloc] initWithAVAsset:v5 options:4 timeZoneLookup:0];
    if (v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__PFMetadata_metadataForAsset_completionHandler___block_invoke;
      void v12[3] = &unk_1E5B2F1D0;
      id v14 = v6;
      id v13 = v7;
      [(PFMetadata *)v13 loadMetadataWithCompletionHandler:v12];

      id v8 = v14;
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28228];
      id v8 = [NSString stringWithFormat:@"Failed to get metadata for asset %@", v5];
      v16[0] = v8;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      uint64_t v11 = [v9 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v10];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);
    }
  }
}

uint64_t __49__PFMetadata_metadataForAsset_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (id)hdrGainMetadataKey
{
  return (id)*MEMORY[0x1E4F51098];
}

+ (id)burstUuidMetadataKey
{
  return (id)*MEMORY[0x1E4F15538];
}

+ (id)photosFeatureFlagsMetadataKey
{
  return (id)*MEMORY[0x1E4F15580];
}

+ (id)photoProcessingFlagsMetadataKey
{
  return (id)*MEMORY[0x1E4F15578];
}

+ (id)playbackVariationMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier];
}

+ (id)playbackVariationMetadataKey
{
  return (id)*MEMORY[0x1E4F15590];
}

+ (id)spatialOverCaptureIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier];
}

+ (id)spatialOverCaptureIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E4F15608];
}

+ (id)livePhotoPairingIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataContentIdentifier];
}

+ (id)livePhotoPairingIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E4F15530];
}

+ (id)renderOriginatingAssetIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature];
}

+ (id)renderOriginatingAssetIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E4F15598];
}

+ (id)originatingAssetIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature];
}

+ (id)originatingAssetIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E4F15588];
}

@end