@interface MapsAppTestScrollRecents
- (void)_performScrollTest;
- (void)_setupTrayLayoutAndPerformScrollTest;
- (void)_startRecentsTest;
@end

@implementation MapsAppTestScrollRecents

- (void)_startRecentsTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestOpenRecents];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004902C8;
  v4[3] = &unk_1012E6668;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTMyRecentsViewControllerDidAppearNotification" object:0 usingBlock:v4];
}

- (void)_setupTrayLayoutAndPerformScrollTest
{
  if ([(MapsAppTest *)self canUpdateTrayLayout])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100490414;
    v3[3] = &unk_1012E5D08;
    v3[4] = self;
    [(MapsAppTest *)self updateTrayLayout:2 animated:1 completion:v3];
  }
  else
  {
    [(MapsAppTestScrollRecents *)self _performScrollTest];
  }
}

- (void)_performScrollTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  id v5 = [v3 pptTestScrollView];

  v4 = [(MapsAppTest *)self testName];
  [v5 _performScrollTest:v4 iterations:10 delta:20];
}

@end