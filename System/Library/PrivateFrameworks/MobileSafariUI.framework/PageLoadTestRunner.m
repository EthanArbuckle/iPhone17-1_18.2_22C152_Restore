@interface PageLoadTestRunner
+ ($2825F4736939C4A6D3AD43837233062D)heapStatistics;
+ (BOOL)closingBrowserWindowsForWorldLeakTest;
+ (id)worldLeaksString;
+ (void)addLeakToArray:(id)a3 count:(int)a4 name:(id)a5;
- (BOOL)checkForWorldLeaks;
- (BOOL)checkForWorldLeaksNow;
- (BOOL)collectHeapStatistics;
- (BOOL)disableProgressBar;
- (BOOL)failFast;
- (BOOL)finishCheckingForWorldLeaks;
- (BOOL)loadTestSuiteFile:(id)a3;
- (BOOL)loadURLInNewTab;
- (BOOL)performActionForPage:(id)a3;
- (BOOL)resetsZoomBetweenPages;
- (BOOL)startPageAction:(id)a3;
- (BrowserController)browserController;
- (NSString)logFile;
- (NSString)outputFilename;
- (NSString)suiteName;
- (NSString)testName;
- (PageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4;
- (PageLoadTestRunnerDelegate)delegate;
- (double)pageActionInterval;
- (double)pageRestInterval;
- (double)pageTimeout;
- (id)_pageLoadForTabDocument:(id)a3;
- (int)cacheClearDirective;
- (unint64_t)skipCount;
- (unint64_t)tabCount;
- (void)_checkRedirect:(id)a3;
- (void)_closeLogStream;
- (void)_handleActionTimer:(id)a3;
- (void)_pageRestExpired:(id)a3;
- (void)_pageTimeoutExpired:(id)a3;
- (void)_startNextPageNow;
- (void)_updatePageLoad:(id)a3 stats:(id)a4;
- (void)addPageURL:(id)a3 withProcessSwap:(BOOL)a4;
- (void)checkForWorldLeaksSoon;
- (void)clearCacheWithURL:(id)a3;
- (void)closeBrowserWindowsAndFinishCheckingForWorldLeaks;
- (void)dealloc;
- (void)finish;
- (void)finishPage:(id)a3 stats:(id)a4 error:(id)a5;
- (void)finishedTestPage:(id)a3;
- (void)finishedTestRunner;
- (void)finishedTestRunnerIteration;
- (void)log:(id)a3;
- (void)removeURLsInRange:(_NSRange)a3;
- (void)setCacheClearDirective:(int)a3;
- (void)setCheckForWorldLeaks:(BOOL)a3;
- (void)setCollectHeapStatistics:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableProgressBar:(BOOL)a3;
- (void)setExistingProperty:(id)a3 to:(id)a4;
- (void)setFailFast:(BOOL)a3;
- (void)setLoadURLInNewTab:(BOOL)a3;
- (void)setLogFile:(id)a3;
- (void)setOutputFilename:(id)a3;
- (void)setPageActionInterval:(double)a3;
- (void)setPageRestInterval:(double)a3;
- (void)setPageTimeout:(double)a3;
- (void)setResetsZoomBetweenPages:(BOOL)a3;
- (void)setSkipCount:(unint64_t)a3;
- (void)setSuiteName:(id)a3;
- (void)setTabCount:(unint64_t)a3;
- (void)setTestName:(id)a3;
- (void)setTestOptions:(id)a3;
- (void)start;
- (void)startNextPage;
- (void)startingTestPage:(id)a3;
- (void)startingTestRunner;
@end

@implementation PageLoadTestRunner

- (PageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PageLoadTestRunner;
  v8 = [(PageLoadTestRunner *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(PageLoadTestRunner *)v8 setTestName:v6];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pageLoadArray = v9->_pageLoadArray;
    v9->_pageLoadArray = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableArray *)v9->_pageLoadArray addObject:v12];
    pagesNeedingMemoryWarningSent = v9->_pagesNeedingMemoryWarningSent;
    v9->_pagesNeedingMemoryWarningSent = 0;

    v9->_cacheClearDirective = 0;
    v9->_pageRestInterval = 3.0;
    v9->_measureTime = 1;
    *(_DWORD *)&v9->_disableProgressBar = 65792;
    objc_storeStrong((id *)&v9->_browserController, a4);
    v9->_version = 4;
    v9->_useInjectedBundle = 1;
    v9->_allSubresourcesFinishedLoadingDelay = 1.0;
    *(void *)&v9->_currentTestIteration = 0x100000000;
    v9->_initialDelay = 0.0;
  }
  return v9;
}

- (void)dealloc
{
  [(PageLoadTestRunner *)self _closeLogStream];
  v3.receiver = self;
  v3.super_class = (Class)PageLoadTestRunner;
  [(PageLoadTestRunner *)&v3 dealloc];
}

- (void)_closeLogStream
{
  logStream = self->_logStream;
  if (logStream)
  {
    [(NSOutputStream *)logStream close];
    v4 = self->_logStream;
    self->_logStream = 0;
  }
}

