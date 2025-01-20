@interface PXStoryFallbackMovieHighlightCuration
+ ($28FEB1B56BB3ED5175BFC6DE64DE503F)defaultHighlightRangeForPlaybackRange:(SEL)a3;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxHighlightDuration;
+ (id)movieHighlightCurationForDisplayAsset:(id)a3;
+ (id)movieHighlightCurationForLivePhotoAsset:(id)a3;
+ (id)movieHighlightCurationForVideoAsset:(id)a3;
+ (void)setMaxHighlightDuration:(id *)a3;
- (NSArray)highlights;
- (PXStoryFallbackMovieHighlightCuration)init;
- (PXStoryFallbackMovieHighlightCuration)initWithAssetDuration:(id *)a3 playbackRange:(id *)a4 highlightRange:(id *)a5 bestPlaybackRect:(CGRect)a6 normalizationData:(id)a7 audioQualityScore:(float)a8;
- (PXStoryMovieHighlight)bestHighlight;
- (PXStoryMovieHighlight)defaultHighlight;
- (PXStoryMovieHighlight)fullMovie;
- (PXStoryMovieHighlight)livePhoto;
- (PXStoryMovieHighlight)movieSummary;
@end

@implementation PXStoryFallbackMovieHighlightCuration

- (void).cxx_destruct
{
}

- (PXStoryMovieHighlight)fullMovie
{
  v3 = [PXStoryMockMovieHighlight alloc];
  CMTime duration = (CMTime)self->_duration;
  *(_OWORD *)&start.value = PXStoryTimeZero;
  start.epoch = 0;
  CMTimeRangeMake(&v7, &start, &duration);
  *(float *)&double v4 = self->_audioQualityScore;
  v5 = -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](v3, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", &v7, 0, 0, 0, 0, 0.0, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height, 0.0, 0.0, v4);
  return (PXStoryMovieHighlight *)v5;
}

- (PXStoryMovieHighlight)livePhoto
{
  return 0;
}

