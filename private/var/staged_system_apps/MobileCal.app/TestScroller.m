@interface TestScroller
- (BOOL)inputInvalid;
- (TestScroller)initWithOptions:(id)a3 testName:(id)a4 application:(id)a5;
- (unint64_t)_scrollTypeFromOptions:(id)a3;
- (void)_callCompletionIfExists;
- (void)runRecapTestIfNeeded:(id)a3;
- (void)scrollView:(id)a3 completionBlock:(id)a4;
@end

@implementation TestScroller

- (TestScroller)initWithOptions:(id)a3 testName:(id)a4 application:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TestScroller;
  v11 = [(TestScroller *)&v25 init];
  if (v11)
  {
    v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Initializing TestScroller. TestName: %{public}@, Options: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v11->_testName, a4);
    objc_storeStrong((id *)&v11->_application, a5);
    validTestScrollTypeStrings = v11->_validTestScrollTypeStrings;
    v11->_validTestScrollTypeStrings = (NSArray *)&off_1001DCAE8;

    v11->_currentIter = 0;
    v14 = [v8 objectForKey:@"totalScrollDistance"];
    v15 = v14;
    if (v14)
    {
      v11->_totalScrollDistance = [v14 intValue];
    }
    else
    {
      v16 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error: totalScrollDistance given is nil", buf, 2u);
      }
      v11->_inputInvalid = 1;
    }
    v17 = [v8 objectForKey:@"scrollDistanceInterval"];
    v18 = v17;
    if (v17)
    {
      v11->_scrollDistanceInterval = [v17 intValue];
    }
    else
    {
      v19 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error: scrollDistanceInterval given is nil", buf, 2u);
      }
      v11->_inputInvalid = 1;
    }
    v20 = [v8 objectForKey:@"iterations"];
    v21 = v20;
    if (v20)
    {
      v11->_iterations = [v20 intValue];
    }
    else
    {
      v22 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error: iterations given is nil", buf, 2u);
      }
      v11->_inputInvalid = 1;
    }
    v23 = [v8 objectForKey:@"axis"];
    if ([v23 isEqualToString:@"Horizontal"]) {
      v11->_horizontal = 1;
    }
    v11->_scrollType = [(TestScroller *)v11 _scrollTypeFromOptions:v8];
  }
  return v11;
}

- (void)runRecapTestIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  int currentIter = v5->_currentIter;
  v5->_int currentIter = currentIter + 1;
  int iterations = v5->_iterations;
  id v8 = kCalUILogHandle;
  BOOL v9 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG);
  if (currentIter >= iterations)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Recap Test Finished", buf, 2u);
    }
    [(Application *)v5->_application finishedTest:v5->_testName];
    [(TestScroller *)v5 _callCompletionIfExists];
  }
  else
  {
    if (v9)
    {
      int v10 = v5->_currentIter;
      *(_DWORD *)buf = 67109120;
      int v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Running Recap Test, iteration: %d", buf, 8u);
    }
    id v11 = objc_alloc((Class)RPTScrollViewTestParameters);
    testName = v5->_testName;
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_1000D4320;
    v37 = &unk_1001D28A8;
    v38 = v5;
    id v13 = v4;
    id v39 = v13;
    id v14 = [v11 initWithTestName:testName scrollView:v13 completionHandler:&v34];
    RPTViewFrameInScreenSpace();
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [v13 adjustedContentInset:v34, v35, v36, v37, v38];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    int totalScrollDistance = v5->_totalScrollDistance;
    double v32 = (double)totalScrollDistance;
    if (totalScrollDistance == -1) {
      double v32 = 3.40282347e38;
    }
    if (v32 != 0.0) {
      [v14 setScrollingContentLength:];
    }
    [v14 setIterationDurationFactor:0.5];
    [v14 setScrollingBounds:v16 + v26, v18 + v24, v20 - (v26 + v30), v22 - (v24 + v28)];
    if (v5->_horizontal) {
      uint64_t v33 = 5;
    }
    else {
      uint64_t v33 = 4;
    }
    [v14 setDirection:v33];
    +[RPTTestRunner runTestWithParameters:v14];
  }
  objc_sync_exit(v5);
}

- (void)scrollView:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v7;

  if (v6)
  {
    unint64_t scrollType = self->_scrollType;
    switch(scrollType)
    {
      case 2uLL:
        [(Application *)self->_application startedTest:self->_testName];
        int totalScrollDistance = self->_totalScrollDistance;
        double v11 = (double)(totalScrollDistance / self->_scrollDistanceInterval);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000D44BC;
        v17[3] = &unk_1001D27D8;
        v17[4] = self;
        [v6 _simulateScrollWithTranslation:0 duration:v17 willBeginDragging:0 didEndDragging:0 willBeginDecelerating:0 didEndDecelerating:totalScrollDistance];
        break;
      case 1uLL:
        testName = self->_testName;
        uint64_t scrollDistanceInterval = self->_scrollDistanceInterval;
        uint64_t iterations = self->_iterations;
        uint64_t v15 = self->_totalScrollDistance;
        if (self->_horizontal) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 2;
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000D44B4;
        v18[3] = &unk_1001D4D98;
        v18[4] = self;
        [v6 _performScrollTest:testName iterations:iterations delta:scrollDistanceInterval length:v15 scrollAxis:v16 extraResultsBlock:0 completionBlock:v18];
        break;
      case 0uLL:
        [(TestScroller *)self runRecapTestIfNeeded:v6];
        break;
    }
  }
  else
  {
    [(Application *)self->_application failedTest:self->_testName withFailure:@"There was no scroll view"];
  }
}

- (unint64_t)_scrollTypeFromOptions:(id)a3
{
  id v4 = [a3 objectForKey:@"scrollType"];
  if (!v4) {
    goto LABEL_4;
  }
  NSUInteger v5 = [(NSArray *)self->_validTestScrollTypeStrings indexOfObject:v4];
  if (!v5)
  {
    if (+[RPTTestRunner isRecapAvailable])
    {
      unint64_t v6 = 0;
      goto LABEL_8;
    }
    uint64_t v12 = kCalUILogHandle;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    LOWORD(v13) = 0;
    id v8 = "Error: Input invalid because Recap is not available";
    BOOL v9 = v12;
    uint32_t v10 = 2;
    goto LABEL_6;
  }
  unint64_t v6 = v5;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    uint64_t v7 = kCalUILogHandle;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      unint64_t v6 = 0;
      self->_inputInvalid = 1;
      goto LABEL_8;
    }
    int v13 = 138412290;
    id v14 = v4;
    id v8 = "Error: Input invalid due to wrong scrollType string: %@";
    BOOL v9 = v7;
    uint32_t v10 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)_callCompletionIfExists
{
  id completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2]();
  }
}

- (BOOL)inputInvalid
{
  return self->_inputInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_validTestScrollTypeStrings, 0);
}

@end