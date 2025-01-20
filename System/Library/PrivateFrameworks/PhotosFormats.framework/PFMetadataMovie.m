@interface PFMetadataMovie
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionForAsset:(SEL)a3;
+ (BOOL)_channelLayoutUsesChannelDescriptions:(const AudioChannelLayout *)a3;
+ (BOOL)_channelLayoutUsesHOA:(const AudioChannelLayout *)a3;
+ (BOOL)parseISO6709String:(id)a3 outLatitude:(double *)a4 outLongitude:(double *)a5;
+ (id)exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4;
+ (void)_enumerateTracksOfType:(id)a3 onAsset:(id)a4 withBlock:(id)a5;
+ (void)firstAudioTrackForAsset:(id)a3 resultBlock:(id)a4;
+ (void)firstVideoTrackForAsset:(id)a3 resultBlock:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime;
- (AudioStreamBasicDescription)_audioStreamBasicDescription;
- (BOOL)_computeIsProRes;
- (BOOL)_configureWithAVAsset:(id)a3;
- (BOOL)_configureWithAVProxyData:(id)a3;
- (BOOL)_configureWithAVURL:(id)a3;
- (BOOL)_convertToAVAssetProxyIfPossible;
- (BOOL)configureWithMetadataPlist:(id)a3;
- (BOOL)hasSpatialAudio;
- (BOOL)hasVitality;
- (BOOL)isActionCam;
- (BOOL)isAutoLivePhoto;
- (BOOL)isCinematicVideo;
- (BOOL)isDecodable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDR;
- (BOOL)isMovie;
- (BOOL)isPlayable;
- (BOOL)isProRes;
- (BOOL)isSloMo;
- (BOOL)isSpatialMedia;
- (BOOL)isSpatialOverCapture;
- (BOOL)isTimelapse;
- (BOOL)livePhotoVitalityLimitingAllowed;
- (BOOL)verifyShouldLoadTrackMetadata:(const char *)a3;
- (PFMetadataMovie)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5;
- (PFMetadataMovie)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5 preloadValues:(BOOL)a6;
- (PFMetadataMovie)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadataMovie)initWithAVURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5;
- (id)_apacProfileLevelDescriptionForFormatDescription:(opaqueCMFormatDescription *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4;
- (id)_cachedValueForKey:(id)a3 usingBlock:(id)a4;
- (id)_computeApacAudioTrackInfo;
- (id)_computeFirstTrackOfType:(id)a3;
- (id)_computeHEVCProfileInfo;
- (id)_computeStillImageDisplayTimeDictionary;
- (id)_contextForKeys:(id)a3 collectionKeys:(id)a4;
- (id)_exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4;
- (id)_firstAudioTrack;
- (id)_firstVideoTrack;
- (id)_makeDateTimeProperties;
- (id)_makeDateTimePropertiesForAsset:(id)a3;
- (id)_makeGPSProperties;
- (id)_makeGeometryProperties;
- (id)altitude;
- (id)apacAudioTrackBedChannelCount;
- (id)apacAudioTrackChannelCount;
- (id)apacAudioTrackCodecProfileLevelDescription;
- (id)apacAudioTrackHoaChannelCount;
- (id)artworkContentDescription;
- (id)audioBitsPerChannel;
- (id)audioBytesPerFrame;
- (id)audioBytesPerPacket;
- (id)audioChannelsPerFrame;
- (id)audioDataRate;
- (id)audioFramesPerPacket;
- (id)audioSampleRate;
- (id)audioTrackFormat;
- (id)audioTrackFormatFlags;
- (id)author;
- (id)cameraMake;
- (id)cameraModel;
- (id)captionAbstract;
- (id)captureMode;
- (id)collectionKeysToLoad;
- (id)colorPrimaries;
- (id)contentTypeFromFastModernizeVideoMedia;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstVideoTrackCodecString;
- (id)firstVideoTrackFormatDebugDescription;
- (id)focalLengthIn35mm;
- (id)gpsHPositioningError;
- (id)hevcProfileInfo;
- (id)imageDirection;
- (id)keysToLoad;
- (id)keywords;
- (id)lensModel;
- (id)livePhotoMinimumClientVersion;
- (id)livePhotoPairingIdentifier;
- (id)livePhotoVitalityScore;
- (id)livePhotoVitalityTransitionScore;
- (id)montageString;
- (id)nominalFrameRate;
- (id)originatingAssetIdentifier;
- (id)outOfBandHints;
- (id)outOfBandHintsBase64String;
- (id)playbackVariation;
- (id)plistForEncoding;
- (id)ptpMediaMetadata;
- (id)renderOriginatingAssetIdentifier;
- (id)software;
- (id)spatialMediaTrack;
- (id)spatialOverCaptureIdentifier;
- (id)speed;
- (id)stillImageDisplayTimeDictionary;
- (id)title;
- (id)transferFunction;
- (id)videoCodecName;
- (id)videoDataRate;
- (id)videoDynamicRange;
- (int64_t)_audioVideoProxyPropertyListForAsset:(id)a3 propertyList:(id *)a4 error:(id *)a5;
- (int64_t)_spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:(id)a3;
- (int64_t)orientation;
- (int64_t)spatialVideoRecommendationForImmersiveMode;
- (opaqueCMFormatDescription)_computeFirstFormatDescriptionOfType:(id)a3;
- (opaqueCMFormatDescription)_firstVideoTrackFormatDescription;
- (signed)smartStyleVideoCastValue;
- (unsigned)firstVideoTrackCodec;
- (void)_cacheAllTrackProperties;
- (void)_cacheCommonMetadataProperties;
- (void)_cacheComputedTrackMetadataProperties;
- (void)_cacheIndirectTrackMetadataProperties;
- (void)_checkHFRMetadataKeyShouldPlayAtFullFrameRate:(BOOL *)a3 containsHFRPlaybackKey:(BOOL *)a4;
- (void)_computeChannelCountsForApacAudioTrackInfo:(id)a3 maxChannelCount:(unint64_t)a4 audioChannelLayout:(const AudioChannelLayout *)a5;
- (void)_computeFirstVideoTrackCodecAndName;
- (void)_loadMetadataForAsset:(id)a3 withKeys:(id)a4 collectionKeys:(id)a5;
- (void)_loadMetadataForAsset:(id)a3 withKeys:(id)a4 collectionKeys:(id)a5 completionHandler:(id)a6;
- (void)_verifyAllValuesLoadedForAsset:(id)a3;
- (void)_verifyTrackValuesLoadedForAsset:(id)a3;
- (void)loadMetadataWithCompletionHandler:(id)a3;
@end

@implementation PFMetadataMovie

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_cached_values, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFMetadataMovie;
  if ([(PFMetadata *)&v12 isEqual:v4])
  {
    v5 = (id *)v4;
    asset = self->_asset;
    int v7 = (asset != 0) ^ (v5[22] == 0);
    if (asset) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      v9 = [(AVAsset *)asset propertyListForProxy];
      v10 = [v5[22] propertyListForProxy];
      LOBYTE(v7) = [v9 isEqualToDictionary:v10];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataMovie;
  id v4 = [(PFMetadata *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 22, self->_asset);
  objc_storeStrong(v4 + 23, self->_cached_values);
  return v4;
}

- (id)ptpMediaMetadata
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1EF7CA898 forKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  id v4 = NSNumber;
  [(PFMetadata *)self orientedPixelSize];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2FD00]];

  objc_super v6 = NSNumber;
  [(PFMetadata *)self orientedPixelSize];
  BOOL v8 = [v6 numberWithDouble:v7];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2FB48]];

  v9 = [(PFMetadataMovie *)self cameraMake];
  if (v9)
  {
  }
  else
  {
    v10 = [(PFMetadataMovie *)self cameraModel];

    if (!v10) {
      goto LABEL_5;
    }
  }
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v12 = [(PFMetadataMovie *)self cameraMake];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2FD60]];

  v13 = [(PFMetadataMovie *)self cameraModel];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2FD68]];

  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2FD40]];
LABEL_5:
  v14 = [(PFMetadata *)self gpsLocation];
  [v14 coordinate];
  if (v15 != 0.0)
  {
    v16 = [(PFMetadata *)self gpsLocation];
    [v16 coordinate];
    double v18 = v17;

    if (v18 == 0.0) {
      goto LABEL_9;
    }
    v27[0] = *MEMORY[0x1E4F2FA40];
    v19 = NSNumber;
    v14 = [(PFMetadata *)self gpsLocation];
    [v14 coordinate];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    v28[0] = v20;
    v27[1] = *MEMORY[0x1E4F2FA50];
    v21 = NSNumber;
    v22 = [(PFMetadata *)self gpsLocation];
    [v22 coordinate];
    v24 = [v21 numberWithDouble:v23];
    v28[1] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F2FA18]];
  }
LABEL_9:

  return v3;
}

- (id)plistForEncoding
{
  v10.receiver = self;
  v10.super_class = (Class)PFMetadataMovie;
  v3 = [(PFMetadata *)&v10 plistForEncoding];
  id v4 = (void *)[v3 mutableCopy];

  asset = self->_asset;
  if (asset)
  {
    objc_super v6 = [(AVAsset *)asset propertyListForProxy];
    [v4 setObject:v6 forKeyedSubscript:PFMetadataPlistAsset];

    double v7 = [(NSMutableDictionary *)self->_cached_values objectForKeyedSubscript:PFMetadataPlistIdentifyingTagClass];
    [v4 setObject:v7 forKeyedSubscript:PFMetadataPlistIdentifyingTagClass];

    BOOL v8 = [(NSMutableDictionary *)self->_cached_values objectForKeyedSubscript:PFMetadataPlistOriginalAssetDateProperties];
    [v4 setObject:v8 forKeyedSubscript:PFMetadataPlistOriginalAssetDateProperties];
  }

  return v4;
}

- (void)_checkHFRMetadataKeyShouldPlayAtFullFrameRate:(BOOL *)a3 containsHFRPlaybackKey:(BOOL *)a4
{
  double v7 = [(PFMetadata *)self typeVerifier];
  BOOL v8 = +[PFMetadataIdentifier quicktimeMetadataFullFrameRatePlaybackIntent];
  v9 = [(AVAsset *)self->_asset metadata];
  id v11 = [v7 valueForAVMetadataIdentifier:v8 fromAVMetadataItems:v9];

  objc_super v10 = v11;
  if (v11)
  {
    *a3 = [v11 BOOLValue];
    objc_super v10 = v11;
    *a4 = 1;
  }
}

- (id)_computeFirstTrackOfType:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x3032000000;
  objc_super v12 = __Block_byref_object_copy__4434;
  v13 = __Block_byref_object_dispose__4435;
  id v14 = 0;
  asset = self->_asset;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PFMetadataMovie__computeFirstTrackOfType___block_invoke;
  v8[3] = &unk_1E5B2DC58;
  v8[4] = &v9;
  +[PFMetadataMovie _enumerateTracksOfType:v4 onAsset:asset withBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__PFMetadataMovie__computeFirstTrackOfType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
}

- (opaqueCMFormatDescription)_computeFirstFormatDescriptionOfType:(id)a3
{
  v3 = [(PFMetadataMovie *)self _computeFirstTrackOfType:a3];
  id v4 = [v3 formatDescriptions];
  v5 = [v4 firstObject];

  return (opaqueCMFormatDescription *)v5;
}