- (PXStoryMovieHighlight)movieSummary
{
  v3 = 0;
  if (self->_playbackRange.start.flags)
  {
    unsigned int flags = self->_playbackRange.duration.flags;
    BOOL v5 = (flags & 1) != 0 && self->_playbackRange.duration.epoch == 0;
    if (v5 && (self->_playbackRange.duration.value & 0x8000000000000000) == 0)
    {
      int timescale = self->_playbackRange.duration.timescale;
      *(void *)&long long v11 = self->_playbackRange.duration.value;
      *((void *)&v11 + 1) = __PAIR64__(flags, timescale);
      *(void *)&long long v12 = 0;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare((CMTime *)&v11, &time2))
      {
        CMTimeRange v7 = [PXStoryMockMovieHighlight alloc];
        *(float *)&double v8 = self->_audioQualityScore;
        long long v9 = *(_OWORD *)&self->_playbackRange.start.epoch;
        long long v11 = *(_OWORD *)&self->_playbackRange.start.value;
        long long v12 = v9;
        long long v13 = *(_OWORD *)&self->_playbackRange.duration.timescale;
        v3 = -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](v7, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", &v11, 0, 0, 0, 0, 0.0, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height, 0.0, 0.0, v8);
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return (PXStoryMovieHighlight *)v3;
}

- (PXStoryMovieHighlight)defaultHighlight
{
  v3 = 0;
  if (self->_highlightRange.start.flags)
  {
    unsigned int flags = self->_highlightRange.duration.flags;
    BOOL v5 = (flags & 1) != 0 && self->_highlightRange.duration.epoch == 0;
    if (v5 && (self->_highlightRange.duration.value & 0x8000000000000000) == 0)
    {
      int timescale = self->_highlightRange.duration.timescale;
      *(void *)&long long v12 = self->_highlightRange.duration.value;
      *((void *)&v12 + 1) = __PAIR64__(flags, timescale);
      *(void *)&long long v13 = 0;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare((CMTime *)&v12, &time2))
      {
        CMTimeRange v7 = [PXStoryMockMovieHighlight alloc];
        normalizationData = self->_normalizationData;
        *(float *)&double v9 = self->_audioQualityScore;
        long long v10 = *(_OWORD *)&self->_highlightRange.start.epoch;
        long long v12 = *(_OWORD *)&self->_highlightRange.start.value;
        long long v13 = v10;
        long long v14 = *(_OWORD *)&self->_highlightRange.duration.timescale;
        v3 = -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](v7, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", &v12, normalizationData, 0, 0, 0, 0.0, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height, 0.0, 0.0, v9);
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return (PXStoryMovieHighlight *)v3;
}

- (PXStoryMovieHighlight)bestHighlight
{
  return 0;
}

- (NSArray)highlights
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (PXStoryFallbackMovieHighlightCuration)initWithAssetDuration:(id *)a3 playbackRange:(id *)a4 highlightRange:(id *)a5 bestPlaybackRect:(CGRect)a6 normalizationData:(id)a7 audioQualityScore:(float)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PXStoryFallbackMovieHighlightCuration;
  v19 = [(PXStoryFallbackMovieHighlightCuration *)&v27 init];
  v20 = (PXStoryFallbackMovieHighlightCuration *)v19;
  if (v19)
  {
    long long v21 = *(_OWORD *)&a3->var0;
    *((void *)v19 + 3) = a3->var3;
    *(_OWORD *)(v19 + 8) = v21;
    long long v22 = *(_OWORD *)&a4->var0.var0;
    long long v23 = *(_OWORD *)&a4->var1.var1;
    *((_OWORD *)v19 + 3) = *(_OWORD *)&a4->var0.var3;
    *((_OWORD *)v19 + 4) = v23;
    *((_OWORD *)v19 + 2) = v22;
    long long v24 = *(_OWORD *)&a5->var0.var0;
    long long v25 = *(_OWORD *)&a5->var1.var1;
    *((_OWORD *)v19 + 6) = *(_OWORD *)&a5->var0.var3;
    *((_OWORD *)v19 + 7) = v25;
    *((_OWORD *)v19 + 5) = v24;
    *((CGFloat *)v19 + 16) = x;
    *((CGFloat *)v19 + 17) = y;
    *((CGFloat *)v19 + 18) = width;
    *((CGFloat *)v19 + 19) = height;
    objc_storeStrong((id *)v19 + 20, a7);
    v20->_audioQualityScore = a8;
  }

  return v20;
}

- (PXStoryFallbackMovieHighlightCuration)init
{
  uint64_t v7 = 0;
  long long v6 = PXStoryTimeZero;
  memset(v5, 0, sizeof(v5));
  memset(v4, 0, sizeof(v4));
  LODWORD(v2) = 0.5;
  return -[PXStoryFallbackMovieHighlightCuration initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:](self, "initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:", &v6, v5, v4, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v2);
}

+ (id)movieHighlightCurationForLivePhotoAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    [v4 livePhotoVideoDuration];
    *(CMTime *)&v25[80] = *(CMTime *)&v25[56];
    memset(v25, 0, 48);
    objc_msgSend(v5, "px_storyResourceFetchBestPlaybackRange");
  }
  else
  {
    memset(&v25[56], 0, 48);
    memset(v25, 0, 48);
  }

  if ((v25[12] & 1) == 0
    || (v25[36] & 1) == 0
    || *(void *)&v25[40]
    || (*(void *)&v25[24] & 0x8000000000000000) != 0
    || (time1.start.value = *(void *)&v25[24],
        *(void *)&time1.start.int timescale = *(void *)&v25[32],
        time1.start.epoch = 0,
        long long v21 = *MEMORY[0x1E4F1FA48],
        *(void *)&long long v22 = *(void *)(MEMORY[0x1E4F1FA48] + 16),
        !CMTimeCompare(&time1.start, (CMTime *)&v21)))
  {
    CMTime duration = *(CMTime *)&v25[80];
    long long v21 = PXStoryTimeZero;
    *(void *)&long long v22 = 0;
    CMTimeRangeMake(&time1, (CMTime *)&v21, &duration);
    *(CMTimeRange *)long long v25 = time1;
  }
  id v6 = v5;
  objc_msgSend(v6, "px_storyResourceFetchBestPlaybackRect");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v6 audioScore];
  int v16 = v15;
  id v17 = objc_alloc((Class)a1);
  CMTime duration = *(CMTime *)&v25[80];
  CMTimeRange time1 = *(CMTimeRange *)v25;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  LODWORD(v18) = v16;
  v19 = objc_msgSend(v17, "initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:", &duration, &time1, &v21, 0, v8, v10, v12, v14, v18);

  return v19;
}

