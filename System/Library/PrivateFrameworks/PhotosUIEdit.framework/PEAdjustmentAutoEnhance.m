@interface PEAdjustmentAutoEnhance
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
@end

@implementation PEAdjustmentAutoEnhance

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  v12 = (void *)MEMORY[0x263F5D618];
  v13 = [v9 composition];
  v14 = [v12 imagePropertiesRequestWithComposition:v13];

  [v14 setName:@"PEAdjustmentAutoEnhance"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v18[3] = &unk_2642BEEA8;
  id v20 = v10;
  id v21 = v11;
  id v19 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v11;
  [v14 submit:v18];
}

void __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v11 = 0;
  v3 = [a2 result:&v11];
  id v4 = v11;
  v5 = [v3 properties];

  if (v5)
  {
    v6 = objc_alloc_init(PEAutoAdjustmentController);
    [(PEAutoAdjustmentController *)v6 setImageProperties:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
    v9[3] = &unk_2642BF340;
    id v10 = *(id *)(a1 + 48);
    [(PEAutoAdjustmentController *)v6 enableAutoEnhanceOnCompositionController:v7 valuesCalculator:v8 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)category
{
  return 0;
}

@end