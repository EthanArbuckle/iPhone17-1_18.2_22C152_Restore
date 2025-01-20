@interface MapsAppTest
- (BOOL)canUpdateTrayLayout;
- (BOOL)isRunningOnCarPlay;
- (BOOL)runTest;
- (MKMapView)mainMKMapView;
- (MapsAppTest)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (MapsAppTesting)app;
- (NSArray)serialSubTests;
- (NSDictionary)options;
- (NSMutableArray)fullyDrawnCallbacks;
- (NSMutableDictionary)results;
- (NSString)testName;
- (PPTTestCoordinatorProtocol)testCoordinator;
- (VKMapView)mainVKMapView;
- (double)currentSubTestStartTime;
- (unint64_t)currentSubTestIndex;
- (void)_presentDirectionDetailsWithCompletion:(id)a3;
- (void)_presentDismissTrayTestWithCount:(unint64_t)a3 numberOfRounds:(unint64_t)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 presenter:(id)a7 completion:(id)a8;
- (void)_presentDismissTrayTestWithLatencySubTestName:(id)a3 animationSubTestName:(id)a4 presenter:(id)a5 completion:(id)a6;
- (void)_presentDismissTrayTestWithNumberOfRounds:(unint64_t)a3 latencySubTestName:(id)a4 animationSubTestName:(id)a5 presenter:(id)a6 completion:(id)a7;
- (void)_resizingTestWithCount:(unint64_t)a3 numbeorOfRounds:(unint64_t)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 completion:(id)a7;
- (void)_resizingTestWithNumberOfRounds:(unint64_t)a3 latencySubTestName:(id)a4 animationSubTestName:(id)a5 completion:(id)a6;
- (void)_resizingTrayWithLatencySubTestName:(id)a3 animationSubTestName:(id)a4 completion:(id)a5;
- (void)_updateTrayLayout:(unint64_t)a3 animated:(BOOL)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 completion:(id)a7;
- (void)addFullyDrawnCallback:(id)a3;
- (void)cleanup:(BOOL)a3;
- (void)didEndGEOPPTTest_Manifest:(id)a3;
- (void)didEndGEOPPTTest_Manifest_ForcedUpdate:(id)a3;
- (void)didEndGEOPPTTest_Manifest_GetResourceManifest:(id)a3;
- (void)didEndGEOPPTTest_Manifest_HandleMessage:(id)a3;
- (void)didEndGEOPPTTest_Manifest_ResetActiveTileGroup:(id)a3;
- (void)didEndGEOPPTTest_Manifest_SetActiveTileGroup:(id)a3;
- (void)didEndGEOPPTTest_Manifest_SetManifestToken:(id)a3;
- (void)didEndGEOPPTTest_Manifest_SetupConnection:(id)a3;
- (void)didEndGEOPPTTest_Manifest_Update:(id)a3;
- (void)didTearDownForVKTest;
- (void)dismissTrayWithAssertTrayType:(int64_t)a3 completion:(id)a4;
- (void)dismissTrayWithCompletion:(id)a3;
- (void)dismissTrayWithSubtestName:(id)a3 completion:(id)a4;
- (void)failedTest;
- (void)failedTestWithReason:(id)a3;
- (void)finishedSerialSubTest:(id)a3;
- (void)finishedSubTest:(id)a3;
- (void)finishedTest;
- (void)finishedTestWithExtraResults:(id)a3;
- (void)onFullyDrawn:(id)a3;
- (void)popToRootTrayWithCompletion:(id)a3;
- (void)presentDismissTrayTestAndSubTestsWithPrefix:(id)a3 presenter:(id)a4 completion:(id)a5;
- (void)presentDismissTrayTestWithPresenter:(id)a3 completion:(id)a4;
- (void)registerGEOManifestSubtests;
- (void)resizingTestAndSubTestsWithPrefix:(id)a3 completion:(id)a4;
- (void)resizingTestWithCompletion:(id)a3;
- (void)rotateDeviceWithCompletion:(id)a3;
- (void)rotateDeviceWithSubtestName:(id)a3 completion:(id)a4;
- (void)runSerialSubTestAtIndex:(unint64_t)a3;
- (void)setFullyDrawnCallbacks:(id)a3;
- (void)setResults:(id)a3;
- (void)setupForVKTest;
- (void)setupForVKTestWithMapView:(id)a3;
- (void)setupFullyDrawnNotification:(SEL)a3;
- (void)startedSerialSubTest:(id)a3;
- (void)startedSubTest:(id)a3;
- (void)startedSubTest:(id)a3 withMetrics:(id)a4;
- (void)startedTest;
- (void)switchToMapType:(unint64_t)a3;
- (void)switchToViewMode:(int64_t)a3;
- (void)updateTrayLayout:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateTrayLayout:(unint64_t)a3 withSubtestName:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)vkMapViewFullyDrawn:(id)a3;
- (void)willBeginGEOPPTTest_Manifest:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_ForcedUpdate:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_GetResourceManifest:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_HandleMessage:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_ResetActiveTileGroup:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_SetActiveTileGroup:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_SetManifestToken:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_SetupConnection:(id)a3;
- (void)willBeginGEOPPTTest_Manifest_Update:(id)a3;
- (void)willSetupForVKTest;
@end

