@interface PXStoryPacingController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetEndTime;
- ($4B7BA9DB5D00C75F8ECD01506BF85359)currentPacingDecision;
- (BOOL)canChangePlaybackTime;
- (BOOL)isActive;
- (NSString)reasonPreventingPlaybackTimeChange;
- (NSString)targetEndUpdateReason;
- (PXStoryModel)model;
- (PXStoryPacingController)initWithModel:(id)a3 timeSource:(id)a4 cueSource:(id)a5;
- (PXStoryPacingController)initWithObservableModel:(id)a3;
- (PXStoryPacingCueSource)cueSource;
- (PXStoryPacingTimeSource)timeSource;
- (_PXStoryPacingControllerChangeOrigin)modelChangeOrigin;
- (_PXStoryPacingControllerDecisionHistory)pacingDecisionHistory;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (int64_t)timelineVersion;
- (void)_handleTimelineDidChange;
- (void)_invalidateCanChangePlaybackTime;
- (void)_invalidateCurrentPacingDecision;
- (void)_invalidateTargetEndTimeWithReason:(id)a3;
- (void)_updateCanChangePlaybackTime;
- (void)_updateTargetEndTime;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)setCanChangePlaybackTime:(BOOL)a3;
- (void)setCurrentPacingDecision:(id *)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPacingDecisionHistory:(id)a3;
- (void)setReasonPreventingPlaybackTimeChange:(id)a3;
- (void)setTargetEndTime:(id *)a3;
- (void)setTargetEndUpdateReason:(id)a3;
- (void)setTimelineVersion:(int64_t)a3;
- (void)timeSource:(id)a3 didIncrementByTime:(id *)a4;
@end

@implementation PXStoryPacingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pacingDecisionHistory, 0);
  objc_storeStrong((id *)&self->_targetEndUpdateReason, 0);
  objc_storeStrong((id *)&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_reasonPreventingPlaybackTimeChange, 0);
  objc_destroyWeak((id *)&self->_cueSource);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_destroyWeak((id *)&self->_model);
}

- ($4B7BA9DB5D00C75F8ECD01506BF85359)currentPacingDecision
{
  long long v3 = *(_OWORD *)&self[1].var8.var1;
  *(_OWORD *)&retstr->var8.var3 = *(_OWORD *)&self[1].var7;
  *(_OWORD *)&retstr->var10 = v3;
  *(_OWORD *)&retstr->var11.var1 = *(_OWORD *)&self[1].var9;
  long long v4 = *(_OWORD *)&self[1].var4.var0.var3;
  *(_OWORD *)&retstr->var4.var1 = *(_OWORD *)&self[1].var4.var0.var0;
  *(_OWORD *)&retstr->var6.var0 = v4;
  long long v5 = *(_OWORD *)&self[1].var6.var1;
  *(_OWORD *)&retstr->var6.var3 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var8.var0 = v5;
  long long v6 = *(_OWORD *)&self[1].var2.var0;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  *(_OWORD *)&retstr->var3.var0 = v6;
  long long v7 = *(_OWORD *)&self[1].var3.var1;
  *(_OWORD *)&retstr->var3.var3 = *(_OWORD *)&self[1].var2.var3;
  *(_OWORD *)&retstr->var4.var0.var1 = v7;
  long long v8 = *(_OWORD *)&self->var11.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var11.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v8;
  long long v9 = *(_OWORD *)&self[1].var1.var0.var3;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var0.var0;
  *(_OWORD *)&retstr->var1.var1.var3 = v9;
  return self;
}

- (void)setTimelineVersion:(int64_t)a3
{
  self->_timelineVersion = a3;
}

- (int64_t)timelineVersion
{
  return self->_timelineVersion;
}

- (void)setPacingDecisionHistory:(id)a3
{
}

- (_PXStoryPacingControllerDecisionHistory)pacingDecisionHistory
{
  return self->_pacingDecisionHistory;
}

- (void)setTargetEndUpdateReason:(id)a3
{
}

- (NSString)targetEndUpdateReason
{
  return self->_targetEndUpdateReason;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (_PXStoryPacingControllerChangeOrigin)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- (void)setReasonPreventingPlaybackTimeChange:(id)a3
{
}

- (NSString)reasonPreventingPlaybackTimeChange
{
  return self->_reasonPreventingPlaybackTimeChange;
}

- (BOOL)canChangePlaybackTime
{
  return self->_canChangePlaybackTime;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryPacingCueSource)cueSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cueSource);
  return (PXStoryPacingCueSource *)WeakRetained;
}

