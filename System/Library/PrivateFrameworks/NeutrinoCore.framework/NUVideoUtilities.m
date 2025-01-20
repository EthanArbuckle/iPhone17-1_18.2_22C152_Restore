@interface NUVideoUtilities
+ ($0AC6E346AE4835514AAA8AC86D8F4844)encodedPixelSizeOfTrack:(id)a3 oriented:(BOOL)a4;
+ ($0AC6E346AE4835514AAA8AC86D8F4844)naturalSizeOfTrack:(id)a3 oriented:(BOOL)a4;
+ ($246D6535441D8C1432A5B8F9230D346F)conformRange:(SEL)a3 inRange:(id *)a4;
+ ($246D6535441D8C1432A5B8F9230D346F)convertTimeRange:(SEL)a3 toMaximumTimeScaleOfRange:(id *)a4;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAsset:(SEL)a3;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAsset:(SEL)a3 videoComposition:(id)a4;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAssetTrack:(SEL)a3;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)readStillImageTimeFromVideoAsset:(SEL)a3;
+ ($8D19A3D7F6B32A57CF9B882F3E1C418F)cleanApertureOfTrack:(SEL)a3 oriented:(id)a4;
+ (BOOL)assetIsCinematicAudio:(id)a3;
+ (BOOL)audioTrackIsCinematicAudio:(id)a3;
+ (BOOL)compositionInstructions:(id)a3 areEqualToCompositionInstructions:(id)a4;
+ (BOOL)deviceSupportsHardware10BitHEVCEncoding;
+ (BOOL)deviceSupportsHardwareHEVCEncoding;
+ (BOOL)deviceSupportsHighDynamicRangeVideo;
+ (BOOL)isAVAssetDolbyProfile5:(id)a3 error:(id *)a4;
+ (BOOL)isAVAssetHDR:(id)a3 error:(id *)a4;
+ (BOOL)isAssetStyled:(id)a3;
+ (BOOL)isAssetUnsupportedCorruptPortraitVideo:(id)a3;
+ (BOOL)isAssetUnsupportedLegacyPortraitVideo:(id)a3;
+ (BOOL)isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:(id)a3;
+ (BOOL)isMetadataTrackWithLivePhotoInfo:(id)a3;
+ (BOOL)isMetadataTrackWithStillImageDimensionsInLivePhoto:(id)a3;
+ (BOOL)isMetadataTrackWithStillImageTransformInLivePhoto:(id)a3;
+ (BOOL)metadataTrack:(id)a3 containsIdentifier:(id)a4;
+ (BOOL)metadataTrack:(id)a3 containsIdentifiers:(id)a4;
+ (BOOL)metadataTrackContainsCinematicAudioData:(id)a3;
+ (BOOL)metadataTrackContainsLegacyCinematicAudioData:(id)a3;
+ (BOOL)metadataTrackContainsPortraitVideoData:(id)a3;
+ (BOOL)metadataTrackContainsSemanticStyleData:(id)a3;
+ (BOOL)readFromReader:(id)a3 andWriteToWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 progress:(id)a10 error:(id *)a11;
+ (BOOL)track:(id)a3 hasSamplesForEachSampleInTrack:(id)a4;
+ (BOOL)trimCompositionTracks:(id)a3 toRange:(id *)a4 error:(id *)a5;
+ (BOOL)updateVideoMetadataAtURL:(id)a3 withItems:(id)a4 stillImageTime:(id *)a5 error:(id *)a6;
+ (BOOL)videoTrackContainsDolbyVisionMetadata:(id)a3;
+ (CGAffineTransform)preferredTransformFromOrientation:(SEL)a3 size:(int64_t)a4;
+ (NSArray)preferedDestinationPixelFormats;
+ (NSArray)preferedDestinationPixelFormatsForHDR;
+ (NSArray)preferredSourcePixelFormats;
+ (__CVBuffer)readVideoFrameAtTime:(id *)a3 fromAsset:(id)a4 outputSettings:(id)a5 videoComposition:(id)a6 auxiliaryImageType:(int64_t)a7 error:(id *)a8;
+ (__CVBuffer)readVideoFrameAtTime:(id *)a3 fromAsset:(id)a4 reader:(id)a5 readerOutput:(id)a6 error:(id *)a7;
+ (float)nominalFrameRateForAsset:(id)a3 error:(id *)a4;
+ (id)_preferedPixelFormatsForUsage:(int64_t)a3;
+ (id)assetContainsDuplicatePTSSamples:(id)a3 assetTrack:(id)a4 error:(id *)a5;
+ (id)assetReaderAudioSettingsForTrackType:(BOOL)a3;
+ (id)assetWriterAudioSettingsForAudioTrackFormatDescription:(opaqueCMFormatDescription *)a3;
+ (id)assetWriterAudioSettingsForTrackWithSampleRate:(double)a3 isAmbisonic:(BOOL)a4;
+ (id)auxiliaryTrackInAsset:(id)a3 ofType:(int64_t)a4 error:(id *)a5;
+ (id)bestOutputSettingsPresetForTargetVideoSize:(id)a3 codec:(unsigned int)a4;
+ (id)cinematicAudioTrackInAsset:(id)a3;
+ (id)cleanApertureVideoSettingsFor:(id *)a3 scale:(id)a4 videoSize:(id)a5;
+ (id)compositionFromVideoComposition:(id)a3;
+ (id)computeMalformedTimeRangeTrackInAsset:(id)a3 assetTrack:(id)a4 error:(id *)a5;
+ (id)debugDescriptionOfAssetTrack:(id)a3;
+ (id)deepMutableCopyVideoComposition:(id)a3;
+ (id)defaultExportCodecForHDRVideo:(BOOL)a3;
+ (id)defaultOutputColorSpaceForComposition:(id)a3;
+ (id)defaultVideoSettingsForAVAssetReader;
+ (id)firstEnabledVideoTrackInAsset:(id)a3 error:(id *)a4;
+ (id)getCinematicAudioParametersFromAudioMix:(id)a3;
+ (id)indexesOfSemanticStyleVideoSampleSlices:(id)a3;
+ (id)metadataTrackWithCinematicAudioDataInAsset:(id)a3;
+ (id)metadataTrackWithIdenfifier:(id)a3 forAsset:(id)a4;
+ (id)metadataTrackWithPortraitVideoDataInAsset:(id)a3;
+ (id)metadataTrackWithStillImageDimensionsInLivePhotoAsset:(id)a3;
+ (id)metadataTrackWithStillImageDisplayTimeMarkerInLivePhotoAsset:(id)a3;
+ (id)metadataTrackWithStillImageTransformInLivePhotoAsset:(id)a3;
+ (id)newPixelBufferOfSize:(id)a3 format:(unsigned int)a4;
+ (id)originalCodecOfVideoTrack:(id)a3;
+ (id)pixelFormatStringForCVPixelBuffer:(__CVBuffer *)a3;
+ (id)readTimedMetadataGroupAtTime:(id *)a3 fromTrack:(id)a4 outputSettings:(id)a5 videoComposition:(id)a6 error:(id *)a7;
+ (id)readerOutputForAsset:(id)a3 outputSettings:(id)a4 videoComposition:(id)a5 auxiliaryImageType:(int64_t)a6 error:(id *)a7;
+ (id)readerOutputForAssetTrack:(id)a3 outputSettings:(id)a4 error:(id *)a5;
+ (id)repeatAudio:(id)a3 count:(int64_t)a4 error:(id *)a5;
+ (id)repeatVideo:(id)a3 count:(int64_t)a4 error:(id *)a5;
+ (id)repeatVideoComposition:(id)a3 count:(int64_t)a4 error:(id *)a5;
+ (id)requiredVideoCompositionOutputTracksForAsset:(id)a3;
+ (id)rgbVideoSettingsForAVAssetReader;
+ (id)semanticStylePropertiesFromMetadataGroup:(id)a3 keyTime:(id *)a4 error:(id *)a5;
+ (id)urlOfAVAsset:(id)a3;
+ (id)validateSemanticStyleAsset:(id)a3 error:(id *)a4;
+ (id)videoCompositionDescription:(id)a3;
+ (id)videoDescription:(id)a3;
+ (int64_t)videoOrientationForAsset:(id)a3 videoComposition:(id)a4;
+ (int64_t)videoOrientationForAssetPreferredTransform:(CGAffineTransform *)a3;
+ (unint64_t)nominalFrameRateRoundedToNearestTraditionalFrameRate:(float)a3;
+ (void)readNextPixelBuffer:(id)a3 output:(id)a4 block:(id)a5;
+ (void)readNextSampleBuffer:(id)a3 output:(id)a4 block:(id)a5;
@end

@implementation NUVideoUtilities

+ (BOOL)trimCompositionTracks:(id)a3 toRange:(id *)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    uint64_t v9 = MEMORY[0x1E4F1FA48];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var1.var0;
        time1.start.epoch = a4->var1.var3;
        *(_OWORD *)&time2.start.value = *(_OWORD *)v9;
        time2.start.epoch = *(void *)(v9 + 16);
        if (!CMTimeCompare(&time1.start, &time2.start))
        {
          long long v16 = *(_OWORD *)&a4->var0.var3;
          *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0.var0;
          *(_OWORD *)&time1.start.epoch = v16;
          *(_OWORD *)&time1.duration.timescale = *(_OWORD *)&a4->var1.var1;
          v17 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time1);
          *a5 = +[NUError errorWithCode:6 reason:@"duration of the trim is zero or -ve" object:v17];

          BOOL v15 = 0;
          goto LABEL_18;
        }
        memset(&time1, 0, sizeof(time1));
        if (v11) {
          [v11 timeRange];
        }
        long long v12 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)&v26.start.value = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&v26.start.epoch = v12;
        *(_OWORD *)&v26.duration.timescale = *(_OWORD *)&a4->var1.var1;
        memset(&time2, 0, sizeof(time2));
        CMTimeRange range = time1;
        +[NUVideoUtilities convertTimeRange:&v26 toMaximumTimeScaleOfRange:&range];
        if (v11) {
          [v11 timeRange];
        }
        else {
          memset(&otherRange, 0, sizeof(otherRange));
        }
        CMTimeRange range = time2;
        Intersection = CMTimeRangeGetIntersection(&v26, &range, &otherRange);
        CMTimeRange time2 = v26;
        if (__56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke((uint64_t)Intersection, (uint64_t)&v26))
        {
          v26.start.value = 0;
          *(void *)&v26.start.timescale = &v26;
          v26.start.epoch = 0x3032000000;
          v26.duration.value = (CMTimeValue)__Block_byref_object_copy__13453;
          *(void *)&v26.duration.timescale = __Block_byref_object_dispose__13454;
          v26.duration.epoch = (CMTimeEpoch)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v14 = [v11 segments];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke_2;
          v20[3] = &unk_1E5D94CA0;
          CMTimeRange v23 = time2;
          id v21 = &__block_literal_global_440;
          v22 = &v26;
          [v14 enumerateObjectsUsingBlock:v20];

          [v11 setSegments:*(void *)(*(void *)&v26.start.timescale + 40)];
          _Block_object_dispose(&v26, 8);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

BOOL __56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 12);
  BOOL result = (v2 & 1) != 0
        && (int v4 = *(_DWORD *)(a2 + 36), (v4 & 1) != 0)
        && ((v5 = (void *)(a2 + 24), *(void *)(a2 + 40))
         || (*v5 & 0x8000000000000000) != 0
         || (*(_OWORD *)&time1.value = *(_OWORD *)v5,
             time1.epoch = *(void *)(a2 + 40),
             CMTime v7 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
             CMTimeCompare(&time1, &v7))
         && (int v2 = *(_DWORD *)(a2 + 12), (v2 & 1) != 0)
         && (int v4 = *(_DWORD *)(a2 + 36), (v4 & 1) != 0))
        && !*(void *)(a2 + 40)
        && ((v4 | v2) & 0x10) == 0
        && (*v5 & 0x8000000000000000) == 0;
  return result;
}

void __56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    [v3 timeMapping];
    CMTimeRange v33 = v29;
    [v4 timeMapping];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    memset(&v29, 0, sizeof(v29));
    memset(&v33, 0, sizeof(v33));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    memset(&v27, 0, sizeof(v27));
  }
  CMTimeRange v28 = v27;
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 80);
  memset(&v23, 0, sizeof(v23));
  CMTimeRange otherRange = v27;
  CMTimeRangeGetIntersection(&v23, &range, &otherRange);
  id v6 = *(unsigned int (**)(void))(*(void *)(a1 + 32) + 16);
  CMTimeRange range = v23;
  if (v6())
  {
    if (([v4 isEmpty] & 1) == 0)
    {
      memset(&range, 0, 24);
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&v23.start.value;
      otherRange.start.epoch = v23.start.epoch;
      CMTime rhs = v28.start;
      CMTimeSubtract(&range.start, &otherRange.start, &rhs);
      memset(&otherRange, 0, 24);
      CMTime rhs = v23.duration;
      CMTime lhs = v28.duration;
      CMTimeSubtract(&otherRange.start, &rhs, &lhs);
      CMTime rhs = v33.start;
      CMTime lhs = range.start;
      CMTimeAdd(&v33.start, &rhs, &lhs);
      CMTime lhs = v33.duration;
      CMTime start = otherRange.start;
      CMTimeAdd(&rhs, &lhs, &start);
      v33.duration = rhs;
    }
    CMTime rhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
    {
      CMTime v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) lastObject];
      uint64_t v8 = v7;
      if (v7)
      {
        [v7 timeMapping];
      }
      else
      {
        long long v15 = 0u;
        memset(&v16, 0, sizeof(v16));
        long long v13 = 0u;
        long long v14 = 0u;
      }
      CMTimeRange v17 = v16;
      CMTimeRangeGetEnd(&rhs, &v17);
    }
    v28.CMTime start = rhs;
    v28.duration = v23.duration;
    uint64_t v9 = (void *)MEMORY[0x1E4F164E0];
    v10 = objc_msgSend(v4, "sourceURL", v13, v14, v15);
    uint64_t v11 = [v4 sourceTrackID];
    CMTimeRange range = v33;
    CMTimeRange otherRange = v28;
    long long v12 = [v9 compositionTrackSegmentWithURL:v10 trackID:v11 sourceTimeRange:&range targetTimeRange:&otherRange];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
  }
}

+ (id)validateSemanticStyleAsset:(id)a3 error:(id *)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v48 = NUAssertLogger_13336();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      id v82 = v49;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v51 = NUAssertLogger_13336();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v82 = v55;
        __int16 v83 = 2114;
        v84 = v59;
        _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v52)
    {
      v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v82 = v54;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities validateSemanticStyleAsset:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2445, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"error != nil");
  }
  id v6 = v5;
  CMTime v7 = [(id)objc_opt_class() firstEnabledVideoTrackInAsset:v5 error:a4];
  if (!v7)
  {
    +[NUError missingError:@"Missing main video track" object:v6];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_61;
  }
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v78 = 0;
  uint64_t v8 = +[NUVideoUtilities assetContainsDuplicatePTSSamples:v6 assetTrack:v7 error:&v78];
  id v9 = v78;
  if ([v8 BOOLValue])
  {
    uint64_t v10 = 1;
LABEL_12:
    long long v13 = [[NUVideoCorruptionInfo alloc] initWithType:v10];
    [v66 addObject:v13];

    goto LABEL_13;
  }
  if (v9)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    long long v12 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v82 = v9;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Could not determine if asset contains duplicate PTS for the main video track - assuming it's invalid. %{public}@", buf, 0xCu);
    }
    uint64_t v10 = 0;
    goto LABEL_12;
  }
LABEL_13:
  long long v14 = [v6 metadata];

  v64 = v8;
  v65 = v7;
  if (!v14) {
    goto LABEL_17;
  }
  long long v15 = [v6 metadata];
  CMTimeRange v16 = PFFind();

  if (!v16) {
    goto LABEL_17;
  }
  CMTimeRange v17 = [v16 numberValue];
  char v18 = [v17 BOOLValue];

  if (v18)
  {
    v19 = &unk_1F004A6A0;
  }
  else
  {
LABEL_17:
    v19 = [&unk_1F004A6A0 arrayByAddingObject:&unk_1F004A070];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v19;
  uint64_t v21 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v75;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v75 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v74 + 1) + 8 * v24);
        long long v26 = NUMediaCharacteristicForAuxiliaryImageType([v25 integerValue]);
        if (v26)
        {
          [v20 addObject:v26];
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
          }
          CMTimeRange v27 = _NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v25;
            _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Unexpected image type %@", buf, 0xCu);
          }
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v22);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v67 = v20;
  uint64_t v28 = [v67 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v71;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v71 != v30) {
          objc_enumerationMutation(v67);
        }
        uint64_t v32 = *(void *)(*((void *)&v70 + 1) + 8 * v31);
        CMTimeRange v33 = [MEMORY[0x1E4F8CC38] tracksWithMediaCharacteristic:v32 forAsset:v6];
        if ([v33 count])
        {
          if (v32 != NUMediaCharacteristicStyleDelta) {
            goto LABEL_45;
          }
          uint64_t v34 = [v33 firstObject];
          v35 = [(NUVideoCorruptionInfo *)v34 formatDescriptions];
          unint64_t v36 = [v35 count];

          if (v36 >= 2)
          {
            id v69 = 0;
            v37 = +[NUVideoUtilities computeMalformedTimeRangeTrackInAsset:v6 assetTrack:v34 error:&v69];
            id v38 = v69;

            if (v37)
            {
              if ([v37 count])
              {
                v39 = [[NUVideoCorruptionInfo alloc] initWithType:3];
                [(NUVideoCorruptionInfo *)v39 setCorruptedRanges:v37];
                goto LABEL_52;
              }
            }
            else
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
              }
              v40 = _NULogger;
              if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v82 = v38;
                _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Could not determine malformed ranges for this delta track - assuming it's invalid. %{public}@", buf, 0xCu);
              }
              v39 = [[NUVideoCorruptionInfo alloc] initWithType:0];
