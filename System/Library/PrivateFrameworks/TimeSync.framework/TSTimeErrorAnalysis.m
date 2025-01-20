@interface TSTimeErrorAnalysis
+ (id)additionalScriptInitialization;
+ (id)additionalScriptPlots:(id)a3;
+ (id)additionalScriptRecords;
+ (id)generatePythonScriptWithOutputPath:(id)a3 fileName:(id)a4 titleName:(id)a5 plotPath:(id)a6 showPlot:(BOOL)a7;
+ (id)keyPathsForValuesAffectingAnalysisLimit;
+ (id)plotSize;
+ (id)plotTitle;
+ (id)plotYLabel;
+ (id)plotYLimits:(id)a3;
+ (id)variableName;
- (BOOL)calculated;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4;
- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3 withFilename:(id)a4;
- (TSTimeErrorAnalysis)initWithTimeErrorValues:(id)a3;
- (double)averagePeriod;
- (double)timeErrors;
- (double)timestamps;
- (int64_t)analysisLimit;
- (int64_t)calculatedStepSize;
- (int64_t)highestWindowSize;
- (int64_t)lowestWindowSize;
- (int64_t)numberOfErrors;
- (int64_t)threadingLimit;
- (int64_t)threadingSegment;
- (void)dealloc;
- (void)performAnalysis;
- (void)performAnalysisFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5;
- (void)performAnalysisFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5 withThreadingOption:(int64_t)a6;
- (void)performAnalysisWithThreadingOption:(int64_t)a3;
@end

@implementation TSTimeErrorAnalysis

- (TSTimeErrorAnalysis)initWithTimeErrorValues:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TSTimeErrorAnalysis;
  v5 = [(TSTimeErrorAnalysis *)&v22 init];
  if (v5)
  {
    int64_t v6 = [v4 count];
    v5->_numberOfErrors = v6;
    if (v6 < 1)
    {

      v5 = 0;
    }
    else
    {
      v5->_timestamps = (double *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
      v5->_timeErrors = (double *)malloc_type_calloc(v5->_numberOfErrors, 8uLL, 0x100004000313F17uLL);
      v7 = (double *)malloc_type_calloc(v5->_numberOfErrors, 8uLL, 0x100004000313F17uLL);
      if (v7 && v5->_timestamps && v5->_timeErrors)
      {
        v8 = [v4 objectAtIndexedSubscript:0];
        uint64_t v9 = [v8 timestamp];

        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = v4;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v10);
              }
              v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              v5->_timestamps[v13] = (double)(unint64_t)(objc_msgSend(v16, "timestamp", (void)v18) - v9);
              v5->_timeErrors[v13++] = (double)[v16 error];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
          }
          while (v12);
        }

        vDSP_vsubD(v5->_timestamps, 1, (const double *)v5->_timestamps + 1, 1, v7, 1, v5->_numberOfErrors - 1);
        vDSP_meanvD(v7, 1, &v5->_averagePeriod, v5->_numberOfErrors - 1);
      }
      else
      {

        v5 = 0;
      }
      free(v7);
    }
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingAnalysisLimit
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"numberOfErrors"];
}

- (int64_t)analysisLimit
{
  return [(TSTimeErrorAnalysis *)self numberOfErrors] - 1;
}

- (int64_t)threadingLimit
{
  return 250000;
}

- (int64_t)threadingSegment
{
  return 25000;
}

- (void)performAnalysis
{
}

- (void)performAnalysisWithThreadingOption:(int64_t)a3
{
  int64_t v5 = [(TSTimeErrorAnalysis *)self analysisLimit];
  [(TSTimeErrorAnalysis *)self performAnalysisFromStartWindowSize:2 toEndWindowSize:v5 stepSize:1 withThreadingOption:a3];
}

- (void)performAnalysisFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
}

