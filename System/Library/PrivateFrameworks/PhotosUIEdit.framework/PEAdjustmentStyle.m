@interface PEAdjustmentStyle
- (NSString)styleCast;
- (PEAdjustmentStyle)initWithStyleCast:(id)a3 intensity:(double)a4;
- (double)intensity;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setIntensity:(double)a3;
- (void)setStyleCast:(id)a3;
@end

@implementation PEAdjustmentStyle

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

- (void)setStyleCast:(id)a3
{
}

- (NSString)styleCast
{
  return self->_styleCast;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a7;
  if ((PISemanticStyleIsRenderSupported() & 1) == 0)
  {
    v20 = [MEMORY[0x263F087E8] errorWithDomain:@"PEAdjustmentStyleErrorDomain" code:2 userInfo:0];
LABEL_6:
    v12[2](v12, 0, v20);

    goto LABEL_7;
  }
  v13 = [v11 semanticStyleStatistics];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F07F80];
    v29[0] = @"PEAdjustmentStyle failed due to incompatible asset";
    v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v20 = [v21 errorWithDomain:@"PEAdjustmentStyleErrorDomain" code:1 userInfo:v22];

    goto LABEL_6;
  }
  v15 = [(PEAdjustmentStyle *)self styleCast];
  v16 = [MEMORY[0x263F5D640] defaultValuesForCast:v15];
  uint64_t v17 = *MEMORY[0x263F5D7C0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __120__PEAdjustmentStyle_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v23[3] = &unk_2642BEF48;
  id v24 = v11;
  id v25 = v15;
  v26 = self;
  id v27 = v16;
  id v18 = v16;
  id v19 = v15;
  [v10 modifyAdjustmentWithKey:v17 modificationBlock:v23];
  v12[2](v12, 1, 0);

LABEL_7:
}

void __120__PEAdjustmentStyle_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 updateAdjustmentSemanticStyleStatistics:v4];
  [v4 setEnabled:1];
  [v4 setCast:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) intensity];
  objc_msgSend(v4, "setIntensity:");
  v5 = [*(id *)(a1 + 56) objectAtIndex:0];
  [v5 floatValue];
  [v4 setTone:v6];

  id v8 = [*(id *)(a1 + 56) objectAtIndex:1];
  [v8 floatValue];
  [v4 setColor:v7];
}

- (int64_t)category
{
  return 5;
}

- (PEAdjustmentStyle)initWithStyleCast:(id)a3 intensity:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEAdjustmentStyle;
  id v8 = [(PEAdjustmentStyle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_styleCast, a3);
    v9->_intensity = a4;
  }

  return v9;
}

@end