LABEL_52:
              [v66 addObject:v39];
            }
            goto LABEL_44;
          }
        }
        else
        {
          uint64_t v34 = [[NUVideoCorruptionInfo alloc] initWithType:2];
          [(NUVideoCorruptionInfo *)v34 setTrackMediaCharateristic:v32];
          [v66 addObject:v34];
        }
        id v38 = v9;
LABEL_44:

        id v9 = v38;
LABEL_45:

        ++v31;
      }
      while (v29 != v31);
      uint64_t v41 = [v67 countByEnumeratingWithState:&v70 objects:v79 count:16];
      uint64_t v29 = v41;
    }
    while (v41);
  }

  v42 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BE0] forAsset:v6];
  v43 = PFFind();
  if (!v43)
  {
    uint64_t v45 = 4;
    v44 = v64;
    CMTime v7 = v65;
    goto LABEL_59;
  }
  CMTime v7 = v65;
  v44 = v64;
  if (!+[NUVideoUtilities track:v43 hasSamplesForEachSampleInTrack:v65])
  {
    uint64_t v45 = 5;
LABEL_59:
    v46 = [[NUVideoCorruptionInfo alloc] initWithType:v45];
    [v66 addObject:v46];
  }
  id v11 = v66;

LABEL_61:

  return v11;
}

BOOL __53__NUVideoUtilities_validateSemanticStyleAsset_error___block_invoke_435(uint64_t a1, uint64_t a2)
{
  return +[NUVideoUtilities metadataTrackContainsSemanticStyleData:a2];
}

uint64_t __53__NUVideoUtilities_validateSemanticStyleAsset_error___block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 key];
  uint64_t v3 = [v2 isEqual:NUQuicktimeMetadataKey_SmartStyleRenderingBypassed];

  return v3;
}

+ (BOOL)isAssetStyled:(id)a3
{
  uint64_t v3 = [a3 metadata];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_423_13479];

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __34__NUVideoUtilities_isAssetStyled___block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 key];
  uint64_t v3 = [v2 isEqual:NUQuickTimeMetadataKey_SmartStyleRenderingVersion];

  return v3;
}

+ (id)assetContainsDuplicatePTSSamples:(id)a3 assetTrack:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    CMTimeRange v17 = NUAssertLogger_13336();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      char v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger_13336();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        CMTimeRange v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities assetContainsDuplicatePTSSamples:assetTrack:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2368, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"error != NULL");
  }
  id v9 = v8;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v7 error:a5];
  if (!v10)
  {
    id v13 = 0;
    goto LABEL_20;
  }
  CMTimeRange v33 = a5;
  id v11 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v9 outputSettings:0];
  if ([v10 canAddOutput:v11])
  {
    [v10 addOutput:v11];
    if ([v10 startReading])
    {
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      char v48 = 0;
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2020000000;
      char v44 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v50 = __Block_byref_object_copy__13453;
      v51 = __Block_byref_object_dispose__13454;
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v35 = 0;
      unint64_t v36 = &v35;
      uint64_t v37 = 0x3032000000;
      id v38 = __Block_byref_object_copy__13453;
      v39 = __Block_byref_object_dispose__13454;
      id v40 = 0;
      while (!*((unsigned char *)v42 + 24))
      {
        long long v12 = objc_opt_class();
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __70__NUVideoUtilities_assetContainsDuplicatePTSSamples_assetTrack_error___block_invoke;
        v34[3] = &unk_1E5D94BF8;
        v34[4] = &v35;
        v34[5] = &v41;
        v34[6] = buf;
        v34[7] = &v45;
        [v12 readNextSampleBuffer:v10 output:v11 block:v34];
      }
      [v10 cancelReading];
      if (v36[5])
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, @"Could not read next sample buffer", v7);
        id v13 = 0;
        *CMTimeRange v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (*((unsigned char *)v46 + 24)) {
          long long v15 = (void *)MEMORY[0x1E4F1CC38];
        }
        else {
          long long v15 = (void *)MEMORY[0x1E4F1CC28];
        }
        id v13 = v15;
      }
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v41, 8);
      _Block_object_dispose(&v45, 8);
      goto LABEL_19;
    }
    id v14 = [v10 error];
  }
  else
  {
    id v14 = +[NUError unknownError:@"Cannot add track output to asset reader" object:v10];
  }
  id v13 = 0;
  *CMTimeRange v33 = v14;
LABEL_19:

LABEL_20:

  return v13;
}

void __70__NUVideoUtilities_assetContainsDuplicatePTSSamples_assetTrack_error___block_invoke(void *a1, opaqueCMSampleBuffer *a2, void *a3, char a4)
{
  id v8 = a3;
  if (!a2)
  {
    if ((a4 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
    }
    uint64_t v11 = *(void *)(a1[5] + 8);
LABEL_8:
    *(unsigned char *)(v11 + 24) = 1;
    goto LABEL_10;
  }
  if (CMSampleBufferGetNumSamples(a2))
  {
    memset(&v14, 0, sizeof(v14));
    CMSampleBufferGetPresentationTimeStamp(&v14, a2);
    id v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v10 = [NSNumber numberWithLongLong:v14.value];
    LODWORD(v9) = [v9 containsObject:v10];

    if (!v9)
    {
      long long v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
      id v13 = [NSNumber numberWithLongLong:v14.value];
      [v12 addObject:v13];

      goto LABEL_10;
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v11 = *(void *)(a1[5] + 8);
    goto LABEL_8;
  }
LABEL_10:
}

+ (id)computeMalformedTimeRangeTrackInAsset:(id)a3 assetTrack:(id)a4 error:(id *)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    CMTimeRange v17 = NUAssertLogger_13336();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      char v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger_13336();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        CMTimeRange v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities computeMalformedTimeRangeTrackInAsset:assetTrack:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2235, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"error != NULL");
  }
  id v9 = v8;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v7 error:a5];
  if (!v10)
  {
    id v14 = 0;
    goto LABEL_16;
  }
  uint64_t v34 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v9 outputSettings:0];
  if ([v10 canAddOutput:v34])
  {
    [v10 addOutput:v34];
    if ([v10 startReading])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x2020000000;
      char v60 = 0;
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x2020000000;
      char v58 = 0;
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x3032000000;
      id v52 = __Block_byref_object_copy__13453;
      uint64_t v53 = __Block_byref_object_dispose__13454;
      id v54 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x4810000000;
      memset(v64, 0, sizeof(v64));
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x4810000000;
      v45[3] = &unk_1A9AA79AF;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v48 = 0;
      uint64_t v62 = &unk_1A9AA79AF;
      uint64_t v63 = 0;
      *(void *)&v64[5] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      *(_OWORD *)&v64[1] = *MEMORY[0x1E4F1F9F8];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __75__NUVideoUtilities_computeMalformedTimeRangeTrackInAsset_assetTrack_error___block_invoke;
      v42[3] = &unk_1E5D94BA8;
      id v33 = v11;
      id v43 = v33;
      char v44 = v59;
      long long v12 = (void *)MEMORY[0x1AD0FAD00](v42);
      while (!*((unsigned char *)v56 + 24))
      {
        id v13 = objc_opt_class();
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __75__NUVideoUtilities_computeMalformedTimeRangeTrackInAsset_assetTrack_error___block_invoke_2;
        v35[3] = &unk_1E5D94BD0;
        uint64_t v37 = v59;
        id v36 = v12;
        id v38 = buf;
        v39 = v45;
        id v40 = &v49;
        uint64_t v41 = &v55;
        [v13 readNextSampleBuffer:v10 output:v34 block:v35];
      }
      [v10 cancelReading];
      if (v50[5])
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, @"Could not read next sample buffer", v7);
        id v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = v33;
      }

      _Block_object_dispose(v45, 8);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(v59, 8);

      goto LABEL_15;
    }
    id v15 = [v10 error];
  }
  else
  {
    id v15 = +[NUError unknownError:@"Cannot add track output to asset reader" object:v10];
  }
  id v14 = 0;
  *a5 = v15;
LABEL_15:

LABEL_16:

  return v14;
}

void __75__NUVideoUtilities_computeMalformedTimeRangeTrackInAsset_assetTrack_error___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3)
{
  memset(&v11, 0, sizeof(v11));
  *(_OWORD *)&v8.start.value = *(_OWORD *)a3;
  v8.start.epoch = *(void *)(a3 + 16);
  CMTime rhs = *a2;
  CMTimeSubtract(&duration, &v8.start, &rhs);
  *(_OWORD *)&v8.start.value = *(_OWORD *)&a2->value;
  v8.start.epoch = a2->epoch;
  CMTimeRangeMake(&v11, &v8.start, &duration);
  id v5 = *(void **)(a1 + 32);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTimeRange v8 = v11;
  CFDictionaryRef v7 = CMTimeRangeCopyAsDictionary(&v8, v6);
  [v5 addObject:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __75__NUVideoUtilities_computeMalformedTimeRangeTrackInAsset_assetTrack_error___block_invoke_2(void *a1, opaqueCMSampleBuffer *a2, void *a3, int a4)
{
  id v8 = a3;
  if (a2)
  {
    if (CMSampleBufferGetNumSamples(a2))
    {
      id v9 = CMSampleBufferGetSampleAttachmentsArray(a2, 0);
      char v10 = PFExists();

      *(unsigned char *)(*(void *)(a1[7] + 8) + 40) = v10;
      FormatDescription = CMSampleBufferGetFormatDescription(a2);
      if (FormatDescription)
      {
        long long v12 = CMFormatDescriptionGetExtension(FormatDescription, (CFStringRef)*MEMORY[0x1E4F1ED40]);
        uint64_t v13 = [v12 integerValue];
      }
      else
      {
        uint64_t v13 = 0;
      }
      *(void *)(*(void *)(a1[7] + 8) + 32) = v13;
      if (*(void *)(*(void *)(a1[7] + 8) + 32))
      {
        CMSampleBufferGetPresentationTimeStamp(&v35, a2);
        *(CMTime *)(*(void *)(a1[7] + 8) + 44) = v35;
        uint64_t v17 = *(void *)(a1[6] + 8);
        char v18 = (uint64_t *)(v17 + 32);
        if ((*(unsigned char *)(v17 + 56) & 1) == 0)
        {
          uint64_t v19 = *(void *)(a1[7] + 8);
          long long v20 = *(_OWORD *)(v19 + 32);
          long long v21 = *(_OWORD *)(v19 + 48);
          v18[4] = *(void *)(v19 + 64);
          *(_OWORD *)char v18 = v20;
          *((_OWORD *)v18 + 1) = v21;
          goto LABEL_26;
        }
        uint64_t v22 = (long long *)(v17 + 44);
        uint64_t v23 = *v18;
        uint64_t v24 = *(void *)(a1[7] + 8);
        if (v23 == *(void *)(v24 + 32))
        {
          if (!*(unsigned char *)(v24 + 40)) {
            goto LABEL_25;
          }
LABEL_19:
          if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
          {
            long long v25 = *(void (**)(void))(a1[4] + 16);
            long long v38 = *v22;
            uint64_t v39 = *(void *)(v17 + 60);
            long long v36 = *(_OWORD *)(v24 + 44);
            uint64_t v37 = *(void *)(v24 + 60);
            v25();
            uint64_t v17 = *(void *)(a1[6] + 8);
            uint64_t v24 = *(void *)(a1[7] + 8);
          }
          long long v26 = *(_OWORD *)(v24 + 32);
          long long v27 = *(_OWORD *)(v24 + 48);
          *(void *)(v17 + 64) = *(void *)(v24 + 64);
          *(_OWORD *)(v17 + 32) = v26;
          *(_OWORD *)(v17 + 48) = v27;
          goto LABEL_25;
        }
        if (*(unsigned char *)(v17 + 40))
        {
          if (*(unsigned char *)(v24 + 40)) {
            goto LABEL_19;
          }
        }
        else if (*(unsigned char *)(v24 + 40))
        {
          uint64_t v28 = *(void (**)(void))(a1[4] + 16);
          long long v38 = *v22;
          uint64_t v39 = *(void *)(v17 + 60);
          long long v36 = *(_OWORD *)(v24 + 44);
          uint64_t v37 = *(void *)(v24 + 60);
          v28();
          uint64_t v29 = *(void *)(a1[6] + 8);
          uint64_t v30 = *(void *)(a1[7] + 8);
          long long v31 = *(_OWORD *)(v30 + 32);
          long long v32 = *(_OWORD *)(v30 + 48);
          *(void *)(v29 + 64) = *(void *)(v30 + 64);
          *(_OWORD *)(v29 + 32) = v31;
          *(_OWORD *)(v29 + 48) = v32;
LABEL_25:
          uint64_t v33 = *(void *)(a1[7] + 8);
          uint64_t v34 = MEMORY[0x1E4F1F9F8];
          *(_OWORD *)(v33 + 44) = *MEMORY[0x1E4F1F9F8];
          *(void *)(v33 + 60) = *(void *)(v34 + 16);
          goto LABEL_26;
        }
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
        goto LABEL_25;
      }
    }
  }
  else
  {
    if (a4)
    {
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
      {
        uint64_t v14 = *(void *)(a1[6] + 8);
        uint64_t v15 = *(void *)(a1[7] + 8);
        CMTimeRange v16 = *(void (**)(void))(a1[4] + 16);
        long long v38 = *(_OWORD *)(v14 + 44);
        uint64_t v39 = *(void *)(v14 + 60);
        long long v36 = *(_OWORD *)(v15 + 44);
        uint64_t v37 = *(void *)(v15 + 60);
        v16();
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
    }
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
LABEL_26:
}

+ (BOOL)metadataTrackContainsSemanticStyleData:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifier:kMetadataIdentifier_SmartStyleInfo];
}

+ (id)indexesOfSemanticStyleVideoSampleSlices:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__NUVideoUtilities_indexesOfSemanticStyleVideoSampleSlices___block_invoke;
  v5[3] = &unk_1E5D94B80;
  id v6 = &unk_1F004A688;
  uint64_t v3 = [a3 indexesOfObjectsPassingTest:v5];

  return v3;
}

uint64_t __60__NUVideoUtilities_indexesOfSemanticStyleVideoSampleSlices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 containsMetadataSampleForKey:NUSourceIdentifierSmartStyleVideoMetadata])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v8), "integerValue", (void)v15);
          char v10 = @"Invalid";
          if (v9 <= 0xB) {
            char v10 = off_1E5D94190[v9];
          }
          CMTimeRange v11 = v10;
          int v12 = [v3 containsVideoFrameForKey:v11];

          if (!v12)
          {
            uint64_t v13 = 0;
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v13 = 1;
LABEL_15:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)semanticStylePropertiesFromMetadataGroup:(id)a3 keyTime:(id *)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v14 = NUAssertLogger_13336();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadataGroup != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v17 = NUAssertLogger_13336();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        long long v31 = [v29 callStackSymbols];
        long long v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2160, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"metadataGroup != nil");
  }
  if (!a5)
  {
    long long v21 = NUAssertLogger_13336();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_13336();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        id v40 = [v38 callStackSymbols];
        uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      long long v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2161, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != NULL");
  }
  uint64_t v8 = v7;
  unint64_t v9 = [v7 items];
  if ([v9 count])
  {
    char v10 = [v9 firstObject];
    CMTimeRange v11 = [v10 value];

    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(void *)&buf[16] = a4->var3;
    int v12 = +[_NUSemanticStyleProperties semanticStylePropertiesFromVideoMetadata:v11 keyTime:buf error:a5];
  }
  else
  {
    +[NUError errorWithCode:3 reason:@"Missing metadata group in sample" object:v8];
    int v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (CGAffineTransform)preferredTransformFromOrientation:(SEL)a3 size:(int64_t)a4
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  uint64_t v8 = NUOrientationConcat(a4, 4);
  uint64_t v9 = NUOrientationConcat(4, v8);

  return NUOrientationMakeTransformWithSizeAndOrigin(v9, var0, var1, 0, 0, (uint64_t)retstr);
}

