@interface PXStoryExportAudioCompositionBuilder
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- (AVMutableComposition)audioComposition;
- (AVMutableCompositionTrack)currentVideoHighlightCompositionTrack;
- (AVMutableCompositionTrack)videoHighlightCompositionTrackA;
- (AVMutableCompositionTrack)videoHighlightCompositionTrackB;
- (BOOL)addAudioFromVideoHighlightAsset:(id)a3 fromTime:(id *)a4 atStoryTimeRange:(id *)a5 volume:(float)a6 fadeIn:(double)a7 fadeOut:(double)a8 shouldDuck:(BOOL)a9 error:(id *)a10;
- (BOOL)addMusicAsset:(id)a3 withAudioMix:(id)a4 preferredVolume:(float)a5 error:(id *)a6;
- (NSError)error;
- (NSMutableArray)audioMixParameters;
- (NSMutableArray)duckingAudioSegments;
- (NSMutableArray)musicCompositionTracks;
- (NSMutableArray)musicMixParameters;
- (PXStoryExportAudioCompositionBuilder)initWithMaximumDuration:(id *)a3 outroDuration:(id *)a4;
- (float)musicCompositionDefaultVolume;
- (id)_insertAudioTrack:(id)a3 fromTime:(id *)a4 intoAudioCompositionTrack:(id)a5 atTimeRange:(id *)a6 error:(id *)a7;
- (id)_mutableAudioMixParametersCreatedIfNeededForCompositionTrack:(id)a3;
- (id)_mutableAudioMixParametersForCompositionTrack:(id)a3;
- (void)_applyMusicDuckingAndFadeOut;
- (void)_applyVolumeRampsToVideoHilightAudioSegment:(id)a3 inAudioCompositionTrack:(id)a4 volume:(float)a5 fadeIn:(double)a6 fadeOut:(double)a7;
- (void)finishAndWaitWithResultHandler:(id)a3;
- (void)setAudioComposition:(id)a3;
- (void)setAudioMixParameters:(id)a3;
- (void)setCurrentVideoHighlightCompositionTrack:(id)a3;
- (void)setDuckingAudioSegments:(id)a3;
- (void)setError:(id)a3;
- (void)setMaximumDuration:(id *)a3;
- (void)setMusicCompositionDefaultVolume:(float)a3;
- (void)setMusicCompositionTracks:(id)a3;
- (void)setMusicMixParameters:(id)a3;
- (void)setOutroDuration:(id *)a3;
- (void)setVideoHighlightCompositionTrackA:(id)a3;
- (void)setVideoHighlightCompositionTrackB:(id)a3;
@end

@implementation PXStoryExportAudioCompositionBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_duckingAudioSegments, 0);
  objc_storeStrong((id *)&self->_currentVideoHighlightCompositionTrack, 0);
  objc_storeStrong((id *)&self->_videoHighlightCompositionTrackB, 0);
  objc_storeStrong((id *)&self->_videoHighlightCompositionTrackA, 0);
  objc_storeStrong((id *)&self->_musicMixParameters, 0);
  objc_storeStrong((id *)&self->_musicCompositionTracks, 0);
  objc_storeStrong((id *)&self->_audioComposition, 0);
  objc_storeStrong((id *)&self->_audioMixParameters, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setMaximumDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maximumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maximumDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setOutroDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_outroDuration.epoch = a3->var3;
  *(_OWORD *)&self->_outroDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setDuckingAudioSegments:(id)a3
{
}

- (NSMutableArray)duckingAudioSegments
{
  return self->_duckingAudioSegments;
}

- (void)setCurrentVideoHighlightCompositionTrack:(id)a3
{
}

- (AVMutableCompositionTrack)currentVideoHighlightCompositionTrack
{
  return self->_currentVideoHighlightCompositionTrack;
}

- (void)setVideoHighlightCompositionTrackB:(id)a3
{
}

- (AVMutableCompositionTrack)videoHighlightCompositionTrackB
{
  return self->_videoHighlightCompositionTrackB;
}

- (void)setVideoHighlightCompositionTrackA:(id)a3
{
}

- (AVMutableCompositionTrack)videoHighlightCompositionTrackA
{
  return self->_videoHighlightCompositionTrackA;
}

- (void)setMusicMixParameters:(id)a3
{
}

- (NSMutableArray)musicMixParameters
{
  return self->_musicMixParameters;
}

- (void)setMusicCompositionTracks:(id)a3
{
}

- (NSMutableArray)musicCompositionTracks
{
  return self->_musicCompositionTracks;
}

- (void)setMusicCompositionDefaultVolume:(float)a3
{
  self->_musicCompositionDefaultVolume = a3;
}

- (float)musicCompositionDefaultVolume
{
  return self->_musicCompositionDefaultVolume;
}

- (void)setAudioComposition:(id)a3
{
}

- (void)setAudioMixParameters:(id)a3
{
}

- (NSMutableArray)audioMixParameters
{
  return self->_audioMixParameters;
}

- (id)_mutableAudioMixParametersCreatedIfNeededForCompositionTrack:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryExportAudioCompositionBuilder *)self _mutableAudioMixParametersForCompositionTrack:v4];
  if (!v5)
  {
    v5 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:v4];
    v6 = [(PXStoryExportAudioCompositionBuilder *)self audioMixParameters];
    [v6 addObject:v5];
  }
  return v5;
}