- (void)performAnalysisFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5 withThreadingOption:(int64_t)a6
{
  uint64_t v11 = mach_absolute_time();
  if (a3 <= 2) {
    int64_t v12 = 2;
  }
  else {
    int64_t v12 = a3;
  }
  if ([(TSTimeErrorAnalysis *)self analysisLimit] < a4) {
    a4 = [(TSTimeErrorAnalysis *)self analysisLimit];
  }
  if (a6 != 1
    && (a6
     || (int64_t numberOfErrors = self->_numberOfErrors,
         numberOfErrors < [(TSTimeErrorAnalysis *)self threadingLimit]))
    || ([MEMORY[0x1E4F28F80] processInfo],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        intptr_t v15 = [v14 activeProcessorCount],
        v14,
        v15 == 1))
  {
    [(TSTimeErrorAnalysis *)self _performAnalysisFromWindowSize:v12 toWindowSize:a4 stepSize:a5];
  }
  else
  {
    uint64_t v38 = v11;
    v16 = NSString;
    v17 = (objc_class *)objc_opt_class();
    long long v18 = NSStringFromClass(v17);
    id v19 = [v16 stringWithFormat:@"com.apple.timesync.%@.parallel", v18];
    long long v20 = (const char *)[v19 UTF8String];
    dispatch_queue_t v41 = dispatch_queue_create(v20, MEMORY[0x1E4F14430]);

    long long v21 = NSString;
    objc_super v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    id v24 = [v21 stringWithFormat:@"com.apple.timesync.%@.sequence", v23];
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v24 UTF8String], 0);

    dispatch_semaphore_t v26 = dispatch_semaphore_create(v15);
    dispatch_group_t v27 = dispatch_group_create();
    int64_t v28 = (a4 - v12 + 1) / v15;
    if ([(TSTimeErrorAnalysis *)self threadingSegment] < v28) {
      int64_t v28 = [(TSTimeErrorAnalysis *)self threadingSegment];
    }
    if (a5 >= 2) {
      int64_t v28 = v28 / a5 * a5 - v28 + 2 * v28;
    }
    v42 = self;
    int64_t v43 = a5;
    int64_t v39 = v12;
    v29 = v25;
    dispatch_semaphore_t v30 = v26;
    if (v12 < a4 - 1)
    {
      uint64_t v40 = MEMORY[0x1E4F143A8];
      int64_t v31 = v28;
      do
      {
        block[0] = v40;
        block[1] = 3221225472;
        block[2] = __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke;
        block[3] = &unk_1E622A9B0;
        v45 = v30;
        int64_t v32 = v28;
        v33 = v30;
        v34 = v29;
        v35 = v27;
        v46 = v35;
        v47 = v41;
        v48 = v42;
        int64_t v49 = v12;
        int64_t v50 = v31;
        int64_t v51 = v43;
        v36 = v35;
        v29 = v34;
        dispatch_semaphore_t v30 = v33;
        int64_t v28 = v32;
        dispatch_group_async(v36, v29, block);
        int64_t v12 = v31 + 1;
        if (v31 + v32 >= a4) {
          int64_t v31 = a4;
        }
        else {
          v31 += v32;
        }
      }
      while (v12 < a4 - 1);
    }
    dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v11 = v38;
    int64_t v12 = v39;
    self = v42;
    a5 = v43;
  }
  uint64_t v37 = mach_absolute_time();
  self->_calculated = 1;
  self->_lowestWindowSize = v12;
  self->_highestWindowSize = a4;
  self->_calculatedStepSize = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[TSAudioTimeErrorCalculator calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:](v37, v11);
  }
}

