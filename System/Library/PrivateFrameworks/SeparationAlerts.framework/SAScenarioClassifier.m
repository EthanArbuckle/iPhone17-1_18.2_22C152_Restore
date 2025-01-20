@interface SAScenarioClassifier
+ (id)convertSAScenarioClassToString:(unint64_t)a3;
- (BOOL)_hasAllSafeLocationStatesKnown;
- (BOOL)_isInsideAnySafeLocation;
- (BOOL)_setNewScenarioClass:(unint64_t)a3;
- (CLCircularRegion)currentVisit;
- (CLRegion)currentUnsafeLocation;
- (CLRegion)lastUnsafeLocation;
- (NSDate)scenarioChangeDate;
- (NSHashTable)clients;
- (NSMutableDictionary)statesBySafeLocation;
- (NSMutableSet)safeLocations;
- (NSUUID)deviceUuid;
- (SAFenceManagerRequestProtocol)delegate;
- (SAScenarioClassifier)initWithDeviceUuid:(id)a3;
- (SAScenarioClassifier)initWithDeviceUuid:(id)a3 scenarioClass:(unint64_t)a4 unsafeLocation:(id)a5;
- (SATimeServiceProtocol)timeDelegate;
- (id)_findSafeLocationWithUUID:(id)a3;
- (id)getCurrentTime;
- (unint64_t)scenarioClassification;
- (void)_addSafeLocation:(id)a3;
- (void)_addUnsafeLocation:(id)a3;
- (void)_notifyAllClientsOfScenarioChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)_removeSafeLocation:(id)a3;
- (void)_removeUnsafeLocation:(id)a3;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)didDetermineState:(unint64_t)a3 forSafeLocation:(id)a4 forDevice:(id)a5;
- (void)didDetermineState:(unint64_t)a3 forUnsafeLocation:(id)a4 forDevice:(id)a5;
- (void)ingestTAEvent:(id)a3;
- (void)removeClient:(id)a3;
- (void)setClients:(id)a3;
- (void)setCurrentUnsafeLocation:(id)a3;
- (void)setCurrentVisit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUuid:(id)a3;
- (void)setLastUnsafeLocation:(id)a3;
- (void)setSafeLocations:(id)a3;
- (void)setScenarioClassification:(unint64_t)a3;
- (void)setStatesBySafeLocation:(id)a3;
- (void)setTimeDelegate:(id)a3;
@end

@implementation SAScenarioClassifier

- (SAScenarioClassifier)initWithDeviceUuid:(id)a3
{
  return [(SAScenarioClassifier *)self initWithDeviceUuid:a3 scenarioClass:0 unsafeLocation:0];
}

- (SAScenarioClassifier)initWithDeviceUuid:(id)a3 scenarioClass:(unint64_t)a4 unsafeLocation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SAScenarioClassifier;
  v10 = [(SAScenarioClassifier *)&v22 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v11;

    v10->_scenarioClassification = a4;
    uint64_t v13 = [(SAScenarioClassifier *)v10 getCurrentTime];
    scenarioChangeDate = v10->_scenarioChangeDate;
    v10->_scenarioChangeDate = (NSDate *)v13;

    uint64_t v15 = [v8 copy];
    deviceUuid = v10->_deviceUuid;
    v10->_deviceUuid = (NSUUID *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    safeLocations = v10->_safeLocations;
    v10->_safeLocations = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statesBySafeLocation = v10->_statesBySafeLocation;
    v10->_statesBySafeLocation = v19;

    if (v10->_scenarioClassification == 2) {
      objc_storeStrong((id *)&v10->_currentUnsafeLocation, a5);
    }
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(SAScenarioClassifier *)self currentUnsafeLocation];

  if (v3)
  {
    v4 = [(SAScenarioClassifier *)self currentUnsafeLocation];
    [(SAScenarioClassifier *)self _removeUnsafeLocation:v4];
  }
  v5 = [(SAScenarioClassifier *)self safeLocations];
  v6 = [v5 allObjects];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SAScenarioClassifier *)self _removeSafeLocation:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  currentUnsafeLocation = self->_currentUnsafeLocation;
  self->_currentUnsafeLocation = 0;

  currentVisit = self->_currentVisit;
  self->_currentVisit = 0;

  lastUnsafeLocation = self->_lastUnsafeLocation;
  self->_lastUnsafeLocation = 0;

  statesBySafeLocation = self->_statesBySafeLocation;
  self->_statesBySafeLocation = 0;

  safeLocations = self->_safeLocations;
  self->_safeLocations = 0;

  deviceUuid = self->_deviceUuid;
  self->_deviceUuid = 0;

  scenarioChangeDate = self->_scenarioChangeDate;
  self->_scenarioChangeDate = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

  v20.receiver = self;
  v20.super_class = (Class)SAScenarioClassifier;
  [(SAScenarioClassifier *)&v20 dealloc];
}

