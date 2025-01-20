@interface SPSoundSensor
+ (id)sharedSoundSensorModule;
- (BOOL)subscribeToNoiseLevelForClient:(id)a3 callback:(id)a4;
- (BOOL)subscribeToSoundForClient:(id)a3 soundType:(unsigned int)a4 callback:(id)a5;
- (BOOL)unsubscribeFromNoiseLevel:(id)a3;
- (BOOL)unsubscribeFromSound:(id)a3;
- (SPSoundSensor)init;
- (unsigned)currentNoiseLevel;
- (unsigned)getCurrentSoundSensorState:(unsigned int)a3;
- (void)_activate;
- (void)_invalidate;
- (void)activate;
- (void)invalidate;
- (void)setNoiseLevel:(float)a3;
- (void)setSoundProbability:(unsigned int)a3 value:(float)a4;
@end

@implementation SPSoundSensor

+ (id)sharedSoundSensorModule
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005690;
  block[3] = &unk_100014660;
  block[4] = a1;
  if (qword_10001A530 != -1) {
    dispatch_once(&qword_10001A530, block);
  }
  v2 = (void *)qword_10001A528;

  return v2;
}

- (SPSoundSensor)init
{
  v15.receiver = self;
  v15.super_class = (Class)SPSoundSensor;
  v2 = [(SPSoundSensor *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SPSoundSensor", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    soundSubscribers = v2->_soundSubscribers;
    v2->_soundSubscribers = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    noiseLevelSubscribers = v2->_noiseLevelSubscribers;
    v2->_noiseLevelSubscribers = v8;

    v2->_currentSoundState[2] = 0;
    *(void *)v2->_currentSoundState = 0;
    v16[0] = &off_100014EA0;
    v16[1] = &off_100014EB8;
    v17[0] = &off_100014EE8;
    v17[1] = &off_100014EE8;
    v16[2] = &off_100014ED0;
    v17[2] = &off_100014EE8;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    soundTypeToThreshold = v2->_soundTypeToThreshold;
    v2->_soundTypeToThreshold = (NSDictionary *)v10;

    v2->_currentNoiseLevel = 0;
    uint64_t v12 = +[SPAudioAccessoryDeviceHIDClient shared];
    sphid = v2->_sphid;
    v2->_sphid = (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient *)v12;
  }
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005894;
  block[3] = &unk_100014688;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100005998;
    v4[3] = &unk_1000146B0;
    v4[4] = self;
    v3 = objc_retainBlock(v4);
    [(SPAudioAccessoryDeviceHIDClient *)self->_sphid ReceiveNoiseLevelWithBlock:v3];
    [(SPAudioAccessoryDeviceHIDClient *)self->_sphid MarkSessionStartWithAppName:@"SPSoundSensor"];
    if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005A14;
  block[3] = &unk_100014688;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  self->_activateCalled = 0;
  [(SPAudioAccessoryDeviceHIDClient *)self->_sphid MarkSessionStopWithAppName:@"SPSoundSensor"];
  if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)setSoundProbability:(unsigned int)a3 value:(float)a4
{
  uint64_t v5 = *(void *)&a3;
  soundTypeToThreshold = self->_soundTypeToThreshold;
  v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v9 = [(NSDictionary *)soundTypeToThreshold objectForKeyedSubscript:v8];
  [v9 floatValue];
  float v11 = v10;

  currentSoundState = self->_currentSoundState;
  unsigned int v13 = self->_currentSoundState[(int)v5];
  if (v11 > a4)
  {
    if (v13 > 1) {
      return;
    }
    currentSoundState[(int)v5] = 2;
    if (dword_10001A078 > 50 || dword_10001A078 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    if (v5 > 2) {
      v14 = "Unknown";
    }
    else {
      v14 = off_1000146D0[(int)v5];
    }
    v23 = v14;
    goto LABEL_20;
  }
  if ((v13 | 2) != 2) {
    return;
  }
  currentSoundState[(int)v5] = 1;
  if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize()))
  {
    if (v5 > 2) {
      objc_super v15 = "Unknown";
    }
    else {
      objc_super v15 = off_1000146D0[(int)v5];
    }
    v23 = v15;
LABEL_20:
    LogPrintF();
  }
LABEL_21:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v16 = self->_soundSubscribers;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v21, "soundType", v23) == v5)
        {
          v22 = [v21 callback];
          v22[2](v22, v5, currentSoundState[(int)v5]);
        }
      }
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)setNoiseLevel:(float)a3
{
  if (a3 <= 90.0) {
    int v3 = 5;
  }
  else {
    int v3 = 6;
  }
  if (a3 > 75.0) {
    int v4 = v3;
  }
  else {
    int v4 = 4;
  }
  if (a3 > 60.0) {
    int v5 = v4;
  }
  else {
    int v5 = 3;
  }
  if (a3 > 45.0) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = 2;
  }
  if (a3 >= 30.0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v7 != self->_currentNoiseLevel)
  {
    self->_currentNoiseLevel = v7;
    if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = v7;
      LogPrintF();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = self->_noiseLevelSubscribers;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "callback", v15);
          v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          v14[2](v14, v7);
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (unsigned)getCurrentSoundSensorState:(unsigned int)a3
{
  return self->_currentSoundState[a3];
}

- (BOOL)subscribeToSoundForClient:(id)a3 soundType:(unsigned int)a4 callback:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = a3;
  id v10 = objc_alloc_init(SoundSubscriber);
  [(SoundSubscriber *)v10 setClient:v9];

  [(SoundSubscriber *)v10 setCallback:v8];
  [(SoundSubscriber *)v10 setSoundType:v5];
  [(NSMutableArray *)self->_soundSubscribers addObject:v10];
  v8[2](v8, v5, self->_currentSoundState[v5]);

  if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return 1;
}

- (BOOL)subscribeToNoiseLevelForClient:(id)a3 callback:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  id v7 = a3;
  v8 = objc_alloc_init(NoiseLevelSubscriber);
  [(NoiseLevelSubscriber *)v8 setClient:v7];

  [(NoiseLevelSubscriber *)v8 setCallback:v6];
  [(NSMutableArray *)self->_noiseLevelSubscribers addObject:v8];
  v6[2](v6, self->_currentNoiseLevel);

  if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return 1;
}

- (BOOL)unsubscribeFromSound:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_soundSubscribers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "client", (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(NSMutableArray *)self->_soundSubscribers removeObject:v10];

          BOOL v12 = 1;
          goto LABEL_19;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (BOOL)unsubscribeFromNoiseLevel:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_noiseLevelSubscribers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "client", (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(NSMutableArray *)self->_noiseLevelSubscribers removeObject:v10];

          BOOL v12 = 1;
          goto LABEL_19;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_10001A078 <= 50 && (dword_10001A078 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)currentNoiseLevel
{
  return self->_currentNoiseLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sphid, 0);
  objc_storeStrong((id *)&self->_soundTypeToThreshold, 0);
  objc_storeStrong((id *)&self->_noiseLevelSubscribers, 0);
  objc_storeStrong((id *)&self->_soundSubscribers, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end