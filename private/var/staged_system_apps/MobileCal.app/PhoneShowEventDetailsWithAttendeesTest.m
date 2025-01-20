@interface PhoneShowEventDetailsWithAttendeesTest
- (BOOL)shouldWaitForAttendeeLoading;
- (id)eventDetailsDidShowSubtestName;
- (int64_t)numAttendees;
- (void)_attendeesDidFinishLoading:(id)a3;
- (void)_detailViewControllerAppeared:(id)a3;
- (void)runTest;
@end

@implementation PhoneShowEventDetailsWithAttendeesTest

- (id)eventDetailsDidShowSubtestName
{
  return @"EventDetailsVisibleAndInteractable";
}

- (int64_t)numAttendees
{
  return 500;
}

- (BOOL)shouldWaitForAttendeeLoading
{
  return [(PhoneShowEventDetailsWithAttendeesTest *)self numAttendees] > 24;
}

- (void)runTest
{
  v3 = [(id)objc_opt_class() testName];
  v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];
  id v6 = [v5 resetToDayView];

  v7 = [(ShowEventDetailsTest *)self createTestEvent:@"Test Event with Attendees" numAttendees:[(PhoneShowEventDetailsWithAttendeesTest *)self numAttendees]];
  v8 = v7;
  if (v7)
  {
    if (![v7 isNew])
    {
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100043530;
      block[3] = &unk_1001D2EE0;
      block[4] = self;
      id v16 = v3;
      id v17 = v8;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_7;
    }
    v9 = [(ApplicationTest *)self application];
    [v9 startedTest:v3];

    v10 = [(ApplicationTest *)self application];
    CFStringRef v11 = @"Failed to save event";
  }
  else
  {
    v12 = [(ApplicationTest *)self application];
    [v12 startedTest:v3];

    v10 = [(ApplicationTest *)self application];
    CFStringRef v11 = @"Failed to create event";
  }
  v13 = +[NSString stringWithFormat:v11];
  [v10 failedTest:v3 withFailure:v13];

LABEL_7:
}

- (void)_detailViewControllerAppeared:(id)a3
{
  self->_eventDetailsDidAppear = 1;
  id v9 = [(id)objc_opt_class() testName];
  unsigned int v4 = [(PhoneShowEventDetailsWithAttendeesTest *)self shouldWaitForAttendeeLoading];
  v5 = [(ApplicationTest *)self application];
  id v6 = v5;
  if (v4)
  {
    v7 = [(PhoneShowEventDetailsWithAttendeesTest *)self eventDetailsDidShowSubtestName];
    [v6 finishedSubTest:v7 forTest:v9];
  }
  else
  {
    [v5 finishedTest:v9 extraResults:0];

    [(ShowEventDetailsTest *)self cleanUp];
  }
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:EKEventViewControllerDidAppearNotification object:0];
}

- (void)_attendeesDidFinishLoading:(id)a3
{
  if (!self->_eventDetailsDidAppear) {
    [(PhoneShowEventDetailsWithAttendeesTest *)self _detailViewControllerAppeared:0];
  }
  id v6 = [(id)objc_opt_class() testName];
  unsigned int v4 = [(ApplicationTest *)self application];
  [v4 finishedTest:v6 extraResults:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:EKEventDetailsDidFinishLoadingAttendeesNotification object:0];

  [(ShowEventDetailsTest *)self cleanUp];
}

@end