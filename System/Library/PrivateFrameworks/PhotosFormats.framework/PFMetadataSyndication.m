@interface PFMetadataSyndication
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoComplementDuration;
- (BOOL)configureWithMetadataPlist:(id)a3;
- (BOOL)flashFired;
- (BOOL)hasHDRGainMap;
- (BOOL)hasISOGainMap;
- (BOOL)hasSmartStyle;
- (BOOL)hasSpatialAudio;
- (BOOL)isAlchemist;
- (BOOL)isAnimatedImage;
- (BOOL)isCinematicVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrontFacingCamera;
- (BOOL)isHDR;
- (BOOL)isImage;
- (BOOL)isMovie;
- (BOOL)isPhotoBooth;
- (BOOL)isProRes;
- (BOOL)isSyndicationOriginated;
- (BOOL)isThreeImageStereoHEIC;
- (BOOL)isTimelapse;
- (PFMetadataSyndication)initWithSyndicationProperties:(id)a3;
- (id)GIFDelayTime;
- (id)HEICSDelayTime;
- (id)_makeDateTimeProperties;
- (id)_timeZoneOffsetStringFromTimeZoneOffsetSeconds:(id)a3;
- (id)altitude;
- (id)audioDataRate;
- (id)audioSampleRate;
- (id)audioTrackFormat;
- (id)burstUuid;
- (id)cameraMake;
- (id)cameraModel;
- (id)captureMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credit;
- (id)digitalZoomRatio;
- (id)exposureBias;
- (id)exposureTime;
- (id)fNumber;
- (id)firstVideoTrackCodecString;
- (id)flashCompensation;
- (id)flashValue;
- (id)focalLength;
- (id)focalLengthIn35mm;
- (id)generativeAIImageType;
- (id)gpsDateTime;
- (id)gpsHPositioningError;
- (id)hdrGain;
- (id)hdrGainMap;
- (id)imageDirection;
- (id)imageDirectionRef;
- (id)iso;
- (id)latitude;
- (id)lensMake;
- (id)lensModel;
- (id)lightSource;
- (id)livePhotoPairingIdentifier;
- (id)longitude;
- (id)meteringMode;
- (id)montageString;
- (id)nominalFrameRate;
- (id)originalFileName;
- (id)originatingAssetIdentifer;
- (id)pixelHeight;
- (id)pixelWidth;
- (id)playbackVariation;
- (id)plistForEncoding;
- (id)profileName;
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
- (id)spatialOverCaptureIdentifier;
- (id)speed;
- (id)speedRef;
- (id)syndicationProperties;
- (id)timeZoneOffset;
- (id)userComment;
- (id)videoDynamicRange;
- (id)whiteBalance;
- (id)whiteBalanceIndex;
- (int64_t)cameraUsedForCapture;
- (int64_t)customRendered;
- (int64_t)orientation;
- (signed)smartStyleCast;
- (signed)smartStyleVideoCastValue;
- (unint64_t)fileSize;
- (unint64_t)photoCaptureFlags;
- (unint64_t)photoProcessingFlags;
- (unsigned)firstVideoTrackCodec;
@end

@implementation PFMetadataSyndication

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFMetadataSyndication;
  if (![(PFMetadata *)&v8 isEqual:v4]
    || (syndicationProperties = self->_syndicationProperties, (syndicationProperties == 0) == (v4[22] != 0)))
  {
    char v6 = 0;
  }
  else
  {
    char v6 = -[NSDictionary isEqual:](syndicationProperties, "isEqual:");
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataSyndication;
  v4 = [(PFMetadata *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 22, self->_syndicationProperties);
  return v4;
}

- (id)plistForEncoding
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataSyndication;
  v3 = [(PFMetadata *)&v6 plistForEncoding];
  v4 = (void *)[v3 mutableCopy];

  [v4 setObject:self->_syndicationProperties forKeyedSubscript:PFMetadataPlistSyndicationProperties];

  return v4;
}