@implementation MapsAppTest

- (void)_presentDirectionDetailsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10037B1A0;
  v7[3] = &unk_1012E6778;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTestTrayDidPresentNotification" object:0 usingBlock:v7];
  v6 = [(MapsAppTest *)self testCoordinator];
  [v6 pptTestPresentDirectionsDetails];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (MKMapView)mainMKMapView
{
  v2 = [(MapsAppTest *)self testCoordinator];
  v3 = [v2 mapViewForPPTTest];

  return (MKMapView *)v3;
}

- (VKMapView)mainVKMapView
{
  v2 = [(MapsAppTest *)self testCoordinator];
  v3 = [v2 mapViewForPPTTest];
  id v4 = [v3 _mapLayer];

  return (VKMapView *)v4;
}

- (void)switchToMapType:(unint64_t)a3
{
  id v4 = [(MapsAppTest *)self testCoordinator];
  uint64_t v5 = 1;
  switch(a3)
  {
    case 1uLL:
      uint64_t v5 = 2;
      break;
    case 2uLL:
      break;
    case 3uLL:
      uint64_t v5 = 6;
      break;
    case 4uLL:
      uint64_t v5 = 5;
      break;
    default:
      if (a3 == 104) {
        uint64_t v5 = 3;
      }
      else {
        uint64_t v5 = 0;
      }
      break;
  }
  id v6 = v4;
  [v4 setPPTTestViewMode:v5 animated:1];
}

- (void)switchToViewMode:(int64_t)a3
{
  id v4 = [(MapsAppTest *)self testCoordinator];
  [v4 setPPTTestViewMode:a3 animated:1];
}

- (void)willSetupForVKTest
{
  if ([(MapsAppTest *)self isRunningOnCarPlay])
  {
    v3 = [(MapsAppTest *)self mainMKMapView];
    [v3 setUserTrackingMode:0 animated:0];

    id v4 = [(MapsAppTest *)self testCoordinator];
    [v4 setChromeHidden:1];
  }
}

- (void)didTearDownForVKTest
{
  if ([(MapsAppTest *)self isRunningOnCarPlay])
  {
    id v3 = [(MapsAppTest *)self testCoordinator];
    [v3 setChromeHidden:0];
  }
}

- (BOOL)isRunningOnCarPlay
{
  v2 = [(MapsAppTest *)self mainMKMapView];
  id v3 = [v2 traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] == (id)3;

  return v4;
}

- (PPTTestCoordinatorProtocol)testCoordinator
{
  id v3 = objc_getAssociatedObject(self, &unk_1016105B8);
  if (!v3)
  {
    BOOL v4 = +[UIApplication sharedMapsDelegate];
    id v3 = [v4 testCoordinator];

    objc_setAssociatedObject(self, &unk_1016105B8, v3, (void *)1);
  }

  return (PPTTestCoordinatorProtocol *)v3;
}

- (void)resizingTestWithCompletion:(id)a3
{
}

- (void)resizingTestAndSubTestsWithPrefix:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 stringByAppendingString:@"_Latency"];
  id v8 = [v7 stringByAppendingString:@"_Animation"];

  [(MapsAppTest *)self _resizingTestWithNumberOfRounds:10 latencySubTestName:v9 animationSubTestName:v8 completion:v6];
}

- (void)_resizingTestWithNumberOfRounds:(unint64_t)a3 latencySubTestName:(id)a4 animationSubTestName:(id)a5 completion:(id)a6
{
}

