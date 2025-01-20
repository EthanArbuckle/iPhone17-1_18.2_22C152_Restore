@interface TSAllanDeviationAnalysis
+ (id)plotSize;
+ (id)plotTitle;
+ (id)plotYLabel;
+ (id)variableName;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3;
- (NSArray)adev;
- (TSAllanDeviationAnalysis)initWithTimeErrorValues:(id)a3;
- (id)adevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (int64_t)analysisLimit;
- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (void)dealloc;
@end

@implementation TSAllanDeviationAnalysis

- (TSAllanDeviationAnalysis)initWithTimeErrorValues:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSAllanDeviationAnalysis;
  v3 = [(TSTimeErrorAnalysis *)&v7 initWithTimeErrorValues:a3];
  v4 = v3;
  if (v3)
  {
    v5 = (double *)malloc_type_calloc([(TSTimeErrorAnalysis *)v3 numberOfErrors], 8uLL, 0x100004000313F17uLL);
    v4->_adev = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (int64_t)analysisLimit
{
  uint64_t v2 = [(TSTimeErrorAnalysis *)self numberOfErrors];
  uint64_t v3 = v2 - 1;
  if (v2 < 1) {
    uint64_t v3 = v2;
  }
  return (v3 >> 1) - 1;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v8 = [(TSTimeErrorAnalysis *)self numberOfErrors];
  __B = [(TSTimeErrorAnalysis *)self timeErrors];
  v9 = (double *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
  [(TSTimeErrorAnalysis *)self averagePeriod];
  double v11 = v10;
  [(TSTimeErrorAnalysis *)self averagePeriod];
  if (v9)
  {
    int64_t v13 = a4;
    if (a3 <= a4)
    {
      double v14 = v11 * v12;
      v15 = &__B[a3];
      int64_t v16 = 2 * a3;
      int64_t v17 = v8 - 2 * a3;
      int64_t v18 = 2 * a5;
      v19 = &__B[2 * a3];
      do
      {
        int64_t v20 = v13;
        vDSP_vsubD(v15, 1, v19, 1, v9, 1, v17);
        vDSP_vsubD(v15, 1, v9, 1, v9, 1, v17);
        vDSP_vaddD(v9, 1, __B, 1, v9, 1, v17);
        double __C = 0.0;
        vDSP_svesqD(v9, 1, &__C, v17);
        int64_t v13 = v20;
        self->_adev[a3] = sqrt(__C / (v14 * (double)(v16 * a3) * (double)v17));
        a3 += a5;
        v15 += a5;
        v17 -= v18;
        v19 += 2 * a5;
        v16 += v18;
      }
      while (a3 <= v20);
    }
  }
  free(v9);
}

- (NSArray)adev
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (![(TSTimeErrorAnalysis *)self calculated]) {
    [(TSTimeErrorAnalysis *)self performAnalysis];
  }
  for (uint64_t i = [(TSTimeErrorAnalysis *)self lowestWindowSize];
        i <= [(TSTimeErrorAnalysis *)self highestWindowSize];
        i += [(TSTimeErrorAnalysis *)self calculatedStepSize])
  {
    v5 = [TSADEVValue alloc];
    [(TSTimeErrorAnalysis *)self averagePeriod];
    objc_super v7 = [(TSADEVValue *)v5 initWithObservationInterval:v6 * (double)i andADEV:self->_adev[i]];
    [v3 addObject:v7];
  }
  return (NSArray *)v3;
}

- (id)adevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  v9 = [MEMORY[0x1E4F1CA48] array];
  if (a3 <= 2) {
    a3 = 2;
  }
  if ([(TSAllanDeviationAnalysis *)self analysisLimit] < a4) {
    a4 = [(TSAllanDeviationAnalysis *)self analysisLimit];
  }
  if (![(TSTimeErrorAnalysis *)self calculated])
  {
    int64_t v13 = self;
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
    int64_t v13 = self;
    int64_t v14 = v10;
    goto LABEL_15;
  }
LABEL_16:
  while (a3 <= a4)
  {
    v15 = [TSADEVValue alloc];
    [(TSTimeErrorAnalysis *)self averagePeriod];
    int64_t v17 = [(TSADEVValue *)v15 initWithObservationInterval:v16 * (double)a3 andADEV:self->_adev[a3]];
    [v9 addObject:v17];

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return [(TSTimeErrorAnalysis *)self exportAnalysisToDirectoryURL:a3 withFilename:@"adev.csv"];
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
    if ([(TSAllanDeviationAnalysis *)self analysisLimit] < a6) {
      a6 = [(TSAllanDeviationAnalysis *)self analysisLimit];
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
    int64_t v17 = fopen((const char *)[v16 UTF8String], "w");
    BOOL v18 = v17 != 0;
    if (v17)
    {
      v19 = v17;
      fwrite("window size,observation interval,adev\n", 0x26uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        [(TSTimeErrorAnalysis *)self averagePeriod];
        fprintf(v19, "%ld,%.9f,%.18f\n", a5, v20 * (double)a5 / 1000000000.0, self->_adev[a5]);
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
  free(self->_adev);
  v3.receiver = self;
  v3.super_class = (Class)TSAllanDeviationAnalysis;
  [(TSTimeErrorAnalysis *)&v3 dealloc];
}

+ (id)variableName
{
  return @"adev";
}

+ (id)plotYLabel
{
  return @"ADEV";
}

+ (id)plotTitle
{
  return @"Allan Deviation";
}

+ (id)plotSize
{
  return @"f1.set_size_inches(9.5, 10.7)";
}

@end