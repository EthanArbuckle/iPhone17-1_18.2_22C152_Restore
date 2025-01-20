@interface PXCinematicEditController
- (BOOL)canToggleBackToUserFocusState;
- (BOOL)cinematicAdjustmentActive;
- (BOOL)isInAutoFocusState;
- (NSArray)uneditedUserDecisions;
- (NSDictionary)savedManualFocusCinematographyState;
- (NSOrderedSet)focusEventTimes;
- (PHAsset)asset;
- (PLVideoEditSource)editSource;
- (PTCinematographyScript)cinematographyScript;
- (PTCinematographyScriptChanges)scriptChangesDelegate;
- (PXCinematicEditControllerDelegate)delegate;
- (PXFocusTimelineController)focusTimelineDelegate;
- (double)cinematicAperture;
- (double)maximumCinematicAperture;
- (double)metadataAperture;
- (double)minimumCinematicAperture;
- (double)originalAperture;
- (id)axDescriptionForFocusDecisionAtTime:(id *)a3;
- (id)cinematographyState;
- (id)compositionController;
- (int64_t)cinematicDebugMode;
- (void)_updatePortraitVideoAdjustmentFromCinematography;
- (void)cinematographyWasEdited;
- (void)cinematographyWasEditedAtTime:(id *)a3;
- (void)removeFocusDecisionAtTime:(id *)a3;
- (void)resetToAsShotState;
- (void)resetToCinematographyState:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAsset:(id)a3 editSource:(id)a4;
- (void)setCinematicAdjustmentActive:(BOOL)a3;
- (void)setCinematicAperture:(double)a3;
- (void)setCinematicDebugMode:(int64_t)a3;
- (void)setCinematographyScript:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditSource:(id)a3;
- (void)setFocusEventTimes:(id)a3;
- (void)setFocusTimelineDelegate:(id)a3;
- (void)setMetadataAperture:(double)a3;
- (void)setSavedManualFocusCinematographyState:(id)a3;
- (void)setScriptChangesDelegate:(id)a3;
- (void)setUneditedUserDecisions:(id)a3;
- (void)toggleAutoFocusState;
- (void)updateFocusDecisions;
- (void)updateFocusDecisionsAnimatedAtTime:(id *)a3;
@end

@implementation PXCinematicEditController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusEventTimes, 0);
  objc_storeStrong((id *)&self->_uneditedUserDecisions, 0);
  objc_storeStrong((id *)&self->_savedManualFocusCinematographyState, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_cinematographyScript, 0);
  objc_destroyWeak((id *)&self->_focusTimelineDelegate);
  objc_destroyWeak((id *)&self->_scriptChangesDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setFocusEventTimes:(id)a3
{
}

- (NSOrderedSet)focusEventTimes
{
  return self->_focusEventTimes;
}

- (void)setUneditedUserDecisions:(id)a3
{
}

- (NSArray)uneditedUserDecisions
{
  return self->_uneditedUserDecisions;
}

- (void)setSavedManualFocusCinematographyState:(id)a3
{
}

- (NSDictionary)savedManualFocusCinematographyState
{
  return self->_savedManualFocusCinematographyState;
}

- (void)setMetadataAperture:(double)a3
{
  self->_metadataAperture = a3;
}

- (double)metadataAperture
{
  return self->_metadataAperture;
}

- (void)setEditSource:(id)a3
{
}

- (PLVideoEditSource)editSource
{
  return self->_editSource;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setCinematographyScript:(id)a3
{
}

- (PTCinematographyScript)cinematographyScript
{
  return self->_cinematographyScript;
}

- (void)setFocusTimelineDelegate:(id)a3
{
}

- (PXFocusTimelineController)focusTimelineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusTimelineDelegate);
  return (PXFocusTimelineController *)WeakRetained;
}

- (void)setScriptChangesDelegate:(id)a3
{
}

- (PTCinematographyScriptChanges)scriptChangesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scriptChangesDelegate);
  return (PTCinematographyScriptChanges *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXCinematicEditControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCinematicEditControllerDelegate *)WeakRetained;
}