- (void)_resizingTestWithCount:(unint64_t)a3 numbeorOfRounds:(unint64_t)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 completion:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A4EA1C;
  v12[3] = &unk_101315260;
  unint64_t v17 = a3 + 1;
  unint64_t v18 = a4;
  v13 = self;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v9 = v16;
  id v10 = v15;
  id v11 = v14;
  [(MapsAppTest *)v13 _resizingTrayWithLatencySubTestName:v11 animationSubTestName:v10 completion:v12];
}

- (void)_resizingTrayWithLatencySubTestName:(id)a3 animationSubTestName:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A4EB40;
  v10[3] = &unk_1012ED778;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(MapsAppTest *)v11 _updateTrayLayout:0 animated:1 latencySubTestName:v9 animationSubTestName:v8 completion:v10];
}

- (BOOL)canUpdateTrayLayout
{
  v2 = [(MapsAppTest *)self testCoordinator];
  unsigned __int8 v3 = [v2 pptTestCanUpdateTrayLayout];

  return v3;
}

- (void)updateTrayLayout:(unint64_t)a3 withSubtestName:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  [(MapsAppTest *)self startedSubTest:v10];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A4F07C;
  v14[3] = &unk_1012E80F0;
  v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(MapsAppTest *)self updateTrayLayout:a3 animated:v7 completion:v14];
}

- (void)_updateTrayLayout:(unint64_t)a3 animated:(BOOL)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([v12 length] && objc_msgSend(v13, "length"))
  {
    [(MapsAppTest *)self startedSubTest:v12];
    id v15 = (void *)UIApp;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100A4F278;
    v23[3] = &unk_1012E66E0;
    v23[4] = self;
    id v24 = v12;
    id v25 = v13;
    [v15 installCACommitCompletionBlock:v23];

    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100A4F2BC;
  v19[3] = &unk_1012F7A50;
  char v22 = v16;
  v19[4] = self;
  id v20 = v13;
  id v21 = v14;
  id v17 = v14;
  id v18 = v13;
  [(MapsAppTest *)self updateTrayLayout:a3 animated:v9 completion:v19];
}

- (void)updateTrayLayout:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  BOOL v9 = +[UIDevice currentDevice];
  if ([v9 userInterfaceIdiom] == (id)5)
  {
  }
  else
  {
    id v10 = [(MapsAppTest *)self testCoordinator];
    unsigned __int8 v11 = [v10 pptTestCanUpdateTrayLayout];

    if (v11)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100A4F464;
      v13[3] = &unk_1012EEF90;
      id v14 = v8;
      +[PPTNotificationCenter addOnceObserverForName:@"PPTTestTrayLayoutDidUpdateNotification" object:0 usingBlock:v13];
      id v12 = [(MapsAppTest *)self testCoordinator];
      [v12 pptTestUpdateTrayLayout:a3 animated:v5];

      goto LABEL_7;
    }
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_7:
}

- (void)presentDismissTrayTestWithPresenter:(id)a3 completion:(id)a4
{
}

- (void)presentDismissTrayTestAndSubTestsWithPrefix:(id)a3 presenter:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 stringByAppendingString:@"_Latency"];
  unsigned __int8 v11 = [v10 stringByAppendingString:@"_Animation"];

  [(MapsAppTest *)self _presentDismissTrayTestWithNumberOfRounds:10 latencySubTestName:v12 animationSubTestName:v11 presenter:v9 completion:v8];
}

- (void)_presentDismissTrayTestWithNumberOfRounds:(unint64_t)a3 latencySubTestName:(id)a4 animationSubTestName:(id)a5 presenter:(id)a6 completion:(id)a7
{
}

- (void)_presentDismissTrayTestWithCount:(unint64_t)a3 numberOfRounds:(unint64_t)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 presenter:(id)a7 completion:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A4F6A0;
  v15[3] = &unk_101315288;
  unint64_t v21 = a3 + 1;
  unint64_t v22 = a4;
  char v16 = self;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v11 = v20;
  id v12 = v19;
  id v13 = v18;
  id v14 = v17;
  [(MapsAppTest *)v16 _presentDismissTrayTestWithLatencySubTestName:v14 animationSubTestName:v13 presenter:v12 completion:v15];
}