- (void)_verifyTrackValuesLoadedForAsset:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  [v20 tracks];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v3;
        id v4 = *(void **)(*((void *)&v26 + 1) + 8 * v3);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v5 = [&unk_1EF7CB180 objectForKeyedSubscript:@"tracks"];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v38 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v23;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v23 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
              id v21 = 0;
              uint64_t v11 = [v4 statusOfValueForKey:v10 error:&v21];
              objc_super v12 = (__CFString *)v21;
              if (v11 != 2)
              {
                v13 = metadataLog;
                if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413058;
                  id v14 = @"no error";
                  if (v12) {
                    id v14 = v12;
                  }
                  uint64_t v31 = v10;
                  __int16 v32 = 2048;
                  id v33 = v20;
                  __int16 v34 = 2048;
                  v35 = v4;
                  __int16 v36 = 2112;
                  v37 = v14;
                  _os_log_debug_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_DEBUG, "Value for key '%@' for asset '%p', track '%p' is not loaded: %@", buf, 0x2Au);
                }
              }

              ++v9;
            }
            while (v7 != v9);
            uint64_t v15 = [v5 countByEnumeratingWithState:&v22 objects:v38 count:16];
            uint64_t v7 = v15;
          }
          while (v15);
        }

        uint64_t v3 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v18);
  }
}

- (void)_verifyAllValuesLoadedForAsset:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [&unk_1EF7CAD78 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = v7;
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(&unk_1EF7CAD78);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        v16 = v7;
        uint64_t v12 = [v4 statusOfValueForKey:v11 error:&v16];
        uint64_t v7 = v16;

        if (v12 != 2)
        {
          v13 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v14 = @"no error";
            if (v7) {
              id v14 = v7;
            }
            uint64_t v22 = v11;
            __int16 v23 = 2112;
            long long v24 = v14;
            _os_log_debug_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_DEBUG, "Value for key '%@' not loaded: %@", buf, 0x16u);
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v15 = [&unk_1EF7CAD78 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v6 = v15;
    }
    while (v15);
  }
  if ([&unk_1EF7CAD78 containsObject:@"tracks"]) {
    [(PFMetadataMovie *)self _verifyTrackValuesLoadedForAsset:v4];
  }
}

- (id)outOfBandHints
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PFMetadataMovie_outOfBandHints__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"outOfBandHints" usingBlock:v4];

  return v2;
}

id __33__PFMetadataMovie_outOfBandHints__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *MEMORY[0x1E4F15C18];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 176);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __33__PFMetadataMovie_outOfBandHints__block_invoke_2;
  v33[3] = &unk_1E5B2DCF8;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v27 = v5;
  id v34 = v5;
  uint64_t v35 = v6;
  +[PFMetadataMovie _enumerateTracksOfType:v3 onAsset:v4 withBlock:v33];
  uint64_t v7 = (void *)MEMORY[0x1E4F16558];
  uint64_t v8 = +[PFMetadataIdentifier quicktimeMetadataSpatialAggressorsSeen];
  uint64_t v9 = [v7 keyForIdentifier:v8];

  uint64_t v10 = (void *)MEMORY[0x1E4F16558];
  uint64_t v11 = +[PFMetadataIdentifier quicktimeMetadataSpatialFormatVersion];
  uint64_t v12 = [v10 keyForIdentifier:v11];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (!v13) {
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v30;
  uint64_t v16 = *MEMORY[0x1E4F15DF8];
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(obj);
      }
      long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      long long v19 = [v18 keySpace];
      if ([v19 isEqual:v16])
      {
        long long v20 = [v18 key];
        int v21 = [v20 isEqual:v9];

        if (!v21) {
          goto LABEL_10;
        }
        long long v19 = [v18 value];
        [v27 setObject:v19 forKeyedSubscript:v9];
      }

LABEL_10:
      uint64_t v22 = [v18 keySpace];
      if ([v22 isEqual:v16])
      {
        __int16 v23 = [v18 key];
        int v24 = [v23 isEqual:v12];

        if (!v24) {
          continue;
        }
        uint64_t v22 = [v18 value];
        [v27 setObject:v22 forKeyedSubscript:v12];
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  }
  while (v14);
LABEL_16:

  if ([v27 count]) {
    id v25 = v27;
  }
  else {
    id v25 = 0;
  }

  return v25;
}

void __33__PFMetadataMovie_outOfBandHints__block_invoke_2(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3)
{
  id v15 = a2;
  uint64_t v5 = *MEMORY[0x1E4F1EDE8];
  uint64_t v6 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F1EDE8]);
  if (v6) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v7 = *MEMORY[0x1E4F215E0];
  uint64_t v8 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F215E0]);
  if (v8) {
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
  uint64_t v9 = *MEMORY[0x1E4F21638];
  uint64_t v10 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F21638]);
  if (v10) {
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
  }
  uint64_t v11 = *MEMORY[0x1E4F21648];
  uint64_t v12 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F21648]);
  if (v12) {
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v11];
  }
  uint64_t v13 = [*(id *)(a1 + 40) _spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:v15];
  if (v13 != 2)
  {
    uint64_t v14 = [NSNumber numberWithInteger:v13];
    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:PFMetadataRecommendedForImmersiveModeKey];
  }
}

- (id)contentTypeFromFastModernizeVideoMedia
{
  return 0;
}

- (int64_t)_audioVideoProxyPropertyListForAsset:(id)a3 propertyList:(id *)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v43 = self->_stateHandler;
  uint64_t v9 = [v8 propertyListForProxy];
  if (v9)
  {
    uint64_t v10 = 0;
    int64_t v11 = 0;
    if (!a4) {
      goto LABEL_21;
    }
LABEL_20:
    *a4 = v9;
    goto LABEL_21;
  }
  if ([(PFMetadata *)self allowExportForProxy])
  {
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke;
    block[3] = &unk_1E5B2F5F0;
    uint64_t v12 = v43;
    v50 = v12;
    dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0, block);
    -[PFMetadataStateHandler addBreadcrumb:](v12, "addBreadcrumb:", @"%s: Calling +determineCompatibilityOfExportPreset:", "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]");
    uint64_t v14 = (void *)MEMORY[0x1E4F16360];
    uint64_t v15 = *MEMORY[0x1E4F15758];
    uint64_t v16 = *MEMORY[0x1E4F15AB0];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_2;
    v46[3] = &unk_1E5B2DCD0;
    v48 = &v51;
    uint64_t v39 = v15;
    dispatch_block_t v41 = v13;
    id v47 = v41;
    uint64_t v37 = v16;
    [v14 determineCompatibilityOfExportPreset:v15 withAsset:v8 outputFileType:v16 completionHandler:v46];
    dispatch_block_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    -[PFMetadataStateHandler addBreadcrumb:](v12, "addBreadcrumb:", @"%s: Completed +determineCompatibilityOfExportPreset:", "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]");
    if (*((unsigned char *)v52 + 24))
    {
      long long v17 = (void *)MEMORY[0x1E4F1CB10];
      long long v18 = NSTemporaryDirectory();
      long long v19 = [MEMORY[0x1E4F29128] UUID];
      long long v20 = [v19 UUIDString];
      int v21 = [v20 stringByAppendingPathExtension:@"mov"];
      uint64_t v22 = [v18 stringByAppendingPathComponent:v21];
      v42 = [v17 fileURLWithPath:v22];

      if (v42)
      {
        __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F16360]) initWithAsset:v8 presetName:v39];
        [v23 setOutputFileType:v37];
        [v23 setOutputURL:v42];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_3;
        v44[3] = &unk_1E5B2F5F0;
        int v24 = v12;
        v45 = v24;
        dispatch_block_t v25 = dispatch_block_create((dispatch_block_flags_t)0, v44);

        -[PFMetadataStateHandler addBreadcrumb:](v24, "addBreadcrumb:", @"%s: Calling -exportAsynchronouslyWithCompletionHandler: for AVAssetExportSession: %p", "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]", v23);
        [v23 exportAsynchronouslyWithCompletionHandler:v25];
        dispatch_block_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        -[PFMetadataStateHandler addBreadcrumb:](v24, "addBreadcrumb:", @"%s: Completed -exportAsynchronouslyWithCompletionHandler:", "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]");
        if ([v23 status] == 3)
        {
          uint64_t v26 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v42 options:0];

          if (v26)
          {
            uint64_t v9 = [v26 propertyListForProxy];
            int64_t v11 = 1;
          }
          else
          {
            uint64_t v9 = 0;
            int64_t v11 = 0;
          }
          uint64_t v35 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v35 removeItemAtURL:v42 error:0];

          uint64_t v10 = 0;
          id v8 = v26;
        }
        else
        {
          uint64_t v10 = [v23 error];
          uint64_t v9 = 0;
          int64_t v11 = 3;
        }
        long long v30 = v45;
      }
      else
      {
        v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        long long v29 = NSString;
        __int16 v23 = NSTemporaryDirectory();
        long long v30 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v40 = [v30 UUIDString];
        long long v31 = [v40 stringByAppendingPathExtension:@"mov"];
        long long v32 = [v23 stringByAppendingPathComponent:v31];
        id v33 = [v29 stringWithFormat:@"Failed to create a URL for path '%@'", v32];
        v58[0] = v33;
        id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
        uint64_t v10 = [v38 errorWithDomain:@"com.apple.PhotosFormats" code:3 userInfo:v34];

        uint64_t v9 = 0;
        int64_t v11 = 3;
        dispatch_block_t v25 = v41;
      }
    }
    else
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56 = @"Asset, is not compatible with the AVAssetExportPresetPassthrough export preset";
      long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      int64_t v11 = 3;
      uint64_t v10 = [v27 errorWithDomain:@"com.apple.PhotosFormats" code:3 userInfo:v28];
      uint64_t v9 = 0;
      dispatch_block_t v25 = v41;
    }
    _Block_object_dispose(&v51, 8);
    if (a4) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    int64_t v11 = 2;
    if (a4) {
      goto LABEL_20;
    }
  }
LABEL_21:
  if (a5) {
    *a5 = v10;
  }

  return v11;
}

uint64_t __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBreadcrumb:", @"%s: In handler for +determineCompatibilityOfExportPreset:", "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]_block_invoke");
}

uint64_t __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBreadcrumb:", @"%s: In handler for -exportAsynchronouslyWithCompletionHandler:", "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]_block_invoke_3");
}

- (id)_exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4
{
  id v5 = a3;
  if (_exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken != -1) {
    dispatch_once(&_exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken, &__block_literal_global_288);
  }
  uint64_t v6 = objc_msgSend((id)_exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 rangeAtIndex:1];
    uint64_t v10 = objc_msgSend(v5, "substringWithRange:", v8, v9);
    uint64_t v11 = [v7 rangeAtIndex:2];
    dispatch_block_t v13 = objc_msgSend(v5, "substringWithRange:", v11, v12);
    uint64_t v14 = [v7 rangeAtIndex:3];
    uint64_t v16 = objc_msgSend(v5, "substringWithRange:", v14, v15);
    long long v17 = [NSString stringWithFormat:@"%@%@:%@", v10, v13, v16];
    if (a4)
    {
      int v18 = [v10 isEqualToString:@"-"];
      int v19 = [v13 intValue];
      int64_t v20 = 3600 * v19 + 60 * (int)[v16 intValue];
      if (v18) {
        int64_t v20 = -v20;
      }
      *a4 = v20;
    }
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

uint64_t __69__PFMetadataMovie__exifTimezoneOffsetFromDateString_offsetInSeconds___block_invoke()
{
  _exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(-|\\+)(\\d\\d)(\\d\\d)$" options:0 error:0];

  return MEMORY[0x1F41817F8]();
}

- (AudioStreamBasicDescription)_audioStreamBasicDescription
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PFMetadataMovie__audioStreamBasicDescription__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  uint64_t v4 = [(PFMetadataMovie *)self _cachedValueForKey:@"audioStreamBasicDescription" usingBlock:v6];
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  *(void *)&retstr->mBitsPerChannel = 0;
  [v4 getValue:retstr];

  return result;
}