+ (id)movieHighlightCurationForVideoAsset:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(&start, 0, sizeof(start));
  [v4 duration];
  CMTimeMakeWithSeconds(&start, v5, 600);
  memset(&v50, 0, sizeof(v50));
  id v6 = v4;
  double v7 = v6;
  if (v6) {
    objc_msgSend(v6, "px_storyResourceFetchBestPlaybackRange");
  }
  else {
    memset(&v50, 0, sizeof(v50));
  }

  if ((v50.start.flags & 1) == 0
    || (v50.duration.flags & 1) == 0
    || v50.duration.epoch
    || v50.duration.value < 0
    || (time1.start.value = v50.duration.value,
        *(void *)&time1.start.int timescale = *(void *)&v50.duration.timescale,
        time1.start.epoch = 0,
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48],
        time2.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16),
        !CMTimeCompare(&time1.start, &time2.start)))
  {
    v46.CMTime start = start;
    *(_OWORD *)&time2.start.value = PXStoryTimeZero;
    time2.start.epoch = 0;
    CMTimeRangeMake(&time1, &time2.start, &v46.start);
    CMTimeRange v50 = time1;
  }
  if (([v7 mediaSubtypes] & 0x20000) != 0)
  {
    id v8 = v7;
    double v9 = objc_msgSend(v8, "px_storyResourceFetchVideoAdjustments");

    if ([v9 hasSlowMotionAdjustments])
    {
      memset(&time1, 0, sizeof(time1));
      if (v9) {
        [v9 slowMotionTimeRange];
      }
      double v10 = (void *)MEMORY[0x1E4F8CDA0];
      time2.CMTime start = start;
      double Seconds = CMTimeGetSeconds(&time2.start);
      [v9 slowMotionRate];
      LODWORD(v13) = v12;
      CMTimeRange time2 = time1;
      double v14 = [v10 timeRangeMapperForSourceDuration:&time2 slowMotionRate:1 slowMotionTimeRange:Seconds forExport:v13];
      if (v14)
      {
        time2.CMTime start = start;
        Float64 v15 = CMTimeGetSeconds(&time2.start);
        *(float *)&Float64 v15 = v15;
        [v14 scaledTimeForOriginalTime:v15];
        Float64 v17 = v16;
        *(_OWORD *)&time2.start.value = *(_OWORD *)&time1.start.value;
        time2.start.epoch = time1.start.epoch;
        Float64 v18 = CMTimeGetSeconds(&time2.start);
        *(float *)&Float64 v18 = v18;
        [v14 scaledTimeForOriginalTime:v18];
        Float64 v20 = v19;
        CMTimeRange time2 = time1;
        CMTimeRangeGetEnd(&time, &time2);
        Float64 v21 = CMTimeGetSeconds(&time);
        *(float *)&Float64 v21 = v21;
        [v14 scaledTimeForOriginalTime:v21];
        Float64 v23 = v22;
        CMTimeMakeWithSeconds(&time2.start, v17, 600);
        CMTime start = time2.start;
        CMTimeMakeWithSeconds(&time2.start, v20, 600);
        *(_OWORD *)&v50.start.value = *(_OWORD *)&time2.start.value;
        v50.start.epoch = time2.start.epoch;
        CMTimeMakeWithSeconds(&v47, v23, 600);
        *(_OWORD *)&v46.start.value = *(_OWORD *)&v50.start.value;
        v46.start.epoch = v50.start.epoch;
        time2.CMTime start = v47;
        CMTimeSubtract(&v48, &time2.start, &v46.start);
        v50.CMTime duration = v48;
LABEL_21:

        goto LABEL_22;
      }
      long long v25 = PLStoryGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [v8 uuid];
        time2.CMTime start = start;
        objc_super v27 = PXStoryTimeDescription(&time2.start);
        CMTimeRange time2 = time1;
        v28 = PXStoryTimeRangeDescription((uint64_t)&time2);
        LODWORD(time2.start.value) = 138543874;
        *(CMTimeValue *)((char *)&time2.start.value + 4) = (CMTimeValue)v26;
        LOWORD(time2.start.flags) = 2114;
        *(void *)((char *)&time2.start.flags + 2) = v27;
        HIWORD(time2.start.epoch) = 2114;
        time2.duration.value = (CMTimeValue)v28;
        _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_INFO, "Invalid slomo adjustment for video asset %{public}@, duration: %{public}@, slomo range: %{public}@, ignored.", (uint8_t *)&time2, 0x20u);
      }
    }
    else
    {
      double v14 = PLStoryGetLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      long long v24 = [v8 uuid];
      time1.CMTime start = start;
      long long v25 = PXStoryTimeDescription(&time1.start);
      LODWORD(time1.start.value) = 138543618;
      *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v24;
      LOWORD(time1.start.flags) = 2114;
      *(void *)((char *)&time1.start.flags + 2) = v25;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_INFO, "Missing slomo adjustment for video asset %{public}@, duration: %{public}@, ignored.", (uint8_t *)&time1, 0x16u);
    }
    goto LABEL_21;
  }