- (void)_presentDismissTrayTestWithLatencySubTestName:(id)a3 animationSubTestName:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a5;
  id v13 = a6;
  if ([v10 length]) {
    BOOL v14 = [v11 length] != 0;
  }
  else {
    BOOL v14 = 0;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A4F8C4;
  v22[3] = &unk_1013152D8;
  BOOL v26 = v14;
  v22[4] = self;
  id v15 = v11;
  id v23 = v15;
  id v16 = v10;
  id v24 = v16;
  id v17 = v13;
  id v25 = v17;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTestTrayDidPresentNotification" object:0 usingBlock:v22];
  if (v14)
  {
    [(MapsAppTest *)self startedSubTest:v16];
    id v18 = (void *)UIApp;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100A4FBE0;
    v19[3] = &unk_1012E66E0;
    v19[4] = self;
    id v20 = v16;
    id v21 = v15;
    [v18 installCACommitCompletionBlock:v19];
  }
  if (v12) {
    v12[2](v12);
  }
}

- (void)dismissTrayWithSubtestName:(id)a3 completion:(id)a4
{
  id v5 = a3;
  [(MapsAppTest *)self startedSubTest:v5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A4FCC8;
  v7[3] = &unk_1012E5D58;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(MapsAppTest *)self dismissTrayWithCompletion:v7];
}

- (void)dismissTrayWithCompletion:(id)a3
{
}

- (void)dismissTrayWithAssertTrayType:(int64_t)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A4FDB4;
  v8[3] = &unk_1012EEF90;
  id v9 = a4;
  id v6 = v9;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTestTrayDidDismissNotification" object:0 usingBlock:v8];
  BOOL v7 = [(MapsAppTest *)self testCoordinator];
  [v7 pptTestDismissTrayAnimated:1 assertTrayType:a3];
}

- (void)popToRootTrayWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsAppTest *)self testCoordinator];
  unsigned int v6 = [v5 pptTestIsTrayType:2];

  if (v6)
  {
    if (![(MapsAppTest *)self isRunningOnCarPlay])
    {
      BOOL v7 = [(MapsAppTest *)self testCoordinator];
      [v7 pptTestSearchCancel];
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A4FF1C;
    v13[3] = &unk_1012E6EA8;
    id v14 = v4;
    id v8 = v4;
    [(MapsAppTest *)self updateTrayLayout:1 animated:1 completion:v13];
    id v9 = v14;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A4FF34;
    v11[3] = &unk_1012E76E8;
    v11[4] = self;
    id v12 = v4;
    id v10 = v4;
    [(MapsAppTest *)self dismissTrayWithAssertTrayType:0 completion:v11];
    id v9 = v12;
  }
}

- (void)rotateDeviceWithSubtestName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MapsAppTest *)self startedSubTest:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A50010;
  v10[3] = &unk_1012E80F0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MapsAppTest *)self rotateDeviceWithCompletion:v10];
}

- (void)rotateDeviceWithCompletion:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A50198;
  v10[3] = &unk_1012EEF90;
  id v3 = a3;
  id v11 = v3;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTestOrientationDidRotateNotification" object:0 usingBlock:v10];
  id v4 = +[UIDevice currentDevice];
  id v5 = (char *)[v4 orientation];

  if ((unint64_t)(v5 - 3) < 2)
  {
    id v6 = +[UIApplication sharedApplication];
    id v7 = v6;
    id v8 = &stru_101315318;
    uint64_t v9 = 1;
    goto LABEL_5;
  }
  if ((unint64_t)(v5 - 1) <= 1)
  {
    id v6 = +[UIApplication sharedApplication];
    id v7 = v6;
    id v8 = &stru_1013152F8;
    uint64_t v9 = 4;
LABEL_5:
    [v6 rotateIfNeeded:v9 completion:v8];
  }
}

- (MapsAppTest)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 length])
  {
    v24.receiver = self;
    v24.super_class = (Class)MapsAppTest;
    id v12 = [(MapsAppTest *)&v24 init];
    id v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_app, a3);
      id v14 = (NSString *)[v10 copy];
      testName = v13->_testName;
      v13->_testName = v14;

      id v16 = (NSDictionary *)[v11 copy];
      options = v13->_options;
      v13->_options = v16;

      uint64_t v18 = objc_opt_new();
      results = v13->_results;
      v13->_results = (NSMutableDictionary *)v18;

      uint64_t v20 = objc_opt_new();
      fullyDrawnCallbacks = v13->_fullyDrawnCallbacks;
      v13->_fullyDrawnCallbacks = (NSMutableArray *)v20;
    }
    self = v13;
    unint64_t v22 = self;
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (BOOL)runTest
{
  return 0;
}

