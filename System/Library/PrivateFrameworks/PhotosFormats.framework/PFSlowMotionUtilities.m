@interface PFSlowMotionUtilities
+ ($9E16F6706E08E1DCF37CEDFAE5F41851)_timeRangeFromTime:(SEL)a3 toTime:(float)a4;
+ ($9E16F6706E08E1DCF37CEDFAE5F41851)adjustTimeRange:(SEL)a3 forNewStartTime:(id *)a4 endTime:(id *)a5;
+ (BOOL)_isValidSlowMotionRate:(float)a3;
+ (BOOL)_isValidSlowMotionTimeRange:(id *)a3;
+ (BOOL)_scaleComposition:(id)a3 baseDuration:(double)a4 slowMotionRate:(float)a5 slowMotionRegions:(id)a6 forExport:(BOOL)a7 outTimeRangeMapper:(id *)a8;
+ (NSArray)slowMotionSourceAssetPropertyKeys;
+ (double)_scaleWithinComposition:(id)a3 fromCursor:(double)a4 timeStep:(double)a5 rate:(float)a6 timeRangeMapper:(id)a7;
+ (id)_scaledCompositionForAsset:(id)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6 outTimeRangeMapper:(id *)a7;
+ (id)_setVolume:(float)a3 forSlowMotionRegionsInTrack:(id)a4 timeRangeMapper:(id)a5;
+ (id)_slowMotionRegionsFromSlowMotionTimeRange:(id *)a3;
+ (id)assetFromVideoAsset:(id)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6 outAudioMix:(id *)a7 outTimeRangeMapper:(id *)a8;
+ (id)audioMixForScaledComposition:(id)a3 timeRangeMapper:(id)a4;
+ (id)exportPresetForAsset:(id)a3 preferredPreset:(id)a4;
+ (id)sharedConfiguration;
+ (id)timeRangeMapperForSourceDuration:(double)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6;
+ (int)preferredTimeScale;
+ (void)configureExportSession:(id)a3 forcePreciseConversion:(BOOL)a4;
@end

@implementation PFSlowMotionUtilities

+ ($9E16F6706E08E1DCF37CEDFAE5F41851)adjustTimeRange:(SEL)a3 forNewStartTime:(id *)a4 endTime:(id *)a5
{
  memset(&v17, 0, sizeof(v17));
  CMTimeMake(&v17, 0, 600);
  memset(&v16, 0, sizeof(v16));
  lhs.start = (CMTime)*a6;
  rhs.start = (CMTime)*a5;
  CMTimeSubtract(&v16, &lhs.start, &rhs.start);
  memset(&lhs, 0, sizeof(lhs));
  rhs.start = v17;
  v12.start = v16;
  CMTimeRangeFromTimeToTime(&lhs, &rhs.start, &v12.start);
  memset(&v14, 0, sizeof(v14));
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&a4->var0.var0;
  rhs.start.epoch = a4->var0.var3;
  v12.start = (CMTime)*a5;
  CMTimeSubtract(&v14, &rhs.start, &v12.start);
  a4->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v14;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  CMTimeRange rhs = lhs;
  long long v10 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&v12.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v12.start.epoch = v10;
  *(_OWORD *)&v12.duration.timescale = *(_OWORD *)&a4->var1.var1;
  return ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeGetIntersection((CMTimeRange *)retstr, &rhs, &v12);
}

+ (id)audioMixForScaledComposition:(id)a3 timeRangeMapper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedConfiguration];
  [v8 volumeDuringSlowMotion];
  float v10 = v9;

  v11 = 0;
  if (v7 && v10 != 1.0)
  {
    v11 = [MEMORY[0x1E4F16580] audioMix];
    CMTimeRange v12 = [MEMORY[0x1E4F1CA48] array];
    v13 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:v6];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __70__PFSlowMotionUtilities_audioMixForScaledComposition_timeRangeMapper___block_invoke;
    v20 = &unk_1E5B2E580;
    id v23 = a1;
    float v24 = v10;
    id v21 = v7;
    id v22 = v12;
    id v14 = v12;
    [v13 enumerateObjectsUsingBlock:&v17];
    objc_msgSend(v11, "setInputParameters:", v14, v17, v18, v19, v20);
  }
  v15 = (void *)[v11 copy];

  return v15;
}

