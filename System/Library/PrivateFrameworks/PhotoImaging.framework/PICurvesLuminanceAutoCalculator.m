@interface PICurvesLuminanceAutoCalculator
- (CGPoint)curvePointAtIndex:(int)a3 blackPoint:(double)a4 whitePoint:(double)a5 histogram:(id)a6;
- (id)computeCurvesForImageHistogram:(id)a3;
@end

@implementation PICurvesLuminanceAutoCalculator

- (CGPoint)curvePointAtIndex:(int)a3 blackPoint:(double)a4 whitePoint:(double)a5 histogram:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = 0;
  v51[2] = xmmword_1A9812A20;
  v51[3] = unk_1A9812A30;
  v51[4] = xmmword_1A9812A40;
  v51[0] = xmmword_1A9812A00;
  v51[1] = unk_1A9812A10;
  double v47 = 0.0;
  uint64_t v48 = 0;
  long long v49 = xmmword_1A980BA60;
  long long v50 = xmmword_1A980BA70;
  long long v45 = 0u;
  long long v46 = 0u;
  double v41 = a4;
  long long v42 = xmmword_1A980BA60;
  uint64_t v43 = 0x3FE8000000000000;
  double v44 = a5;
  do
  {
    [v9 percentile:*(double *)((char *)&v41 + v10)];
    *(void *)((char *)&v45 + v10) = v11;
    v10 += 8;
  }
  while (v10 != 40);
  uint64_t v12 = 0;
  double v39 = 0.0;
  double v40 = 0.0;
  do
  {
    [v9 percentile:*(double *)&qword_1A980BAE0[v12]];
    *(void *)((char *)&v39 + v12 * 8) = v13;
    ++v12;
  }
  while (v12 != 2);
  double v14 = v39;
  if (v39 > 0.01 || (double v14 = v40, v40 > 0.01))
  {
    double v16 = fmin((v14 + -0.01) / 0.03, 1.0);
    double v15 = (1.0 - v16) * *(double *)&v45 + v16 * v14;
  }
  else
  {
    double v15 = *(double *)&v45;
  }
  uint64_t v17 = 0;
  double v18 = fmin(v15 + 1.0 - v47, 1.0);
  double v19 = v15 * (sqrt(v15) * -0.65 + 1.0) * 0.75;
  double v20 = (1.0 - v47) * fmin(fmax((1.0 - v47) * -0.8 + 1.0, 0.6), 1.0) * -0.5 + 1.0;
  double v21 = 1.0 / (v20 - v19);
  *(double *)&long long v45 = v19;
  *((double *)&v45 + 1) = (*((double *)&v45 + 1)
                         + (*(double *)&v46 - v19 + 1.0) * v19
                         + (*(double *)&v46 - v19 + 1.0) * *(double *)&v46)
                        / ((*(double *)&v46 - v19) * 2.0 + 3.0);
  *((double *)&v46 + 1) = (*((double *)&v46 + 1)
                         + (v20 - *(double *)&v46 + 1.0) * v20
                         + (v20 - *(double *)&v46 + 1.0) * *(double *)&v46)
                        / ((v20 - *(double *)&v46) * 2.0 + 3.0);
  double v47 = v20;
  double v22 = fmax(v18 * -2.0 + 1.0, 0.0);
  double v23 = (*(double *)&v46 - v19) * v21;
  double v24 = (1.0 - v22) * v21;
  *(double *)&long long v49 = v24 * (*((double *)&v45 + 1) - v19)
                  + v22 * fmin((v23 + 0.0) * 0.5, v21 * (*((double *)&v45 + 1) - v19));
  *((double *)&v49 + 1) = v23;
  *(double *)&long long v50 = v24 * (*((double *)&v46 + 1) - v19)
                  + v22 * fmax((v23 + 1.0) * 0.5, v21 * (*((double *)&v46 + 1) - v19));
  v25 = (void *)v51 + 1;
  do
  {
    uint64_t v26 = *(uint64_t *)((char *)&v48 + v17);
    *(v25 - 1) = *(void *)((char *)&v45 + v17);
    void *v25 = v26;
    v17 += 8;
    v25 += 2;
  }
  while (v17 != 40);
  uint64_t v27 = 0;
  uint64_t v28 = 24;
  do
  {
    double v29 = *(double *)&v51[v27];
    uint64_t v30 = v28;
    do
    {
      v31 = (double *)((char *)v51 + v30);
      double v32 = *(double *)((char *)&v50 + v30 + 8);
      if (v29 == v32) {
        *(v31 - 3) = v29 + -0.001;
      }
      double v33 = *(v31 - 2);
      if (v33 == *v31) {
        *(v31 - 2) = v33 + -0.001;
      }
      v30 += 16;
      double v29 = v32;
    }
    while (v30 != 88);
    ++v27;
    v28 += 16;
  }
  while (v27 != 4);
  v34 = (double *)&v51[a3 % 5];
  double v35 = *v34;
  double v36 = v34[1];

  double v37 = v35;
  double v38 = v36;
  result.y = v38;
  result.x = v37;
  return result;
}

