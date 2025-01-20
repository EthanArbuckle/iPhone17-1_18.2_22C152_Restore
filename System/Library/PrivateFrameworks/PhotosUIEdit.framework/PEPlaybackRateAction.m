@interface PEPlaybackRateAction
- (float)playbackRate;
- (int64_t)actionType;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
- (void)setPlaybackRate:(float)a3;
@end

@implementation PEPlaybackRateAction

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (int64_t)actionType
{
  return 7;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 asset];
    double v10 = [v9 uuid];
    *(_DWORD *)buf = 138543362;
    double v40 = v10;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PEPlaybackRateAction: applyToLoadResult on asset: %{public}@", buf, 0xCu);
  }
  v11 = [v6 compositionController];
  [(PEPlaybackRateAction *)self playbackRate];
  float v13 = v12;
  v14 = [v6 editSource];
  v15 = +[PEPlaybackRateOption playbackRateOptionsForEditSource:v14];

  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 3221225472;
  v36 = __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke;
  v37 = &__block_descriptor_36_e30_B16__0__PEPlaybackRateOption_8l;
  float v38 = v13;
  if (PFExists())
  {
    v16 = [v6 originalComposition];
    uint64_t v17 = *MEMORY[0x263F5D850];
    v18 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5D850]];
    BOOL v19 = v18 != 0;

    v20 = [v6 asset];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v22 = [v6 asset];
      char v23 = [v22 isMediaSubtype:0x20000];
      if (v18) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v23;
      }
    }
    if (v13 != 1.0 || v19)
    {
      v28 = [v6 contentEditingInput];
      v29 = [v28 audiovisualAsset];

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke_367;
      v31[3] = &unk_2642BF4A8;
      float v33 = v13;
      id v32 = v29;
      id v30 = v29;
      [v11 modifyAdjustmentWithKey:v17 modificationBlock:v31];
    }
    else
    {
      [v11 removeAdjustmentWithKey:v17];
    }
    uint64_t v27 = 1;
  }
  else
  {
    v24 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [v6 asset];
      v26 = [v25 uuid];
      *(_DWORD *)buf = 134218242;
      double v40 = v13;
      __int16 v41 = 2114;
      v42 = v26;
      _os_log_impl(&dword_217B65000, v24, OS_LOG_TYPE_ERROR, "PEPlaybackRateAction: playback rate: %f is not supported on asset: %{public}@", buf, 0x16u);
    }
    uint64_t v27 = 0;
  }
  v7[2](v7, v27);
}

BOOL __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke(uint64_t a1, void *a2)
{
  [a2 playbackRate];
  return v3 == *(float *)(a1 + 32);
}

void __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke_367(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRate:*(float *)(a1 + 40)];
  if (v3)
  {
    [v3 startTime];
    if ((v14 & 0x100000000) != 0)
    {
      [v3 endTime];
      if (v12) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  v4 = [MEMORY[0x263F5DFA8] defaultSlowMotionAdjustmentsForAsset:*(void *)(a1 + 32)];
  v5 = v4;
  memset(&v11, 0, sizeof(v11));
  if (v4) {
    [v4 slowMotionTimeRange];
  }
  long long v9 = *(_OWORD *)&v11.start.value;
  CMTimeEpoch epoch = v11.start.epoch;
  [v3 setStartTime:&v9];
  CMTimeRange range = v11;
  CMTimeRangeGetEnd(&v8, &range);
  CMTime v6 = v8;
  [v3 setEndTime:&v6];

LABEL_9:
}

@end