id __47__PFMetadataMovie__audioStreamBasicDescription__block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  +[PFMetadataMovie audioStreamBasicDescriptionForAsset:](PFMetadataMovie, "audioStreamBasicDescriptionForAsset:", *(void *)(*(void *)(a1 + 32) + 176), 0, 0, 0, 0, 0);
  v1 = [MEMORY[0x1E4F29238] valueWithBytes:v3 objCType:"{AudioStreamBasicDescription=dIIIIIIII}"];

  return v1;
}

- (opaqueCMFormatDescription)_firstVideoTrackFormatDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  _OWORD v3[2] = __52__PFMetadataMovie__firstVideoTrackFormatDescription__block_invoke;
  v3[3] = &unk_1E5B2DBE0;
  v3[4] = self;
  return (opaqueCMFormatDescription *)[(PFMetadataMovie *)self _cachedValueForKey:@"firstVideoTrackFormatDescription" usingBlock:v3];
}

id __52__PFMetadataMovie__firstVideoTrackFormatDescription__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _firstVideoTrack];
  v2 = [v1 formatDescriptions];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (id)_firstAudioTrack
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PFMetadataMovie__firstAudioTrack__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"firstAudioTrack" usingBlock:v4];

  return v2;
}

uint64_t __35__PFMetadataMovie__firstAudioTrack__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeFirstTrackOfType:*MEMORY[0x1E4F15BA8]];
}

- (id)_firstVideoTrack
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PFMetadataMovie__firstVideoTrack__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"firstVideoTrack" usingBlock:v4];

  return v2;
}

uint64_t __35__PFMetadataMovie__firstVideoTrack__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeFirstTrackOfType:*MEMORY[0x1E4F15C18]];
}

- (id)_apacProfileLevelDescriptionForFormatDescription:(opaqueCMFormatDescription *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  size_t sizeOut = 0;
  MagicCookie = CMAudioFormatDescriptionGetMagicCookie(a3, &sizeOut);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  long long v6 = *(_OWORD *)&a4->mBytesPerPacket;
  inSpecifier[0] = *(_OWORD *)&a4->mSampleRate;
  inSpecifier[1] = v6;
  uint64_t v15 = *(void *)&a4->mBitsPerChannel;
  uint64_t v16 = MagicCookie;
  LODWORD(v17) = sizeOut;
  LODWORD(v18) = 1836069990;
  UInt32 ioPropertyDataSize = 0;
  id v12 = 0;
  OSStatus Property = AudioFormatGetProperty(0x63706166u, 0x40u, inSpecifier, &ioPropertyDataSize, &v12);
  if (Property)
  {
    OSStatus v8 = Property;
    uint64_t v9 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v21 = v8;
      _os_log_error_impl(&dword_1A41FE000, v9, OS_LOG_TYPE_ERROR, "Unable to get audio format property for APAC profile/level description: %d", buf, 8u);
    }
    id v10 = 0;
  }
  else
  {
    id v10 = v12;
  }

  return v10;
}

- (id)_contextForKeys:(id)a3 collectionKeys:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 componentsJoinedByString:@","];
  if ([v6 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          dispatch_block_t v13 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          uint64_t v14 = v13;
          if (v13)
          {
            uint64_t v15 = [v13 componentsJoinedByString:@","];
            uint64_t v16 = [v7 stringByAppendingString:v15];

            uint64_t v7 = (void *)v16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v5 = v18;
  }

  return v7;
}

- (id)_cachedValueForKey:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [(NSMutableDictionary *)self->_cached_values objectForKeyedSubscript:v6];
  if (!v8)
  {
    uint64_t v9 = v7[2](v7);
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
    }
    id v8 = v11;

    [(NSMutableDictionary *)self->_cached_values setObject:v8 forKeyedSubscript:v6];
  }
  id v12 = [MEMORY[0x1E4F1CA98] null];
  if ([v8 isEqual:v12]) {
    dispatch_block_t v13 = 0;
  }
  else {
    dispatch_block_t v13 = v8;
  }
  id v14 = v13;

  return v14;
}

- (id)_makeGeometryProperties
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PFMetadataMovie__makeGeometryProperties__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"geometryProperties" usingBlock:v4];

  return v2;
}

id __42__PFMetadataMovie__makeGeometryProperties__block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _firstVideoTrack];
  [v1 naturalSize];
  double v3 = v2;
  double v5 = v4;
  if (v1)
  {
    [v1 preferredTransform];
    double v6 = v16;
    double v7 = v15;
    double v8 = v18;
    double v9 = v17;
  }
  else
  {
    double v8 = 0.0;
    double v6 = 0.0;
    double v9 = 0.0;
    double v7 = 0.0;
  }
  v22.size.width = v5 * v9 + v7 * v3;
  v22.size.double height = v5 * v8 + v6 * v3;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  CGRect v23 = CGRectStandardize(v22);
  double height = v23.size.height;
  v19[0] = *MEMORY[0x1E4F2FD00];
  id v11 = objc_msgSend(NSNumber, "numberWithDouble:", v23.size.width, v23.origin.y);
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E4F2FCE8];
  id v12 = [NSNumber numberWithDouble:height];
  v19[2] = *MEMORY[0x1E4F2FCA0];
  v20[1] = v12;
  v20[2] = &unk_1EF7CA880;
  dispatch_block_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  return v13;
}

- (id)_makeDateTimePropertiesForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PFMetadataPlistOriginalAssetDateProperties;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PFMetadataMovie__makeDateTimePropertiesForAsset___block_invoke;
  v9[3] = &unk_1E5B2DC80;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  double v7 = [(PFMetadataMovie *)self _cachedValueForKey:v5 usingBlock:v9];

  return v7;
}

id __51__PFMetadataMovie__makeDateTimePropertiesForAsset___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    double v2 = [MEMORY[0x1E4F1CA60] dictionary];
    double v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *MEMORY[0x1E4F2F800];
    [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F2F800]];

    *(void *)dispatch_block_t v25 = 0;
    uint64_t v5 = [*(id *)(a1 + 40) typeVerifier];
    uint64_t v6 = *MEMORY[0x1E4F15C50];
    double v7 = [*(id *)(*(void *)(a1 + 40) + 176) metadata];
    double v8 = [v5 valueForAVMetadataIdentifier:v6 fromAVMetadataItems:v7];

    double v9 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    id v10 = [v8 componentsSeparatedByCharactersInSet:v9];
    id v11 = [v10 componentsJoinedByString:&stru_1EF7AE1F8];

    if (v11)
    {
      id v12 = PFGMTTimeZone();
      dispatch_block_t v13 = PFDateFromStringTimeZoneFormat(v11, v12, @"yyyy-MM-dd'T'HH:mm:ssZZZZZ");

      if (v13)
      {
        uint64_t v14 = +[PFMetadataMovie exifTimezoneOffsetFromDateString:v8 offsetInSeconds:v25];
        if (v14)
        {
          double v15 = (void *)v14;
          double v16 = [v2 objectForKeyedSubscript:v4];
          [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2F8D0]];

          uint64_t v17 = *(void *)v25;
LABEL_13:

          long long v20 = [v13 dateByAddingTimeInterval:(double)v17];
          long long v21 = PFGMTTimeZone();
          CGRect v22 = PFStringFromDateTimeZoneFormat(v20, v21, 0);

          CGRect v23 = [v2 objectForKeyedSubscript:v4];
          [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F2F7F0]];

LABEL_14:
          goto LABEL_15;
        }
LABEL_12:
        double v15 = [MEMORY[0x1E4F1CAF0] localTimeZone];
        uint64_t v17 = [v15 secondsFromGMTForDate:v13];
        goto LABEL_13;
      }
      dispatch_block_t v13 = PFDateFromString(v8);
      if (v13) {
        goto LABEL_12;
      }
    }
    long long v19 = [*(id *)(a1 + 32) creationDate];
    dispatch_block_t v13 = [v19 dateValue];

    if (!v13)
    {
      dispatch_block_t v13 = [*(id *)(a1 + 40) fileCreationDate];
      if (!v13) {
        goto LABEL_14;
      }
    }
    goto LABEL_12;
  }
  double v18 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)dispatch_block_t v25 = 136315138;
    *(void *)&v25[4] = "-[PFMetadataMovie _makeDateTimePropertiesForAsset:]_block_invoke";
    _os_log_error_impl(&dword_1A41FE000, v18, OS_LOG_TYPE_ERROR, "asset should not be nil %s", v25, 0xCu);
  }
  double v2 = 0;
LABEL_15:

  return v2;
}

- (id)_makeDateTimeProperties
{
  return [(PFMetadataMovie *)self _makeDateTimePropertiesForAsset:self->_asset];
}

- (id)_makeGPSProperties
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PFMetadataMovie__makeGPSProperties__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  double v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"gpsProperties" usingBlock:v4];

  return v2;
}

id __37__PFMetadataMovie__makeGPSProperties__block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  double v3 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v4 = *MEMORY[0x1E4F15C60];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  uint64_t v6 = [v3 valueForAVMetadataIdentifier:v4 fromAVMetadataItems:v5];

  if (v6)
  {
    double v10 = 0.0;
    double v11 = 0.0;
    if (+[PFMetadataMovie parseISO6709String:v6 outLatitude:&v11 outLongitude:&v10])
    {
      double v7 = [NSNumber numberWithDouble:v11];
      if (v7 && *MEMORY[0x1E4F2FA40]) {
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v7);
      }

      double v8 = [NSNumber numberWithDouble:v10];
      if (v8 && *MEMORY[0x1E4F2FA50]) {
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8);
      }
    }
  }

  return v2;
}

- (void)_computeChannelCountsForApacAudioTrackInfo:(id)a3 maxChannelCount:(unint64_t)a4 audioChannelLayout:(const AudioChannelLayout *)a5
{
  id v20 = a3;
  if ([(id)objc_opt_class() _channelLayoutUsesChannelDescriptions:a5])
  {
    uint64_t mNumberChannelDescriptions = a5->mNumberChannelDescriptions;
    if (mNumberChannelDescriptions)
    {
      uint64_t v8 = 0;
      uint64_t mChannelLayoutTag_low = 0;
      mChannelDescriptions = a5->mChannelDescriptions;
      do
      {
        AudioChannelLabel mChannelLabel = mChannelDescriptions->mChannelLabel;
        ++mChannelDescriptions;
        BOOL v12 = (mChannelLabel & 0xFFFF0000) != 0x10000;
        unsigned int v13 = mChannelLabel & 0xFFFE0000;
        if ((mChannelLabel & 0xFFFF0000) == 0x10000) {
          ++v8;
        }
        uint64_t v14 = v13 == 0x20000 && v12;
        mChannelLayoutTag_low += v14;
        --mNumberChannelDescriptions;
      }
      while (mNumberChannelDescriptions);
    }
    else
    {
      uint64_t mChannelLayoutTag_low = 0;
      uint64_t v8 = 0;
    }
    uint64_t v15 = a4 - mChannelLayoutTag_low - v8;
  }
  else if ([(id)objc_opt_class() _channelLayoutUsesHOA:a5])
  {
    uint64_t v15 = 0;
    uint64_t mChannelLayoutTag_low = LOWORD(a5->mChannelLayoutTag);
  }
  else
  {
    uint64_t mChannelLayoutTag_low = 0;
    uint64_t v15 = 0;
  }
  if (a4)
  {
    double v16 = [NSNumber numberWithUnsignedInteger:a4];
    [v20 setObject:v16 forKeyedSubscript:@"channelCount"];
  }
  if (mChannelLayoutTag_low)
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:mChannelLayoutTag_low];
    [v20 setObject:v17 forKeyedSubscript:@"hoaChannelCount"];
  }
  double v18 = v20;
  if (v15)
  {
    long long v19 = [NSNumber numberWithUnsignedInteger:v15];
    [v20 setObject:v19 forKeyedSubscript:@"bedChannelCount"];

    double v18 = v20;
  }
}

