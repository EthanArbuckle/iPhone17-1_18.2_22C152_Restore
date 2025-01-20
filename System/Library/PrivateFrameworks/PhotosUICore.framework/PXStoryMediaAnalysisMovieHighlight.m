@interface PXStoryMediaAnalysisMovieHighlight
+ (float)fractionOfResults:(id)a3 inRange:(id *)a4;
+ (id)defaultHighlightFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4;
+ (id)fullMovieFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4;
+ (id)livePhotoFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4;
+ (id)movieHighlightsFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4;
+ (id)movieSummaryFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_bestTimeRangeForMinDuration:(SEL)a3 maxDuration:(double)a4;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_bestTimeRangeForRange:(SEL)a3 targetDuration:(id *)a4;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_bestTimeRangeForTargetDuration:(SEL)a3 tolerance:(double)a4;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestTimeRangeForPreferredDuration:(SEL)a3 min:(double)a4 max:(double)a5;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestTimeRangeForTargetDuration:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- (BOOL)hasFace;
- (BOOL)hasFaceInRange:(id *)a3;
- (BOOL)hasMusic;
- (BOOL)hasMusicInRange:(id *)a3;
- (BOOL)hasVoice;
- (BOOL)hasVoiceInRange:(id *)a3;
- (CGRect)bestPlaybackRect;
- (NSData)normalizationData;
- (PXStoryMediaAnalysisMovieHighlight)init;
- (PXStoryMediaAnalysisMovieHighlight)initWithMediaAnalysis:(id)a3 movieHighlightIndex:(int64_t)a4 timeRangeCache:(id)a5;
- (float)audioLoudnessForTimeRange:(id *)a3;
- (float)audioPeakForTimeRange:(id *)a3;
- (float)audioQualityScore;
- (float)loudness;
- (float)peakVolume;
- (float)qualityScore;
- (id)analysisResults;
- (id)faceResults;
- (id)irisRecommendedResults;
- (id)loudnessResults;
- (id)movieHighlightResults;
- (id)movieHighlightScoreResults;
- (id)movieSummaryResults;
- (id)musicResults;
- (id)voiceResults;
@end

@implementation PXStoryMediaAnalysisMovieHighlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieHighlightTimeRangeCache, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

- (CGRect)bestPlaybackRect
{
  switch(self->_highlightIndex)
  {
    case 0xFFFFFFFFFFFFFFFCLL:
    case 0xFFFFFFFFFFFFFFFFLL:
      v7 = [(PXStoryMediaAnalysisMovieHighlight *)self movieSummaryResults];
      v8 = [v7 firstObject];
      double BestPlaybackRect = PXStoryMediaAnalysisResultGetBestPlaybackRect(v8);
      double v4 = v9;
      double v5 = v10;
      double v6 = v11;

      break;
    case 0xFFFFFFFFFFFFFFFDLL:
    case 0xFFFFFFFFFFFFFFFELL:
      double BestPlaybackRect = *MEMORY[0x1E4F1DB20];
      double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      break;
    default:
      v12 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightResults];
      v13 = [v12 objectAtIndexedSubscript:self->_highlightIndex];
      double BestPlaybackRect = PXStoryMediaAnalysisResultGetBestPlaybackRect(v13);
      double v4 = v14;
      double v5 = v15;
      double v6 = v16;

      break;
  }
  double v17 = BestPlaybackRect;
  double v18 = v4;
  double v19 = v5;
  double v20 = v6;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (float)audioQualityScore
{
  int64_t highlightIndex = self->_highlightIndex;
  float v3 = 0.5;
  if ((unint64_t)(highlightIndex + 3) < 2) {
    return v3;
  }
  if (highlightIndex == -4)
  {
    double v5 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightResults];
  }
  else
  {
    if (highlightIndex != -1)
    {
      double v6 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightResults];
      v7 = [v6 objectAtIndexedSubscript:self->_highlightIndex];
      goto LABEL_8;
    }
    double v5 = [(PXStoryMediaAnalysisMovieHighlight *)self movieSummaryResults];
  }
  double v6 = v5;
  v7 = [v5 firstObject];