- (BOOL)_setNewScenarioClass:(unint64_t)a3
{
  unint64_t v5 = [(SAScenarioClassifier *)self scenarioClassification];
  [(SAScenarioClassifier *)self setScenarioClassification:a3];
  unint64_t v6 = [(SAScenarioClassifier *)self scenarioClassification];
  if (v6 != v5)
  {
    id v7 = [(SAScenarioClassifier *)self getCurrentTime];
    scenarioChangeDate = self->_scenarioChangeDate;
    self->_scenarioChangeDate = v7;

    [(SAScenarioClassifier *)self _notifyAllClientsOfScenarioChangeFrom:v5 to:[(SAScenarioClassifier *)self scenarioClassification]];
  }
  return v6 != v5;
}

- (BOOL)_isInsideAnySafeLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(SAScenarioClassifier *)self safeLocations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [(SAScenarioClassifier *)self statesBySafeLocation];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];
        char v11 = [v10 isEqual:&unk_1F27FBFD8];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_hasAllSafeLocationStatesKnown
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(SAScenarioClassifier *)self safeLocations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [(SAScenarioClassifier *)self statesBySafeLocation];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];
        char v11 = [v10 isEqual:&unk_1F27FBFF0];

        if (v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (id)convertSAScenarioClassToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E68D7568[a3 - 1];
  }
}

- (void)_notifyAllClientsOfScenarioChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(SAScenarioClassifier *)self deviceUuid];
    id v10 = +[SAScenarioClassifier convertSAScenarioClassToString:a3];
    uint64_t v11 = [v10 UTF8String];
    id v12 = +[SAScenarioClassifier convertSAScenarioClassToString:a4];
    uint64_t buf = 68289795;
    __int16 v26 = 2082;
    v27 = "";
    __int16 v28 = 2113;
    v29 = v9;
    __int16 v30 = 2081;
    uint64_t v31 = v11;
    __int16 v32 = 2081;
    uint64_t v33 = [v12 UTF8String];
    _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier notifyScenarioChange\", \"device\":\"%{private}@\", \"from\":\"%{private}s\", \"to\":\"%{private}s\"}", (uint8_t *)&buf, 0x30u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [(SAScenarioClassifier *)self clients];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * v17);
        uint64_t v19 = [(SAScenarioClassifier *)self deviceUuid];
        [v18 didChangeScenarioClassFrom:a3 to:a4 forDevice:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)didDetermineState:(unint64_t)a3 forUnsafeLocation:(id)a4 forDevice:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SAScenarioClassifier *)self deviceUuid];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = [(SAScenarioClassifier *)self currentUnsafeLocation];

    if (!v12 && [(SAScenarioClassifier *)self scenarioClassification] == 2)
    {
      uint64_t v13 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 68289283;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        __int16 v28 = 2113;
        id v29 = v9;
        _os_log_impl(&dword_1D15FC000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier setting current unsafe location from nil\", \"device\":\"%{private}@\"}", (uint8_t *)&v24, 0x1Cu);
      }
      [(SAScenarioClassifier *)self setCurrentUnsafeLocation:v8];
    }
    uint64_t v14 = [(SAScenarioClassifier *)self currentUnsafeLocation];
    uint64_t v15 = [v14 identifier];
    uint64_t v16 = [v8 identifier];
    char v17 = [v15 isEqual:v16];

    v18 = TASALog;
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 68289539;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        __int16 v28 = 2113;
        id v29 = v9;
        __int16 v30 = 2049;
        unint64_t v31 = a3;
        _os_log_impl(&dword_1D15FC000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier didDetermineState unsafe\", \"device\":\"%{private}@\", \"state\":%{private}ld}", (uint8_t *)&v24, 0x26u);
      }
      switch([(SAScenarioClassifier *)self scenarioClassification])
      {
        case 0uLL:
          if (a3 != 2) {
            goto LABEL_21;
          }
          [(SAScenarioClassifier *)self _setNewScenarioClass:3];
          goto LABEL_30;
        case 1uLL:
          uint64_t v21 = TASALog;
          if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          int v24 = 68289283;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = "";
          __int16 v28 = 2113;
          id v29 = v9;
          uint64_t v19 = "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation in safe\", \"device\":\"%{private}@\"}";
          goto LABEL_25;
        case 2uLL:
          if (a3 == 2)
          {
            long long v22 = [(SAScenarioClassifier *)self currentUnsafeLocation];
            [(SAScenarioClassifier *)self setLastUnsafeLocation:v22];

            [(SAScenarioClassifier *)self setCurrentUnsafeLocation:0];
            if ([(SAScenarioClassifier *)self _setNewScenarioClass:3]) {
              goto LABEL_30;
            }
          }
          goto LABEL_27;
        case 3uLL:
          if (a3 == 2)
          {
            long long v23 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            {
              int v24 = 68289283;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = "";
              __int16 v28 = 2113;
              id v29 = v9;
              _os_log_impl(&dword_1D15FC000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation unexpected\", \"device\":\"%{private}@\"}", (uint8_t *)&v24, 0x1Cu);
            }
LABEL_30:
            [(SAScenarioClassifier *)self _removeUnsafeLocation:v8];
          }
          else
          {
LABEL_21:
            if (a3 == 1) {
              [(SAScenarioClassifier *)self _setNewScenarioClass:2];
            }
          }
          goto LABEL_27;
        case 4uLL:
          uint64_t v21 = TASALog;
          if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          int v24 = 68289283;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = "";
          __int16 v28 = 2113;
          id v29 = v9;
          uint64_t v19 = "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation not supported\", \"device\":\"%{private}@\"}";
LABEL_25:
          long long v20 = v21;
          break;
        default:
          goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      int v24 = 68289283;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 2113;
      id v29 = v9;
      uint64_t v19 = "{\"msg%{public}.0s\":\"#SAScenarioClassifier forUnsafeLocation location\", \"device\":\"%{private}@\"}";
      long long v20 = v18;
LABEL_26:
      _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, 0x1Cu);
    }
  }