+ (id)urlOfAVAsset:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 URL];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v6 = [v5 tracks];
      uint64_t v24 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v4 = 0;
      if (v24)
      {
        uint64_t v7 = *(void *)v32;
        uint64_t v22 = *(void *)v32;
        uint64_t v23 = v5;
        BOOL v25 = v6;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v32 != v7) {
              objc_enumerationMutation(v6);
            }
            uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            char v10 = objc_msgSend(v9, "segments", v22);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v28;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v28 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                  long long v16 = [v15 sourceURL];

                  if (v16)
                  {
                    long long v17 = [v15 sourceURL];
                    char v18 = [v4 isEqual:v17];

                    if ((v18 & 1) == 0)
                    {
                      if (v4)
                      {
                        if (_NULogOnceToken != -1) {
                          dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
                        }
                        long long v21 = _NULogger;
                        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "More than one url found in AVComposition. urlOfAVAsset will return nil.", buf, 2u);
                        }

                        uint64_t v19 = 0;
                        goto LABEL_25;
                      }
                      id v4 = [v15 sourceURL];
                    }
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            uint64_t v6 = v25;
            uint64_t v7 = v22;
          }
          id v5 = v23;
          uint64_t v24 = [v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v24);
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  id v4 = v4;
  uint64_t v19 = v4;
LABEL_25:

  return v19;
}

+ (id)compositionFromVideoComposition:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 instructions];
  uint64_t v5 = [v4 count];

  id v6 = 0;
  if (!v5)
  {
LABEL_7:
    id v6 = v6;
    uint64_t v14 = v6;
    goto LABEL_21;
  }
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = [v3 instructions];
    uint64_t v9 = [v8 objectAtIndexedSubscript:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_6:

    ++v7;
    uint64_t v12 = [v3 instructions];
    unint64_t v13 = [v12 count];

    if (v7 >= v13) {
      goto LABEL_7;
    }
  }
  id v10 = v9;
  uint64_t v11 = v10;
  if (!v6)
  {
    id v6 = [v10 adjustmentComposition];

    goto LABEL_6;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
  }
  long long v15 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = NSString;
    long long v17 = v15;
    char v18 = [v16 stringWithFormat:@"More than one NUComposition found in the AVVideoComposition. Cannot determine which to use."];
    *(_DWORD *)uint64_t v36 = 138543362;
    *(void *)&v36[4] = v18;
    _os_log_impl(&dword_1A9892000, v17, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v36, 0xCu);

    uint64_t v19 = _NULogOnceToken;
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v19 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
      }
LABEL_15:
      uint64_t v20 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = specific;
        long long v28 = v20;
        long long v29 = [v26 callStackSymbols];
        long long v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v36 = 138543618;
        *(void *)&v36[4] = specific;
        __int16 v37 = 2114;
        long long v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);

        goto LABEL_25;
      }
      goto LABEL_20;
    }
    if (v19 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
    }
  }
  else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    goto LABEL_15;
  }
  long long v31 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    long long v33 = (void *)MEMORY[0x1E4F29060];
    long long v28 = v31;
    long long v34 = [v33 callStackSymbols];
    uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
    *(_DWORD *)uint64_t v36 = 138543362;
    *(void *)&v36[4] = v35;
    _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);

LABEL_25:
  }
LABEL_20:
  _NUAssertContinueHandler((uint64_t)"+[NUVideoUtilities compositionFromVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2101, @"More than one NUComposition found in the AVVideoComposition. Cannot determine which to use.", v21, v22, v23, v24, *(uint64_t *)v36);

  uint64_t v14 = 0;
LABEL_21:

  return v14;
}

+ (id)pixelFormatStringForCVPixelBuffer:(__CVBuffer *)a3
{
  if (a3)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    id v4 = (__CFString *)objc_opt_new();
    unsigned int v7 = bswap32(PixelFormatType);
    [(__CFString *)v4 appendFormat:@"(%.4s)", &v7];
    switch(PixelFormatType)
    {
      case 0x78343230u:
        uint64_t v5 = @" - 10bit video range";
        break;
      case 0x34323076u:
        uint64_t v5 = @" - 8bit video range";
        break;
      case 0x34323066u:
        uint64_t v5 = @" - 8bit full range";
        break;
      default:
        goto LABEL_10;
    }
    [(__CFString *)v4 appendString:v5];
  }
  else
  {
    id v4 = &stru_1F0017700;
  }
LABEL_10:

  return v4;
}

+ (id)debugDescriptionOfAssetTrack:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 description];
  unsigned int v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = [v4 segments];

  uint64_t v9 = [v8 description];
  [v7 appendFormat:@"\nSegments:\n\t%@", v9];

  id v10 = (void *)[v7 copy];

  return v10;
}

+ (id)cleanApertureVideoSettingsFor:(id *)a3 scale:(id)a4 videoSize:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v28[4] = *MEMORY[0x1E4F143B8];
  int64x2_t v25 = 0u;
  long long v26 = 0u;
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = a3->var1;
  v24[0] = (int64x2_t)a3->var0;
  v24[1] = (int64x2_t)v7;
  NUPixelRectScaleRational(v24, a4.var0, a4.var1, 1, &v25);
  int64_t v8 = NUEvenPixelSize(v26, *((uint64_t *)&v26 + 1));
  uint64_t v10 = v9;
  if (var0 >= 0) {
    uint64_t v11 = var0;
  }
  else {
    uint64_t v11 = var0 + 1;
  }
  if (var1 >= 0) {
    uint64_t v12 = var1;
  }
  else {
    uint64_t v12 = var1 + 1;
  }
  if (v8 >= 0) {
    uint64_t v13 = v8;
  }
  else {
    uint64_t v13 = v8 + 1;
  }
  uint64_t v14 = v25.i64[0] - (v11 >> 1);
  if (v9 >= 0) {
    uint64_t v15 = v9;
  }
  else {
    uint64_t v15 = v9 + 1;
  }
  uint64_t v16 = v14 + (v13 >> 1);
  uint64_t v17 = v25.i64[1] - (v12 >> 1) + (v15 >> 1);
  v27[0] = *MEMORY[0x1E4F16208];
  char v18 = [NSNumber numberWithInteger:v8];
  v28[0] = v18;
  v27[1] = *MEMORY[0x1E4F161E8];
  uint64_t v19 = [NSNumber numberWithInteger:v10];
  v28[1] = v19;
  v27[2] = *MEMORY[0x1E4F161F0];
  uint64_t v20 = [NSNumber numberWithInteger:v16];
  v28[2] = v20;
  v27[3] = *MEMORY[0x1E4F16200];
  uint64_t v21 = [NSNumber numberWithInteger:v17];
  v28[3] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  return v22;
}

+ (BOOL)compositionInstructions:(id)a3 areEqualToCompositionInstructions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = [v5 instructions];
  uint64_t v8 = [v6 instructions];
  uint64_t v9 = (void *)v8;
  if ((v7 != 0) == (v8 == 0)) {
    *((unsigned char *)v17 + 24) = 0;
  }
  if (v7 && v8)
  {
    uint64_t v10 = [v7 count];
    if (v10 == [v9 count])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __78__NUVideoUtilities_compositionInstructions_areEqualToCompositionInstructions___block_invoke;
      v13[3] = &unk_1E5D94B58;
      id v14 = v9;
      uint64_t v15 = &v16;
      [v7 enumerateObjectsUsingBlock:v13];
    }
    else
    {
      *((unsigned char *)v17 + 24) = 0;
    }
  }
  char v11 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __78__NUVideoUtilities_compositionInstructions_areEqualToCompositionInstructions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  if (([v10 isEqual:v7] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v10 adjustmentComposition];
        uint64_t v9 = [v7 adjustmentComposition];
        if ((v8 != 0) == (v9 == 0) || v8 && ([v8 isEqual:v9] & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
}

+ (id)videoCompositionDescription:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v4 appendFormat:@"Video Composition: %@\n", v3];
  [v4 appendString:@"Instructions: \n"];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v23 = v3;
  id v5 = [v3 instructions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v12 = v11;
        if (v11) {
          [v11 timeRange];
        }
        else {
          memset(&v34, 0, sizeof(v34));
        }
        CMTimeRange range = v34;
        uint64_t v13 = (__CFString *)CMTimeRangeCopyDescription(v9, &range);
        id v14 = [v12 adjustmentComposition];
        [v4 appendFormat:@"instruction i:%@ tr:%@ c:%@\n", v12, v13, v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  uint64_t v15 = [v23 instructions];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if (v20)
        {
          [*(id *)(*((void *)&v30 + 1) + 8 * j) timeRange];
          *(_OWORD *)&time.value = v26;
          time.epoch = v27;
          Float64 Seconds = CMTimeGetSeconds(&time);
          [v20 timeRange];
        }
        else
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v26 = 0u;
          memset(&time, 0, sizeof(time));
          Float64 Seconds = CMTimeGetSeconds(&time);
          memset(&v24, 0, sizeof(v24));
        }
        CMTimeRangeGetEnd(&v25, &v24);
        objc_msgSend(v4, "appendFormat:", @"| %5.3f  %5.3f |", *(void *)&Seconds, CMTimeGetSeconds(&v25));
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v17);
  }

  return v4;
}

+ (id)videoDescription:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = v3;
  id obj = [v3 tracks];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 mediaType];
        if (v11) {
          [v11 timeRange];
        }
        else {
          memset(&v18, 0, sizeof(v18));
        }
        CMTimeRange range = v18;
        uint64_t v13 = (__CFString *)CMTimeRangeCopyDescription(v9, &range);
        id v14 = [v11 segments];
        [v4 appendFormat:@"#:%d  media:%@  range:%@  segments %@\n", v7 + i, v12, v13, v14];
      }
      uint64_t v7 = (v7 + i);
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)repeatVideo:(id)a3 count:(int64_t)a4 error:(id *)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v25 = NUAssertLogger_13336();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      long long v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "video != nil");
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v28 = NUAssertLogger_13336();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        long long v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        uint64_t v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v46;
        LOWORD(buf[0].flags) = 2114;
        *(void *)((char *)&buf[0].flags + 2) = v50;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v29)
    {
      long long v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v31 = [v30 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideo:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1885, @"Invalid parameter not satisfying: %s", v51, v52, v53, v54, (uint64_t)"video != nil");
  }
  if (a4 <= 0)
  {
    long long v32 = NUAssertLogger_13336();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "count > 0");
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    CMTimeRange v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v35 = NUAssertLogger_13336();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        uint64_t v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        char v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v55;
        LOWORD(buf[0].flags) = 2114;
        *(void *)((char *)&buf[0].flags + 2) = v59;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v36)
    {
      long long v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v38 = [v37 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideo:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1886, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"count > 0");
  }
  if (!a5)
  {
    uint64_t v39 = NUAssertLogger_13336();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v42 = NUAssertLogger_13336();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v65 = (void *)MEMORY[0x1E4F29060];
        id v66 = v64;
        id v67 = [v65 callStackSymbols];
        v68 = [v67 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v64;
        LOWORD(buf[0].flags) = 2114;
        *(void *)((char *)&buf[0].flags + 2) = v68;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v43)
    {
      uint64_t v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideo:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1887, @"Invalid parameter not satisfying: %s", v69, v70, v71, v72, (uint64_t)"error != nil");
  }
  uint64_t v8 = v7;
  if (a4 == 1)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F16590]);
    id v11 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v8];
    if ([v11 count])
    {
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];
      uint64_t v13 = v12;
      memset(buf, 0, sizeof(buf));
      if (v12
        && ([v12 timeRange], (buf[0].flags & 1) != 0)
        && (buf[1].flags & 1) != 0
        && !buf[1].epoch
        && (buf[1].value & 0x8000000000000000) == 0)
      {
        CMTime v98 = buf[1];
        CMTime v97 = buf[0];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v14 = [v8 tracks];
        uint64_t v75 = [v14 countByEnumeratingWithState:&v93 objects:v99 count:16];
        id v15 = 0;
        if (v75)
        {
          uint64_t v16 = *(void *)v94;
          long long v77 = v14;
          id v78 = v10;
          uint64_t v73 = *(void *)v94;
          long long v74 = v13;
          do
          {
            uint64_t v17 = 0;
            CMTimeRange v18 = v15;
            while (2)
            {
              if (*(void *)v94 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v76 = v17;
              long long v19 = *(void **)(*((void *)&v93 + 1) + 8 * v17);
              long long v20 = [v19 mediaType];
              long long v21 = objc_msgSend(v10, "addMutableTrackWithMediaType:preferredTrackID:", v20, objc_msgSend(v19, "trackID"));

              if (v19)
              {
                [v19 preferredTransform];
              }
              else
              {
                long long v91 = 0u;
                long long v92 = 0u;
                long long v90 = 0u;
              }
              v89[0] = v90;
              v89[1] = v91;
              v89[2] = v92;
              [v21 setPreferredTransform:v89];
              [v19 preferredVolume];
              objc_msgSend(v21, "setPreferredVolume:");
              objc_msgSend(v21, "setNaturalTimeScale:", objc_msgSend(v19, "naturalTimeScale"));
              memset(&v88, 0, sizeof(v88));
              if (v19)
              {
                [v19 timeRange];
              }
              else
              {
                long long v85 = 0u;
                long long v86 = 0u;
                long long v84 = 0u;
              }
              *(_OWORD *)&rhs.value = v84;
              rhs.epoch = v85;
              CMTime lhs = v97;
              CMTimeAdd(&v88, &lhs, &rhs);
              int64_t v22 = a4;
              do
              {
                if (v19) {
                  [v19 timeRange];
                }
                else {
                  memset(v82, 0, sizeof(v82));
                }
                id v81 = v18;
                CMTime lhs = v88;
                int v23 = [v21 insertTimeRange:v82 ofTrack:v19 atTime:&lhs error:&v81];
                id v15 = v81;

                if (!v23)
                {
                  *a5 = +[NUError errorWithCode:1 reason:@"Failed to update track" object:v21 underlyingError:v15];

                  id v9 = 0;
                  id v10 = v78;
                  uint64_t v13 = v74;
                  goto LABEL_40;
                }
                CMTime v80 = v88;
                CMTime v79 = v98;
                CMTimeAdd(&lhs, &v80, &v79);
                CMTime v88 = lhs;
                CMTimeRange v18 = v15;
                --v22;
              }
              while (v22);

              uint64_t v17 = v76 + 1;
              CMTimeRange v18 = v15;
              id v14 = v77;
              id v10 = v78;
              uint64_t v16 = v73;
              if (v76 + 1 != v75) {
                continue;
              }
              break;
            }
            uint64_t v13 = v74;
            uint64_t v75 = [v77 countByEnumeratingWithState:&v93 objects:v99 count:16];
          }
          while (v75);
        }

        id v9 = v10;
LABEL_40:
      }
      else
      {
        +[NUError errorWithCode:2 reason:@"primary video track timerange is invalid" object:v8];
        id v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError errorWithCode:3 reason:@"No video tracks in input" object:v8];
      id v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

+ (id)repeatAudio:(id)a3 count:(int64_t)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    BOOL v29 = NUAssertLogger_13336();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "audio != nil");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v32 = NUAssertLogger_13336();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        uint64_t v53 = [v51 callStackSymbols];
        uint64_t v54 = [v53 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v54;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v33)
    {
      CMTimeRange v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v35 = [v34 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatAudio:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1808, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"audio != nil");
  }
  if (a4 <= 0)
  {
    BOOL v36 = NUAssertLogger_13336();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      long long v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "count > 0");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    long long v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v39 = NUAssertLogger_13336();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        uint64_t v62 = [v60 callStackSymbols];
        uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v59;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v63;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v40)
    {
      uint64_t v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatAudio:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1809, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"count > 0");
  }
  if (!a5)
  {
    BOOL v43 = NUAssertLogger_13336();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v44;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v46 = NUAssertLogger_13336();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        uint64_t v71 = [v69 callStackSymbols];
        uint64_t v72 = [v71 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v68;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v72;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v47)
    {
      id v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v49;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatAudio:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1810, @"Invalid parameter not satisfying: %s", v73, v74, v75, v76, (uint64_t)"error != nil");
  }
  uint64_t v8 = v7;
  if (a4 == 1
    || ([v7 inputParameters],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        !v10))
  {
    long long v27 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v90 = 0;
    memset(&buf, 0, sizeof(buf));
    id v11 = [v8 inputParameters];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];

    long long v79 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&v89.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v89.epoch = v13;
    do
    {
      range.CMTimeRange start = v89;
      char v14 = [v12 getVolumeRampForTime:&range startVolume:(char *)&v90 + 4 endVolume:&v90 timeRange:&buf];
      CMTimeRange range = buf;
      CMTimeRangeGetEnd(&v89, &range);
    }
    while ((v14 & 1) != 0);
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = [v8 inputParameters];
    uint64_t v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v77 = v8;
    id obj = [v8 inputParameters];
    uint64_t v18 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v85 != v20) {
            objc_enumerationMutation(obj);
          }
          int64_t v22 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          int v23 = (void *)[v22 mutableCopy];
          uint64_t v24 = 1;
          do
          {
            *(_OWORD *)&range.start.value = v79;
            range.start.epoch = v13;
            if ([v22 getVolumeRampForTime:&range startVolume:(char *)&v90 + 4 endVolume:&v90 timeRange:&buf])
            {
              do
              {
                memset(&v83, 0, sizeof(v83));
                range.CMTimeRange start = v89;
                CMTimeMultiplyByRatio(&rhs, &range.start, v24, 1);
                *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
                range.start.epoch = buf.start.epoch;
                CMTimeAdd(&v83, &range.start, &rhs);
                memset(&range, 0, sizeof(range));
                start.CMTimeRange start = v83;
                CMTime duration = buf.duration;
                CMTimeRangeMake(&range, &start.start, &duration);
                LODWORD(v25) = HIDWORD(v90);
                LODWORD(v26) = v90;
                CMTimeRange start = range;
                [v23 setVolumeRampFromStartVolume:&start toEndVolume:v25 timeRange:v26];
                CMTimeRange range = buf;
                CMTimeRangeGetEnd(&start.start, &range);
                *(_OWORD *)&range.start.value = *(_OWORD *)&start.start.value;
                range.start.epoch = start.start.epoch;
              }
              while (([v22 getVolumeRampForTime:&range startVolume:(char *)&v90 + 4 endVolume:&v90 timeRange:&buf] & 1) != 0);
            }
            CMTimeRange range = buf;
            CMTimeRangeGetEnd(&start.start, &range);
            ++v24;
          }
          while (v24 != a4);
          [v17 addObject:v23];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v19);
    }

    long long v27 = [MEMORY[0x1E4F16580] audioMix];
    [v27 setInputParameters:v17];

    uint64_t v8 = v77;
  }

  return v27;
}

