@interface TSMaximumTimeIntervalErrorAnalysis
+ (id)additionalScriptInitialization;
+ (id)additionalScriptPlots:(id)a3;
+ (id)additionalScriptRecords;
+ (id)plotSize;
+ (id)plotTitle;
+ (id)plotYLabel;
+ (id)plotYLimits:(id)a3;
+ (id)variableName;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3;
- (NSArray)mtie;
- (TSMaximumTimeIntervalErrorAnalysis)initWithTimeErrorValues:(id)a3;
- (id)mtieFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (void)dealloc;
@end

@implementation TSMaximumTimeIntervalErrorAnalysis

- (TSMaximumTimeIntervalErrorAnalysis)initWithTimeErrorValues:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSMaximumTimeIntervalErrorAnalysis;
  v3 = [(TSTimeErrorAnalysis *)&v8 initWithTimeErrorValues:a3];
  v4 = v3;
  if (v3)
  {
    v3->_negativeTimeErrors = (double *)malloc_type_calloc([(TSTimeErrorAnalysis *)v3 numberOfErrors], 8uLL, 0x100004000313F17uLL);
    v5 = (double *)malloc_type_calloc([(TSTimeErrorAnalysis *)v4 numberOfErrors], 8uLL, 0x100004000313F17uLL);
    v4->_mtie = v5;
    if (v5 && v4->_negativeTimeErrors)
    {
      double __B = -1.0;
      vDSP_vsmulD([(TSTimeErrorAnalysis *)v4 timeErrors], 1, &__B, v4->_negativeTimeErrors, 1, [(TSTimeErrorAnalysis *)v4 numberOfErrors]);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v9 = [(TSTimeErrorAnalysis *)self numberOfErrors];
  double __B = -1.0;
  size_t v10 = 8 * v9 - 1;
  v11 = (double *)malloc_type_malloc(v10, 0x403C03D0uLL);
  v12 = (double *)malloc_type_malloc(v10, 0x6CE58DF4uLL);
  v13 = (double *)malloc_type_malloc(v10, 0x666BAD40uLL);
  v14 = [(TSTimeErrorAnalysis *)self timeErrors];
  if (v11 && v12 && v13 && a3 <= a4)
  {
    v15 = v14;
    int64_t v16 = a3;
    vDSP_Length v17 = v9 - a3 + 1;
    do
    {
      vDSP_vswmaxD(v15, 1, v11, 1, v17, a3);
      vDSP_vswmaxD(self->_negativeTimeErrors, 1, v12, 1, v17, a3);
      vDSP_vsmulD(v12, 1, &__B, v12, 1, v17);
      vDSP_vsubD(v12, 1, v11, 1, v13, 1, v17);
      vDSP_maxvD(v13, 1, &self->_mtie[v16], v17);
      a3 += a5;
      v16 += a5;
      v17 -= a5;
    }
    while (a3 <= a4);
  }
  free(v11);
  free(v12);
  free(v13);
}

- (NSArray)mtie
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if (![(TSTimeErrorAnalysis *)self calculated]) {
    [(TSTimeErrorAnalysis *)self performAnalysis];
  }
  for (uint64_t i = [(TSTimeErrorAnalysis *)self lowestWindowSize];
        i <= [(TSTimeErrorAnalysis *)self highestWindowSize];
        i += [(TSTimeErrorAnalysis *)self calculatedStepSize])
  {
    v5 = [TSMTIEValue alloc];
    [(TSTimeErrorAnalysis *)self averagePeriod];
    v7 = [(TSMTIEValue *)v5 initWithObservationInterval:v6 * (double)i andMTIE:self->_mtie[i]];
    [v3 addObject:v7];
  }
  return (NSArray *)v3;
}