- (id)_computeApacAudioTrackInfo
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  double v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"apacAudioTrackInfo" usingBlock:v4];

  return v2;
}

id __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  uint64_t v3 = *MEMORY[0x1E4F15BA8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 176);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke_2;
  v9[3] = &unk_1E5B2DCA8;
  void v9[4] = v4;
  double v11 = v12;
  id v6 = v2;
  id v10 = v6;
  +[PFMetadataMovie _enumerateTracksOfType:v3 onAsset:v5 withBlock:v9];
  double v7 = (void *)[v6 copy];

  _Block_object_dispose(v12, 8);

  return v7;
}

void __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke_2(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  if (a4 == 1634754915 || a4 == 1902211171 || a4 == 1667330147)
  {
    RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(a3);
    if (RichestDecodableFormat)
    {
      double v11 = RichestDecodableFormat;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = RichestDecodableFormat->mASBD.mChannelsPerFrame;
      objc_msgSend(*(id *)(a1 + 32), "_computeChannelCountsForApacAudioTrackInfo:maxChannelCount:audioChannelLayout:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), CMAudioFormatDescriptionGetChannelLayout(a3, 0));
      BOOL v12 = *(void **)(a1 + 32);
      long long v13 = *(_OWORD *)&v11->mASBD.mSampleRate;
      long long v14 = *(_OWORD *)&v11->mASBD.mBytesPerPacket;
      uint64_t v21 = *(void *)&v11->mASBD.mBitsPerChannel;
      *(_OWORD *)id v20 = v13;
      *(_OWORD *)&v20[16] = v14;
      uint64_t v15 = [v12 _apacProfileLevelDescriptionForFormatDescription:a3 audioStreamBasicDescription:v20];
      [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:@"codecProfileLevelDescription"];

      *a5 = 1;
    }
    else
    {
      double v16 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v16;
        double v18 = +[PFMediaUtilities stringFromFourCharCode:a4];
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 176);
        *(_DWORD *)id v20 = 138543618;
        *(void *)&void v20[4] = v18;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v19;
        _os_log_error_impl(&dword_1A41FE000, v17, OS_LOG_TYPE_ERROR, "Unable to get format list item for track with codec %{public}@ in asset %@", v20, 0x16u);
      }
    }
  }
}

- (id)_computeHEVCProfileInfo
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PFMediaUtilities hevcProfileInformationForVideoTrackFormatDescription:[(PFMetadataMovie *)self _firstVideoTrackFormatDescription]];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    asset = self->_asset;
    int v6 = 138412290;
    double v7 = asset;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to get profile/tier/level for %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (int64_t)_spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"spatialVideoRecommendationForImmersiveMode.%d", objc_msgSend(v4, "trackID"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__PFMetadataMovie__spatialVideoRecommendationForImmersiveModeForAssetVideoTrack___block_invoke;
  v10[3] = &unk_1E5B2DC80;
  v10[4] = self;
  id v11 = v4;
  id v6 = v4;
  double v7 = [(PFMetadataMovie *)self _cachedValueForKey:v5 usingBlock:v10];
  int64_t v8 = [v7 integerValue];

  return v8;
}

id __81__PFMetadataMovie__spatialVideoRecommendationForImmersiveModeForAssetVideoTrack___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSpatialMedia])
  {
    double v2 = +[PFMediaUtilities metadataForFormat:*MEMORY[0x1E4F15D18] forAssetTrack:*(void *)(a1 + 40)];
    uint64_t v3 = [*(id *)(a1 + 32) typeVerifier];
    id v4 = +[PFMetadataIdentifier quicktimeMetadataSpatialVideoRecommendedForImmersiveMode];
    uint64_t v5 = [v3 valueForAVMetadataIdentifier:v4 fromAVMetadataItems:v2];

    id v6 = NSNumber;
    if (v5) {
      uint64_t v7 = [v5 BOOLValue];
    }
    else {
      uint64_t v7 = 2;
    }
    int64_t v8 = [v6 numberWithInteger:v7];
  }
  else
  {
    int64_t v8 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v8;
}

- (int64_t)spatialVideoRecommendationForImmersiveMode
{
  uint64_t v3 = [(PFMetadataMovie *)self spatialMediaTrack];
  int64_t v4 = [(PFMetadataMovie *)self _spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:v3];

  return v4;
}

- (BOOL)isSpatialMedia
{
  double v2 = [(PFMetadataMovie *)self spatialMediaTrack];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)spatialMediaTrack
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PFMetadataMovie_spatialMediaTrack__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  double v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"spatialMediaTrack" usingBlock:v4];

  return v2;
}

id __36__PFMetadataMovie_spatialMediaTrack__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__4434;
  id v10 = __Block_byref_object_dispose__4435;
  id v11 = 0;
  uint64_t v1 = *MEMORY[0x1E4F15C18];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 176);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PFMetadataMovie_spatialMediaTrack__block_invoke_2;
  v5[3] = &unk_1E5B2DC58;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:v1 onAsset:v2 withBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__PFMetadataMovie_spatialMediaTrack__block_invoke_2(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3, uint64_t a4, unsigned char *a5)
{
  id v13 = a2;
  id v9 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F215E0]);
  id v10 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F21638]);
  if ([v13 hasMediaCharacteristic:*MEMORY[0x1E4F15B28]]) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || v10 == 0;
  if (!v12 && [v13 hasMediaCharacteristic:*MEMORY[0x1E4F15B50]])
  {
    *a5 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (BOOL)_computeIsProRes
{
  unsigned int v2 = [(PFMetadataMovie *)self firstVideoTrackCodec];
  uint64_t v3 = 0;
  char v4 = 0;
  do
    v4 |= v2 == _computeIsProRes_proResCodecs[v3++];
  while (v3 != 6);
  return v4 & 1;
}

- (id)_computeStillImageDisplayTimeDictionary
{
  v42[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_asset;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v29 = v3;
    char v4 = [(PFMetadata *)self fileURL];

    if (!v4) {
      goto LABEL_27;
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F166C8];
    uint64_t v6 = [(PFMetadata *)self fileURL];
    BOOL v7 = [(PFMetadata *)self noOutOfProcess];
    if (v7)
    {
      uint64_t v41 = *MEMORY[0x1E4F157C0];
      v42[0] = MEMORY[0x1E4F1CC38];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [v5 URLAssetWithURL:v6 options:v8];

    if (v7) {
    uint64_t v3 = (AVAsset *)v9;
    }
  }
  uint64_t v10 = MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__4434;
  __int16 v36 = __Block_byref_object_dispose__4435;
  id v37 = 0;
  uint64_t v11 = *MEMORY[0x1E4F15BE0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__PFMetadataMovie__computeStillImageDisplayTimeDictionary__block_invoke;
  v31[3] = &unk_1E5B2DC58;
  v31[4] = &v32;
  +[PFMetadataMovie _enumerateTracksOfType:v11 onAsset:v3 withBlock:v31];
  CMTimeFlags flags = *(_DWORD *)(v10 + 12);
  CMTimeEpoch epoch = *(void *)(v10 + 16);
  uint64_t v14 = v33[5];
  long long v29 = v3;
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v14 outputSettings:0];
    id v30 = 0;
    double v16 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v3 error:&v30];
    id v28 = v30;
    if (v16)
    {
      [v16 addOutput:v15];
      [v16 startReading];
      uint64_t v17 = *MEMORY[0x1E4F218A0];
      do
      {
        double v18 = (opaqueCMSampleBuffer *)[v15 copyNextSampleBuffer];
        uint64_t v19 = v18;
        if (!v18) {
          break;
        }
        if (CMSampleBufferGetNumSamples(v18))
        {
          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F166C0]) initWithSampleBuffer:v19];
          uint64_t v21 = (void *)MEMORY[0x1E4F16558];
          uint64_t v22 = [v20 items];
          CGRect v23 = [v21 metadataItemsFromArray:v22 filteredByIdentifier:v17];
          uint64_t v24 = [v23 firstObject];

          if (v24)
          {
            CMSampleBufferGetOutputPresentationTimeStamp(&time, v19);
            CMTimeValue value = time.value;
            CMTimeFlags flags = time.flags;
            CMTimeScale timescale = time.timescale;
            CMTimeEpoch epoch = time.epoch;
          }
        }
        CFRelease(v19);
      }
      while ((flags & 1) == 0);
      [v16 cancelReading];
    }
    if ((flags & 1) == 0)
    {
      dispatch_block_t v25 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        LODWORD(time.value) = 138412290;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
        _os_log_error_impl(&dword_1A41FE000, v25, OS_LOG_TYPE_ERROR, "Invalid still image display time: %@", (uint8_t *)&time, 0xCu);
      }
    }
  }
  if (flags)
  {
    CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    time.CMTimeValue value = value;
    time.CMTimeScale timescale = timescale;
    time.CMTimeFlags flags = flags;
    time.CMTimeEpoch epoch = epoch;
    char v4 = CMTimeCopyAsDictionary(&time, v26);
  }
  else
  {
    char v4 = 0;
  }
  _Block_object_dispose(&v32, 8);

LABEL_27:

  return v4;
}

void __58__PFMetadataMovie__computeStillImageDisplayTimeDictionary__block_invoke(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3, uint64_t a4, unsigned char *a5)
{
  id v10 = a2;
  uint64_t v9 = CMMetadataFormatDescriptionGetIdentifiers(a3);
  if ([v9 containsObject:*MEMORY[0x1E4F218A0]])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a5 = 1;
  }
}

- (signed)smartStyleVideoCastValue
{
  uint64_t v3 = [(PFMetadata *)self typeVerifier];
  char v4 = +[PFMetadataIdentifier quicktimeMetadataSmartStyleCast];
  uint64_t v5 = [(AVAsset *)self->_asset metadata];
  uint64_t v6 = [v3 valueForAVMetadataIdentifier:v4 fromAVMetadataItems:v5];
  signed __int16 v7 = [v6 intValue];

  return v7;
}

- (id)hevcProfileInfo
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PFMetadataMovie_hevcProfileInfo__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  unsigned int v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"hevcProfileInfo" usingBlock:v4];

  return v2;
}

uint64_t __34__PFMetadataMovie_hevcProfileInfo__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeHEVCProfileInfo];
}

- (id)outOfBandHintsBase64String
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PFMetadataMovie_outOfBandHintsBase64String__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  unsigned int v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"outOfBandHintsBase64String" usingBlock:v4];

  return v2;
}

id __45__PFMetadataMovie_outOfBandHintsBase64String__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) outOfBandHints];
  if (![v1 count])
  {
    char v4 = 0;
    goto LABEL_10;
  }
  id v9 = 0;
  unsigned int v2 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v1 format:200 options:0 error:&v9];
  id v3 = v9;
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      uint64_t v5 = MEMORY[0x1E4F14500];
      uint64_t v6 = "Plist serialization failure for URL out of band hints: %@";
      uint32_t v7 = 12;
      goto LABEL_14;
    }
LABEL_8:
    char v4 = 0;
    goto LABEL_9;
  }
  char v4 = [v2 base64EncodedStringWithOptions:0];
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = MEMORY[0x1E4F14500];
      uint64_t v6 = "Base64 serialization failure for URL out of band hints";
      uint32_t v7 = 2;