+ (id)repeatVideoComposition:(id)a3 count:(int64_t)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    BOOL v29 = NUAssertLogger_13336();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoComposition != nil");
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v107, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v32 = NUAssertLogger_13336();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        uint64_t v53 = [v51 callStackSymbols];
        uint64_t v54 = [v53 componentsJoinedByString:@"\n"];
        LODWORD(v107.value) = 138543618;
        *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v50;
        LOWORD(v107.flags) = 2114;
        *(void *)((char *)&v107.flags + 2) = v54;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v107, 0x16u);
      }
    }
    else if (v33)
    {
      CMTimeRange v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v35 = [v34 componentsJoinedByString:@"\n"];
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v107, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideoComposition:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1756, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"videoComposition != nil");
  }
  if (a4 <= 0)
  {
    BOOL v36 = NUAssertLogger_13336();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      long long v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "count > 0");
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v107, 0xCu);
    }
    long long v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v39 = NUAssertLogger_13336();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        uint64_t v62 = [v60 callStackSymbols];
        uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
        LODWORD(v107.value) = 138543618;
        *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v59;
        LOWORD(v107.flags) = 2114;
        *(void *)((char *)&v107.flags + 2) = v63;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v107, 0x16u);
      }
    }
    else if (v40)
    {
      uint64_t v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v107, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideoComposition:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1757, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"count > 0");
  }
  if (!a5)
  {
    BOOL v43 = NUAssertLogger_13336();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v44;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v107, 0xCu);
    }
    uint64_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v46 = NUAssertLogger_13336();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        uint64_t v71 = [v69 callStackSymbols];
        uint64_t v72 = [v71 componentsJoinedByString:@"\n"];
        LODWORD(v107.value) = 138543618;
        *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v68;
        LOWORD(v107.flags) = 2114;
        *(void *)((char *)&v107.flags + 2) = v72;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v107, 0x16u);
      }
    }
    else if (v47)
    {
      id v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v49;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v107, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideoComposition:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1758, @"Invalid parameter not satisfying: %s", v73, v74, v75, v76, (uint64_t)"error != nil");
  }
  uint64_t v8 = v7;
  if (a4 == 1)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [v7 instructions];
    if ([v10 count])
    {
      id v78 = v8;
      long long v80 = *MEMORY[0x1E4F1FA48];
      *(_OWORD *)&v107.value = *MEMORY[0x1E4F1FA48];
      CMTimeEpoch v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      v107.epoch = v11;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v77 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v101 objects:v106 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v102 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            if (v17)
            {
              [v17 timeRange];
            }
            else
            {
              memset(v99, 0, sizeof(v99));
              long long v98 = 0u;
            }
            CMTime rhs = *(CMTime *)((char *)v99 + 8);
            CMTime lhs = v107;
            CMTimeAdd(&v107, &lhs, &rhs);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v101 objects:v106 count:16];
        }
        while (v14);
      }

      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v19 = 0;
      *(_OWORD *)&lhs.value = v80;
      lhs.epoch = v11;
      int64_t v79 = a4;
      do
      {
        uint64_t v81 = v19;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v20 = v12;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v93 objects:v105 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v94;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v94 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = *(id *)(*((void *)&v93 + 1) + 8 * j);
              double v26 = (void *)[v25 copy];
              long long v27 = [v25 renderContext];

              [v26 setRenderContext:v27];
              memset(&v92, 0, sizeof(v92));
              if (v26)
              {
                [v26 timeRange];
              }
              else
              {
                long long v89 = 0u;
                long long v90 = 0u;
                long long v88 = 0u;
              }
              *(_OWORD *)&v91.value = v88;
              v91.epoch = v89;
              CMTime start = lhs;
              CMTimeAdd(&v92, &v91, &start);
              if (v26)
              {
                [v26 timeRange];
              }
              else
              {
                memset(v84, 0, sizeof(v84));
                long long v83 = 0u;
              }
              CMTime duration = *(CMTime *)((char *)v84 + 8);
              CMTime start = v92;
              CMTimeRangeMake(&v86, &start, &duration);
              CMTimeRange v82 = v86;
              [v26 setTimeRange:&v82];
              [v18 addObject:v26];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v93 objects:v105 count:16];
          }
          while (v22);
        }

        CMTime v92 = lhs;
        CMTime start = v107;
        CMTimeAdd(&lhs, &v92, &start);
        uint64_t v19 = v81 + 1;
      }
      while (v81 + 1 != v79);
      uint64_t v8 = v78;
      id v9 = (id)[v78 copy];
      [v9 setInstructions:v18];

      uint64_t v10 = v77;
    }
    else
    {
      +[NUError errorWithCode:3 reason:@"missing instructions" object:v8];
      id v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

+ ($246D6535441D8C1432A5B8F9230D346F)convertTimeRange:(SEL)a3 toMaximumTimeScaleOfRange:(id *)a4
{
  if (a5->var0.var1 <= a5->var1.var1) {
    int32_t var1 = a5->var1.var1;
  }
  else {
    int32_t var1 = a5->var0.var1;
  }
  memset(&v12, 0, sizeof(v12));
  CMTime time = (CMTime)a4->var0;
  CMTimeConvertScale(&v12, &time, var1, kCMTimeRoundingMethod_RoundAwayFromZero);
  memset(&time, 0, sizeof(time));
  CMTime start = (CMTime)a4->var1;
  CMTimeConvertScale(&time, &start, var1, kCMTimeRoundingMethod_RoundTowardZero);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.int32_t var1 = 0u;
  *(_OWORD *)&retstr->var0.int64_t var0 = 0u;
  CMTime start = v12;
  CMTime v9 = time;
  return ($246D6535441D8C1432A5B8F9230D346F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v9);
}

+ ($246D6535441D8C1432A5B8F9230D346F)conformRange:(SEL)a3 inRange:(id *)a4
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.int32_t var1 = 0u;
  *(_OWORD *)&retstr->var0.int64_t var0 = 0u;
  long long v7 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a4->var1.var1;
  long long v8 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&otherRange.start.epoch = v8;
  *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
  [a2 convertTimeRange:&range toMaximumTimeScaleOfRange:&otherRange];
  long long v9 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  long long v10 = *(_OWORD *)&retstr->var0.var3;
  *(_OWORD *)&otherRange.start.value = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)&otherRange.start.epoch = v10;
  *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&retstr->var1.var1;
  BOOL result = ($246D6535441D8C1432A5B8F9230D346F *)CMTimeRangeContainsTimeRange(&range, &otherRange);
  if (!result)
  {
    long long v12 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&otherRange.start.epoch = v12;
    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
    long long v13 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)&v15.start.value = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v15.start.epoch = v13;
    *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&retstr->var1.var1;
    BOOL result = ($246D6535441D8C1432A5B8F9230D346F *)CMTimeRangeGetIntersection(&range, &otherRange, &v15);
    long long v14 = *(_OWORD *)&range.start.epoch;
    *(_OWORD *)&retstr->var0.int64_t var0 = *(_OWORD *)&range.start.value;
    *(_OWORD *)&retstr->var0.var3 = v14;
    *(_OWORD *)&retstr->var1.int32_t var1 = *(_OWORD *)&range.duration.timescale;
  }
  return result;
}

+ (id)newPixelBufferOfSize:(id)a3 format:(unsigned int)a4
{
  size_t var1 = a3.var1;
  size_t var0 = a3.var0;
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = *MEMORY[0x1E4F2F128];
  v27[0] = @"NUVideoUtilities";
  long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  uint64_t v24 = *MEMORY[0x1E4F24D20];
  id v25 = v7;
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v9 = CVPixelBufferCreate(0, var0, var1, a4, v8, &pixelBufferOut);
  if (v9)
  {
    CVReturn v10 = v9;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    CMTimeEpoch v11 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 67109888;
      int v17 = var0;
      __int16 v18 = 1024;
      int v19 = var1;
      __int16 v20 = 1024;
      unsigned int v21 = a4;
      __int16 v22 = 1024;
      CVReturn v23 = v10;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Failed to allocate CVPixelBuffer of size: %dx%d, format: %u, error: %d", buf, 0x1Au);
    }
    long long v12 = 0;
  }
  else
  {
    long long v13 = [NUCVPixelBuffer alloc];
    long long v12 = [(NUCVPixelBuffer *)v13 initWithCVPixelBuffer:pixelBufferOut];
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v12;
}

+ ($8D19A3D7F6B32A57CF9B882F3E1C418F)cleanApertureOfTrack:(SEL)a3 oriented:(id)a4
{
  BOOL v5 = a5;
  id v8 = a4;
  CVReturn v9 = [v8 formatDescriptions];
  CVReturn v10 = [v9 firstObject];

  CGRect CleanAperture = CMVideoFormatDescriptionGetCleanAperture((CMVideoFormatDescriptionRef)v10, 0);
  retstr->size_t var0 = 0u;
  retstr->size_t var1 = 0u;
  CGRect v23 = CleanAperture;
  NU::RectT<long>::RectT(v22, &v23, 1);
  CGPoint v11 = (CGPoint)v22[0];
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = ($0AC6E346AE4835514AAA8AC86D8F4844)v22[1];
  retstr->size_t var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v22[0];
  retstr->size_t var1 = v12;
  if (v5)
  {
    CGSize v19 = (CGSize)v12;
    CGPoint v20 = v11;
    uint64_t v13 = [a2 encodedPixelSizeOfTrack:v8 oriented:0];
    uint64_t v15 = v14;
    if (v8) {
      [v8 preferredTransform];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    uint64_t v16 = [a2 videoOrientationForAssetPreferredTransform:v21];
    v23.origin = v20;
    v23.CGSize size = v19;
    NU::RectT<long>::applyOrientation((uint64_t *)&v23, v16, v13, v15);
    CGSize size = v23.size;
    retstr->size_t var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v23.origin;
    retstr->size_t var1 = ($0AC6E346AE4835514AAA8AC86D8F4844)size;
  }

  return result;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)encodedPixelSizeOfTrack:(id)a3 oriented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [v6 formatDescriptions];
  id v8 = [v7 firstObject];

  uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v8);
  uint64_t v10 = (int)Dimensions;
  uint64_t v11 = Dimensions >> 32;
  if ((((int)Dimensions | (unint64_t)(Dimensions >> 32)) & 0x8000000000000000) != 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v15 handleFailureInFunction:v16, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];

    if (!v4) {
      goto LABEL_7;
    }
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if (v6) {
    [v6 preferredTransform];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  uint64_t v10 = NUOrientationTransformImageSize([a1 videoOrientationForAssetPreferredTransform:v17], v10, v11);
  uint64_t v11 = v12;
LABEL_7:

  int64_t v13 = v10;
  int64_t v14 = v11;
  result.size_t var1 = v14;
  result.size_t var0 = v13;
  return result;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)naturalSizeOfTrack:(id)a3 oriented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 naturalSize];
  uint64_t v8 = (uint64_t)v7;
  [v6 naturalSize];
  uint64_t v10 = (uint64_t)v9;
  if (((uint64_t)v9 | v8) < 0)
  {
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v14 handleFailureInFunction:v15, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];

    if (!v4) {
      goto LABEL_7;
    }
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if (v6) {
    [v6 preferredTransform];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  uint64_t v8 = NUOrientationTransformImageSize([a1 videoOrientationForAssetPreferredTransform:v16], v8, v10);
  uint64_t v10 = v11;
LABEL_7:

  int64_t v12 = v8;
  int64_t v13 = v10;
  result.size_t var1 = v13;
  result.size_t var0 = v12;
  return result;
}

+ (int64_t)videoOrientationForAsset:(id)a3 videoComposition:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4) {
    return 1;
  }
  id v11 = 0;
  id v6 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:a3 error:&v11];
  id v7 = v11;
  if (v6)
  {
    [v6 preferredTransform];
    int64_t v4 = [a1 videoOrientationForAssetPreferredTransform:v10];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    uint64_t v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138543362;
      id v13 = v7;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Failed to get video track: %{public}@", buf, 0xCu);
    }
    int64_t v4 = 1;
  }

  return v4;
}

+ (int64_t)videoOrientationForAssetPreferredTransform:(CGAffineTransform *)a3
{
  __n128 v3 = *(__n128 *)&a3->c;
  v7[0] = *(__n128 *)&a3->a;
  v7[1] = v3;
  v7[2] = *(__n128 *)&a3->tx;
  uint64_t v4 = NUOrientationFromCGAffineTransform(v7);
  uint64_t v5 = NUOrientationConcat(v4, 4);

  return NUOrientationConcat(4, v5);
}

+ (id)readTimedMetadataGroupAtTime:(id *)a3 fromTrack:(id)a4 outputSettings:(id)a5 videoComposition:(id)a6 error:(id *)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a7)
  {
    CGRect v23 = NUAssertLogger_13336();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v26 = NUAssertLogger_13336();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        long long v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        BOOL v33 = [v31 callStackSymbols];
        CMTimeRange v34 = [v33 componentsJoinedByString:@"\n"];
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v30;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v27)
    {
      long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v29 = [v28 componentsJoinedByString:@"\n"];
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readTimedMetadataGroupAtTime:fromTrack:outputSettings:videoComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1590, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  uint64_t v14 = v13;
  uint64_t v15 = [v11 asset];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v15 error:a7];
  if (!v16)
  {
    int v17 = 0;
    goto LABEL_14;
  }
  memset(&buf, 0, sizeof(buf));
  +[NUVideoUtilities minimumFrameDurationForAsset:v15];
  if (v11) {
    [v11 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&lhs, &range);
  CMTime rhs = buf;
  CMTimeSubtract(&time2, &lhs, &rhs);
  CMTime time1 = (CMTime)*a3;
  CMTimeMinimum(&rhs, &time1, &time2);
  *(_OWORD *)&a3->size_t var0 = *(_OWORD *)&rhs.value;
  CMTimeEpoch epoch = rhs.epoch;
  a3->var3 = rhs.epoch;
  *(_OWORD *)&rhs.value = *(_OWORD *)&a3->var0;
  rhs.CMTimeEpoch epoch = epoch;
  CMTime time1 = buf;
  CMTimeRangeMake(&v40, &rhs, &time1);
  CMTimeRange v39 = v40;
  [v16 setTimeRange:&v39];
  CGSize v19 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v11 outputSettings:v12];
  CGPoint v20 = (void *)[objc_alloc(MEMORY[0x1E4F16390]) initWithAssetReaderTrackOutput:v19];
  if (([v16 canAddOutput:v19] & 1) == 0)
  {
    unsigned int v21 = +[NUError unknownError:@"Cannot add track output to asset reader" object:v16];
LABEL_12:
    int v17 = 0;
    *a7 = v21;
    goto LABEL_13;
  }
  [v16 addOutput:v19];
  if (([v16 startReading] & 1) == 0)
  {
    unsigned int v21 = [v16 error];
    goto LABEL_12;
  }
  int v17 = [v20 nextTimedMetadataGroup];
  [v16 cancelReading];
LABEL_13:

LABEL_14:

  return v17;
}

+ (__CVBuffer)readVideoFrameAtTime:(id *)a3 fromAsset:(id)a4 reader:(id)a5 readerOutput:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v13 setAlwaysCopiesSampleData:1];
  CMTimeMake(&duration, 1, 240);
  CMTime start = *(CMTime *)a3;
  CMTimeRangeMake(&v30, &start, &duration);
  CMTimeRange v28 = v30;
  [v12 setTimeRange:&v28];
  if (([v12 canAddOutput:v13] & 1) == 0)
  {
    uint64_t v15 = +[NUError unknownError:@"Cannot add track output to asset reader" object:v12];
LABEL_6:
    uint64_t v14 = 0;
    *a7 = v15;
    goto LABEL_7;
  }
  [v12 addOutput:v13];
  if (([v12 startReading] & 1) == 0)
  {
    uint64_t v15 = [v12 error];
    goto LABEL_6;
  }
  start.value = 0;
  *(void *)&start.timescale = &start;
  start.CMTimeEpoch epoch = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  CGSize v19 = __77__NUVideoUtilities_readVideoFrameAtTime_fromAsset_reader_readerOutput_error___block_invoke;
  CGPoint v20 = &unk_1E5D94B30;
  p_CMTime start = &start;
  CGRect v23 = a7;
  long long v24 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  id v21 = v11;
  +[NUVideoUtilities readNextPixelBuffer:v12 output:v13 block:&v17];
  objc_msgSend(v12, "cancelReading", v17, v18, v19, v20);
  uint64_t v14 = *(__CVBuffer **)(*(void *)&start.timescale + 24);

  _Block_object_dispose(&start, 8);
