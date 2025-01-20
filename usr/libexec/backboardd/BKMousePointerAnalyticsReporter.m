@interface BKMousePointerAnalyticsReporter
- (BKMousePointerAnalyticsReporter)init;
- (BKMousePointerController)mousePointerController;
- (void)availableDevicesDidChange;
- (void)evaluatePeriodicReportingTrigger;
- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3;
- (void)setMousePointerController:(id)a3;
@end

@implementation BKMousePointerAnalyticsReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mousePointerController, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);

  objc_storeStrong((id *)&self->_analyticsReportingQueue, 0);
}

- (BKMousePointerController)mousePointerController
{
  return self->_mousePointerController;
}

- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3
{
  id v4 = a3;
  analyticsReportingQueue = self->_analyticsReportingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026CF4;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsReportingQueue, v7);
}

- (void)availableDevicesDidChange
{
  v3 = [(BKMousePointerController *)self->_mousePointerController globalDevicePreferences];
  analyticsReportingQueue = self->_analyticsReportingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027BB4;
  v6[3] = &unk_1000F8E50;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(analyticsReportingQueue, v6);
}

- (void)evaluatePeriodicReportingTrigger
{
  BSContinuousMachTimeNow();
  if (v3 - self->_lastReportedPeriodicTriggerTime > 86400.0)
  {
    id v4 = [(BKMousePointerController *)self->_mousePointerController globalDevicePreferences];
    id v5 = v4;
    if (v4)
    {
      analyticsReportingQueue = self->_analyticsReportingQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100027C94;
      v8[3] = &unk_1000F8E50;
      v8[4] = self;
      id v9 = v4;
      dispatch_async(analyticsReportingQueue, v8);
      BSContinuousMachTimeNow();
      self->_lastReportedPeriodicTriggerTime = v7;
    }
  }
}

- (void)setMousePointerController:(id)a3
{
  id v5 = (BKMousePointerController *)a3;
  mousePointerController = self->_mousePointerController;
  id v8 = v5;
  if (mousePointerController != v5)
  {
    [(BKMousePointerController *)mousePointerController removeGlobalDevicePreferencesObserver:self];
    objc_storeStrong((id *)&self->_mousePointerController, a3);
    double v7 = self->_mousePointerController;
    if (v7) {
      [(BKMousePointerController *)v7 addGlobalDevicePreferencesObserver:self];
    }
  }
}

- (BKMousePointerAnalyticsReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)BKMousePointerAnalyticsReporter;
  v2 = [(BKMousePointerAnalyticsReporter *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    gregorianCalendar = v2->_gregorianCalendar;
    v2->_gregorianCalendar = (NSCalendar *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("BKMousePointerAnalyticsReporter Core Analytics Queue", 0);
    analyticsReportingQueue = v2->_analyticsReportingQueue;
    v2->_analyticsReportingQueue = (OS_dispatch_queue *)v5;

    BSContinuousMachTimeNow();
    v2->_lastReportedPeriodicTriggerTime = v7;
  }
  return v2;
}

@end