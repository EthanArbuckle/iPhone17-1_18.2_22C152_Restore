@interface PICurvesRGBAutoCalculator
- (id)computeCurvesForImageHistogram:(id)a3;
@end

@implementation PICurvesRGBAutoCalculator

- (id)computeCurvesForImageHistogram:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 red];
  [v4 percentile:0.001];
  double v6 = v5;

  v7 = [v3 red];
  [v7 percentile:0.999];
  double v9 = v8;

  v10 = +[PICurvesAutoCalculator autoValuesForBlackPoint:v6 whitePoint:v9];
  v11 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_114);
  }
  v12 = (os_log_t *)MEMORY[0x1E4F7A758];
  v13 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v40 = v6;
    __int16 v41 = 2048;
    double v42 = v9;
    _os_log_debug_impl(&dword_1A9680000, v13, OS_LOG_TYPE_DEBUG, "red curve: blackPoint = %f, whitePoint = %f", buf, 0x16u);
  }
  v14 = [v3 green];
  [v14 percentile:0.001];
  double v16 = v15;

  v17 = [v3 green];
  [v17 percentile:0.999];
  double v19 = v18;

  v20 = +[PICurvesAutoCalculator autoValuesForBlackPoint:v16 whitePoint:v19];
  if (*v11 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_114);
  }
  v21 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v40 = v16;
    __int16 v41 = 2048;
    double v42 = v19;
    _os_log_debug_impl(&dword_1A9680000, v21, OS_LOG_TYPE_DEBUG, "green curve: blackPoint = %f, whitePoint = %f", buf, 0x16u);
  }
  v22 = [v3 blue];
  [v22 percentile:0.001];
  double v24 = v23;

  v25 = [v3 blue];
  [v25 percentile:0.999];
  double v27 = v26;

  v28 = +[PICurvesAutoCalculator autoValuesForBlackPoint:v24 whitePoint:v27];
  if (*v11 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_114);
  }
  v29 = *v12;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v40 = v24;
    __int16 v41 = 2048;
    double v42 = v27;
    _os_log_debug_impl(&dword_1A9680000, v29, OS_LOG_TYPE_DEBUG, "blue curve: blackPoint = %f, whitePoint = %f", buf, 0x16u);
  }
  v30 = +[PICurvesAutoCalculator _defaultCurveArray];
  v31 = +[PICurvesAutoCalculator dictionariesFromPoints:v30, @"RGBCurvePoints"];
  v38[0] = v31;
  v37[1] = @"redCurvePoints";
  v32 = +[PICurvesAutoCalculator dictionariesFromPoints:v10];
  v38[1] = v32;
  v37[2] = @"greenCurvePoints";
  v33 = +[PICurvesAutoCalculator dictionariesFromPoints:v20];
  v38[2] = v33;
  v37[3] = @"blueCurvePoints";
  v34 = +[PICurvesAutoCalculator dictionariesFromPoints:v28];
  v38[3] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];

  return v35;
}

@end