- (id)mtieFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if (a3 <= 2) {
    a3 = 2;
  }
  if ([(TSTimeErrorAnalysis *)self analysisLimit] < a4) {
    a4 = [(TSTimeErrorAnalysis *)self analysisLimit] - 1;
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
    v15 = [TSMTIEValue alloc];
    [(TSTimeErrorAnalysis *)self averagePeriod];
    vDSP_Length v17 = [(TSMTIEValue *)v15 initWithObservationInterval:v16 * (double)a3 andMTIE:self->_mtie[a3]];
    [v9 addObject:v17];

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return [(TSTimeErrorAnalysis *)self exportAnalysisToDirectoryURL:a3 withFilename:@"mtie.csv"];
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
    if ([(TSTimeErrorAnalysis *)self analysisLimit] < a6) {
      a6 = [(TSTimeErrorAnalysis *)self analysisLimit];
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
    vDSP_Length v17 = fopen((const char *)[v16 UTF8String], "w");
    BOOL v18 = v17 != 0;
    if (v17)
    {
      v19 = v17;
      fwrite("window size,observation interval,mtie\n", 0x26uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        [(TSTimeErrorAnalysis *)self averagePeriod];
        fprintf(v19, "%ld,%.9f,%.3f\n", a5, v20 * (double)a5 / 1000000000.0, self->_mtie[a5]);
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
  return [(TSTimeErrorAnalysis *)self exportTimeErrorsToDirectoryURL:a3 withFilename:@"time_error_mtie.csv"];
}

- (void)dealloc
{
  free(self->_negativeTimeErrors);
  free(self->_mtie);
  v3.receiver = self;
  v3.super_class = (Class)TSMaximumTimeIntervalErrorAnalysis;
  [(TSTimeErrorAnalysis *)&v3 dealloc];
}

+ (id)variableName
{
  return @"mtie";
}

+ (id)plotYLabel
{
  return @"MTIE (ns)";
}

+ (id)plotTitle
{
  return @"MTIE Masks";
}

+ (id)plotYLimits:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.set_ylim([10,1000000000])", a3];
}

+ (id)plotSize
{
  return @"f1.set_size_inches(9.5, 13)";
}

+ (id)additionalScriptInitialization
{
  return @"def looseMTIE(x):\n\tif x < 0.01:\n\t\treturn float(x) * 1000000000\n\telif 0.01 <= x:\n\t\treturn 0.01 * 1000000000\n\treturn math.nan\n\ndef tightMTIE(x):\n\tif x < 0.00001:\n\t\treturn float(x) * 1000000000\n\telse:\n\t\treturn 0.00001 * 1000000000\n\treturn math.nan\n\ndef gPTP7HopMTIE(x):\n\tif x < 0.4069:\n\t\treturn 407\n\telif x < 1:\n\t\treturn float(x) * 1000\n\telse:\n\t\treturn 1000\n\treturn math.nan\n\ndef gPTP1HopMTIE(x):\n\treturn 160\n\nvLooseMTIE = np.vectorize(looseMTIE)\nvTightMTIE = np.vectorize(tightMTIE)\nvGPTP7HopMTIE = np.vectorize(gPTP7HopMTIE)\nvGPTP1HopMTIE = np.vectorize(gPTP1HopMTIE)\n";
}

+ (id)additionalScriptRecords
{
  return @"looseMask = vLooseMTIE(tau)\ntightMask = vTightMTIE(tau)\ngPTP7HopMask = vGPTP7HopMTIE(tau)\ngPTP1HopMask = vGPTP1HopMTIE(tau)\n";
}

+ (id)additionalScriptPlots:(id)a3
{
  return (id)[NSString stringWithFormat:@"l2, = %@.plot(tau, looseMask, 'g-', label='Audio Group')\nl3, = %@.plot(tau, tightMask, 'b-', label='Audio Cluster')\nl4, = %@.plot(tau, gPTP7HopMask, '-', color='#9a0eea', label='gPTP 7 Hop')\nl5, = %@.plot(tau, gPTP1HopMask, '-', color='#fac205', label='gPTP 1 Hop')\nax1.legend(loc='best', fontsize='x-small')\n", a3, a3, a3, a3];
}

@end