- (id)_timeZoneOffsetStringFromTimeZoneOffsetSeconds:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    if (v4 <= 0.0) {
      v5 = @"-";
    }
    else {
      v5 = @"+";
    }
    double __y = 0.0;
    long double v6 = modf(v4 / 3600.0, &__y);
    v7 = [NSString stringWithFormat:@"%@%02lu:%02lu", v5, (unint64_t)fabs(__y), (unint64_t)(v6 * 60.0)];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_makeDateTimeProperties
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"creationDate"];
  v5 = v4;
  if (v4)
  {
    long double v6 = PFStringFromDate(v4);
    if (v6) {
      BOOL v7 = *MEMORY[0x1E4F2F7F0] == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6);
    }
  }
  objc_super v8 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"timeZoneOffset"];
  v9 = [(PFMetadataSyndication *)self _timeZoneOffsetStringFromTimeZoneOffsetSeconds:v8];
  if (v9) {
    BOOL v10 = *MEMORY[0x1E4F2F8D0] == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9);
  }
  uint64_t v11 = *MEMORY[0x1E4F2F950];
  v12 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F950]];
  v13 = v12;
  if (v12)
  {
    v14 = NSString;
    [v12 doubleValue];
    v16 = objc_msgSend(v14, "stringWithFormat:", @"%03g", v15);
    v17 = [v16 substringFromIndex:2];

    if (v11 && v17) {
      [v3 setObject:v17 forKeyedSubscript:v11];
    }
  }
  uint64_t v20 = *MEMORY[0x1E4F2F800];
  v21[0] = v3;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  return v18;
}

- (id)credit
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FB68]];
}

- (id)generativeAIImageType
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"generativeAIImageType"];
}

- (BOOL)isThreeImageStereoHEIC
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isThreeImageStereoHEIC"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isAlchemist
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isAlchemist"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasSpatialAudio
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"hasSpatialAudio"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (signed)smartStyleVideoCastValue
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleVideoCastValue"];
  signed __int16 v3 = [v2 shortValue];

  return v3;
}

- (BOOL)hasSmartStyle
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"hasSmartStyle"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)smartStyleExpectingReversibility
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleExpectingReversibility"];
}

- (id)smartStyleIsReversible
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleIsReversible"];
}

- (id)smartStyleRenderingVersion
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleRenderingVersion"];
}

- (id)smartStyleIntensity
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleIntensity"];
}

- (id)smartStyleColorBias
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleColorBias"];
}

- (id)smartStyleToneBias
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleToneBias"];
}

- (signed)smartStyleCast
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"smartStyleCast"];
  signed __int16 v3 = [v2 intValue];

  return v3;
}

- (BOOL)isFrontFacingCamera
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"kPFImagePropertyFrontFacingCamera"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)syndicationProperties
{
  return self->_syndicationProperties;
}

- (BOOL)isSyndicationOriginated
{
  return 1;
}

- (BOOL)isAnimatedImage
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isAnimatedImage"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)semanticStylePreset
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"semanticStylePreset"];
}

- (id)semanticStyleRenderingVersion
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"semanticStyleRenderingVersion"];
}

- (id)semanticStyleWarmthBias
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"semanticStyleWarmthBias"];
}

- (id)semanticStyleToneBias
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"semanticStyleToneBias"];
}

- (BOOL)hasISOGainMap
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"hasISOGainMap"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasHDRGainMap
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"hasHDRGainMap"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)hdrGain
{
  char v3 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"hdrGain"];
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataSyndication;
  double v4 = [(PFMetadata *)&v6 hdrGainFromValue:v3];

  return v4;
}

- (BOOL)isHDR
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isHDR"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)userComment
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F958]];
}

- (BOOL)isPhotoBooth
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isPhotoBooth"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)originalFileName
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"originalFilename"];
}

- (unint64_t)fileSize
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (id)imageDirectionRef
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA38]];
}

- (id)imageDirection
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA30]];
}

- (id)altitude
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F9B0]];
}

- (id)gpsHPositioningError
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA28]];
}

- (id)gpsDateTime
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"gpsDateTime"];
}

- (id)speedRef
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA88]];
}

- (id)speed
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA80]];
}

- (id)latitude
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA40]];
}

- (id)longitude
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FA50]];
}

- (id)spatialOverCaptureIdentifier
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"socIdentifier"];
}

- (BOOL)isProRes
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isProRes"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)originatingAssetIdentifer
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"originiatinAssetIdentifier"];
}

- (id)playbackVariation
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"playbackVariation"];
}

- (id)livePhotoPairingIdentifier
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"livePhotoParingIdentifier"];
}

- (id)cameraMake
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FD60]];
}

- (id)cameraModel
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FD68]];
}

- (id)timeZoneOffset
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"timeZoneOffset"];
}

- (id)audioSampleRate
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"audioTrackSampleRate"];
}