- (id)_mutableAudioMixParametersForCompositionTrack:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 trackID];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(PXStoryExportAudioCompositionBuilder *)self audioMixParameters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 trackID] == v4)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)_applyMusicDuckingAndFadeOut
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  long long v3 = +[PXStorySettings sharedInstance];
  memset(&v76, 0, sizeof(v76));
  [v3 duckingFadeDuration];
  CMTimeMakeWithSeconds(&v76, v4, 600);
  [(PXStoryExportAudioCompositionBuilder *)self musicCompositionDefaultVolume];
  float v6 = v5;
  v37 = v3;
  [v3 musicDuckedVolume];
  float v8 = v7;
  long long v74 = 0uLL;
  CMTimeEpoch v75 = 0;
  [(PXStoryExportAudioCompositionBuilder *)self outroDuration];
  memset(&v73, 0, sizeof(v73));
  [(PXStoryExportAudioCompositionBuilder *)self maximumDuration];
  *(_OWORD *)&rhs.start.CMTimeValue value = v74;
  rhs.start.CMTimeEpoch epoch = v75;
  CMTimeSubtract(&start, &lhs, &rhs.start);
  *(_OWORD *)&rhs.start.CMTimeValue value = v74;
  rhs.start.CMTimeEpoch epoch = v75;
  CMTimeRangeMake(&v73, &start, &rhs.start);
  v9 = [(PXStoryExportAudioCompositionBuilder *)self duckingAudioSegments];
  v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_292904];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = [(PXStoryExportAudioCompositionBuilder *)self musicCompositionTracks];
  uint64_t v45 = [obj countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v45)
  {
    float v11 = v6 * v8;
    uint64_t v43 = *(void *)v68;
    CMTimeEpoch v40 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CMTimeValue v42 = *MEMORY[0x1E4F1F9F8];
    CMTimeFlags v39 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
    CMTimeScale v41 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
    v44 = self;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v68 != v43) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v67 + 1) + 8 * v12);
        uint64_t v47 = v12;
        long long v13 = objc_msgSend(MEMORY[0x1E4F16588], "audioMixInputParametersWithTrack:");
        CMTimeValue value = v42;
        CMTimeScale timescale = v41;
        if (![v10 count])
        {
          *(_OWORD *)&rhs.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
          rhs.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          objc_msgSend(v13, "setVolume:atTime:", &rhs, COERCE_DOUBLE(__PAIR64__(HIDWORD(rhs.start.value), LODWORD(v6))));
        }
        if (![v10 count]) {
          goto LABEL_46;
        }
        unint64_t v14 = 0;
        uint64_t v15 = 1;
        CMTimeFlags flags = v39;
        CMTimeEpoch epoch = v40;
        do
        {
          uint64_t v18 = [v10 objectAtIndexedSubscript:v14];
          if ([v18 isEmpty]) {
            goto LABEL_45;
          }
          if (v18)
          {
            [v18 timeMapping];
          }
          else
          {
            long long v64 = 0u;
            memset(&v65, 0, sizeof(v65));
            long long v62 = 0u;
            long long v63 = 0u;
          }
          CMTimeRange rhs = v65;
          if (!v14)
          {
            *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v65.start.value;
            time1.start.CMTimeEpoch epoch = v65.start.epoch;
            *(_OWORD *)&time2.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
            time2.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            if (CMTimeCompare(&time1.start, &time2.start))
            {
              *(_OWORD *)&time1.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
              time1.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
              objc_msgSend(v13, "setVolume:atTime:", &time1, COERCE_DOUBLE(__PAIR64__(HIDWORD(time1.start.value), LODWORD(v6))));
            }
          }
          memset(&v61, 0, sizeof(v61));
          *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&rhs.start.value;
          time1.start.CMTimeEpoch epoch = rhs.start.epoch;
          time2.CMTime start = v76;
          CMTimeSubtract(&v61, &time1.start, &time2.start);
          if (flags)
          {
            time1.CMTime start = v61;
            time2.start.CMTimeValue value = value;
            time2.start.CMTimeScale timescale = timescale;
            time2.start.CMTimeFlags flags = flags;
            time2.start.CMTimeEpoch epoch = epoch;
            BOOL v19 = CMTimeCompare(&time1.start, &time2.start) >= 0;
          }
          else
          {
            BOOL v19 = 1;
          }
          memset(&time1, 0, sizeof(time1));
          time2.CMTime start = v61;
          duration.CMTime start = v76;
          CMTimeRangeMake(&time1, &time2.start, &duration.start);
          CMTimeRange time2 = time1;
          CMTimeRangeGetEnd(&v59, &time2);
          *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v73.start.value;
          time2.start.CMTimeEpoch epoch = v73.start.epoch;
          if (CMTimeCompare(&v59, &time2.start) < 0
            && v19
            && (time2.CMTime start = v61,
                *(_OWORD *)&duration.start.CMTimeValue value = *MEMORY[0x1E4F1FA48],
                duration.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16),
                (CMTimeCompare(&time2.start, &duration.start) & 0x80000000) == 0))
          {
            CMTimeRange time2 = time1;
            objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &time2, COERCE_DOUBLE(__PAIR64__(time1.duration.flags, LODWORD(v6))), COERCE_DOUBLE(__PAIR64__(HIDWORD(time1.start.epoch), LODWORD(v11))));
          }
          else
          {
            *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&rhs.start.value;
            time2.start.CMTimeEpoch epoch = rhs.start.epoch;
            *(_OWORD *)&duration.start.CMTimeValue value = *(_OWORD *)&v73.start.value;
            duration.start.CMTimeEpoch epoch = v73.start.epoch;
            if (CMTimeCompare(&time2.start, &duration.start) < 0)
            {
              *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&rhs.start.value;
              time2.start.CMTimeEpoch epoch = rhs.start.epoch;
              objc_msgSend(v13, "setVolume:atTime:", &time2, COERCE_DOUBLE(__PAIR64__(HIDWORD(rhs.start.value), LODWORD(v11))));
            }
          }
          v20 = v13;
          memset(&time2, 0, sizeof(time2));
          CMTimeRange duration = rhs;
          CMTimeRangeGetEnd(&v57, &duration);
          duration.CMTime start = v76;
          CMTimeRangeMake(&time2, &v57, &duration.start);
          memset(&v55, 0, sizeof(v55));
          CMTimeRange duration = time2;
          CMTimeRangeGetEnd(&v55, &duration);
          v21 = 0;
          uint64_t v22 = -1;
          uint64_t v23 = v15;
          while (v14 >= [v10 count] + v22)
          {

            v24 = 0;
            if (([0 isEmpty] & 1) == 0)
            {
              unsigned int v25 = 1;
              long long v13 = v20;
              goto LABEL_36;
            }
LABEL_31:
            ++v23;
            --v22;
            v21 = v24;
          }
          v24 = [v10 objectAtIndexedSubscript:v23];

          if ([v24 isEmpty]) {
            goto LABEL_31;
          }
          long long v13 = v20;
          if (v24)
          {
            [v24 timeMapping];
            CMTime v53 = v54;
            memset(&duration, 0, 24);
            CMTime v52 = v76;
            CMTimeSubtract(&duration.start, &v53, &v52);
            CMTime v53 = v55;
            CMTime v52 = duration.start;
            unsigned int v25 = CMTimeCompare(&v53, &v52) >> 31;
          }
          else
          {
            unsigned int v25 = 1;
          }