void __70__PFSlowMotionUtilities_audioMixForScaledComposition_timeRangeMapper___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 56);
  id v4 = [*(id *)(a1 + 48) _setVolume:a2 forSlowMotionRegionsInTrack:*(void *)(a1 + 32) timeRangeMapper:a3];
  [*(id *)(a1 + 40) addObject:v4];
}

+ ($9E16F6706E08E1DCF37CEDFAE5F41851)_timeRangeFromTime:(SEL)a3 toTime:(float)a4
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  CMTimeMakeWithSeconds(&start, a4, 600);
  CMTimeMakeWithSeconds(&v8, a5, 600);
  return ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v8);
}

+ (id)_setVolume:(float)a3 forSlowMotionRegionsInTrack:(id)a4 timeRangeMapper:(id)a5
{
  CMTime v8 = (void *)MEMORY[0x1E4F16588];
  id v9 = a5;
  float v10 = [v8 audioMixInputParametersWithTrack:a4];
  v11 = [a1 sharedConfiguration];
  CMTimeRange v12 = [v11 rampDown];
  v13 = [v11 rampUp];
  id v14 = [a1 sharedConfiguration];
  [v14 volumeDuringRampToSlowMotion];
  int v16 = v15;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__PFSlowMotionUtilities__setVolume_forSlowMotionRegionsInTrack_timeRangeMapper___block_invoke;
  v23[3] = &unk_1E5B2E558;
  id v17 = v10;
  float v28 = a3;
  int v29 = v16;
  id v24 = v17;
  id v25 = v12;
  v26 = v13;
  id v27 = a1;
  id v18 = v13;
  id v19 = v12;
  [v9 enumerateScaledRegionsUsingBlock:v23];

  [v17 setAudioTimePitchAlgorithm:*MEMORY[0x1E4F157D0]];
  v20 = v26;
  id v21 = v17;

  return v21;
}