- (void)setExistingProperty:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  id v12 = v6;
  Property = class_getProperty(v8, (const char *)[v12 UTF8String]);
  if (Property)
  {
    int v10 = *((unsigned __int8 *)property_getAttributes(Property) + 1);
    if (v10 == 99 || v10 == 81)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v7, "intValue"));

        id v7 = (id)v11;
      }
    }
    [(PageLoadTestRunner *)self setValue:v7 forKey:v12];
  }
}

- (void)setTestOptions:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__PageLoadTestRunner_setTestOptions___block_invoke;
  v3[3] = &unk_1E6D7AD20;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __37__PageLoadTestRunner_setTestOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqual:@"suiteName"])
  {
    [*(id *)(a1 + 32) loadTestSuiteFile:v6];
  }
  else if ([v5 isEqual:@"url"])
  {
    id v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [v6 description];
    int v10 = [v8 URLWithString:v9];
    [v7 addPageURL:v10 withProcessSwap:0];
  }
  else if ([v5 isEqual:@"URLs"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v22 = v6;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(a1 + 32);
            v17 = (void *)MEMORY[0x1E4F1CB10];
            v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v15) description];
            v19 = [v17 URLWithString:v18];
            [v16 addPageURL:v19 withProcessSwap:0];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      id v6 = v22;
    }
  }
  else
  {
    int v20 = [v5 isEqual:@"outputFilename"];
    v21 = *(void **)(a1 + 32);
    if (v20) {
      [v21 setOutputFilename:v6];
    }
    else {
      [v21 setExistingProperty:v5 to:v6];
    }
  }
}

- (void)addPageURL:(id)a3 withProcessSwap:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (v9 && self->_testIterations)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [[PageLoad alloc] initWithURL:v9 withProcessSwap:v4];
      v8 = [(NSMutableArray *)self->_pageLoadArray objectAtIndexedSubscript:v6];
      [v8 addObject:v7];

      ++v6;
    }
    while (v6 < self->_testIterations);
  }
}

- (void)removeURLsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = [(NSMutableArray *)self->_pageLoadArray objectAtIndexedSubscript:self->_currentTestIteration];
  unint64_t v7 = [v6 count];

  if (v7 > location && self->_testIterations)
  {
    unint64_t v8 = 0;
    if (location + length > v7) {
      NSUInteger length = v7 - location;
    }
    do
    {
      id v9 = [(NSMutableArray *)self->_pageLoadArray objectAtIndexedSubscript:v8];
      objc_msgSend(v9, "removeObjectsInRange:", location, length);

      ++v8;
    }
    while (v8 < self->_testIterations);
  }
}