- (id)axDescriptionForFocusDecisionAtTime:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__271823;
  v21 = __Block_byref_object_dispose__271824;
  v22 = &stru_1F00B0030;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  cinematographyScript = self->_cinematographyScript;
  if (cinematographyScript)
  {
    [(PTCinematographyScript *)cinematographyScript timeRange];
    if (BYTE4(v16))
    {
      v6 = self->_cinematographyScript;
      v13[0] = v14;
      v13[1] = v15;
      v13[2] = v16;
      v7 = [(PTCinematographyScript *)v6 userDecisionsInTimeRange:v13];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __65__PXCinematicEditController_axDescriptionForFocusDecisionAtTime___block_invoke;
      v10[3] = &unk_1E5DCEDC0;
      long long v11 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      v10[4] = self;
      v10[5] = &v17;
      [v7 enumerateObjectsUsingBlock:v10];
    }
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __65__PXCinematicEditController_axDescriptionForFocusDecisionAtTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  memset(&v15, 0, sizeof(v15));
  if (v3)
  {
    [v3 time];
    if (v15.flags)
    {
      CMTime time1 = v15;
      CMTime time2 = *(CMTime *)(a1 + 48);
      if (!CMTimeCompare(&time1, &time2))
      {
        v5 = *(void **)(*(void *)(a1 + 32) + 32);
        [v4 time];
        v6 = [v5 frameNearestTime:v12];
        v7 = v6;
        if (v6)
        {
          id v8 = [v6 focusDetection];
          uint64_t v9 = objc_msgSend(MEMORY[0x1E4F921E8], "accessibilityLabelForDetectionType:", objc_msgSend(v8, "detectionType"));
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          long long v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;
        }
      }
    }
  }
}

- (void)resetToCinematographyState:(id)a3
{
  id v4 = a3;
  v5 = [(PXCinematicEditController *)self cinematographyScript];
  [v5 reloadWithChangesDictionary:v4];

  [(PXCinematicEditController *)self cinematographyWasEdited];
}

- (id)cinematographyState
{
  v2 = [(PXCinematicEditController *)self compositionController];
  id v3 = [v2 portraitVideoAdjustmentController];
  id v4 = [v3 cinematographyState];
  v5 = (void *)[v4 copy];

  return v5;
}

- (BOOL)canToggleBackToUserFocusState
{
  id v3 = [(PXCinematicEditController *)self savedManualFocusCinematographyState];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"user_decisions"];
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  if ([(PXCinematicEditController *)self isInAutoFocusState])
  {
    if ([v7 count])
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v9 = [(PXCinematicEditController *)self uneditedUserDecisions];
      BOOL v8 = [v9 count] != 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isInAutoFocusState
{
  v2 = [(PXCinematicEditController *)self cinematographyScript];
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  CMTimeRangeMake(&v7, &start, &v5);
  id v3 = [v2 userDecisionsInTimeRange:&v7];

  LOBYTE(v2) = [v3 count] == 0;
  return (char)v2;
}

- (void)toggleAutoFocusState
{
  if ([(PXCinematicEditController *)self isInAutoFocusState])
  {
    id v5 = [(PXCinematicEditController *)self savedManualFocusCinematographyState];
    [(PXCinematicEditController *)self resetToCinematographyState:v5];
  }
  else
  {
    id v3 = [(PXCinematicEditController *)self cinematographyState];
    [(PXCinematicEditController *)self setSavedManualFocusCinematographyState:v3];

    uint64_t v4 = [(PXCinematicEditController *)self cinematographyScript];
    [v4 removeAllUserDecisions];

    [(PXCinematicEditController *)self cinematographyWasEdited];
  }
}

- (void)resetToAsShotState
{
}

- (double)maximumCinematicAperture
{
  return 16.0;
}

- (double)minimumCinematicAperture
{
  return 2.0;
}

- (id)compositionController
{
  v2 = [(PXCinematicEditController *)self delegate];
  id v3 = [v2 compositionController];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTimeRange v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "PXCinematicEditController: Could not get composition controller", v7, 2u);
    }
  }
  return v3;
}

- (void)setCinematicAperture:(double)a3
{
  id v5 = [(PXCinematicEditController *)self compositionController];
  v6 = [v5 adjustmentConstants];
  CMTimeRange v7 = [v6 PIPortraitVideoAdjustmentKey];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PXCinematicEditController_setCinematicAperture___block_invoke;
  v8[3] = &unk_1E5DCED98;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  [v5 modifyAdjustmentWithKey:v7 modificationBlock:v8];
}