uint64_t __80__PFSlowMotionUtilities__setVolume_forSlowMotionRegionsInTrack_timeRangeMapper___block_invoke(uint64_t a1, double a2, double a3, float a4, float a5, float a6)
{
  float v10 = *(float *)(a1 + 64);
  if (*(float *)&a3 == a4)
  {
    v11 = *(void **)(a1 + 32);
    CMTimeMakeWithSeconds(&v64, a4, 600);
    *(float *)&double v12 = v10;
    uint64_t result = [v11 setVolume:&v64 atTime:v12];
  }
  else
  {
    float v16 = *(float *)&a3;
    if (*(float *)(a1 + 68) >= v10)
    {
      id v22 = *(void **)(a1 + 32);
      id v23 = *(void **)(a1 + 56);
      if (v23)
      {
        LODWORD(a2) = LODWORD(a3);
        *(float *)&a3 = a4;
        [v23 _timeRangeFromTime:a2 toTime:a3];
      }
      else
      {
        HIDWORD(v24) = 0;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
      }
      LODWORD(v24) = 1.0;
      v30 = &v52;
      v31 = v22;
      *(float *)&a3 = v10;
    }
    else
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v61 = 0u;
      id v17 = *(void **)(a1 + 56);
      [*(id *)(a1 + 40) volumeSuppressionIntroTime];
      if (v17)
      {
        double v20 = v16;
        double v21 = v18 + v16;
        *(float *)&double v20 = v21;
        *(float *)&double v21 = v16;
        [v17 _timeRangeFromTime:v21 toTime:v20];
      }
      else
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v61 = 0u;
      }
      id v25 = *(void **)(a1 + 32);
      LODWORD(v19) = *(_DWORD *)(a1 + 68);
      long long v58 = v61;
      long long v59 = v62;
      long long v60 = v63;
      objc_msgSend(v25, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v58, COERCE_DOUBLE(__PAIR64__(DWORD1(v63), 1.0)), v19);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v58 = 0u;
      v26 = *(void **)(a1 + 56);
      [*(id *)(a1 + 40) volumeSuppressionOutroTime];
      if (v26)
      {
        double v28 = a4;
        double v29 = a4 - v27;
        *(float *)&double v29 = v29;
        *(float *)&double v28 = a4;
        [v26 _timeRangeFromTime:v29 toTime:v28];
      }
      else
      {
        HIDWORD(v24) = 0;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v58 = 0u;
      }
      v31 = *(void **)(a1 + 32);
      LODWORD(a3) = *(_DWORD *)(a1 + 64);
      LODWORD(v24) = *(_DWORD *)(a1 + 68);
      long long v55 = v58;
      long long v56 = v59;
      long long v57 = v60;
      v30 = &v55;
    }
    uint64_t result = [v31 setVolumeRampFromStartVolume:v30 toEndVolume:v24 timeRange:a3];
  }
  if (a5 < a6)
  {
    float v32 = *(float *)(a1 + 64);
    if (*(float *)(a1 + 68) >= v32)
    {
      v39 = *(void **)(a1 + 32);
      v40 = *(void **)(a1 + 56);
      if (v40)
      {
        *(float *)&double v14 = a5;
        *(float *)&double v15 = a6;
        [v40 _timeRangeFromTime:v14 toTime:v15];
      }
      else
      {
        HIDWORD(v41) = 0;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v49 = 0u;
      }
      LODWORD(v15) = 1.0;
      v47 = &v49;
      v48 = v39;
      *(float *)&double v41 = v32;
    }
    else
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v61 = 0u;
      v33 = *(void **)(a1 + 56);
      [*(id *)(a1 + 48) volumeSuppressionOutroTime];
      if (v33)
      {
        double v36 = a5;
        double v37 = v34 + a5;
        *(float *)&double v36 = v37;
        *(float *)&double v37 = a5;
        [v33 _timeRangeFromTime:v37 toTime:v36];
      }
      else
      {
        HIDWORD(v38) = 0;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v61 = 0u;
      }
      v42 = *(void **)(a1 + 32);
      LODWORD(v38) = *(_DWORD *)(a1 + 64);
      LODWORD(v35) = *(_DWORD *)(a1 + 68);
      long long v58 = v61;
      long long v59 = v62;
      long long v60 = v63;
      [v42 setVolumeRampFromStartVolume:&v58 toEndVolume:v38 timeRange:v35];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v58 = 0u;
      v43 = *(void **)(a1 + 56);
      [*(id *)(a1 + 48) volumeSuppressionIntroTime];
      if (v43)
      {
        double v45 = a6;
        double v46 = a6 - v44;
        *(float *)&double v46 = v46;
        *(float *)&double v45 = a6;
        [v43 _timeRangeFromTime:v46 toTime:v45];
      }
      else
      {
        HIDWORD(v41) = 0;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v58 = 0u;
      }
      v48 = *(void **)(a1 + 32);
      LODWORD(v41) = *(_DWORD *)(a1 + 68);
      long long v55 = v58;
      long long v56 = v59;
      long long v57 = v60;
      double v15 = COERCE_DOUBLE(__PAIR64__(DWORD1(v60), 1.0));
      v47 = &v55;
    }
    return objc_msgSend(v48, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", v47, v41, v15, v49, v50, v51, v52, v53, v54, v55, v56, v57);
  }
  return result;
}

+ (id)exportPresetForAsset:(id)a3 preferredPreset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [v5 isEqualToString:*MEMORY[0x1E4F15758]])
  {
    id v8 = (id)*MEMORY[0x1E4F156E8];

    id v5 = v8;
  }

  return v5;
}