- (BOOL)loadTestSuiteFile:(id)a3
{
  id v4 = a3;
  syslog(4, "safari-plt-test: pathToTestSuite=%s", (const char *)[v4 UTF8String]);
  if (!v4) {
    goto LABEL_48;
  }
  id v5 = [v4 lastPathComponent];
  [(PageLoadTestRunner *)self setSuiteName:v5];

  unint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v7 = [v6 contentsAtPath:v4];

  if (!v7)
  {
    v66 = __error();
    v67 = strerror(*v66);
    NSLog((NSString *)@"safari-plt-test: Could not load test suite '%@': %s", v4, v67);
LABEL_48:
    BOOL v65 = 0;
    goto LABEL_51;
  }
  unint64_t v8 = malloc_type_malloc([v7 length] + 1, 0x5DC918B3uLL);
  id v9 = v7;
  memcpy(v8, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
  *((unsigned char *)v8 + [v9 length]) = 0;
  syslog(4, "safari-plt-test: testSuite=%s", (const char *)v8);
  int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v8);
  free(v8);
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = [v4 stringByAppendingString:@"files"];
  uint64_t v13 = [v11 contentsAtPath:v12];

  unint64_t v14 = 0x1E4F1C000uLL;
  if (v13)
  {
    v72 = v10;
    uint64_t v15 = malloc_type_malloc([v13 length] + 1, 0xDF4AF510uLL);
    v16 = v13;
    id v17 = v13;
    memcpy(v15, (const void *)[v17 bytes], objc_msgSend(v17, "length"));
    *((unsigned char *)v15 + [v17 length]) = 0;
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v15);
    free(v15);
    v19 = [v18 componentsSeparatedByString:@"\n"];
    int v20 = [MEMORY[0x1E4F1CA48] array];
    if ([v19 count])
    {
      unint64_t v21 = 0;
      do
      {
        id v22 = [v19 objectAtIndexedSubscript:v21];
        if ([v22 length])
        {
          long long v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithDataAsString:", v22);
          [v20 addObject:v23];
        }
        ++v21;
      }
      while (v21 < [v19 count]);
    }

    int v10 = v72;
    uint64_t v13 = v16;
    unint64_t v14 = 0x1E4F1C000uLL;
  }
  long long v24 = [v10 componentsSeparatedByString:@"\n"];
  if (![v24 count])
  {
    BOOL v65 = 1;
    goto LABEL_50;
  }
  id v71 = v4;
  char v70 = 0;
  uint64_t v25 = 0;
  while (1)
  {
    id v26 = [v24 objectAtIndexedSubscript:v25];
    if (![v26 length]) {
      goto LABEL_36;
    }
    v27 = [NSString stringWithUTF8String:"version="];
    char v28 = [v26 hasPrefix:v27];

    if ((v28 & 1) == 0) {
      break;
    }

    v29 = [v24 objectAtIndexedSubscript:v25];
    id v26 = [v29 substringFromIndex:8];

    self->_version = [v26 intValue];
LABEL_37:

    if (++v25 >= (unint64_t)[v24 count])
    {
      BOOL v65 = 1;
      goto LABEL_46;
    }
  }
  v30 = [NSString stringWithUTF8String:"useInjectedBundle="];
  char v31 = [v26 hasPrefix:v30];

  if (v31)
  {

    v32 = [v24 objectAtIndexedSubscript:v25];
    id v26 = [v32 substringFromIndex:18];

    self->_useInjectedBundle = [v26 BOOLValue];
    goto LABEL_37;
  }
  v33 = [NSString stringWithUTF8String:"pageRestIntervalInSeconds="];
  char v34 = [v26 hasPrefix:v33];

  if (v34)
  {

    v35 = [v24 objectAtIndexedSubscript:v25];
    id v26 = [v35 substringFromIndex:26];

    [v26 doubleValue];
    self->_pageRestInterval = v36;
    goto LABEL_37;
  }
  v37 = [NSString stringWithUTF8String:"allSubresourcesFinishedLoadingDelayInSeconds="];
  char v38 = [v26 hasPrefix:v37];

  if (v38)
  {

    v39 = [v24 objectAtIndexedSubscript:v25];
    id v26 = [v39 substringFromIndex:45];

    [v26 doubleValue];
    self->_allSubresourcesFinishedLoadingDelay = v40;
    goto LABEL_37;
  }
  v41 = [NSString stringWithUTF8String:"iterations="];
  char v42 = [v26 hasPrefix:v41];

  if (v42)
  {

    v43 = [v24 objectAtIndexedSubscript:v25];
    id v26 = [v43 substringFromIndex:11];

    unsigned int v44 = [v26 intValue];
    self->_testIterations = v44;
    if (v44 >= 2)
    {
      v73 = v10;
      unsigned int v45 = 1;
      do
      {
        pageLoadArray = self->_pageLoadArray;
        id v47 = objc_alloc_init(*(Class *)(v14 + 2632));
        [(NSMutableArray *)pageLoadArray addObject:v47];

        ++v45;
      }
      while (v45 < self->_testIterations);
      int v10 = v73;
    }
    goto LABEL_37;
  }
  v48 = [NSString stringWithUTF8String:"initialDelayInSeconds="];
  char v49 = [v26 hasPrefix:v48];

  if (v49)
  {

    v50 = [v24 objectAtIndexedSubscript:v25];
    id v26 = [v50 substringFromIndex:22];

    [v26 doubleValue];
    self->_initialDelay = v51;
    goto LABEL_37;
  }
  v52 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v53 = [v26 stringByTrimmingCharactersInSet:v52];
  if (![v53 length])
  {

LABEL_36:
    goto LABEL_37;
  }
  if ([v53 characterAtIndex:0] == 35)
  {
    v54 = [v53 substringFromIndex:1];
    v69 = v52;
    v55 = [v54 stringByTrimmingCharactersInSet:v52];

    v74 = v55;
    if ([v55 hasPrefix:@"["]
      && [v55 hasSuffix:@"]"]
      && (objc_msgSend(v55, "substringWithRange:", 1, objc_msgSend(v55, "length") - 2),
          v56 = objc_claimAutoreleasedReturnValue(),
          [v56 stringByTrimmingCharactersInSet:v69],
          v57 = objc_claimAutoreleasedReturnValue(),
          v56,
          uint64_t v58 = [v57 caseInsensitiveCompare:@"SwapProcess"],
          v57,
          !v58))
    {

      char v70 = 1;
    }
    else
    {
    }
    unint64_t v14 = 0x1E4F1C000;
    goto LABEL_37;
  }

  id v26 = [v24 objectAtIndexedSubscript:v25];
  unsigned int v59 = [v26 hasPrefix:@"[MemoryWarning]"];
  pagesNeedingMemoryWarningSent = self->_pagesNeedingMemoryWarningSent;
  if (pagesNeedingMemoryWarningSent)
  {
    unsigned int v75 = v59;
    v61 = [MEMORY[0x1E4F28ED0] numberWithBool:v59];
    [(NSMutableArray *)pagesNeedingMemoryWarningSent addObject:v61];

    unsigned int v59 = v75;
  }
  if (v59)
  {
    uint64_t v62 = [v26 substringFromIndex:15];

    id v26 = (id)v62;
  }
  uint64_t v63 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithDataAsString:", v26);
  if (v63)
  {
    v64 = (void *)v63;
    [(PageLoadTestRunner *)self addPageURL:v63 withProcessSwap:v70 & 1];

    char v70 = 0;
    goto LABEL_37;
  }

  BOOL v65 = 0;
LABEL_46:
  id v4 = v71;
LABEL_50:

LABEL_51:
  return v65;
}

