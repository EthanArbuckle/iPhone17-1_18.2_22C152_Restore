@interface PurplePageLoadTestRunner
- (BOOL)showFirstVisualLayoutTime;
- (BOOL)showLoadTime;
- (BOOL)showRenderFps;
- (BOOL)showRenderTime;
- (PurplePageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4;
- (id)initRenderTestWithName:(id)a3 browserController:(id)a4 showRenderTime:(BOOL)a5 showFPS:(BOOL)a6;
- (void)collectPPTResults;
- (void)finishedTestRunner;
- (void)finishedTestRunnerIteration;
- (void)pptResultFor:(id)a3 measure:(id)a4 time:(double)a5;
- (void)pptResultFor:(id)a3 measure:(id)a4 value:(double)a5 units:(id)a6;
- (void)setShowFirstVisualLayoutTime:(BOOL)a3;
- (void)setShowLoadTime:(BOOL)a3;
- (void)setShowRenderFps:(BOOL)a3;
- (void)setShowRenderTime:(BOOL)a3;
- (void)startingTestRunner;
- (void)writeOutputData;
@end

@implementation PurplePageLoadTestRunner

- (PurplePageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PurplePageLoadTestRunner;
  v4 = [(PageLoadTestRunner *)&v10 initWithTestName:a3 browserController:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:50];
    pptResults = v4->_pptResults;
    v4->_pptResults = (NSMutableDictionary *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iterationResults = v4->_iterationResults;
    v4->_iterationResults = v7;

    v4->_showLoadTime = 1;
    v4->_showFirstVisualLayoutTime = 0;
    v4->_showRenderTime = 0;
    v4->_showRenderFps = 0;
  }
  return v4;
}

- (id)initRenderTestWithName:(id)a3 browserController:(id)a4 showRenderTime:(BOOL)a5 showFPS:(BOOL)a6
{
  v8 = [(PurplePageLoadTestRunner *)self initWithTestName:a3 browserController:a4];
  v9 = v8;
  if (v8)
  {
    v8->_showLoadTime = 0;
    v8->_showRenderTime = a5;
    v8->_showRenderFps = a6;
    [(PageLoadTestRunner *)v8 setPageActionInterval:0.0166666667];
  }
  return v9;
}

- (void)startingTestRunner
{
  v5.receiver = self;
  v5.super_class = (Class)PurplePageLoadTestRunner;
  [(PageLoadTestRunner *)&v5 startingTestRunner];
  v3 = (void *)*MEMORY[0x1E4FB2608];
  v4 = [(PageLoadTestRunner *)self testName];
  [v3 startedTest:v4];
}

- (void)finishedTestRunnerIteration
{
  [(PurplePageLoadTestRunner *)self collectPPTResults];
  v3.receiver = self;
  v3.super_class = (Class)PurplePageLoadTestRunner;
  [(PageLoadTestRunner *)&v3 finishedTestRunnerIteration];
}

- (void)finishedTestRunner
{
  [(PurplePageLoadTestRunner *)self writeOutputData];
  objc_super v3 = (void *)*MEMORY[0x1E4FB2608];
  v4 = [(PageLoadTestRunner *)self testName];
  [v3 finishedTest:v4 extraResults:self->_pptResults];

  v5.receiver = self;
  v5.super_class = (Class)PurplePageLoadTestRunner;
  [(PageLoadTestRunner *)&v5 finishedTestRunner];
}

- (void)pptResultFor:(id)a3 measure:(id)a4 value:(double)a5 units:(id)a6
{
  id v18 = a4;
  id v10 = a6;
  uint64_t v11 = [a3 description];
  v12 = (void *)v11;
  if (v18)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@ %@", v11, v18];

    v12 = (void *)v13;
  }
  pptResults = self->_pptResults;
  v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:a5];
  [(NSMutableDictionary *)pptResults setValue:v15 forKey:v12];

  if (v10)
  {
    v16 = self->_pptResults;
    v17 = [v12 stringByAppendingString:@"Units"];
    [(NSMutableDictionary *)v16 setValue:v10 forKey:v17];
  }
}

- (void)pptResultFor:(id)a3 measure:(id)a4 time:(double)a5
{
}

