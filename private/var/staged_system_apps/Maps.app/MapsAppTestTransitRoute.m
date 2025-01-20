@interface MapsAppTestTransitRoute
- (void)_performRouteUpdateWithDetails;
- (void)_performRouteUpdateWithList;
- (void)doAfterSubTestForDisplayingRoutes;
@end

@implementation MapsAppTestTransitRoute

- (void)doAfterSubTestForDisplayingRoutes
{
  v3 = [(MapsAppTest *)self options];
  v4 = [v3 objectForKeyedSubscript:@"realtime"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    [(MapsAppTestTransitRoute *)self _performRouteUpdateWithList];
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)_performRouteUpdateWithList
{
  [(MapsAppTest *)self startedTest];
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestPauseRealtimeTransitUpdates];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100379FB8;
  v8[3] = &unk_1012E6668;
  v8[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateWillUpdateRoute" object:0 usingBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100379FC8;
  v7[3] = &unk_1012E6668;
  v7[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateDidUpdateRoute" object:0 usingBlock:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100379FD8;
  v6[3] = &unk_1012E6668;
  v6[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateWillUpdateSummary" object:0 usingBlock:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100379FE8;
  v5[3] = &unk_1012E6668;
  v5[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsTestingTransitRouteUpdateDidUpdateSummary" object:0 usingBlock:v5];
  v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestResumeRealtimeTransitUpdates];
}

- (void)_performRouteUpdateWithDetails
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestPauseRealtimeTransitUpdates];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10037A124;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTest *)self _presentDirectionDetailsWithCompletion:v4];
}

@end