- (void)start
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  logFile = self->_logFile;
  if (logFile && !self->_logStream)
  {
    id v4 = [(NSString *)logFile stringByExpandingTildeInPath];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      unint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v51 = 0;
      unint64_t v8 = [v7 attributesOfItemAtPath:v4 error:&v51];
      id v9 = v51;

      if (v9)
      {
        NSLog((NSString *)@"safari-plt-test: PageLoadTestRunner could not get attributes of log file: %@", v9);
      }
      else
      {
        id v10 = objc_alloc(MEMORY[0x1E4F28E78]);
        id v11 = [v4 stringByDeletingPathExtension];
        uint64_t v12 = (void *)[v10 initWithString:v11];

        id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v13 setDateFormat:@"-yyyy-MM-dd-HH-mm-ss"];
        unint64_t v14 = [v8 objectForKey:*MEMORY[0x1E4F282C0]];
        uint64_t v15 = [v13 stringFromDate:v14];
        [v12 appendString:v15];

        v16 = [v4 pathExtension];
        uint64_t v17 = [v16 length];

        if (v17)
        {
          [v12 appendString:@"."];
          v18 = [v4 pathExtension];
          [v12 appendString:v18];
        }
        v19 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v50 = 0;
        [v19 moveItemAtPath:v4 toPath:v12 error:&v50];
        id v9 = v50;

        if (v9) {
          NSLog((NSString *)@"safari-plt-test: PageLoadTestRunner could not rename log file: %@", v9);
        }
      }
    }
    int v20 = (NSOutputStream *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToFileAtPath:v4 append:0];
    logStream = self->_logStream;
    self->_logStream = v20;

    [(NSOutputStream *)self->_logStream open];
  }
  [(PageLoadTestRunner *)self log:@"PageLoadTest Initialized."];
  [(BrowserController *)self->_browserController setFavoritesState:0];
  id v22 = [(BrowserController *)self->_browserController tabController];
  long long v23 = [v22 tabCollectionViewProvider];
  long long v24 = [v23 tabThumbnailCollectionView];

  id v25 = v24;
  if ([v25 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v26 = [v25 presentationState];

    if (v26 != 2) {
      goto LABEL_17;
    }
  }
  [v25 dismissAnimated:0];
LABEL_17:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v27 = [v22 currentTabDocuments];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    char v30 = 0;
    uint64_t v31 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ([v33 isLoading])
        {
          char v34 = [v33 URL];
          [(PageLoadTestRunner *)self log:@"%@ is loading %@, delaying start for 1 second", v33, v34];

          [v33 stopLoading];
          char v30 = 1;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v29);
  }
  else
  {
    char v30 = 0;
  }

  double initialDelay = self->_initialDelay;
  if (initialDelay != 0.0 || (v30 & 1) != 0)
  {
    if (initialDelay == 0.0)
    {
      unint64_t v43 = 1;
    }
    else
    {
      unint64_t v43 = llround(initialDelay);
      self->_double initialDelay = 0.0;
    }
    [(PageLoadTestRunner *)self log:@"Test requested delay at start, delaying start for %lld second", v43];
    dispatch_time_t v44 = dispatch_time(0, 1000000000 * v43);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PageLoadTestRunner_start__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_after(v44, MEMORY[0x1E4F14428], block);
  }
  else
  {
    double v36 = [(BrowserController *)self->_browserController processPool];
    [v36 _setObject:MEMORY[0x1E4F1CC38] forBundleParameter:@"enablePageLoadMeasurementCollection"];

    v37 = [(BrowserController *)self->_browserController processPool];
    char v38 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_version];
    [v37 _setObject:v38 forBundleParameter:@"pageLoadMeasurementVersionNumber"];

    v39 = [(BrowserController *)self->_browserController processPool];
    double v40 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_allSubresourcesFinishedLoadingDelay];
    [v39 _setObject:v40 forBundleParameter:@"pageLoadMeasurementAllSubresourcesFinishedLoadingDelay"];

    if (self->_pageRestInterval == 0.0) {
      +[PageLoadTestStatistics setRestInterval:](PageLoadTestStatistics, "setRestInterval:");
    }
    -[PageLoadTestRunner removeURLsInRange:](self, "removeURLsInRange:", 0, self->_skipCount);
    if (![(PageLoadTestRunner *)self checkForWorldLeaksNow])
    {
      if (self->_cacheClearDirective == 1) {
        [(PageLoadTestRunner *)self clearCacheWithURL:0];
      }
      [MEMORY[0x1E4F18DA8] defaultTimeoutInterval];
      self->_savedDefaultTimeoutInterval = v41;
      if (self->_disableProgressBar)
      {
        [MEMORY[0x1E4F18DA8] setDefaultTimeoutInterval:5.0];
        [(BrowserController *)self->_browserController setProgressEnabled:0];
      }
      char v42 = [(BrowserController *)self->_browserController rootViewController];
      [v42 updateWebViewSizeAttributes];

      srand(1u);
      [(PageLoadTestRunner *)self startNextPage];
    }
  }
}