LABEL_27:
}

- (void)didDetermineState:(unint64_t)a3 forSafeLocation:(id)a4 forDevice:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SAScenarioClassifier *)self deviceUuid];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = [(SAScenarioClassifier *)self safeLocations];
    int v13 = [v12 containsObject:v8];

    if (v13)
    {
      uint64_t v14 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 68289539;
        int v22 = 0;
        __int16 v23 = 2082;
        int v24 = "";
        __int16 v25 = 2113;
        id v26 = v9;
        __int16 v27 = 2049;
        unint64_t v28 = a3;
        _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier didDetermineState safe\", \"device\":\"%{private}@\", \"state\":%{private}ld}", (uint8_t *)&v21, 0x26u);
      }
      uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
      uint64_t v16 = [(SAScenarioClassifier *)self statesBySafeLocation];
      [v16 setObject:v15 forKeyedSubscript:v8];

      if (a3)
      {
        switch([(SAScenarioClassifier *)self scenarioClassification])
        {
          case 0uLL:
            if (a3 != 1 && ![(SAScenarioClassifier *)self _isInsideAnySafeLocation]) {
              goto LABEL_13;
            }
            goto LABEL_18;
          case 1uLL:
            if (a3 != 2
              || [(SAScenarioClassifier *)self _isInsideAnySafeLocation]
              || ![(SAScenarioClassifier *)self _hasAllSafeLocationStatesKnown])
            {
              goto LABEL_20;
            }
LABEL_13:
            char v17 = self;
            uint64_t v18 = 3;
            break;
          case 2uLL:
            if (a3 != 1) {
              goto LABEL_20;
            }
            uint64_t v19 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
            {
              int v21 = 68289283;
              int v22 = 0;
              __int16 v23 = 2082;
              int v24 = "";
              __int16 v25 = 2113;
              id v26 = v9;
              _os_log_impl(&dword_1D15FC000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier forSafeLocation in unsafe\", \"device\":\"%{private}@\"}", (uint8_t *)&v21, 0x1Cu);
            }
LABEL_18:
            char v17 = self;
            uint64_t v18 = 1;
            break;
          case 3uLL:
            if (a3 == 1) {
              goto LABEL_18;
            }
            goto LABEL_20;
          case 4uLL:
            long long v20 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
            {
              int v21 = 68289283;
              int v22 = 0;
              __int16 v23 = 2082;
              int v24 = "";
              __int16 v25 = 2113;
              id v26 = v9;
              _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier forSafeLocation not supported\", \"device\":\"%{private}@\"}", (uint8_t *)&v21, 0x1Cu);
            }
            goto LABEL_20;
          default:
            goto LABEL_20;
        }
        [(SAScenarioClassifier *)v17 _setNewScenarioClass:v18];
      }
    }
  }