LABEL_7:

  return v14;
}

void __77__NUVideoUtilities_readVideoFrameAtTime_fromAsset_reader_readerOutput_error___block_invoke(uint64_t a1, const void *a2, void *a3, int a4)
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (a2)
  {
    CFRetain(a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  else if (v7 || !a4)
  {
    **(void **)(a1 + 48) = v7;
  }
  else
  {
    double v9 = NSString;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime time = *(CMTime *)(a1 + 56);
    id v11 = (__CFString *)CMTimeCopyDescription(v10, &time);
    id v12 = *(void **)(a1 + 32);
    if (v12) {
      [v12 duration];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    id v13 = (__CFString *)CMTimeCopyDescription(v10, &v15);
    uint64_t v14 = [v9 stringWithFormat:@"read past end of video. requestedTime:%@ assetDuration:%@", v11, v13];
    **(void **)(a1 + 48) = +[NUError invalidError:v14 object:*(void *)(a1 + 32)];
  }
}

+ (__CVBuffer)readVideoFrameAtTime:(id *)a3 fromAsset:(id)a4 outputSettings:(id)a5 videoComposition:(id)a6 auxiliaryImageType:(int64_t)a7 error:(id *)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!a8)
  {
    __int16 v22 = NUAssertLogger_13336();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      CGRect v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v25 = NUAssertLogger_13336();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        BOOL v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CMTimeRange v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        BOOL v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      CMTimeRange v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readVideoFrameAtTime:fromAsset:outputSettings:videoComposition:auxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1524, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"error != NULL");
  }
  uint64_t v17 = v16;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v14 error:a8];
  if (v18)
  {
    CGSize v19 = [a1 readerOutputForAsset:v14 outputSettings:v15 videoComposition:v17 auxiliaryImageType:a7 error:a8];
    if (v19)
    {
      *(_OWORD *)CMTime buf = *(_OWORD *)&a3->var0;
      *(void *)&uint8_t buf[16] = a3->var3;
      CGPoint v20 = (__CVBuffer *)[a1 readVideoFrameAtTime:buf fromAsset:v14 reader:v18 readerOutput:v19 error:a8];
    }
    else
    {
      CGPoint v20 = 0;
    }
  }
  else
  {
    CGPoint v20 = 0;
  }

  return v20;
}

+ (id)readerOutputForAssetTrack:(id)a3 outputSettings:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v6 outputSettings:v7];

  return v8;
}

+ (id)readerOutputForAsset:(id)a3 outputSettings:(id)a4 videoComposition:(id)a5 auxiliaryImageType:(int64_t)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!a7)
  {
    CGSize v19 = NUAssertLogger_13336();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CGPoint v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v36 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v22 = NUAssertLogger_13336();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        BOOL v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        BOOL v29 = [v27 callStackSymbols];
        CMTimeRange v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        uint64_t v36 = v26;
        __int16 v37 = 2114;
        uint64_t v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      long long v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v36 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readerOutputForAsset:outputSettings:videoComposition:auxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1484, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  id v15 = v14;
  if (v14)
  {
    id v16 = [a1 requiredVideoCompositionOutputTracksForAsset:v12];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F163A8]) initWithVideoTracks:v16 videoSettings:v13];
    [v17 setVideoComposition:v15];
  }
  else
  {
    if ((unint64_t)a6 > 1) {
      +[NUVideoUtilities auxiliaryTrackInAsset:v12 ofType:a6 error:a7];
    }
    else {
    id v16 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v12 error:a7];
    }
    if (v16)
    {
      uint64_t v17 = [a1 readerOutputForAssetTrack:v16 outputSettings:v13 error:a7];
    }
    else
    {
      uint64_t v17 = 0;
    }
  }

  return v17;
}

+ (id)requiredVideoCompositionOutputTracksForAsset:(id)a3
{
  __n128 v3 = (void *)MEMORY[0x1E4F8CC38];
  uint64_t v4 = *MEMORY[0x1E4F15C18];
  id v5 = a3;
  id v6 = [v3 tracksWithMediaType:v4 forAsset:v5];
  id v7 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BB8] forAsset:v5];

  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

  return v8;
}

+ (id)deepMutableCopyVideoComposition:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = [v3 instructions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
          }
          id v14 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            id v15 = NSString;
            id v16 = v14;
            uint64_t v17 = [v15 stringWithFormat:@"incorrect class of video instruction"];
            *(_DWORD *)CMTime buf = 138543362;
            uint64_t v38 = v17;
            _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

            uint64_t v18 = _NULogOnceToken;
            BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
            if (v18 != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
            }
          }
          else
          {
            BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
          }
          CGPoint v20 = (id)_NUAssertLogger;
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
          if (v19)
          {
            if (v21)
            {
              __int16 v22 = [MEMORY[0x1E4F29060] callStackSymbols];
              BOOL v23 = [v22 componentsJoinedByString:@"\n"];
              *(_DWORD *)CMTime buf = 138543362;
              uint64_t v38 = v23;
              _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
            }
          }
          else if (v21)
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            id v25 = (void *)MEMORY[0x1E4F29060];
            id v26 = specific;
            uint64_t v27 = [v25 callStackSymbols];
            id v28 = [v27 componentsJoinedByString:@"\n"];
            *(_DWORD *)CMTime buf = 138543618;
            uint64_t v38 = specific;
            __int16 v39 = 2114;
            CMTimeRange v40 = v28;
            _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
          _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities deepMutableCopyVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1459, @"incorrect class of video instruction", v29, v30, v31, v32, v33);
        }
        id v12 = (void *)[v11 copy];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v8);
  }

  [v4 setInstructions:v5];

  return v4;
}

+ (BOOL)updateVideoMetadataAtURL:(id)a3 withItems:(id)a4 stillImageTime:(id *)a5 error:(id *)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!a6)
  {
    uint64_t v44 = NUAssertLogger_13336();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v47 = NUAssertLogger_13336();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        uint64_t v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        uint64_t v54 = [v52 callStackSymbols];
        uint64_t v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v55;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      uint64_t v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities updateVideoMetadataAtURL:withItems:stillImageTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1277, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"error != NULL");
  }
  id v11 = v10;
  id v12 = [MEMORY[0x1E4F16330] assetWithURL:v9];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v12 error:a6];
  if (!v13)
  {
    LOBYTE(v39) = 0;
    goto LABEL_30;
  }
  id v14 = [MEMORY[0x1E4F29128] UUID];
  id v15 = [v14 UUIDString];

  id v16 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v17 = NSTemporaryDirectory();
  uint64_t v18 = [v16 fileURLWithPath:v17 isDirectory:1];

  v68 = v18;
  BOOL v19 = [v18 URLByAppendingPathComponent:v15 isDirectory:0];
  CGPoint v20 = [v9 pathExtension];
  uint64_t v21 = [v19 URLByAppendingPathExtension:v20];

  __int16 v22 = [v9 pathExtension];
  uint64_t v23 = NUFileTypeFromExtension(v22);

  uint64_t v66 = (void *)v23;
  uint64_t v67 = (void *)v21;
  long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F163B8]) initWithURL:v21 fileType:v23 error:a6];
  if (!v24)
  {
    LOBYTE(v39) = 0;
    CMTimeRange v40 = v67;
    uint64_t v41 = v68;
    uint64_t v42 = v66;
    goto LABEL_29;
  }
  uint64_t v60 = a6;
  id v61 = v15;
  id v64 = v9;
  id v25 = [v12 metadata];
  id v26 = (void *)[v25 mutableCopy];

  uint64_t v63 = v11;
  [v26 addObjectsFromArray:v11];
  uint64_t v65 = v26;
  [v24 setMetadata:v26];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v62 = v12;
  id obj = [v12 tracks];
  uint64_t v27 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (!v27) {
    goto LABEL_16;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v72;
  uint64_t v69 = *MEMORY[0x1E4F15BE0];
  while (2)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v72 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      if (a5->var2)
      {
        uint64_t v32 = [*(id *)(*((void *)&v71 + 1) + 8 * i) mediaType];
        char v33 = [v32 isEqualToString:v69];

        if (v33) {
          continue;
        }
      }
      long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v31 outputSettings:0];
      [v34 setAlwaysCopiesSampleData:0];
      if ([v13 canAddOutput:v34])
      {
        [v13 addOutput:v34];
        id v35 = objc_alloc(MEMORY[0x1E4F163C0]);
        long long v36 = [v31 mediaType];
        __int16 v37 = (void *)[v35 initWithMediaType:v36 outputSettings:0];

        if ([v24 canAddInput:v37])
        {
          [v24 addInput:v37];

          continue;
        }
        *uint64_t v60 = +[NUError unknownError:@"Cannot add track input to asset writer" object:v13];
      }
      else
      {
        *uint64_t v60 = +[NUError unknownError:@"Cannot add track output to asset reader" object:v13];
      }

      LOBYTE(v39) = 0;
      id v11 = v63;
      id v9 = v64;
      id v15 = v61;
      id v12 = v62;
      CMTimeRange v40 = v67;
      uint64_t v41 = v68;
      goto LABEL_24;
    }
    uint64_t v28 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_16:

  *(_OWORD *)CMTime buf = *(_OWORD *)&a5->var0;
  *(void *)&uint8_t buf[16] = a5->var3;
  if (!+[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:](NUVideoUtilities, "readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:", v13, v24, buf, 1, 0, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v60))
  {
    LOBYTE(v39) = 0;
    id v11 = v63;
    id v9 = v64;
    id v15 = v61;
    id v12 = v62;
    CMTimeRange v40 = v67;
    uint64_t v41 = v68;
LABEL_27:
    uint64_t v42 = v66;
    goto LABEL_28;
  }
  uint64_t v38 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = v64;
  int v39 = [v38 removeItemAtURL:v64 error:v60];

  id v15 = v61;
  CMTimeRange v40 = v67;
  if (!v39)
  {
    id v12 = v62;
    id v11 = v63;
    uint64_t v41 = v68;
    goto LABEL_27;
  }
  id obj = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v39) = [obj moveItemAtURL:v67 toURL:v64 error:v60];
  id v12 = v62;
  id v11 = v63;
  uint64_t v41 = v68;
LABEL_24:
  uint64_t v42 = v66;

LABEL_28:
LABEL_29:

LABEL_30:
  return v39;
}

+ (BOOL)readFromReader:(id)a3 andWriteToWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 progress:(id)a10 error:(id *)a11
{
  BOOL v13 = a6;
  v160[1] = *MEMORY[0x1E4F143B8];
  id v116 = a3;
  id v114 = a4;
  id v108 = a7;
  id v115 = a10;
  if (!a11)
  {
    long long v74 = NUAssertLogger_13336();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      uint64_t v75 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v75;
      _os_log_error_impl(&dword_1A9892000, v74, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v77 = NUAssertLogger_13336();
    BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v78)
      {
        uint64_t v81 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CMTimeRange v82 = (void *)MEMORY[0x1E4F29060];
        id v83 = v81;
        long long v84 = [v82 callStackSymbols];
        long long v85 = [v84 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&uint8_t buf[4] = v81;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v85;
        _os_log_error_impl(&dword_1A9892000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v78)
    {
      int64_t v79 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v80 = [v79 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v80;
      _os_log_error_impl(&dword_1A9892000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1057, @"Invalid parameter not satisfying: %s", v86, v87, v88, v89, (uint64_t)"error != NULL");
  }
  v109 = 0;
  CMTime v107 = a5;
  if ((a5->var2 & 1) != 0 && v13)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    id v16 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_1A9892000, v16, OS_LOG_TYPE_INFO, "Creating custom metadata input for keyframe time", buf, 2u);
    }
    *(void *)CMTime buf = 0;
    uint64_t v17 = *MEMORY[0x1E4F1F0F8];
    v158[0] = *MEMORY[0x1E4F1F108];
    v158[1] = v17;
    uint64_t v18 = *MEMORY[0x1E4F1F048];
    v159[0] = *MEMORY[0x1E4F218A0];
    v159[1] = v18;
    BOOL v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:2];
    v160[0] = v19;
    CFArrayRef v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:1];

    CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v20, (CMMetadataFormatDescriptionRef *)buf);
    id v21 = objc_alloc(MEMORY[0x1E4F163C0]);
    v109 = (void *)[v21 initWithMediaType:*MEMORY[0x1E4F15BE0] outputSettings:0 sourceFormatHint:*(void *)buf];
    CFRelease(*(CFTypeRef *)buf);
    if (![v114 canAddInput:v109])
    {
      *a11 = +[NUError unknownError:@"Cannot add metadata track input to asset writer" object:v116];

      goto LABEL_22;
    }
    [v114 addInput:v109];
  }
  if ([v116 startReading])
  {
    if ([v114 startWriting])
    {
      long long v112 = *MEMORY[0x1E4F1FA48];
      *(_OWORD *)CMTime buf = *MEMORY[0x1E4F1FA48];
      uint64_t v111 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      *(void *)&uint8_t buf[16] = v111;
      [v114 startSessionAtSourceTime:buf];
      if (v109) {
        uint64_t v22 = -1;
      }
      else {
        uint64_t v22 = 0;
      }
      uint64_t v23 = [v116 outputs];
      uint64_t v24 = [v23 count];
      id v25 = [v114 inputs];
      BOOL v26 = v24 == [v25 count] + v22;

      if (!v26)
      {
        long long v90 = NUAssertLogger_13336();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          CMTime v91 = [NSString stringWithFormat:@"Reader outputs should match writer inputs"];
          *(_DWORD *)CMTime buf = 138543362;
          *(void *)&uint8_t buf[4] = v91;
          _os_log_error_impl(&dword_1A9892000, v90, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        CMTime v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v93 = NUAssertLogger_13336();
        BOOL v94 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
        if (v92)
        {
          if (v94)
          {
            CMTime v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            long long v98 = (void *)MEMORY[0x1E4F29060];
            id v99 = v97;
            v100 = [v98 callStackSymbols];
            long long v101 = [v100 componentsJoinedByString:@"\n"];
            *(_DWORD *)CMTime buf = 138543618;
            *(void *)&uint8_t buf[4] = v97;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v101;
            _os_log_error_impl(&dword_1A9892000, v93, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v94)
        {
          long long v95 = [MEMORY[0x1E4F29060] callStackSymbols];
          long long v96 = [v95 componentsJoinedByString:@"\n"];
          *(_DWORD *)CMTime buf = 138543362;
          *(void *)&uint8_t buf[4] = v96;
          _os_log_error_impl(&dword_1A9892000, v93, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1092, @"Reader outputs should match writer inputs", v102, v103, v104, v105, v106);
      }
      long long v151 = *MEMORY[0x1E4F1F9F8];
      uint64_t v152 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      v150[0] = 0;
      v150[1] = v150;
      v150[2] = 0x2020000000;
      v150[3] = 0;
      uint64_t v27 = (uint64_t *)MEMORY[0x1E4F15C18];
      if (v115)
      {
        uint64_t v28 = [v116 asset];
        uint64_t v29 = v28;
        if (v28) {
          [v28 duration];
        }
        else {
          memset(buf, 0, sizeof(buf));
        }
        long long v151 = *(_OWORD *)buf;
        uint64_t v152 = *(void *)&buf[16];
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        uint64_t v38 = [v116 outputs];
        uint64_t v37 = 0;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v146 objects:v157 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v147;
          uint64_t v41 = *v27;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v147 != v40) {
                objc_enumerationMutation(v38);
              }
              BOOL v43 = [*(id *)(*((void *)&v146 + 1) + 8 * i) mediaType];
              unsigned int v44 = [v43 isEqualToString:v41];

              v37 += v44;
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v146 objects:v157 count:16];
          }
          while (v39);
        }
      }
      else
      {
        uint64_t v37 = 0;
      }
      uint64_t v140 = 0;
      v141 = &v140;
      uint64_t v142 = 0x3032000000;
      v143 = __Block_byref_object_copy__13453;
      v144 = __Block_byref_object_dispose__13454;
      id v145 = 0;
      group = dispatch_group_create();
      unint64_t v45 = 0;
      uint64_t v110 = *v27;
      while (1)
      {
        long long v46 = [v116 outputs];
        BOOL v47 = v45 < [v46 count];

        if (!v47) {
          break;
        }
        BOOL v48 = [v114 inputs];
        uint64_t v49 = [v48 objectAtIndexedSubscript:v45];

        v50 = [v116 outputs];
        uint64_t v51 = [v50 objectAtIndexedSubscript:v45];

        if (v115)
        {
          id v52 = [v51 mediaType];
          char v53 = [v52 isEqualToString:v110];
        }
        else
        {
          char v53 = 0;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"export_track_queue_%lu", v45);
        id v54 = objc_claimAutoreleasedReturnValue();
        uint64_t v55 = (const char *)[v54 UTF8String];
        uint64_t v56 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v57 = dispatch_queue_create(v55, v56);

        v138[0] = 0;
        v138[1] = v138;
        v138[2] = 0x2020000000;
        char v139 = 0;
        *(void *)CMTime buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3810000000;
        v154 = &unk_1A9AA79AF;
        long long v155 = v112;
        uint64_t v156 = v111;
        dispatch_group_enter(group);
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke;
        v125[3] = &unk_1E5D94AE0;
        char v137 = v53;
        v130 = v138;
        v131 = v150;
        id v126 = v115;
        uint64_t v134 = v37;
        id v58 = v49;
        id v127 = v58;
        id v59 = v51;
        long long v135 = v151;
        uint64_t v136 = v152;
        id v128 = v59;
        v132 = buf;
        v133 = &v140;
        v129 = group;
        [v58 requestMediaDataWhenReadyOnQueue:v57 usingBlock:v125];

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v138, 8);

        ++v45;
      }
      if (v109)
      {
        uint64_t v60 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v61 = dispatch_queue_create("metadata track queue", v60);

        *(void *)CMTime buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        LOBYTE(v154) = 0;
        dispatch_group_enter(group);
        v119[0] = MEMORY[0x1E4F143A8];
        v119[1] = 3221225472;
        v119[2] = __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_292;
        v119[3] = &unk_1E5D94B08;
        v122 = buf;
        id v120 = v109;
        long long v123 = *(_OWORD *)&v107->var0;
        int64_t var3 = v107->var3;
        v121 = group;
        [v120 requestMediaDataWhenReadyOnQueue:v61 usingBlock:v119];

        _Block_object_dispose(buf, 8);
      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_group_enter(group);
      if (v115 && [v115 isCancelled])
      {
        [v116 cancelReading];
        [v114 cancelWriting];
        dispatch_group_leave(group);
      }
      else
      {
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_293;
        v117[3] = &unk_1E5D95E68;
        v118 = group;
        [v114 finishWritingWithCompletionHandler:v117];
      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      if ([v116 status] == 3)
      {
        uint64_t v62 = (void *)v141[5];
        if (v62)
        {
          BOOL v35 = 0;
          *a11 = v62;
LABEL_66:

          _Block_object_dispose(&v140, 8);
          _Block_object_dispose(v150, 8);
          goto LABEL_23;
        }
        v68 = [v116 error];
        id v69 = +[NUError errorWithCode:1 reason:@"Failed to read from AVAsset" object:v116 underlyingError:v68];
        *a11 = v69;

        goto LABEL_65;
      }
      if ([v116 status] == 4)
      {
        uint64_t v63 = [v116 error];
        *a11 = +[NUError errorWithCode:10 reason:@"Cancelled read from AVAsset" object:v116 underlyingError:v63];

        goto LABEL_65;
      }
      if ([v114 status] != 3)
      {
        if ([v114 status] != 4)
        {
          BOOL v35 = 1;
          goto LABEL_66;
        }
        id v70 = [v114 error];
        *a11 = +[NUError errorWithCode:10 reason:@"Cancelled write to AVAsset" object:v114 underlyingError:v70];

LABEL_65:
        BOOL v35 = 0;
        goto LABEL_66;
      }
      id v64 = [v114 error];
      uint64_t v65 = [v64 domain];
      if ([v65 isEqualToString:*MEMORY[0x1E4F15AC0]])
      {
        BOOL v66 = [v64 code] == -11840;

        if (v66)
        {
          id v67 = +[NUError errorWithCode:12 reason:@"Failed to write AVAsset" object:v114 underlyingError:v64];
          goto LABEL_62;
        }
      }
      else
      {
      }
      long long v71 = (void *)v141[5];
      if (!v71)
      {
        long long v72 = [v114 error];
        id v73 = +[NUError errorWithCode:1 reason:@"Failed to write to AVAsset" object:v114 underlyingError:v72];
        *a11 = v73;

        goto LABEL_64;
      }
      id v67 = v71;
LABEL_62:
      *a11 = v67;
LABEL_64:

      goto LABEL_65;
    }
    uint64_t v31 = NSString;
    uint64_t v32 = [v114 outputURL];
    char v33 = [v31 stringWithFormat:@"Could not start writing AVAsset %@", v32];

    long long v34 = [v114 error];
    *a11 = +[NUError errorWithCode:1 reason:v33 object:v114 underlyingError:v34];
  }
  else
  {
    uint64_t v30 = [v116 error];
    *a11 = +[NUError errorWithCode:1 reason:@"Could not start reading AVAsset" object:v116 underlyingError:v30];
  }
LABEL_22:
  BOOL v35 = 0;
LABEL_23:

  return v35;
}