+ (void)configureExportSession:(id)a3 forcePreciseConversion:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[PFMediaUtilities mainVideoTrackForAsset:v6];
    long long v11 = 0uLL;
    uint64_t v12 = 0;
    [v7 nominalFrameRate];
    +[PFVideoAdjustments minFrameDurationForNominalFrameRate:](PFVideoAdjustments, "minFrameDurationForNominalFrameRate:");
    long long v9 = v11;
    uint64_t v10 = v12;
    [v5 setMinVideoFrameDuration:&v9];
    id v8 = (void *)MEMORY[0x1E4F16288];
    if (!v4) {
      id v8 = (void *)MEMORY[0x1E4F16280];
    }
    [v5 setVideoFrameRateConversionAlgorithm:*v8];
  }
}

+ (double)_scaleWithinComposition:(id)a3 fromCursor:(double)a4 timeStep:(double)a5 rate:(float)a6 timeRangeMapper:(id)a7
{
  Float64 v10 = a4 + a5;
  memset(&v23, 0, sizeof(v23));
  Float64 v11 = a5 / a6;
  id v12 = a7;
  id v13 = a3;
  CMTimeMakeWithSeconds(&start, a4, 600);
  CMTimeMakeWithSeconds(&end, v10, 600);
  CMTimeRangeFromTimeToTime(&v23, &start, &end);
  memset(&v20, 0, sizeof(v20));
  CMTimeMakeWithSeconds(&v20, v11, 600);
  CMTimeRange time = v23;
  CMTime v18 = v20;
  [v13 scaleTimeRange:&time toDuration:&v18];

  time.CMTime start = v20;
  Float64 Seconds = CMTimeGetSeconds(&time.start);
  double v15 = Seconds + a4;
  *(float *)&Float64 Seconds = a5;
  *(float *)&double v16 = v11;
  [v12 addNextRange:Seconds scaledLength:v16];

  return v15;
}