- (id)computeCurvesForImageHistogram:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v6 = &v53;
  do
  {
    v7 = [a3 luminance];
    [(PICurvesLuminanceAutoCalculator *)self curvePointAtIndex:v5 blackPoint:v7 whitePoint:0.001 histogram:0.999];
    *(v6 - 1) = v8;
    uint64_t *v6 = v9;

    ++v5;
    v6 += 2;
  }
  while (v5 != 5);
  uint64_t v10 = v52[0];
  double v11 = v54;
  uint64_t v12 = +[PICurvesAutoCalculator autoValuesForBlackPoint:*(double *)v52 whitePoint:v54];
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_114);
  }
  double v14 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v48 = v10;
    _os_log_debug_impl(&dword_1A9680000, v14, OS_LOG_TYPE_DEBUG, "s-curve black: %f", buf, 0xCu);
  }
  uint64_t v16 = 1;
  *(void *)&long long v15 = 67109632;
  long long v40 = v15;
  do
  {
    uint64_t v17 = [[PICurveControlPoint alloc] initWithX:1 y:*(double *)&v52[2 * v16] editable:*(double *)&v52[2 * v16 + 1]];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v42;
      while (2)
      {
        uint64_t v23 = 0;
        uint64_t v24 = v21 + v20;
        do
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v23), "x", v40);
          double v26 = v25;
          [(PICurveControlPoint *)v17 x];
          if (v26 > v27)
          {
            uint64_t v24 = v21 + v23;
            goto LABEL_19;
          }
          ++v23;
        }
        while (v20 != v23);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v51 count:16];
        uint64_t v21 = v24;
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
LABEL_19:

    [v18 insertObject:v17 atIndex:v24];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_114);
    }
    uint64_t v28 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      double v29 = v28;
      [(PICurveControlPoint *)v17 x];
      uint64_t v31 = v30;
      [(PICurveControlPoint *)v17 y];
      *(_DWORD *)buf = v40;
      *(_DWORD *)uint64_t v48 = v16;
      *(_WORD *)&v48[4] = 2048;
      *(void *)&v48[6] = v31;
      __int16 v49 = 2048;
      uint64_t v50 = v32;
      _os_log_debug_impl(&dword_1A9680000, v29, OS_LOG_TYPE_DEBUG, "s-curve point %d: (%f, %f)", buf, 0x1Cu);
    }
    ++v16;
  }
  while (v16 != 4);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_114);
  }
  double v33 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)uint64_t v48 = v11;
    _os_log_debug_impl(&dword_1A9680000, v33, OS_LOG_TYPE_DEBUG, "s-curve white: %f", buf, 0xCu);
  }
  v34 = [[PICurveControlPoint alloc] initWithX:1 y:1.99 editable:1.99];
  [v18 addObject:v34];

  double v35 = +[PICurvesAutoCalculator _defaultCurveArray];
  double v36 = +[PICurvesAutoCalculator dictionariesFromPoints:v35];
  v45[0] = @"RGBCurvePoints";
  double v37 = +[PICurvesAutoCalculator dictionariesFromPoints:v18];
  v46[0] = v37;
  v46[1] = v36;
  v45[1] = @"redCurvePoints";
  v45[2] = @"greenCurvePoints";
  v45[3] = @"blueCurvePoints";
  v46[2] = v36;
  v46[3] = v36;
  double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:4];

  return v38;
}

@end