- (void)collectPPTResults
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  objc_super v3 = [(NSMutableArray *)self->super._pageLoadArray objectAtIndexedSubscript:self->super._currentTestIteration];
  unint64_t v4 = 0x1EAD74000uLL;
  unint64_t v5 = 0x1EAD74000uLL;
  uint64_t v72 = [v3 countByEnumeratingWithState:&v73 objects:v77 count:16];
  uint64_t v6 = 0;
  if (v72)
  {
    int v7 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = *(void *)v74;
    double v8 = 1.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v69 = 0.0;
    double v11 = 0.0;
    while (1)
    {
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v74 != v71) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if ([v13 status] != 5) {
          goto LABEL_26;
        }
        if (*((unsigned char *)&self->super.super.isa + *(int *)(v4 + 3300)))
        {
          uint64_t v14 = [v13 endLoadDate];
          if (!v14) {
            goto LABEL_26;
          }
          v15 = (void *)v14;
          v16 = [v13 webContentProcessStartLoadDate];

          if (!v16) {
            goto LABEL_26;
          }
          v17 = [v13 endLoadDate];
          id v18 = [v13 webContentProcessStartLoadDate];
          [v17 timeIntervalSinceDate:v18];
          double v20 = v19;

          uint64_t v6 = (v6 + 1);
          double v11 = v11 + v20;
          double v9 = v9 + sqrt(v20 * 1000.0);
          double v8 = v8 * (v20 * 1000.0);
          v21 = [v13 URL];
          [(PurplePageLoadTestRunner *)self pptResultFor:v21 measure:0 time:v20];
        }
        if (self->super._measureTime)
        {
          uint64_t v22 = [v13 endLoadDate];
          if (!v22) {
            goto LABEL_26;
          }
          v23 = (void *)v22;
          v24 = [v13 uiProcessStartDate];

          if (!v24) {
            goto LABEL_26;
          }
          v25 = [v13 endLoadDate];
          v26 = [v13 uiProcessStartDate];
          [v25 timeIntervalSinceDate:v26];
          double v28 = v27;

          v29 = [v13 URL];
          [(PurplePageLoadTestRunner *)self pptResultFor:v29 measure:@"loadTimeFromUI" time:v28];

          if (self->super._version >= 5)
          {
            v30 = [v13 domContentLoadedDate];
            v31 = [v13 uiProcessStartDate];
            [v30 timeIntervalSinceDate:v31];
            double v33 = v32;

            v34 = [v13 firstMeaningfulPaintDate];
            v35 = [v13 uiProcessStartDate];
            [v34 timeIntervalSinceDate:v35];
            double v37 = v36;

            v38 = [v13 allSubresourcesLoadedDate];
            v39 = [v13 uiProcessStartDate];
            [v38 timeIntervalSinceDate:v39];
            double v41 = v40;

            v42 = [v13 URL];
            [(PurplePageLoadTestRunner *)self pptResultFor:v42 measure:@"domContentLoaded" time:v33];

            v43 = [v13 URL];
            [(PurplePageLoadTestRunner *)self pptResultFor:v43 measure:@"firstMeaningfulPaint" time:v37];

            v44 = [v13 URL];
            [(PurplePageLoadTestRunner *)self pptResultFor:v44 measure:@"allSubresources" time:v41];
          }
        }
        if (self->_showFirstVisualLayoutTime)
        {
          uint64_t v45 = [v13 firstVisualLayoutDate];
          if (!v45) {
            goto LABEL_26;
          }
          v46 = (void *)v45;
          v47 = [v13 webContentProcessStartLoadDate];

          if (!v47) {
            goto LABEL_26;
          }
          v48 = [v13 URL];
          v49 = [v13 firstVisualLayoutDate];
          [v13 webContentProcessStartLoadDate];
          v50 = v3;
          uint64_t v51 = v6;
          v53 = unint64_t v52 = v5;
          [v49 timeIntervalSinceDate:v53];
          -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v48, @"firstVisualLayout");

          unint64_t v5 = v52;
          uint64_t v6 = v51;
          objc_super v3 = v50;
          unint64_t v4 = 0x1EAD74000;
        }
        if (*((unsigned char *)&self->super.super.isa + *(int *)(v5 + 3312)))
        {
          [v13 framesPerSecond];
          if (v54 <= 0.0) {
            goto LABEL_26;
          }
          double v55 = v54;
          ++HIDWORD(v70);
          double v10 = v10 + v54;
          v56 = [v13 URL];
          [(PurplePageLoadTestRunner *)self pptResultFor:v56 measure:@"fps" value:@"fps" units:v55];
        }
        if (!self->_showRenderTime) {
          continue;
        }
        [v13 renderDuration];
        if (v57 > 0.0)
        {
          double v58 = v57;
          LODWORD(v70) = v70 + 1;
          double v69 = v69 + v57;
          v59 = [v13 URL];
          [(PurplePageLoadTestRunner *)self pptResultFor:v59 measure:@"render" time:v58];

          continue;
        }