LABEL_8:
  v8 = v7;
  double v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74470]];
  double v10 = [v9 objectForKeyedSubscript:@"audioQuality"];

  if (v10)
  {
    [v10 floatValue];
    float v3 = v11;
  }

  return v3;
}

- (float)loudness
{
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  [(PXStoryMediaAnalysisMovieHighlight *)self audioLoudnessForTimeRange:&v4];
  return result;
}

- (float)audioLoudnessForTimeRange:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v4 = [(PXStoryMediaAnalysisMovieHighlight *)self loudnessResults];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v36;
    uint64_t v9 = *MEMORY[0x1E4F74470];
    uint64_t v10 = *MEMORY[0x1E4F74498];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
        PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v32, v12);
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        long long v13 = *(_OWORD *)&a3->var0.var3;
        v30[0] = *(_OWORD *)&a3->var0.var0;
        v30[1] = v13;
        v30[2] = *(_OWORD *)&a3->var1.var1;
        if (PXStoryTimeRangeIntersectsTimeRange(v31, v30))
        {
          double v14 = [v12 objectForKeyedSubscript:v9];
          double v15 = [v14 objectForKeyedSubscript:v10];
          double v16 = v15;
          if (v15)
          {
            if (!v7 || ([v15 floatValue], float v18 = v17, objc_msgSend(v7, "floatValue"), v18 > v19))
            {
              id v20 = v16;
              v21 = v7;
              uint64_t v22 = v10;
              uint64_t v23 = v9;
              v24 = v4;
              id v25 = v20;

              id v26 = v25;
              uint64_t v4 = v24;
              uint64_t v9 = v23;
              uint64_t v10 = v22;
              v7 = v26;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  [v7 floatValue];
  float v28 = v27;

  return v28;
}

- (float)peakVolume
{
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  [(PXStoryMediaAnalysisMovieHighlight *)self audioPeakForTimeRange:&v4];
  return result;
}

- (float)audioPeakForTimeRange:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v4 = [(PXStoryMediaAnalysisMovieHighlight *)self loudnessResults];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v36;
    uint64_t v9 = *MEMORY[0x1E4F74470];
    uint64_t v10 = *MEMORY[0x1E4F744A0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
        PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v32, v12);
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        long long v13 = *(_OWORD *)&a3->var0.var3;
        v30[0] = *(_OWORD *)&a3->var0.var0;
        v30[1] = v13;
        v30[2] = *(_OWORD *)&a3->var1.var1;
        if (PXStoryTimeRangeIntersectsTimeRange(v31, v30))
        {
          double v14 = [v12 objectForKeyedSubscript:v9];
          double v15 = [v14 objectForKeyedSubscript:v10];
          double v16 = v15;
          if (v15)
          {
            if (!v7 || ([v15 floatValue], float v18 = v17, objc_msgSend(v7, "floatValue"), v18 > v19))
            {
              id v20 = v16;
              v21 = v7;
              uint64_t v22 = v10;
              uint64_t v23 = v9;
              v24 = v4;
              id v25 = v20;

              id v26 = v25;
              uint64_t v4 = v24;
              uint64_t v9 = v23;
              uint64_t v10 = v22;
              v7 = v26;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  [v7 floatValue];
  float v28 = v27;

  return v28;
}

- (id)loudnessResults
{
  v2 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  float v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74428]];

  return v3;
}

- (BOOL)hasMusic
{
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  return [(PXStoryMediaAnalysisMovieHighlight *)self hasMusicInRange:&v4];
}

- (BOOL)hasMusicInRange:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(PXStoryMediaAnalysisMovieHighlight *)self musicResults];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  [v5 fractionOfResults:v6 inRange:v11];
  float v9 = v8;

  return v9 > 0.5;
}

