@interface PEAdjustmentAperture
+ (id)_error:(int64_t)a3 description:(id)a4;
- (PEAdjustmentAperture)initWithModifier:(id)a3;
- (id)modifier;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setModifier:(id)a3;
@end

@implementation PEAdjustmentAperture

- (void).cxx_destruct
{
}

- (void)setModifier:(id)a3
{
}

- (id)modifier
{
  return self->_modifier;
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
      v27 = +[PEAdjustmentAperture _error:2 description:@"Asset is missing depth data"];
      v16[2](v16, 0, v27);

LABEL_17:
      goto LABEL_18;
    }
    v33 = self;
    v19 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5D700]];
    [v19 floatValue];
    int v21 = v20;

    v34 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5D708]];
    v22 = [v12 depthAdjustmentController];
    uint64_t v23 = [v22 depthInfo];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [v22 depthInfo];
      v26 = [v25 objectForKeyedSubscript:@"focusRect"];
      if (v26)
      {

        goto LABEL_12;
      }
    }
    v28 = [v12 adjustmentConstants];
    v29 = [v28 PIDepthAdjustmentKey];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
    v36[3] = &unk_2642BEC78;
    id v37 = v18;
    int v41 = v21;
    id v38 = v34;
    id v39 = v17;
    id v40 = v22;
    [v12 modifyAdjustmentWithKey:v29 modificationBlock:v36];

LABEL_12:
    uint64_t v30 = *MEMORY[0x263F5D6F8];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
    v35[3] = &unk_2642BECD0;
    v35[4] = v33;
    [v12 modifyAdjustmentWithKey:v30 modificationBlock:v35];
    if ([v12 mediaType] == 3 || objc_msgSend(v12, "mediaType") == 1) {
      uint64_t v31 = [v14 isPhotoIris];
    }
    else {
      uint64_t v31 = 0;
    }
    v32 = [[PELivePortraitBehaviorController alloc] initWithAsset:v14 delegate:v15 hasDepth:1 hasLive:v31];
    [(PELivePortraitBehaviorController *)v32 applySideEffectsForAction:0 compositionController:v12];
    [(PELivePortraitBehaviorController *)v32 applySideEffectsForAction:2 compositionController:v12];
    v16[2](v16, 1, 0);

    goto LABEL_17;
  }
  v17 = +[PEAdjustmentAperture _error:1 description:@"Rendering depth is not supported on this device"];
  v16[2](v16, 0, v17);
LABEL_18:
}

void __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 setEnabled:1];
  v3 = [*(id *)(a1 + 32) modifier];
  [v8 aperture];
  double v4 = v3[2](v3);

  [v8 minimumAperture];
  double v6 = v5;
  [v8 maximumAperture];
  if (v4 < v7) {
    double v7 = v4;
  }
  if (v7 <= v6) {
    double v7 = v6;
  }
  [v8 setAperture:v7];
}

- (int64_t)category
{
  return 9;
}

- (PEAdjustmentAperture)initWithModifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentAperture;
  double v5 = [(PEAdjustmentAperture *)&v9 init];
  if (v5)
  {
    double v6 = _Block_copy(v4);
    id modifier = v5->_modifier;
    v5->_id modifier = v6;
  }
  return v5;
}

+ (id)_error:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F07F80];
  v12[0] = a4;
  double v6 = NSDictionary;
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  objc_super v9 = [v5 errorWithDomain:@"PEAdjustmentApertureErrorDomain" code:a3 userInfo:v8];

  return v9;
}

@end