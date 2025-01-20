@interface PEAdjustmentAudioMix
- (NSString)audioMix;
- (PEAdjustmentAudioMix)initWithAudioMix:(id)a3;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setAudioMix:(id)a3;
@end

@implementation PEAdjustmentAudioMix

- (void).cxx_destruct
{
}

- (void)setAudioMix:(id)a3
{
}

- (NSString)audioMix
{
  return self->_audioMix;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a7;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = 0;
LABEL_10:
    v13 = [v21 errorWithDomain:@"PEAdjustmentAudioMixErrorDomain" code:v22 userInfo:0];
    v12[2](v12, 0, v13);
    goto LABEL_11;
  }
  if ((PICinematicAudioIsRenderSupported() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = 2;
    goto LABEL_10;
  }
  v13 = [v11 editSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)MEMORY[0x263EFA470];
    v15 = [v13 videoURL];
    v16 = [v14 assetWithURL:v15];

    if ([MEMORY[0x263F586C0] assetIsCinematicAudio:v16])
    {
      char v17 = [MEMORY[0x263F5D558] assetIsCinematicVideo:v16];
      v18 = [(PEAdjustmentAudioMix *)self audioMix];
      int v19 = [v18 isEqualToString:*MEMORY[0x263F5D6C8]];

      uint64_t v20 = *MEMORY[0x263F5D6B8];
      if (!v19 || (v17 & 1) != 0)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __123__PEAdjustmentAudioMix_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
        v25[3] = &unk_2642BEBE8;
        v25[4] = self;
        [v10 modifyAdjustmentWithKey:v20 modificationBlock:v25];
      }
      else
      {
        [v10 removeAdjustmentWithKey:v20];
      }
      v12[2](v12, 1, 0);
    }
    else
    {
      v24 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentAudioMixErrorDomain" code:1 userInfo:0];
      v12[2](v12, 0, v24);
    }
  }
  else
  {
    v23 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentAudioMixErrorDomain" code:1 userInfo:0];
    v12[2](v12, 0, v23);
  }
LABEL_11:
}

void __123__PEAdjustmentAudioMix_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 adjustment];
  [v4 reset];

  [v3 setEnabled:1];
  id v5 = [*(id *)(a1 + 32) audioMix];
  [v3 setRenderingStyle:v5];
}

- (int64_t)category
{
  return 13;
}

- (PEAdjustmentAudioMix)initWithAudioMix:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentAudioMix;
  v6 = [(PEAdjustmentAudioMix *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioMix, a3);
  }

  return v7;
}

@end