LABEL_36:
          duration.CMTime start = v55;
          CMTime v53 = v73.start;
          if (CMTimeCompare(&duration.start, &v53) < 0 && v25)
          {
            CMTimeRange duration = time2;
            objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &duration, COERCE_DOUBLE(__PAIR64__(time2.duration.flags, LODWORD(v11))), COERCE_DOUBLE(__PAIR64__(HIDWORD(time2.start.epoch), LODWORD(v6))));
          }
          else
          {
            memset(&v53, 0, sizeof(v53));
            CMTimeRange duration = rhs;
            CMTimeRangeGetEnd(&v53, &duration);
            duration.CMTime start = v53;
            CMTime v52 = v73.start;
            if (CMTimeCompare(&duration.start, &v52) < 0) {
              unsigned int v26 = v25;
            }
            else {
              unsigned int v26 = 0;
            }
            if (v26 == 1)
            {
              duration.CMTime start = v53;
              objc_msgSend(v13, "setVolume:atTime:", &duration, COERCE_DOUBLE(__PAIR64__(HIDWORD(v53.value), LODWORD(v6))));
            }
          }
          CMTimeValue value = v55.value;
          CMTimeFlags flags = v55.flags;
          CMTimeScale timescale = v55.timescale;
          CMTimeEpoch epoch = v55.epoch;