+ (BOOL)_scaleComposition:(id)a3 baseDuration:(double)a4 slowMotionRate:(float)a5 slowMotionRegions:(id)a6 forExport:(BOOL)a7 outTimeRangeMapper:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  if (a8)
  {
    double v14 = objc_alloc_init(PFSlowMotionTimeRangeMapper);
    *a8 = v14;
  }
  else
  {
    double v14 = 0;
  }
  long long v53 = [a1 sharedConfiguration];
  long long v57 = [v53 rampDown];
  long long v56 = [v53 rampUp];
  id v100 = 0;
  id v99 = 0;
  *(float *)&double v15 = a5;
  [v57 computeRampToTargetRate:v9 forExport:&v100 outTimeSteps:&v99 outIntermediateRates:v15];
  id v16 = v100;
  id v55 = v99;
  id v98 = 0;
  id v97 = 0;
  *(float *)&double v17 = a5;
  [v56 computeRampToTargetRate:v9 forExport:&v98 outTimeSteps:&v97 outIntermediateRates:v17];
  id v18 = v98;
  id v54 = v97;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = v16;
  uint64_t v19 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v94;
    double v21 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v94 != v20) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v93 + 1) + 8 * i) floatValue];
        double v21 = v21 + v23;
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
    }
    while (v19);
  }
  else
  {
    double v21 = 0.0;
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v24 = v18;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v90;
    double v27 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v90 != v26) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v89 + 1) + 8 * j) floatValue];
        double v27 = v27 + v29;
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v89 objects:v102 count:16];
    }
    while (v25);
  }
  else
  {
    double v27 = 0.0;
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v58 = v13;
  uint64_t v30 = [v58 countByEnumeratingWithState:&v85 objects:v101 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v86;
    double v62 = 0.0;
    double v32 = 0.0;
    while (1)
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v86 != v31) {
          objc_enumerationMutation(v58);
        }
        CFDictionaryRef v34 = *(const __CFDictionary **)(*((void *)&v85 + 1) + 8 * k);
        memset(&v84, 0, sizeof(v84));
        CMTimeRangeMakeFromDictionary(&v84, v34);
        time.CMTime start = v84.duration;
        double Seconds = CMTimeGetSeconds(&time.start);
        if (Seconds - v21 - v27 > 0.0)
        {
          *(_OWORD *)&time.start.value = *(_OWORD *)&v84.start.value;
          time.start.epoch = v84.start.epoch;
          double v36 = v62 + CMTimeGetSeconds(&time.start);
          uint64_t v80 = 0;
          v81 = (double *)&v80;
          HIDWORD(v37) = 1065646817;
          uint64_t v82 = 0x2020000000;
          double v83 = v36;
          double v38 = v36 - v32;
          if (v36 - v32 > 0.01)
          {
            *(float *)&double v38 = v38;
            LODWORD(v37) = LODWORD(v38);
            [(PFSlowMotionTimeRangeMapper *)v14 addNextRange:v38 scaledLength:v37];
          }
          *(_OWORD *)&time.start.value = *(_OWORD *)&v84.start.value;
          time.start.epoch = v84.start.epoch;
          double v39 = CMTimeGetSeconds(&time.start);
          CMTimeRange time = v84;
          CMTimeRangeGetEnd(&v79, &time);
          double v40 = a4 - CMTimeGetSeconds(&v79);
          if (v39 >= 0.1)
          {
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke;
            v71[3] = &unk_1E5B2E530;
            id v42 = obj;
            id v72 = v42;
            id v73 = v55;
            v76 = &v80;
            id v77 = a1;
            id v74 = v12;
            v75 = v14;
            [v42 enumerateObjectsUsingBlock:v71];

            if (v40 < 0.1) {
              goto LABEL_34;
            }
          }
          else
          {
            if (v40 >= 0.1)
            {
              double v41 = v81[3];
LABEL_42:
              objc_msgSend(a1, "_scaleWithinComposition:fromCursor:timeStep:rate:timeRangeMapper:", v12, v14);
              double v50 = v45;
              v81[3] = v45;
              if (v40 >= 0.1)
              {
                v63[0] = MEMORY[0x1E4F143A8];
                v63[1] = 3221225472;
                v63[2] = __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke_2;
                v63[3] = &unk_1E5B2E530;
                id v51 = v24;
                id v64 = v51;
                id v65 = v54;
                v68 = &v80;
                id v69 = a1;
                id v66 = v12;
                v67 = v14;
                [v51 enumerateObjectsWithOptions:2 usingBlock:v63];

                double v45 = v81[3];
              }
              *(float *)&double v46 = v36;
              *(float *)&double v47 = v41;
              *(float *)&double v48 = v50;
              *(float *)&double v49 = v45;
              *(float *)&double v45 = a5;
              [(PFSlowMotionTimeRangeMapper *)v14 markScaledRegionWithRate:v45 rampInStartTime:v46 rampInEndTime:v47 rampOutStartTime:v48 rampOutEndTime:v49];
              double v32 = v81[3];
              if (v40 >= 0.1) {
                [v56 rampTime];
              }
              double v62 = v62 + v32 - v36 - Seconds;
              _Block_object_dispose(&v80, 8);
              continue;
            }
LABEL_34:
            if (v12)
            {
              [v12 duration];
              CMTimeGetSeconds(&v70);
              double v41 = v81[3];
              double v43 = v41;
              if (v39 < 0.1) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }
            *(_OWORD *)&time.start.value = *(_OWORD *)&v84.start.value;
            time.start.epoch = v84.start.epoch;
            double v44 = a4 - CMTimeGetSeconds(&time.start);
            if (v39 < 0.1)
            {
              double v41 = v81[3];
              goto LABEL_42;
            }
            double v43 = v44 - v21;
          }
          double v41 = v81[3];
LABEL_41:
          objc_msgSend(v57, "rampTime", v43);
          goto LABEL_42;
        }
      }
      uint64_t v30 = [v58 countByEnumeratingWithState:&v85 objects:v101 count:16];
      if (!v30) {
        goto LABEL_51;
      }
    }
  }
  double v62 = 0.0;
LABEL_51:

  return v62 > 0.0;
}

