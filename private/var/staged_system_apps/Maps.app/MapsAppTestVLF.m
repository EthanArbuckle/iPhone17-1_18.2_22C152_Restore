@interface MapsAppTestVLF
+ (id)pptRecordingFileLocation;
- (BOOL)isWaitingForTask;
- (BOOL)isWaitingForTileAvailability;
- (BOOL)runTest;
- (MapsAppTestVLF)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (VLFSessionTask)task;
- (VLFSessionTileAvailabilityMonitor)tileAvailabilityMonitor;
- (void)_dismissVLFUI;
- (void)_runVLF;
- (void)_showVLFUI;
- (void)_start;
- (void)_waitForTileAvailability;
- (void)auxiliaryTasksManagerDidUpdateAuxiliaryTasksNotification:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setTask:(id)a3;
- (void)setTileAvailabilityMonitor:(id)a3;
- (void)setWaitingForTask:(BOOL)a3;
- (void)setWaitingForTileAvailability:(BOOL)a3;
@end

@implementation MapsAppTestVLF

- (MapsAppTestVLF)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MapsAppTestVLF;
  v5 = [(MapsAppTest *)&v12 initWithApplication:a3 testName:a4 options:a5];
  if (v5)
  {
    v6 = +[UIApplication _maps_keyMapsSceneDelegate];
    v7 = [v6 platformController];
    v8 = [v7 auxiliaryTasksManager];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"auxiliaryTasksManagerDidUpdateAuxiliaryTasksNotification:" name:off_1015F8128 object:v8];

    v10 = [v8 auxilaryTaskForClass:objc_opt_class()];
    [(MapsAppTestVLF *)v5 setTask:v10];
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
  v4.super_class = (Class)MapsAppTestVLF;
  [(MapsAppTestVLF *)&v4 dealloc];
}

- (void)setTask:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);

  if (WeakRetained != v4)
  {
    id v6 = objc_storeWeak((id *)&self->_task, v4);

    if (v4)
    {
      v7 = +[NSNotificationCenter defaultCenter];
      [v7 removeObserver:self name:off_1015F8128 object:0];

      id v8 = objc_loadWeakRetained((id *)&self->_task);
      v9 = [v8 stateManager];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = [v9 allMonitors];
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_storeWeak((id *)&self->_tileAvailabilityMonitor, v15);
              goto LABEL_13;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if ([(MapsAppTestVLF *)self isWaitingForTask])
      {
        [(MapsAppTestVLF *)self setWaitingForTask:0];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1006704F4;
        block[3] = &unk_1012E5D08;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

+ (id)pptRecordingFileLocation
{
  if (qword_10160F3E8 != -1) {
    dispatch_once(&qword_10160F3E8, &stru_1012F3A78);
  }
  v2 = (void *)qword_10160F3E0;

  return v2;
}

- (BOOL)runTest
{
  v3 = [(MapsAppTestVLF *)self task];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100670690;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestVLF *)self setWaitingForTask:1];
  }
  return 1;
}

- (void)_start
{
  [(MapsAppTest *)self startedTest];

  [(MapsAppTestVLF *)self _waitForTileAvailability];
}

- (void)_waitForTileAvailability
{
  [(MapsAppTest *)self startedSubTest:@"tileAvailability"];
  v3 = [(MapsAppTestVLF *)self tileAvailabilityMonitor];
  id v4 = [v3 state];

  if (v4 == (id)2)
  {
    [(MapsAppTest *)self finishedSubTest:@"tileAvailability"];
    [(MapsAppTestVLF *)self _showVLFUI];
  }
  else
  {
    [(MapsAppTestVLF *)self setWaitingForTileAvailability:1];
    id v5 = [(MapsAppTestVLF *)self tileAvailabilityMonitor];
    [v5 addObserver:self forKeyPath:@"state" options:1 context:0];
  }
}

- (void)_showVLFUI
{
  [(MapsAppTest *)self startedSubTest:@"showVLFUI"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100670924;
  v8[3] = &unk_1012E6668;
  v8[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:off_1015F7858 object:0 usingBlock:v8];
  v3 = +[NSFileManager defaultManager];
  id v4 = [(id)objc_opt_class() pptRecordingFileLocation];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  id v6 = [(id)objc_opt_class() pptRecordingFileLocation];
  if (v5)
  {
    GEOConfigSetString();

    id v6 = [(MapsAppTestVLF *)self task];
    [v6 showVLFUI];
  }
  else
  {
    v7 = +[NSString stringWithFormat:@"PPT recording file is not present at expected location: %@", v6];
    [(MapsAppTest *)self failedTestWithReason:v7];
  }
}

- (void)_runVLF
{
  [(MapsAppTest *)self startedSubTest:@"runVLF"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100670A00;
  v3[3] = &unk_1012E6668;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"VLFSessionDidStopNotification" object:0 usingBlock:v3];
}

- (void)_dismissVLFUI
{
  [(MapsAppTest *)self startedSubTest:@"dismissVLFUI"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100670B18;
  v3[3] = &unk_1012E6668;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:off_1015F7850 object:0 usingBlock:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(MapsAppTestVLF *)self tileAvailabilityMonitor];
  if (v13 != v11)
  {

LABEL_6:
    v18.receiver = self;
    v18.super_class = (Class)MapsAppTestVLF;
    [(MapsAppTestVLF *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_7;
  }
  unsigned int v14 = [v10 isEqualToString:@"state"];

  if (!v14) {
    goto LABEL_6;
  }
  v15 = [(MapsAppTestVLF *)self tileAvailabilityMonitor];
  id v16 = [v15 state];

  if (v16 == (id)2)
  {
    long long v17 = [(MapsAppTestVLF *)self tileAvailabilityMonitor];
    [v17 removeObserver:self forKeyPath:@"state"];

    [(MapsAppTestVLF *)self setWaitingForTileAvailability:0];
    [(MapsAppTest *)self finishedSubTest:@"tileAvailability"];
    [(MapsAppTestVLF *)self _showVLFUI];
  }
LABEL_7:
}

- (void)auxiliaryTasksManagerDidUpdateAuxiliaryTasksNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 auxilaryTaskForClass:objc_opt_class()];
  [(MapsAppTestVLF *)self setTask:v4];
}

- (VLFSessionTask)task
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);

  return (VLFSessionTask *)WeakRetained;
}

- (VLFSessionTileAvailabilityMonitor)tileAvailabilityMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileAvailabilityMonitor);

  return (VLFSessionTileAvailabilityMonitor *)WeakRetained;
}

- (void)setTileAvailabilityMonitor:(id)a3
{
}

- (BOOL)isWaitingForTask
{
  return self->_waitingForTask;
}

- (void)setWaitingForTask:(BOOL)a3
{
  self->_waitingForTask = a3;
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