- (PXStoryPacingTimeSource)timeSource
{
  return self->_timeSource;
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v6 = [(PXStoryPacingController *)self pacingDecisionHistory];
  long long v5 = [v6 descriptionWithShortStyle:0];
  [v4 addAttachmentWithText:v5 name:@"PacingDecisions"];
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v8 = [(PXStoryPacingController *)self cueSource];
  long long v9 = v8;
  if (v8)
  {
    v10 = [v8 audioCueSource];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) == 0)
    {
      long long v39 = 0uLL;
      uint64_t v40 = 0;
      [v9 currentTime];
      v12 = [(PXStoryPacingController *)self pacingDecisionHistory];
      v13 = v12;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      memset(v31, 0, sizeof(v31));
      if (v12)
      {
        long long v29 = v39;
        uint64_t v30 = v40;
        [v12 firstPacingDecisionAfterTime:&v29];
        int v14 = v37;
        if (v37 > 0xAu)
        {
          v15 = @"??";
LABEL_9:
          v16 = v15;
          [v7 appendFormat:@"Transition: %@", v16];

          if ((unint64_t)v32 > 4) {
            v17 = @"Unspecified";
          }
          else {
            v17 = off_1E5DAF518[(void)v32];
          }
          v18 = v17;
          [v7 appendFormat:@"\n       Cue: %@", v18];

          uint64_t v28 = v34;
          v26[0] = *(_OWORD *)((char *)v31 + 8);
          v26[1] = *(_OWORD *)((char *)&v31[1] + 8);
          v26[2] = *(_OWORD *)((char *)&v31[2] + 8);
          long long v27 = v33;
          v19 = objc_msgSend(v9, "diagnosticCueStringForSize:withIndicatorTime:rangeIndicatorTimeRange:", &v27, v26, width, height);
          [v7 appendFormat:@"\n%@\n", v19];

          if (v13) {
            [v13 currentError];
          }
          else {
            memset(&v25, 0, sizeof(v25));
          }
          v20 = PXStoryTimeDescription(&v25);
          [v7 appendFormat:@"\n Overall Time Error: %@\n", v20];

          uint64_t v21 = [v13 onBarCount];
          uint64_t v22 = [v13 decisionCount];
          [v13 onBarPercentage];
          objc_msgSend(v7, "appendFormat:", @"Transitions on bars: %ld / %ld (%.0f%%)\n\n", v21, v22, v23);

          goto LABEL_16;
        }
      }
      else
      {
        int v14 = 0;
      }
      v15 = off_1E5DC5088[v14];
      goto LABEL_9;
    }
  }
  [v7 appendString:@"\n No Cues Found"];
LABEL_16:

  return v7;
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryPacingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PXStoryPacingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5DCEF18;
  v5[4] = self;
  v5[5] = a3;
  [(PXStoryController *)self performChanges:v5];
}

void __45__PXStoryPacingController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ((*(void *)(a1 + 40) & 0x9862421400ALL) != 0) {
    [*(id *)(a1 + 32) _invalidateCanChangePlaybackTime];
  }
  long long v3 = [*(id *)(a1 + 32) model];
  id v4 = [v3 changesOrigins];
  long long v5 = [*(id *)(a1 + 32) modelChangeOrigin];
  char v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if ((v7 & 0x20) != 0)
    {
      [*(id *)(a1 + 32) _invalidateTargetEndTimeWithReason:@"Segment Changed"];
    }
    else if ((v7 & 0x10) != 0)
    {
      [*(id *)(a1 + 32) _handleTimelineDidChange];
    }
  }
}

- (void)_handleTimelineDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__PXStoryPacingController__handleTimelineDidChange__block_invoke;
  v2[3] = &unk_1E5DCEEF0;
  v2[4] = self;
  [(PXStoryController *)self performChanges:v2];
}

uint64_t __51__PXStoryPacingController__handleTimelineDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimelineVersion:", objc_msgSend(*(id *)(a1 + 32), "timelineVersion") + 1);
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateTargetEndTimeWithReason:@"Timeline Changed"];
}

- (void)_invalidateCurrentPacingDecision
{
  memset(v2, 0, sizeof(v2));
  [(PXStoryPacingController *)self setCurrentPacingDecision:v2];
}