LABEL_20:
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAScenarioClassifier *)self clients];
  [v5 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAScenarioClassifier *)self clients];
  [v5 removeObject:v4];
}

- (void)ingestTAEvent:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 eventType];
    if (!v6)
    {
      id v7 = [v5 safeLocation];
      [(SAScenarioClassifier *)self _addSafeLocation:v7];
      goto LABEL_29;
    }
    if (v6 == 1)
    {
      id v7 = [v5 safeLocation];
      [(SAScenarioClassifier *)self _removeSafeLocation:v7];
      if ([(SAScenarioClassifier *)self _isInsideAnySafeLocation])
      {
        id v8 = self;
        uint64_t v9 = 1;
LABEL_6:
        [(SAScenarioClassifier *)v8 _setNewScenarioClass:v9];
LABEL_29:

LABEL_40:
        goto LABEL_41;
      }
      if ([(SAScenarioClassifier *)self scenarioClassification] != 1) {
        goto LABEL_29;
      }
      [v7 latitude];
      CLLocationDegrees v25 = v24;
      [v7 longitude];
      CLLocationCoordinate2D v27 = CLLocationCoordinate2DMake(v25, v26);
      unint64_t v28 = [(SAScenarioClassifier *)self currentVisit];
      int v29 = objc_msgSend(v28, "containsCoordinate:", v27.latitude, v27.longitude);

      if (!v29)
      {
        id v8 = self;
        uint64_t v9 = 3;
        goto LABEL_6;
      }
      [(SAScenarioClassifier *)self _setNewScenarioClass:2];
      __int16 v30 = [(SAScenarioClassifier *)self currentVisit];
      [(SAScenarioClassifier *)self _addUnsafeLocation:v30];
LABEL_28:

      goto LABEL_29;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    if ([v7 hasArrivalDate] && (objc_msgSend(v7, "hasDepartureDate") & 1) == 0)
    {
      id v31 = [NSString alloc];
      uint64_t v32 = [(SAScenarioClassifier *)self deviceUuid];
      uint64_t v33 = [v32 UUIDString];
      uint64_t v34 = (void *)[v31 initWithFormat:@"unsafe_%@", v33];

      id v35 = objc_alloc(MEMORY[0x1E4F1E5A8]);
      [v7 coordinate];
      id v5 = (id)objc_msgSend(v35, "initWithCenter:radius:identifier:", v34);
      [(SAScenarioClassifier *)self setCurrentVisit:v5];
    }
    else
    {
      id v5 = 0;
    }
    if ([(SAScenarioClassifier *)self scenarioClassification] == 1)
    {
      v36 = (void *)TASALog;
      if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      __int16 v30 = v36;
      v37 = [(SAScenarioClassifier *)self deviceUuid];
      *(_DWORD *)uint64_t buf = 68289283;
      int v43 = 0;
      __int16 v44 = 2082;
      v45 = "";
      __int16 v46 = 2113;
      v47 = v37;
      _os_log_impl(&dword_1D15FC000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier visit while in safe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);

      goto LABEL_28;
    }
    if ([(SAScenarioClassifier *)self scenarioClassification] != 2) {
      goto LABEL_38;
    }
    v38 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    long long v20 = v38;
    v39 = [(SAScenarioClassifier *)self deviceUuid];
    *(_DWORD *)uint64_t buf = 68289283;
    int v43 = 0;
    __int16 v44 = 2082;
    v45 = "";
    __int16 v46 = 2113;
    v47 = v39;
    _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier visit while in unsafe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_41;
    }
    id v10 = v4;
    [v10 latitude];
    CLLocationDegrees v12 = v11;
    [v10 longitude];
    CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v12, v13);
    [v10 horizontalAccuracy];
    if (v15 >= 100.0) {
      double v16 = v15;
    }
    else {
      double v16 = 100.0;
    }
    id v17 = [NSString alloc];
    uint64_t v18 = [(SAScenarioClassifier *)self deviceUuid];
    uint64_t v19 = [v18 UUIDString];
    long long v20 = [v17 initWithFormat:@"unsafe_%@", v19];

    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v20, v14.latitude, v14.longitude, v16);
    objc_msgSend(v5, "setGeoReferenceFrame:", objc_msgSend(v10, "referenceFrame"));
    [(SAScenarioClassifier *)self setCurrentVisit:v5];
    if ([(SAScenarioClassifier *)self scenarioClassification] == 1)
    {
      int v21 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = v21;
        __int16 v23 = [(SAScenarioClassifier *)self deviceUuid];
        *(_DWORD *)uint64_t buf = 68289283;
        int v43 = 0;
        __int16 v44 = 2082;
        v45 = "";
        __int16 v46 = 2113;
        v47 = v23;
        _os_log_impl(&dword_1D15FC000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier LOI while in safe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);
      }
      goto LABEL_40;
    }
    if ([(SAScenarioClassifier *)self scenarioClassification] != 2) {
      goto LABEL_37;
    }
    v40 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    v39 = v40;
    v41 = [(SAScenarioClassifier *)self deviceUuid];
    *(_DWORD *)uint64_t buf = 68289283;
    int v43 = 0;
    __int16 v44 = 2082;
    v45 = "";
    __int16 v46 = 2113;
    v47 = v41;
    _os_log_impl(&dword_1D15FC000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning #SAScenarioClassifier LOI while in unsafe\", \"device\":\"%{private}@\"}", buf, 0x1Cu);
  }