- (id)musicResults
{
  v2 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  float v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74448]];

  return v3;
}

- (BOOL)hasFace
{
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  return [(PXStoryMediaAnalysisMovieHighlight *)self hasFaceInRange:&v4];
}

- (BOOL)hasFaceInRange:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(PXStoryMediaAnalysisMovieHighlight *)self faceResults];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  [v5 fractionOfResults:v6 inRange:v11];
  float v9 = v8;

  return v9 > 0.5;
}

- (id)faceResults
{
  v2 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  float v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74410]];

  return v3;
}

- (BOOL)hasVoice
{
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  return [(PXStoryMediaAnalysisMovieHighlight *)self hasVoiceInRange:&v4];
}

- (BOOL)hasVoiceInRange:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(PXStoryMediaAnalysisMovieHighlight *)self voiceResults];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  [v5 fractionOfResults:v6 inRange:v11];
  float v9 = v8;

  return v9 > 0.5;
}

- (id)voiceResults
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(NSDictionary *)self->_analysis objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F744D8]];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  [v3 addObjectsFromArray:v8];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F743F0]];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v7;
  }
  [v3 addObjectsFromArray:v11];
  uint64_t v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F743F8]];
  long long v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v7;
  }
  [v3 addObjectsFromArray:v14];
  uint64_t v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74400]];
  double v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v7;
  }
  [v3 addObjectsFromArray:v17];
  uint64_t v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74420]];
  float v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = v7;
  }
  [v3 addObjectsFromArray:v20];

  return v3;
}

- (NSData)normalizationData
{
  if (self->_highlightIndex <= 0xFFFFFFFFFFFFFFFBLL)
  {
    uint64_t v4 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightResults];
    uint64_t v5 = [v4 objectAtIndexedSubscript:self->_highlightIndex];
    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F74470]];
    v2 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F74480]];
  }
  else
  {
    v2 = 0;
  }
  return (NSData *)v2;
}

- (float)qualityScore
{
  switch(self->_highlightIndex)
  {
    case 0xFFFFFFFFFFFFFFFCLL:
      id v3 = [(PXStoryMediaAnalysisMovieHighlight *)self movieSummaryResults];
      uint64_t v4 = v3;
      if (v3) {
        goto LABEL_11;
      }
      float Quality = PXStoryMediaAnalysisResultGetQuality(self->_analysis);
      goto LABEL_13;
    case 0xFFFFFFFFFFFFFFFDLL:
      analysis = self->_analysis;
      return PXStoryMediaAnalysisResultGetQuality(analysis);
    case 0xFFFFFFFFFFFFFFFELL:
      id v3 = [(PXStoryMediaAnalysisMovieHighlight *)self irisRecommendedResults];
      goto LABEL_10;
    case 0xFFFFFFFFFFFFFFFFLL:
      id v3 = [(PXStoryMediaAnalysisMovieHighlight *)self movieSummaryResults];
LABEL_10:
      uint64_t v4 = v3;
LABEL_11:
      uint64_t v5 = [v3 firstObject];
      break;
    default:
      uint64_t v4 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightResults];
      uint64_t v5 = [v4 objectAtIndexedSubscript:self->_highlightIndex];
      break;
  }
  uint64_t v8 = v5;
  float Quality = PXStoryMediaAnalysisResultGetQuality(v5);

