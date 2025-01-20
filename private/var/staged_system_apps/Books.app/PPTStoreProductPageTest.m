@interface PPTStoreProductPageTest
- (BOOL)startPPTTestCalled;
- (PPTStoreProductPageTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (int)timeBeforeTest;
- (void)_handleTestEnd:(id)a3;
- (void)_startTestWithRootBarCoordinating:(id)a3;
- (void)setStartPPTTestCalled:(BOOL)a3;
- (void)startTest;
@end

@implementation PPTStoreProductPageTest

- (PPTStoreProductPageTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PPTStoreProductPageTest;
  return [(PPTStoreDependentTest *)&v7 initWithName:a3 options:a4 testDefinition:a5 isMainTest:a6];
}

- (int)timeBeforeTest
{
  return 20;
}

- (void)_handleTestEnd:(id)a3
{
  if ([(PPTStoreProductPageTest *)self startPPTTestCalled])
  {
    [(PPTStoreProductPageTest *)self setStartPPTTestCalled:0];
    [(PPTBasicTest *)self finishPPTTestWithResult:0];
  }
}

- (void)startTest
{
  [(PPTBasicTest *)self setTestTimeout:60];
  [(PPTBasicTest *)self setRunning:1];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleTestEnd:" name:BCCardStackTransitionTestAnimationWillBeginNotification object:0];

  id v4 = +[BSUITemplate factory];
  v5 = sub_10020FC30();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(PPTBasicTest *)self name];
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting test named: %{public}@ and waiting for tab bar", buf, 0xCu);
  }
  objc_super v7 = +[BKAppDelegate sceneManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A5F38;
  v8[3] = &unk_100A44030;
  v8[4] = self;
  [v7 requestTabBarSceneController:v8];
}

- (void)_startTestWithRootBarCoordinating:(id)a3
{
  id v4 = a3;
  v5 = sub_10020FC30();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(PPTBasicTest *)self name];
    *(_DWORD *)buf = 138543362;
    v50 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "With tab bar controller, starting test named: %{public}@", buf, 0xCu);
  }
  objc_super v7 = +[BKRootBarItemsProvider BooksIdentifier];
  [v4 selectWithIdentifier:v7 isUserAction:0];

  v8 = [v4 selectedNavigationController];
  objc_opt_class();
  v9 = BUDynamicCast();
  v10 = [v9 viewControllers];
  v11 = [v10 firstObject];

  v12 = [v11 content];
  v13 = [v12 entries];

  if (v13)
  {
    v14 = [v12 entries];
    id v15 = [v14 indexOfObjectPassingTest:&stru_100A49C88];

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = sub_10020FC30();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v17 = "feedViewController: could not find swoosh-root.xml";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
      }
    }
    else
    {
      v38 = self;
      v18 = [v12 entries];
      v16 = [v18 objectAtIndexedSubscript:v15];

      v19 = [v16 data];
      v20 = [v19 dictionary];

      v41 = v20;
      v40 = [v20 valueForKey:@"swooshConfig"];
      v39 = [v40 valueForKey:@"swooshBodyConfig"];
      v21 = [v39 valueForKey:@"items"];
      v22 = [v21 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v24 = [v21 objectAtIndexedSubscript:0];
        id v25 = [v24 count];

        if (v25 == (id)1)
        {
          v26 = [v21 objectAtIndexedSubscript:1];
          v27 = v26;
          uint64_t v28 = 0;
        }
        else
        {
          v26 = [v21 objectAtIndexedSubscript:0];
          v27 = v26;
          uint64_t v28 = 1;
        }
        v29 = [v26 objectAtIndexedSubscript:v28];
      }
      else
      {
        v29 = [v21 objectAtIndexedSubscript:1];
      }
      uint64_t v30 = [v29 valueForKey:@"url"];
      v31 = (void *)v30;
      if (v30)
      {
        v37 = v29;
        v47[0] = @"swooshIndex";
        v47[1] = @"url";
        v48[0] = &off_100A82E88;
        v48[1] = v30;
        v32 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
        v33 = [v16 delegate];
        [v33 feedEntry:v16 handleBehavior:0 name:@"GOTO_BOOK" arguments:v32];

        v34 = sub_10020FC30();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "waiting 10s for card stack to close", buf, 2u);
        }

        dispatch_time_t v35 = dispatch_time(0, 10000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001A6548;
        block[3] = &unk_100A44610;
        id v43 = v4;
        v44 = v38;
        v45 = v16;
        id v46 = v32;
        v36 = v32;
        dispatch_after(v35, (dispatch_queue_t)&_dispatch_main_q, block);

        v29 = v37;
      }
      else
      {
        v36 = sub_10020FC30();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "feedViewController: could not find swoosh-root.xml", buf, 2u);
        }
      }
    }
  }
  else
  {
    v16 = sub_10020FC30();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v17 = "feedViewController has no entries";
      goto LABEL_9;
    }
  }
}

- (BOOL)startPPTTestCalled
{
  return self->_startPPTTestCalled;
}

- (void)setStartPPTTestCalled:(BOOL)a3
{
  self->_startPPTTestCalled = a3;
}

@end