LABEL_22:
  memset(&time1, 0, sizeof(time1));
  CMTimeRange time2 = v50;
  [a1 defaultHighlightRangeForPlaybackRange:&time2];
  id v29 = v7;
  objc_msgSend(v29, "px_storyResourceFetchBestPlaybackRect");
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  id v38 = v29;
  v39 = objc_msgSend(v38, "px_storyResourceFetchNormalizationData");

  [v38 audioScore];
  int v41 = v40;
  id v42 = objc_alloc((Class)a1);
  CMTime v48 = start;
  CMTimeRange time2 = v50;
  CMTimeRange v46 = time1;
  LODWORD(v43) = v41;
  v44 = objc_msgSend(v42, "initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:", &v48, &time2, &v46, v39, v31, v33, v35, v37, v43);

  return v44;
}

+ (id)movieHighlightCurationForDisplayAsset:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 mediaType] == 2)
  {
    id v5 = [a1 movieHighlightCurationForVideoAsset:v4];
  }
  else if ([v4 mediaType] == 1 && (objc_msgSend(v4, "mediaSubtypes") & 8) != 0)
  {
    id v5 = [a1 movieHighlightCurationForLivePhotoAsset:v4];
  }
  else
  {
    id v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = [v4 uuid];
      int v10 = 138543874;
      double v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = [v4 mediaType];
      __int16 v14 = 2048;
      uint64_t v15 = [v4 mediaSubtypes];
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Cannot form fallback movie highlight curation for asset %{public}@ type=%lu/%lu", (uint8_t *)&v10, 0x20u);
    }
    id v5 = objc_alloc_init((Class)a1);
  }
  id v8 = v5;

  return v8;
}

+ ($28FEB1B56BB3ED5175BFC6DE64DE503F)defaultHighlightRangeForPlaybackRange:(SEL)a3
{
  long long v5 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  memset(&v13, 0, sizeof(v13));
  [a2 maxHighlightDuration];
  CMTime time1 = (CMTime)retstr->var1;
  CMTime time2 = v13;
  result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeCompare(&time1, &time2);
  if ((int)result >= 1)
  {
    memset(&v12, 0, sizeof(v12));
    CMTime time1 = (CMTime)retstr->var1;
    CMTimeMultiplyByRatio(&v11, &time1, 1, 2);
    CMTime time1 = (CMTime)retstr->var0;
    CMTime time2 = v11;
    CMTimeAdd(&v12, &time1, &time2);
    long long v7 = *(_OWORD *)&v13.value;
    *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&v13.value;
    CMTimeEpoch epoch = v13.epoch;
    retstr->var1.var3 = v13.epoch;
    *(_OWORD *)&time1.value = v7;
    time1.CMTimeEpoch epoch = epoch;
    CMTimeMultiplyByRatio(&v9, &time1, 1, 2);
    CMTime time1 = v12;
    CMTime time2 = v9;
    result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeSubtract(&v10, &time1, &time2);
    retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v10;
  }
  return result;
}

+ (void)setMaxHighlightDuration:(id *)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  int64_t var3 = a3->var3;
  s_maxHighlightDuration = *(_OWORD *)&a3->var0;
  qword_1E9878600 = var3;
  objc_sync_exit(obj);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxHighlightDuration
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  id v4 = a2;
  objc_sync_enter(v4);
  if ((BYTE12(s_maxHighlightDuration) & 1) == 0)
  {
    long long v8 = 0u;
    long long v5 = +[PXStoryAutoEditConfigurationFactory autoEditConfiguration];
    id v6 = v5;
    if (v5) {
      [v5 maximumDurations];
    }
    else {
      long long v8 = 0u;
    }

    s_maxHighlightDuration = v8;
    qword_1E9878600 = 0;
  }
  *(_OWORD *)&retstr->var0 = s_maxHighlightDuration;
  retstr->int64_t var3 = qword_1E9878600;
  objc_sync_exit(v4);

  return result;
}

@end