LABEL_45:

          ++v14;
          ++v15;
        }
        while (v14 < [v10 count]);
LABEL_46:
        memset(&rhs, 0, sizeof(rhs));
        if (v46) {
          [v46 timeRange];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        CMTimeRange time1 = v73;
        CMTimeRangeGetIntersection(&rhs, &range, &time1);
        if ((rhs.start.flags & 1) == 0
          || (rhs.duration.flags & 1) == 0
          || rhs.duration.epoch
          || rhs.duration.value < 0
          || (time1.CMTime start = rhs.duration,
              *(_OWORD *)&time2.start.CMTimeValue value = *MEMORY[0x1E4F1FA48],
              time2.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16),
              CMTimeCompare(&time1.start, &time2.start)))
        {
          *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&rhs.start.value;
          time1.start.CMTimeEpoch epoch = rhs.start.epoch;
          *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v73.start.value;
          time2.start.CMTimeEpoch epoch = v73.start.epoch;
          CMTimeSubtract(&time, &time1.start, &time2.start);
          Float64 Seconds = CMTimeGetSeconds(&time);
          *(_OWORD *)&time1.start.CMTimeValue value = v74;
          time1.start.CMTimeEpoch epoch = v75;
          float v28 = Seconds / CMTimeGetSeconds(&time1.start);
          *(float *)&Float64 Seconds = v6 * PXStoryVolumeForFadeOutFractionCompleted(v28);
          CMTimeRange time1 = rhs;
          CMTimeRangeGetEnd(&v48, &time1);
          *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v73.start.value;
          time1.start.CMTimeEpoch epoch = v73.start.epoch;
          CMTimeSubtract(&v49, &v48, &time1.start);
          double v29 = CMTimeGetSeconds(&v49);
          *(_OWORD *)&time1.start.CMTimeValue value = v74;
          time1.start.CMTimeEpoch epoch = v75;
          float v30 = v29 / CMTimeGetSeconds(&time1.start);
          *(float *)&double v31 = v6 * PXStoryVolumeForFadeOutFractionCompleted(v30);
          CMTimeRange time1 = rhs;
          objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &time1, COERCE_DOUBLE(__PAIR64__(rhs.duration.flags, LODWORD(Seconds))), v31);
        }
        uint64_t v32 = [(PXStoryExportAudioCompositionBuilder *)v44 _mutableAudioMixParametersForCompositionTrack:v46];
        if (v32)
        {
          v33 = (void *)v32;
          v34 = [(PXStoryExportAudioCompositionBuilder *)v44 audioMixParameters];
          [v34 removeObjectIdenticalTo:v33];

          id v35 = +[PXFlexMusicLibrary coalesceAudioMixInputParametersA:v33 withAudioMixInputParametersB:v13 audioTrack:v46];
        }
        else
        {
          id v35 = v13;
        }
        v36 = [(PXStoryExportAudioCompositionBuilder *)v44 audioMixParameters];
        [v36 addObject:v35];

        uint64_t v12 = v47 + 1;
      }
      while (v47 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v67 objects:v79 count:16];
    }
    while (v45);
  }
}