intptr_t __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(a1 + 40);
  v3 = *(NSObject **)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke_2;
  v5[3] = &unk_1E622A988;
  v5[4] = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  dispatch_group_async(v2, v3, v5);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAnalysisFromWindowSize:*(void *)(a1 + 40) toWindowSize:*(void *)(a1 + 48) stepSize:*(void *)(a1 + 56)];
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return [(TSTimeErrorAnalysis *)self exportAnalysisToDirectoryURL:a3 withFilename:@"analysis.csv"];
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4
{
  return [(TSTimeErrorAnalysis *)self exportAnalysisToDirectoryURL:a3 withFilename:a4 fromStartWindowSize:2 toEndWindowSize:self->_numberOfErrors stepSize:1];
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7
{
  return 0;
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3
{
  return [(TSTimeErrorAnalysis *)self exportTimeErrorsToDirectoryURL:a3 withFilename:@"time_error_analysis.csv"];
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3 withFilename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFileURL])
  {
    v8 = [v6 path];
    uint64_t v9 = [v8 stringByAppendingPathComponent:v7];

    id v10 = v9;
    uint64_t v11 = fopen((const char *)[v10 UTF8String], "w");
    BOOL v12 = v11 != 0;
    if (v11)
    {
      uint64_t v13 = v11;
      fwrite("index,time,error\n", 0x11uLL, 1uLL, v11);
      if (self->_numberOfErrors >= 1)
      {
        int64_t v14 = 0;
        do
        {
          fprintf(v13, "%ld,%.9f,%.12f\n", v14, self->_timestamps[v14], self->_timeErrors[v14]);
          ++v14;
        }
        while (v14 < self->_numberOfErrors);
      }
      fclose(v13);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  free(self->_timestamps);
  free(self->_timeErrors);
  v3.receiver = self;
  v3.super_class = (Class)TSTimeErrorAnalysis;
  [(TSTimeErrorAnalysis *)&v3 dealloc];
}

+ (id)generatePythonScriptWithOutputPath:(id)a3 fileName:(id)a4 titleName:(id)a5 plotPath:(id)a6 showPlot:(BOOL)a7
{
  BOOL v29 = a7;
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1E4F28E78];
  id v14 = a5;
  id v15 = a4;
  v16 = [v13 string];
  v17 = [a1 variableName];
  long long v18 = [a1 additionalScriptInitialization];
  [v16 appendFormat:@"#!/usr/bin/env python3\n\nimport numpy as np\nimport matplotlib.pyplot as plt\nimport os\nimport sys\n\n%@\n", v18];

  dispatch_semaphore_t v30 = v12;
  int64_t v31 = v11;
  if (v11) {
    [NSString stringWithFormat:@"'%@/%@'", v11, v15];
  }
  else {
  id v19 = [NSString stringWithFormat:@"os.path.split(sys.argv[0])[0]+'/%@'", v15, v28];
  }

  long long v20 = [a1 additionalScriptRecords];
  [v16 appendFormat:@"%@Records = np.recfromtxt(%@, dtype=None, delimiter=',', names=True, encoding='utf-8')\n\ntau = %@Records.observation_interval\n%@ = %@Records.%@\n\n%@\n", v17, v19, v17, v17, v17, v17, v20];

  long long v21 = [v17 uppercaseString];
  objc_super v22 = [a1 additionalScriptPlots:@"ax1"];
  v23 = [a1 plotYLabel];
  id v24 = [a1 plotTitle];
  dispatch_queue_t v25 = [a1 plotYLimits:@"ax1"];
  [v16 appendFormat:@"f1, ax1 = plt.subplots()\nl1, = ax1.plot(tau, %@, 'r-', label='%@')\n%@\nax1.set_ylabel('%@')\nax1.set_xlabel('Observation Interval (s)')\nax1.set_title('%@ - %@')\nax1.set_xscale('log')\nax1.set_yscale('log')\n%@\nax1.set_aspect(1)\nax1.grid(True)\n\nplt.subplots_adjust(left=0.05, right=0.97, bottom=0.05, top=0.97)\n", v17, v21, v22, v23, v24, v14, v25];

  if (v30)
  {
    dispatch_semaphore_t v26 = [a1 plotSize];
    [v16 appendFormat:@"\n%@\n\nf1.savefig('%@')\n", v26, v30];
  }
  if (v29) {
    [v16 appendString:@"\nplt.show()\n"];
  }

  return v16;
}

+ (id)variableName
{
  return &stru_1F1441738;
}

+ (id)plotYLabel
{
  return @"REPLACE LABEL";
}

+ (id)plotTitle
{
  return @"REPLACE TITLE";
}

+ (id)plotYLimits:(id)a3
{
  return &stru_1F1441738;
}

+ (id)plotSize
{
  return &stru_1F1441738;
}

+ (id)additionalScriptInitialization
{
  return &stru_1F1441738;
}

+ (id)additionalScriptRecords
{
  return &stru_1F1441738;
}

+ (id)additionalScriptPlots:(id)a3
{
  return &stru_1F1441738;
}

- (int64_t)numberOfErrors
{
  return self->_numberOfErrors;
}

- (double)timestamps
{
  return self->_timestamps;
}

- (double)timeErrors
{
  return self->_timeErrors;
}

- (double)averagePeriod
{
  return self->_averagePeriod;
}

- (BOOL)calculated
{
  return self->_calculated;
}

- (int64_t)lowestWindowSize
{
  return self->_lowestWindowSize;
}

- (int64_t)highestWindowSize
{
  return self->_highestWindowSize;
}

- (int64_t)calculatedStepSize
{
  return self->_calculatedStepSize;
}

@end