void __50__PXCinematicEditController_setCinematicAperture___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) originalAperture];
  if (vabdd_f64(v3, *(double *)(a1 + 40)) <= 0.1)
  {
    [v5 setAperture:0];
  }
  else
  {
    id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v5 setAperture:v4];
  }
}

- (void)removeFocusDecisionAtTime:(id *)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  cinematographyScript = self->_cinematographyScript;
  if (cinematographyScript
    && ([(PTCinematographyScript *)cinematographyScript timeRange], (BYTE4(v16) & 1) != 0))
  {
    CMTimeRange v7 = self->_cinematographyScript;
    *(_OWORD *)buf = v14;
    long long v12 = v15;
    long long v13 = v16;
    v6 = [(PTCinematographyScript *)v7 userDecisionsInTimeRange:buf];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PXCinematicEditController_removeFocusDecisionAtTime___block_invoke;
    v8[3] = &unk_1E5DCED70;
    long long v9 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    v8[4] = self;
    [v6 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    v6 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Cinematography script time range invalid", buf, 2u);
    }
  }
}

void __55__PXCinematicEditController_removeFocusDecisionAtTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  memset(&v15, 0, sizeof(v15));
  if (v3)
  {
    [v3 time];
    if (v15.flags)
    {
      CMTime time1 = v15;
      CMTime v13 = *(CMTime *)(a1 + 40);
      if (!CMTimeCompare(&time1, &v13))
      {
        id v5 = [*(id *)(a1 + 32) delegate];
        char v6 = objc_opt_respondsToSelector();

        CMTimeRange v7 = *(id **)(a1 + 32);
        if (v6)
        {
          BOOL v8 = [v7 delegate];
          [v8 removeUserDecision:v4];
        }
        else
        {
          [v7[4] removeUserDecision:v4];
        }
        [*(id *)(a1 + 32) cinematographyWasEdited];
        long long v9 = [*(id *)(a1 + 32) cinematographyState];
        [*(id *)(a1 + 32) setSavedManualFocusCinematographyState:v9];

        uint64_t v10 = [*(id *)(a1 + 32) delegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          long long v12 = [*(id *)(a1 + 32) delegate];
          [v12 didRemoveUserDecision];
        }
      }
    }
  }
}

- (void)setCinematicDebugMode:(int64_t)a3
{
  id v4 = [(PXCinematicEditController *)self compositionController];
  id v5 = [v4 adjustmentConstants];
  char v6 = [v5 PIPortraitVideoAdjustmentKey];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PXCinematicEditController_setCinematicDebugMode___block_invoke;
  v7[3] = &__block_descriptor_40_e45_v16__0__PIPortraitVideoAdjustmentController_8l;
  v7[4] = a3;
  [v4 modifyAdjustmentWithKey:v6 modificationBlock:v7];
}

uint64_t __51__PXCinematicEditController_setCinematicDebugMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDebugMode:*(void *)(a1 + 32)];
}

- (int64_t)cinematicDebugMode
{
  v2 = [(PXCinematicEditController *)self compositionController];
  id v3 = [v2 portraitVideoAdjustmentController];
  int64_t v4 = [v3 debugMode];

  return v4;
}

- (double)originalAperture
{
  [(PTCinematographyScript *)self->_cinematographyScript userAperture];
  return v2;
}

- (double)cinematicAperture
{
  id v3 = [(PXCinematicEditController *)self compositionController];
  int64_t v4 = [v3 portraitVideoAdjustmentController];
  id v5 = [v4 aperture];

  if (!v5
    || ([v4 aperture],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v6 doubleValue],
        double v8 = v7,
        v6,
        v8 < 0.8))
  {
    [(PXCinematicEditController *)self originalAperture];
    double v8 = v9;
  }

  return v8;
}

- (BOOL)cinematicAdjustmentActive
{
  float v2 = [(PXCinematicEditController *)self compositionController];
  id v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 portraitVideoAdjustmentController];
    char v5 = [v4 enabled];
  }
  else
  {
    char v6 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "_updatePortraitVideoAdjustmentFromCinematography: Could not get composition controller", v8, 2u);
    }

    char v5 = 0;
  }

  return v5;
}