- (id)audioTrackFormat
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"audioTrackFormat"];
}

- (id)audioDataRate
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"estimatedDataRate"];
}

- (id)montageString
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"isMontage"];
}

- (BOOL)isTimelapse
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"Time-lapse"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)captureMode
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"com.apple.photos.captureMode"];
}

- (id)firstVideoTrackCodecString
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"fourCharCode"];
}

- (unsigned)firstVideoTrackCodec
{
  v2 = [(PFMetadataSyndication *)self firstVideoTrackCodecString];
  unsigned int v3 = +[PFMediaUtilities fourCharCodeFromString:v2];

  return v3;
}

- (id)nominalFrameRate
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"framesPerSecond"];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  id v9 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"videoDurationValue"];
  v5 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"videoDurationTimescale"];
  if (v9) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v7 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, [v9 longLongValue], objc_msgSend(v5, "intValue"));
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  id v9 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"imageDisplayTime"];
  v5 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"imageDisplayTimescale"];
  if (v9) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v7 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, [v9 longLongValue], objc_msgSend(v5, "intValue"));
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoComplementDuration
{
  id v9 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"videoComplementDuration"];
  v5 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"videoComplementTimescale"];
  if (v9) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v7 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, [v9 longLongValue], objc_msgSend(v5, "intValue"));
  }

  return result;
}

- (BOOL)isCinematicVideo
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"videoContainsCinematicData"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)videoDynamicRange
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"videoDynamicRange"];
}

- (id)hdrGainMap
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F3C0]];
}

- (id)burstUuid
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"burstUuid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 UUIDString];
  }
  else
  {
    id v3 = v2;
  }
  double v4 = v3;

  return v4;
}

- (id)HEICSDelayTime
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FB10]];
}

- (id)GIFDelayTime
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F988]];
}

- (id)whiteBalanceIndex
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F570]];
}

- (id)lightSource
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F8A8]];
}

- (id)whiteBalance
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F970]];
}

- (id)exposureTime
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F828]];
}

- (id)meteringMode
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F8B8]];
}

- (id)iso
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F870]];
}

- (id)digitalZoomRatio
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F808]];
}

- (id)focalLengthIn35mm
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F848]];
}

- (id)focalLength
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F850]];
}

- (id)flashCompensation
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F6E8]];
}

- (BOOL)flashFired
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"flashFired"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)flashValue
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F838]];
}

- (id)exposureBias
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F810]];
}

- (id)fNumber
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F830]];
}

- (int64_t)customRendered
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F7E0]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)cameraUsedForCapture
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"cameraUsedForCapture"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (unint64_t)photoCaptureFlags
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"stillImageCaptureFlags"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)photoProcessingFlags
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:@"photoProcessingFlags"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (id)profileName
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FD10]];
}

- (id)lensMake
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F888]];
}

- (id)lensModel
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2F890]];
}

- (int64_t)orientation
{
  v2 = [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)pixelHeight
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
}

- (id)pixelWidth
{
  return [(NSDictionary *)self->_syndicationProperties objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
}

- (BOOL)isMovie
{
  v2 = [(PFMetadata *)self contentType];
  char v3 = [v2 conformsToType:*MEMORY[0x1E4F44448]];

  return v3;
}

- (BOOL)isImage
{
  v2 = [(PFMetadata *)self contentType];
  char v3 = [v2 conformsToType:*MEMORY[0x1E4F44400]];

  return v3;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMetadataSyndication;
  BOOL v5 = [(PFMetadata *)&v9 configureWithMetadataPlist:v4];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:PFMetadataPlistSyndicationProperties];
    syndicationProperties = self->_syndicationProperties;
    self->_syndicationProperties = v6;
  }
  return v5;
}

- (PFMetadataSyndication)initWithSyndicationProperties:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"uti"];
    objc_super v8 = +[PFUniformTypeUtilities typeWithIdentifier:v7];
    objc_super v9 = objc_alloc_init(PFTimeZoneLookup);
    v13.receiver = self;
    v13.super_class = (Class)PFMetadataSyndication;
    BOOL v10 = [(PFMetadata *)&v13 initWithContentType:v8 options:12 timeZoneLookup:v9];

    if (v10)
    {
      objc_storeStrong((id *)&v10->_syndicationProperties, a3);
      [(PFMetadata *)v10 setSourceType:10];
    }
    self = v10;

    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end