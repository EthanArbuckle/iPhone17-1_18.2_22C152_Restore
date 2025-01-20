@interface REBluetoothPredictor
+ (id)bluetoothQueue;
+ (id)supportedFeatures;
- (BOOL)_isConnctedToCar;
- (BOOL)_isConnectedToSpeaker;
- (BOOL)connectedToCar;
- (BOOL)connectedToSpeaker;
- (NSDictionary)localDevices;
- (id)_init;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (void)_registerForBluetoothNotifications;
- (void)_setConnectedToCar:(BOOL)a3;
- (void)_setConnectedToSpeaker:(BOOL)a3;
- (void)_unregisterForBluetoothNotifications;
- (void)pause;
- (void)resume;
- (void)setLocalDevices:(id)a3;
- (void)update;
@end

@implementation REBluetoothPredictor

+ (id)supportedFeatures
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature isConnectedToCarFeature];
  v8[0] = v3;
  v4 = +[REFeature isConnectedToBluetoothSpeakerFeature];
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = [(REFeatureSet *)v2 initWithFeatures:v5];

  return v6;
}

+ (id)bluetoothQueue
{
  if (bluetoothQueue_onceToken != -1) {
    dispatch_once(&bluetoothQueue_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)bluetoothQueue_queue;
  return v2;
}

uint64_t __38__REBluetoothPredictor_bluetoothQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.relevanceengine.predictor.bluetooth", 0);
  uint64_t v1 = bluetoothQueue_queue;
  bluetoothQueue_queue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)REBluetoothPredictor;
  v2 = [(REPredictor *)&v23 _init];
  v3 = v2;
  if (v2)
  {
    [v2 setLocalDevices:MEMORY[0x263EFFA78]];
    objc_initWeak(&location, v3);
    v4 = [v3 queue];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __29__REBluetoothPredictor__init__block_invoke;
    v20 = &unk_2644BC638;
    objc_copyWeak(&v21, &location);
    uint64_t v5 = +[REUpNextScheduler schedulerWithQueue:v4 delay:&v17 updateBlock:0.1];
    id v6 = v3[10];
    v3[10] = (id)v5;

    v7 = (void *)MEMORY[0x263EFFA08];
    v8 = +[REDuetContextDevice localDevice];
    v9 = [v7 setWithObject:v8];

    v10 = +[RESingleton sharedInstance];
    uint64_t v11 = [v10 isConnectedToCarQuery];
    id v12 = v3[8];
    v3[8] = (id)v11;

    [v3[8] setDevices:v9];
    v13 = +[RESingleton sharedInstance];
    uint64_t v14 = [v13 isConnectedToAudioBluetoothDeviceQuery];
    id v15 = v3[9];
    v3[9] = (id)v14;

    [v3[9] setDevices:v9];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __29__REBluetoothPredictor__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained update];
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7 = a3;
  v8 = +[REFeature isConnectedToCarFeature];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    BOOL v10 = [(REBluetoothPredictor *)self connectedToCar];
LABEL_5:
    v13 = +[REFeatureValue featureValueWithBool:v10];
    goto LABEL_7;
  }
  uint64_t v11 = +[REFeature isConnectedToBluetoothSpeakerFeature];
  int v12 = [v7 isEqual:v11];

  if (v12)
  {
    BOOL v10 = [(REBluetoothPredictor *)self connectedToSpeaker];
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (void)resume
{
  objc_initWeak(&location, self);
  [(REBluetoothPredictor *)self _setConnectedToSpeaker:0];
  [(REBluetoothPredictor *)self _setConnectedToCar:0];
  v3 = +[RESingleton sharedInstance];
  connectCarQuery = self->_connectCarQuery;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__REBluetoothPredictor_resume__block_invoke;
  v9[3] = &unk_2644BFD80;
  objc_copyWeak(&v10, &location);
  [v3 registerForQuery:connectCarQuery updateBlock:v9];

  uint64_t v5 = +[RESingleton sharedInstance];
  connectAudioQuery = self->_connectAudioQuery;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__REBluetoothPredictor_resume__block_invoke_2;
  v7[3] = &unk_2644BFD80;
  objc_copyWeak(&v8, &location);
  [v5 registerForQuery:connectAudioQuery updateBlock:v7];

  [(REBluetoothPredictor *)self _registerForBluetoothNotifications];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __30__REBluetoothPredictor_resume__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v6 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setConnectedToCar:v4];
  [WeakRetained updateObservers];
}

