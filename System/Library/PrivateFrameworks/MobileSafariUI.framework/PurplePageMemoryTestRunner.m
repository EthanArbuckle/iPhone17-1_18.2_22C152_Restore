@interface PurplePageMemoryTestRunner
- (PurplePageMemoryTestRunner)initWithTestName:(id)a3 browserController:(id)a4;
- (void)_updatePageLoad:(id)a3 stats:(id)a4;
- (void)collectPPTResults;
@end

@implementation PurplePageMemoryTestRunner

- (PurplePageMemoryTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PurplePageMemoryTestRunner;
  v4 = [(PurplePageLoadTestRunner *)&v8 initWithTestName:a3 browserController:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pagesNeedingMemoryWarningSent = v4->super.super._pagesNeedingMemoryWarningSent;
    v4->super.super._pagesNeedingMemoryWarningSent = v5;

    v4->super.super._measureTime = 0;
  }
  return v4;
}

- (void)_updatePageLoad:(id)a3 stats:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 memoryBeforeWarning];
    if (v7) {
      [v9 setMemoryBeforeWarning:v7];
    }
    uint64_t v8 = [v6 memoryAfterWarning];
    if (v8) {
      [v9 setMemoryAfterWarning:v8];
    }
  }
}

- (void)collectPPTResults
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = -[NSMutableArray objectAtIndexedSubscript:](self->super.super._pageLoadArray, "objectAtIndexedSubscript:", self->super.super._currentTestIteration, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v22;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 status] == 5)
        {
          if ([v12 memoryBeforeWarning] && objc_msgSend(v12, "memoryAfterWarning"))
          {
            uint64_t v13 = [v12 memoryBeforeWarning];
            long double v14 = (double)((unint64_t)([v12 memoryAfterWarning] + v13) >> 1);
            v15 = [v12 URL];
            [(PurplePageLoadTestRunner *)self pptResultFor:v15 measure:0 value:@"bytes" units:(double)v14];

            ++v6;
            double v9 = v9 + v14;
            double v10 = v10 + log(v14);
          }
        }
        else
        {
          ++v7;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
    int v7 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
  }

  [(PurplePageLoadTestRunner *)self pptResultFor:@"Total Memory" measure:0 value:@"bytes" units:v9];
  if (v6 >= 1)
  {
    [(PurplePageLoadTestRunner *)self pptResultFor:@"Mean Memory" measure:0 value:@"bytes" units:v9 / (double)v6];
    [(PurplePageLoadTestRunner *)self pptResultFor:@"Geometric Mean Memory" measure:0 value:@"bytes" units:(double)exp(v10 / (double)v6)];
    [(PurplePageLoadTestRunner *)self pptResultFor:@"Square-Mean-Root Memory" measure:0 value:@"bytes" units:0.0 / (double)v6 * (0.0 / (double)v6)];
  }
  v16 = [(NSMutableArray *)self->super.super._pageLoadArray objectAtIndexedSubscript:self->super.super._currentTestIteration];
  uint64_t v17 = [v16 count];

  if (v17) {
    int v18 = v7;
  }
  else {
    int v18 = v7 + 1;
  }
  if (v18 >= 1)
  {
    pptResults = self->super._pptResults;
    v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
    [(NSMutableDictionary *)pptResults setObject:v20 forKey:@"Errors"];
  }
}

@end