- (void)_updateCanChangePlaybackTime
{
  long long v3 = [(PXStoryPacingController *)self model];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke;
  aBlock[3] = &unk_1E5DCEEA8;
  aBlock[4] = self;
  id v4 = v3;
  id v14 = v4;
  long long v5 = (uint64_t (**)(void *, void))_Block_copy(aBlock);
  unint64_t v6 = [v4 readinessStatus];
  BOOL v7 = v6 < 3;
  char v8 = v5[2](v5, v7 & (3u >> (v6 & 7)));
  [(PXStoryPacingController *)self setCanChangePlaybackTime:v5[2](v5, v7)];
  long long v9 = [(PXStoryPacingController *)self model];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke_2;
  v11[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
  char v12 = v8;
  v10 = [(PXStoryPacingController *)self modelChangeOrigin];
  [v9 performChanges:v11 origin:v10];
}

uint64_t __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke(uint64_t a1, int a2)
{
  id v4 = +[PXStorySettings sharedInstance];
  if (([*(id *)(a1 + 32) isActive] & 1) == 0)
  {
    long long v5 = NSString;
    unint64_t v6 = "!self.isActive";
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) desiredPlayState] != 1)
  {
    long long v5 = NSString;
    unint64_t v6 = "model.desiredPlayState != PXStoryDesiredPlayStatePlaying";
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isScrolling])
  {
    long long v5 = NSString;
    unint64_t v6 = "model.isScrolling";
LABEL_7:
    BOOL v7 = [v5 stringWithUTF8String:v6];
    [*(id *)(a1 + 32) setReasonPreventingPlaybackTimeChange:v7];

    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 40) inLiveResize])
  {
    long long v5 = NSString;
    unint64_t v6 = "model.inLiveResize";
    goto LABEL_7;
  }
  if ([v4 playbackShouldWaitForBufferingToBeReady] && a2)
  {
    long long v5 = NSString;
    unint64_t v6 = "isBuffering";
    goto LABEL_7;
  }
  uint64_t v10 = [*(id *)(a1 + 40) viewMode];
  if ([*(id *)(a1 + 40) viewMode] == 4) {
    char v11 = [v4 shouldPauseInStyleSwitcher] ^ 1;
  }
  else {
    char v11 = 0;
  }
  uint64_t v12 = [*(id *)(a1 + 40) viewMode];
  if (v10 != 1 && (v11 & 1) == 0 && v12 != 5)
  {
    long long v5 = NSString;
    unint64_t v6 = "!isFullScreen && !isStyleSwitcher && !isMiniPlayer";
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isTouching])
  {
    long long v5 = NSString;
    unint64_t v6 = "model.isTouching";
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isPerformingViewControllerTransition])
  {
    long long v5 = NSString;
    unint64_t v6 = "model.isPerformingViewControllerTransition";
    goto LABEL_7;
  }
  v13 = *(void **)(a1 + 40);
  uint64_t v16 = 0;
  int v14 = [v13 checkIfShouldPreventAdvancingAndReturnReason:&v16];
  if (v14) {
    uint64_t v15 = v16;
  }
  else {
    uint64_t v15 = 0;
  }
  [*(id *)(a1 + 32) setReasonPreventingPlaybackTimeChange:v15];
  uint64_t v8 = v14 ^ 1u;
LABEL_8:

  return v8;
}

uint64_t __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsActuallyPlaying:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateCanChangePlaybackTime
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCanChangePlaybackTime];
}

- (void)_updateTargetEndTime
{
  long long v3 = [(PXStoryPacingController *)self model];
  id v4 = v3;
  memset(&v19, 0, sizeof(v19));
  if (v3) {
    [v3 nominalPlaybackTime];
  }
  long long v5 = [v4 timeline];
  unint64_t v6 = v5;
  if (v5)
  {
    [v5 timeRange];
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    long long v16 = 0u;
  }
  CMTime v18 = *(CMTime *)((char *)v17 + 8);

  memset(&v15, 0, sizeof(v15));
  CMTime lhs = v18;
  CMTime rhs = v19;
  CMTimeSubtract(&v15, &lhs, &rhs);
  memset(&v14, 0, sizeof(v14));
  BOOL v7 = [(PXStoryPacingController *)self cueSource];
  uint64_t v8 = v7;
  if (v7) {
    [v7 currentTime];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }

  if ((v14.flags & 0x1D) == 1)
  {
    CMTime lhs = v14;
    CMTime rhs = v15;
    CMTimeAdd(&v13, &lhs, &rhs);
    CMTime v12 = v13;
    long long v9 = &v12;
  }
  else
  {
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v9 = (CMTime *)&v10;
  }
  -[PXStoryPacingController setTargetEndTime:](self, "setTargetEndTime:", v9, v10, v11);
}

- (void)_invalidateTargetEndTimeWithReason:(id)a3
{
  id v4 = (void *)[a3 copy];
  [(PXStoryPacingController *)self setTargetEndUpdateReason:v4];

  id v5 = [(PXStoryController *)self updater];
  [v5 setNeedsUpdateOf:sel__updateTargetEndTime];
}

