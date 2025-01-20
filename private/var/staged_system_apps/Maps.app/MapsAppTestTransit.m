@interface MapsAppTestTransit
- (unint64_t)collapsedTrayLayout;
- (unint64_t)expandedTrayLayout;
- (void)_doAfterSubTestForShowingSign;
- (void)_handleSuperDoAfterSubTestForShowingSign;
- (void)_performRTTest;
@end

@implementation MapsAppTestTransit

- (void)_doAfterSubTestForShowingSign
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10065EF2C;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_performRTTest
{
  v3 = sub_1005765DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MapsAppTestTransit - _performRTTest", (uint8_t *)buf, 2u);
  }

  id v4 = [(MapsAppTest *)self testCoordinator];
  unsigned __int8 v5 = [v4 pptTestMoveToBoardStep];

  if (v5)
  {
    v6 = [(MapsAppTest *)self testCoordinator];
    [v6 pptTestPauseRealtimeTransitUpdates];

    objc_initWeak(buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10065F390;
    v20[3] = &unk_1012E6730;
    objc_copyWeak(&v21, buf);
    +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateWillUpdateRoute" object:0 usingBlock:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10065F3EC;
    v18[3] = &unk_1012E6730;
    objc_copyWeak(&v19, buf);
    +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateDidUpdateRoute" object:0 usingBlock:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10065F448;
    v16[3] = &unk_1012E6730;
    objc_copyWeak(&v17, buf);
    +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateWillUpdateDetails" object:0 usingBlock:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10065F4A4;
    v14[3] = &unk_1012E6730;
    objc_copyWeak(&v15, buf);
    +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateDidUpdateDetails" object:0 usingBlock:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10065F538;
    v12[3] = &unk_1012E73C8;
    objc_copyWeak(&v13, buf);
    v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v12 block:5.0];
    updateTimeout = self->_updateTimeout;
    self->_updateTimeout = v7;

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10065F578;
    v10[3] = &unk_1012E6708;
    objc_copyWeak(&v11, buf);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)MapsAppTestTransit;
    [(MapsAppTestGuidance *)&v23 _doAfterSubTestForShowingSign];
  }
}

- (void)_handleSuperDoAfterSubTestForShowingSign
{
  v2.receiver = self;
  v2.super_class = (Class)MapsAppTestTransit;
  [(MapsAppTestGuidance *)&v2 _doAfterSubTestForShowingSign];
}

- (unint64_t)expandedTrayLayout
{
  return 2;
}

- (unint64_t)collapsedTrayLayout
{
  return 1;
}

- (void).cxx_destruct
{
}

@end