uint64_t __27__PageLoadTestRunner_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)startNextPage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PageLoadTestRunner_startNextPage__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __35__PageLoadTestRunner_startNextPage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startNextPageNow];
}

- (void)_startNextPageNow
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!self->_started)
  {
    if (!self->_currentTestIteration) {
      [(PageLoadTestRunner *)self startingTestRunner];
    }
    self->_started = 1;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_super v3 = [(NSMutableArray *)self->_pageLoadArray objectAtIndexedSubscript:self->_currentTestIteration];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v4)
  {
LABEL_16:

LABEL_17:
    id v10 = [(BrowserController *)self->_browserController tabController];
    id v11 = [v10 activeTabDocument];
    [v10 closeTabDocument:v11 animated:1];
    [(PageLoadTestRunner *)self finish];
    goto LABEL_42;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v35;
LABEL_7:
  uint64_t v8 = 0;
  id v9 = v6;
  while (1)
  {
    if (*(void *)v35 != v7) {
      objc_enumerationMutation(v3);
    }
    id v6 = *(id *)(*((void *)&v34 + 1) + 8 * v8);

    if (self->_failFast && [v6 status] == 6) {
      goto LABEL_15;
    }
    if (![v6 status]) {
      break;
    }
    ++v8;
    id v9 = v6;
    if (v5 == v8)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v5) {
        goto LABEL_7;
      }
LABEL_15:

      goto LABEL_16;
    }
  }

  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v12 = [v6 URL];
  id v13 = [v12 absoluteString];
  syslog(4, "safari-plt-test: Loading next url=%s", (const char *)[v13 UTF8String]);

  if (self->_cacheClearDirective == 2)
  {
    unint64_t v14 = [v6 URL];
    [(PageLoadTestRunner *)self clearCacheWithURL:v14];
  }
  if (self->_pageTimeout > 0.0)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pageTimeoutExpired_, v6, 0);
    [v6 setTimer:v15];
  }
  if (self->_collectHeapStatistics) {
    objc_msgSend(v6, "setHeapBefore:", +[PageLoadTestRunner heapStatistics](PageLoadTestRunner, "heapStatistics"));
  }
  if (self->_measureTime)
  {
    [v6 setUiProcessStartTime:mach_continuous_time()];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setUiProcessStartDate:v16];

    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXPLT();
    if (os_signpost_enabled(v17))
    {
      v18 = v17;
      v19 = [v6 URL];
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PLT_FirstMeaningfulPaint", "%{public}@", buf, 0xCu);
    }
    int v20 = WBS_LOG_CHANNEL_PREFIXPLT();
    if (os_signpost_enabled(v20))
    {
      unint64_t v21 = v20;
      id v22 = [v6 URL];
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PLT_DOMContentLoaded", "%{public}@", buf, 0xCu);
    }
    long long v23 = WBS_LOG_CHANNEL_PREFIXPLT();
    if (os_signpost_enabled(v23))
    {
      long long v24 = v23;
      id v25 = [v6 URL];
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PLT_AllSubresourcesLoaded", "%{public}@", buf, 0xCu);
    }
  }
  [v6 setStatus:1];
  [(PageLoadTestRunner *)self startingTestPage:v6];
  id v11 = [(BrowserController *)self->_browserController tabController];
  uint64_t v26 = [v11 activeTabDocument];
  v27 = v26;
  if (self->_loadURLInNewTab && ![(TabDocument *)v26 isBlank])
  {
    uint64_t v28 = [[TabDocument alloc] initWithBrowserController:self->_browserController];
    [v11 insertNewTabDocument:v28 forcingOrderAfterTabDocument:v27 inBackground:0 animated:0];
  }
  else
  {
    if (![v6 swapProcess]) {
      goto LABEL_38;
    }
    uint64_t v28 = [[TabDocument alloc] initWithBrowserController:self->_browserController];
    [v11 insertNewTabDocument:v28 forcingOrderAfterTabDocument:v27 inBackground:0 animated:0];
    [v11 setActiveTabDocument:v28 animated:0];
    [v11 closeTabDocument:v27 animated:1];
  }

  v27 = v28;
LABEL_38:
  uint64_t v29 = [v6 URL];
  BOOL useInjectedBundle = self->_useInjectedBundle;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __39__PageLoadTestRunner__startNextPageNow__block_invoke;
  v32[3] = &unk_1E6D7AD48;
  v32[4] = self;
  id v10 = v6;
  id v33 = v10;
  [(TabDocument *)v27 loadTestURL:v29 withInjectedBundle:useInjectedBundle withCallback:v32 pagesNeedingMemoryWarningSent:self->_pagesNeedingMemoryWarningSent];

  if ([v10 status] == 1)
  {
    [v10 setStatus:2];
    if (self->_measureTime)
    {
      uint64_t v31 = [MEMORY[0x1E4F1C9C8] date];
      [v10 setWebContentProcessStartLoadDate:v31];
    }
  }

LABEL_42:
}

void __39__PageLoadTestRunner__startNextPageNow__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v4 loadError];
  [v2 finishPage:v3 stats:v4 error:v5];
}