- (void)cleanup:(BOOL)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  id v5 = +[GEONotificationPreferenceManager sharedManager];
  [v5 reset];

  [(NSMutableDictionary *)self->_results removeAllObjects];
  [(NSMutableArray *)self->_fullyDrawnCallbacks removeAllObjects];

  [(MapsAppTest *)self didTearDownForVKTest];
}

- (void)startedTest
{
  id v3 = sub_1005765DC();
  if (os_signpost_enabled(v3))
  {
    testName = self->_testName;
    int v5 = 138412290;
    id v6 = testName;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@", (uint8_t *)&v5, 0xCu);
  }

  [(MapsAppTesting *)self->_app startedTest:self->_testName];
}

- (void)startedSubTest:(id)a3
{
  id v4 = a3;
  int v5 = sub_1005765DC();
  if (os_signpost_enabled(v5))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v6, 0xCu);
  }

  [(MapsAppTesting *)self->_app startedSubTest:v4 forTest:self->_testName];
}

- (void)startedSerialSubTest:(id)a3
{
  id v4 = a3;
  int v5 = sub_1005765DC();
  if (os_signpost_enabled(v5))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v6, 0xCu);
  }

  [(MapsAppTesting *)self->_app startedSubTest:v4 forTest:self->_testName];
}

- (void)startedSubTest:(id)a3 withMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1005765DC();
  if (os_signpost_enabled(v8))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v9, 0xCu);
  }

  [(MapsAppTesting *)self->_app startedSubTest:v6 forTest:self->_testName withMetrics:v7];
}

- (void)finishedSubTest:(id)a3
{
  id v4 = a3;
  [(MapsAppTesting *)self->_app finishedSubTest:v4 forTest:self->_testName];
  int v5 = sub_1005765DC();
  if (os_signpost_enabled(v5))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)finishedSerialSubTest:(id)a3
{
  id v20 = a3;
  -[MapsAppTesting finishedSubTest:forTest:](self->_app, "finishedSubTest:forTest:");
  id v4 = sub_1005765DC();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v20;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", buf, 0xCu);
  }

  int v5 = [(MapsAppTest *)self mainVKMapView];
  [v5 disableTestStatistics];

  int v6 = [(MapsAppTest *)self mainVKMapView];
  id v7 = [v6 testStatistics];

  id v8 = [(MapsAppTest *)self mainVKMapView];
  [v8 resetTestStatistics];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v9 objectForKeyedSubscript:v14];
        id v16 = [(MapsAppTest *)self results];
        id v17 = +[NSString stringWithFormat:@"%@:%@", v20, v14];
        [v16 setObject:v15 forKeyedSubscript:v17];
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v18 = [(MapsAppTest *)self serialSubTests];
  if ([v18 count]
    && (currentSubTestIndex = (char *)self->_currentSubTestIndex,
        currentSubTestIndex < (char *)[v18 count] - 1))
  {
    ++self->_currentSubTestIndex;
    -[MapsAppTest runSerialSubTestAtIndex:](self, "runSerialSubTestAtIndex:");
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)finishedTest
{
}

- (void)finishedTestWithExtraResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  CFStringRef v14 = @"tilegroup";
  int v6 = +[GEOResourceManifestManager modernManager];
  id v7 = [v6 activeTileGroup];
  id v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 identifier]);
  id v15 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [(NSMutableDictionary *)results addEntriesFromDictionary:v9];

  if (v4) {
    [(NSMutableDictionary *)self->_results addEntriesFromDictionary:v4];
  }
  [(MapsAppTesting *)self->_app finishedTest:self->_testName extraResults:self->_results];
  id v10 = sub_1005765DC();
  if (os_signpost_enabled(v10))
  {
    testName = self->_testName;
    int v12 = 138412290;
    id v13 = testName;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@ status=success", (uint8_t *)&v12, 0xCu);
  }
}

- (void)failedTest
{
  [(MapsAppTesting *)self->_app failedTest:self->_testName];
  id v3 = sub_1005765DC();
  if (os_signpost_enabled(v3))
  {
    testName = self->_testName;
    int v5 = 138412290;
    int v6 = testName;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@ status=failed", (uint8_t *)&v5, 0xCu);
  }
}