uint64_t __68__PXStoryExportAudioCompositionBuilder__applyMusicDuckingAndFadeOut__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 timeMapping];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  *(_OWORD *)&v22.CMTimeValue value = v19;
  v22.CMTimeEpoch epoch = v20;
  if (v5)
  {
    [v5 timeMapping];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
  }
  CMTime time1 = v22;
  *(_OWORD *)&v8.CMTimeValue value = v13;
  v8.CMTimeEpoch epoch = v14;
  uint64_t v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

- (void)_applyVolumeRampsToVideoHilightAudioSegment:(id)a3 inAudioCompositionTrack:(id)a4 volume:(float)a5 fadeIn:(double)a6 fadeOut:(double)a7
{
  id v12 = a3;
  long long v13 = [(PXStoryExportAudioCompositionBuilder *)self _mutableAudioMixParametersCreatedIfNeededForCompositionTrack:a4];
  long long v14 = +[PXStorySettings sharedInstance];
  uint64_t v15 = [v14 audioFadeCurve];
  if (v12)
  {
    [v12 timeMapping];
    *(_OWORD *)&v45.CMTimeValue value = v42;
    v45.CMTimeEpoch epoch = v43;
    [v12 timeMapping];
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    memset(&v45, 0, sizeof(v45));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
  }
  long long v37 = v31;
  *(_OWORD *)v38 = v32;
  *(_OWORD *)&v38[16] = v33;
  CMTime v30 = v45;
  if (a6 <= 0.0)
  {
    time.CMTimeRange start = v45;
    objc_msgSend(v13, "setVolume:atTime:", &time, COERCE_DOUBLE(__PAIR64__(HIDWORD(v45.value), LODWORD(a5))));
  }
  else
  {
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeWithSeconds(&v29, a6, 600);
    memset(&v28, 0, sizeof(v28));
    time.CMTimeRange start = v29;
    int v16 = 1;
    CMTimeMultiplyByRatio(&v28, &time.start, 1, 30);
    float v17 = 0.0;
    do
    {
      memset(&time, 0, sizeof(time));
      start.CMTimeRange start = v30;
      CMTime duration = v28;
      CMTimeRangeMake(&time, &start.start, &duration);
      float v18 = PXVolumeGainForAudioCurveAtTime(v15, (float)v16 / 30.0);
      float v19 = v18 * a5;
      CMTimeRange start = time;
      objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &start, COERCE_DOUBLE(__PAIR64__(time.duration.flags, LODWORD(v17))), COERCE_DOUBLE(__PAIR64__(HIDWORD(time.start.epoch), v18 * a5)));
      start.CMTimeRange start = v30;
      CMTime duration = v28;
      CMTimeAdd(&v30, &start.start, &duration);
      ++v16;
      float v17 = v19;
    }
    while (v16 != 31);
  }
  if (a7 > 0.0)
  {
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeWithSeconds(&v29, a7, 600);
    memset(&v28, 0, sizeof(v28));
    time.CMTimeRange start = v45;
    *(_OWORD *)&start.start.CMTimeValue value = *(_OWORD *)&v38[8];
    start.start.CMTimeEpoch epoch = *(void *)&v38[24];
    CMTimeAdd(&v28, &time.start, &start.start);
    memset(&duration, 0, sizeof(duration));
    time.CMTimeRange start = v29;
    int v20 = 1;
    CMTimeMultiplyByRatio(&duration, &time.start, 1, 30);
    float v21 = 0.0;
    do
    {
      start.CMTimeRange start = v28;
      CMTime v24 = duration;
      CMTimeSubtract(&time.start, &start.start, &v24);
      CMTime v28 = time.start;
      memset(&time, 0, sizeof(time));
      start.CMTimeRange start = v28;
      CMTime v24 = duration;
      CMTimeRangeMake(&time, &start.start, &v24);
      float v22 = PXVolumeGainForAudioCurveAtTime(v15, (float)v20 / 30.0) * a5;
      CMTimeRange start = time;
      HIDWORD(v23) = time.duration.flags;
      *(float *)&double v23 = v22;
      objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &start, v23, COERCE_DOUBLE(__PAIR64__(HIDWORD(time.start.epoch), LODWORD(v21))));
      ++v20;
      float v21 = v22;
    }
    while (v20 != 31);
  }
}

