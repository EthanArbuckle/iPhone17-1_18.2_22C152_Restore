@interface PEAdjustmentDepth
+ (id)_error:(int64_t)a3 description:(id)a4;
- (BOOL)enabled;
- (PEAdjustmentDepth)initWithEnabled:(BOOL)a3;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PEAdjustmentDepth

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  if (PECanRenderPortrait_onceToken != -1) {
    dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_213);
  }
  if (PECanRenderPortrait_canRenderPortrait)
  {
    v17 = [v13 portraitValuesWithAccuracy:0];
    v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5D718]];
    if (!v18)
    {
      v28 = +[PEAdjustmentDepth _error:2 description:@"Asset is missing depth data"];
      v16[2](v16, 0, v28);

LABEL_19:
      goto LABEL_20;
    }
    id v34 = v15;
    v19 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5D700]];
    [v19 floatValue];
    int v21 = v20;

    v35 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5D708]];
    v22 = [v12 depthAdjustmentController];
    uint64_t v23 = [v22 depthInfo];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [v22 depthInfo];
      v26 = [v25 objectForKeyedSubscript:@"focusRect"];
      if (v26)
      {

LABEL_12:
        uint64_t v31 = *MEMORY[0x263F5D6F8];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __120__PEAdjustmentDepth_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
        v36[3] = &unk_2642BECD0;
        v36[4] = self;
        [v12 modifyAdjustmentWithKey:v31 modificationBlock:v36];
        id v15 = v34;
        if ([(PEAdjustmentDepth *)self enabled])
        {
          if ([v12 mediaType] == 3 || objc_msgSend(v12, "mediaType") == 1) {
            uint64_t v32 = [v14 isPhotoIris];
          }
          else {
            uint64_t v32 = 0;
          }
          v33 = [[PELivePortraitBehaviorController alloc] initWithAsset:v14 delegate:v34 hasDepth:1 hasLive:v32];
          [(PELivePortraitBehaviorController *)v33 applySideEffectsForAction:0 compositionController:v12];
        }
        v16[2](v16, 1, 0);

        goto LABEL_19;
      }
    }
    v29 = [v12 adjustmentConstants];
    v30 = [v29 PIDepthAdjustmentKey];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __120__PEAdjustmentDepth_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
    v37[3] = &unk_2642BEC78;
    id v38 = v18;
    int v42 = v21;
    id v39 = v35;
    id v40 = v17;
    id v41 = v22;
    [v12 modifyAdjustmentWithKey:v30 modificationBlock:v37];

    goto LABEL_12;
  }
  v27 = +[PEAdjustmentDepth _error:1 description:@"Rendering depth is not supported on this device"];
  v16[2](v16, 0, v27);

LABEL_20:
}

void __120__PEAdjustmentDepth_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDepthInfo:*(void *)(a1 + 32)];
  [v5 setAperture:*(float *)(a1 + 64)];
  [v5 setFocusRect:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F5D710]];
  [v5 setGlassesMatteAllowed:v3];

  v4 = [*(id *)(a1 + 56) depthInfo];

  if (!v4) {
    [v5 setEnabled:0];
  }
}

void __120__PEAdjustmentDepth_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "enabled"));
}

- (int64_t)category
{
  return 9;
}

- (PEAdjustmentDepth)initWithEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PEAdjustmentDepth;
  result = [(PEAdjustmentDepth *)&v5 init];
  if (result) {
    result->_enabled = a3;
  }
  return result;
}

+ (id)_error:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_super v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F07F80];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"PEAdjustmentDepthErrorDomain" code:a3 userInfo:v8];

  return v9;
}

@end