LABEL_14:
      _os_log_error_impl(&dword_1A41FE000, v5, OS_LOG_TYPE_ERROR, v6, buf, v7);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

LABEL_10:

  return v4;
}

- (id)apacAudioTrackCodecProfileLevelDescription
{
  unsigned int v2 = [(PFMetadataMovie *)self _computeApacAudioTrackInfo];
  id v3 = [v2 objectForKeyedSubscript:@"codecProfileLevelDescription"];

  return v3;
}

- (id)apacAudioTrackBedChannelCount
{
  unsigned int v2 = [(PFMetadataMovie *)self _computeApacAudioTrackInfo];
  id v3 = [v2 objectForKeyedSubscript:@"bedChannelCount"];

  return v3;
}

- (id)apacAudioTrackHoaChannelCount
{
  unsigned int v2 = [(PFMetadataMovie *)self _computeApacAudioTrackInfo];
  id v3 = [v2 objectForKeyedSubscript:@"hoaChannelCount"];

  return v3;
}

- (id)apacAudioTrackChannelCount
{
  unsigned int v2 = [(PFMetadataMovie *)self _computeApacAudioTrackInfo];
  id v3 = [v2 objectForKeyedSubscript:@"channelCount"];

  return v3;
}

- (BOOL)isPlayable
{
  if ([(PFMetadataMovie *)self isHDR]
    && !+[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback])
  {
    return 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__PFMetadataMovie_isPlayable__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  id v3 = [(PFMetadataMovie *)self _cachedValueForKey:@"isPlayable" usingBlock:v6];
  char v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __29__PFMetadataMovie_isPlayable__block_invoke(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) isPlayable];

  return [v1 numberWithBool:v2];
}

- (BOOL)isDecodable
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PFMetadataMovie_isDecodable__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"isDecodable" usingBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __30__PFMetadataMovie_isDecodable__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint32_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  uint64_t v1 = *MEMORY[0x1E4F15C18];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 176);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PFMetadataMovie_isDecodable__block_invoke_2;
  v5[3] = &unk_1E5B2DC58;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:v1 onAsset:v2 withBlock:v5];
  char v3 = [NSNumber numberWithBool:*((unsigned __int8 *)v7 + 24)];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__PFMetadataMovie_isDecodable__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if ([v7 isEnabled] && (objc_msgSend(v7, "isDecodable") & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
}

- (id)transferFunction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PFMetadataMovie_transferFunction__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"transferFunction" usingBlock:v4];

  return v2;
}

CFPropertyListRef __35__PFMetadataMovie_transferFunction__block_invoke(uint64_t a1)
{
  uint64_t v1 = (const opaqueCMFormatDescription *)[*(id *)(a1 + 32) _firstVideoTrackFormatDescription];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F24BC8];

  return CMFormatDescriptionGetExtension(v1, v2);
}

- (id)colorPrimaries
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PFMetadataMovie_colorPrimaries__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  CFStringRef v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"colorPrimaries" usingBlock:v4];

  return v2;
}

CFPropertyListRef __33__PFMetadataMovie_colorPrimaries__block_invoke(uint64_t a1)
{
  uint64_t v1 = (const opaqueCMFormatDescription *)[*(id *)(a1 + 32) _firstVideoTrackFormatDescription];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F24A90];

  return CMFormatDescriptionGetExtension(v1, v2);
}

- (id)firstVideoTrackFormatDebugDescription
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PFMetadataMovie_firstVideoTrackFormatDebugDescription__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  CFStringRef v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"firstVideoTrackFormatDebugDescription" usingBlock:v4];

  return v2;
}

id __56__PFMetadataMovie_firstVideoTrackFormatDebugDescription__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _firstVideoTrack];
  CFStringRef v2 = +[PFMediaUtilities formatDebugDescriptionForVideoTrack:v1];

  return v2;
}

- (id)captureMode
{
  char v3 = +[PFMetadataIdentifier quickTimeMetadataCaptureMode];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__PFMetadataMovie_captureMode__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  char v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __30__PFMetadataMovie_captureMode__block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F15D18];
  char v3 = [*(id *)(a1 + 32) _firstVideoTrack];
  char v4 = +[PFMediaUtilities metadataForFormat:v2 forAssetTrack:v3];

  uint64_t v5 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v6 = +[PFMetadataIdentifier quickTimeMetadataCaptureMode];
  id v7 = [v5 valueForAVMetadataIdentifier:v6 fromAVMetadataItems:v4];

  return v7;
}

- (id)author
{
  uint64_t v2 = *MEMORY[0x1E4F15C48];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__PFMetadataMovie_author__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  char v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __25__PFMetadataMovie_author__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C48];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  uint64_t v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)montageString
{
  uint64_t v2 = *MEMORY[0x1E4F15D78];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__PFMetadataMovie_montageString__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __32__PFMetadataMovie_montageString__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D78];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  uint64_t v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (BOOL)isActionCam
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataKeyActionVideoStabilizationStrength];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__PFMetadataMovie_isActionCam__block_invoke;
  v7[3] = &unk_1E5B2DBE0;
  v7[4] = self;
  char v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v7];
  char v5 = [v4 BOOLValue];

  return v5;
}

id __30__PFMetadataMovie_isActionCam__block_invoke(uint64_t a1)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) typeVerifier];
  char v4 = +[PFMetadataIdentifier quickTimeMetadataKeyActionVideoStabilizationStrength];
  char v5 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  uint64_t v6 = [v3 valueForAVMetadataIdentifier:v4 fromAVMetadataItems:v5];
  id v7 = [v2 numberWithInt:v6 != 0];

  return v7;
}

- (BOOL)isProRes
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PFMetadataMovie_isProRes__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"isProRes" usingBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __27__PFMetadataMovie_isProRes__block_invoke(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) _computeIsProRes];

  return [v1 numberWithBool:v2];
}

- (BOOL)isTimelapse
{
  uint64_t v2 = [(PFMetadataMovie *)self captureMode];
  char v3 = [v2 isEqualToString:@"Time-lapse"];

  return v3;
}

- (BOOL)hasSpatialAudio
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PFMetadataMovie_hasSpatialAudio__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"hasSpatialAudio" usingBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __34__PFMetadataMovie_hasSpatialAudio__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v1 = *MEMORY[0x1E4F15BA8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 176);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PFMetadataMovie_hasSpatialAudio__block_invoke_2;
  v5[3] = &unk_1E5B2DC58;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:v1 onAsset:v2 withBlock:v5];
  char v3 = [NSNumber numberWithBool:*((unsigned __int8 *)v7 + 24)];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __34__PFMetadataMovie_hasSpatialAudio__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = FigAudioFormatDescriptionGetCinematicAudioEffectEligibility();
  if (result)
  {
    *a5 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isCinematicVideo
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PFMetadataMovie_isCinematicVideo__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"isCinematicVideo" usingBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __35__PFMetadataMovie_isCinematicVideo__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v1 = *MEMORY[0x1E4F15BE0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 176);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PFMetadataMovie_isCinematicVideo__block_invoke_2;
  v5[3] = &unk_1E5B2DC58;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:v1 onAsset:v2 withBlock:v5];
  char v3 = [NSNumber numberWithBool:*((unsigned __int8 *)v7 + 24)];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__PFMetadataMovie_isCinematicVideo__block_invoke_2(uint64_t a1, int a2, CMMetadataFormatDescriptionRef desc, uint64_t a4, unsigned char *a5)
{
  CMMetadataFormatDescriptionGetIdentifiers(desc);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = +[PFMetadataIdentifier quickTimeMetadataCinematicVideoRendering];
  if ([v13 containsObject:v7])
  {
    uint64_t v8 = +[PFMetadataIdentifier quickTimeMetadataCinematicVideoCinematography];
    char v9 = [v13 containsObject:v8];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = a1 + 32;
    *(unsigned char *)(*(void *)(v11 + 8) + 24) = v9;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v10 = a1 + 32;
    *(unsigned char *)(*(void *)(v12 + 8) + 24) = 0;
  }

  if (*(unsigned char *)(*(void *)(*(void *)v10 + 8) + 24)) {
    *a5 = 1;
  }
}

- (BOOL)isSloMo
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__PFMetadataMovie_isSloMo__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"isSloMo" usingBlock:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __26__PFMetadataMovie_isSloMo__block_invoke(uint64_t a1)
{
  __int16 v10 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) nominalFrameRate];
  [v2 doubleValue];
  *(float *)&double v3 = v3;
  +[PFVideoAdjustments defaultSlowMotionRateForNominalFrameRate:v3];
  float v5 = v4;

  [*(id *)(a1 + 32) _checkHFRMetadataKeyShouldPlayAtFullFrameRate:(char *)&v10 + 1 containsHFRPlaybackKey:&v10];
  if ((_BYTE)v10 || v5 >= 1.0)
  {
    if ((_BYTE)v10) {
      BOOL v7 = HIBYTE(v10) == 0;
    }
    else {
      BOOL v7 = 0;
    }
    uint64_t v6 = v7;
  }
  else
  {
    uint64_t v6 = 1;
  }
  uint64_t v8 = [NSNumber numberWithInt:v6];

  return v8;
}

- (id)videoDynamicRange
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PFMetadataMovie_videoDynamicRange__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"videoDynamicRange" usingBlock:v4];

  return v2;
}

id __36__PFMetadataMovie_videoDynamicRange__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) _firstVideoTrackFormatDescription];
  if (v1)
  {
    uint64_t v1 = [NSNumber numberWithInt:CMVideoFormatDescriptionGetVideoDynamicRange()];
  }

  return v1;
}

- (id)videoCodecName
{
  [(PFMetadataMovie *)self _computeFirstVideoTrackCodecAndName];
  cached_values = self->_cached_values;

  return (id)[(NSMutableDictionary *)cached_values objectForKeyedSubscript:@"videoCodecName"];
}

- (id)firstVideoTrackCodecString
{
  uint64_t v2 = [(PFMetadataMovie *)self firstVideoTrackCodec];

  return +[PFMediaUtilities stringFromFourCharCode:v2];
}

- (unsigned)firstVideoTrackCodec
{
  [(PFMetadataMovie *)self _computeFirstVideoTrackCodecAndName];
  double v3 = [(NSMutableDictionary *)self->_cached_values objectForKeyedSubscript:@"firstVideoTrackCodec"];
  unsigned int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)_computeFirstVideoTrackCodecAndName
{
  double v3 = [(PFMetadataMovie *)self _firstVideoTrackFormatDescription];
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(v3);
  if (MediaType)
  {
    CMMediaType v5 = MediaType;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke;
    v10[3] = &unk_1E5B2DC08;
    v10[4] = v11;
    void v10[5] = v3;
    id v6 = [(PFMetadataMovie *)self _cachedValueForKey:@"firstVideoTrackCodec" usingBlock:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke_2;
    v8[3] = &unk_1E5B2DC30;
    CMMediaType v9 = v5;
    v8[4] = v11;
    id v7 = [(PFMetadataMovie *)self _cachedValueForKey:@"videoCodecName" usingBlock:v8];
    _Block_object_dispose(v11, 8);
  }
}

uint64_t __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(a1 + 40));
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return [v2 numberWithUnsignedInt:v3];
}

id __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke_2()
{
  MTCopyStringsForMediaTypeAndSubType();

  return 0;
}