- (void)setCinematicAdjustmentActive:(BOOL)a3
{
  int64_t v4 = [(PXCinematicEditController *)self compositionController];
  char v5 = v4;
  if (v4)
  {
    char v6 = [v4 adjustmentConstants];
    double v7 = [v6 PIPortraitVideoAdjustmentKey];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PXCinematicEditController_setCinematicAdjustmentActive___block_invoke;
    v8[3] = &__block_descriptor_33_e45_v16__0__PIPortraitVideoAdjustmentController_8l;
    BOOL v9 = a3;
    [v5 modifyAdjustmentWithKey:v7 modificationBlock:v8];
  }
  else
  {
    char v6 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "_updatePortraitVideoAdjustmentFromCinematography: Could not get composition controller", buf, 2u);
    }
  }
}

uint64_t __58__PXCinematicEditController_setCinematicAdjustmentActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)cinematographyWasEditedAtTime:(id *)a3
{
  [(PXCinematicEditController *)self _updatePortraitVideoAdjustmentFromCinematography];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(PXCinematicEditController *)self updateFocusDecisionsAnimatedAtTime:&v5];
}

- (void)cinematographyWasEdited
{
  [(PXCinematicEditController *)self _updatePortraitVideoAdjustmentFromCinematography];
  [(PXCinematicEditController *)self updateFocusDecisions];
}

- (void)updateFocusDecisions
{
  long long v2 = *MEMORY[0x1E4F1F9F8];
  uint64_t v3 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(PXCinematicEditController *)self updateFocusDecisionsAnimatedAtTime:&v2];
}

- (void)updateFocusDecisionsAnimatedAtTime:(id *)a3
{
}

void __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) focusTimelineDelegate];
  [v2 resetTimeline];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v3 && ([v3 timeRange], (BYTE4(v31) & 1) != 0))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [*(id *)(a1 + 32) focusTimelineDelegate];
    *(_OWORD *)buf = v29;
    long long v27 = v30;
    long long v28 = v31;
    [v5 updateFocusTimelineWithTimeRange:buf];

    char v6 = *(void **)(*(void *)(a1 + 32) + 32);
    *(_OWORD *)buf = v29;
    long long v27 = v30;
    long long v28 = v31;
    double v7 = [v6 decisionsInTimeRange:buf];
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_2;
    v20 = &unk_1E5DCED08;
    long long v24 = *(_OWORD *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    id v21 = v7;
    uint64_t v22 = v9;
    id v10 = v8;
    id v23 = v10;
    int64_t v4 = v7;
    [v4 enumerateObjectsUsingBlock:&v17];
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(void **)(v11 + 80);
    *(void *)(v11 + 80) = v10;
    id v13 = v10;

    long long v14 = objc_msgSend(*(id *)(a1 + 32), "focusTimelineDelegate", v17, v18, v19, v20);
    [v14 updateFocusTimeline];

    CMTime v15 = [*(id *)(a1 + 32) focusTimelineDelegate];
    long long v16 = [*(id *)(*(void *)(a1 + 32) + 80) array];
    [v15 didUpdateFocusEventsWithTimes:v16];
  }
  else
  {
    int64_t v4 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Cinematography script time range invalid", buf, 2u);
    }
  }
}

