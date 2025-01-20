@interface PPTBasicTest
- (BKLibraryAsset)asset;
- (BOOL)didTestFail;
- (BOOL)hasHandler;
- (BOOL)mainTest;
- (BOOL)running;
- (BOOL)waitForCACommitBeforeTrackingMetric;
- (NSDictionary)options;
- (NSDictionary)testDefinition;
- (NSObject)bookController;
- (NSString)bookTitle;
- (NSString)name;
- (PPTBasicTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (id)bookshelf;
- (id)onReceiveHandler;
- (id)onTestFinished;
- (int)handlerTimeout;
- (int)testTimeout;
- (int)timeBeforeTest;
- (unint64_t)result;
- (void)_handleTestEnd:(id)a3;
- (void)finishPPTTestWithResult:(unint64_t)a3;
- (void)onBookViewControllerChange:(id)a3;
- (void)setAsset:(id)a3;
- (void)setBookTitle:(id)a3;
- (void)setMainTest:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOnReceiveHandler:(id)a3;
- (void)setOnTestFinished:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResult:(unint64_t)a3;
- (void)setRunning:(BOOL)a3;
- (void)setTestDefinition:(id)a3;
- (void)setTestTimeout:(int)a3;
- (void)startPPTTest;
- (void)subscribeToStartNotification:(id)a3 endNotification:(id)a4;
- (void)terminate;
@end

@implementation PPTBasicTest

- (PPTBasicTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PPTBasicTest;
  v14 = [(PPTBasicTest *)&v24 init];
  if (v14)
  {
    v15 = [v13 objectForKeyedSubscript:@"book-type"];
    if (!v15)
    {
LABEL_8:
      objc_storeStrong((id *)v14 + 5, a4);
      objc_storeStrong((id *)v14 + 6, a5);
      objc_storeStrong((id *)v14 + 7, a3);
      v14[8] = a6;
      *((_DWORD *)v14 + 5) = 5;
      *(void *)(v14 + 12) = 0x100000002;
      *((void *)v14 + 8) = 1;

      goto LABEL_9;
    }
    uint64_t v16 = [&off_100A83518 objectForKeyedSubscript:v15];
    v17 = (void *)*((void *)v14 + 11);
    *((void *)v14 + 11) = v16;

    if (*((void *)v14 + 11) || (BCReportAssertionFailureWithMessage(), *((void *)v14 + 11)))
    {
      v18 = sub_10020FC30();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v19 = *((void *)v14 + 11);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v19;
      v20 = "Creating test with book named: %{public}@";
      v21 = v18;
      uint32_t v22 = 12;
    }
    else
    {
      v18 = sub_10020FC30();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      *(_WORD *)buf = 0;
      v20 = "Invalid book title when creating test";
      v21 = v18;
      uint32_t v22 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
    goto LABEL_7;
  }
LABEL_9:

  return (PPTBasicTest *)v14;
}

- (BKLibraryAsset)asset
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  p_asset = &self->_asset;
  if (!self->_asset)
  {
    v4 = [(PPTBasicTest *)self bookTitle];

    if (v4)
    {
      v5 = +[BKLibraryManager defaultManager];
      if (!v5)
      {
        v6 = sub_10020FC30();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Failed to find the book library", buf, 2u);
        }
      }
      uint64_t v7 = [v5 predicateForLocalLibraryAssets];
      id v8 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
      v28 = (void *)v7;
      [v8 setPredicate:v7];
      v29 = v5;
      v9 = [v5 uiChildContext];
      id v34 = 0;
      v27 = v8;
      v10 = [v9 executeFetchRequest:v8 error:&v34];
      id v26 = v34;

      id v11 = sub_10020FC30();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v10 count:v26];
        *(_DWORD *)buf = 134217984;
        id v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Library contains %lu books", buf, 0xCu);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = v10;
      id v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v31;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v19 = [v18 title:v26];
            v20 = [(PPTBasicTest *)self bookTitle];
            unsigned int v21 = [v19 isEqualToString:v20];

            if (v21)
            {
              objc_storeStrong((id *)&self->_asset, v18);
              goto LABEL_21;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      if (!*p_asset)
      {
        uint32_t v22 = sub_10020FC30();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [(PPTBasicTest *)self bookTitle];
          *(_DWORD *)buf = 138543362;
          id v37 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Failed to find book named: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  objc_super v24 = *p_asset;

  return v24;
}

- (BOOL)waitForCACommitBeforeTrackingMetric
{
  return 1;
}

- (void)startPPTTest
{
  if (self->_running && self->_mainTest)
  {
    v3 = +[UIApplication sharedApplication];
    if ([(PPTBasicTest *)self waitForCACommitBeforeTrackingMetric])
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1001B74E0;
      v4[3] = &unk_100A43DD8;
      id v5 = v3;
      v6 = self;
      [v5 installCACommitCompletionBlock:v4];
    }
    else
    {
      [v3 startedTest:self->_name];
    }
  }
}

- (void)finishPPTTestWithResult:(unint64_t)a3
{
  if (self->_running)
  {
    self->_result = a3;
    if (!a3 && self->_mainTest)
    {
      v4 = +[UIApplication sharedApplication];
      unsigned int v5 = [v4 isRunningTest:self->_name];

      if (v5)
      {
        v6 = +[UIApplication sharedApplication];
        [v6 finishedTest:self->_name];
      }
    }
    onTestFinished = (void (**)(id, SEL))self->_onTestFinished;
    if (onTestFinished) {
      onTestFinished[2](onTestFinished, a2);
    }
    self->_running = 0;
  }
}

- (void)subscribeToStartNotification:(id)a3 endNotification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_handleTestStart:" name:v7 object:0];

  [v8 addObserver:self selector:"_handleTestEnd:" name:v6 object:0];
}

- (void)_handleTestEnd:(id)a3
{
}

- (BOOL)didTestFail
{
  return self->_result == 1;
}

- (BOOL)hasHandler
{
  v3 = +[BKTestDriverDispatcher shared];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B76EC;
  v5[3] = &unk_100A4A0A0;
  v5[4] = self;
  [v3 sync:v5];

  return 1;
}

- (void)onBookViewControllerChange:(id)a3
{
  [a3 bookController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B781C;
  v5[3] = &unk_100A43DD8;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)terminate
{
  self->_running = 0;
  v3 = +[BKTestDriverDispatcher shared];
  [v3 unsubscribe:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (id)bookshelf
{
  v2 = +[BKAppDelegate sceneManager];
  v3 = [v2 primarySceneController];

  if (!v3)
  {
    BCReportAssertionFailureWithMessage();
    id v8 = sub_10020FC30();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to find primarySceneController", buf, 2u);
    }
  }
  id v4 = [v3 rootBarCoordinator];
  unsigned int v5 = [v4 selectedTopViewController];

  objc_opt_class();
  id v6 = BUDynamicCast();
  if (!v6)
  {
    BCReportAssertionFailureWithMessage();
    v9 = sub_10020FC30();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to find bookshelf", v10, 2u);
    }
  }

  return v6;
}

- (int)handlerTimeout
{
  return self->_handlerTimeout;
}

- (id)onReceiveHandler
{
  return self->_onReceiveHandler;
}

- (void)setOnReceiveHandler:(id)a3
{
}

- (id)onTestFinished
{
  return self->_onTestFinished;
}

- (void)setOnTestFinished:(id)a3
{
}

- (int)timeBeforeTest
{
  return self->_timeBeforeTest;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)testDefinition
{
  return self->_testDefinition;
}

- (void)setTestDefinition:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)mainTest
{
  return self->_mainTest;
}

- (void)setMainTest:(BOOL)a3
{
  self->_mainTest = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (int)testTimeout
{
  return self->_testTimeout;
}

- (void)setTestTimeout:(int)a3
{
  self->_testTimeout = a3;
}

- (void)setAsset:(id)a3
{
}

- (NSObject)bookController
{
  return self->_bookController;
}

- (NSString)bookTitle
{
  return self->_bookTitle;
}

- (void)setBookTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookTitle, 0);
  objc_storeStrong((id *)&self->_bookController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_testDefinition, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_onTestFinished, 0);

  objc_storeStrong(&self->_onReceiveHandler, 0);
}

@end