- (id)livePhotoMinimumClientVersion
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoMinimumClientVersion];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PFMetadataMovie_livePhotoMinimumClientVersion__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  unsigned int v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __48__PFMetadataMovie_livePhotoMinimumClientVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoMinimumClientVersion];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  CMMediaType v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (BOOL)livePhotoVitalityLimitingAllowed
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityLimitingAllowed];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PFMetadataMovie_livePhotoVitalityLimitingAllowed__block_invoke;
  v7[3] = &unk_1E5B2DBE0;
  v7[4] = self;
  unsigned int v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v7];
  char v5 = [v4 BOOLValue];

  return v5;
}

id __51__PFMetadataMovie_livePhotoVitalityLimitingAllowed__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityLimitingAllowed];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (BOOL)hasVitality
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityDisabled];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__PFMetadataMovie_hasVitality__block_invoke;
  v7[3] = &unk_1E5B2DBE0;
  v7[4] = self;
  unsigned int v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v7];
  int v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

id __30__PFMetadataMovie_hasVitality__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityDisabled];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  int v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)livePhotoVitalityTransitionScore
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataVitalityTransitionScore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PFMetadataMovie_livePhotoVitalityTransitionScore__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  unsigned int v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __51__PFMetadataMovie_livePhotoVitalityTransitionScore__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataVitalityTransitionScore];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  int v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)livePhotoVitalityScore
{
  uint64_t v2 = *MEMORY[0x1E4F15D88];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PFMetadataMovie_livePhotoVitalityScore__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __41__PFMetadataMovie_livePhotoVitalityScore__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D88];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  int v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (BOOL)isAutoLivePhoto
{
  uint64_t v2 = *MEMORY[0x1E4F15D50];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PFMetadataMovie_isAutoLivePhoto__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v6];
  char v4 = [v3 BOOLValue];

  return v4;
}

id __34__PFMetadataMovie_isAutoLivePhoto__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D50];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  int v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)playbackVariation
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PFMetadataMovie_playbackVariation__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  char v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __36__PFMetadataMovie_playbackVariation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  int v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)audioBitsPerChannel
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioChannelsPerFrame
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioBytesPerFrame
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioFramesPerPacket
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioBytesPerPacket
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioTrackFormatFlags
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioTrackFormat
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithUnsignedInt:v5];

  return v3;
}

- (id)audioSampleRate
{
  uint64_t v2 = NSNumber;
  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  uint64_t v3 = [v2 numberWithDouble:v5];

  return v3;
}

- (id)audioDataRate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__PFMetadataMovie_audioDataRate__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"audioDataRate" usingBlock:v4];

  return v2;
}

id __32__PFMetadataMovie_audioDataRate__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _firstAudioTrack];
  uint64_t v2 = NSNumber;
  [v1 estimatedDataRate];
  uint64_t v3 = objc_msgSend(v2, "numberWithFloat:");

  return v3;
}

- (id)videoDataRate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__PFMetadataMovie_videoDataRate__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"videoDataRate" usingBlock:v4];

  return v2;
}

id __32__PFMetadataMovie_videoDataRate__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _firstVideoTrack];
  uint64_t v2 = NSNumber;
  [v1 estimatedDataRate];
  uint64_t v3 = objc_msgSend(v2, "numberWithFloat:");

  return v3;
}

- (id)nominalFrameRate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PFMetadataMovie_nominalFrameRate__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"nominalFrameRate" usingBlock:v4];

  return v2;
}

id __35__PFMetadataMovie_nominalFrameRate__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _firstVideoTrack];
  uint64_t v2 = NSNumber;
  [v1 nominalFrameRate];
  uint64_t v3 = objc_msgSend(v2, "numberWithFloat:");

  return v3;
}

- (id)stillImageDisplayTimeDictionary
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PFMetadataMovie_stillImageDisplayTimeDictionary__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"stillImageDisplayTimeDictionary" usingBlock:v4];

  return v2;
}

uint64_t __50__PFMetadataMovie_stillImageDisplayTimeDictionary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeStillImageDisplayTimeDictionary];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  CFDictionaryRef v5 = [(PFMetadataMovie *)self stillImageDisplayTimeDictionary];
  CMTimeMakeFromDictionary((CMTime *)retstr, v5);

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__PFMetadataMovie_duration__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:@"duration" usingBlock:v6];
  CMTimeMakeFromDictionary((CMTime *)retstr, v4);

  return result;
}

CFDictionaryRef __27__PFMetadataMovie_duration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 176);
  if (v1) {
    [v1 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v2 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);

  return v2;
}

- (int64_t)orientation
{
  return 1;
}

- (id)speed
{
  return 0;
}

- (id)imageDirection
{
  uint64_t v2 = *MEMORY[0x1E4F15D70];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PFMetadataMovie_imageDirection__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __33__PFMetadataMovie_imageDirection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D70];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  CFDictionaryRef v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)altitude
{
  return 0;
}

- (id)gpsHPositioningError
{
  uint64_t v2 = *MEMORY[0x1E4F15D90];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PFMetadataMovie_gpsHPositioningError__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __39__PFMetadataMovie_gpsHPositioningError__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D90];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  CFDictionaryRef v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)keywords
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PFMetadataMovie_keywords__block_invoke;
  v4[3] = &unk_1E5B2DBE0;
  v4[4] = self;
  uint64_t v2 = [(PFMetadataMovie *)self _cachedValueForKey:@"keywords" usingBlock:v4];

  return v2;
}

id __27__PFMetadataMovie_keywords__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D80];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  CFDictionaryRef v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  id v6 = [v5 componentsSeparatedByString:@","];

  return v6;
}

- (id)title
{
  uint64_t v2 = *MEMORY[0x1E4F15C80];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__PFMetadataMovie_title__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __24__PFMetadataMovie_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C80];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  CFDictionaryRef v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (BOOL)isHDR
{
  uint64_t v2 = [(PFMetadataMovie *)self videoDynamicRange];
  int v3 = [v2 integerValue];

  return v3 > 1;
}

- (BOOL)isSpatialOverCapture
{
  int v3 = +[PFMetadataIdentifier quickTimeMetadataContainsSpatialOverCaptureContent];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PFMetadataMovie_isSpatialOverCapture__block_invoke;
  v7[3] = &unk_1E5B2DBE0;
  v7[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v7];
  char v5 = [v4 BOOLValue];

  return v5;
}

id __39__PFMetadataMovie_isSpatialOverCapture__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  int v3 = +[PFMetadataIdentifier quickTimeMetadataContainsSpatialOverCaptureContent];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)spatialOverCaptureIdentifier
{
  int v3 = +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PFMetadataMovie_spatialOverCaptureIdentifier__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __47__PFMetadataMovie_spatialOverCaptureIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  int v3 = +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)artworkContentDescription
{
  uint64_t v2 = *MEMORY[0x1E4F15C38];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PFMetadataMovie_artworkContentDescription__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  int v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __44__PFMetadataMovie_artworkContentDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C38];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)captionAbstract
{
  uint64_t v2 = *MEMORY[0x1E4F15C58];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PFMetadataMovie_captionAbstract__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __34__PFMetadataMovie_captionAbstract__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C58];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)renderOriginatingAssetIdentifier
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PFMetadataMovie_renderOriginatingAssetIdentifier__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __51__PFMetadataMovie_renderOriginatingAssetIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)originatingAssetIdentifier
{
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PFMetadataMovie_originatingAssetIdentifier__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __45__PFMetadataMovie_originatingAssetIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)software
{
  uint64_t v2 = *MEMORY[0x1E4F15C78];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PFMetadataMovie_software__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __27__PFMetadataMovie_software__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C78];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)focalLengthIn35mm
{
  uint64_t v3 = +[PFMetadataIdentifier quicktimeMetadataCameraFocalLength35mmEquivalent];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PFMetadataMovie_focalLengthIn35mm__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __36__PFMetadataMovie_focalLengthIn35mm__block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F15D18];
  uint64_t v3 = [*(id *)(a1 + 32) _firstVideoTrack];
  CFDictionaryRef v4 = +[PFMediaUtilities metadataForFormat:v2 forAssetTrack:v3];

  char v5 = [*(id *)(a1 + 32) typeVerifier];
  id v6 = +[PFMetadataIdentifier quicktimeMetadataCameraFocalLength35mmEquivalent];
  id v7 = [v5 valueForAVMetadataIdentifier:v6 fromAVMetadataItems:v4];

  return v7;
}

- (id)lensModel
{
  uint64_t v3 = +[PFMetadataIdentifier quicktimeMetadataCameraLensModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__PFMetadataMovie_lensModel__block_invoke;
  v6[3] = &unk_1E5B2DBE0;
  v6[4] = self;
  CFDictionaryRef v4 = [(PFMetadataMovie *)self _cachedValueForKey:v3 usingBlock:v6];

  return v4;
}

id __28__PFMetadataMovie_lensModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F15D18];
  uint64_t v3 = [*(id *)(a1 + 32) _firstVideoTrack];
  CFDictionaryRef v4 = +[PFMediaUtilities metadataForFormat:v2 forAssetTrack:v3];

  char v5 = [*(id *)(a1 + 32) typeVerifier];
  id v6 = +[PFMetadataIdentifier quicktimeMetadataCameraLensModel];
  id v7 = [v5 valueForAVMetadataIdentifier:v6 fromAVMetadataItems:v4];

  return v7;
}

- (id)cameraModel
{
  uint64_t v2 = *MEMORY[0x1E4F15C70];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PFMetadataMovie_cameraModel__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __30__PFMetadataMovie_cameraModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C70];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)cameraMake
{
  uint64_t v2 = *MEMORY[0x1E4F15C68];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PFMetadataMovie_cameraMake__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __29__PFMetadataMovie_cameraMake__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15C68];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (id)livePhotoPairingIdentifier
{
  uint64_t v2 = *MEMORY[0x1E4F15D58];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PFMetadataMovie_livePhotoPairingIdentifier__block_invoke;
  v5[3] = &unk_1E5B2DBE0;
  v5[4] = self;
  uint64_t v3 = [(PFMetadataMovie *)self _cachedValueForKey:v2 usingBlock:v5];

  return v3;
}

id __45__PFMetadataMovie_livePhotoPairingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) typeVerifier];
  uint64_t v3 = *MEMORY[0x1E4F15D58];
  CFDictionaryRef v4 = [*(id *)(*(void *)(a1 + 32) + 176) metadata];
  char v5 = [v2 valueForAVMetadataIdentifier:v3 fromAVMetadataItems:v4];

  return v5;
}

- (BOOL)isMovie
{
  return 1;
}

