@interface MemoryAndIOTestRunner
- (MemoryAndIOTestRunner)initWithTestName:(id)a3 browserController:(id)a4 type:(unint64_t)a5;
- (NSURL)testPageURL;
- (unint64_t)_collectCurrentLiveTabs;
- (void)_collectIOUsageInfo:(id)a3;
- (void)_collectMemoryUsageInfo:(id)a3;
- (void)_collectTestResults;
- (void)_openNewTabAndLoadTestURL;
- (void)runTestWithCompletion:(id)a3;
@end

@implementation MemoryAndIOTestRunner

- (MemoryAndIOTestRunner)initWithTestName:(id)a3 browserController:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MemoryAndIOTestRunner;
  v11 = [(MemoryAndIOTestRunner *)&v30 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_browserController, v10);
    objc_storeStrong((id *)&v12->_testName, a3);
    v12->_type = a5;
    if (a5)
    {
      if (a5 != 1)
      {
LABEL_7:
        uint64_t v24 = 0;
        v25 = &v24;
        uint64_t v26 = 0x3032000000;
        v27 = __Block_byref_object_copy__6;
        v28 = __Block_byref_object_dispose__6;
        id v29 = 0;
        v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v15 = [MEMORY[0x1E4F28F08] mainQueue];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __65__MemoryAndIOTestRunner_initWithTestName_browserController_type___block_invoke;
        v21[3] = &unk_1E6D7ACC8;
        v23 = &v24;
        v16 = v12;
        v22 = v16;
        uint64_t v17 = [v14 addObserverForName:@"WebProcessDidCrashNotification" object:0 queue:v15 usingBlock:v21];
        v18 = (void *)v25[5];
        v25[5] = v17;

        v19 = v16;
        _Block_object_dispose(&v24, 8);

        goto LABEL_8;
      }
      v12->writesAtStart = totalWrites();
      uint64_t v13 = 10;
    }
    else
    {
      uint64_t v13 = 59;
    }
    v12->_totalTabsToLoad = v13;
    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

uint64_t __65__MemoryAndIOTestRunner_initWithTestName_browserController_type___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40)];

    uint64_t v3 = *(void *)(*(void *)(v1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    v5 = *(void **)(v1 + 32);
    return [v5 _collectTestResults];
  }
  return result;
}

- (void)runTestWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x1E4E42950](a3, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  [(MemoryAndIOTestRunner *)self _openNewTabAndLoadTestURL];
}

- (void)_openNewTabAndLoadTestURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = [WeakRetained tabController];

  [v4 openNewTabWithOptions:0 completionHandler:0];
  v5 = [v4 tabDocuments];
  v6 = [v5 lastObject];

  v7 = [(MemoryAndIOTestRunner *)self testPageURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke;
  v9[3] = &unk_1E6D7ACF0;
  v9[4] = self;
  [v6 loadTestURL:v7 withInjectedBundle:1 withCallback:v9];

  v8 = [v6 pageLoadStatistics];
  [v8 setPageLoadingTimeoutInterval:5.0];
}

void __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) _collectCurrentLiveTabs];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v4 + 1;
  v5 = *(void **)(a1 + 32);
  if (v4 <= v5[8] && (v5[6] || v5[5] <= v2))
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke_2;
    block[3] = &unk_1E6D77E20;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    [v6 _collectTestResults];
  }
}

uint64_t __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openNewTabAndLoadTestURL];
}

- (NSURL)testPageURL
{
  unint64_t v2 = (void *)testPageURL_testURL;
  if (!testPageURL_testURL)
  {
    uint64_t v3 = _SFSafariTestContentDirectoryPath();
    unint64_t v4 = [v3 stringByAppendingPathComponent:@"Apple.webarchive"];

    uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    v6 = (void *)testPageURL_testURL;
    testPageURL_testURL = v5;

    unint64_t v2 = (void *)testPageURL_testURL;
  }
  return (NSURL *)v2;
}

- (void)_collectMemoryUsageInfo:(id)a3
{
  id v3 = a3;
  int v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v10 = 0u;
  mach_msg_type_number_t task_info_outCnt = 93;
  if (!task_info(*MEMORY[0x1E4F14960], 0x16u, task_info_out, &task_info_outCnt))
  {
    unint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)&v10 + 1) >> 20];
    [v3 setObject:v4 forKeyedSubscript:@"residentPeak"];

    [v3 setObject:@"MB" forKeyedSubscript:@"residentPeakUnits"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:(unint64_t)v10 >> 20];
    [v3 setObject:v5 forKeyedSubscript:@"residentMemory"];

    [v3 setObject:@"MB" forKeyedSubscript:@"residentMemoryUnits"];
    v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:(unint64_t)v18 >> 20];
    [v3 setObject:v6 forKeyedSubscript:@"physicMemory"];

    [v3 setObject:@"MB" forKeyedSubscript:@"physicMemoryUnits"];
    dispatch_time_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)&v12 + 1) >> 20];
    [v3 setObject:v7 forKeyedSubscript:@"internalPeak"];

    [v3 setObject:@"MB" forKeyedSubscript:@"internalPeakUnits"];
  }
}

- (void)_collectIOUsageInfo:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = a3;
  int v5 = totalWrites();
  int writesAtStart = self->writesAtStart;
  BOOL v7 = __OFSUB__(v5, writesAtStart);
  int v8 = v5 - writesAtStart;
  if (v8 < 0 != v7) {
    v8 += 1023;
  }
  id v9 = [v4 numberWithInt:(v8 >> 10)];
  [v10 setObject:v9 forKeyedSubscript:@"logicalWrites"];

  [v10 setObject:@"KB" forKeyedSubscript:@"logicalWritesUnits"];
}

- (unint64_t)_collectCurrentLiveTabs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  unint64_t v4 = objc_msgSend(WeakRetained, "tabController", 0);
  int v5 = [v4 tabDocuments];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v11 isHibernated] & 1) == 0) {
          v8 += [v11 isBlank] ^ 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  unint64_t liveTabs = self->_liveTabs;
  if (liveTabs <= v8) {
    unint64_t liveTabs = v8;
  }
  self->_unint64_t liveTabs = liveTabs;
  return v8;
}

- (void)_collectTestResults
{
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_liveTabs];
  [v10 setObject:v3 forKeyedSubscript:@"liveTabs"];

  [v10 setObject:@"Tabs" forKeyedSubscript:@"liveTabsUnits"];
  unint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v6 = [WeakRetained tabController];
  uint64_t v7 = [v6 tabDocuments];
  unint64_t v8 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  [v10 setObject:v8 forKeyedSubscript:@"allTabs"];

  [v10 setObject:@"Tabs" forKeyedSubscript:@"allTabsUnits"];
  unint64_t type = self->_type;
  if (type == 1)
  {
    [(MemoryAndIOTestRunner *)self _collectIOUsageInfo:v10];
  }
  else if (!type)
  {
    [(MemoryAndIOTestRunner *)self _collectMemoryUsageInfo:v10];
  }
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

@end