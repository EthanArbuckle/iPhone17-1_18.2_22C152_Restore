@interface PEAdjustmentPlaybackRate
- (PEAdjustmentPlaybackRate)initWithPlaybackRate:(float)a3;
- (float)playbackRate;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setPlaybackRate:(float)a3;
@end

@implementation PEAdjustmentPlaybackRate

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, uint64_t, void))a7;
  if (_os_feature_enabled_impl())
  {
    id v44 = v15;
    uint64_t v17 = [v13 editSource];
    [(PEAdjustmentPlaybackRate *)self playbackRate];
    float v19 = v18;
    v45 = (void *)v17;
    v20 = +[PEPlaybackRateOption playbackRateOptionsForEditSource:v17];
    v21 = [v20 firstObject];
    [v21 playbackRate];
    float v23 = v22;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v24 = v20;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      float v27 = vabds_f32(v19, v23);
      uint64_t v28 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(v24);
          }
          v30 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          [v30 playbackRate];
          float v32 = vabds_f32(v31, v19);
          if (v32 < v27)
          {
            id v33 = v30;

            float v27 = v32;
            v21 = v33;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v26);
    }

    if (v21)
    {
      [v21 playbackRate];
      float v35 = v34;
      char v36 = [v14 isMediaSubtype:0x20000];
      v37 = v45;
      if (v35 != 1.0 || (v36 & 1) != 0)
      {
        v39 = (void *)MEMORY[0x263EFA470];
        v40 = [v45 videoURL];
        v41 = [v39 assetWithURL:v40];

        uint64_t v42 = *MEMORY[0x263F5D850];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __127__PEAdjustmentPlaybackRate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
        v46[3] = &unk_2642BF4A8;
        float v48 = v35;
        id v47 = v41;
        id v43 = v41;
        [v12 modifyAdjustmentWithKey:v42 modificationBlock:v46];
      }
      else
      {
        [v12 removeAdjustmentWithKey:*MEMORY[0x263F5D850]];
      }
      id v15 = v44;
      v16[2](v16, 1, 0);
    }
    else
    {
      v38 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentPlaybackRateErrorDomain" code:1 userInfo:0];
      ((void (**)(id, uint64_t, void *))v16)[2](v16, 0, v38);

      id v15 = v44;
      v37 = v45;
    }
  }
  else
  {
    v37 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentPlaybackRateErrorDomain" code:0 userInfo:0];
    ((void (**)(id, uint64_t, void *))v16)[2](v16, 0, v37);
  }
}

void __127__PEAdjustmentPlaybackRate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
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

- (int64_t)category
{
  return 12;
}

- (PEAdjustmentPlaybackRate)initWithPlaybackRate:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PEAdjustmentPlaybackRate;
  result = [(PEAdjustmentPlaybackRate *)&v5 init];
  if (result) {
    result->_playbackRate = a3;
  }
  return result;
}

@end