LABEL_13:
  return Quality;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestTimeRangeForPreferredDuration:(SEL)a3 min:(double)a4 max:(double)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a4 < a5)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a3, self, @"PXStoryMovieHighlight.m", 687, @"Invalid parameter not satisfying: %@", @"targetDuration >= minDuration" object file lineNumber description];
  }
  if (a4 > a6)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a3, self, @"PXStoryMovieHighlight.m", 688, @"Invalid parameter not satisfying: %@", @"targetDuration <= maxDuration" object file lineNumber description];
  }
  double v12 = fmax(a5, a4 + -1.0);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  double v13 = fmin(a4 + 1.0, a6);
  *(_OWORD *)&retstr->var0.var0 = 0u;
  [(PXStoryMediaAnalysisMovieHighlight *)self _bestTimeRangeForMinDuration:v12 maxDuration:v13];
  *(_OWORD *)time = *(_OWORD *)&retstr->var1.var0;
  *(void *)&time[16] = retstr->var1.var3;
  double Seconds = CMTimeGetSeconds((CMTime *)time);
  if (v12 > a5 && Seconds < a4 + -0.75)
  {
    uint64_t v17 = self;
    double v18 = a5;
    double v19 = a4;
  }
  else
  {
    if (v13 >= a6 || Seconds <= a4 + 0.75) {
      goto LABEL_16;
    }
    uint64_t v17 = self;
    double v18 = a4;
    double v19 = a6;
  }
  [(PXStoryMediaAnalysisMovieHighlight *)v17 _bestTimeRangeForMinDuration:v18 maxDuration:v19];
  long long v20 = *(_OWORD *)&time[16];
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time;
  *(_OWORD *)&retstr->var0.var3 = v20;
  *(_OWORD *)&retstr->var1.var1 = v28;
LABEL_16:
  v21 = PLStoryGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    long long v22 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)time = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&time[16] = v22;
    long long v28 = *(_OWORD *)&retstr->var1.var1;
    uint64_t v23 = PXStoryTimeRangeDescription((uint64_t)time);
    *(_DWORD *)time = 134218754;
    *(double *)&time[4] = a4;
    *(_WORD *)&time[12] = 2048;
    *(double *)&time[14] = a5;
    *(_WORD *)&time[22] = 2048;
    *(double *)&time[24] = a6;
    LOWORD(v28) = 2112;
    *(void *)((char *)&v28 + 2) = v23;
    _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEBUG, "Best range for preferred duration: %0.1f, min: %0.1f, max: %0.1f -> %@", time, 0x2Au);
  }
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_bestTimeRangeForMinDuration:(SEL)a3 maxDuration:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  *(_OWORD *)time = v15;
  *(void *)&time[16] = v16;
  double v9 = fmin(a5, CMTimeGetSeconds((CMTime *)time));
  double v10 = fmin(a4, v9);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  [(PXStoryMediaAnalysisMovieHighlight *)self _bestTimeRangeForTargetDuration:(v9 + v10) * 0.5 tolerance:(v9 - v10) * 0.5];
  uint64_t v11 = PLStoryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)time = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&time[16] = v12;
    long long v18 = *(_OWORD *)&retstr->var1.var1;
    double v13 = PXStoryTimeRangeDescription((uint64_t)time);
    *(_DWORD *)time = 134218498;
    *(double *)&time[4] = v10;
    *(_WORD *)&time[12] = 2048;
    *(double *)&time[14] = v9;
    *(_WORD *)&time[22] = 2112;
    *(void *)&time[24] = v13;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "Best range for min duration: %0.1f, max: %0.1f -> %@", time, 0x20u);
  }
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_bestTimeRangeForTargetDuration:(SEL)a3 tolerance:(double)a4
{
  _OWORD v31[3] = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  [(PXStoryMediaAnalysisMovieHighlight *)self timeRange];
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)time = retstr->var1;
  if (CMTimeGetSeconds((CMTime *)time) > a4)
  {
    double v10 = [MEMORY[0x1E4F744F0] sharedMediaAnalyzer];
    if (self->_highlightIndex < 0)
    {
      CMTimeMakeWithSeconds(&v24, a4, 600);
      long long v21 = *(_OWORD *)&retstr->var0.var3;
      v23[0] = *(_OWORD *)&retstr->var0.var0;
      v23[1] = v21;
      v23[2] = *(_OWORD *)&retstr->var1.var1;
      [(PXStoryMediaAnalysisMovieHighlight *)self _bestTimeRangeForRange:v23 targetDuration:&v24];
      long long v22 = *(_OWORD *)&time[16];
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time;
      *(_OWORD *)&retstr->var0.var3 = v22;
      *(_OWORD *)&retstr->var1.var1 = v26;
    }
    else
    {
      id v11 = objc_alloc((Class)off_1E5DA9660);
      long long v12 = [NSNumber numberWithDouble:a4];
      v31[0] = v12;
      double v13 = [NSNumber numberWithDouble:a5];
      v31[1] = v13;
      uint64_t v14 = [NSNumber numberWithInteger:self->_highlightIndex];
      v31[2] = v14;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
      uint64_t v16 = (void *)[v11 initWithObjects:v15];

      movieHighlightTimeRangeCache = self->_movieHighlightTimeRangeCache;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __80__PXStoryMediaAnalysisMovieHighlight__bestTimeRangeForTargetDuration_tolerance___block_invoke;
      v27[3] = &unk_1E5DC4270;
      double v29 = a4;
      double v30 = a5;
      v27[4] = self;
      id v28 = v10;
      long long v18 = [(NSCache *)movieHighlightTimeRangeCache px_objectForKey:v16 usingPromise:v27];
      uint64_t v19 = v18;
      long long v26 = 0u;
      memset(time, 0, sizeof(time));
      if (v18) {
        [v18 CMTimeRangeValue];
      }
      long long v20 = *(_OWORD *)&time[16];
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time;
      *(_OWORD *)&retstr->var0.var3 = v20;
      *(_OWORD *)&retstr->var1.var1 = v26;
    }
  }
  return result;
}