void __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_2(uint64_t a1, void *a2, NSObject *a3)
{
  id v5 = a2;
  char v6 = v5;
  memset(&v23, 0, sizeof(v23));
  if (!v5 || ([v5 time], (v23.flags & 1) == 0))
  {
    a3 = PLPhotoEditGetLog();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1A9AE7000, a3, OS_LOG_TYPE_ERROR, "Cinematography decision time invalid", (uint8_t *)&buf, 2u);
    }
    goto LABEL_23;
  }
  uint64_t v7 = [v6 isUserDecision];
  uint64_t v8 = [v6 groupIdentifier];
  if (a3)
  {
    a3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:(char *)&a3[-1].isa + 7];
  }
  uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v10 = [v9 BOOLForKey:@"disableTimelineAnimations"];

  if (v10)
  {
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = (_OWORD *)(a1 + 56);
  if (*(unsigned char *)(a1 + 68))
  {
    *(_OWORD *)&buf.value = *v11;
    buf.epoch = *(void *)(a1 + 72);
    CMTime time2 = v23;
    BOOL v12 = CMTimeCompare(&buf, &time2) == 0;
    if (!a3) {
      goto LABEL_17;
    }
LABEL_12:
    if (v12) {
      goto LABEL_17;
    }
    [a3 time];
    *(_OWORD *)&buf.value = *v11;
    buf.epoch = *(void *)(a1 + 72);
    if (!CMTimeCompare(&buf, &v21) && [v6 isUserDecision])
    {
      buf.value = 0;
      *(void *)&buf.timescale = &buf;
      buf.epoch = 0x2020000000;
      char v20 = 0;
      id v13 = *(void **)(*(void *)(a1 + 40) + 80);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_3;
      v17[3] = &unk_1E5DCECE0;
      CMTime v18 = v23;
      v17[4] = &buf;
      [v13 enumerateObjectsUsingBlock:v17];
      BOOL v12 = *(unsigned char *)(*(void *)&buf.timescale + 24) == 0;
      _Block_object_dispose(&buf, 8);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  BOOL v12 = 0;
  if (a3) {
    goto LABEL_12;
  }
LABEL_17:
  if (!PTGroupIDIsValid()
    || !a3
    || v7 && ![a3 isUserDecision]
    || v8 != [a3 groupIdentifier])
  {
    long long v14 = [*(id *)(a1 + 40) focusTimelineDelegate];
    CMTime buf = v23;
    [v14 updateFocusTimelineWithEvent:&buf userInitiated:v7 shouldAnimate:v12];

    CMTime v15 = *(void **)(a1 + 48);
    CMTime buf = v23;
    long long v16 = [MEMORY[0x1E4F29238] valueWithCMTime:&buf];
    [v15 addObject:v16];
  }
LABEL_23:
}

void __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = v6;
  if (v6) {
    [v6 CMTimeValue];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime v8 = *(CMTime *)(a1 + 40);
  if (!CMTimeCompare(&time1, &v8))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_updatePortraitVideoAdjustmentFromCinematography
{
  cinematographyScript = self->_cinematographyScript;
  int64_t v4 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  long long v15 = *(_OWORD *)&duration.value;
  CMTimeEpoch epoch = duration.epoch;
  CMTimeRangeMake(&v23, &start, &duration);
  id v6 = [(PTCinematographyScript *)cinematographyScript userDecisionsInTimeRange:&v23];
  uint64_t v7 = [(PXCinematicEditController *)self uneditedUserDecisions];
  char v8 = [v6 isEqualToArray:v7];

  uint64_t v9 = self->_cinematographyScript;
  CMTime start = *v4;
  *(_OWORD *)&duration.value = v15;
  duration.CMTimeEpoch epoch = epoch;
  CMTimeRangeMake(&v20, &start, &duration);
  char v10 = [(PTCinematographyScript *)v9 framesInTimeRange:&v20];
  if ([v10 count])
  {
    uint64_t v11 = [(PXCinematicEditController *)self compositionController];
    BOOL v12 = [v11 adjustmentConstants];

    id v13 = [(PXCinematicEditController *)self compositionController];
    long long v14 = [v12 PIPortraitVideoAdjustmentKey];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__PXCinematicEditController__updatePortraitVideoAdjustmentFromCinematography__block_invoke;
    v16[3] = &unk_1E5DCECB8;
    char v19 = v8;
    id v17 = v10;
    CMTime v18 = self;
    [v13 modifyAdjustmentWithKey:v14 modificationBlock:v16];
  }
  else
  {
    BOOL v12 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(start.value) = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "ERROR: Cinematography returned no frames", (uint8_t *)&start, 2u);
    }
  }
}

void __77__PXCinematicEditController__updatePortraitVideoAdjustmentFromCinematography__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    [v3 setDisparityKeyframes:0];
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = *(id *)(a1 + 32);
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
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F8A370]);
          if (v11) {
            [v11 time];
          }
          else {
            memset(v16, 0, sizeof(v16));
          }
          [v11 focusDistance];
          long long v14 = (void *)[v12 initWithTime:v16 value:v13];
          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    [v4 setDisparityKeyframes:v5];
  }
  long long v15 = [*(id *)(*(void *)(a1 + 40) + 32) changesDictionary];
  if (![v15 count] || *(unsigned char *)(a1 + 48))
  {

    long long v15 = 0;
  }
  [v4 setCinematographyState:v15];
}

