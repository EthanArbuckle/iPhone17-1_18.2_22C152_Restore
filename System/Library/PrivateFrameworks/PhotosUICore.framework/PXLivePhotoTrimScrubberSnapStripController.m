@interface PXLivePhotoTrimScrubberSnapStripController
- (BOOL)allowStartEndTimeSnapIndicators;
- (PXLivePhotoTrimScrubber)trimScrubber;
- (PXLivePhotoTrimScrubberSnapStripControllerSpec)spec;
- (PXSnapStripView)snapStripView;
- (id)_snapIndicatorInfosForTimes:(id)a3 currentTime:(id *)a4 style:(unint64_t)a5 skipSingleIndicatorWithCurrentTime:(BOOL)a6 skipDefaultTimeIndicator:(BOOL)a7;
- (id)_snapIndicatorInfosForTimes:(id)a3 currentTime:(id *)a4 suggestedTime:(id *)a5 style:(unint64_t)a6 skipSingleIndicatorWithCurrentTime:(BOOL)a7 skipDefaultTimeIndicator:(BOOL)a8;
- (void)setAllowStartEndTimeSnapIndicators:(BOOL)a3;
- (void)setSnapStripView:(id)a3;
- (void)setSpec:(id)a3;
- (void)setTrimScrubber:(id)a3;
- (void)snapStripViewNeedsDisplay;
- (void)updateSnapStripView;
- (void)updateSnapStripViewAnimated:(BOOL)a3;
@end

