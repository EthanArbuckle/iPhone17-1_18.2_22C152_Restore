@interface PEAdjustmentStraighten
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
@end

@implementation PEAdjustmentStraighten

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v9 = a3;
  v10 = (void (**)(id, uint64_t, void))a7;
  v11 = [a4 autoCropValuesWithAccuracy:0];
  v12 = [v11 objectForKeyedSubscript:@"angle"];
  [v12 doubleValue];
  uint64_t v14 = v13;

  v15 = [v11 objectForKeyedSubscript:@"xOrigin"];
  [v15 doubleValue];
  CGFloat v17 = v16;

  v18 = [v11 objectForKeyedSubscript:@"yOrigin"];
  [v18 doubleValue];
  CGFloat v20 = v19;

  v21 = [v11 objectForKeyedSubscript:@"width"];
  [v21 doubleValue];
  CGFloat v23 = v22;

  v24 = [v11 objectForKeyedSubscript:@"height"];
  [v24 doubleValue];
  CGFloat v26 = v25;

  v32.origin.x = v17;
  v32.origin.y = v20;
  v32.size.width = v23;
  v32.size.height = v26;
  if (CGRectIsEmpty(v32)) {
    goto LABEL_4;
  }
  v33.origin.x = v17;
  v33.origin.y = v20;
  v33.size.width = v23;
  v33.size.height = v26;
  if (CGRectIsNull(v33)
    || (v34.origin.x = v17, v34.origin.y = v20, v34.size.width = v23, v34.size.height = v26, CGRectIsInfinite(v34)))
  {
LABEL_4:
    v27 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v27, OS_LOG_TYPE_INFO, "PEAdjustmentStraighten auto calculator failed", buf, 2u);
    }
  }
  else
  {
    v28 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v28, OS_LOG_TYPE_INFO, "PEAdjustmentStraighten auto calculator succeeded", buf, 2u);
    }

    uint64_t v29 = *MEMORY[0x263F5D6E0];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __125__PEAdjustmentStraighten_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
    v30[3] = &__block_descriptor_72_e36_v16__0__PICropAdjustmentController_8l;
    *(CGFloat *)&v30[4] = v17;
    *(CGFloat *)&v30[5] = v20;
    *(CGFloat *)&v30[6] = v23;
    *(CGFloat *)&v30[7] = v26;
    v30[8] = v14;
    [v9 modifyAdjustmentWithKey:v29 modificationBlock:v30];
  }
  v10[2](v10, 1, 0);
}

void __125__PEAdjustmentStraighten_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  id v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  [v7 setAngle:a1[8]];
  [v7 setEnabled:1];
  [v7 setIsAuto:1];
  [v7 setConstraintWidth:0];
  [v7 setConstraintHeight:0];
}

- (int64_t)category
{
  return 7;
}

@end