id __80__PXStoryMediaAnalysisMovieHighlight__bestTimeRangeForTargetDuration_tolerance___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F74570];
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v14[0] = v2;
  v13[1] = *MEMORY[0x1E4F74578];
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v14[1] = v3;
  v13[2] = *MEMORY[0x1E4F74560];
  uint64_t v4 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 16)];
  v14[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6) {
    [v6 postProcessMovieHighlightDuration:*(void *)(*(void *)(a1 + 32) + 8) withOptions:v5];
  }
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:v9];

  return v7;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestTimeRangeForTargetDuration:(SEL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  [(PXStoryMediaAnalysisMovieHighlight *)self _bestTimeRangeForTargetDuration:a4 tolerance:a4 * 0.1];
  uint64_t v6 = PLStoryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    long long v7 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)long long v10 = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v10[16] = v7;
    long long v11 = *(_OWORD *)&retstr->var1.var1;
    uint64_t v8 = PXStoryTimeRangeDescription((uint64_t)v10);
    *(_DWORD *)long long v10 = 134218242;
    *(double *)&v10[4] = a4;
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = v8;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Best range for target duration: %0.1f -> %@", v10, 0x16u);
  }
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_bestTimeRangeForRange:(SEL)a3 targetDuration:(id *)a4
{
  memset(&v19, 0, sizeof(v19));
  uint64_t v8 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightScoreResults];
  if ([v8 count])
  {
    PXStoryMediaAnalysisResultsGetTimeRange(&v19, v8);
  }
  else
  {
    long long v9 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v19.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v19.start.CMTimeEpoch epoch = v9;
    *(_OWORD *)&v19.duration.timescale = *(_OWORD *)&a4->var1.var1;
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  time1.start = v19.duration;
  CMTime time2 = (CMTime)*a5;
  CMTimeMinimum(&v18, &time1.start, &time2);
  retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var1.var0;
  time1.start.CMTimeEpoch epoch = a4->var1.var3;
  CMTime time2 = (CMTime)retstr->var1;
  CMTimeSubtract(&v16, &time1.start, &time2);
  time1.start = v16;
  CMTimeMultiplyByRatio(&v17, &time1.start, 1, 2);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0.var0;
  time1.start.CMTimeEpoch epoch = a4->var0.var3;
  CMTime time2 = v17;
  CMTimeAdd(&v18, &time1.start, &time2);
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
  long long v10 = *(_OWORD *)&retstr->var0.var3;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)&time1.start.CMTimeEpoch epoch = v10;
  *(_OWORD *)&time1.duration.timescale = *(_OWORD *)&retstr->var1.var1;
  CMTimeRangeGetEnd(&v15, &time1);
  CMTimeRange time1 = v19;
  CMTimeRangeGetEnd(&v14, &time1);
  time1.start = v15;
  CMTime time2 = v14;
  if (CMTimeCompare(&time1.start, &time2) < 1)
  {
    *(_OWORD *)&time1.start.value = *(_OWORD *)&retstr->var0.var0;
    time1.start.CMTimeEpoch epoch = retstr->var0.var3;
    CMTime time2 = v19.start;
    if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
      goto LABEL_8;
    }
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v19.start.value;
    CMTimeEpoch epoch = v19.start.epoch;
  }
  else
  {
    CMTimeRange time1 = v19;
    CMTimeRangeGetEnd(&v13, &time1);
    CMTime time2 = (CMTime)retstr->var1;
    time1.start = v13;
    CMTimeSubtract(&v18, &time1.start, &time2);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v18.value;
    CMTimeEpoch epoch = v18.epoch;
  }
  retstr->var0.var3 = epoch;