- (BOOL)verifyShouldLoadTrackMetadata:(const char *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PFMetadata *)self shouldLoadTrackMetadata];
  BOOL v5 = v4;
  if (a3)
  {
    if (!v4)
    {
      id v6 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 136315138;
        CMMediaType v9 = a3;
        _os_log_debug_impl(&dword_1A41FE000, v6, OS_LOG_TYPE_DEBUG, "%s requires track metadata loaded. Specify the PFMetdataLoadOptionsLoadTrackMetadata at initialization.", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  return v5;
}

- (id)collectionKeysToLoad
{
  if ([(PFMetadata *)self shouldLoadTrackMetadata]) {
    uint64_t v2 = &unk_1EF7CB180;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)keysToLoad
{
  if ([(PFMetadata *)self shouldLoadTrackMetadata])
  {
    uint64_t v2 = [&unk_1EF7CAD78 arrayByAddingObject:@"tracks"];
  }
  else
  {
    uint64_t v2 = &unk_1EF7CAD78;
  }

  return v2;
}

- (void)_cacheIndirectTrackMetadataProperties
{
  [(PFMetadata *)self exifPixelSize];
  [(PFMetadataMovie *)self lensModel];

  [(PFMetadataMovie *)self nominalFrameRate];
  [(PFMetadataMovie *)self videoDataRate];

  [(PFMetadataMovie *)self audioDataRate];
  [(PFMetadataMovie *)self videoDynamicRange];

  [(PFMetadataMovie *)self isProRes];
  [(PFMetadataMovie *)self captureMode];

  [(PFMetadataMovie *)self firstVideoTrackFormatDebugDescription];
  [(PFMetadataMovie *)self _firstVideoTrackFormatDescription];
  [(PFMetadataMovie *)self colorPrimaries];

  [(PFMetadataMovie *)self transferFunction];
  [(PFMetadataMovie *)self hevcProfileInfo];

  [(PFMetadataMovie *)self isSpatialMedia];
  [(PFMetadataMovie *)self isProRes];
  [(PFMetadataMovie *)self outOfBandHintsBase64String];

  [(PFMetadataMovie *)self focalLengthIn35mm];
  id v3 = [(PFMetadataMovie *)self _makeGeometryProperties];

  [(PFMetadataMovie *)self isSloMo];
}

- (void)_cacheComputedTrackMetadataProperties
{
  id v3 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A41FE000, v3, OS_LOG_TYPE_INFO, "Computing all track metadata properties from AVAsset.", v7, 2u);
  }
  id v4 = [(PFMetadataMovie *)self _firstVideoTrack];
  id v5 = [(PFMetadataMovie *)self _firstAudioTrack];
  [(PFMetadataMovie *)self stillImageDisplayTimeDictionary];

  [(PFMetadataMovie *)self _audioStreamBasicDescription];
  [(PFMetadataMovie *)self _computeFirstVideoTrackCodecAndName];
  [(PFMetadataMovie *)self isCinematicVideo];
  [(PFMetadataMovie *)self hasSpatialAudio];
  [(PFMetadataMovie *)self isDecodable];
  id v6 = [(PFMetadataMovie *)self _computeApacAudioTrackInfo];
  [(PFMetadataMovie *)self outOfBandHints];

  [(PFMetadataMovie *)self spatialMediaTrack];
}

- (void)_cacheCommonMetadataProperties
{
  id v3 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A41FE000, v3, OS_LOG_TYPE_INFO, "Computing all common metadata properties from AVAsset.", buf, 2u);
  }
  [(PFMetadataMovie *)self livePhotoPairingIdentifier];

  [(PFMetadataMovie *)self cameraMake];
  [(PFMetadataMovie *)self cameraModel];

  [(PFMetadataMovie *)self software];
  [(PFMetadataMovie *)self originatingAssetIdentifier];

  [(PFMetadataMovie *)self renderOriginatingAssetIdentifier];
  [(PFMetadataMovie *)self captionAbstract];

  [(PFMetadataMovie *)self artworkContentDescription];
  [(PFMetadataMovie *)self spatialOverCaptureIdentifier];

  [(PFMetadataMovie *)self isSpatialOverCapture];
  [(PFMetadataMovie *)self title];

  [(PFMetadataMovie *)self keywords];
  [(PFMetadataMovie *)self gpsHPositioningError];

  [(PFMetadataMovie *)self imageDirection];
  [(PFMetadataMovie *)self duration];
  [(PFMetadataMovie *)self playbackVariation];

  [(PFMetadataMovie *)self isAutoLivePhoto];
  [(PFMetadataMovie *)self livePhotoVitalityScore];

  [(PFMetadataMovie *)self livePhotoVitalityTransitionScore];
  [(PFMetadataMovie *)self hasVitality];
  [(PFMetadataMovie *)self livePhotoVitalityLimitingAllowed];
  [(PFMetadataMovie *)self livePhotoMinimumClientVersion];

  [(PFMetadataMovie *)self isActionCam];
  [(PFMetadataMovie *)self montageString];

  [(PFMetadataMovie *)self author];
  [(PFMetadataMovie *)self isPlayable];
  [(PFMetadataMovie *)self smartStyleVideoCastValue];
  [(PFMetadata *)self gpsLocation];

  [(PFMetadata *)self utcCreationDate];
}

- (void)_cacheAllTrackProperties
{
  [(PFMetadataMovie *)self _cacheComputedTrackMetadataProperties];

  [(PFMetadataMovie *)self _cacheIndirectTrackMetadataProperties];
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  asset = self->_asset;
  id v5 = a3;
  id v7 = [(PFMetadataMovie *)self keysToLoad];
  id v6 = [(PFMetadataMovie *)self collectionKeysToLoad];
  [(PFMetadataMovie *)self _loadMetadataForAsset:asset withKeys:v7 collectionKeys:v6 completionHandler:v5];
}

- (void)_loadMetadataForAsset:(id)a3 withKeys:(id)a4 collectionKeys:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = self->_stateHandler;
  id v14 = a3;
  -[PFMetadataStateHandler addBreadcrumb:](v13, "addBreadcrumb:", @"%s: Calling -[%p loadValuesAsynchronouslyForKeys:%@ keysForCollectionKeys:%@]", "-[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:completionHandler:]", v14, v10, v11);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys_completionHandler___block_invoke;
  void v19[3] = &unk_1E5B2DBB8;
  id v20 = v13;
  uint64_t v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  double v18 = v13;
  [v14 loadValuesAsynchronouslyForKeys:v17 keysForCollectionKeys:v16 completionHandler:v19];
}

uint64_t __83__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addBreadcrumb:@"%s: In completion handler for -[%p loadValuesAsynchronouslyForKeys:%@ keysForCollectionKeys:%@ completionHandler:]", "-[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:completionHandler:]_block_invoke", *(void *)(*(void *)(a1 + 40) + 176), *(void *)(a1 + 48), *(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_loadMetadataForAsset:(id)a3 withKeys:(id)a4 collectionKeys:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_4605);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys___block_invoke_2;
  v13[3] = &unk_1E5B2DB90;
  id v14 = v11;
  id v12 = v11;
  [(PFMetadataMovie *)self _loadMetadataForAsset:v10 withKeys:v9 collectionKeys:v8 completionHandler:v13];

  dispatch_block_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __65__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_convertToAVAssetProxyIfPossible
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  asset = self->_asset;
  id v13 = 0;
  id v14 = 0;
  int64_t v4 = [(PFMetadataMovie *)self _audioVideoProxyPropertyListForAsset:asset propertyList:&v14 error:&v13];
  id v5 = v14;
  id v6 = v13;
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4)
    {
      if (v4 != 1)
      {
LABEL_6:
        BOOL v10 = 1;
        goto LABEL_10;
      }
      id v7 = [(PFMetadataMovie *)self _makeDateTimePropertiesForAsset:self->_asset];
    }
    id v8 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v5];
    id v9 = self->_asset;
    self->_asset = v8;

    goto LABEL_6;
  }
  dispatch_block_t v11 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_debug_impl(&dword_1A41FE000, v11, OS_LOG_TYPE_DEBUG, "Invalid asset proxy to cache. Error: %@", buf, 0xCu);
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)_configureWithAVAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    cached_values = self->_cached_values;
    self->_cached_values = v6;

    id v8 = [[PFMetadataStateHandler alloc] initWithMetadata:self];
    stateHandler = self->_stateHandler;
    self->_stateHandler = v8;

    p_asset = &self->_asset;
    objc_storeStrong((id *)&self->_asset, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_block_t v11 = [v5 URL];
    }
    else
    {
      dispatch_block_t v11 = 0;
    }
    if ([v11 isFileURL])
    {
      [(PFMetadata *)self setFileURL:v11];
      id v13 = [(AVAsset *)*p_asset identifyingTagClass];
      [(NSMutableDictionary *)self->_cached_values setObject:v13 forKeyedSubscript:PFMetadataPlistIdentifyingTagClass];
    }
    if ([(PFMetadata *)self shouldCreateProxy]
      && ![(PFMetadataMovie *)self _convertToAVAssetProxyIfPossible])
    {
      id v14 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v14;
        id v20 = [(PFMetadata *)self fileURL];
        int v21 = 138412290;
        id v22 = v20;
        _os_log_error_impl(&dword_1A41FE000, v19, OS_LOG_TYPE_ERROR, "Failed to create a proxy for AVAsset %@. Computing all properties immediately to avoid holding an open file handle.", (uint8_t *)&v21, 0xCu);
      }
      [(PFMetadata *)self setOptions:64];
    }
    if (![(PFMetadata *)self shouldLoadValues]) {
      goto LABEL_23;
    }
    id v15 = *p_asset;
    id v16 = [(PFMetadataMovie *)self keysToLoad];
    uint64_t v17 = [(PFMetadataMovie *)self collectionKeysToLoad];
    [(PFMetadataMovie *)self _loadMetadataForAsset:v15 withKeys:v16 collectionKeys:v17];

    if (![(AVAsset *)*p_asset isReadable])
    {
      BOOL v12 = 0;
    }
    else
    {
LABEL_23:
      if ([(PFMetadata *)self doImmediateCompute])
      {
        [(PFMetadataMovie *)self _cacheCommonMetadataProperties];
        [(PFMetadataMovie *)self _cacheAllTrackProperties];
      }
      [(PFMetadata *)self setSourceType:9];
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_configureWithAVProxyData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v14 = 0;
    id v6 = +[PFMetadata propertyListObjectFromEncodedData:v5 expectedClass:objc_opt_class() options:0 error:&v14];
    id v7 = v14;
    if (v6)
    {
      id v8 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v6];
      if (v8) {
        BOOL v9 = [(PFMetadataMovie *)self _configureWithAVAsset:v8];
      }
      else {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v10 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        BOOL v12 = v10;
        uint64_t v13 = [v5 length];
        *(_DWORD *)buf = 134218498;
        id v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = v13;
        __int16 v19 = 2114;
        id v20 = v7;
        _os_log_error_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_ERROR, "failed to deserialize a property list object from plist data: %p, length: %lu, error: %{public}@", buf, 0x20u);
      }
      BOOL v9 = 0;
    }
    [(PFMetadata *)self setSourceType:7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_configureWithAVURL:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 path];
    memset(&v14, 0, sizeof(v14));
    id v6 = objc_claimAutoreleasedReturnValue();
    int v7 = stat((const char *)objc_msgSend(v6, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0,
                           0),
           &v14);
    int st_mode = (__int16)v14.st_mode;

    BOOL v9 = 0;
    if (!v7 && st_mode < 0)
    {
      BOOL v10 = (void *)MEMORY[0x1E4F166C8];
      if ([(PFMetadata *)self noOutOfProcess])
      {
        uint64_t v15 = *MEMORY[0x1E4F157C0];
        v16[0] = MEMORY[0x1E4F1CC38];
        dispatch_block_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
        BOOL v12 = [v10 URLAssetWithURL:v5 options:v11];
      }
      else
      {
        BOOL v12 = [v10 URLAssetWithURL:v5 options:0];
      }
      BOOL v9 = [(PFMetadataMovie *)self _configureWithAVAsset:v12];
      [(PFMetadata *)self setSourceType:6];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFMetadataMovie;
  if ([(PFMetadata *)&v13 configureWithMetadataPlist:v4])
  {
    id v5 = (void *)MEMORY[0x1E4F16330];
    id v6 = [v4 objectForKeyedSubscript:PFMetadataPlistAsset];
    int v7 = [v5 assetProxyWithPropertyList:v6];

    BOOL v8 = [(PFMetadataMovie *)self _configureWithAVAsset:v7];
    if (v8)
    {
      BOOL v9 = [v4 objectForKeyedSubscript:PFMetadataPlistIdentifyingTagClass];
      [(NSMutableDictionary *)self->_cached_values setObject:v9 forKeyedSubscript:PFMetadataPlistIdentifyingTagClass];

      BOOL v10 = [v4 objectForKeyedSubscript:PFMetadataPlistOriginalAssetDateProperties];
      [(NSMutableDictionary *)self->_cached_values setObject:v10 forKeyedSubscript:PFMetadataPlistOriginalAssetDateProperties];

      dispatch_block_t v11 = [v4 objectForKeyedSubscript:PFMetadataPlistSourceType];
      -[PFMetadata setSourceType:](self, "setSourceType:", [v11 integerValue]);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (PFMetadataMovie)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFMetadataMovie;
  BOOL v9 = [(PFMetadata *)&v12 initWithContentType:0 options:v6 timeZoneLookup:a5];
  BOOL v10 = v9;
  if (v9 && ![(PFMetadataMovie *)v9 _configureWithAVAsset:v8])
  {

    BOOL v10 = 0;
  }

  return v10;
}

- (PFMetadataMovie)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5 preloadValues:(BOOL)a6
{
  uint64_t v7 = a4;
  id v9 = a3;
  BOOL v10 = [(PFMetadata *)self initWithContentType:0 options:v7 timeZoneLookup:a5];
  dispatch_block_t v11 = v10;
  if (v10 && ![(PFMetadataMovie *)v10 _configureWithAVAsset:v9])
  {

    dispatch_block_t v11 = 0;
  }

  return v11;
}

- (PFMetadataMovie)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PFMetadata *)self initWithContentType:0 options:13 timeZoneLookup:a4];
  id v8 = v7;
  if (v7 && ![(PFMetadataMovie *)v7 _configureWithAVProxyData:v6])
  {

    id v8 = 0;
  }

  return v8;
}