LABEL_37:

LABEL_38:
  if (v5)
  {
    [(SAScenarioClassifier *)self _addUnsafeLocation:v5];
    goto LABEL_40;
  }
LABEL_41:
}

- (void)_addUnsafeLocation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (CLRegion *)a3;
  id v5 = [(SAScenarioClassifier *)self currentUnsafeLocation];

  if (v5)
  {
    uint64_t v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = [(SAScenarioClassifier *)self deviceUuid];
      uint64_t v9 = [(SAScenarioClassifier *)self currentUnsafeLocation];
      id v10 = [v9 identifier];
      double v11 = [(CLRegion *)v4 identifier];
      v20[0] = 68289795;
      v20[1] = 0;
      __int16 v21 = 2082;
      int v22 = "";
      __int16 v23 = 2113;
      double v24 = v8;
      __int16 v25 = 2113;
      CLLocationDegrees v26 = v10;
      __int16 v27 = 2113;
      unint64_t v28 = v11;
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier addUnsafeLocation replacing already existing unsafe\", \"device\":\"%{private}@\", \"old\":\"%{private}@\", \"new\":\"%{private}@\"}", (uint8_t *)v20, 0x30u);
    }
    CLLocationDegrees v12 = [(SAScenarioClassifier *)self delegate];
    CLLocationDegrees v13 = [(SAScenarioClassifier *)self currentUnsafeLocation];
    CLLocationCoordinate2D v14 = [(SAScenarioClassifier *)self deviceUuid];
    [v12 stopMonitorUnsafeLocationExit:v13 forDevice:v14];

    currentUnsafeLocation = self->_currentUnsafeLocation;
    self->_currentUnsafeLocation = 0;
  }
  double v16 = self->_currentUnsafeLocation;
  self->_currentUnsafeLocation = v4;
  id v17 = v4;

  uint64_t v18 = [(SAScenarioClassifier *)self delegate];
  uint64_t v19 = [(SAScenarioClassifier *)self deviceUuid];
  [v18 startMonitorUnsafeLocationExit:v17 forDevice:v19];
}

- (void)_removeUnsafeLocation:(id)a3
{
  currentUnsafeLocation = self->_currentUnsafeLocation;
  self->_currentUnsafeLocation = 0;
  id v5 = a3;

  id v7 = [(SAScenarioClassifier *)self delegate];
  uint64_t v6 = [(SAScenarioClassifier *)self deviceUuid];
  [v7 stopMonitorUnsafeLocationExit:v5 forDevice:v6];
}