@implementation PXLivePhotoTrimScrubberSnapStripController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapStripView, 0);
  objc_storeStrong((id *)&self->_trimScrubber, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setAllowStartEndTimeSnapIndicators:(BOOL)a3
{
  self->_allowStartEndTimeSnapIndicators = a3;
}

- (BOOL)allowStartEndTimeSnapIndicators
{
  return self->_allowStartEndTimeSnapIndicators;
}

- (void)setSnapStripView:(id)a3
{
}

- (PXSnapStripView)snapStripView
{
  return self->_snapStripView;
}

- (void)setTrimScrubber:(id)a3
{
}

- (PXLivePhotoTrimScrubber)trimScrubber
{
  return self->_trimScrubber;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
  [(PXLivePhotoTrimScrubberSnapStripController *)self updateSnapStripView];
}

- (PXLivePhotoTrimScrubberSnapStripControllerSpec)spec
{
  spec = self->_spec;
  if (!spec)
  {
    v4 = objc_opt_new();
    [(PXLivePhotoTrimScrubberSnapStripController *)self setSpec:v4];

    spec = self->_spec;
  }
  return spec;
}

- (void)snapStripViewNeedsDisplay
{
}

- (void)updateSnapStripViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PXLivePhotoTrimScrubberSnapStripController *)self trimScrubber];
  v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v5 currentlyInteractingElement];
  if ((unint64_t)(v7 - 3) < 2)
  {
    v8 = [v5 snapKeyTimes];
    if (v5)
    {
      [v5 keyTime];
      [v5 suggestedKeyTime];
    }
    else
    {
      memset(v36, 0, sizeof(v36));
      memset(v35, 0, sizeof(v35));
    }
    v10 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
    uint64_t v11 = [v10 alwaysShowKeyTime] ^ 1;
    v12 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
    v13 = -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v8, v36, v35, 0, v11, [v12 showDefaultKeyTime] ^ 1);
    [v6 addObjectsFromArray:v13];

    goto LABEL_32;
  }
  if (v7 == 1)
  {
    if ([(PXLivePhotoTrimScrubberSnapStripController *)self allowStartEndTimeSnapIndicators])
    {
      v8 = [v5 snapTrimStartTimes];
      if (v5) {
        [v5 trimStartTime];
      }
      else {
        memset(v34, 0, sizeof(v34));
      }
      v10 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
      uint64_t v17 = [v10 showDefaultKeyTime] ^ 1;
      v18 = v34;
      goto LABEL_31;
    }
  }
  else if (v7 == 2)
  {
    if ([(PXLivePhotoTrimScrubberSnapStripController *)self allowStartEndTimeSnapIndicators])
    {
      v8 = [v5 snapTrimEndTimes];
      if (v5) {
        [v5 trimEndTime];
      }
      else {
        memset(v33, 0, sizeof(v33));
      }
      v10 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
      uint64_t v17 = [v10 showDefaultKeyTime] ^ 1;
      v18 = v33;
LABEL_31:
      v12 = [(PXLivePhotoTrimScrubberSnapStripController *)self _snapIndicatorInfosForTimes:v8 currentTime:v18 style:1 skipSingleIndicatorWithCurrentTime:1 skipDefaultTimeIndicator:v17];
      [v6 addObjectsFromArray:v12];
LABEL_32:
    }
  }
  else
  {
    if ([v5 playheadStyle])
    {
      v9 = [v5 snapKeyTimes];
      if (v5)
      {
        [v5 keyTime];
        [v5 suggestedKeyTime];
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        uint64_t v27 = 0;
      }
      v14 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
      v15 = -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:suggestedTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v9, &v30, &v27, 0, 0, [v14 showDefaultKeyTime] ^ 1);
      [v6 addObjectsFromArray:v15];
    }
    if ([(PXLivePhotoTrimScrubberSnapStripController *)self allowStartEndTimeSnapIndicators])
    {
      v16 = [v5 snapTrimStartTimes];
      if (v5)
      {
        [v5 trimStartTime];
      }
      else
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = 0;
      }
      v19 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
      v20 = -[PXLivePhotoTrimScrubberSnapStripController _snapIndicatorInfosForTimes:currentTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:](self, "_snapIndicatorInfosForTimes:currentTime:style:skipSingleIndicatorWithCurrentTime:skipDefaultTimeIndicator:", v16, &v24, 1, 1, [v19 showDefaultKeyTime] ^ 1);
      [v6 addObjectsFromArray:v20];

      v8 = [v5 snapTrimEndTimes];
      if (v5)
      {
        [v5 trimEndTime];
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
      v10 = [(PXLivePhotoTrimScrubberSnapStripController *)self spec];
      uint64_t v17 = [v10 showDefaultKeyTime] ^ 1;
      v18 = &v21;
      goto LABEL_31;
    }
  }
  [(PXSnapStripView *)self->_snapStripView setIndicatorInfos:v6 animated:v3];
}

- (void)updateSnapStripView
{
}