- (void)timeSource:(id)a3 didIncrementByTime:(id *)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  unint64_t v6 = [(PXStoryPacingController *)self model];
  uint64_t v7 = [v6 currentSegmentIdentifier];
  memset(&v92[1], 0, sizeof(CMTime));
  if (v6) {
    [v6 timeIntoCurrentSegment];
  }
  long long v33 = +[PXStorySettings sharedInstance];
  v92[0] = v92[1];
  long long v90 = 0uLL;
  uint64_t v91 = 0;
  if (v6) {
    [v6 timeLeftInCurrentSegment];
  }
  if ([(PXStoryPacingController *)self canChangePlaybackTime])
  {
    uint64_t v8 = [v6 timeline];
    uint64_t v31 = [(PXStoryPacingController *)self timelineVersion];
    *(CMTime *)CMTime lhs = v92[0];
    *(_OWORD *)CMTime rhs = *(_OWORD *)&a4->var0;
    *(void *)&rhs[16] = a4->var3;
    CMTimeAdd((CMTime *)time2, (CMTime *)lhs, (CMTime *)rhs);
    v92[0] = *(CMTime *)time2;
    long long v9 = [(PXStoryPacingController *)self cueSource];
    memset(v89, 0, sizeof(v89));
    long long v88 = 0u;
    long long v87 = 0u;
    memset(v86, 0, sizeof(v86));
    long long v85 = 0u;
    memset(rhs, 0, sizeof(rhs));
    [(PXStoryPacingController *)self currentPacingDecision];
    if (*(void *)rhs == v7)
    {
      if (v9)
      {
        long long v105 = v88;
        long long v106 = v89[0];
        long long v107 = v89[1];
        long long v101 = v86[2];
        long long v102 = v86[3];
        long long v104 = v87;
        long long v103 = v86[4];
        long long v97 = *(_OWORD *)&rhs[64];
        long long v98 = v85;
        long long v100 = v86[1];
        long long v99 = v86[0];
        *(_OWORD *)CMTime lhs = *(_OWORD *)rhs;
        *(_OWORD *)&lhs[16] = *(_OWORD *)&rhs[16];
        long long v96 = *(_OWORD *)&rhs[48];
        long long v95 = *(_OWORD *)&rhs[32];
        if (!PXStoryPacingDecisionEqualToPacingDecision((uint64_t)lhs, (uint64_t)&PXStoryPacingDecisionNull))
        {
          if ([v32 isRealTime])
          {
            if ([v33 adjustToWallClockTime])
            {
              CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
              memset(v51, 0, 24);
              CMTimeMakeWithSeconds(&v74, Current - *((double *)&v86[4] + 1), 600);
              *(_OWORD *)CMTime lhs = v87;
              *(void *)&lhs[16] = v88;
              *(CMTime *)time2 = v74;
              CMTimeAdd((CMTime *)v51, (CMTime *)lhs, (CMTime *)time2);
              *(_OWORD *)CMTime lhs = *(_OWORD *)v51;
              *(void *)&lhs[16] = *(void *)&v51[16];
              *(CMTime *)time2 = v92[0];
              if (!PXStoryTimeApproximatelyEqualToTime((uint64_t)lhs, (uint64_t)time2))
              {
                memset(v42, 0, 24);
                *(_OWORD *)CMTime lhs = *(_OWORD *)v51;
                *(void *)&lhs[16] = *(void *)&v51[16];
                *(CMTime *)time2 = v92[0];
                CMTimeSubtract((CMTime *)v42, (CMTime *)lhs, (CMTime *)time2);
                uint64_t v11 = [(PXStoryPacingController *)self log];
                os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
                if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  os_signpost_id_t v13 = v12;
                  if (os_signpost_enabled(v11))
                  {
                    uint64_t v28 = [(PXStoryPacingController *)self logContext];
                    *(_OWORD *)CMTime lhs = *(_OWORD *)v42;
                    *(void *)&lhs[16] = *(void *)&v42[16];
                    uint64_t v30 = PXStoryTimeDescription((CMTime *)lhs);
                    *(CMTime *)CMTime lhs = v92[0];
                    long long v29 = PXStoryTimeDescription((CMTime *)lhs);
                    *(_OWORD *)CMTime lhs = *(_OWORD *)v51;
                    *(void *)&lhs[16] = *(void *)&v51[16];
                    CMTime v14 = PXStoryTimeDescription((CMTime *)lhs);
                    *(_DWORD *)CMTime lhs = 134218754;
                    *(void *)&lhs[4] = v28;
                    *(_WORD *)&lhs[12] = 2114;
                    *(void *)&lhs[14] = v30;
                    *(_WORD *)&lhs[22] = 2114;
                    *(void *)&lhs[24] = v29;
                    LOWORD(v95) = 2114;
                    *(void *)((char *)&v95 + 2) = v14;
                    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_EVENT, v13, "PXStoryPacingController.adjustTimeIntoSegment", "Context=%{signpost.telemetry:string2}lu Adjustment=%{signpost.description:attribute,public}@ NewTime=%{signpost.description:attribute,public}@ WallClockTime=%{signpost.description:attribute,public}@ ", lhs, 0x2Au);
                  }
                }

                CMTime v15 = PLStoryGetLog();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_OWORD *)CMTime lhs = *(_OWORD *)v42;
                  *(void *)&lhs[16] = *(void *)&v42[16];
                  long long v16 = PXStoryTimeDescription((CMTime *)lhs);
                  *(_DWORD *)CMTime lhs = 138412290;
                  *(void *)&lhs[4] = v16;
                  _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "[Pacing] Compensating for apparent main queue lag. Adjusting current time into segment by %@", lhs, 0xCu);
                }
                v92[0] = *(CMTime *)v51;
              }
            }
          }
        }
      }
    }
    else
    {
      if (v8)
      {
        [v8 timeRangeForSegmentWithIdentifier:v7];
      }
      else
      {
        memset(v83, 0, sizeof(v83));
        long long v82 = 0u;
      }
      long long v80 = *(_OWORD *)((char *)v83 + 8);
      uint64_t v81 = *((void *)&v83[1] + 1);
      long long v78 = *(_OWORD *)((char *)v83 + 8);
      uint64_t v79 = *((void *)&v83[1] + 1);
      CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
      CMTime v77 = v92[0];
      int64_t v18 = [(PXStoryPacingController *)self timelineVersion];
      uint64_t v76 = 0;
      *(_OWORD *)&v75[3] = PXStoryTimeZero;
      memset(&rhs[8], 0, 48);
      *(_OWORD *)&rhs[56] = v80;
      *(void *)CMTime rhs = v7;
      *(void *)&rhs[72] = v81;
      long long v85 = v78;
      *(void *)&v86[0] = v79;
      memset((char *)v86 + 8, 0, 64);
      *((CFAbsoluteTime *)&v86[4] + 1) = v17;
      long long v87 = *(_OWORD *)&v77.value;
      *(void *)&long long v88 = v77.epoch;
      *((void *)&v88 + 1) = v18;
      LOBYTE(v89[0]) = 0;
      *(_OWORD *)((char *)v89 + 1) = *(_OWORD *)v75;
      *(_OWORD *)((char *)v89 + 12) = *((unint64_t *)&PXStoryTimeZero + 1);
    }
    *(CMTime *)CMTime lhs = v92[0];
    *(_OWORD *)time2 = v85;
    *(void *)&time2[16] = *(void *)&v86[0];
    if (CMTimeCompare((CMTime *)lhs, (CMTime *)time2) >= 1 && ([v6 shouldPauseTransitions] & 1) == 0)
    {
      memset(v51, 0, 24);
      *(CMTime *)CMTime lhs = v92[0];
      *(_OWORD *)time2 = v85;
      *(void *)&time2[16] = *(void *)&v86[0];
      CMTimeSubtract((CMTime *)v51, (CMTime *)lhs, (CMTime *)time2);
      *(_OWORD *)CMTime lhs = *(_OWORD *)v51;
      *(void *)&lhs[16] = *(void *)&v51[16];
      uint64_t v7 = [v8 identifierForSegmentWithOffset:lhs fromEndOfSegmentWithIdentifier:v7 timeIntoSegment:v92];
    }
    uint64_t v19 = objc_msgSend(v9, "cuesVersion", v28);
    if (*(void *)rhs == v7 && *((void *)&v86[2] + 1) == v19 && *((void *)&v88 + 1) == v31)
    {
      *(void *)((char *)&v89[1] + 4) = 0;
      *(_OWORD *)((char *)v89 + 4) = PXStoryTimeZero;
    }
    else
    {
      long long v73 = 0u;
      long long v72 = 0u;
      long long v71 = 0u;
      if (v8) {
        [v8 timeRangeForSegmentWithIdentifier:v7];
      }
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2020000000;
      char v70 = 0;
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x2020000000;
      char v66 = 0;
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x2020000000;
      uint64_t v64 = 0;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke;
      v60[3] = &unk_1E5DCEE60;
      v60[4] = &v67;
      v60[5] = &v61;
      v60[6] = v65;
      *(_OWORD *)CMTime lhs = v71;
      *(_OWORD *)&lhs[16] = v72;
      long long v95 = v73;
      objc_msgSend(v8, "enumerateClipsInTimeRange:rect:usingBlock:", lhs, v60, *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      long long v58 = 0u;
      memset(v59, 0, sizeof(v59));
      memset(time2, 0, sizeof(time2));
      if (v8)
      {
        [v8 infoForSegmentWithIdentifier:v7];
        char v20 = v59[0];
      }
      else
      {
        char v20 = 0;
      }
      long long v54 = *(_OWORD *)&v59[104];
      long long v55 = *(_OWORD *)&v59[120];
      long long v56 = *(_OWORD *)&v59[136];
      *(_OWORD *)v51 = *(_OWORD *)&v59[40];
      *(_OWORD *)&v51[16] = *(_OWORD *)&v59[56];
      long long v52 = *(_OWORD *)&v59[72];
      long long v53 = *(_OWORD *)&v59[88];
      long long v49 = *(_OWORD *)&v59[4];
      uint64_t v50 = *(void *)&v59[20];
      if (*((unsigned char *)v68 + 24))
      {
        uint64_t v21 = [v8 clipWithIdentifier:v62[3]];
        long long v95 = 0u;
        memset(lhs, 0, sizeof(lhs));
        *(_OWORD *)v42 = v71;
        *(_OWORD *)&v42[16] = v72;
        long long v43 = v73;
        PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v21, (long long *)v42, 0, lhs);
        *(_OWORD *)v42 = v53;
        *(void *)&v42[16] = v54;
        CMTime v93 = *(CMTime *)lhs;
        CMTimeSubtract(&v48, (CMTime *)v42, &v93);
        long long v53 = *(_OWORD *)&v48.value;
        *(void *)&long long v54 = v48.epoch;
      }
      memset(&v93, 0, sizeof(v93));
      uint64_t v22 = +[PXStoryTransitionsSettings sharedInstance];
      [v22 cueAlignmentForTransitionKind:v20];
      *(_OWORD *)CMTime lhs = v49;
      *(void *)&lhs[16] = v50;
      CMTimeMultiplyByFloat64(&v93, (CMTime *)lhs, v23);

      if ([v33 useMusicCuesForPacing]) {
        v24 = v9;
      }
      else {
        v24 = 0;
      }
      CMTime v25 = [(PXStoryPacingController *)self timeSource];
      int v26 = [v25 isRealTime];
      long long v45 = v54;
      long long v46 = v55;
      *(_OWORD *)v42 = *(_OWORD *)v51;
      *(_OWORD *)&v42[16] = *(_OWORD *)&v51[16];
      long long v43 = v52;
      long long v44 = v53;
      long long v47 = v56;
      CMTime v48 = v92[0];
      CMTime v41 = v93;
      PXStoryPacingControllerGeneratePacingDecision(v7, (uint64_t)v42, &v48, &v41, v24, v31, v26, (uint64_t)lhs);
      long long v88 = v105;
      v89[0] = v106;
      v89[1] = v107;
      v86[2] = v101;
      v86[3] = v102;
      long long v87 = v104;
      v86[4] = v103;
      *(_OWORD *)&rhs[64] = v97;
      long long v85 = v98;
      v86[1] = v100;
      v86[0] = v99;
      *(_OWORD *)CMTime rhs = *(_OWORD *)lhs;
      *(_OWORD *)&rhs[16] = *(_OWORD *)&lhs[16];
      *(_OWORD *)&rhs[48] = v96;
      *(_OWORD *)&rhs[32] = v95;

      LOBYTE(v89[0]) = v20;
      *(void *)((char *)&v89[1] + 4) = 0;
      *(_OWORD *)((char *)v89 + 4) = PXStoryTimeZero;
      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(v65, 8);
      _Block_object_dispose(&v67, 8);
    }
    *(_OWORD *)CMTime lhs = v85;
    *(void *)&lhs[16] = *(void *)&v86[0];
    *(CMTime *)time2 = v92[0];
    CMTimeSubtract((CMTime *)v51, (CMTime *)lhs, (CMTime *)time2);
    long long v90 = *(_OWORD *)v51;
    uint64_t v91 = *(void *)&v51[16];
    v40[12] = v88;
    v40[13] = v89[0];
    v40[14] = v89[1];
    v40[8] = v86[2];
    v40[9] = v86[3];
    v40[10] = v86[4];
    v40[11] = v87;
    v40[4] = *(_OWORD *)&rhs[64];
    v40[5] = v85;
    v40[6] = v86[0];
    v40[7] = v86[1];
    v40[0] = *(_OWORD *)rhs;
    v40[1] = *(_OWORD *)&rhs[16];
    v40[2] = *(_OWORD *)&rhs[32];
    v40[3] = *(_OWORD *)&rhs[48];
    [(PXStoryPacingController *)self setCurrentPacingDecision:v40];
  }
  memset(time2, 0, 24);
  if (v6) {
    [v6 elapsedTime];
  }
  *(_OWORD *)CMTime lhs = *(_OWORD *)time2;
  *(void *)&lhs[16] = *(void *)&time2[16];
  *(_OWORD *)CMTime rhs = *(_OWORD *)&a4->var0;
  *(void *)&rhs[16] = a4->var3;
  CMTimeAdd((CMTime *)v51, (CMTime *)lhs, (CMTime *)rhs);
  *(_OWORD *)time2 = *(_OWORD *)v51;
  *(void *)&time2[16] = *(void *)&v51[16];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke_2;
  v34[3] = &__block_descriptor_112_e31_v16__0___PXStoryMutableModel__8l;
  long long v35 = *(_OWORD *)v51;
  uint64_t v36 = *(void *)&v51[16];
  v34[4] = v7;
  CMTime v37 = v92[0];
  uint64_t v39 = v91;
  long long v38 = v90;
  long long v27 = [(PXStoryPacingController *)self modelChangeOrigin];
  [v6 performChanges:v34 origin:v27];
}