void __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 128))
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)/ (double)*(unint64_t *)(a1 + 96)* (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    int v2 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1A9892000, v2, OS_LOG_TYPE_INFO, "media data ready after finished", (uint8_t *)&buf, 2u);
    }
    [*(id *)(a1 + 40) markAsFinished];
    return;
  }
  if ([*(id *)(a1 + 40) isReadyForMoreMediaData])
  {
    id v3 = (_OWORD *)(a1 + 104);
    do
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        break;
      }
      uint64_t v4 = (void *)MEMORY[0x1AD0FAA90]();
      id v5 = *(void **)(a1 + 32);
      if (v5 && [v5 isCancelled])
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
        }
        id v6 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1A9892000, v6, OS_LOG_TYPE_INFO, "AVAsset reading and writing canceled via NSProgress", (uint8_t *)&buf, 2u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v7 = (void *)MEMORY[0x1AD0FAA90]();
        uint64_t v8 = (opaqueCMSampleBuffer *)[*(id *)(a1 + 48) copyNextSampleBuffer];
        if (v8)
        {
          if (*(unsigned char *)(a1 + 128) && (*(_DWORD *)(a1 + 116) & 0x1D) == 1 && *(uint64_t *)v3 >= 1)
          {
            memset(&buf, 0, sizeof(buf));
            CMSampleBufferGetDuration(&buf, v8);
            if ((buf.flags & 0x1D) == 1)
            {
              CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 32);
              CMTime rhs = buf;
              CMTimeAdd(&v16, &lhs, &rhs);
              *(CMTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = v16;
              CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 32);
              double Seconds = CMTimeGetSeconds(&lhs);
              *(_OWORD *)&lhs.value = *v3;
              lhs.CMTimeEpoch epoch = *(void *)(a1 + 120);
              p_CMTime lhs = &lhs;
              goto LABEL_29;
            }
            memset(&lhs, 0, sizeof(lhs));
            PresentationTimeStamp = CMSampleBufferGetPresentationTimeStamp(&lhs, v8);
            if ((lhs.flags & 0x1D) == 1)
            {
              *(CMTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = lhs;
              CMTime rhs = *(CMTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 32);
              double Seconds = CMTimeGetSeconds(&rhs);
              *(_OWORD *)&rhs.value = *v3;
              rhs.CMTimeEpoch epoch = *(void *)(a1 + 120);
              p_CMTime lhs = &rhs;
LABEL_29:
              PresentationTimeStamp = (CMTime *)objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((fmin(Seconds / CMTimeGetSeconds(p_lhs), 1.0)+ (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 72) + 8)+ 24))/ (double)*(unint64_t *)(a1 + 96)* (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
            }
          }
          id v12 = (void *)MEMORY[0x1AD0FAA90](PresentationTimeStamp);
          char v13 = [*(id *)(a1 + 40) appendSampleBuffer:v8];
          CFRelease(v8);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13 ^ 1;
          goto LABEL_31;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
LABEL_31:
    }
    while (([*(id *)(a1 + 40) isReadyForMoreMediaData] & 1) != 0);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 128))
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)/ (double)*(unint64_t *)(a1 + 96)* (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
    }
    [*(id *)(a1 + 40) markAsFinished];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_292(uint64_t a1)
{
  v117[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    int v2 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.duration.value) = 0;
      _os_log_impl(&dword_1A9892000, v2, OS_LOG_TYPE_INFO, "media data ready after finished", (uint8_t *)&buf, 2u);
    }
    [*(id *)(a1 + 32) markAsFinished];
  }
  else
  {
    int32_t v3 = *(_DWORD *)(a1 + 64);
    CMTimeValue v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 68);
    CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
    uint64_t v108 = v5;
    int v109 = *(_DWORD *)(a1 + 76);
    CMBlockBufferRef theBuffer = 0;
    CMSampleBufferRef v106 = 0;
    uint64_t v6 = *MEMORY[0x1E4F218A0];
    uint64_t v7 = *MEMORY[0x1E4F1F0F8];
    v115[0] = *MEMORY[0x1E4F1F108];
    v115[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1F048];
    v116[0] = v6;
    v116[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
    v117[0] = v9;
    CFArrayRef v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];

    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v12 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v10, &formatDescriptionOut);
    if (v12)
    {
      uint64_t v21 = v12;
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
      }
      uint64_t v22 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = NSString;
        uint64_t v24 = v22;
        id v25 = objc_msgSend(v23, "stringWithFormat:", @"Failed to CMMetadataFormatDescriptionCreateWithMetadataSpecifications: %d", v21);
        LODWORD(buf.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v25;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

        uint64_t v26 = _NULogOnceToken;
        BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v26 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
        }
      }
      else
      {
        BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      uint64_t v28 = (id)_NUAssertLogger;
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (v27)
      {
        if (v29)
        {
          uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
          LODWORD(buf.duration.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v31;
          _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (v29)
      {
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = specific;
        v68 = [v66 callStackSymbols];
        id v69 = [v68 componentsJoinedByString:@"\n"];
        LODWORD(buf.duration.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)specific;
        LOWORD(buf.duration.flags) = 2114;
        *(void *)((char *)&buf.duration.flags + 2) = v69;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1354, @"Failed to CMMetadataFormatDescriptionCreateWithMetadataSpecifications: %d", v70, v71, v72, v73, v21);
    }
    unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
    uint64_t v14 = CMBlockBufferCreateWithMemoryBlock(v11, 0, 9uLL, v11, 0, 0, 9uLL, 1u, &theBuffer);
    if (v14)
    {
      uint64_t v32 = v14;
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
      }
      char v33 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        long long v34 = NSString;
        BOOL v35 = v33;
        long long v36 = objc_msgSend(v34, "stringWithFormat:", @"Failed to CMBlockBufferCreateWithMemoryBlock: %d", v32);
        LODWORD(buf.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v36;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

        uint64_t v37 = _NULogOnceToken;
        BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v37 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
        }
      }
      else
      {
        BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      uint64_t v39 = (id)_NUAssertLogger;
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
      if (v38)
      {
        if (v40)
        {
          uint64_t v41 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
          LODWORD(buf.duration.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v42;
          _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (v40)
      {
        long long v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v75 = (void *)MEMORY[0x1E4F29060];
        id v76 = v74;
        uint64_t v77 = [v75 callStackSymbols];
        BOOL v78 = [v77 componentsJoinedByString:@"\n"];
        LODWORD(buf.duration.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v74;
        LOWORD(buf.duration.flags) = 2114;
        *(void *)((char *)&buf.duration.flags + 2) = v78;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1368, @"Failed to CMBlockBufferCreateWithMemoryBlock: %d", v79, v80, v81, v82, v32);
    }
    dataPointerOut = 0;
    uint64_t DataPointer = CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &dataPointerOut);
    if (DataPointer)
    {
      uint64_t v43 = DataPointer;
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
      }
      unsigned int v44 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        unint64_t v45 = NSString;
        long long v46 = v44;
        BOOL v47 = objc_msgSend(v45, "stringWithFormat:", @"Failed to CMBlockBufferGetDataPointer: %d", v43);
        LODWORD(buf.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v47;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

        uint64_t v48 = _NULogOnceToken;
        BOOL v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v48 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
        }
      }
      else
      {
        BOOL v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      v50 = (id)_NUAssertLogger;
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
      if (v49)
      {
        if (v51)
        {
          id v52 = [MEMORY[0x1E4F29060] callStackSymbols];
          char v53 = [v52 componentsJoinedByString:@"\n"];
          LODWORD(buf.duration.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v53;
          _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (v51)
      {
        id v83 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v84 = (void *)MEMORY[0x1E4F29060];
        id v85 = v83;
        uint64_t v86 = [v84 callStackSymbols];
        uint64_t v87 = [v86 componentsJoinedByString:@"\n"];
        LODWORD(buf.duration.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v83;
        LOWORD(buf.duration.flags) = 2114;
        *(void *)((char *)&buf.duration.flags + 2) = v87;
        _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1372, @"Failed to CMBlockBufferGetDataPointer: %d", v88, v89, v90, v91, v43);
    }
    CMTime v16 = dataPointerOut;
    *(_DWORD *)dataPointerOut = 150994944;
    v16[8] = -1;
    dataPointerOut = v16 + 8;
    *((_DWORD *)v16 + 1) = bswap32(LocalIDForMetadataIdentifyingFactors);
    if (v3) {
      int32_t v17 = v3;
    }
    else {
      int32_t v17 = 600;
    }
    memset(&v103, 0, sizeof(v103));
    CMTimeMake(&time, 1, v17);
    CMTimeConvertScale(&v103, &time, v3, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&buf.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&buf.decodeTimeStamp.value = v18;
    buf.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    buf.presentationTimeStamp.timescale = v3;
    HIDWORD(buf.presentationTimeStamp.epoch) = v109;
    *(void *)&buf.presentationTimeStamp.flags = v108;
    buf.CMTime duration = v103;
    buf.presentationTimeStamp.value = v4;
    size_t sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
    uint64_t v19 = CMSampleBufferCreate(v11, theBuffer, 1u, 0, 0, formatDescriptionOut, 1, 1, &buf, 1, &sampleSizeArray, &v106);
    if (v19)
    {
      uint64_t v54 = v19;
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
      }
      uint64_t v55 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v56 = NSString;
        dispatch_queue_t v57 = v55;
        id v58 = objc_msgSend(v56, "stringWithFormat:", @"Failed to CMSampleBufferCreate: %d", v54);
        *(_DWORD *)uint64_t v110 = 138543362;
        uint64_t v111 = v58;
        _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v110, 0xCu);

        uint64_t v59 = _NULogOnceToken;
        BOOL v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v59 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_584);
        }
      }
      else
      {
        BOOL v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      dispatch_queue_t v61 = (id)_NUAssertLogger;
      BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
      if (v60)
      {
        if (v62)
        {
          uint64_t v63 = [MEMORY[0x1E4F29060] callStackSymbols];
          id v64 = [v63 componentsJoinedByString:@"\n"];
          *(_DWORD *)uint64_t v110 = 138543362;
          uint64_t v111 = v64;
          _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v110, 0xCu);
        }
      }
      else if (v62)
      {
        CMTime v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v93 = (void *)MEMORY[0x1E4F29060];
        id v94 = v92;
        long long v95 = [v93 callStackSymbols];
        long long v96 = [v95 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v110 = 138543618;
        uint64_t v111 = v92;
        __int16 v112 = 2114;
        v113 = v96;
        _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v110, 0x16u);
      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1388, @"Failed to CMSampleBufferCreate: %d", v97, v98, v99, v100, v54);
    }
    CFRelease(formatDescriptionOut);
    CFRelease(theBuffer);
    CMSampleBufferRef v20 = v106;

    [*(id *)(a1 + 32) appendSampleBuffer:v20];
    [*(id *)(a1 + 32) markAsFinished];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    CFRelease(v20);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_293(uint64_t a1)
{
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)readStillImageTimeFromVideoAsset:(SEL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (_OWORD *)MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  CFArrayRef v10 = [a2 metadataTrackWithStillImageDisplayTimeMarkerInLivePhotoAsset:v6];
  if (!v10)
  {
LABEL_9:
    retstr->size_t var0 = value;
    retstr->size_t var1 = timescale;
    retstr->var2 = flags;
    retstr->int64_t var3 = epoch;
    goto LABEL_15;
  }
  CFAllocatorRef v11 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:v10];
  id v18 = 0;
  uint64_t v12 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v6 error:&v18];
  id v13 = v18;
  if ([v12 canAddOutput:v11])
  {
    [v12 addOutput:v11];
    [v12 startReading];
    do
    {
      uint64_t v14 = (opaqueCMSampleBuffer *)[v11 copyNextSampleBuffer];
      if (!v14) {
        break;
      }
      id v15 = v14;
      if (CMSampleBufferGetNumSamples(v14))
      {
        CMSampleBufferGetOutputPresentationTimeStamp(&v19, v15);
        CMTimeValue value = v19.value;
        CMTimeFlags flags = v19.flags;
        CMTimeScale timescale = v19.timescale;
        CMTimeEpoch epoch = v19.epoch;
      }
      CFRelease(v15);
    }
    while ((flags & 1) == 0);
    [v12 cancelReading];

    goto LABEL_9;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
  }
  CMTime v16 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
  {
    LODWORD(v19.value) = 138412290;
    *(CMTimeValue *)((char *)&v19.value + 4) = (CMTimeValue)v12;
    _os_log_impl(&dword_1A9892000, v16, OS_LOG_TYPE_INFO, "Unable to add sampleOutput to reader: %@", (uint8_t *)&v19, 0xCu);
  }
  *(_OWORD *)&retstr->size_t var0 = *v7;
  retstr->int64_t var3 = epoch;

LABEL_15:
  return result;
}

+ (BOOL)isAssetUnsupportedCorruptPortraitVideo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v18 = 0;
  uint64_t v5 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v4 error:&v18];
  id v17 = 0;
  id v6 = v18;
  uint64_t v7 = +[NUVideoUtilities auxiliaryTrackInAsset:v4 ofType:2 error:&v17];
  id v8 = v17;

  uint64_t v9 = +[NUVideoUtilities metadataTrackWithPortraitVideoDataInAsset:v4];
  CFArrayRef v10 = (void *)v9;
  if (v5) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v9 == 0) {
    goto LABEL_10;
  }
  if (([a1 track:v7 hasSamplesForEachSampleInTrack:v5] & 1) == 0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    uint64_t v14 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)CMSampleTimingInfo buf = 138412290;
    id v20 = v4;
    id v15 = "Detected corrupt cinematic asset with mismatched disparity track. Effect will not be applied. %@";
    goto LABEL_21;
  }
  if (([a1 track:v10 hasSamplesForEachSampleInTrack:v5] & 1) == 0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    uint64_t v14 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)CMSampleTimingInfo buf = 138412290;
    id v20 = v4;
    id v15 = "Detected corrupt cinematic asset with mismatched metadata track. Effect will not be applied. %@";
