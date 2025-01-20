@interface TSTimeDeviationAnalysis
+ (id)plotSize;
+ (id)plotTitle;
+ (id)plotYLabel;
+ (id)variableName;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3;
- (NSArray)tdev;
- (TSTimeDeviationAnalysis)initWithTimeErrorValues:(id)a3;
- (id)tdevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (int64_t)analysisLimit;
- (int64_t)threadingLimit;
- (int64_t)threadingSegment;
- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (void)dealloc;
@end

@implementation TSTimeDeviationAnalysis

- (TSTimeDeviationAnalysis)initWithTimeErrorValues:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTimeDeviationAnalysis;
  v3 = [(TSTimeErrorAnalysis *)&v7 initWithTimeErrorValues:a3];
  v4 = v3;
  if (v3)
  {
    v5 = (double *)malloc_type_calloc([(TSTimeErrorAnalysis *)v3 numberOfErrors], 8uLL, 0x100004000313F17uLL);
    v4->_tdev = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (int64_t)analysisLimit
{
  return [(TSTimeErrorAnalysis *)self numberOfErrors] / 3 - 1;
}

- (int64_t)threadingLimit
{
  return 10000;
}

- (int64_t)threadingSegment
{
  return [(TSTimeDeviationAnalysis *)self threadingLimit] / 10;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v7 = [(TSTimeErrorAnalysis *)self numberOfErrors];
  v16 = self;
  v15 = [(TSTimeErrorAnalysis *)self timeErrors];
  v8 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  v19 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  if (v8 && v19 && a3 <= a4)
  {
    int64_t v9 = v7 - 3 * a3 + 1;
    int64_t v10 = 2 * a3;
    int64_t v11 = a3;
    do
    {
      uint64_t v20 = -3 * a3 + v7;
      if (v20 >= 0)
      {
        uint64_t v12 = 0;
        v13 = v15;
        v14 = v19;
        do
        {
          vDSP_vsubD(&v13[v11], 1, &v13[v10], 1, v8, 1, a3 - 1);
          vDSP_vsubD(&v13[v11], 1, v8, 1, v8, 1, a3 - 1);
          vDSP_vaddD(v8, 1, v13, 1, v8, 1, a3 - 1);
          vDSP_svesqD(v8, 1, v14, a3 - 1);
          ++v12;
          ++v14;
          ++v13;
        }
        while (v9 != v12);
      }
      double __C = 0.0;
      vDSP_svesqD(v19, 1, &__C, v20 + 1);
      v16->_tdev[a3] = sqrt(__C / (double)(6 * a3 * a3 * (v20 + 1)));
      a3 += a5;
      v9 -= 3 * a5;
      v10 += 2 * a5;
      v11 += a5;
    }
    while (a3 <= a4);
  }
  free(v8);
  free(v19);
}

- (NSArray)tdev
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if (![(TSTimeErrorAnalysis *)self calculated]) {
    [(TSTimeErrorAnalysis *)self performAnalysis];
  }
  for (uint64_t i = [(TSTimeErrorAnalysis *)self lowestWindowSize];
        i <= [(TSTimeErrorAnalysis *)self highestWindowSize];
        i += [(TSTimeErrorAnalysis *)self calculatedStepSize])
  {
    v5 = [TSTDEVValue alloc];
    [(TSTimeErrorAnalysis *)self averagePeriod];
    int64_t v7 = [(TSTDEVValue *)v5 initWithObservationInterval:v6 * (double)i andTDEV:self->_tdev[i]];
    [v3 addObject:v7];
  }
  return (NSArray *)v3;
}

- (id)tdevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if (a3 <= 2) {
    a3 = 2;
  }
  if ([(TSTimeDeviationAnalysis *)self analysisLimit] < a4) {
    a4 = [(TSTimeDeviationAnalysis *)self analysisLimit];
  }
  if (![(TSTimeErrorAnalysis *)self calculated])
  {
    v13 = self;
    int64_t v14 = a3;
    int64_t v12 = a4;
LABEL_15:
    [(TSTimeErrorAnalysis *)v13 performAnalysisFromStartWindowSize:v14 toEndWindowSize:v12 stepSize:a5];
    goto LABEL_16;
  }
  if (a3 < [(TSTimeErrorAnalysis *)self lowestWindowSize]
    || a4 > [(TSTimeErrorAnalysis *)self highestWindowSize]
    || [(TSTimeErrorAnalysis *)self calculatedStepSize] != a5)
  {
    int64_t v10 = a3;
    if (a3 >= [(TSTimeErrorAnalysis *)self lowestWindowSize]) {
      int64_t v10 = [(TSTimeErrorAnalysis *)self lowestWindowSize];
    }
    int64_t v11 = [(TSTimeErrorAnalysis *)self highestWindowSize];
    int64_t v12 = a4;
    if (a4 <= v11) {
      int64_t v12 = [(TSTimeErrorAnalysis *)self highestWindowSize];
    }
    v13 = self;
    int64_t v14 = v10;
    goto LABEL_15;
  }
LABEL_16:
  while (a3 <= a4)
  {
    v15 = [TSTDEVValue alloc];
    [(TSTimeErrorAnalysis *)self averagePeriod];
    v17 = [(TSTDEVValue *)v15 initWithObservationInterval:v16 * (double)a3 andTDEV:self->_tdev[a3]];
    [v9 addObject:v17];

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return [(TSTimeErrorAnalysis *)self exportAnalysisToDirectoryURL:a3 withFilename:@"tdev.csv"];
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  if ([v12 isFileURL])
  {
    if (a5 <= 2) {
      a5 = 2;
    }
    if ([(TSTimeDeviationAnalysis *)self analysisLimit] < a6) {
      a6 = [(TSTimeDeviationAnalysis *)self analysisLimit];
    }
    if (![(TSTimeErrorAnalysis *)self calculated]
      || a5 < [(TSTimeErrorAnalysis *)self lowestWindowSize]
      || a6 > [(TSTimeErrorAnalysis *)self highestWindowSize]
      || [(TSTimeErrorAnalysis *)self calculatedStepSize] != a7)
    {
      [(TSTimeErrorAnalysis *)self performAnalysisFromStartWindowSize:a5 toEndWindowSize:a6 stepSize:a7];
    }
    int64_t v14 = [v12 path];
    v15 = [v14 stringByAppendingPathComponent:v13];

    id v16 = v15;
    v17 = fopen((const char *)[v16 UTF8String], "w");
    BOOL v18 = v17 != 0;
    if (v17)
    {
      v19 = v17;
      fwrite("window size,observation interval,tdev\n", 0x26uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        [(TSTimeErrorAnalysis *)self averagePeriod];
        fprintf(v19, "%ld,%.9f,%.18f\n", a5, v20 * (double)a5 / 1000000000.0, self->_tdev[a5]);
      }
      fclose(v19);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3
{
  return [(TSTimeErrorAnalysis *)self exportTimeErrorsToDirectoryURL:a3 withFilename:@"time_error_adev.csv"];
}

- (void)dealloc
{
  free(self->_tdev);
  v3.receiver = self;
  v3.super_class = (Class)TSTimeDeviationAnalysis;
  [(TSTimeErrorAnalysis *)&v3 dealloc];
}

+ (id)variableName
{
  return @"tdev";
}

+ (id)plotYLabel
{
  return @"TDEV";
}

+ (id)plotTitle
{
  return @"Time Deviation";
}

+ (id)plotSize
{
  return @"f1.set_size_inches(9.5, 10.7)";
}

@end