void *__57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2 >= 1)
  {
    do
    {
      uint64_t v5 = a5[19];
      if ((unint64_t)(v5 - 3) <= 1 && !*(unsigned char *)(*(void *)(result[4] + 8) + 24))
      {
        *(void *)(*(void *)(result[5] + 8) + 24) = *a5;
        *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
      }
      a5 += 96;
      uint64_t v6 = *(void *)(result[6] + 8);
      BOOL v8 = (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 || *(unsigned char *)(v6 + 24) != 0;
      *(unsigned char *)(v6 + 24) = v8;
      --a2;
    }
    while (a2);
  }
  return result;
}

void __57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke_2(uint64_t a1, void *a2)
{
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  id v3 = a2;
  [v3 setElapsedTime:&v9];
  uint64_t v4 = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 104);
  [v3 setCurrentSegmentIdentifier:v4 timeIntoSegment:&v7 timeLeftInSegment:&v5 changeSource:0];
}

- (void)setTargetEndTime:(id *)a3
{
  p_targetEndTime = &self->_targetEndTime;
  CMTime time1 = *(CMTime *)a3;
  CMTime time2 = (CMTime)self->_targetEndTime;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_targetEndTime->epoch = a3->var3;
    *(_OWORD *)&p_targetEndTime->value = v6;
    memset(&v12, 0, sizeof(v12));
    long long v7 = [(PXStoryPacingController *)self cueSource];
    uint64_t v8 = v7;
    if (v7) {
      [v7 currentTime];
    }
    else {
      memset(&v12, 0, sizeof(v12));
    }

    long long v9 = [(PXStoryPacingController *)self pacingDecisionHistory];
    CMTime time1 = (CMTime)*a3;
    CMTime time2 = v12;
    CMTimeSubtract(&v11, &time1, &time2);
    uint64_t v10 = [(PXStoryPacingController *)self targetEndUpdateReason];
    [v9 resetWithTargetDuration:&v11 reason:v10];
  }
}