- (void)finish
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(NSMutableArray *)self->_pageLoadArray objectAtIndexedSubscript:self->_currentTestIteration];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 status] <= 4) {
          [v8 setStatus:6];
        }
        [v8 setTimer:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [MEMORY[0x1E4F18DA8] setDefaultTimeoutInterval:self->_savedDefaultTimeoutInterval];
  [(PageLoadTestRunner *)self checkForWorldLeaksSoon];
  [(PageLoadTestRunner *)self finishedTestRunnerIteration];
  unsigned int testIterations = self->_testIterations;
  unsigned int v10 = self->_currentTestIteration + 1;
  self->_currentTestIteration = v10;
  if (testIterations && v10 < testIterations)
  {
    self->_started = 0;
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PageLoadTestRunner_finish__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(PageLoadTestRunner *)self finishedTestRunner];
    [(PageLoadTestRunner *)self _closeLogStream];
  }
}

uint64_t __28__PageLoadTestRunner_finish__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (id)_pageLoadForTabDocument:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", self->_currentTestIteration, 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 status] && objc_msgSend(v7, "status") < 5)
        {
          id v4 = v7;
          goto LABEL_12;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_pageTimeoutExpired:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  uint64_t v5 = [v4 endLoadDate];

  if (!v5)
  {
    uint64_t v6 = [v10 fireDate];
    [v4 setEndLoadDate:v6];
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Page load timed out", *MEMORY[0x1E4F28568], 0);
  long long v9 = [v7 errorWithDomain:@"PageLoadErrorDomain" code:-2 userInfo:v8];

  [v4 setTimer:0];
  [(PageLoadTestRunner *)self finishPage:v4 stats:0 error:v9];
}

- (void)_pageRestExpired:(id)a3
{
  id v4 = [a3 userInfo];
  if ([v4 status] == 4)
  {
    [v4 setTimer:0];
    [(PageLoadTestRunner *)self finishPage:v4 stats:0 error:0];
  }
}

- (void)_checkRedirect:(id)a3
{
  id v8 = a3;
  id v4 = [(BrowserController *)self->_browserController tabController];
  uint64_t v5 = [v4 activeTabDocument];
  uint64_t v6 = [(id)v5 URL];

  uint64_t v7 = [v8 URL];
  LOBYTE(v5) = [v7 isEqual:v6];

  if ((v5 & 1) == 0) {
    [v8 setRedirectURL:v6];
  }
}

- (void)_updatePageLoad:(id)a3 stats:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    long long v9 = [v7 loadStartDate];
    if (v9) {
      [v6 setWebContentProcessStartLoadDate:v9];
    }
    id v10 = [v8 lastPageLoadEventDate];

    if (v10) {
      [v6 setEndLoadDate:v10];
    }
    long long v11 = [v8 firstVisualLayoutDate];

    if (v11) {
      [v6 setFirstVisualLayoutDate:v11];
    }
    long long v12 = [v8 domContentLoadedDate];

    if (v12)
    {
      [v6 setDomContentLoadedDate:v12];
      long long v13 = [v6 uiProcessStartDate];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      long long v16 = WBS_LOG_CHANNEL_PREFIXPLT();
      if (os_signpost_enabled(v16))
      {
        uint64_t v17 = v16;
        int v34 = 134217984;
        unint64_t v35 = continuousTimeAddInterval([v6 uiProcessStartTime], v15);
        _os_signpost_emit_with_name_impl(&dword_1E102C000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PLT_DOMContentLoaded", "%{signpost.description:end_time}llu", (uint8_t *)&v34, 0xCu);
      }
    }
    uint64_t v18 = [v8 firstMeaningfulPaintDate];

    if (v18)
    {
      [v6 setFirstMeaningfulPaintDate:v18];
      v19 = [v6 uiProcessStartDate];
      [v18 timeIntervalSinceDate:v19];
      double v21 = v20;

      id v22 = WBS_LOG_CHANNEL_PREFIXPLT();
      if (os_signpost_enabled(v22))
      {
        long long v23 = v22;
        unint64_t v24 = continuousTimeAddInterval([v6 uiProcessStartTime], v21);
        int v34 = 134217984;
        unint64_t v35 = v24;
        _os_signpost_emit_with_name_impl(&dword_1E102C000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PLT_FirstMeaningfulPaint", "%{signpost.description:end_time}llu", (uint8_t *)&v34, 0xCu);
      }
    }
    id v25 = [v8 allSubresourcesLoadedDate];

    if (v25)
    {
      [v6 setAllSubresourcesLoadedDate:v25];
      uint64_t v26 = [v6 uiProcessStartDate];
      [v25 timeIntervalSinceDate:v26];
      double v28 = v27;

      uint64_t v29 = WBS_LOG_CHANNEL_PREFIXPLT();
      if (os_signpost_enabled(v29))
      {
        char v30 = v29;
        unint64_t v31 = continuousTimeAddInterval([v6 uiProcessStartTime], v28);
        int v34 = 134217984;
        unint64_t v35 = v31;
        _os_signpost_emit_with_name_impl(&dword_1E102C000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PLT_AllSubresourcesLoaded", "%{signpost.description:end_time}llu", (uint8_t *)&v34, 0xCu);
      }
    }
  }
  v32 = [v6 endLoadDate];

  if (!v32)
  {
    id v33 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setEndLoadDate:v33];
  }
  if (self->_collectHeapStatistics) {
    objc_msgSend(v6, "setHeapAfter:", +[PageLoadTestRunner heapStatistics](PageLoadTestRunner, "heapStatistics"));
  }
}

- (void)finishPage:(id)a3 stats:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v16 status] <= 4)
  {
    if (v9)
    {
      id v10 = [v16 error];

      if (!v10) {
        [v16 setError:v9];
      }
    }
    if ([v16 status] == 2
      && ([(PageLoadTestRunner *)self _updatePageLoad:v16 stats:v8],
          [(PageLoadTestRunner *)self _checkRedirect:v16],
          [v16 error],
          long long v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11)
      && [(PageLoadTestRunner *)self startPageAction:v16])
    {
      [v16 setStatus:3];
    }
    else if ([v16 status] > 3 || self->_pageRestInterval == 0.0)
    {
      if ([v16 status] != 4
        || ([v16 timer], long long v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
      {
        [v16 setTimer:0];
        double v14 = [v16 error];

        if (v14) {
          uint64_t v15 = 6;
        }
        else {
          uint64_t v15 = 5;
        }
        [v16 setStatus:v15];
        [(PageLoadTestRunner *)self finishedTestPage:v16];
        [(PageLoadTestRunner *)self startNextPage];
      }
    }
    else
    {
      [v16 setStatus:4];
      long long v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__pageRestExpired_ selector:v16 userInfo:0 repeats:self->_pageRestInterval];
      [v16 setTimer:v12];
    }
  }
}