uint64_t __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  [v5 floatValue];
  float v7 = v6;

  id v8 = [*(id *)(a1 + 40) objectAtIndex:a3];
  [v8 floatValue];
  int v10 = v9;

  LODWORD(v11) = v10;
  uint64_t result = [*(id *)(a1 + 72) _scaleWithinComposition:*(void *)(a1 + 48) fromCursor:*(void *)(a1 + 56) timeStep:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) rate:v7 timeRangeMapper:v11];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
  return result;
}

uint64_t __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  [v5 floatValue];
  float v7 = v6;

  id v8 = [*(id *)(a1 + 40) objectAtIndex:a3];
  [v8 floatValue];
  int v10 = v9;

  LODWORD(v11) = v10;
  uint64_t result = [*(id *)(a1 + 72) _scaleWithinComposition:*(void *)(a1 + 48) fromCursor:*(void *)(a1 + 56) timeStep:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) rate:v7 timeRangeMapper:v11];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
  return result;
}

+ (id)timeRangeMapperForSourceDuration:(double)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a1;
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v17[0] = *(_OWORD *)&a5->var0.var0;
  v17[1] = v10;
  v17[2] = *(_OWORD *)&a5->var1.var1;
  double v11 = [a1 _slowMotionRegionsFromSlowMotionTimeRange:v17];
  id v16 = 0;
  *(float *)&double v12 = a4;
  LOBYTE(v9) = [v9 _scaleComposition:0 baseDuration:v11 slowMotionRate:v6 slowMotionRegions:&v16 forExport:a3 outTimeRangeMapper:v12];
  id v13 = v16;
  double v14 = v13;
  if ((v9 & 1) == 0)
  {

    double v14 = 0;
  }

  return v14;
}

+ (id)_slowMotionRegionsFromSlowMotionTimeRange:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v9.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v9.start.epoch = v4;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&v9, v3);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    v10[0] = v5;
    float v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    CFRelease(v6);
  }
  else
  {
    float v7 = 0;
  }

  return v7;
}

+ (id)_scaledCompositionForAsset:(id)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6 outTimeRangeMapper:(id *)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  if (!v40
    || (*(float *)&double v11 = a4, ![a1 _isValidSlowMotionRate:v11])
    || (long long v12 = *(_OWORD *)&a5->var0.var3,
        *(_OWORD *)&v50.start.value = *(_OWORD *)&a5->var0.var0,
        *(_OWORD *)&v50.start.CMTimeEpoch epoch = v12,
        *(_OWORD *)&v50.duration.timescale = *(_OWORD *)&a5->var1.var1,
        ![a1 _isValidSlowMotionTimeRange:&v50]))
  {
    int v31 = 0;
    uint64_t v30 = 0;
    if (!a7) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  id v13 = [MEMORY[0x1E4F16590] composition];
  memset(&v49, 0, sizeof(v49));
  [v40 duration];
  memset(&v50, 0, sizeof(v50));
  *(_OWORD *)&start.start.value = *MEMORY[0x1E4F1FA48];
  long long v38 = *(_OWORD *)&start.start.value;
  start.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  CMTimeEpoch epoch = start.start.epoch;
  CMTime end = v49;
  CMTimeRangeFromTimeToTime(&v50, &start.start, &end);
  id v47 = 0;
  CMTimeRange start = v50;
  *(_OWORD *)&end.value = v38;
  end.CMTimeEpoch epoch = epoch;
  +[PFMediaUtilities insertTimeRange:&start ofAsset:v40 atTime:&end intoMutableComposition:v13 error:&v47];
  id v36 = v47;
  start.CMTimeRange start = v49;
  double Seconds = CMTimeGetSeconds(&start.start);
  long long v16 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&start.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&start.start.CMTimeEpoch epoch = v16;
  *(_OWORD *)&start.duration.timescale = *(_OWORD *)&a5->var1.var1;
  uint64_t v17 = [a1 _slowMotionRegionsFromSlowMotionTimeRange:&start];
  *(float *)&double v18 = a4;
  CFDictionaryRef v34 = (void *)v17;
  double v39 = a7;
  int v35 = objc_msgSend(a1, "_scaleComposition:baseDuration:slowMotionRate:slowMotionRegions:forExport:outTimeRangeMapper:", v13, Seconds, v18);
  uint64_t v19 = +[PFMediaUtilities mainVideoTrackForAsset:v40];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v37 = v13;
  uint64_t v20 = [v13 tracks];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v43;
    uint64_t v24 = *MEMORY[0x1E4F15C18];
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        double v27 = [v26 mediaType];
        int v28 = [v27 isEqualToString:v24];

        if (v28)
        {
          if (v19) {
            [v19 preferredTransform];
          }
          else {
            memset(v41, 0, sizeof(v41));
          }
          [v26 setPreferredTransform:v41];
        }
        float v29 = +[PFMediaUtilities trackWithTrackID:forAsset:](PFMediaUtilities, "trackWithTrackID:forAsset:", [v26 trackID], v40);
        objc_msgSend(v26, "setEnabled:", objc_msgSend(v29, "isEnabled"));
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v22);
  }

  uint64_t v30 = v37;
  a7 = v39;
  int v31 = v35;
  if (v39)
  {
LABEL_19:
    if ((v31 & 1) == 0) {
      *a7 = 0;
    }
  }
