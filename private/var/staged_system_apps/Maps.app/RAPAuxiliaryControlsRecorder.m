@interface RAPAuxiliaryControlsRecorder
+ (void)fetchCurrentlyConnectedControlsRecordingOrigin:(int64_t)a3 completion:(id)a4;
+ (void)fetchCurrentlyConnectedControlsWithCompletion:(id)a3;
- (RAPAuxiliaryControlsRecording)copyCurrentPartialRecording;
- (void)_addControlIfNotDuplicate:(id)a3;
- (void)_setOriginatingControlToCurrentActiveWatch;
- (void)_setOriginatingControlToCurrentCarPlayScreen;
- (void)_updateCurrentCarPlayControl;
- (void)_updateWatchControls;
- (void)_updateWatchControlsWithFetchCompletion:(id)a3;
- (void)dealloc;
- (void)setOriginatingDeviceFromOrigin:(int64_t)a3;
- (void)start;
- (void)startWithFetchCompletion:(id)a3;
- (void)stop;
@end

@implementation RAPAuxiliaryControlsRecorder

+ (void)fetchCurrentlyConnectedControlsWithCompletion:(id)a3
{
}

+ (void)fetchCurrentlyConnectedControlsRecordingOrigin:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(RAPAuxiliaryControlsRecorder);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A37E0C;
  v8[3] = &unk_101314EC8;
  id v9 = v5;
  int64_t v10 = a3;
  id v7 = v5;
  [(RAPAuxiliaryControlsRecorder *)v6 startWithFetchCompletion:v8];
}

- (void)startWithFetchCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(_WORD *)&self->_started)
  {
    if (v4) {
      (*((void (**)(id, RAPAuxiliaryControlsRecorder *))v4 + 2))(v4, self);
    }
  }
  else
  {
    self->_started = 1;
    [(RAPAuxiliaryControlsRecorder *)self _updateCurrentCarPlayControl];
    v6 = +[NSNotificationCenter defaultCenter];
    id v7 = +[MapsExternalDevice sharedInstance];
    [v6 addObserver:self selector:"_updateCurrentCarPlayControl" name:@"MapsExternalDeviceUpdated" object:v7];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A37FC4;
    v8[3] = &unk_1012E76E8;
    void v8[4] = self;
    id v9 = v5;
    [(RAPAuxiliaryControlsRecorder *)self _updateWatchControlsWithFetchCompletion:v8];
  }
}

- (void)start
{
}

- (void)stop
{
  if (!self->_stopped)
  {
    self->_stopped = 1;
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"MapsExternalDeviceUpdated" object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];
  }
}

- (void)dealloc
{
  [(RAPAuxiliaryControlsRecorder *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)RAPAuxiliaryControlsRecorder;
  [(RAPAuxiliaryControlsRecorder *)&v3 dealloc];
}

- (void)setOriginatingDeviceFromOrigin:(int64_t)a3
{
  if (a3 == 2)
  {
    [(RAPAuxiliaryControlsRecorder *)self _setOriginatingControlToCurrentActiveWatch];
  }
  else if (a3 == 1)
  {
    [(RAPAuxiliaryControlsRecorder *)self _setOriginatingControlToCurrentCarPlayScreen];
  }
}

- (void)_addControlIfNotDuplicate:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_relevantAuxiliaryControls;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "isSameControlAsControl:", v4, (void)v13))
        {

          goto LABEL_13;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  relevantAuxiliaryControls = self->_relevantAuxiliaryControls;
  if (!relevantAuxiliaryControls)
  {
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v12 = self->_relevantAuxiliaryControls;
    self->_relevantAuxiliaryControls = v11;

    relevantAuxiliaryControls = self->_relevantAuxiliaryControls;
  }
  -[NSMutableArray addObject:](relevantAuxiliaryControls, "addObject:", v4, (void)v13);
LABEL_13:
}

- (void)_updateCurrentCarPlayControl
{
  objc_super v3 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
  id v9 = [v3 carPlayExternalDevice];

  id v4 = v9;
  if (v9)
  {
    id v5 = [RAPAuxiliaryControlCarPlay alloc];
    id v6 = +[MapsExternalDevice sharedInstance];
    id v7 = +[CarDisplayController sharedInstance];
    uint64_t v8 = [(RAPAuxiliaryControlCarPlay *)v5 initWithInformationFromDevice:v9 accessory:v6 displayController:v7];

    if (v8)
    {
      if (![(RAPAuxiliaryControlCarPlay *)self->_currentCarPlayAuxiliaryControl isSameControlAsControl:v8])objc_storeStrong((id *)&self->_currentCarPlayAuxiliaryControl, v8); {
      [(RAPAuxiliaryControlsRecorder *)self _addControlIfNotDuplicate:v8];
      }
    }

    id v4 = v9;
  }
}

- (void)_setOriginatingControlToCurrentCarPlayScreen
{
}

- (void)_updateWatchControls
{
}

- (void)_updateWatchControlsWithFetchCompletion:(id)a3
{
  id v4 = a3;
  ++self->_countOfNanoRegistryFetchesInFlight;
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A38488;
  v7[3] = &unk_101314EF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getDevicesWithBlock:v7];
}

- (void)_setOriginatingControlToCurrentActiveWatch
{
  if (self->_countOfNanoRegistryFetchesInFlight) {
    self->_waitingToSetActiveWatchAsOriginating = 1;
  }
  else {
    objc_storeStrong((id *)&self->_originatingAuxiliaryControl, self->_currentActiveWatchAuxiliaryControl);
  }
}

- (RAPAuxiliaryControlsRecording)copyCurrentPartialRecording
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = self;
  id v4 = self->_relevantAuxiliaryControls;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v23 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int64_t v10 = v9;
        }
        else {
          int64_t v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          id v12 = objc_alloc_init((Class)GEORPAuxiliaryControl);
          long long v13 = [v11 reportAProblemControlMessage];
          [v12 setCar:v13];

          [v3 addObject:v12];
        }
        id v14 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v15 = v14;
        }
        else {
          long long v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          id v17 = objc_alloc_init((Class)GEORPAuxiliaryControl);
          v18 = [v16 reportAProblemControlMessage];
          [v17 setWatch:v18];

          [v3 addObject:v17];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  if (v22->_originatingAuxiliaryControl) {
    uint64_t v19 = (uint64_t)-[NSMutableArray indexOfObject:](v22->_relevantAuxiliaryControls, "indexOfObject:");
  }
  else {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v20 = [[RAPAuxiliaryControlsRecording alloc] initWithControlsGeo:v3 originatingIndex:v19];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActiveWatchAuxiliaryControl, 0);
  objc_storeStrong((id *)&self->_currentCarPlayAuxiliaryControl, 0);
  objc_storeStrong((id *)&self->_originatingAuxiliaryControl, 0);

  objc_storeStrong((id *)&self->_relevantAuxiliaryControls, 0);
}

@end