- (void)failedTestWithReason:(id)a3
{
  id v4 = a3;
  [(MapsAppTesting *)self->_app failedTest:self->_testName withFailure:v4];
  int v5 = sub_1005765DC();
  if (os_signpost_enabled(v5))
  {
    testName = self->_testName;
    int v7 = 138412546;
    id v8 = testName;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@ status=failed reason=%@", (uint8_t *)&v7, 0x16u);
  }
}

- (NSArray)serialSubTests
{
  v2 = [(MapsAppTest *)self options];
  id v3 = [v2 _mapstest_serialSubTests];

  return (NSArray *)v3;
}

- (void)runSerialSubTestAtIndex:(unint64_t)a3
{
  id v15 = [(MapsAppTest *)self serialSubTests];
  BOOL v5 = (unint64_t)[v15 count] > a3;
  int v6 = v15;
  if (v5)
  {
    int v7 = [v15 objectAtIndexedSubscript:a3];
    id v8 = [v7 objectForKeyedSubscript:@"selector"];
    SEL v9 = NSSelectorFromString(v8);

    if (objc_opt_respondsToSelector())
    {
      id v10 = [v7 objectForKeyedSubscript:@"options"];
      id v11 = [v10 objectForKeyedSubscript:@"subTestName"];

      if (!v11)
      {
        id v11 = [v7 objectForKeyedSubscript:@"selector"];
      }
      if ([v11 hasSuffix:@":"])
      {
        uint64_t v12 = [v11 substringToIndex:[v11 length] - 1];

        id v11 = (void *)v12;
      }
      id v13 = [(MapsAppTest *)self mainVKMapView];
      self->_currentSubTestStartTime = CACurrentMediaTime();
      [(MapsAppTest *)self startedSerialSubTest:v11];
      [v13 enableTestStatistics];
      CFStringRef v14 = [v7 objectForKeyedSubscript:@"options"];
      [(MapsAppTest *)self performSelector:v9 withObject:v14];
    }
    int v6 = v15;
  }
}

- (void)onFullyDrawn:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 object];
  if (!v5)
  {
    BOOL v5 = [(MapsAppTest *)self mainVKMapView];
  }
  unsigned int v6 = [v5 isFullyDrawn];
  int v7 = sub_1005765DC();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "onFullyDrawn:", (uint8_t *)&v9, 2u);
    }

    [(MapsAppTest *)self vkMapViewFullyDrawn:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 1024;
      unsigned int v12 = [v5 isFullyDrawn];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "onFullyDrawn is called when mapView is not fully drawn. Notification: %@, [mapView isFullyDrawn] : %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)vkMapViewFullyDrawn:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  if (!v5)
  {
    id v3 = [(MapsAppTest *)self mainVKMapView];
    if ([v3 isFullyDrawn])
    {

LABEL_10:
      id v10 = +[NSNotificationCenter defaultCenter];
      [v10 removeObserver:self name:VKMapViewDidBecomeFullyDrawnNotification object:0];

      if ([(NSMutableArray *)self->_fullyDrawnCallbacks count])
      {
        *(void *)&long long v11 = 138412290;
        long long v15 = v11;
        do
        {
          unsigned int v12 = [(NSMutableArray *)self->_fullyDrawnCallbacks firstObject];
          [(NSMutableArray *)self->_fullyDrawnCallbacks removeObjectAtIndex:0];
          id v13 = sub_1005765DC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            CFStringRef v14 = objc_retainBlock(v12);
            *(_DWORD *)buf = v15;
            id v17 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Invoking callback: %@", buf, 0xCu);
          }
          v12[2](v12);
        }
        while ([(NSMutableArray *)self->_fullyDrawnCallbacks count]);
      }
      goto LABEL_15;
    }
  }
  unsigned int v6 = [(MapsAppTest *)self mainVKMapView];

  if (!v5) {
  if (v6 == v5)
  }
    goto LABEL_10;
  int v7 = sub_1005765DC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(MapsAppTest *)self mainVKMapView];
    int v9 = [(MapsAppTest *)self mainVKMapView];
    *(_DWORD *)buf = 138412802;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 1024;
    unsigned int v21 = [v9 isFullyDrawn];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "vkMapViewFullyDrawn: but not calling back! mapView: %@ mainVKMapView: %@ isFullyDrawn: %d", buf, 0x1Cu);
  }
