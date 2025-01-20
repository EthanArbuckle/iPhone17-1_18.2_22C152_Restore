@interface MapsAppTestResizeWindow
- (BOOL)runTest;
- (MapsAppTestResizeWindow)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
@end

@implementation MapsAppTestResizeWindow

- (MapsAppTestResizeWindow)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MapsAppTestResizeWindow;
  v9 = [(MapsAppTest *)&v13 initWithApplication:a3 testName:a4 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"timeoutInSeconds"];
    v9->_timeoutInSeconds = (int64_t)[v10 integerValue];

    v11 = [v8 objectForKeyedSubscript:@"numberOfResizes"];
    v9->_numberOfResizes = (int64_t)[v11 integerValue];
  }
  return v9;
}

- (BOOL)runTest
{
  [(MapsAppTest *)self startedTest];
  v3 = [(MapsAppTest *)self testCoordinator];
  v4 = [v3 mapViewForPPTTest];
  v5 = [v4 window];

  id v6 = objc_alloc((Class)sub_100BF9FE0());
  v7 = [(MapsAppTest *)self testName];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100BFA0C4;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  id v8 = [v6 initWithTestName:v7 window:v5 completionHandler:v10];

  [v8 setMinimumWindowSize:300.0, 300.0];
  [v8 setMaximumWindowSize:600.0, 600.0];
  [sub_100BFA0CC() runTestWithParameters:v8];

  return 1;
}

@end