- (id)_insertAudioTrack:(id)a3 fromTime:(id *)a4 intoAudioCompositionTrack:(id)a5 atTimeRange:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  memset(&v26[80], 0, 48);
  if (v12) {
    [v12 timeRange];
  }
  memset(&v26[56], 0, 24);
  [(PXStoryExportAudioCompositionBuilder *)self maximumDuration];
  long long v14 = *(_OWORD *)&a4->var0;
  time.CMTimeEpoch epoch = a4->var3;
  CMTimeRange range = *(CMTimeRange *)&v26[80];
  *(_OWORD *)&time.CMTimeValue value = v14;
  CMTimeClampToRange((CMTime *)v26, &time, &range);
  memset(&v26[24], 0, 24);
  CMTime time = *(CMTime *)&v26[56];
  CMTime time2 = *(CMTime *)v26;
  CMTimeMinimum(&range.start, &time, &time2);
  *(CMTime *)unsigned int v26 = range.start;
  range.CMTimeRange start = *(CMTime *)&v26[104];
  CMTime time = *(CMTime *)v26;
  CMTimeSubtract(&v22, &range.start, &time);
  CMTime time = (CMTime)a6->var1;
  CMTimeMinimum(&range.start, &time, &v22);
  *(void *)&v26[40] = range.start.epoch;
  *(_OWORD *)&v26[24] = *(_OWORD *)&range.start.value;
  CMTime time = range.start;
  CMTime time2 = *(CMTime *)&v26[56];
  CMTimeMinimum(&range.start, &time, &time2);
  *(CMTime *)&v26[24] = range.start;
  memset(&time, 0, sizeof(time));
  range.CMTimeRange start = *(CMTime *)&v26[56];
  CMTime time2 = (CMTime)a6->var0;
  CMTimeMinimum(&time, &range.start, &time2);
  id v21 = 0;
  CMTimeRange range = *(CMTimeRange *)v26;
  CMTime time2 = time;
  int v15 = [v13 insertTimeRange:&range ofTrack:v12 atTime:&time2 error:&v21];
  id v16 = v21;
  float v17 = 0;
  if (v15)
  {
    float v18 = [v13 segments];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      range.CMTimeRange start = time;
      float v17 = [v13 segmentForTrackTime:&range];
      if (!v17) {
        PXAssertGetLog();
      }
    }
    else
    {
      float v17 = 0;
    }
  }
  if (a7) {
    *a7 = v16;
  }

  return v17;
}

- (AVMutableComposition)audioComposition
{
  audioComposition = self->_audioComposition;
  if (!audioComposition)
  {
    id v4 = (AVMutableComposition *)objc_alloc_init(MEMORY[0x1E4F16590]);
    id v5 = self->_audioComposition;
    self->_audioComposition = v4;

    audioComposition = self->_audioComposition;
  }
  return audioComposition;
}

- (BOOL)addAudioFromVideoHighlightAsset:(id)a3 fromTime:(id *)a4 atStoryTimeRange:(id *)a5 volume:(float)a6 fadeIn:(double)a7 fadeOut:(double)a8 shouldDuck:(BOOL)a9 error:(id *)a10
{
  BOOL v11 = a9;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = [(PXStoryExportAudioCompositionBuilder *)self error];
  if (!v19)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v20 = *MEMORY[0x1E4F15BA8];
    id v21 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:v18];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v48 = v20;
      BOOL v49 = v11;
      uint64_t v24 = *(void *)v55;