LABEL_15:
}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1005765DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding FullyDrawnCallback: %@", buf, 0xCu);
  }
  fullyDrawnCallbacks = self->_fullyDrawnCallbacks;
  id v8 = [v4 copy];
  id v9 = objc_retainBlock(v8);
  [(NSMutableArray *)fullyDrawnCallbacks addObject:v9];

  dispatch_time_t v10 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A59A54;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setupFullyDrawnNotification:(SEL)a3
{
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:a3 name:VKMapViewDidBecomeFullyDrawnNotification object:0];
}

- (void)setupForVKTestWithMapView:(id)a3
{
  id v4 = a3;
  [(MapsAppTest *)self willSetupForVKTest];
  id v5 = [(MapsAppTest *)self options];
  long long v10 = 0uLL;
  [v5 _mapstest_getSelectedFeatures:&v10 disabled:(char *)&v10 + 8];
  unint64_t v6 = *((void *)&v10 + 1);
  if (v10 != 0)
  {
    if ((void)v10)
    {
      unint64_t v6 = ~(void)v10;
      *((void *)&v10 + 1) = ~(void)v10;
    }
    if (((v6 | v10) & 0x80) != 0)
    {
      [v4 setTrafficEnabled:(v6 & 0x80) == 0];
      unint64_t v6 = *((void *)&v10 + 1);
    }
    [v4 setDisablePolygons:(v6 >> 3) & 1];
    [v4 setDisableRoads:(*((void *)&v10 + 1) >> 1) & 1];
    [v4 setDisableLabels:(*((void *)&v10 + 1) >> 2) & 1];
    [v4 setDisableBuildingFootprints:(*((void *)&v10 + 1) >> 4) & 1];
    [v4 setDisableRasters:(*((void *)&v10 + 1) >> 5) & 1];
    [v4 setDisableGrid:(*((void *)&v10 + 1) >> 6) & 1];
    [v4 setDisableTransitLines:(*((void *)&v10 + 1) >> 8) & 1];
  }
  if (objc_msgSend(v5, "_mapstest_hasMapType")) {
    [v5 _mapstest_hasViewMode];
  }
  if (objc_msgSend(v5, "_mapstest_hasViewMode")) {
    [self switchToViewMode:[v5 _mapstest_viewMode]];
  }
  else {
    [self switchToMapType:[v5 _mapstest_mapType]];
  }
  int v7 = [v5 objectForKeyedSubscript:@"selectedFeatureId"];
  if (v7)
  {
    id v8 = +[NSScanner scannerWithString:v7];
    uint64_t v9 = 0;
    [v8 scanUnsignedLongLong:&v9];
    [v4 setSelectedFeatureId:v9];
  }
  else
  {
    [v4 deselectFeatureId];
  }
}

- (void)setupForVKTest
{
  id v3 = [(MapsAppTest *)self mainVKMapView];
  [(MapsAppTest *)self setupForVKTestWithMapView:v3];
}