LABEL_21:
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_18:
    BOOL v13 = 1;
    goto LABEL_19;
  }
LABEL_10:
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

+ (BOOL)track:(id)a3 hasSamplesForEachSampleInTrack:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v15 = NUAssertLogger_13336();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CMTime v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "track");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v18 = NUAssertLogger_13336();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        BOOL v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        char v33 = [v32 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v29;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities track:hasSamplesForEachSampleInTrack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 952, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"track");
  }
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v22 = NUAssertLogger_13336();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "referenceTrack");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v25 = NUAssertLogger_13336();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v38;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities track:hasSamplesForEachSampleInTrack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 953, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"referenceTrack");
  }
  memset(&buf, 0, sizeof(buf));
  [v5 timeRange];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  [v7 timeRange];
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  [v7 minFrameDuration];
  memset(&range, 0, sizeof(range));
  memset(&otherRange, 0, sizeof(otherRange));
  CMTimeRangeGetUnion(&range2, &range, &otherRange);
  CMTimeRange range = buf;
  if (CMTimeRangeEqual(&range, &range2))
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v8 = [v5 segments];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v47 + 1) + 8 * i) isEmpty])
          {
            BOOL v13 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v60 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_15:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)assetWriterAudioSettingsForAudioTrackFormatDescription:(opaqueCMFormatDescription *)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a3);
  if (StreamBasicDescription)
  {
    id v4 = StreamBasicDescription;
    uint64_t v5 = *MEMORY[0x1E4F151E0];
    v14[0] = &unk_1F0049FF8;
    uint64_t v6 = *MEMORY[0x1E4F15270];
    v13[0] = v5;
    v13[1] = v6;
    uint64_t v7 = [NSNumber numberWithDouble:StreamBasicDescription->mSampleRate];
    v14[1] = v7;
    v13[2] = *MEMORY[0x1E4F15228];
    id v8 = [NSNumber numberWithUnsignedInt:v4->mChannelsPerFrame];
    v14[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    uint64_t v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1A9892000, v10, OS_LOG_TYPE_INFO, "AudioStreamBasicDescription missing", v12, 2u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)assetWriterAudioSettingsForTrackWithSampleRate:(double)a3 isAmbisonic:(BOOL)a4
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v17 = xmmword_1A9A74394;
    long long v18 = *(_OWORD *)&qword_1A9A743A4;
    v21[0] = *MEMORY[0x1E4F151E0];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1634754915, 4028628997, 0, 0, unk_1A9A743AC);
    v22[0] = v5;
    v21[1] = *MEMORY[0x1E4F15270];
    uint64_t v6 = [NSNumber numberWithDouble:a3];
    uint64_t v7 = *MEMORY[0x1E4F151C0];
    v22[1] = v6;
    _OWORD v22[2] = &unk_1F0049FC8;
    uint64_t v8 = *MEMORY[0x1E4F15228];
    v21[2] = v7;
    _OWORD v21[3] = v8;
    v22[3] = &unk_1F0049F80;
    v21[4] = *MEMORY[0x1E4F15198];
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v17 length:32];
    v22[4] = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = v22;
    uint64_t v12 = v21;
  }
  else
  {
    long long v17 = xmmword_1A9A743B4;
    long long v18 = *(_OWORD *)&qword_1A9A743C4;
    v19[0] = *MEMORY[0x1E4F151E0];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1633772320, 6619138, 0, 0, unk_1A9A743CC);
    v20[0] = v5;
    v19[1] = *MEMORY[0x1E4F15270];
    uint64_t v6 = [NSNumber numberWithDouble:a3];
    uint64_t v13 = *MEMORY[0x1E4F151C0];
    v20[1] = v6;
    v20[2] = &unk_1F0049FE0;
    uint64_t v14 = *MEMORY[0x1E4F15228];
    v19[2] = v13;
    v19[3] = v14;
    v20[3] = &unk_1F0049FB0;
    v19[4] = *MEMORY[0x1E4F15198];
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v17 length:32];
    void v20[4] = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = v20;
    uint64_t v12 = v19;
  }
  id v15 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:5];

  return v15;
}

+ (id)assetReaderAudioSettingsForTrackType:(BOOL)a3
{
  void v21[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v16 = xmmword_1A9A74394;
    long long v17 = *(_OWORD *)&qword_1A9A743A4;
    v21[0] = &unk_1F0049F80;
    uint64_t v3 = *MEMORY[0x1E4F15198];
    v20[0] = *MEMORY[0x1E4F15228];
    v20[1] = v3;
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v16 length:32];
    v21[1] = v4;
    v20[2] = *MEMORY[0x1E4F151E0];
    uint64_t v5 = [NSNumber numberWithUnsignedInt:1819304813];
    uint64_t v6 = *MEMORY[0x1E4F151F0];
    v21[2] = v5;
    _OWORD v21[3] = &unk_1F0049F98;
    uint64_t v7 = *MEMORY[0x1E4F15208];
    v20[3] = v6;
    void v20[4] = v7;
    v21[4] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = v21;
    uint64_t v10 = v20;
  }
  else
  {
    long long v16 = xmmword_1A9A743B4;
    long long v17 = *(_OWORD *)&qword_1A9A743C4;
    v19[0] = &unk_1F0049FB0;
    uint64_t v11 = *MEMORY[0x1E4F15198];
    v18[0] = *MEMORY[0x1E4F15228];
    v18[1] = v11;
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v16 length:32];
    v19[1] = v4;
    v18[2] = *MEMORY[0x1E4F151E0];
    uint64_t v5 = [NSNumber numberWithUnsignedInt:1819304813];
    uint64_t v12 = *MEMORY[0x1E4F151F0];
    v19[2] = v5;
    v19[3] = &unk_1F0049F98;
    uint64_t v13 = *MEMORY[0x1E4F15208];
    v18[3] = v12;
    v18[4] = v13;
    v19[4] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = v19;
    uint64_t v10 = v18;
  }
  uint64_t v14 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:5];

  return v14;
}

+ (id)cinematicAudioTrackInAsset:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:a3];
  id v4 = PFFilter();

  uint64_t v5 = [v4 firstObject];

  return v5;
}

uint64_t __47__NUVideoUtilities_cinematicAudioTrackInAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) audioTrackIsCinematicAudio:a2];
}

+ (BOOL)audioTrackIsCinematicAudio:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(a3, "formatDescriptions", 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (FigAudioFormatDescriptionGetCinematicAudioEffectEligibility())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)assetIsCinematicAudio:(id)a3
{
  uint64_t v3 = [a1 cinematicAudioTrackInAsset:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)metadataTrackWithCinematicAudioDataInAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15BE0], a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([a1 metadataTrackContainsCinematicAudioData:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)metadataTrackContainsLegacyCinematicAudioData:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifiers:&unk_1F004A670];
}

+ (BOOL)metadataTrackContainsCinematicAudioData:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifier:kCinematicAudioMetadataIdentifier];
}

+ (id)getCinematicAudioParametersFromAudioMix:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 inputParameters];

  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    int v27 = 0;
    long long v25 = *MEMORY[0x1E4F1FA48];
    long long v23 = v25;
    uint64_t v26 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v8 = v26;
    [v7 getDialogMixBiasRampForTime:&v25 startValue:&v27 endValue:0 timeRange:0];
    LODWORD(v9) = v27;
    id v10 = [NSNumber numberWithFloat:v9];
    [v5 setObject:v10 forKeyedSubscript:@"dialogMix"];

    float v24 = 0.0;
    long long v25 = v23;
    uint64_t v26 = v8;
    [v7 getRenderingStyleRampForTime:&v25 startValue:&v24 endValue:0 timeRange:0];
    *(float *)&double v11 = v24;
    long long v12 = [NSNumber numberWithFloat:v11];
    [v5 setObject:v12 forKeyedSubscript:@"renderingStyle"];

    long long v13 = @"studio";
    *(float *)&double v14 = v24;
    LODWORD(v15) = 1.0;
    long long v16 = @"camera";
    uint64_t v17 = @"unknown";
    LODWORD(v18) = 2.0;
    if (v24 == 7.0) {
      uint64_t v17 = @"original";
    }
    if (v24 != 2.0) {
      long long v16 = v17;
    }
    if (v24 != 1.0) {
      long long v13 = v16;
    }
    if (v24 == 0.0) {
      BOOL v19 = @"voice";
    }
    else {
      BOOL v19 = v13;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, @"renderingStyleString", v14, v15, v18);
    id v20 = [v7 effects];
    uint64_t v21 = [v20 firstObject];

    [v5 setObject:v21 forKeyedSubscript:@"effect"];
  }

  return v5;
}

+ (id)metadataTrackWithIdenfifier:(id)a3 forAsset:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15BE0], a4, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([a1 metadataTrack:v12 containsIdentifier:v6])
        {
          id v13 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)isAssetUnsupportedLegacyPortraitVideo:(id)a3
{
  id v4 = a3;
  id v5 = [a1 metadataTrackWithPortraitVideoDataInAsset:v4];
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v22 = 0;
  uint64_t v6 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v4 error:&v22];
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = (void *)v6;
  memset(&v21, 0, sizeof(v21));
  [v5 minFrameDuration];
  if ((unsigned __int128)0 >> 96)
  {
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime duration = v21;
    CMTimeRangeMake(&v20, &start, &duration);
    CMTimeRange v17 = v20;
    [v7 setTimeRange:&v17];
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v5 outputSettings:0];
  if (([v7 canAddOutput:v8] & 1) == 0)
  {

LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  [v7 addOutput:v8];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F16390]) initWithAssetReaderTrackOutput:v8];
  if ([v7 startReading])
  {
    uint64_t v10 = [v9 nextTimedMetadataGroup];
    [v7 cancelReading];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      long long v12 = (void *)MEMORY[0x1E4F16558];
      id v13 = [v10 items];
      double v14 = [v12 metadataItemsFromArray:v13 filteredByIdentifier:@"mdta/com.apple.quicktime.formatInfo-dictionary"];

      BOOL v15 = [v14 count] != 0;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
    BOOL v15 = 1;
  }

  if (!v15) {
    goto LABEL_14;
  }
LABEL_15:

  return v11;
}

+ (id)metadataTrackWithPortraitVideoDataInAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15BE0], a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([a1 metadataTrackContainsPortraitVideoData:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)metadataTrackContainsPortraitVideoData:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifiers:&unk_1F004A658];
}

+ (id)metadataTrackWithStillImageDimensionsInLivePhotoAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15BE0], a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([a1 isMetadataTrackWithStillImageDimensionsInLivePhoto:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)metadataTrackWithStillImageTransformInLivePhotoAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15BE0], a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([a1 isMetadataTrackWithStillImageTransformInLivePhoto:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)metadataTrackWithStillImageDisplayTimeMarkerInLivePhotoAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15BE0], a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([a1 isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)videoTrackContainsDolbyVisionMetadata:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 mediaType];
  int v5 = [v4 isEqual:*MEMORY[0x1E4F15C18]];

  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [v3 formatDescriptions];
    uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v19 = v3;
      uint64_t v8 = *(void *)v22;
      uint64_t v9 = *MEMORY[0x1E4F24BC8];
      uint64_t v10 = *MEMORY[0x1E4F24BD8];
      uint64_t v11 = *MEMORY[0x1E4F1EE20];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v13 = CMFormatDescriptionGetExtensions(*(CMFormatDescriptionRef *)(*((void *)&v21 + 1) + 8 * i));
          long long v14 = [v13 objectForKeyedSubscript:v9];
          if ([v14 isEqualToString:v10])
          {
            long long v15 = [v13 objectForKeyedSubscript:v11];
            if (v15)
            {
              long long v16 = v15;
              uint64_t v17 = [v15 objectForKeyedSubscript:@"dvvC"];

              if (v17)
              {

                LOBYTE(v5) = 1;
                goto LABEL_14;
              }
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      LOBYTE(v5) = 0;
LABEL_14:
      id v3 = v19;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (BOOL)isMetadataTrackWithLivePhotoInfo:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifier:*MEMORY[0x1E4F52790]];
}

+ (BOOL)isMetadataTrackWithStillImageDimensionsInLivePhoto:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifier:@"mdta/com.apple.quicktime.live-photo-still-image-transform-reference-dimensions"];
}

+ (BOOL)isMetadataTrackWithStillImageTransformInLivePhoto:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifier:*MEMORY[0x1E4F1F150]];
}

+ (BOOL)isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:(id)a3
{
  return [a1 metadataTrack:a3 containsIdentifier:*MEMORY[0x1E4F218A0]];
}

+ (BOOL)metadataTrack:(id)a3 containsIdentifiers:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 formatDescriptions];
  uint64_t v7 = (const opaqueCMFormatDescription *)[v6 firstObject];

  if (v7)
  {
    uint64_t v8 = CMMetadataFormatDescriptionGetIdentifiers(v7);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (!objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_12:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)metadataTrack:(id)a3 containsIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 formatDescriptions];
  uint64_t v7 = (const opaqueCMFormatDescription *)[v6 firstObject];

  BOOL v10 = 0;
  if (v7)
  {
    uint64_t v8 = CMMetadataFormatDescriptionGetIdentifiers(v7);
    char v9 = [v8 containsObject:v5];

    if (v9) {
      BOOL v10 = 1;
    }
  }

  return v10;
}

+ (void)readNextSampleBuffer:(id)a3 output:(id)a4 block:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v7 = a4;
  id v8 = a5;
  if (!v49)
  {
    long long v17 = NUAssertLogger_13336();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "reader != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      BOOL v51 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CMTimeRange v20 = NUAssertLogger_13336();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        id v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        BOOL v51 = v31;
        __int16 v52 = 2114;
        char v53 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      long long v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      BOOL v51 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextSampleBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 566, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"reader != nil");
  }
  if (!v8)
  {
    long long v24 = NUAssertLogger_13336();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      BOOL v51 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int v27 = NUAssertLogger_13336();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        id v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        BOOL v51 = v40;
        __int16 v52 = 2114;
        char v53 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      BOOL v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      BOOL v51 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextSampleBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 567, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"block != nil");
  }
  uint64_t v9 = [v7 copyNextSampleBuffer];
  if (v9)
  {
    BOOL v10 = (const void *)v9;
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, v9, 0, 0);
    CFRelease(v10);
    goto LABEL_15;
  }
  uint64_t v11 = [v49 status];
  if (v11 != 2)
  {
    if (v11 == 4)
    {
      BOOL v14 = @"Asset reader was canceled";
      uint64_t v15 = 10;
    }
    else
    {
      if (v11 == 3)
      {
        uint64_t v12 = [v49 error];
        long long v13 = +[NUError errorWithCode:1 reason:@"Failed to read next sample buffer from asset reader" object:v49 underlyingError:v12];

LABEL_13:
        uint64_t v16 = 0;
        goto LABEL_14;
      }
      BOOL v14 = @"Unknown error reading from asset reader";
      uint64_t v15 = 7;
    }
    long long v13 = +[NUError errorWithCode:v15 reason:v14 object:v49];
    goto LABEL_13;
  }
  long long v13 = 0;
  uint64_t v16 = 1;
LABEL_14:
  (*((void (**)(id, void, void *, uint64_t))v8 + 2))(v8, 0, v13, v16);

LABEL_15:
}

+ (void)readNextPixelBuffer:(id)a3 output:(id)a4 block:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v12 = NUAssertLogger_13336();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "reader != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v63 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_13336();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        uint64_t v63 = v33;
        __int16 v64 = 2114;
        uint64_t v65 = v37;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      long long v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v63 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextPixelBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 548, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"reader != nil");
  }
  if (!v9)
  {
    long long v19 = NUAssertLogger_13336();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CMTimeRange v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "output != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v63 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v22 = NUAssertLogger_13336();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        id v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        uint64_t v45 = [v43 callStackSymbols];
        uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        uint64_t v63 = v42;
        __int16 v64 = 2114;
        uint64_t v65 = v46;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      long long v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v63 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextPixelBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 549, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"output != nil");
  }
  if (!v10)
  {
    uint64_t v26 = NUAssertLogger_13336();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v63 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v29 = NUAssertLogger_13336();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        BOOL v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        uint64_t v54 = [v52 callStackSymbols];
        uint64_t v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        uint64_t v63 = v51;
        __int16 v64 = 2114;
        uint64_t v65 = v55;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      id v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v63 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextPixelBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 550, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"block != nil");
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __53__NUVideoUtilities_readNextPixelBuffer_output_block___block_invoke;
  v60[3] = &unk_1E5D94A98;
  id v61 = v10;
  id v11 = v10;
  [a1 readNextSampleBuffer:v8 output:v9 block:v60];
}

