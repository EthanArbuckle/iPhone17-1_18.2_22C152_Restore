@interface WhiteTabsTestRunner
- (WhiteTabsTestRunner)init;
- (void)collectPPTResults;
- (void)finishedTestPage:(id)a3;
@end

@implementation WhiteTabsTestRunner

- (WhiteTabsTestRunner)init
{
  v5.receiver = self;
  v5.super_class = (Class)WhiteTabsTestRunner;
  v2 = [(WhiteTabsTestRunner *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PageLoadTestRunner *)v2 setFailFast:0];
  }
  return v3;
}

- (void)collectPPTResults
{
  unint64_t runCount = self->_runCount;
  if (runCount) {
    double v3 = (float)((float)self->_totalLiveTabs / (float)runCount);
  }
  else {
    double v3 = 0.0;
  }
  [(PurplePageLoadTestRunner *)self pptResultFor:@"Summary" measure:@"Average live tabs" value:@"tabs" units:v3];
}

- (void)finishedTestPage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(PageLoadTestRunner *)self browserController];
  v6 = [v5 tabController];

  v7 = [v6 tabDocuments];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        int v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) isAlive];
        uint64_t v10 = (v10 + v14);
        uint64_t v11 = v11 + (v14 ^ 1);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  if ([v7 count] == 36)
  {
    ++self->_runCount;
    self->_totalHibernatedTabs += (int)v11;
    self->_totalLiveTabs += (int)v10;
  }
  unint64_t runCount = self->_runCount;
  if (runCount) {
    double v16 = (float)((float)self->_totalLiveTabs / (float)runCount);
  }
  else {
    double v16 = 0.0;
  }
  -[PageLoadTestRunner log:](self, "log:", @"Total tabs = %2d livetabs = %2d hibernatedTabs = %2d Run count = %4d Avg number of live tabs = %2.2f - Finished loading page %@", [v7 count], v10, v11, self->_runCount, *(void *)&v16, v4);
}

@end