LABEL_21:
  if (v31) {
    double v32 = (void *)[v30 copy];
  }
  else {
    double v32 = 0;
  }

  return v32;
}

+ (BOOL)_isValidSlowMotionTimeRange:(id *)a3
{
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0) {
    return 0;
  }
  CMTime time1 = (CMTime)a3->var1;
  CMTime v4 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  return CMTimeCompare(&time1, &v4) != 0;
}

+ (BOOL)_isValidSlowMotionRate:(float)a3
{
  return a3 != 1.0 && a3 > 0.0;
}

+ (id)assetFromVideoAsset:(id)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6 outAudioMix:(id *)a7 outTimeRangeMapper:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  *(float *)&double v15 = a4;
  int v16 = [a1 _isValidSlowMotionRate:v15];
  long long v17 = *(_OWORD *)&a5->var0.var3;
  long long v25 = *(_OWORD *)&a5->var0.var0;
  long long v26 = v17;
  long long v27 = *(_OWORD *)&a5->var1.var1;
  int v18 = [a1 _isValidSlowMotionTimeRange:&v25];
  uint64_t v19 = 0;
  if (v16 && v18)
  {
    id v24 = 0;
    long long v20 = *(_OWORD *)&a5->var0.var3;
    long long v25 = *(_OWORD *)&a5->var0.var0;
    long long v26 = v20;
    long long v27 = *(_OWORD *)&a5->var1.var1;
    objc_msgSend(a1, "_scaledCompositionForAsset:slowMotionRate:slowMotionTimeRange:forExport:outTimeRangeMapper:", v14, &v25, v10, &v24, COERCE_DOUBLE(__PAIR64__(DWORD1(v27), LODWORD(a4))));
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v24;
    if (v21)
    {
      uint64_t v19 = [a1 audioMixForScaledComposition:v21 timeRangeMapper:v22];
      if (!a8) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v19 = 0;
      if (!a8)
      {
LABEL_6:

        if (v21) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
    }
    *a8 = v22;
    goto LABEL_6;
  }
LABEL_7:
  id v21 = v14;
LABEL_8:
  if (a7) {
    *a7 = v19;
  }

  return v21;
}

+ (NSArray)slowMotionSourceAssetPropertyKeys
{
  return (NSArray *)&unk_1EF7CADC0;
}

+ (int)preferredTimeScale
{
  return 600;
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_7992);
  }
  v2 = (void *)sharedConfiguration_configuration;

  return v2;
}

uint64_t __44__PFSlowMotionUtilities_sharedConfiguration__block_invoke()
{
  sharedConfiguration_configuration = objc_alloc_init(PFSlowMotionConfiguration);

  return MEMORY[0x1F41817F8]();
}

@end