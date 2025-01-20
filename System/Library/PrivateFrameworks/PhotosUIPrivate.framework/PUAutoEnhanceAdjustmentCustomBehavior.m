@interface PUAutoEnhanceAdjustmentCustomBehavior
- (PUAdjustmentsDataSource)dataSource;
- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 setEnabled:(BOOL)a5 completionHandler:(id)a6;
- (void)setDataSource:(id)a3;
@end

@implementation PUAutoEnhanceAdjustmentCustomBehavior

- (void).cxx_destruct
{
}

- (void)setDataSource:(id)a3
{
}

- (PUAdjustmentsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUAdjustmentsDataSource *)WeakRetained;
}

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 setEnabled:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v8 = a3;
  v9 = (void (**)(void))a6;
  v10 = [v8 autoEnhanceController];
  v11 = [v8 compositionController];
  if (([v10 isBusy] & 1) == 0)
  {
    int v12 = [MEMORY[0x1E4F91118] isAutoEnhanceEnabledForCompositionController:v11];
    if ((v12 & 1) != 0 || !v7)
    {
      if (v12)
      {
        if (!v7)
        {
          v19 = [v8 delegate];
          [v19 willModifyAdjustment];

          [v10 disableAutoEnhanceOnCompositionController:v11];
          v20 = [v8 delegate];
          v21 = PULocalizedString(@"MENU_ITEM_TITLE_REMOVE_AUTO_ENHANCEMENTS");
          [v20 didModifyAdjustmentWithLocalizedName:v21];

          if (v9) {
            v9[2](v9);
          }
        }
      }
    }
    else
    {
      v13 = [v8 delegate];
      [v13 willModifyAdjustment];

      [v8 _resetEnabledStateForAutoEnhancedInfos];
      v14 = [v11 whiteBalanceAdjustmentController];
      int v15 = [v14 warmFace];

      [v11 removeAdjustmentWithKey:*MEMORY[0x1E4F8A598]];
      [v11 removeAdjustmentWithKey:*MEMORY[0x1E4F8A590]];
      if (v15) {
        [v11 removeAdjustmentWithKey:*MEMORY[0x1E4F8A5B8]];
      }
      [v11 removeAdjustmentWithKey:*MEMORY[0x1E4F8A4F0]];
      v16 = [v8 valuesCalculator];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __96__PUAutoEnhanceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke;
      v25 = &unk_1E5F2EA60;
      id v17 = v8;
      id v26 = v17;
      v27 = v9;
      [v10 enableAutoEnhanceOnCompositionController:v11 valuesCalculator:v16 completionHandler:&v22];

      v18 = objc_msgSend(v17, "delegate", v22, v23, v24, v25);
      [v18 autoEnhanceActionStateChanged];
    }
  }
}

uint64_t __96__PUAutoEnhanceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  v3 = PULocalizedString(@"MENU_ITEM_TITLE_AUTO_ENHANCE");
  [v2 didModifyAdjustmentWithLocalizedName:v3];

  v4 = [*(id *)(a1 + 32) delegate];
  [v4 autoEnhanceActionStateChanged];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

@end