LABEL_26:
        ++v7;
      }
      uint64_t v72 = [v3 countByEnumeratingWithState:&v73 objects:v77 count:16];
      if (!v72) {
        goto LABEL_31;
      }
    }
  }
  uint64_t v70 = 0;
  int v7 = 0;
  double v8 = 1.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v69 = 0.0;
  double v11 = 0.0;
LABEL_31:

  if (*((unsigned char *)&self->super.super.isa + *(int *)(v4 + 3300)))
  {
    [(PurplePageLoadTestRunner *)self pptResultFor:@"Total Time" measure:0 time:v11];
    if ((int)v6 >= 1)
    {
      [(PurplePageLoadTestRunner *)self pptResultFor:@"Mean Time" measure:0 time:v11 / (double)(int)v6];
      [(PurplePageLoadTestRunner *)self pptResultFor:@"Geometric Mean Time" measure:0 value:@"ms" units:(double)pow(v8, 1.0 / (double)(int)v6)];
      [(PurplePageLoadTestRunner *)self pptResultFor:@"Square-Mean-Root Time" measure:0 value:@"ms" units:v9 / (double)(int)v6 * (v9 / (double)(int)v6)];
    }
  }
  if (*((unsigned char *)&self->super.super.isa + *(int *)(v5 + 3312))) {
    BOOL v60 = SHIDWORD(v70) < 1;
  }
  else {
    BOOL v60 = 1;
  }
  if (!v60) {
    [(PurplePageLoadTestRunner *)self pptResultFor:@"Mean Render FPS" measure:0 value:@"fps" units:v10 / (double)SHIDWORD(v70)];
  }
  if (self->_showRenderTime)
  {
    [(PurplePageLoadTestRunner *)self pptResultFor:@"Total Render Time" measure:0 time:v69];
    if ((int)v70 >= 1) {
      [(PurplePageLoadTestRunner *)self pptResultFor:@"Mean Render Time" measure:0 time:v69 / (double)(int)v70];
    }
  }
  v61 = [(NSMutableArray *)self->super._pageLoadArray objectAtIndexedSubscript:self->super._currentTestIteration];
  uint64_t v62 = [v61 count];

  if (v62) {
    int v63 = v7;
  }
  else {
    int v63 = v7 + 1;
  }
  if (v63 >= 1)
  {
    pptResults = self->_pptResults;
    v65 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
    [(NSMutableDictionary *)pptResults setObject:v65 forKey:@"Errors"];
  }
  iterationResults = self->_iterationResults;
  v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_pptResults copyItems:1];
  v68 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->super._currentTestIteration);
  [(NSMutableDictionary *)iterationResults setObject:v67 forKey:v68];
}

- (void)writeOutputData
{
  objc_super v3 = [(PageLoadTestRunner *)self outputFilename];

  if (!v3)
  {
    NSLog((NSString *)@"safari-plt-test %@", self->_iterationResults);
    goto LABEL_9;
  }
  iterationResults = self->_iterationResults;
  id v11 = 0;
  unint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:iterationResults options:0 error:&v11];
  id v6 = v11;
  if (!v6)
  {
    double v8 = [(PageLoadTestRunner *)self outputFilename];
    id v10 = 0;
    [v5 writeToFile:v8 options:0 error:&v10];
    id v7 = v10;

    if (v7)
    {
      double v9 = [(PageLoadTestRunner *)self outputFilename];
      NSLog((NSString *)@"safari-plt-test Error writing output to file %@: %@", v9, v7);

      goto LABEL_7;
    }

LABEL_9:
    id v7 = [(PageLoadTestRunner *)self outputFilename];
    [(PageLoadTestRunner *)self log:@"PageLoadTest Complete. Wrote data to %@", v7];
    goto LABEL_10;
  }
  id v7 = v6;
  NSLog((NSString *)@"safari-plt-test Error while serializing Page Load Performance Test results: %@", v6);
LABEL_7:

LABEL_10:
}

- (BOOL)showLoadTime
{
  return self->_showLoadTime;
}

- (void)setShowLoadTime:(BOOL)a3
{
  self->_showLoadTime = a3;
}

- (BOOL)showFirstVisualLayoutTime
{
  return self->_showFirstVisualLayoutTime;
}

- (void)setShowFirstVisualLayoutTime:(BOOL)a3
{
  self->_showFirstVisualLayoutTime = a3;
}

- (BOOL)showRenderTime
{
  return self->_showRenderTime;
}

- (void)setShowRenderTime:(BOOL)a3
{
  self->_showRenderTime = a3;
}

- (BOOL)showRenderFps
{
  return self->_showRenderFps;
}

- (void)setShowRenderFps:(BOOL)a3
{
  self->_showRenderFps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationResults, 0);
  objc_storeStrong((id *)&self->_pptResults, 0);
}

@end