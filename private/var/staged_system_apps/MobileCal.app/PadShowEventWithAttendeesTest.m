@interface PadShowEventWithAttendeesTest
- (BOOL)shouldWaitForAttendeeLoad;
- (id)_getEvent;
- (id)eventDetailsDidShowSubtestName;
- (int64_t)numAttendees;
- (void)_attendeesDidFinishLoading:(id)a3;
- (void)_detailsDidAppear:(id)a3;
- (void)_setupViewToDate:(id)a3;
- (void)runTest;
@end

@implementation PadShowEventWithAttendeesTest

- (int64_t)numAttendees
{
  return 500;
}

- (BOOL)shouldWaitForAttendeeLoad
{
  return [(PadShowEventWithAttendeesTest *)self numAttendees] > 24;
}

- (id)eventDetailsDidShowSubtestName
{
  return @"EventDetailsVisibleAndInteractable";
}

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationTest *)self model];
  [v5 setSelectedDate:v4];

  v6 = [(ApplicationTest *)self application];
  v7 = [v6 rootNavigationController];
  v8 = [v7 resetToMonthView];

  v9 = [v4 date];

  [(MonthViewController *)v8 showDate:v9 animated:0];
  [(PadShowEventTest *)self setController:v8];
  monthViewController = self->_monthViewController;
  self->_monthViewController = v8;
}

- (id)_getEvent
{
  int64_t v3 = [(PadShowEventWithAttendeesTest *)self numAttendees];

  return [(ShowEventDetailsTest *)self createTestEvent:@"Test Event with Attendees" numAttendees:v3];
}

- (void)runTest
{
  int64_t v3 = [(ApplicationTest *)self application];
  id v4 = [(ApplicationTest *)self extractInitialDateOption];
  [(PadShowEventWithAttendeesTest *)self _setupViewToDate:v4];
  dispatch_time_t v5 = dispatch_time(0, 4000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F7DC0;
  v7[3] = &unk_1001D28A8;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_detailsDidAppear:(id)a3
{
  self->_eventDetailsDidAppear = 1;
  unsigned int v4 = [(PadShowEventWithAttendeesTest *)self shouldWaitForAttendeeLoad];
  dispatch_time_t v5 = [(ApplicationTest *)self application];
  if (v4)
  {
    id v6 = [(PadShowEventWithAttendeesTest *)self eventDetailsDidShowSubtestName];
    v7 = [(id)objc_opt_class() testName];
    [v5 finishedSubTest:v6 forTest:v7];
  }
  else
  {
    id v8 = [(id)objc_opt_class() testName];
    [v5 finishedTest:v8 extraResults:0];

    [(ShowEventDetailsTest *)self cleanUp];
  }
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:EKEventViewControllerDidAppearNotification object:0];
}

- (void)_attendeesDidFinishLoading:(id)a3
{
  if (!self->_eventDetailsDidAppear) {
    [(PadShowEventWithAttendeesTest *)self _detailsDidAppear:0];
  }
  unsigned int v4 = [(ApplicationTest *)self application];
  dispatch_time_t v5 = [(id)objc_opt_class() testName];
  [v4 finishedTest:v5 extraResults:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:EKEventDetailsDidFinishLoadingAttendeesNotification object:0];

  [(ShowEventDetailsTest *)self cleanUp];
}

- (void).cxx_destruct
{
}

@end