- (id)_findSafeLocationWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SAScenarioClassifier *)self safeLocations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        char v11 = [v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_addSafeLocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(SAScenarioClassifier *)self _findSafeLocationWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      uint64_t v9 = [(SAScenarioClassifier *)self deviceUuid];
      id v10 = [v4 identifier];
      v15[0] = 68289539;
      v15[1] = 0;
      __int16 v16 = 2082;
      id v17 = "";
      __int16 v18 = 2113;
      uint64_t v19 = v9;
      __int16 v20 = 2113;
      __int16 v21 = v10;
      _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAScenarioClassifier addSafeLocation replacing\", \"device\":\"%{private}@\", \"location\":\"%{private}@\"}", (uint8_t *)v15, 0x26u);
    }
    [(SAScenarioClassifier *)self _removeSafeLocation:v6];
  }
  char v11 = [(SAScenarioClassifier *)self safeLocations];
  [v11 addObject:v4];

  CLLocationDegrees v12 = [(SAScenarioClassifier *)self statesBySafeLocation];
  [v12 setObject:&unk_1F27FBFF0 forKeyedSubscript:v4];

  long long v13 = [(SAScenarioClassifier *)self delegate];
  long long v14 = [(SAScenarioClassifier *)self deviceUuid];
  [v13 startMonitorSafeLocation:v4 forDevice:v14];
}

- (void)_removeSafeLocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(SAScenarioClassifier *)self _findSafeLocationWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = [(SAScenarioClassifier *)self delegate];
    id v8 = [(SAScenarioClassifier *)self deviceUuid];
    [v7 stopMonitorSafeLocation:v6 forDevice:v8];

    uint64_t v9 = [(SAScenarioClassifier *)self statesBySafeLocation];
    [v9 setObject:0 forKeyedSubscript:v6];

    id v10 = [(SAScenarioClassifier *)self safeLocations];
    [v10 removeObject:v6];
  }
  else
  {
    char v11 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      CLLocationDegrees v12 = v11;
      long long v13 = [(SAScenarioClassifier *)self deviceUuid];
      long long v14 = [v4 identifier];
      v15[0] = 68289539;
      v15[1] = 0;
      __int16 v16 = 2082;
      id v17 = "";
      __int16 v18 = 2113;
      uint64_t v19 = v13;
      __int16 v20 = 2113;
      __int16 v21 = v14;
      _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAScenarioClassifier removeSafeLocation not in set\", \"device\":\"%{private}@\", \"location\":\"%{private}@\"}", (uint8_t *)v15, 0x26u);
    }
  }
}

- (id)getCurrentTime
{
  v3 = [(SAScenarioClassifier *)self timeDelegate];

  if (v3)
  {
    id v4 = [(SAScenarioClassifier *)self timeDelegate];
    id v5 = [v4 getCurrentTime];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
  }
  return v5;
}

- (CLRegion)currentUnsafeLocation
{
  return self->_currentUnsafeLocation;
}

- (void)setCurrentUnsafeLocation:(id)a3
{
}

- (CLRegion)lastUnsafeLocation
{
  return self->_lastUnsafeLocation;
}

- (void)setLastUnsafeLocation:(id)a3
{
}

- (NSUUID)deviceUuid
{
  return self->_deviceUuid;
}

- (void)setDeviceUuid:(id)a3
{
}

- (unint64_t)scenarioClassification
{
  return self->_scenarioClassification;
}

- (void)setScenarioClassification:(unint64_t)a3
{
  self->_scenarioClassification = a3;
}

- (NSDate)scenarioChangeDate
{
  return self->_scenarioChangeDate;
}

- (SAFenceManagerRequestProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (SATimeServiceProtocol)timeDelegate
{
  return self->_timeDelegate;
}

- (void)setTimeDelegate:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
}

- (NSMutableDictionary)statesBySafeLocation
{
  return self->_statesBySafeLocation;
}

- (void)setStatesBySafeLocation:(id)a3
{
}

- (CLCircularRegion)currentVisit
{
  return self->_currentVisit;
}

- (void)setCurrentVisit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVisit, 0);
  objc_storeStrong((id *)&self->_statesBySafeLocation, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_timeDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scenarioChangeDate, 0);
  objc_storeStrong((id *)&self->_deviceUuid, 0);
  objc_storeStrong((id *)&self->_lastUnsafeLocation, 0);
  objc_storeStrong((id *)&self->_currentUnsafeLocation, 0);
}

@end