- (BOOL)startPageAction:(id)a3
{
  double pageActionInterval = self->_pageActionInterval;
  if (pageActionInterval > 0.0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
    id v6 = a3;
    id v7 = [v5 date];
    [v6 startRenderFps:v7];

    id v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__handleActionTimer_ selector:v6 userInfo:1 repeats:self->_pageActionInterval];
    [v6 setTimer:v8];

    id v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    id v10 = [v6 timer];

    [v9 addTimer:v10 forMode:*MEMORY[0x1E4FB30B0]];
  }
  return pageActionInterval > 0.0;
}

- (BOOL)performActionForPage:(id)a3
{
  return 0;
}

- (void)_handleActionTimer:(id)a3
{
  id v6 = [a3 userInfo];
  if (!-[PageLoadTestRunner performActionForPage:](self, "performActionForPage:"))
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v6 finishRenderFps:v4];

    if ([(PageLoadTestRunner *)self resetsZoomBetweenPages])
    {
      LODWORD(v5) = 1.0;
      [(BrowserController *)self->_browserController setZoomScale:v5];
    }
    [(PageLoadTestRunner *)self finishPage:v6 stats:0 error:0];
  }
}

- (void)startingTestRunner
{
}

- (void)finishedTestRunnerIteration
{
}

- (void)finishedTestRunner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pageLoadTestRunnerFinished:self];

  [(PageLoadTestRunner *)self log:@"PageLoadTest Finished."];
}

- (void)startingTestPage:(id)a3
{
  id v4 = [(PageLoadTestRunner *)self browserController];
  double v5 = [v4 tabController];
  id v6 = [v5 activeTabDocument];
  [v6 setStoreBannersAreDisabled:1];

  id v7 = [(PageLoadTestRunner *)self browserController];
  [v7 setFavoritesState:0 animated:0];
}

- (void)finishedTestPage:(id)a3
{
  id v4 = a3;
  double v5 = WBS_LOG_CHANNEL_PREFIXPLT();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E102C000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UIProcessPageLoad", (const char *)&unk_1E1266082, buf, 2u);
  }
  [(PageLoadTestRunner *)self log:@"%@", v4];
}

- (void)log:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v9];

  [v6 insertString:@"safari-plt-test Page Load: " atIndex:0];
  NSLog((NSString *)@"%@", v6);
  if (self->_logStream)
  {
    [v6 appendString:@"\n"];
    logStream = self->_logStream;
    id v8 = v6;
    -[NSOutputStream write:maxLength:](logStream, "write:maxLength:", [v8 UTF8String], objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4));
  }
}

- (void)clearCacheWithURL:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F18D78], "sharedURLCache", a3);
  [v3 removeAllCachedResponses];

  id v4 = (void *)MEMORY[0x1E4FB6D90];
  [v4 emptyCache];
}

+ (void)addLeakToArray:(id)a3 count:(int)a4 name:(id)a5
{
  if (a4)
  {
    uint64_t v6 = *(void *)&a4;
    id v7 = NSString;
    if (a4 == 1) {
      id v8 = "";
    }
    else {
      id v8 = "s";
    }
    id v9 = a3;
    id v10 = [v7 stringWithFormat:@"%d %@%s", v6, a5, v8];
    [v9 addObject:v10];
  }
}

+ (BOOL)closingBrowserWindowsForWorldLeakTest
{
  return 0;
}