- (void)setCurrentPacingDecision:(id *)a3
{
  p_currentPacingDecision = &self->_currentPacingDecision;
  long long v6 = *(_OWORD *)&a3->var10;
  long long v52 = *(_OWORD *)&a3->var8.var3;
  long long v53 = v6;
  long long v54 = *(_OWORD *)&a3->var11.var1;
  long long v7 = *(_OWORD *)&a3->var6.var0;
  long long v48 = *(_OWORD *)&a3->var4.var1;
  long long v49 = v7;
  long long v8 = *(_OWORD *)&a3->var8.var0;
  long long v50 = *(_OWORD *)&a3->var6.var3;
  long long v51 = v8;
  long long v9 = *(_OWORD *)&a3->var3.var0;
  long long v44 = *(_OWORD *)&a3->var2.var1;
  long long v45 = v9;
  long long v10 = *(_OWORD *)&a3->var4.var0.var1;
  long long v46 = *(_OWORD *)&a3->var3.var3;
  long long v47 = v10;
  long long v11 = *(_OWORD *)&a3->var1.var0.var1;
  long long v40 = *(_OWORD *)&a3->var0;
  long long v41 = v11;
  long long v12 = *(_OWORD *)&a3->var1.var1.var3;
  long long v42 = *(_OWORD *)&a3->var1.var1.var0;
  long long v43 = v12;
  long long v13 = *(_OWORD *)&self->_currentPacingDecision.transitionKind;
  v39[12] = *(_OWORD *)&self->_currentPacingDecision.startTimeIntoSegment.epoch;
  v39[13] = v13;
  v39[14] = *(_OWORD *)&self->_currentPacingDecision.transitionCorrection.timescale;
  long long v14 = *(_OWORD *)&self->_currentPacingDecision.cueTime.value;
  v39[8] = *(_OWORD *)&self->_currentPacingDecision.cue.rank;
  v39[9] = v14;
  long long v15 = *(_OWORD *)&self->_currentPacingDecision.startTimeIntoSegment.value;
  v39[10] = *(_OWORD *)&self->_currentPacingDecision.cueTime.epoch;
  v39[11] = v15;
  long long v16 = *(_OWORD *)&self->_currentPacingDecision.adjustedDuration.value;
  v39[4] = *(_OWORD *)&self->_currentPacingDecision.originalDuration.timescale;
  v39[5] = v16;
  long long v17 = *(_OWORD *)&self->_currentPacingDecision.cue.time.timescale;
  v39[6] = *(_OWORD *)&self->_currentPacingDecision.adjustedDuration.epoch;
  v39[7] = v17;
  long long v18 = *(_OWORD *)&self->_currentPacingDecision.allowedTimeRange.start.timescale;
  v39[0] = *(_OWORD *)&self->_currentPacingDecision.segmentIdentifier;
  v39[1] = v18;
  long long v19 = *(_OWORD *)&self->_currentPacingDecision.allowedTimeRange.duration.epoch;
  v39[2] = *(_OWORD *)&self->_currentPacingDecision.allowedTimeRange.duration.value;
  v39[3] = v19;
  if (!PXStoryPacingDecisionEqualToPacingDecision((uint64_t)&v40, (uint64_t)v39))
  {
    long long v20 = *(_OWORD *)&a3->var0;
    long long v21 = *(_OWORD *)&a3->var1.var1.var0;
    *(_OWORD *)&p_currentPacingDecision->allowedTimeRange.start.timescale = *(_OWORD *)&a3->var1.var0.var1;
    *(_OWORD *)&p_currentPacingDecision->allowedTimeRange.duration.value = v21;
    *(_OWORD *)&p_currentPacingDecision->segmentIdentifier = v20;
    long long v22 = *(_OWORD *)&a3->var1.var1.var3;
    long long v23 = *(_OWORD *)&a3->var2.var1;
    long long v24 = *(_OWORD *)&a3->var3.var3;
    *(_OWORD *)&p_currentPacingDecision->adjustedDuration.value = *(_OWORD *)&a3->var3.var0;
    *(_OWORD *)&p_currentPacingDecision->adjustedDuration.epoch = v24;
    *(_OWORD *)&p_currentPacingDecision->allowedTimeRange.duration.epoch = v22;
    *(_OWORD *)&p_currentPacingDecision->originalDuration.timescale = v23;
    long long v25 = *(_OWORD *)&a3->var4.var0.var1;
    long long v26 = *(_OWORD *)&a3->var4.var1;
    long long v27 = *(_OWORD *)&a3->var6.var3;
    *(_OWORD *)&p_currentPacingDecision->cueTime.value = *(_OWORD *)&a3->var6.var0;
    *(_OWORD *)&p_currentPacingDecision->cueTime.epoch = v27;
    *(_OWORD *)&p_currentPacingDecision->cue.time.timescale = v25;
    *(_OWORD *)&p_currentPacingDecision->cue.rank = v26;
    long long v28 = *(_OWORD *)&a3->var8.var0;
    long long v29 = *(_OWORD *)&a3->var8.var3;
    long long v30 = *(_OWORD *)&a3->var11.var1;
    *(_OWORD *)&p_currentPacingDecision->transitionKind = *(_OWORD *)&a3->var10;
    *(_OWORD *)&p_currentPacingDecision->transitionCorrection.timescale = v30;
    *(_OWORD *)&p_currentPacingDecision->startTimeIntoSegment.value = v28;
    *(_OWORD *)&p_currentPacingDecision->startTimeIntoSegment.epoch = v29;
    uint64_t v31 = [(PXStoryPacingController *)self pacingDecisionHistory];
    long long v32 = *(_OWORD *)&a3->var10;
    long long v52 = *(_OWORD *)&a3->var8.var3;
    long long v53 = v32;
    long long v54 = *(_OWORD *)&a3->var11.var1;
    long long v33 = *(_OWORD *)&a3->var6.var0;
    long long v48 = *(_OWORD *)&a3->var4.var1;
    long long v49 = v33;
    long long v34 = *(_OWORD *)&a3->var8.var0;
    long long v50 = *(_OWORD *)&a3->var6.var3;
    long long v51 = v34;
    long long v35 = *(_OWORD *)&a3->var3.var0;
    long long v44 = *(_OWORD *)&a3->var2.var1;
    long long v45 = v35;
    long long v36 = *(_OWORD *)&a3->var4.var0.var1;
    long long v46 = *(_OWORD *)&a3->var3.var3;
    long long v47 = v36;
    long long v37 = *(_OWORD *)&a3->var1.var0.var1;
    long long v40 = *(_OWORD *)&a3->var0;
    long long v41 = v37;
    long long v38 = *(_OWORD *)&a3->var1.var1.var3;
    long long v42 = *(_OWORD *)&a3->var1.var1.var0;
    long long v43 = v38;
    [v31 recordDecision:&v40];
  }
}

