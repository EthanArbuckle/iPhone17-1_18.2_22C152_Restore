@interface PUBrillianceAdjustmentCustomBehavior
- (BOOL)calculatingStatistics;
- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 modifyValue:(double)a5;
- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 setEnabled:(BOOL)a5 completionHandler:(id)a6;
- (void)populateSmartToneStatisticsForDataSource:(id)a3 adjustmentInfo:(id)a4 completionHandler:(id)a5;
- (void)setCalculatingStatistics:(BOOL)a3;
@end

@implementation PUBrillianceAdjustmentCustomBehavior

- (void)setCalculatingStatistics:(BOOL)a3
{
  self->_calculatingStatistics = a3;
}

- (BOOL)calculatingStatistics
{
  return self->_calculatingStatistics;
}

- (void)populateSmartToneStatisticsForDataSource:(id)a3 adjustmentInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(void))a5;
  v9 = [v7 compositionController];
  v10 = [v9 smartToneAdjustmentController];
  v11 = v10;
  if (v10 && ([v10 statistics], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else if (![(PUBrillianceAdjustmentCustomBehavior *)self calculatingStatistics])
  {
    [(PUBrillianceAdjustmentCustomBehavior *)self setCalculatingStatistics:1];
    v13 = [v7 autoEnhanceController];
    v14 = [v7 compositionController];
    v15 = [v7 valuesCalculator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke;
    v16[3] = &unk_1E5F2EBC8;
    id v17 = v7;
    v18 = self;
    v19 = v8;
    [v13 calculateStatisticsForCompositionController:v14 valuesCalculator:v15 completionHandler:v16];

    goto LABEL_8;
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_8:
}

void __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) compositionController];
  v3 = [*(id *)(a1 + 32) compositionController];
  v4 = [v3 adjustmentConstants];
  v5 = [v4 PISmartToneAdjustmentKey];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5F22EF8;
  id v8 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v6;
  [v2 modifyAdjustmentWithKey:v5 modificationBlock:v7];
}

uint64_t __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 valuesCalculator];
  [v5 updateAdjustmentSmartToneStatistics:v4 withAccuracy:0];

  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  id v7 = (void *)a1[5];
  return [v7 setCalculatingStatistics:0];
}

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 modifyValue:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  [v9 setCurrentLevel:a5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_modifyValue___block_invoke;
  v12[3] = &unk_1E5F2ECC8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PUBrillianceAdjustmentCustomBehavior *)self populateSmartToneStatisticsForDataSource:v11 adjustmentInfo:v10 completionHandler:v12];
}

uint64_t __78__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_modifyValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyAdjustmentForInfo:*(void *)(a1 + 40)];
}

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 setEnabled:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v9 delegate];
  [v12 willModifyAdjustment];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke;
  v16[3] = &unk_1E5F2EBC8;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(PUBrillianceAdjustmentCustomBehavior *)self populateSmartToneStatisticsForDataSource:v15 adjustmentInfo:v14 completionHandler:v16];
}

uint64_t __95__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _modifyAdjustmentForInfo:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) delegate];
  v3 = [*(id *)(a1 + 40) localizedActionName];
  [v2 didModifyAdjustmentWithLocalizedName:v3];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

@end