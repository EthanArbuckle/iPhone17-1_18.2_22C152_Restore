@interface MapsAppTestAR
+ (id)pptRecordingFileLocation;
- (BOOL)isWaitingForTileAvailability;
- (BOOL)runTest;
- (MapsAppTestAR)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (PedestrianARSessionTask)task;
- (PedestrianARSessionTileAvailabilityMonitor)tileAvailabilityMonitor;
- (void)_dismissARUI;
- (void)_displayARElement;
- (void)_runARLocalization;
- (void)_showARUI;
- (void)_waitForTileAvailability;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setTask:(id)a3;
- (void)setTileAvailabilityMonitor:(id)a3;
- (void)setWaitingForTileAvailability:(BOOL)a3;
@end

@implementation MapsAppTestAR

- (MapsAppTestAR)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  v23.receiver = self;
  v23.super_class = (Class)MapsAppTestAR;
  v5 = [(MapsAppTest *)&v23 initWithApplication:a3 testName:a4 options:a5];
  if (v5)
  {
    v6 = +[UIApplication _maps_keyMapsSceneDelegate];
    v7 = [v6 platformController];
    v8 = [v7 auxiliaryTasksManager];
    v9 = [v8 auxilaryTaskForClass:objc_opt_class()];
    objc_storeWeak((id *)&v5->_task, v9);

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_task);
    v11 = [WeakRetained stateManager];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [v11 monitors];
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeWeak((id *)&v5->_tileAvailabilityMonitor, v17);
            goto LABEL_12;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (void)dealloc
{
  if (self->_waitingForTileAvailability)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tileAvailabilityMonitor);
    [WeakRetained removeObserver:self forKeyPath:@"state"];
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestAR;
  [(MapsAppTestAR *)&v4 dealloc];
}

+ (id)pptRecordingFileLocation
{
  if (qword_10160FC08 != -1) {
    dispatch_once(&qword_10160FC08, &stru_1012FE7D0);
  }
  v2 = (void *)qword_10160FC00;

  return v2;
}

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  objc_super v4 = [(MapsAppTest *)self options];
  v5 = [v4 _mapstest_directionsPlan];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_waitForTileAvailability" name:@"MapsRoutePlanningShowingRoutesNotification" object:0];

  v7 = [(MapsAppTest *)self testCoordinator];
  [v7 setPPTTestDirectionsPlan:v5];

  return 1;
}

- (void)_waitForTileAvailability
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"MapsRoutePlanningShowingRoutesNotification" object:0];

  [(MapsAppTest *)self startedTest];
  [(MapsAppTest *)self startedSubTest:@"tileAvailability"];
  objc_super v4 = [(MapsAppTestAR *)self tileAvailabilityMonitor];
  v5 = [v4 tileObserver];
  unsigned int v6 = [v5 areTilesAvailable];

  if (v6)
  {
    [(MapsAppTest *)self finishedSubTest:@"tileAvailability"];
    [(MapsAppTestAR *)self _showARUI];
  }
  else
  {
    [(MapsAppTestAR *)self setWaitingForTileAvailability:1];
    id v7 = [(MapsAppTestAR *)self tileAvailabilityMonitor];
    [v7 addObserver:self forKeyPath:@"state" options:1 context:0];
  }
}

- (void)_showARUI
{
  [(MapsAppTest *)self startedSubTest:@"showARUI"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100886E30;
  v10[3] = &unk_1012E6668;
  v10[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"PedestrianARViewControllerDidAppearNotification" object:0 usingBlock:v10];
  v3 = +[NSFileManager defaultManager];
  objc_super v4 = [(id)objc_opt_class() pptRecordingFileLocation];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  unsigned int v6 = [(id)objc_opt_class() pptRecordingFileLocation];
  if (v5)
  {
    GEOConfigSetString();

    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setInteger:1 forKey:@"MapsARSessionPlaybackModeKey"];

    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setBool:0 forKey:@"MapsARSessionRecordingEnabledKey"];

    unsigned int v6 = [(MapsAppTest *)self testCoordinator];
    [v6 pptTestEnterAR];
  }
  else
  {
    v9 = +[NSString stringWithFormat:@"PPT recording file is not present at expected location: %@", v6];
    [(MapsAppTest *)self failedTestWithReason:v9];
  }
}

- (void)_runARLocalization
{
  [(MapsAppTest *)self startedSubTest:@"runARLocalization"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100886F0C;
  v3[3] = &unk_1012E6668;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"VLFSessionDidStopNotification" object:0 usingBlock:v3];
}

- (void)_displayARElement
{
  [(MapsAppTest *)self startedSubTest:@"displayARElement"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100887024;
  v3[3] = &unk_1012E6668;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"PedestrianARViewControllerARFeatureDidAppearNotification" object:0 usingBlock:v3];
}

- (void)_dismissARUI
{
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100887160;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008871C0;
  v4[3] = &unk_1012E6668;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"PedestrianARViewControllerDidDisappearNotification" object:0 usingBlock:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(MapsAppTestAR *)self tileAvailabilityMonitor];
  if (v13 != v11)
  {

LABEL_6:
    v19.receiver = self;
    v19.super_class = (Class)MapsAppTestAR;
    [(MapsAppTestAR *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_7;
  }
  unsigned int v14 = [v10 isEqualToString:@"tileObserver"];

  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = [(MapsAppTestAR *)self tileAvailabilityMonitor];
  v16 = [v15 tileObserver];
  unsigned int v17 = [v16 areTilesAvailable];

  if (v17)
  {
    v18 = [(MapsAppTestAR *)self tileAvailabilityMonitor];
    [v18 removeObserver:self forKeyPath:@"tileObserver"];

    [(MapsAppTestAR *)self setWaitingForTileAvailability:0];
    [(MapsAppTest *)self finishedSubTest:@"tileAvailability"];
    [(MapsAppTestAR *)self _showARUI];
  }
LABEL_7:
}

- (PedestrianARSessionTask)task
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);

  return (PedestrianARSessionTask *)WeakRetained;
}

- (void)setTask:(id)a3
{
}

- (PedestrianARSessionTileAvailabilityMonitor)tileAvailabilityMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileAvailabilityMonitor);

  return (PedestrianARSessionTileAvailabilityMonitor *)WeakRetained;
}

- (void)setTileAvailabilityMonitor:(id)a3
{
}

- (BOOL)isWaitingForTileAvailability
{
  return self->_waitingForTileAvailability;
}

- (void)setWaitingForTileAvailability:(BOOL)a3
{
  self->_waitingForTileAvailability = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tileAvailabilityMonitor);

  objc_destroyWeak((id *)&self->_task);
}

@end