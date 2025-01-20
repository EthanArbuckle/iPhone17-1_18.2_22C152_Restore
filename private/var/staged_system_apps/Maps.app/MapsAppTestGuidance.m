@interface MapsAppTestGuidance
- (BOOL)_testIsStepping;
- (BOOL)runTest;
- (MapsAppTestGuidance)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (id)_subTestNameForGoingToGuidanceStep:(int64_t)a3 forSwipeCount:(int64_t)a4;
- (int64_t)swipeCount;
- (unint64_t)collapsedTrayLayout;
- (unint64_t)expandedTrayLayout;
- (void)_doAfterSubTestForShowingSign;
- (void)_endGuidanceNavOrSteppingMode;
- (void)_enterGuidanceNavOrSteppingMode;
- (void)_gotoNextStepAfterDelay:(double)a3;
- (void)_guidanceOrSteppingDidShowFirstSign;
- (void)_runPlayWithTraySubtest;
- (void)_steppingSignDidChange;
- (void)cleanup:(BOOL)a3;
- (void)doAfterSubTestForDisplayingRoutes;
- (void)willUpdateNavigationSign;
@end

@implementation MapsAppTestGuidance

- (MapsAppTestGuidance)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MapsAppTestGuidance;
  v9 = [(MapsAppTest *)&v11 initWithApplication:a3 testName:a4 options:v8];
  if (v9) {
    v9->_swipeCount = (int64_t)[v8 _mapstest_guidanceStepSwipeCount];
  }

  return v9;
}

- (void)cleanup:(BOOL)a3
{
  if ([(NSTimer *)self->_guidanceTimer isValid])
  {
    [(NSTimer *)self->_guidanceTimer invalidate];
    guidanceTimer = self->_guidanceTimer;
    self->_guidanceTimer = 0;
  }
}

- (BOOL)runTest
{
  if ([(MapsAppTest *)self isRunningOnCarPlay])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008EC0B4;
    v8[3] = &unk_1012E6668;
    v8[4] = self;
    +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingDidEndGuidanceOrStepping" object:0 usingBlock:v8];
    v7.receiver = self;
    v7.super_class = (Class)MapsAppTestGuidance;
    return [(MapsAppTestRoute *)&v7 runTest];
  }
  else
  {
    [(MapsAppTest *)self setupForVKTest];
    [(MapsAppTestRoute *)self registerGEOSubtestsForRouting];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1008EC0F8;
    v6[3] = &unk_1012E6668;
    v6[4] = self;
    +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingDidEndGuidanceOrStepping" object:0 usingBlock:v6];
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008EC13C;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
    return 1;
  }
}

- (void)doAfterSubTestForDisplayingRoutes
{
}

- (void)_enterGuidanceNavOrSteppingMode
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008EC240;
  v4[3] = &unk_1012E6668;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingMapsRegionUpdatedWithGuidanceStep" object:0 usingBlock:v4];
  [(MapsAppTest *)self startedSubTest:@"guidanceStartToFirstStepShown"];
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestStartNavigation];
}

- (id)_subTestNameForGoingToGuidanceStep:(int64_t)a3 forSwipeCount:(int64_t)a4
{
  if (a4 == a3)
  {
    v6 = @"gotoStep_Last";
  }
  else
  {
    v6 = +[NSString stringWithFormat:@"%@%ld", @"gotoStep_", a3, v4];
  }
  return v6;
}

