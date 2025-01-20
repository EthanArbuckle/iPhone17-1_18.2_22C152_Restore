@interface TPSApplication
- (BOOL)runTest:(id)a3 options:(id)a4;
- (id)_extendLaunchTest;
- (id)appDelegate;
@end

@implementation TPSApplication

- (id)_extendLaunchTest
{
  return @"Extend-Launch-Test";
}

- (id)appDelegate
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 delegate];

  return v3;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TPSApplication *)self appDelegate];
  [v8 resetCacheDefaults];

  v9 = [v7 objectForKeyedSubscript:@"iterations"];
  unsigned int v10 = [v9 intValue];

  v11 = [v7 objectForKeyedSubscript:@"delta"];
  unsigned int v12 = [v11 intValue];

  v13 = [v7 objectForKeyedSubscript:@"recapBased"];
  unsigned __int8 v14 = [v13 BOOLValue];

  if ([v6 hasPrefix:@"ScrollCollectionsView"])
  {
    v15 = [(TPSApplication *)self appDelegate];
    [v15 showCollectionsView];

    v16 = [(TPSApplication *)self appDelegate];
    v17 = [v16 collectionListViewController];
LABEL_5:
    v21 = v17;
    [v17 runTest:v6 options:v7];

    goto LABEL_6;
  }
  if ([v6 hasPrefix:@"ScrollTipListView"])
  {
    v18 = [(TPSApplication *)self appDelegate];
    v19 = +[TPSCommonDefines softwareWelcomeCollectionIdentifier];
    [v18 displayCollectionID:v19 tipID:0];

    v20 = [(TPSApplication *)self appDelegate];
    [v20 showTOCView];

    v16 = [(TPSApplication *)self appDelegate];
    v17 = [v16 tipListViewController];
    goto LABEL_5;
  }
  if ([v6 hasPrefix:@"ScrollTipsForCollection"])
  {
    v23 = [(TPSApplication *)self appDelegate];
    v24 = [v23 appController];
    v25 = [v24 collections];
    v26 = [v25 firstObject];

    v27 = [(TPSApplication *)self appDelegate];
    v28 = [v27 tipsByCollectionViewController];
    v29 = [v26 identifier];
    [v28 updateWithCollectionID:v29 tipID:0];

    v30 = [(TPSApplication *)self appDelegate];
    [v30 showTipsView];

    dispatch_time_t v31 = dispatch_time(0, 1000000000);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10002408C;
    v36[3] = &unk_1000B75D0;
    v36[4] = self;
    unsigned __int8 v40 = v14;
    id v37 = v6;
    unsigned int v38 = v10;
    unsigned int v39 = v12;
    dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, v36);
  }
  else if ([v6 hasPrefix:@"ResizeCollectionsView"])
  {
    id v32 = objc_alloc((Class)RPTResizeTestParameters);
    v33 = [(TPSApplication *)self appDelegate];
    v34 = [v33 window];
    id v35 = [v32 initWithTestName:v6 window:v34 completionHandler:0];

    [v35 setMinimumWindowSize:300.0, 300.0];
    [v35 setMaximumWindowSize:600.0, 600.0];
    +[RPTTestRunner runTestWithParameters:v35];
  }
LABEL_6:

  return 1;
}

@end