LABEL_8:

  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  switch(self->_highlightIndex)
  {
    case 0xFFFFFFFFFFFFFFFCLL:
      uint64_t v5 = [(PXStoryMediaAnalysisMovieHighlight *)self movieSummaryResults];
      if (v5)
      {
        uint64_t v6 = v5;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
        PXStoryMediaAnalysisResultsGetTimeRange(&v26, v5);
        long long v24 = 0uLL;
        uint64_t v25 = 0;
        +[PXStoryFallbackMovieHighlightCuration maxHighlightDuration];
        long long v18 = v26;
        long long v19 = v27;
        long long v20 = v28;
        long long v16 = v24;
        uint64_t v17 = v25;
        [(PXStoryMediaAnalysisMovieHighlight *)self _bestTimeRangeForRange:&v18 targetDuration:&v16];
        long long v7 = v22;
        *(_OWORD *)&retstr->var0.var0 = v21;
        *(_OWORD *)&retstr->var0.var3 = v7;
        long long v8 = v23;
        goto LABEL_9;
      }
      CMTime v14 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightScoreResults];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      PXStoryMediaAnalysisResultsGetTimeRange(&v26, v14);
      long long v18 = v26;
      long long v19 = v27;
      long long v20 = v28;
      +[PXStoryFallbackMovieHighlightCuration defaultHighlightRangeForPlaybackRange:&v18];
      long long v15 = v22;
      *(_OWORD *)&retstr->var0.var0 = v21;
      *(_OWORD *)&retstr->var0.var3 = v15;
      *(_OWORD *)&retstr->var1.var1 = v23;

      uint64_t v6 = 0;
      break;
    case 0xFFFFFFFFFFFFFFFDLL:
      long long v11 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightScoreResults];
      goto LABEL_8;
    case 0xFFFFFFFFFFFFFFFELL:
      long long v11 = [(PXStoryMediaAnalysisMovieHighlight *)self irisRecommendedResults];
      goto LABEL_8;
    case 0xFFFFFFFFFFFFFFFFLL:
      long long v11 = [(PXStoryMediaAnalysisMovieHighlight *)self movieSummaryResults];
LABEL_8:
      uint64_t v6 = v11;
      PXStoryMediaAnalysisResultsGetTimeRange(&v26, v11);
      long long v12 = v27;
      *(_OWORD *)&retstr->var0.var0 = v26;
      *(_OWORD *)&retstr->var0.var3 = v12;
      long long v8 = v28;