+ (id)worldLeaksString
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6DD0], "webViewCount"), @"WebView object");
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6DD0], "frameCount"), @"WebFrame object");
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6DD0], "dataSourceCount"), @"WebDataSource object");
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6DD0], "viewCount"), @"WebFrameView object");
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6DD0], "HTMLRepresentationCount"), @"WebHTMLRepresentation object");
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6DD0], "bridgeCount"), @"WebBridge object");
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E4FB6D90], "javaScriptInterpretersCount"), @"JavaScript interpreter");
  if ([v3 count])
  {
    id v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)finishCheckingForWorldLeaks
{
  v2 = [(id)objc_opt_class() worldLeaksString];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)closeBrowserWindowsAndFinishCheckingForWorldLeaks
{
  if (self->_checkForWorldLeaks)
  {
    [(PageLoadTestRunner *)self closeBrowserWindows];
    [(PageLoadTestRunner *)self performSelector:sel_finishCheckingForWorldLeaks withObject:0 afterDelay:2.5];
  }
}

- (void)checkForWorldLeaksSoon
{
  if (self->_checkForWorldLeaks) {
    [(PageLoadTestRunner *)self performSelector:sel_closeBrowserWindowsAndFinishCheckingForWorldLeaks withObject:0 afterDelay:0.0];
  }
}

- (BOOL)checkForWorldLeaksNow
{
  if (!self->_checkForWorldLeaks) {
    return 0;
  }
  [(PageLoadTestRunner *)self closeBrowserWindows];
  return [(PageLoadTestRunner *)self finishCheckingForWorldLeaks];
}

+ ($2825F4736939C4A6D3AD43837233062D)heapStatistics
{
  v2 = (unsigned int *)MEMORY[0x1E4F14978];
  unint64_t v3 = *MEMORY[0x1E4F14978];
  if (v3)
  {
    unint64_t v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    id v7 = (uint64_t *)MEMORY[0x1E4F14980];
    uint64_t v8 = *MEMORY[0x1E4F14980];
    do
    {
      if (*(void *)(*(void *)(v8 + 8 * v4) + 24)) {
        uint64_t v9 = *(void *)(*(void *)(v8 + 8 * v4) + 24);
      }
      else {
        uint64_t v9 = 0;
      }
      if (v9 == *(void *)(*(void *)v8 + 24))
      {
        scalable_zone_info();
        v5 += v11;
        uint64_t v6 = (v12 + v6);
        uint64_t v8 = *v7;
        unint64_t v3 = *v2;
      }
      ++v4;
    }
    while (v4 < v3);
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int v5 = 0;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v5 | (unint64_t)(v6 << 32));
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (NSString)logFile
{
  return self->_logFile;
}

- (void)setLogFile:(id)a3
{
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (void)setOutputFilename:(id)a3
{
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
}

- (unint64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(unint64_t)a3
{
  self->_skipCount = a3;
}

- (BOOL)disableProgressBar
{
  return self->_disableProgressBar;
}

- (void)setDisableProgressBar:(BOOL)a3
{
  self->_disableProgressBar = a3;
}

- (BOOL)failFast
{
  return self->_failFast;
}

- (void)setFailFast:(BOOL)a3
{
  self->_failFast = a3;
}

- (BOOL)resetsZoomBetweenPages
{
  return self->_resetsZoomBetweenPages;
}

- (void)setResetsZoomBetweenPages:(BOOL)a3
{
  self->_resetsZoomBetweenPages = a3;
}

- (double)pageTimeout
{
  return self->_pageTimeout;
}

- (void)setPageTimeout:(double)a3
{
  self->_pageTimeout = a3;
}

- (double)pageActionInterval
{
  return self->_pageActionInterval;
}

- (void)setPageActionInterval:(double)a3
{
  self->_double pageActionInterval = a3;
}

- (double)pageRestInterval
{
  return self->_pageRestInterval;
}

- (void)setPageRestInterval:(double)a3
{
  self->_pageRestInterval = a3;
}

- (int)cacheClearDirective
{
  return self->_cacheClearDirective;
}

- (void)setCacheClearDirective:(int)a3
{
  self->_cacheClearDirective = a3;
}

- (BOOL)collectHeapStatistics
{
  return self->_collectHeapStatistics;
}

- (void)setCollectHeapStatistics:(BOOL)a3
{
  self->_collectHeapStatistics = a3;
}

- (BOOL)checkForWorldLeaks
{
  return self->_checkForWorldLeaks;
}

- (void)setCheckForWorldLeaks:(BOOL)a3
{
  self->_checkForWorldLeaks = a3;
}

- (PageLoadTestRunnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PageLoadTestRunnerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)tabCount
{
  return self->_tabCount;
}

- (void)setTabCount:(unint64_t)a3
{
  self->_tabCount = a3;
}

- (BOOL)loadURLInNewTab
{
  return self->_loadURLInNewTab;
}

- (void)setLoadURLInNewTab:(BOOL)a3
{
  self->_loadURLInNewTab = a3;
}

- (BrowserController)browserController
{
  return self->_browserController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_logFile, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_logStream, 0);
  objc_storeStrong((id *)&self->_pageLoadArray, 0);
  objc_storeStrong((id *)&self->_pagesNeedingMemoryWarningSent, 0);
}

@end