- (void)_guidanceOrSteppingDidShowFirstSign
{
  v3 = sub_1005765DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _guidanceOrSteppingDidShowFirstSign", (uint8_t *)buf, 2u);
  }

  if ([(MapsAppTestGuidance *)self _testIsStepping])
  {
    uint64_t v4 = [(MapsAppTest *)self testCoordinator];
    if ([v4 pptTestSupportStepping]
      && [v4 pptTestHasNextStep])
    {
      [(MapsAppTestGuidance *)self _gotoNextStepAfterDelay:2.0];
    }
    else
    {
      [(MapsAppTestGuidance *)self _doAfterSubTestForShowingSign];
    }
  }
  else
  {
    [(MapsAppTest *)self startedSubTest:@"guidanceAfterFirstStepShown"];
    uint64_t v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_doAfterSubTestForShowingSign" selector:0 userInfo:0 repeats:3.0];
    guidanceTimer = self->_guidanceTimer;
    self->_guidanceTimer = v5;

    objc_initWeak(buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1008EC4A8;
    v7[3] = &unk_1012E6730;
    objc_copyWeak(&v8, buf);
    +[PPTNotificationCenter addOnceObserverForName:@"MapsPPTGuidanceWillUpdateNotifcation" object:0 usingBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)willUpdateNavigationSign
{
  v3 = sub_1005765DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - willUpdateNavigationSign", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008EC608;
  v4[3] = &unk_1012E6668;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsPPTGuidanceDidUpdateNotifcation" object:0 usingBlock:v4];
  [(MapsAppTest *)self startedSubTest:@"guidanceMakeTurn"];
}

- (void)_gotoNextStepAfterDelay:(double)a3
{
  uint64_t v5 = sub_1005765DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _gotoNextStep", buf, 2u);
  }

  v6 = [(MapsAppTest *)self testCoordinator];
  id v7 = [v6 pptTestCurrentStepIndex];
  if ([v6 pptTestHasNextStep])
  {
    if ((uint64_t)v7 >= [(MapsAppTestGuidance *)self swipeCount])
    {
      [(MapsAppTest *)self failedTest];
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1008EC804;
      v12[3] = &unk_1012E6668;
      v12[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingSteppingSignDidChange" object:0 usingBlock:v12];
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1008EC80C;
      v9[3] = &unk_1012EA9E0;
      id v11 = v7;
      v9[4] = self;
      id v10 = v6;
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
    }
  }
  else
  {
    [(MapsAppTestGuidance *)self _doAfterSubTestForShowingSign];
  }
}

- (void)_steppingSignDidChange
{
  v3 = sub_1005765DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _steppingSignDidChange", (uint8_t *)buf, 2u);
  }

  uint64_t v4 = [(MapsAppTest *)self testCoordinator];
  id v5 = [v4 pptTestCurrentStepIndex];

  v6 = [(MapsAppTestGuidance *)self swipeCount];
  id v7 = [(MapsAppTestGuidance *)self _subTestNameForGoingToGuidanceStep:v5 forSwipeCount:v6];
  objc_initWeak(buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008ECA00;
  v9[3] = &unk_1012FFF38;
  objc_copyWeak(v11, buf);
  id v8 = v7;
  id v10 = v8;
  v11[1] = v6;
  v11[2] = v5;
  [(MapsAppTest *)self addFullyDrawnCallback:v9];

  objc_destroyWeak(v11);
  objc_destroyWeak(buf);
}

- (void)_doAfterSubTestForShowingSign
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008ECBB4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_endGuidanceNavOrSteppingMode
{
  dispatch_time_t v3 = sub_1005765DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _endGuidanceNavOrSteppingMode", v5, 2u);
  }

  [(MapsAppTest *)self finishedSubTest:@"guidanceAfterFirstStepShown"];
  [(MapsAppTest *)self startedSubTest:@"guidanceEnd"];
  uint64_t v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestEndNavigation];
}

- (unint64_t)expandedTrayLayout
{
  return 1;
}

- (unint64_t)collapsedTrayLayout
{
  return 0;
}

- (void)_runPlayWithTraySubtest
{
  dispatch_time_t v3 = sub_1005765DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _runPlayWithTraySubtest", buf, 2u);
  }

  if ([(MapsAppTest *)self canUpdateTrayLayout])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1008ECD60;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    [(MapsAppTest *)self updateTrayLayout:[(MapsAppTestGuidance *)self expandedTrayLayout] withSubtestName:@"NavigationExpandTray" animated:1 completion:v4];
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (BOOL)_testIsStepping
{
  dispatch_time_t v3 = [(MapsAppTest *)self testName];
  if ([v3 hasPrefix:@"guidanceStepping"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(MapsAppTest *)self testName];
    unsigned __int8 v4 = [v5 hasSuffix:@"transit"];
  }
  return v4;
}

- (int64_t)swipeCount
{
  return self->_swipeCount;
}

- (void).cxx_destruct
{
}

@end