LABEL_9:
      *(_OWORD *)&retstr->var1.var1 = v8;
      break;
    default:
      uint64_t v6 = [(PXStoryMediaAnalysisMovieHighlight *)self movieHighlightResults];
      long long v9 = [v6 objectAtIndexedSubscript:self->_highlightIndex];
      PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v26, v9);
      long long v10 = v27;
      *(_OWORD *)&retstr->var0.var0 = v26;
      *(_OWORD *)&retstr->var0.var3 = v10;
      *(_OWORD *)&retstr->var1.var1 = v28;

      break;
  }

  return result;
}

- (id)movieHighlightScoreResults
{
  v2 = [(PXStoryMediaAnalysisMovieHighlight *)self analysisResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74438]];

  return v3;
}

- (id)irisRecommendedResults
{
  v2 = [(PXStoryMediaAnalysisMovieHighlight *)self analysisResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74418]];

  return v3;
}

- (id)movieSummaryResults
{
  v2 = [(PXStoryMediaAnalysisMovieHighlight *)self analysisResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74440]];

  return v3;
}

- (id)movieHighlightResults
{
  v2 = [(PXStoryMediaAnalysisMovieHighlight *)self analysisResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74430]];

  return v3;
}

- (id)analysisResults
{
  return [(NSDictionary *)self->_analysis objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
}

- (PXStoryMediaAnalysisMovieHighlight)initWithMediaAnalysis:(id)a3 movieHighlightIndex:(int64_t)a4 timeRangeCache:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryMediaAnalysisMovieHighlight;
  long long v10 = [(PXStoryMediaAnalysisMovieHighlight *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    analysis = v10->_analysis;
    v10->_analysis = (NSDictionary *)v11;

    v10->_int64_t highlightIndex = a4;
    objc_storeStrong((id *)&v10->_movieHighlightTimeRangeCache, a5);
  }

  return v10;
}

- (PXStoryMediaAnalysisMovieHighlight)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMovieHighlight.m", 544, @"%s is not available as initializer", "-[PXStoryMediaAnalysisMovieHighlight init]");

  abort();
}

+ (float)fractionOfResults:(id)a3 inRange:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__PXStoryMediaAnalysisMovieHighlight_fractionOfResults_inRange___block_invoke;
  _OWORD v31[3] = &__block_descriptor_80_e29_B32__0__NSDictionary_8Q16_B24l;
  long long v6 = *(_OWORD *)&a4->var0.var3;
  long long v32 = *(_OWORD *)&a4->var0.var0;
  long long v33 = v6;
  long long v34 = *(_OWORD *)&a4->var1.var1;
  long long v7 = [v5 indexesOfObjectsPassingTest:v31];
  id v8 = [v5 objectsAtIndexes:v7];

  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_422];
  *(_OWORD *)&v30.value = PXStoryTimeZero;
  v30.CMTimeEpoch epoch = 0;
  v29.CMTimeEpoch epoch = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  *(_OWORD *)&v29.value = PXStoryTimeZero;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        memset(&v24, 0, sizeof(v24));
        PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v24, v14);
        CMTimeRange time2 = v24;
        long long v15 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)long long v21 = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&v21[16] = v15;
        long long v22 = *(_OWORD *)&a4->var1.var1;
        PXStoryTimeRangeIntersection(&time2, v21, &range);
        CMTimeRange v24 = range;
        *(_OWORD *)long long v21 = PXStoryTimeZero;
        *(void *)&v21[16] = 0;
        CMTimeRangeGetEnd(&v20, &range);
        time2.start = v29;
        range.start = v20;
        if (CMTimeCompare(&range.start, &time2.start) >= 1)
        {
          range.start = v29;
          *(_OWORD *)&time2.start.value = *(_OWORD *)&v24.start.value;
          time2.start.CMTimeEpoch epoch = v24.start.epoch;
          if (CMTimeCompare(&range.start, &time2.start) <= 0)
          {
            *(CMTime *)long long v21 = v24.duration;
          }
          else
          {
            CMTimeRange range = v24;
            CMTimeRangeGetEnd(&v19, &range);
            time2.start = v29;
            range.start = v19;
            CMTimeSubtract((CMTime *)v21, &range.start, &time2.start);
          }
          CMTimeRange range = v24;
          CMTimeRangeGetEnd(&v29, &range);
          range.start = v30;
          *(_OWORD *)&time2.start.value = *(_OWORD *)v21;
          time2.start.CMTimeEpoch epoch = *(void *)&v21[16];
          CMTimeAdd(&v30, &range.start, &time2.start);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v11);
  }
  range.start = v30;
  double Seconds = CMTimeGetSeconds(&range.start);
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var1.var0;
  range.start.CMTimeEpoch epoch = a4->var1.var3;
  double v17 = CMTimeGetSeconds(&range.start);

  return Seconds / v17;
}

