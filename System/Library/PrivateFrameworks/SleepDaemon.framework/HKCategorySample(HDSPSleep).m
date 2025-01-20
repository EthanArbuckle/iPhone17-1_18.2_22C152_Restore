@interface HKCategorySample(HDSPSleep)
+ (id)hdsp_categorySampleForSleepSessionInterval:()HDSPSleep metadata:;
@end

@implementation HKCategorySample(HDSPSleep)

+ (id)hdsp_categorySampleForSleepSessionInterval:()HDSPSleep metadata:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
    [v7 maximumAllowedDuration];
    double v9 = v8;
    v10 = [v5 interval];
    [v10 duration];
    double v12 = v11;

    if (v12 <= v9)
    {
      uint64_t v17 = [v5 type];
      if ((unint64_t)(v17 - 1) > 4) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = qword_221AD62D0[v17 - 1];
      }
      v19 = (void *)MEMORY[0x263F0A150];
      v20 = [v5 interval];
      v21 = [v20 startDate];
      v22 = [v5 interval];
      v23 = [v22 endDate];
      v24 = [MEMORY[0x263F0A2D8] localDevice];
      v16 = [v19 categorySampleWithType:v7 value:v18 startDate:v21 endDate:v23 device:v24 metadata:v6];

      goto LABEL_13;
    }
    v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v5 interval];
      [v14 duration];
      int v26 = 134218240;
      uint64_t v27 = v15;
      __int16 v28 = 2048;
      double v29 = v9;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "Sleep interval: %f greater than allowed: %f. Will not be used", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "sleepInterval is nil", (uint8_t *)&v26, 2u);
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

@end