LABEL_4:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v55 != v24) {
          objc_enumerationMutation(v21);
        }
        unsigned int v26 = *(void **)(*((void *)&v54 + 1) + 8 * v25);
        if (objc_msgSend(v26, "isEnabled", v48)) {
          break;
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [v21 countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v23) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v27 = v26;

      if (!v27)
      {
        id v19 = 0;
        goto LABEL_27;
      }
      CMTime v28 = [(PXStoryExportAudioCompositionBuilder *)self currentVideoHighlightCompositionTrack];
      CMTime v29 = [(PXStoryExportAudioCompositionBuilder *)self videoHighlightCompositionTrackB];

      if (v28 == v29)
      {
        long long v35 = [(PXStoryExportAudioCompositionBuilder *)self videoHighlightCompositionTrackA];

        BOOL v31 = v49;
        if (!v35)
        {
          long long v36 = [(PXStoryExportAudioCompositionBuilder *)self audioComposition];
          long long v37 = [v36 addMutableTrackWithMediaType:v48 preferredTrackID:0];

          [(PXStoryExportAudioCompositionBuilder *)self setVideoHighlightCompositionTrackA:v37];
        }
        uint64_t v34 = [(PXStoryExportAudioCompositionBuilder *)self videoHighlightCompositionTrackA];
      }
      else
      {
        CMTime v30 = [(PXStoryExportAudioCompositionBuilder *)self videoHighlightCompositionTrackB];

        BOOL v31 = v49;
        if (!v30)
        {
          long long v32 = [(PXStoryExportAudioCompositionBuilder *)self audioComposition];
          long long v33 = [v32 addMutableTrackWithMediaType:v48 preferredTrackID:0];

          [(PXStoryExportAudioCompositionBuilder *)self setVideoHighlightCompositionTrackB:v33];
        }
        uint64_t v34 = [(PXStoryExportAudioCompositionBuilder *)self videoHighlightCompositionTrackB];
      }
      v38 = (void *)v34;
      [(PXStoryExportAudioCompositionBuilder *)self setCurrentVideoHighlightCompositionTrack:v34];

      long long v39 = [(PXStoryExportAudioCompositionBuilder *)self currentVideoHighlightCompositionTrack];
      long long v40 = *(_OWORD *)&a5->var0.var3;
      v53[0] = *(_OWORD *)&a5->var0.var0;
      v53[1] = v40;
      v53[2] = *(_OWORD *)&a5->var1.var1;
      long long v50 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      id v52 = 0;
      long long v41 = [(PXStoryExportAudioCompositionBuilder *)self _insertAudioTrack:v27 fromTime:&v50 intoAudioCompositionTrack:v39 atTimeRange:v53 error:&v52];
      id v19 = v52;

      if (v41)
      {
        long long v42 = [(PXStoryExportAudioCompositionBuilder *)self currentVideoHighlightCompositionTrack];
        *(float *)&double v43 = a6;
        [(PXStoryExportAudioCompositionBuilder *)self _applyVolumeRampsToVideoHilightAudioSegment:v41 inAudioCompositionTrack:v42 volume:v43 fadeIn:a7 fadeOut:a8];

        if (v31)
        {
          long long v44 = [(PXStoryExportAudioCompositionBuilder *)self duckingAudioSegments];

          if (!v44)
          {
            id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [(PXStoryExportAudioCompositionBuilder *)self setDuckingAudioSegments:v45];
          }
          v46 = [(PXStoryExportAudioCompositionBuilder *)self duckingAudioSegments];
          [v46 addObject:v41];
        }
      }
    }
    else
    {
LABEL_10:
      id v19 = 0;
      id v27 = v21;
    }
  }
LABEL_27:
  if (a10) {
    *a10 = v19;
  }
  [(PXStoryExportAudioCompositionBuilder *)self setError:v19];

  return v19 == 0;
}

