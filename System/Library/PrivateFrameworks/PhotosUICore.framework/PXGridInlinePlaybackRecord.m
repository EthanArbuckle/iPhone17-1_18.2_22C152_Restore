@interface PXGridInlinePlaybackRecord
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestVideoTimeRange;
- (BOOL)isInvalid;
- (BOOL)isPlaying;
- (NSString)diagnosticLog;
- (NSString)diagnosticScoresDescription;
- (PXDisplayAsset)displayAsset;
- (PXGridInlinePlaybackRecord)initWithDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (PXMediaProvider)mediaProvider;
- (double)cellSizeScore;
- (double)distanceToCenterScore;
- (float)curationScore;
- (float)stickerConfidenceScore;
- (float)videoScore;
- (float)videoStickerSuggestionScore;
- (id)description;
- (id)geometryReference;
- (int64_t)desiredPlayState;
- (int64_t)visibilityScore;
- (void)setBestVideoTimeRange:(id *)a3;
- (void)setCellSizeScore:(double)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDiagnosticLog:(id)a3;
- (void)setDistanceToCenterScore:(double)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setVisibilityScore:(int64_t)a3;
@end

@implementation PXGridInlinePlaybackRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLog, 0);
  objc_storeStrong(&self->_geometryReference, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

- (void)setDiagnosticLog:(id)a3
{
}

- (NSString)diagnosticLog
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setCellSizeScore:(double)a3
{
  self->_cellSizeScore = a3;
}

- (double)cellSizeScore
{
  return self->_cellSizeScore;
}

- (float)stickerConfidenceScore
{
  return self->_stickerConfidenceScore;
}

- (void)setDistanceToCenterScore:(double)a3
{
  self->_distanceToCenterScore = a3;
}

- (double)distanceToCenterScore
{
  return self->_distanceToCenterScore;
}

- (float)videoStickerSuggestionScore
{
  return self->_videoStickerSuggestionScore;
}

- (void)setVisibilityScore:(int64_t)a3
{
  self->_visibilityScore = a3;
}

- (int64_t)visibilityScore
{
  return self->_visibilityScore;
}

- (float)curationScore
{
  return self->_curationScore;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (void)setBestVideoTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_bestVideoTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_bestVideoTimeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestVideoTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var1;
  return self;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  self->_desiredPlayState = a3;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (id)geometryReference
{
  return self->_geometryReference;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (id)description
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXGridInlinePlaybackRecord *)self displayAsset];
  v7 = [(PXGridInlinePlaybackRecord *)self geometryReference];
  v8 = [(PXGridInlinePlaybackRecord *)self diagnosticScoresDescription];
  v9 = [v3 stringWithFormat:@"<%@: %p, displayAsset=%@, geometryReference=%@, %@>", v5, self, v6, v7, v8];

  return v9;
}

- (NSString)diagnosticScoresDescription
{
  long long v3 = NSString;
  int64_t v4 = [(PXGridInlinePlaybackRecord *)self visibilityScore];
  [(PXGridInlinePlaybackRecord *)self cellSizeScore];
  uint64_t v6 = v5;
  [(PXGridInlinePlaybackRecord *)self distanceToCenterScore];
  uint64_t v8 = v7;
  [(PXGridInlinePlaybackRecord *)self videoScore];
  double v10 = v9;
  [(PXGridInlinePlaybackRecord *)self curationScore];
  double v12 = v11;
  [(PXGridInlinePlaybackRecord *)self bestVideoTimeRange];
  v13 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  [(PXGridInlinePlaybackRecord *)self videoStickerSuggestionScore];
  double v15 = v14;
  [(PXGridInlinePlaybackRecord *)self stickerConfidenceScore];
  v17 = [v3 stringWithFormat:@"visibilityScore=%lu, cellSizeScore=%f, distanceToCenterScore=%f, videoScore=%f, curationScore=%f, bestVideoTimeRange=%@, videoStickerSuggestionScore=%f, stickerConfidenceScore=%f", v4, v6, v8, *(void *)&v10, *(void *)&v12, v13, *(void *)&v15, v16];

  return (NSString *)v17;
}

- (BOOL)isPlaying
{
  return [(PXGridInlinePlaybackRecord *)self desiredPlayState] == 1;
}

- (PXGridInlinePlaybackRecord)initWithDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)PXGridInlinePlaybackRecord;
  double v12 = [(PXGridInlinePlaybackRecord *)&v37 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayAsset, a3);
    objc_storeStrong((id *)&v13->_mediaProvider, a4);
    objc_storeStrong(&v13->_geometryReference, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v9;
      [v14 fetchPropertySetsIfNeeded];
      double v15 = [v14 mediaAnalysisProperties];
      [v15 videoScore];
      v13->_videoScore = v16;

      [v14 curationScore];
      *(float *)&double v17 = v17;
      v13->_curationScore = *(float *)&v17;
      v18 = [v14 mediaAnalysisProperties];
      [v18 videoStickerSuggestionScore];
      v13->_videoStickerSuggestionScore = v19;

      v20 = [v14 visualSearchProperties];
      [v20 stickerConfidenceScore];
      v13->_stickerConfidenceScore = v21;

      uint64_t v22 = MEMORY[0x1E4F1FA20];
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&v13->_bestVideoTimeRange.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&v13->_bestVideoTimeRange.start.epoch = v23;
      *(_OWORD *)&v13->_bestVideoTimeRange.duration.timescale = *(_OWORD *)(v22 + 32);
      v24 = [v14 mediaAnalysisProperties];
      [v24 autoplaySuggestionScore];
      float v26 = v25;

      v27 = +[PXCuratedLibrarySettings sharedInstance];
      if ([v27 playBestTimeRange] && v26 > 0.0 && objc_msgSend(v14, "playbackStyle") != 5)
      {
        int v29 = [v14 mediaSubtypes];

        if ((v29 & 0x20000) == 0)
        {
          memset(v36, 0, sizeof(v36));
          long long v35 = 0u;
          v30 = [v14 mediaAnalysisProperties];
          v31 = v30;
          if (v30)
          {
            [v30 bestVideoTimeRange];
          }
          else
          {
            memset(v36, 0, sizeof(v36));
            long long v35 = 0u;
          }

          if ((BYTE12(v35) & 1) != 0
            && (BYTE4(v36[1]) & 1) != 0
            && !*((void *)&v36[1] + 1)
            && (*((void *)&v36[0] + 1) & 0x8000000000000000) == 0)
          {
            CMTime time1 = *(CMTime *)((char *)v36 + 8);
            CMTime v33 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            if (CMTimeCompare(&time1, &v33) >= 1)
            {
              long long v32 = v36[0];
              *(_OWORD *)&v13->_bestVideoTimeRange.start.value = v35;
              *(_OWORD *)&v13->_bestVideoTimeRange.start.epoch = v32;
              *(_OWORD *)&v13->_bestVideoTimeRange.duration.timescale = v36[1];
            }
          }
        }
      }
      else
      {
      }
    }
  }

  return v13;
}

@end