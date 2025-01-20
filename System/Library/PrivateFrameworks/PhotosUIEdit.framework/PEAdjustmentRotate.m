@interface PEAdjustmentRotate
- (BOOL)clockwise;
- (PEAdjustmentRotate)initWithClockwise:(BOOL)a3;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setClockwise:(BOOL)a3;
@end

@implementation PEAdjustmentRotate

- (void)setClockwise:(BOOL)a3
{
  self->_clockwise = a3;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v9 = a3;
  v10 = (void (**)(id, uint64_t, void))a7;
  v11 = (void *)[v9 copy];
  uint64_t v12 = *MEMORY[0x263F5D760];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __121__PEAdjustmentRotate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v14[3] = &unk_2642BE7B8;
  v14[4] = self;
  [v11 modifyAdjustmentWithKey:v12 modificationBlock:v14];
  v13 = [v11 cropAdjustmentController];

  if (v13) {
    [v11 modifyAdjustmentWithKey:*MEMORY[0x263F5D6E0] modificationBlock:&__block_literal_global_314];
  }
  [v9 applyChangesFromCompositionController:v11];
  v10[2](v10, 1, 0);
}

void __121__PEAdjustmentRotate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 orientation];
  NUOrientationIsValid();
  [*(id *)(a1 + 32) clockwise];
  [v3 setOrientation:NUOrientationConcat()];
}

void __121__PEAdjustmentRotate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v2 = (double)[v3 constraintWidth];
  objc_msgSend(v3, "setConstraintWidth:", objc_msgSend(v3, "constraintHeight"));
  [v3 setConstraintHeight:(uint64_t)v2];
}

- (int64_t)category
{
  return 8;
}

- (PEAdjustmentRotate)initWithClockwise:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PEAdjustmentRotate;
  result = [(PEAdjustmentRotate *)&v5 init];
  if (result) {
    result->_clockwise = a3;
  }
  return result;
}

@end