- (void)registerGEOManifestSubtests
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"willBeginGEOPPTTest_Manifest:" name:@"GEOPPTTest_ManifestBEGIN" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didEndGEOPPTTest_Manifest:" name:@"GEOPPTTest_ManifestEND" object:0];

  id v5 = +[GEONotificationPreferenceManager sharedManager];
  [v5 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest"];

  unint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"willBeginGEOPPTTest_Manifest_SetupConnection:" name:@"GEOPPTTest_Manifest_SetupConnectionBEGIN" object:0];

  int v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"didEndGEOPPTTest_Manifest_SetupConnection:" name:@"GEOPPTTest_Manifest_SetupConnectionEND" object:0];

  id v8 = +[GEONotificationPreferenceManager sharedManager];
  [v8 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_SetupConnection"];

  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"willBeginGEOPPTTest_Manifest_Update:" name:@"GEOPPTTest_Manifest_UpdateBEGIN" object:0];

  long long v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"didEndGEOPPTTest_Manifest_Update:" name:@"GEOPPTTest_Manifest_UpdateEND" object:0];

  long long v11 = +[GEONotificationPreferenceManager sharedManager];
  [v11 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_Update"];

  unsigned int v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"willBeginGEOPPTTest_Manifest_ForcedUpdate:" name:@"GEOPPTTest_Manifest_ForcedUpdateBEGIN" object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"didEndGEOPPTTest_Manifest_ForcedUpdate:" name:@"GEOPPTTest_Manifest_ForcedUpdateEND" object:0];

  CFStringRef v14 = +[GEONotificationPreferenceManager sharedManager];
  [v14 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_ForcedUpdate"];

  long long v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"willBeginGEOPPTTest_Manifest_GetResourceManifest:" name:@"GEOPPTTest_Manifest_GetResourceManifestBEGIN" object:0];

  id v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"didEndGEOPPTTest_Manifest_GetResourceManifest:" name:@"GEOPPTTest_Manifest_GetResourceManifestEND" object:0];

  id v17 = +[GEONotificationPreferenceManager sharedManager];
  [v17 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_GetResourceManifest"];

  __int16 v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"willBeginGEOPPTTest_Manifest_SetManifestToken:" name:@"GEOPPTTest_Manifest_SetManifestTokenBEGIN" object:0];

  id v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:self selector:"didEndGEOPPTTest_Manifest_SetManifestToken:" name:@"GEOPPTTest_Manifest_SetManifestTokenEND" object:0];

  __int16 v20 = +[GEONotificationPreferenceManager sharedManager];
  [v20 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_SetManifestToken"];

  unsigned int v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"willBeginGEOPPTTest_Manifest_SetActiveTileGroup:" name:@"GEOPPTTest_Manifest_SetActiveTileGroupBEGIN" object:0];

  long long v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"didEndGEOPPTTest_Manifest_SetActiveTileGroup:" name:@"GEOPPTTest_Manifest_SetActiveTileGroupEND" object:0];

  long long v23 = +[GEONotificationPreferenceManager sharedManager];
  [v23 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_SetActiveTileGroup"];

  long long v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"willBeginGEOPPTTest_Manifest_ResetActiveTileGroup:" name:@"GEOPPTTest_Manifest_ResetActiveTileGroupBEGIN" object:0];

  id v25 = +[NSNotificationCenter defaultCenter];
  [v25 addObserver:self selector:"didEndGEOPPTTest_Manifest_ResetActiveTileGroup:" name:@"GEOPPTTest_Manifest_ResetActiveTileGroupEND" object:0];

  BOOL v26 = +[GEONotificationPreferenceManager sharedManager];
  [v26 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_ResetActiveTileGroup"];

  id v27 = +[NSNotificationCenter defaultCenter];
  [v27 addObserver:self selector:"willBeginGEOPPTTest_Manifest_HandleMessage:" name:@"GEOPPTTest_Manifest_HandleMessageBEGIN" object:0];

  v28 = +[NSNotificationCenter defaultCenter];
  [v28 addObserver:self selector:"didEndGEOPPTTest_Manifest_HandleMessage:" name:@"GEOPPTTest_Manifest_HandleMessageEND" object:0];

  id v29 = +[GEONotificationPreferenceManager sharedManager];
  [v29 setEnabled:1 forSubTestWithName:@"GEOPPTTest_Manifest_HandleMessage"];
}

- (void)willBeginGEOPPTTest_Manifest:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A2B4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A340;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_SetupConnection:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A3C4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_SetupConnection:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A450;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_Update:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A4D4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_Update:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A560;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_ForcedUpdate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A5E4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_ForcedUpdate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A670;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_GetResourceManifest:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A6F4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_GetResourceManifest:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A780;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_SetManifestToken:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A804;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_SetManifestToken:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A890;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_SetActiveTileGroup:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A914;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_SetActiveTileGroup:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5A9A0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_ResetActiveTileGroup:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5AA24;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_ResetActiveTileGroup:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5AAB0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_HandleMessage:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5AB34;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_HandleMessage:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A5ABC0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSString)testName
{
  return self->_testName;
}

- (NSDictionary)options
{
  return self->_options;
}

- (MapsAppTesting)app
{
  return self->_app;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (unint64_t)currentSubTestIndex
{
  return self->_currentSubTestIndex;
}

- (double)currentSubTestStartTime
{
  return self->_currentSubTestStartTime;
}

- (NSMutableArray)fullyDrawnCallbacks
{
  return self->_fullyDrawnCallbacks;
}

- (void)setFullyDrawnCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyDrawnCallbacks, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_testName, 0);
}

@end