- (id)_snapIndicatorInfosForTimes:(id)a3 currentTime:(id *)a4 suggestedTime:(id *)a5 style:(unint64_t)a6 skipSingleIndicatorWithCurrentTime:(BOOL)a7 skipDefaultTimeIndicator:(BOOL)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15 = self->_trimScrubber;
  if ([(PXLivePhotoTrimScrubber *)v15 isAssetDurationLoaded]
    && ([(PXLivePhotoTrimScrubber *)v15 bounds], v16 != 0.0))
  {
    id v17 = [MEMORY[0x1E4F1CA48] array];
    if ([v14 count])
    {
      BOOL v31 = [(PXLivePhotoTrimScrubber *)v15 isDisabled];
      long long v53 = 0uLL;
      uint64_t v54 = 0;
      v19 = [v14 firstObject];
      v20 = v19;
      if (v19)
      {
        [v19 CMTimeValue];
      }
      else
      {
        long long v53 = 0uLL;
        uint64_t v54 = 0;
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __166__PXLivePhotoTrimScrubberSnapStripController__snapIndicatorInfosForTimes_currentTime_suggestedTime_style_skipSingleIndicatorWithCurrentTime_skipDefaultTimeIndicator___block_invoke;
      aBlock[3] = &unk_1E5DAEB58;
      long long v46 = v53;
      uint64_t v47 = v54;
      long long v48 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      BOOL v50 = a7;
      id v21 = v14;
      BOOL v51 = a8;
      id v41 = v21;
      v42 = self;
      BOOL v52 = v31;
      v43 = v15;
      unint64_t v45 = a6;
      id v17 = v17;
      id v44 = v17;
      uint64_t v22 = _Block_copy(aBlock);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v55 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v37 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            long long v34 = 0uLL;
            int64_t v35 = 0;
            if (v28) {
              [v28 CMTimeValue];
            }
            uint64_t v29 = (void (*)(void *, long long *, void))v22[2];
            long long v32 = v34;
            int64_t v33 = v35;
            v29(v22, &v32, 0);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v55 count:16];
        }
        while (v25);
      }

      if (a5->var2)
      {
        uint64_t v30 = (void (*)(void *, long long *, uint64_t))v22[2];
        long long v34 = *(_OWORD *)&a5->var0;
        int64_t v35 = a5->var3;
        v30(v22, &v34, 1);
      }
    }
  }
  else
  {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

void __166__PXLivePhotoTrimScrubberSnapStripController__snapIndicatorInfosForTimes_currentTime_suggestedTime_style_skipSingleIndicatorWithCurrentTime_skipDefaultTimeIndicator___block_invoke(uint64_t a1, CMTime *a2, char a3)
{
  CMTime time1 = *a2;
  CMTime v21 = *(CMTime *)(a1 + 72);
  int32_t v6 = CMTimeCompare(&time1, &v21);
  CMTime time1 = *a2;
  CMTime v21 = *(CMTime *)(a1 + 96);
  int32_t v7 = CMTimeCompare(&time1, &v21);
  CMTime time1 = *a2;
  CMTime v21 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v8 = CMTimeCompare(&time1, &v21);
  if ((!*(unsigned char *)(a1 + 120) || v7 || v6 || [*(id *)(a1 + 32) count] != 1)
    && (!*(unsigned char *)(a1 + 121) || v8))
  {
    v9 = [*(id *)(a1 + 40) spec];
    v10 = v9;
    if (*(unsigned char *)(a1 + 122))
    {
      uint64_t v11 = [v9 disabledColor];
    }
    else if (a3)
    {
      uint64_t v11 = [v9 suggestedMarkerColor];
    }
    else if ([*(id *)(a1 + 32) count] == 1 || v6)
    {
      uint64_t v11 = [v10 currentPositionMarkerColor];
    }
    else
    {
      uint64_t v11 = [v10 originalPositionMarkerColor];
    }
    v12 = (void *)v11;
    v13 = *(void **)(a1 + 48);
    CMTime time1 = *a2;
    [v13 horizontalOffsetForTime:&time1];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "convertPoint:fromView:", *(void *)(a1 + 48));
    double v15 = v14;
    uint64_t v16 = *(void *)(a1 + 64);
    int v17 = [v10 livePortraitStyle];
    uint64_t v18 = 2;
    if (v6) {
      uint64_t v18 = v16;
    }
    if (v17) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = v16;
    }
    v20 = [[PXSnapStripViewIndicatorInfo alloc] initWithOffset:v12 color:v19 style:v15];
    [*(id *)(a1 + 56) addObject:v20];
  }
}

- (id)_snapIndicatorInfosForTimes:(id)a3 currentTime:(id *)a4 style:(unint64_t)a5 skipSingleIndicatorWithCurrentTime:(BOOL)a6 skipDefaultTimeIndicator:(BOOL)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  long long v9 = *MEMORY[0x1E4F1FA48];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  int32_t v7 = [(PXLivePhotoTrimScrubberSnapStripController *)self _snapIndicatorInfosForTimes:a3 currentTime:&v11 suggestedTime:&v9 style:a5 skipSingleIndicatorWithCurrentTime:a6 skipDefaultTimeIndicator:a7];
  return v7;
}

@end