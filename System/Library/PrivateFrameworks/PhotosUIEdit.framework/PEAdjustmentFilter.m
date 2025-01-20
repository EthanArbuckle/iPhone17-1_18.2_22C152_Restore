@interface PEAdjustmentFilter
- (NSString)filterIdentifier;
- (PEAdjustmentFilter)initWithFilterIdentifier:(id)a3 intensity:(double)a4;
- (double)intensity;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setFilterIdentifier:(id)a3;
- (void)setIntensity:(double)a3;
@end

@implementation PEAdjustmentFilter

- (void).cxx_destruct
{
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setFilterIdentifier:(id)a3
{
}

- (NSString)filterIdentifier
{
  return self->_filterIdentifier;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a7;
  if (PISemanticStyleIsRenderSupported()
    && ([v11 semanticStyleStatistics],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        v14))
  {
    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentFilterErrorDomain" code:1 userInfo:0];
    v12[2](v12, 0, v15);
  }
  else
  {
    v16 = [(PEAdjustmentFilter *)self filterIdentifier];
    v17 = [MEMORY[0x263F5D998] standardSupportedEffects];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
    v30 = &unk_2642BEA38;
    id v18 = v16;
    id v31 = v18;
    v19 = PFFind();
    uint64_t v20 = *MEMORY[0x263F5D728];
    [v10 removeAdjustmentWithKey:*MEMORY[0x263F5D728]];
    uint64_t v21 = *MEMORY[0x263F5D720];
    [v10 removeAdjustmentWithKey:*MEMORY[0x263F5D720]];
    if (v19)
    {
      v22 = (void *)MEMORY[0x263F5D998];
      v23 = [v19 filterIdentifier];
      LOBYTE(v22) = [v22 isEffectNoneForIdentifier:v23];

      if ((v22 & 1) == 0)
      {
        if ([MEMORY[0x263F5D618] is3DEffect:v18]) {
          uint64_t v20 = v21;
        }
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
        v24[3] = &unk_2642BEA60;
        id v25 = v18;
        id v26 = v19;
        [v10 modifyAdjustmentWithKey:v20 modificationBlock:v24];
      }
    }
    v12[2](v12, 1, 0);
  }
}

uint64_t __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 filterIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setKind:v3];
  [v4 setIntensity:1.0];
  objc_msgSend(v4, "setVersion:", objc_msgSend(*(id *)(a1 + 40), "latestVersion"));
  [v4 setEnabled:1];
}

- (int64_t)category
{
  return 4;
}

- (PEAdjustmentFilter)initWithFilterIdentifier:(id)a3 intensity:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEAdjustmentFilter;
  v8 = [(PEAdjustmentFilter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterIdentifier, a3);
    v9->_intensity = a4;
  }

  return v9;
}

@end