@interface PEAdjustmentExposure
- (PEAdjustmentExposure)initWithModifier:(id)a3;
- (id)modifier;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setModifier:(id)a3;
@end

@implementation PEAdjustmentExposure

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
  uint64_t v8 = *MEMORY[0x263F5D868];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __123__PEAdjustmentExposure_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v10[3] = &unk_2642BE630;
  v10[4] = self;
  v9 = (void (**)(id, uint64_t, void))a7;
  [a3 modifyAdjustmentWithKey:v8 modificationBlock:v10];
  v9[2](v9, 1, 0);
}

void __123__PEAdjustmentExposure_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setEnabled:1];
  v3 = [*(id *)(a1 + 32) modifier];
  [v5 offsetExposure];
  double v4 = v3[2](v3);

  objc_msgSend(v5, "setOffsetExposure:", fmax(fmin(v4, 1.0), -1.0));
}

- (int64_t)category
{
  return 1;
}

- (PEAdjustmentExposure)initWithModifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentExposure;
  id v5 = [(PEAdjustmentExposure *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id modifier = v5->_modifier;
    v5->_id modifier = v6;
  }
  return v5;
}

@end