void __53__NUVideoUtilities_readNextPixelBuffer_output_block___block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v8 = v5;
    if (CMSampleBufferGetImageBuffer(a2))
    {
      id v6 = v8;
    }
    else
    {
      uint64_t v7 = +[NUError missingError:@"unable to get imageBuffer from sampleBuffer" object:a2];

      id v6 = (id)v7;
    }
  }
  id v9 = v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (unint64_t)nominalFrameRateRoundedToNearestTraditionalFrameRate:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [&unk_1F004A640 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4) {
    return 60;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v14;
  unint64_t v7 = 60;
  float v8 = 3.4028e38;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(&unk_1F004A640);
      }
      unsigned int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntValue];
      float v11 = vabds_f32((float)v10, a3);
      if (v11 < v8)
      {
        float v8 = v11;
        unint64_t v7 = v10;
      }
    }
    uint64_t v5 = [&unk_1F004A640 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v5);
  return v7;
}

+ (float)nominalFrameRateForAsset:(id)a3 error:(id *)a4
{
  uint64_t v4 = [a1 firstEnabledVideoTrackInAsset:a3 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 nominalFrameRate];
    float v7 = v6;
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAssetTrack:(SEL)a3
{
  id v5 = a4;
  *(void *)&retstr->size_t var1 = 0;
  retstr->int64_t var3 = 0;
  retstr->size_t var0 = 0;
  CMTimeMake((CMTime *)retstr, 1, 60);
  memset(&v11, 0, sizeof(v11));
  CMTimeMake(&v11, 1, 240);
  long long v9 = 0uLL;
  int64_t v10 = 0;
  if (v5)
  {
    [v5 minFrameDuration];
    if (BYTE12(v9))
    {
      *(_OWORD *)&retstr->size_t var0 = v9;
      retstr->int64_t var3 = v10;
    }
  }
  CMTime time1 = (CMTime)*retstr;
  CMTime v7 = v11;
  if (CMTimeCompare(&time1, &v7) < 0) {
    *(CMTime *)retstr = v11;
  }

  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAsset:(SEL)a3 videoComposition:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    long long v15 = NUAssertLogger_13336();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v18 = NUAssertLogger_13336();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        long long v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        long long v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      CMTimeRange v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities minimumFrameDurationForAsset:videoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 471, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"asset != nil");
  }
  int64_t v10 = v9;
  uint64_t v11 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->size_t var0 = *MEMORY[0x1E4F1F9F8];
  retstr->int64_t var3 = *(void *)(v11 + 16);
  if (!v9)
  {
    [a2 minimumFrameDurationForAsset:v8];
LABEL_7:
    *(_OWORD *)&retstr->size_t var0 = *(_OWORD *)buf;
    retstr->int64_t var3 = *(void *)&buf[16];
    goto LABEL_8;
  }
  uint64_t v12 = [v9 sourceTrackIDForFrameTiming];
  if (!v12)
  {
    [v10 frameDuration];
    goto LABEL_7;
  }
  long long v13 = [MEMORY[0x1E4F8CC38] trackWithTrackID:v12 forAsset:v8];
  [a2 minimumFrameDurationForAssetTrack:v13];
  *(_OWORD *)&retstr->size_t var0 = *(_OWORD *)buf;
  retstr->int64_t var3 = *(void *)&buf[16];

LABEL_8:
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAsset:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v11 = 0;
  CMTime v7 = [a2 firstEnabledVideoTrackInAsset:v6 error:&v11];
  id v8 = v11;
  if (v7)
  {
    [a2 minimumFrameDurationForAssetTrack:v7];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    id v9 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Failed to get video track in asset: %@, error: %@", buf, 0x16u);
    }
    CMTimeMake((CMTime *)retstr, 1, 60);
  }

  return result;
}

+ (id)auxiliaryTrackInAsset:(id)a3 ofType:(int64_t)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a5)
  {
    uint64_t v29 = NUAssertLogger_13336();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v58 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger_13336();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        uint64_t v39 = [v37 callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        uint64_t v58 = v36;
        __int16 v59 = 2114;
        BOOL v60 = v40;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v58 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities auxiliaryTrackInAsset:ofType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 418, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  id v8 = v7;
  id v9 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BB8] forAsset:v7];
  if ([v9 count])
  {
    int64_t v10 = NUMediaCharacteristicForAuxiliaryImageType(a4);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (!v10
            || [*(id *)(*((void *)&v49 + 1) + 8 * i) hasMediaCharacteristic:v10])
          {
            id v17 = v16;
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
        id v17 = 0;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_16:

    if (a4 == 2 && !v17)
    {
      id v17 = [v11 firstObject];
      v55[0] = NUMediaCharacteristicPortraitEffectsMatte;
      v55[1] = NUMediaCharacteristicSkinMatte;
      v55[2] = NUMediaCharacteristicSkyMatte;
      BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
      v54[0] = NUMediaCharacteristicStyleDelta;
      v54[1] = NUMediaCharacteristicOriginalStyleLinear;
      CMTimeRange v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
      BOOL v21 = [v19 arrayByAddingObjectsFromArray:v20];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v46;
        while (2)
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v22);
            }
            if ([v17 hasMediaCharacteristic:*(void *)(*((void *)&v45 + 1) + 8 * j)])
            {

              uint64_t v18 = 0;
              goto LABEL_33;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
      }
      uint64_t v27 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1A9892000, v27, OS_LOG_TYPE_INFO, "Could not find disparity track with expected media characteristic, using the first auxiliary track instead", buf, 2u);
      }
    }
    id v17 = v17;
    uint64_t v18 = v17;
LABEL_33:
  }
  else
  {
    +[NUError missingError:@"no auxiliary tracks" object:v8];
    uint64_t v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)firstEnabledVideoTrackInAsset:(id)a3 error:(id *)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    long long v49 = NUAssertLogger_13336();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      long long v50 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v71 = (uint64_t)v50;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v52 = NUAssertLogger_13336();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v53)
      {
        uint64_t v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        __int16 v59 = [v57 callStackSymbols];
        BOOL v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTimeRange buf = 138543618;
        uint64_t v71 = (uint64_t)v56;
        __int16 v72 = 2114;
        uint64_t v73 = v60;
        _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v53)
    {
      uint64_t v54 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v71 = (uint64_t)v55;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities firstEnabledVideoTrackInAsset:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 386, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)"error != nil");
  }
  id v6 = v5;
  [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v5];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v12 isEnabled])
        {
          id v22 = v12;

          goto LABEL_28;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
  }
  uint64_t v13 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CMTimeRange buf = 138543362;
    uint64_t v71 = (uint64_t)v6;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "No enabled video tracks in asset %{public}@", buf, 0xCu);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
  }
  uint64_t v14 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = v14;
    uint64_t v25 = [v6 tracks];
    uint64_t v26 = [v25 count];
    *(_DWORD *)CMTimeRange buf = 134217984;
    uint64_t v71 = v26;
    _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Asset track count: %ld", buf, 0xCu);

    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
  }
  id v15 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = v15;
    uint64_t v28 = [v6 tracks];
    uint64_t v29 = [v28 firstObject];
    uint64_t v30 = [v29 segments];
    uint64_t v31 = [v30 count];
    *(_DWORD *)CMTimeRange buf = 134217984;
    uint64_t v71 = v31;
    _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Asset track edit count: %ld", buf, 0xCu);

    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
  }
  uint64_t v16 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = v16;
    BOOL v33 = [v6 tracks];
    *(_DWORD *)CMTimeRange buf = 138543362;
    uint64_t v71 = (uint64_t)v33;
    _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Asset tracks: %{public}@", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    id v17 = [v6 URL];
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
    }
    uint64_t v18 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v71 = (uint64_t)v17;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Asset URL: %{public}@", buf, 0xCu);
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
      }
    }
    BOOL v19 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = (void *)MEMORY[0x1E4F28CB8];
      id v35 = v19;
      uint64_t v36 = [v34 defaultManager];
      uint64_t v37 = [v17 path];
      int v38 = [v36 fileExistsAtPath:v37];
      *(_DWORD *)CMTimeRange buf = 67109120;
      LODWORD(v71) = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Asset file exists: %d", buf, 8u);

      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
      }
    }
    CMTimeRange v20 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = (void *)MEMORY[0x1E4F28CB8];
      uint64_t v40 = v20;
      uint64_t v41 = [v39 defaultManager];
      uint64_t v42 = [v17 path];
      int v43 = [v41 isReadableFileAtPath:v42];
      *(_DWORD *)CMTimeRange buf = 67109120;
      LODWORD(v71) = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Asset file readable: %d", buf, 8u);

      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
      }
    }
    BOOL v21 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = (void *)MEMORY[0x1E4F28CB8];
      long long v45 = v21;
      long long v46 = [v44 defaultManager];
      long long v47 = [v17 path];
      long long v48 = [v46 attributesOfItemAtPath:v47 error:0];
      *(_DWORD *)CMTimeRange buf = 138543362;
      uint64_t v71 = (uint64_t)v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Asset file attributes: %{public}@", buf, 0xCu);
    }
  }
  +[NUError missingError:@"no enabled video tracks" object:v6];
  id v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v22;
}

+ (id)bestOutputSettingsPresetForTargetVideoSize:(id)a3 codec:(unsigned int)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = [MEMORY[0x1E4F165F0] availableOutputSettingsPresets];
  uint64_t v8 = v7;
  uint64_t v9 = var0 * var1;
  if (a4 == 1752589105 && v9 > 4147200)
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4F15FA8];
    if ([v7 containsObject:*MEMORY[0x1E4F15FA8]]) {
      goto LABEL_19;
    }
  }
  else if (a4 != 1752589105)
  {
    goto LABEL_7;
  }
  uint64_t v10 = (void *)*MEMORY[0x1E4F15FA0];
  if ([v8 containsObject:*MEMORY[0x1E4F15FA0]]) {
    goto LABEL_19;
  }
LABEL_7:
  if (v9 > 4147200)
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4F15F88];
    if ([v8 containsObject:*MEMORY[0x1E4F15F88]]) {
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  if (v9 > 1382400)
  {
LABEL_11:
    uint64_t v10 = (void *)*MEMORY[0x1E4F15F80];
    if ([v8 containsObject:*MEMORY[0x1E4F15F80]]) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (v9 < 691201)
  {
    if (v9 < 460801)
    {
LABEL_18:
      uint64_t v10 = (void *)*MEMORY[0x1E4F15F90];
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v10 = (void *)*MEMORY[0x1E4F15F78];
  if ([v8 containsObject:*MEMORY[0x1E4F15F78]]) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v10 = (void *)*MEMORY[0x1E4F15F98];
  if (([v8 containsObject:*MEMORY[0x1E4F15F98]] & 1) == 0) {
    goto LABEL_18;
  }
LABEL_19:
  id v11 = v10;

  return v11;
}

+ (BOOL)isAVAssetDolbyProfile5:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(id)objc_opt_class() firstEnabledVideoTrackInAsset:v5 error:a4];
  id v7 = v6;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    uint64_t v8 = objc_msgSend(v6, "formatDescriptions", 0, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 |= CMVideoFormatDescriptionGetVideoDynamicRange() == 5;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

+ (BOOL)isAVAssetHDR:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() firstEnabledVideoTrackInAsset:v5 error:a4];

  id v7 = [v6 formatDescriptions];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v8, (CFStringRef)*MEMORY[0x1E4F24BC8]);
  if ([v9 isEqualToString:*MEMORY[0x1E4F162F8]]) {
    char v10 = 1;
  }
  else {
    char v10 = [v9 isEqualToString:*MEMORY[0x1E4F162E8]];
  }

  return v10;
}

+ (id)defaultOutputColorSpaceForComposition:(id)a3
{
  return 0;
}

+ (id)defaultExportCodecForHDRVideo:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [MEMORY[0x1E4F8CC30] currentDeviceHEVCCapabilities];
  id v5 = (void **)MEMORY[0x1E4F16230];
  if (v3 || (v4 & 2) == 0)
  {
    int v6 = v3 & ((v4 & 8) >> 3);
    if (!v6) {
      id v5 = (void **)MEMORY[0x1E4F16228];
    }
    if ((v6 & 1) == 0 && v3)
    {
      if ((v4 & 4) != 0)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
        }
        id v7 = _NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_WORD *)CMTimeRange buf = 0;
        uint64_t v8 = "Asked to export an HDR composition, but HW encoders are instance-limited. We may use the software encoder";
        uint64_t v9 = buf;
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_586_13464);
        }
        id v7 = _NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        __int16 v12 = 0;
        uint64_t v8 = "Asked to export an HDR composition, but no HW encoder is available. We WILL use the software encoder";
        uint64_t v9 = (uint8_t *)&v12;
      }
      _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
LABEL_17:
      id v5 = (void **)MEMORY[0x1E4F16230];
    }
  }
  char v10 = *v5;

  return v10;
}

+ (id)originalCodecOfVideoTrack:(id)a3
{
  BOOL v3 = [a3 formatDescriptions];
  char v4 = [v3 firstObject];

  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v4);

  return NUStringForTypeCode(MediaSubType);
}

+ (BOOL)deviceSupportsHighDynamicRangeVideo
{
  return [MEMORY[0x1E4F8CC30] currentDeviceIsEligibleForHDRPlayback];
}

+ (BOOL)deviceSupportsHardware10BitHEVCEncoding
{
  return ([MEMORY[0x1E4F8CC30] currentDeviceHEVCCapabilities] >> 2) & 1;
}

+ (BOOL)deviceSupportsHardwareHEVCEncoding
{
  return [MEMORY[0x1E4F8CE28] deviceSupportsHardwareHEVCEncoding];
}

+ (id)rgbVideoSettingsForAVAssetReader
{
  if (rgbVideoSettingsForAVAssetReader_onceToken != -1) {
    dispatch_once(&rgbVideoSettingsForAVAssetReader_onceToken, &__block_literal_global_135);
  }
  int v2 = (void *)rgbVideoSettingsForAVAssetReader_videoSettings;

  return v2;
}

void __52__NUVideoUtilities_rgbVideoSettingsForAVAssetReader__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F24D70];
  v3[0] = &unk_1F004A628;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)rgbVideoSettingsForAVAssetReader_videoSettings;
  rgbVideoSettingsForAVAssetReader_videoSettings = v0;
}

+ (id)_preferedPixelFormatsForUsage:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v5 = +[NUPixelFormat supportsUniversalCompressionFormats];
  BOOL v6 = (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL && v5;
  if ((unint64_t)(a3 - 3) >= 0xFFFFFFFFFFFFFFFELL && v5) {
    BOOL v6 = +[NUPixelFormat supportsRenderingToCompressedFormats];
  }
  if (a3 != 1)
  {
    BOOL v7 = +[NUPixelFormat supportsPacked10BitsFormats];
    if (+[NUGlobalSettings disablePacked10BitPixelFormats])
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = !v7;
    }
    if (!v8)
    {
      if (v6)
      {
        if (a3 != 2) {
          [v4 addObject:&unk_1F0049D70];
        }
        [v4 addObject:&unk_1F0049D88];
      }
      if (a3 != 2) {
        [v4 addObject:&unk_1F0049DA0];
      }
      [v4 addObject:&unk_1F0049DB8];
    }
    if (a3 == 2)
    {
      uint64_t v9 = &unk_1F0049DE8;
LABEL_26:
      [v4 addObject:v9];
      goto LABEL_27;
    }
    [v4 addObject:&unk_1F0049DD0];
    [v4 addObject:&unk_1F0049DE8];
  }
  if (v6)
  {
    [v4 addObject:&unk_1F0049E00];
    [v4 addObject:&unk_1F0049E18];
  }
  [v4 addObject:&unk_1F0049E30];
  [v4 addObject:&unk_1F0049E48];
  if (!a3)
  {
    [v4 addObject:&unk_1F0049E60];
    [v4 addObject:&unk_1F0049E78];
    uint64_t v9 = &unk_1F0049E90;
    goto LABEL_26;
  }
LABEL_27:

  return v4;
}

+ (NSArray)preferedDestinationPixelFormatsForHDR
{
  return (NSArray *)[a1 _preferedPixelFormatsForUsage:2];
}

+ (NSArray)preferedDestinationPixelFormats
{
  return (NSArray *)[a1 _preferedPixelFormatsForUsage:1];
}

+ (NSArray)preferredSourcePixelFormats
{
  return (NSArray *)[a1 _preferedPixelFormatsForUsage:0];
}

+ (id)defaultVideoSettingsForAVAssetReader
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 _preferedPixelFormatsForUsage:0];
  uint64_t v5 = *MEMORY[0x1E4F24D70];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end