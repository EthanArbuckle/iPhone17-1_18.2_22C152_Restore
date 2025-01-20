@interface PEAutoEnhanceActionHelper
+ (void)applyAutoEnhance:(id)a3 replacesAffectedAdjustments:(BOOL)a4 useCompositionIntensity:(BOOL)a5 completion:(id)a6;
@end

@implementation PEAutoEnhanceActionHelper

+ (void)applyAutoEnhance:(id)a3 replacesAffectedAdjustments:(BOOL)a4 useCompositionIntensity:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  v10 = (void (**)(void))a6;
  v11 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v11, OS_LOG_TYPE_DEFAULT, "PEAdjustmentPresetManager applyAutoEnhance", buf, 2u);
  }

  id v12 = objc_alloc(MEMORY[0x263F58638]);
  v13 = [v9 composition];
  v14 = (void *)[v12 initWithComposition:v13];

  [v14 setName:@"PAAutoEnhance-imageProperties"];
  uint64_t v25 = 0;
  v15 = [v14 submitSynchronous:&v25];
  v16 = [v15 properties];
  if (v16)
  {
    v17 = objc_alloc_init(PEAutoAdjustmentController);
    [(PEAutoAdjustmentController *)v17 setImageProperties:v16];
    v18 = objc_alloc_init(PEValuesCalculator);
    [(PEValuesCalculator *)v18 setCompositionController:v9];
    [(PEValuesCalculator *)v18 setSkipGeometricCalculations:1];
    if (v8)
    {
      v19 = [v9 adjustmentConstants];
      v20 = [v19 PISmartToneAdjustmentKey];
      [v9 removeAdjustmentWithKey:v20];

      v21 = [v9 adjustmentConstants];
      v22 = [v21 PISmartColorAdjustmentKey];
      [v9 removeAdjustmentWithKey:v22];
    }
    [(PEAutoAdjustmentController *)v17 enableAutoEnhanceOnCompositionController:v9 useCompositionIntensity:v7 valuesCalculator:v18 completionHandler:v10];
  }
  else
  {
    v23 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to fetch imageProperties for auto-enhance", v24, 2u);
    }

    v10[2](v10);
  }
}

@end