- (BOOL)addMusicAsset:(id)a3 withAudioMix:(id)a4 preferredVolume:(float)a5 error:(id *)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(PXStoryExportAudioCompositionBuilder *)self error];
  if (!v12)
  {
    v38 = a6;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(PXStoryExportAudioCompositionBuilder *)self setMusicCompositionTracks:v13];

    *(float *)&double v14 = a5;
    [(PXStoryExportAudioCompositionBuilder *)self setMusicCompositionDefaultVolume:v14];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v15 = *MEMORY[0x1E4F15BA8];
    id v39 = v10;
    id v16 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:v10];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v12 = 0;
      uint64_t v19 = *(void *)v59;
      id v42 = v11;
      double v43 = self;
      uint64_t v40 = v15;
      long long v41 = v16;
      uint64_t v45 = *(void *)v59;
      do
      {
        uint64_t v20 = 0;
        uint64_t v46 = v18;
        do
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v58 + 1) + 8 * v20);
          if ([v21 isEnabled])
          {
            uint64_t v22 = [v21 segments];
            uint64_t v23 = [v22 count];

            if (v23)
            {
              uint64_t v24 = [(PXStoryExportAudioCompositionBuilder *)self audioComposition];
              uint64_t v25 = [v24 addMutableTrackWithMediaType:v15 preferredTrackID:0];

              long long v56 = 0u;
              long long v57 = 0u;
              long long v55 = 0u;
              if (v21) {
                [v21 timeRange];
              }
              uint64_t v53 = v56;
              id v54 = v12;
              v51[0] = v55;
              v51[1] = v56;
              v51[2] = v57;
              long long v52 = v55;
              unsigned int v26 = [(PXStoryExportAudioCompositionBuilder *)self _insertAudioTrack:v21 fromTime:&v52 intoAudioCompositionTrack:v25 atTimeRange:v51 error:&v54];
              id v27 = v54;

              if (v26)
              {
                if (v11)
                {
                  id v44 = v27;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v47 = 0u;
                  long long v48 = 0u;
                  CMTime v28 = [v11 inputParameters];
                  uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v62 count:16];
                  if (v29)
                  {
                    uint64_t v30 = v29;
                    uint64_t v31 = *(void *)v48;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v30; ++i)
                      {
                        if (*(void *)v48 != v31) {
                          objc_enumerationMutation(v28);
                        }
                        long long v33 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                        int v34 = [v33 trackID];
                        if (v34 == [v21 trackID])
                        {
                          long long v35 = (void *)[v33 mutableCopy];
                          objc_msgSend(v35, "setTrackID:", objc_msgSend(v25, "trackID"));
                          self = v43;
                          long long v36 = [(PXStoryExportAudioCompositionBuilder *)v43 audioMixParameters];
                          [v36 addObject:v35];

                          goto LABEL_23;
                        }
                      }
                      uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v62 count:16];
                      self = v43;
                      if (v30) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_23:

                  id v16 = v41;
                  id v11 = v42;
                  uint64_t v15 = v40;
                  id v27 = v44;
                }
                [(NSMutableArray *)self->_musicCompositionTracks addObject:v25];
              }

              id v12 = v27;
              uint64_t v19 = v45;
            }
            uint64_t v18 = v46;
          }
          ++v20;
        }
        while (v20 != v18);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v18);
    }
    else
    {
      id v12 = 0;
    }

    a6 = v38;
    id v10 = v39;
  }
  if (a6) {
    *a6 = v12;
  }
  [(PXStoryExportAudioCompositionBuilder *)self setError:v12];

  return v12 == 0;
}

- (void)finishAndWaitWithResultHandler:(id)a3
{
  id v15 = a3;
  id v4 = [(PXStoryExportAudioCompositionBuilder *)self error];

  if (v4)
  {
    id v5 = [(PXStoryExportAudioCompositionBuilder *)self error];
    (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v5);
  }
  else
  {
    if (self->_audioComposition
      && ([(PXStoryExportAudioCompositionBuilder *)self _applyMusicDuckingAndFadeOut],
          [(NSMutableArray *)self->_audioMixParameters count]))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F16580]);
      uint64_t v6 = [(PXStoryExportAudioCompositionBuilder *)self audioMixParameters];
      [v5 setInputParameters:v6];
    }
    else
    {
      id v5 = 0;
    }
    (*((void (**)(id, AVMutableComposition *, id, void))v15 + 2))(v15, self->_audioComposition, v5, 0);
    id v13 = PXStoryErrorCreateWithCodeDebugFormat(13, @"cannot use object after finishWithResultHandler was called", v7, v8, v9, v10, v11, v12, v14);
    [(PXStoryExportAudioCompositionBuilder *)self setError:v13];
  }
}

- (PXStoryExportAudioCompositionBuilder)initWithMaximumDuration:(id *)a3 outroDuration:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryExportAudioCompositionBuilder;
  uint64_t v6 = [(PXStoryExportAudioCompositionBuilder *)&v13 init];
  uint64_t v7 = (PXStoryExportAudioCompositionBuilder *)v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)&a3->var0;
    *((void *)v6 + 16) = a3->var3;
    *((_OWORD *)v6 + 7) = v8;
    long long v9 = *(_OWORD *)&a4->var0;
    *((void *)v6 + 13) = a4->var3;
    *(_OWORD *)(v6 + 88) = v9;
    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    audioMixParameters = v7->_audioMixParameters;
    v7->_audioMixParameters = v10;
  }
  return v7;
}

@end