BOOL __64__PXStoryMediaAnalysisMovieHighlight_fractionOfResults_inRange___block_invoke(_OWORD *a1, void *a2)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v7, a2);
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  long long v3 = a1[3];
  v5[0] = a1[2];
  v5[1] = v3;
  v5[2] = a1[4];
  return PXStoryTimeRangeIntersectsTimeRange(v6, v5);
}

uint64_t __64__PXStoryMediaAnalysisMovieHighlight_fractionOfResults_inRange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  id v4 = a3;
  PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v9, a2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v6, v4);

  *(_OWORD *)&time1.value = v9;
  time1.CMTimeEpoch epoch = v10;
  *(_OWORD *)&time2.value = v6;
  time2.CMTimeEpoch epoch = v7;
  return CMTimeCompare(&time1, &time2);
}

+ (id)defaultHighlightFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74440]];
  long long v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74438]];
  if ([v8 count] || objc_msgSend(v9, "count")) {
    long long v10 = [[PXStoryMediaAnalysisMovieHighlight alloc] initWithMediaAnalysis:v5 movieHighlightIndex:-4 timeRangeCache:v6];
  }
  else {
    long long v10 = 0;
  }

  return v10;
}

+ (id)fullMovieFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74438]];
  if ([v8 count]) {
    long long v9 = [[PXStoryMediaAnalysisMovieHighlight alloc] initWithMediaAnalysis:v5 movieHighlightIndex:-3 timeRangeCache:v6];
  }
  else {
    long long v9 = 0;
  }

  return v9;
}

+ (id)livePhotoFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74418]];
  if ([v8 count]) {
    long long v9 = [[PXStoryMediaAnalysisMovieHighlight alloc] initWithMediaAnalysis:v5 movieHighlightIndex:-2 timeRangeCache:v6];
  }
  else {
    long long v9 = 0;
  }

  return v9;
}

+ (id)movieSummaryFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74440]];
  if ([v8 count]) {
    long long v9 = [[PXStoryMediaAnalysisMovieHighlight alloc] initWithMediaAnalysis:v5 movieHighlightIndex:-1 timeRangeCache:v6];
  }
  else {
    long long v9 = 0;
  }

  return v9;
}

+ (id)movieHighlightsFromMediaAnalysis:(id)a3 timeRangeCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F744C8]];
  long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F74430]];
  long long v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if ([v8 count])
  {
    unint64_t v10 = 0;
    do
    {
      long long v11 = [[PXStoryMediaAnalysisMovieHighlight alloc] initWithMediaAnalysis:v5 movieHighlightIndex:v10 timeRangeCache:v6];
      [v9 addObject:v11];

      ++v10;
    }
    while (v10 < [v8 count]);
  }

  return v9;
}

@end