- (PFMetadataMovie)initWithAVURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [(PFMetadata *)self initWithContentType:0 options:v6 timeZoneLookup:a5];
  BOOL v10 = v9;
  if (v9 && ![(PFMetadataMovie *)v9 _configureWithAVURL:v8])
  {

    BOOL v10 = 0;
  }

  return v10;
}

+ (void)firstAudioTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F15BA8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PFMetadataMovie_firstAudioTrackForAsset_resultBlock___block_invoke;
  v8[3] = &unk_1E5B2DD20;
  id v9 = v5;
  id v7 = v5;
  +[PFMetadataMovie _enumerateTracksOfType:v6 onAsset:a3 withBlock:v8];
}

uint64_t __55__PFMetadataMovie_firstAudioTrackForAsset_resultBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a5 = 1;
  return result;
}

+ (void)firstVideoTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F15C18];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PFMetadataMovie_firstVideoTrackForAsset_resultBlock___block_invoke;
  v8[3] = &unk_1E5B2DD20;
  id v9 = v5;
  id v7 = v5;
  +[PFMetadataMovie _enumerateTracksOfType:v6 onAsset:a3 withBlock:v8];
}

uint64_t __55__PFMetadataMovie_firstVideoTrackForAsset_resultBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a5 = 1;
  return result;
}

+ (id)exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4
{
  id v5 = a3;
  if (exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken[0] != -1) {
    dispatch_once(exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken, &__block_literal_global_264);
  }
  uint64_t v6 = objc_msgSend((id)exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 rangeAtIndex:1];
    BOOL v10 = objc_msgSend(v5, "substringWithRange:", v8, v9);
    uint64_t v11 = [v7 rangeAtIndex:2];
    objc_super v13 = objc_msgSend(v5, "substringWithRange:", v11, v12);
    uint64_t v14 = [v7 rangeAtIndex:3];
    id v16 = objc_msgSend(v5, "substringWithRange:", v14, v15);
    __int16 v17 = [NSString stringWithFormat:@"%@%@:%@", v10, v13, v16];
    if (a4)
    {
      int v18 = [v10 isEqualToString:@"-"];
      int v19 = [v13 intValue];
      int64_t v20 = 3600 * v19 + 60 * (int)[v16 intValue];
      if (v18) {
        int64_t v20 = -v20;
      }
      *a4 = v20;
    }
  }
  else
  {
    __int16 v17 = 0;
  }

  return v17;
}

uint64_t __68__PFMetadataMovie_exifTimezoneOffsetFromDateString_offsetInSeconds___block_invoke()
{
  exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(-|\\+)(\\d\\d)(\\d\\d)$" options:0 error:0];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)parseISO6709String:(id)a3 outLatitude:(double *)a4 outLongitude:(double *)a5
{
  id v7 = a3;
  if ((unint64_t)[v7 length] >= 3)
  {
    if (a4) {
      *a4 = 0.0;
    }
    if (a5) {
      *a5 = 0.0;
    }
    uint64_t v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
    BOOL v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+-"];
    id v63 = 0;
    int v11 = [v9 scanCharactersFromSet:v10 intoString:&v63];
    id v12 = v63;

    if (!v11 || [v12 length] != 1)
    {
      BOOL v8 = 0;
LABEL_47:

      goto LABEL_48;
    }
    objc_super v13 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    id v62 = 0;
    int v14 = [v9 scanCharactersFromSet:v13 intoString:&v62];
    id v15 = v62;

    if (v14)
    {
      uint64_t v16 = [v15 length];
      double v17 = 0.0;
      double v18 = 1.0;
      switch(v16)
      {
        case 2:
LABEL_15:
          uint64_t v23 = objc_msgSend(v15, "substringWithRange:", 0, 2);
          [v23 doubleValue];
          double v25 = v17 + v24;

          CFAllocatorRef v26 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+-"];
          id v61 = 0;
          int v27 = [v9 scanUpToCharactersFromSet:v26 intoString:&v61];
          id v28 = v61;

          if (v27 && [v28 length])
          {
            [v28 doubleValue];
            double v25 = v25 + v29 * v18;
          }
          if ([v12 isEqualToString:@"-"]) {
            double v30 = -v25;
          }
          else {
            double v30 = v25;
          }
          long long v31 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+-"];
          id v60 = 0;
          int v32 = [v9 scanCharactersFromSet:v31 intoString:&v60];
          id v33 = v60;

          if (!v32 || [v33 length] != 1)
          {
            BOOL v8 = 0;
LABEL_45:

            goto LABEL_46;
          }
          id v57 = v28;
          uint64_t v34 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
          id v59 = 0;
          int v35 = [v9 scanCharactersFromSet:v34 intoString:&v59];
          id v36 = v59;

          if (v35)
          {
            uint64_t v37 = [v36 length];
            double v38 = 0.0;
            double v39 = 1.0;
            id v55 = v36;
            if (v37 == 3)
            {
              unint64_t v40 = 0x1E4F28000uLL;
LABEL_34:
              v45 = objc_msgSend(v36, "substringWithRange:", 0, 3, v55);
              [v45 doubleValue];
              double v47 = v38 + v46;

              v48 = [*(id *)(v40 + 2952) characterSetWithCharactersInString:@"+-C/"];
              id v58 = 0;
              int v49 = [v9 scanUpToCharactersFromSet:v48 intoString:&v58];
              id v50 = v58;

              if (v49 && [v50 length])
              {
                [v50 doubleValue];
                double v47 = v47 + v51 * v39;
              }
              id v36 = v56;
              id v28 = v57;
              int v52 = [v33 isEqualToString:@"-"];
              double v53 = -v47;
              if (!v52) {
                double v53 = v47;
              }
              if (a4) {
                *a4 = v30;
              }
              if (a5) {
                *a5 = v53;
              }

              BOOL v8 = 1;
              goto LABEL_44;
            }
            unint64_t v40 = 0x1E4F28000;
            if (v37 == 5)
            {
LABEL_28:
              double v39 = v39 / 60.0;
              v43 = objc_msgSend(v36, "substringWithRange:", 3, 2, v55);
              [v43 doubleValue];
              double v38 = v38 + v44 / 60.0;

              id v36 = v55;
              goto LABEL_34;
            }
            if (v37 == 7)
            {
              uint64_t v41 = objc_msgSend(v36, "substringWithRange:", 5, 2);
              [v41 doubleValue];
              double v38 = v42 / 60.0 / 60.0 + 0.0;

              id v36 = v55;
              double v39 = 0.0166666667;
              goto LABEL_28;
            }
          }
          BOOL v8 = 0;
          id v28 = v57;
LABEL_44:

          goto LABEL_45;
        case 4:
LABEL_14:
          double v18 = v18 / 60.0;
          uint64_t v21 = objc_msgSend(v15, "substringWithRange:", 2, 2);
          [v21 doubleValue];
          double v17 = v17 + v22 / 60.0;

          goto LABEL_15;
        case 6:
          int v19 = objc_msgSend(v15, "substringWithRange:", 4, 2);
          [v19 doubleValue];
          double v17 = v20 / 60.0 / 60.0 + 0.0;

          double v18 = 0.0166666667;
          goto LABEL_14;
      }
    }
    BOOL v8 = 0;
LABEL_46:

    goto LABEL_47;
  }
  BOOL v8 = 0;
LABEL_48:

  return v8;
}

+ (void)_enumerateTracksOfType:(id)a3 onAsset:(id)a4 withBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *, const opaqueCMFormatDescription *, uint64_t, char *))a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = +[PFMediaUtilities tracksWithMediaType:a3 forAsset:a4];
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v20 = *(void *)v27;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v27 != v20) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
      char v25 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = [v11 formatDescriptions];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
LABEL_8:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(const opaqueCMFormatDescription **)(*((void *)&v21 + 1) + 8 * v16);
          uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v17);
          v7[2](v7, v11, v17, MediaSubType, &v25);
          if (v25) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
            if (v14) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      if (v25) {
        break;
      }
      if (++v10 == v9)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionForAsset:(SEL)a3
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x4810000000;
  uint64_t v15 = &unk_1A42EF38E;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v18 = 0;
  uint64_t v7 = *MEMORY[0x1E4F15BA8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PFMetadataMovie_audioStreamBasicDescriptionForAsset___block_invoke;
  void v11[3] = &unk_1E5B2DC58;
  v11[4] = &v12;
  [a2 _enumerateTracksOfType:v7 onAsset:v6 withBlock:v11];
  uint64_t v8 = v13;
  long long v9 = *((_OWORD *)v13 + 3);
  *(_OWORD *)&retstr->mSampleRate = *((_OWORD *)v13 + 2);
  *(_OWORD *)&retstr->mBytesPerPacket = v9;
  *(void *)&retstr->mBitsPerChannel = v8[8];
  _Block_object_dispose(&v12, 8);

  return result;
}

__n128 __55__PFMetadataMovie_audioStreamBasicDescriptionForAsset___block_invoke(uint64_t a1, int a2, CMAudioFormatDescriptionRef desc, uint64_t a4, unsigned char *a5)
{
  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(desc);
  if (RichestDecodableFormat)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    __n128 result = *(__n128 *)&RichestDecodableFormat->mASBD.mSampleRate;
    long long v10 = *(_OWORD *)&RichestDecodableFormat->mASBD.mBytesPerPacket;
    *(void *)(v9 + 64) = *(void *)&RichestDecodableFormat->mASBD.mBitsPerChannel;
    *(__n128 *)(v9 + 32) = result;
    *(_OWORD *)(v9 + 48) = v10;
    *a5 = 1;
  }
  return result;
}

+ (BOOL)_channelLayoutUsesHOA:(const AudioChannelLayout *)a3
{
  return a3 && (a3->mChannelLayoutTag & 0xFFFE0000) == 12451840;
}

+ (BOOL)_channelLayoutUsesChannelDescriptions:(const AudioChannelLayout *)a3
{
  return a3 && a3->mChannelLayoutTag == 0;
}

@end