void __30__REBluetoothPredictor_resume__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v6 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setConnectedToSpeaker:v4];
  [WeakRetained updateObservers];
}

- (void)pause
{
  v3 = +[RESingleton sharedInstance];
  [v3 unregisterForQuery:self->_connectCarQuery];

  uint64_t v4 = +[RESingleton sharedInstance];
  [v4 unregisterForQuery:self->_connectAudioQuery];

  [(REBluetoothPredictor *)self _unregisterForBluetoothNotifications];
}

- (void)update
{
  if (BluetoothManagerLibraryCore())
  {
    [(REPredictor *)self beginFetchingData];
    if (update_onceToken != -1) {
      dispatch_once(&update_onceToken, &__block_literal_global_12_0);
    }
    v3 = [(REPredictor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__REBluetoothPredictor_update__block_invoke_2;
    block[3] = &unk_2644BC660;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __30__REBluetoothPredictor_update__block_invoke()
{
  id BluetoothManagerClass = getBluetoothManagerClass();
  id v1 = +[REBluetoothPredictor bluetoothQueue];
  [BluetoothManagerClass setSharedInstanceQueue:v1];
}

void __30__REBluetoothPredictor_update__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [getBluetoothManagerClass() sharedInstance];
  uint64_t v16 = a1;
  v3 = [*(id *)(a1 + 32) localDevices];
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v2 connectedDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = [v10 address];
        if ([v11 length])
        {
          unsigned int v12 = [v10 type];
          if (v12 <= 0x2F && ((1 << v12) & 0x800000DB0000) != 0) {
            [v4 setObject:v10 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__REBluetoothPredictor_update__block_invoke_3;
  block[3] = &unk_2644BDBF0;
  id v18 = v3;
  id v19 = v4;
  uint64_t v20 = *(void *)(v16 + 32);
  id v14 = v4;
  id v15 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __30__REBluetoothPredictor_update__block_invoke_3(id *a1)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a1[4] allKeys];
  id v10 = [v2 setWithArray:v3];

  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = [a1[5] allKeys];
  uint64_t v6 = [v4 setWithArray:v5];

  int v7 = [v6 isEqualToSet:v10];
  id v8 = a1[6];
  if (v7)
  {
    [a1[6] finishFetchingData];
  }
  else
  {
    int v9 = (void *)[a1[5] copy];
    [v8 setLocalDevices:v9];

    [a1[6] finishFetchingData];
    [a1[6] updateObservers];
  }
}

- (BOOL)connectedToSpeaker
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(REBluetoothPredictor *)self _isConnectedToSpeaker]) {
    return 1;
  }
  uint64_t v4 = [(REBluetoothPredictor *)self localDevices];
  [v4 allValues];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v11 = objc_msgSend(v10, "type", (void)v14);
        if (v11 <= 0x2F && ((1 << v11) & 0x800000DB0000) != 0)
        {

          BOOL v3 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v3 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v3 = 0;
  }
LABEL_17:

  return v3;
}

- (BOOL)connectedToCar
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(REBluetoothPredictor *)self _isConnctedToCar])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v4 = [(REBluetoothPredictor *)self localDevices];
    [v4 allValues];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "type", (void)v9) == 22)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (void)_registerForBluetoothNotifications
{
  if (BluetoothManagerLibraryCore())
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    bluetoothNotificationScheduler = self->_bluetoothNotificationScheduler;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    id v5 = (void *)getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr;
    uint64_t v38 = getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr;
    if (!getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr)
    {
      uint64_t v6 = (void *)BluetoothManagerLibrary();
      v36[3] = (uint64_t)dlsym(v6, "BluetoothAvailabilityChangedNotification");
      getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr = v36[3];
      id v5 = (void *)v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (v5)
    {
      [v3 addObserver:bluetoothNotificationScheduler selector:sel_schedule name:*v5 object:0];
      uint64_t v7 = self->_bluetoothNotificationScheduler;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      uint64_t v8 = (void *)getBluetoothPowerChangedNotificationSymbolLoc_ptr;
      uint64_t v38 = getBluetoothPowerChangedNotificationSymbolLoc_ptr;
      if (!getBluetoothPowerChangedNotificationSymbolLoc_ptr)
      {
        long long v9 = (void *)BluetoothManagerLibrary();
        v36[3] = (uint64_t)dlsym(v9, "BluetoothPowerChangedNotification");
        getBluetoothPowerChangedNotificationSymbolLoc_ptr = v36[3];
        uint64_t v8 = (void *)v36[3];
      }
      _Block_object_dispose(&v35, 8);
      if (v8)
      {
        [v3 addObserver:v7 selector:sel_schedule name:*v8 object:0];
        long long v10 = self->_bluetoothNotificationScheduler;
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2020000000;
        long long v11 = (void *)getBluetoothDeviceRemovedNotificationSymbolLoc_ptr;
        uint64_t v38 = getBluetoothDeviceRemovedNotificationSymbolLoc_ptr;
        if (!getBluetoothDeviceRemovedNotificationSymbolLoc_ptr)
        {
          long long v12 = (void *)BluetoothManagerLibrary();
          v36[3] = (uint64_t)dlsym(v12, "BluetoothDeviceRemovedNotification");
          getBluetoothDeviceRemovedNotificationSymbolLoc_ptr = v36[3];
          long long v11 = (void *)v36[3];
        }
        _Block_object_dispose(&v35, 8);
        if (v11)
        {
          [v3 addObserver:v10 selector:sel_schedule name:*v11 object:0];
          v13 = self->_bluetoothNotificationScheduler;
          uint64_t v35 = 0;
          v36 = &v35;
          uint64_t v37 = 0x2020000000;
          uint64_t v14 = (void *)getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr;
          uint64_t v38 = getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr;
          if (!getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr)
          {
            long long v15 = (void *)BluetoothManagerLibrary();
            v36[3] = (uint64_t)dlsym(v15, "BluetoothDeviceUnpairedNotification");
            getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr = v36[3];
            uint64_t v14 = (void *)v36[3];
          }
          _Block_object_dispose(&v35, 8);
          if (v14)
          {
            [v3 addObserver:v13 selector:sel_schedule name:*v14 object:0];
            long long v16 = self->_bluetoothNotificationScheduler;
            uint64_t v35 = 0;
            v36 = &v35;
            uint64_t v37 = 0x2020000000;
            long long v17 = (void *)getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr;
            uint64_t v38 = getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr;
            if (!getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr)
            {
              id v18 = (void *)BluetoothManagerLibrary();
              v36[3] = (uint64_t)dlsym(v18, "BluetoothDeviceConnectSuccessNotification");
              getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr = v36[3];
              long long v17 = (void *)v36[3];
            }
            _Block_object_dispose(&v35, 8);
            if (v17)
            {
              [v3 addObserver:v16 selector:sel_schedule name:*v17 object:0];
              uint64_t v19 = self->_bluetoothNotificationScheduler;
              uint64_t v35 = 0;
              v36 = &v35;
              uint64_t v37 = 0x2020000000;
              uint64_t v20 = (void *)getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr;
              uint64_t v38 = getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr;
              if (!getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr)
              {
                long long v21 = (void *)BluetoothManagerLibrary();
                v36[3] = (uint64_t)dlsym(v21, "BluetoothDeviceConnectFailedNotification");
                getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr = v36[3];
                uint64_t v20 = (void *)v36[3];
              }
              _Block_object_dispose(&v35, 8);
              if (v20)
              {
                [v3 addObserver:v19 selector:sel_schedule name:*v20 object:0];
                long long v22 = self->_bluetoothNotificationScheduler;
                uint64_t v35 = 0;
                v36 = &v35;
                uint64_t v37 = 0x2020000000;
                long long v23 = (void *)getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr;
                uint64_t v38 = getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr;
                if (!getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr)
                {
                  long long v24 = (void *)BluetoothManagerLibrary();
                  v36[3] = (uint64_t)dlsym(v24, "BluetoothDeviceDisconnectSuccessNotification");
                  getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr = v36[3];
                  long long v23 = (void *)v36[3];
                }
                _Block_object_dispose(&v35, 8);
                if (v23)
                {
                  [v3 addObserver:v22 selector:sel_schedule name:*v23 object:0];
                  v25 = self->_bluetoothNotificationScheduler;
                  uint64_t v35 = 0;
                  v36 = &v35;
                  uint64_t v37 = 0x2020000000;
                  uint64_t v26 = (void *)getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr;
                  uint64_t v38 = getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr;
                  if (!getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr)
                  {
                    v27 = (void *)BluetoothManagerLibrary();
                    v36[3] = (uint64_t)dlsym(v27, "BluetoothDeviceDisconnectFailedNotification");
                    getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr = v36[3];
                    uint64_t v26 = (void *)v36[3];
                  }
                  _Block_object_dispose(&v35, 8);
                  if (v26)
                  {
                    [v3 addObserver:v25 selector:sel_schedule name:*v26 object:0];
                    v28 = self->_bluetoothNotificationScheduler;
                    uint64_t v35 = 0;
                    v36 = &v35;
                    uint64_t v37 = 0x2020000000;
                    v29 = (void *)getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr;
                    uint64_t v38 = getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr;
                    if (!getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr)
                    {
                      v30 = (void *)BluetoothManagerLibrary();
                      v36[3] = (uint64_t)dlsym(v30, "BluetoothConnectionStatusChangedNotification");
                      getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr = v36[3];
                      v29 = (void *)v36[3];
                    }
                    _Block_object_dispose(&v35, 8);
                    if (v29)
                    {
                      [v3 addObserver:v28 selector:sel_schedule name:*v29 object:0];
                      v31 = self->_bluetoothNotificationScheduler;
                      uint64_t v35 = 0;
                      v36 = &v35;
                      uint64_t v37 = 0x2020000000;
                      v32 = (void *)getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
                      uint64_t v38 = getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
                      if (!getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr)
                      {
                        v33 = (void *)BluetoothManagerLibrary();
                        v36[3] = (uint64_t)dlsym(v33, "BluetoothPairedStatusChangedNotification");
                        getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr = v36[3];
                        v32 = (void *)v36[3];
                      }
                      _Block_object_dispose(&v35, 8);
                      if (v32)
                      {
                        [v3 addObserver:v31 selector:sel_schedule name:*v32 object:0];

                        return;
                      }
LABEL_43:
                      v34 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
                      _Block_object_dispose(&v35, 8);
                      _Unwind_Resume(v34);
                    }
LABEL_42:
                    -[RELemmaEnumerator init]();
                    goto LABEL_43;
                  }
LABEL_41:
                  -[RELemmaEnumerator init]();
                  goto LABEL_42;
                }
LABEL_40:
                -[RELemmaEnumerator init]();
                goto LABEL_41;
              }
LABEL_39:
              -[RELemmaEnumerator init]();
              goto LABEL_40;
            }
LABEL_38:
            -[RELemmaEnumerator init]();
            goto LABEL_39;
          }
LABEL_37:
          -[RELemmaEnumerator init]();
          goto LABEL_38;
        }
LABEL_36:
        -[RELemmaEnumerator init]();
        goto LABEL_37;
      }
    }
    else
    {
      -[RELemmaEnumerator init]();
    }
    -[RELemmaEnumerator init]();
    goto LABEL_36;
  }
}

- (void)_unregisterForBluetoothNotifications
{
  if (BluetoothManagerLibraryCore())
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_bluetoothNotificationScheduler];
  }
}

- (BOOL)_isConnctedToCar
{
  return self->_connectedToCar;
}

- (void)_setConnectedToCar:(BOOL)a3
{
  self->_connectedToCar = a3;
}

- (BOOL)_isConnectedToSpeaker
{
  return self->_connectedToSpeaker;
}

- (void)_setConnectedToSpeaker:(BOOL)a3
{
  self->_connectedToSpeaker = a3;
}

- (NSDictionary)localDevices
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLocalDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDevices, 0);
  objc_storeStrong((id *)&self->_bluetoothNotificationScheduler, 0);
  objc_storeStrong((id *)&self->_connectAudioQuery, 0);
  objc_storeStrong((id *)&self->_connectCarQuery, 0);
}

@end