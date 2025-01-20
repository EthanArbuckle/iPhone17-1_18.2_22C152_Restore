@interface PMLClassificationEvaluationMetrics
+ (float)f1Score:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (float)precision:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (float)recall:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (float)roundFloatToSigFigs:(float)a3 sigFigs:(int)a4;
+ (unint64_t)falseNegatives:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (unint64_t)falsePositives:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (unint64_t)trueNegatives:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (unint64_t)truePositives:(id)a3 predictions:(id)a4 predicate:(id)a5;
+ (void)addScoresForOutcomes:(id)a3 predictions:(id)a4 predicate:(id)a5 metrics:(id)a6;
+ (void)setReportSamplingRate:(unsigned int)a3;
@end

@implementation PMLClassificationEvaluationMetrics

+ (void)setReportSamplingRate:(unsigned int)a3
{
  v6 = [MEMORY[0x263F08AB0] processInfo];
  id v8 = [v6 processName];

  if (([v8 isEqualToString:@"python"] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PMLClassificationEvaluationMetrics.m", 184, @"Process name %@ is not python", v8 object file lineNumber description];
  }
  kReportSamplingRate = a3;
}

+ (float)roundFloatToSigFigs:(float)a3 sigFigs:(int)a4
{
  float v5 = a3;
  BOOL v6 = a3 < 0.0;
  if (a3 == 0.0)
  {
    unsigned int v7 = 1;
  }
  else
  {
    float v8 = -a3;
    if (!v6) {
      float v8 = v5;
    }
    unsigned int v7 = vcvtpd_s64_f64(log10(v8));
  }
  float v9 = __exp10((double)(int)(a4 - v7));
  if (v9 != 0.0) {
    return roundf(v9 * v5) / v9;
  }
  return v5;
}

+ (void)addScoresForOutcomes:(id)a3 predictions:(id)a4 predicate:(id)a5 metrics:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (unsigned int (**)(void, float))a5;
  id v12 = a6;
  id v21 = v9;
  uint64_t v13 = [v21 ptr];
  id v14 = v10;
  uint64_t v15 = [v14 ptr];
  if ([v21 count])
  {
    unint64_t v16 = 0;
    do
    {
      if (arc4random_uniform(0x64u) < kReportSamplingRate
        || [MEMORY[0x263F61E28] isInternalBuild])
      {
        LODWORD(v17) = *(_DWORD *)(v15 + 4 * v16);
        +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v17];
        int v19 = v18;
        if (v11[2](v11, *(float *)(v13 + 4 * v16)))
        {
          LODWORD(v20) = v19;
          [v12 addPositiveScores:v20];
        }
        else
        {
          LODWORD(v20) = v19;
          [v12 addNegativeScores:v20];
        }
      }
      ++v16;
    }
    while (v16 < [v21 count]);
  }
}

+ (unint64_t)falseNegatives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(void, float))a5;
  id v10 = v7;
  uint64_t v11 = [v10 ptr];
  id v12 = v8;
  uint64_t v13 = [v12 ptr];
  if ([v10 count])
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v11 + 4 * v14))) {
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14)) ^ 1;
      }
      ++v14;
    }
    while (v14 < [v10 count]);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

+ (unint64_t)trueNegatives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(void, float))a5;
  id v10 = v7;
  uint64_t v11 = [v10 ptr];
  id v12 = v8;
  uint64_t v13 = [v12 ptr];
  if ([v10 count])
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      if ((((uint64_t (*)(void, float))v9[2])(v9, *(float *)(v11 + 4 * v14)) & 1) == 0) {
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14)) ^ 1;
      }
      ++v14;
    }
    while (v14 < [v10 count]);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

+ (unint64_t)falsePositives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(void, float))a5;
  id v10 = v7;
  uint64_t v11 = [v10 ptr];
  id v12 = v8;
  uint64_t v13 = [v12 ptr];
  if ([v10 count])
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      if ((((uint64_t (*)(void, float))v9[2])(v9, *(float *)(v11 + 4 * v14)) & 1) == 0) {
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14));
      }
      ++v14;
    }
    while (v14 < [v10 count]);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

+ (unint64_t)truePositives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(void, float))a5;
  id v10 = v7;
  uint64_t v11 = [v10 ptr];
  id v12 = v8;
  uint64_t v13 = [v12 ptr];
  if ([v10 count])
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v11 + 4 * v14))) {
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14));
      }
      ++v14;
    }
    while (v14 < [v10 count]);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

+ (float)f1Score:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  +[PMLClassificationEvaluationMetrics precision:v9 predictions:v8 predicate:v7];
  float v11 = v10;
  +[PMLClassificationEvaluationMetrics recall:v9 predictions:v8 predicate:v7];
  float v13 = v12;

  float result = 0.0;
  if ((float)(v11 + v13) != 0.0) {
    return (float)((float)(v11 + v11) * v13) / (float)(v11 + v13);
  }
  return result;
}

+ (float)recall:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(void, float))a5;
  id v10 = v7;
  uint64_t v11 = [v10 ptr];
  id v12 = v8;
  uint64_t v13 = [v12 ptr];
  float v14 = 0.0;
  if ([v10 count])
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v11 + 4 * v15)))
      {
        ++v17;
        v16 += v9[2](v9, *(float *)(v13 + 4 * v15));
      }
      ++v15;
    }
    while (v15 < [v10 count]);
    if (v17) {
      float v14 = (double)v16 / (double)v17;
    }
  }

  return v14;
}

+ (float)precision:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(void, float))a5;
  id v10 = v7;
  uint64_t v11 = [v10 ptr];
  id v12 = v8;
  uint64_t v13 = [v12 ptr];
  float v14 = 0.0;
  if ([v10 count])
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v13 + 4 * v15)))
      {
        ++v16;
        v17 += v9[2](v9, *(float *)(v11 + 4 * v15));
      }
      ++v15;
    }
    while (v15 < [v10 count]);
    if (v16) {
      float v14 = (double)v17 / (double)v16;
    }
  }

  return v14;
}

@end