- (void)setAsset:(id)a3 editSource:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v7 = (PHAsset *)a3;
  id v8 = a4;
  if (self->_asset != v7)
  {
    uint64_t v9 = [(PXCinematicEditController *)self asset];

    if (v9)
    {
      [(PXCinematicEditController *)self setAsset:0];
      [(PXCinematicEditController *)self setEditSource:0];
      [(PXCinematicEditController *)self setCinematographyScript:0];
    }
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_editSource, a4);
    char v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    focusEventTimes = self->_focusEventTimes;
    self->_focusEventTimes = v10;

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v8 videoURL];
        float v13 = [MEMORY[0x1E4F166C8] assetWithURL:v12];
        if (v13)
        {
          long long v14 = [(PXCinematicEditController *)self cinematographyState];
          BOOL v15 = v14 == 0;

          long long v16 = [(PXCinematicEditController *)self delegate];
          [v16 disableCinematicUIForLoadingAsset];

          id v17 = objc_alloc_init(MEMORY[0x1E4F921F8]);
          [(PXCinematicEditController *)self setCinematographyScript:v17];

          objc_initWeak(location, self);
          long long v18 = dispatch_get_global_queue(25, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __49__PXCinematicEditController_setAsset_editSource___block_invoke;
          block[3] = &unk_1E5DCFD00;
          CMTime v21 = v7;
          uint64_t v22 = self;
          id v23 = v13;
          objc_copyWeak(&v24, location);
          BOOL v25 = v15;
          dispatch_async(v18, block);

          objc_destroyWeak(&v24);
          objc_destroyWeak(location);
        }
        else
        {
          long long v19 = PLPhotoEditGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v12;
            _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "Couldn't create AVAsset for %@", (uint8_t *)location, 0xCu);
          }
        }
      }
      else
      {
        id v12 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v8;
          _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Can't start cinematography for non-video edit source %@", (uint8_t *)location, 0xCu);
        }
      }
    }
  }
}

void __49__PXCinematicEditController_setAsset_editSource___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v2 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)CMTime buf = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Cinematography script load asset: %@", buf, 0xCu);
  }

  int64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [*(id *)(a1 + 40) cinematographyScript];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) cinematographyState];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PXCinematicEditController_setAsset_editSource___block_invoke_32;
  v10[3] = &unk_1E5DCEC90;
  id v8 = v4;
  id v11 = v8;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  char v14 = *(unsigned char *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 40);
  id v9 = (id)[v5 loadWithAsset:v6 changesDictionary:v7 completion:v10];

  objc_destroyWeak(&v13);
}

void __49__PXCinematicEditController_setAsset_editSource___block_invoke_32(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = NSNumber;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");

  id v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Cinematography script load completed with duration: %@", buf, 0xCu);
  }

  objc_copyWeak(&v10, (id *)(a1 + 48));
  char v11 = a2;
  char v12 = *(unsigned char *)(a1 + 56);
  v5;
  px_dispatch_on_main_queue();
}

void __49__PXCinematicEditController_setAsset_editSource___block_invoke_34(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 56))
  {
    int64_t v4 = [WeakRetained cinematographyScript];
    if (isAppleInternal_onceToken_271868 != -1) {
      dispatch_once(&isAppleInternal_onceToken_271868, &__block_literal_global_271869);
    }
    if (isAppleInternal_hasInternalDiagnostics_271870)
    {
      id v5 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
        CMTimeRangeMake(&v14, &start, &duration);
        uint64_t v6 = [v4 framesInTimeRange:&v14];
        LODWORD(start.value) = 138412290;
        *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v6;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Cinematography script allFrames:%@", (uint8_t *)&start, 0xCu);
      }
    }
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 32);
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
      CMTimeRangeMake(&v12, &start, &duration);
      uint64_t v8 = [v7 userDecisionsInTimeRange:&v12];
      [v3 setUneditedUserDecisions:v8];
    }
    [v3 _updatePortraitVideoAdjustmentFromCinematography];
    id v9 = [v3 delegate];
    [v9 cineScriptBecameAvailable:v4];
  }
  else
  {
    id v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CMTimeValue v11 = *(void *)(a1 + 40);
      LODWORD(start.value) = 138412290;
      *(CMTimeValue *)((char *)&start.value + 4) = v11;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Cinematography script failed to load asset: %@", (uint8_t *)&start, 0xCu);
    }

    int64_t v4 = [v3 delegate];
    [v4 cineScriptCouldNotInitializeWithError:*(void *)(a1 + 40)];
  }
}

@end