- (void)setCanChangePlaybackTime:(BOOL)a3
{
  if (self->_canChangePlaybackTime != a3)
  {
    self->_canChangePlaybackTime = a3;
    [(PXStoryPacingController *)self _invalidateCurrentPacingDecision];
    [(PXStoryPacingController *)self _invalidateTargetEndTimeWithReason:@"Pacing Started/Stopped"];
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  BOOL v6 = [(PXStoryPacingController *)self canChangePlaybackTime];
  long long v7 = @"paused advancing time";
  if (v6) {
    long long v7 = @"advancing time";
  }
  [v5 appendFormat:@"Pacing Status: %@\n", v7];
  BOOL v8 = [(PXStoryPacingController *)self canChangePlaybackTime];
  if (a3 == 14 && !v8)
  {
    long long v9 = [(PXStoryPacingController *)self reasonPreventingPlaybackTimeChange];
    [v5 appendFormat:@"Paused Reason: %@\n", v9];
  }
  long long v10 = (void *)[v5 copy];

  return v10;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    BOOL v3 = a3;
    self->_isActive = a3;
    id v5 = [(PXStoryPacingController *)self timeSource];
    [v5 setActive:v3];

    [(PXStoryPacingController *)self _invalidateCanChangePlaybackTime];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryPacingController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCanChangePlaybackTime, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateTargetEndTime];
}

- (PXStoryPacingController)initWithModel:(id)a3 timeSource:(id)a4 cueSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryPacingController;
  long long v11 = [(PXStoryController *)&v26 initWithObservableModel:v8];
  long long v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_model, v8);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__PXStoryPacingController_initWithModel_timeSource_cueSource___block_invoke;
    v24[3] = &unk_1E5DCEE38;
    long long v13 = v12;
    long long v25 = v13;
    [v8 performChanges:v24];
    objc_storeStrong((id *)&v13->_timeSource, a4);
    objc_storeWeak((id *)&v13->_cueSource, v10);
    [(PXStoryPacingTimeSource *)v13->_timeSource setDelegate:v13];
    long long v14 = [_PXStoryPacingControllerChangeOrigin alloc];
    id v15 = [NSString alloc];
    long long v16 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v16);
    long long v18 = (void *)[v15 initWithFormat:@"changeOrigin-%@-%p", v17, v13];
    uint64_t v19 = [(_PXStoryPacingControllerChangeOrigin *)v14 initWithDescription:v18];
    modelChangeOrigin = v13->_modelChangeOrigin;
    v13->_modelChangeOrigin = (_PXStoryPacingControllerChangeOrigin *)v19;

    long long v21 = objc_alloc_init(_PXStoryPacingControllerDecisionHistory);
    pacingDecisionHistory = v13->_pacingDecisionHistory;
    v13->_pacingDecisionHistory = v21;
  }
  return v12;
}

uint64_t __62__PXStoryPacingController_initWithModel_timeSource_cueSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:15];
}

- (PXStoryPacingController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPacingController.m", 58, @"%s is not available as initializer", "-[PXStoryPacingController initWithObservableModel:]");

  abort();
}

@end