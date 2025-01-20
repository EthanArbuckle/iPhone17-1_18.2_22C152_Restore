@interface SAFenceManager
- (BOOL)isSafeLocation:(id)a3;
- (BOOL)startMonitorSafeLocation:(id)a3 forDevice:(id)a4;
- (BOOL)startMonitorUnsafeLocationExit:(id)a3 forDevice:(id)a4;
- (BOOL)stopMonitorSafeLocation:(id)a3 forDevice:(id)a4;
- (BOOL)stopMonitorUnsafeLocationExit:(id)a3 forDevice:(id)a4;
- (NSHashTable)clients;
- (NSMutableDictionary)deviceUUIDsBySafeLocation;
- (NSMutableDictionary)deviceUUIDsByUnsafeRegionIdentifier;
- (NSMutableDictionary)regionsByRegionIdentifier;
- (NSMutableDictionary)safeLocationsByRegionIdentifier;
- (NSMutableDictionary)statesByRegionIdentifier;
- (SAFenceManager)init;
- (id)getRegionForSafeLocation:(id)a3;
- (unint64_t)getSafeLocationCount;
- (unint64_t)getUnsafeLocationCount;
- (void)addClient:(id)a3;
- (void)handleFenceEvent:(unint64_t)a3 forRegion:(id)a4;
- (void)ingestTAEvent:(id)a3;
- (void)notifyState:(unint64_t)a3 forSafeLocationRegion:(id)a4;
- (void)notifyState:(unint64_t)a3 forUnsafeLocationRegion:(id)a4;
- (void)removeClient:(id)a3;
- (void)removeLocationsForDeviceUuid:(id)a3;
- (void)setClients:(id)a3;
- (void)setDeviceUUIDsBySafeLocation:(id)a3;
- (void)setDeviceUUIDsByUnsafeRegionIdentifier:(id)a3;
- (void)setRegionsByRegionIdentifier:(id)a3;
- (void)setSafeLocationsByRegionIdentifier:(id)a3;
- (void)setStatesByRegionIdentifier:(id)a3;
@end

@implementation SAFenceManager

- (void)ingestTAEvent:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
    uint64_t v5 = [v4 eventType];
    v6 = [v4 region];

    [(SAFenceManager *)self handleFenceEvent:v5 forRegion:v6];
  }
}

- (SAFenceManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)SAFenceManager;
  v2 = [(SAFenceManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDsByUnsafeRegionIdentifier = v2->_deviceUUIDsByUnsafeRegionIdentifier;
    v2->_deviceUUIDsByUnsafeRegionIdentifier = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDsBySafeLocation = v2->_deviceUUIDsBySafeLocation;
    v2->_deviceUUIDsBySafeLocation = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    safeLocationsByRegionIdentifier = v2->_safeLocationsByRegionIdentifier;
    v2->_safeLocationsByRegionIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statesByRegionIdentifier = v2->_statesByRegionIdentifier;
    v2->_statesByRegionIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    regionsByRegionIdentifier = v2->_regionsByRegionIdentifier;
    v2->_regionsByRegionIdentifier = v13;
  }
  return v2;
}

- (unint64_t)getSafeLocationCount
{
  v2 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)getUnsafeLocationCount
{
  v2 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)getRegionForSafeLocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(SAFenceManager *)self safeLocationsByRegionIdentifier];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [(SAFenceManager *)self safeLocationsByRegionIdentifier];
        v12 = [v11 objectForKey:v10];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          objc_super v16 = [(SAFenceManager *)self regionsByRegionIdentifier];
          v15 = [v16 objectForKey:v10];

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v14 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Could not find region for safe location\"}", buf, 0x12u);
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)startMonitorSafeLocation:(id)a3 forDevice:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    v60 = 0;
    char v13 = [v6 identifier];
    uint64_t v14 = [v13 UUIDString];

    [v6 latitude];
    double v16 = v15;
    [v6 longitude];
    double v18 = v17;
    [v6 radius];
    if (v19 >= 100.0) {
      double v20 = v19;
    }
    else {
      double v20 = 100.0;
    }
    v59 = (void *)v14;
    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initForLowPowerWithCenter:radius:identifier:", v14, v16, v18, v20);
    objc_msgSend(v21, "setGeoReferenceFrame:", objc_msgSend(v6, "referenceFrame"));
    id v22 = v21;
    id v63 = v7;
    int v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v7, 0);
    __int16 v24 = [(SAFenceManager *)self regionsByRegionIdentifier];
    v25 = [v22 identifier];
    [v24 setObject:v22 forKey:v25];

    v26 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
    [v26 setObject:v23 forKey:v6];

    uint64_t v27 = [(SAFenceManager *)self safeLocationsByRegionIdentifier];
    v28 = [v22 identifier];
    id v29 = v6;
    [v27 setObject:v6 forKey:v28];

    v30 = [(SAFenceManager *)self statesByRegionIdentifier];
    v31 = [v22 identifier];
    [v30 setObject:&unk_1F27FBF48 forKey:v31];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v32 = [(SAFenceManager *)self clients];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v65;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v64 + 1) + 8 * v36);
          if (objc_opt_respondsToSelector()) {
            [v37 addGeofence:v22];
          }
          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v34);
    }

    id v6 = v29;
    goto LABEL_33;
  }
  uint64_t v10 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  v11 = [v10 objectForKey:v6];

  if (![v11 containsObject:v7])
  {
    v59 = v11;
    v60 = v9;
    v38 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
    v39 = [v38 objectForKey:v6];
    id v63 = v7;
    [v39 addObject:v7];

    v40 = [(SAFenceManager *)self getRegionForSafeLocation:v6];
    v41 = [(SAFenceManager *)self statesByRegionIdentifier];
    v42 = [v40 identifier];
    v43 = [v41 objectForKey:v42];

    if (v43)
    {
      v44 = [(SAFenceManager *)self statesByRegionIdentifier];
      v45 = [v40 identifier];
      v46 = [v44 objectForKey:v45];
      char v47 = [v46 isEqual:&unk_1F27FBF48];

      if ((v47 & 1) == 0)
      {
        v61 = self;
        id v62 = v6;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v48 = [(SAFenceManager *)self clients];
        uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v73 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v69;
          do
          {
            uint64_t v52 = 0;
            do
            {
              if (*(void *)v69 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = *(void **)(*((void *)&v68 + 1) + 8 * v52);
              if (objc_opt_respondsToSelector())
              {
                v54 = [(SAFenceManager *)v61 statesByRegionIdentifier];
                v55 = [v40 identifier];
                v56 = [v54 objectForKey:v55];
                objc_msgSend(v53, "didDetermineState:forSafeLocation:forDevice:", objc_msgSend(v56, "unsignedIntegerValue"), v62, v63);
              }
              ++v52;
            }
            while (v50 != v52);
            uint64_t v50 = [v48 countByEnumeratingWithState:&v68 objects:v73 count:16];
          }
          while (v50);
        }

        id v6 = v62;
      }
    }
    else
    {
      v57 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        uint64_t buf = 68289026;
        __int16 v75 = 2082;
        v76 = "";
        _os_log_impl(&dword_1D15FC000, v57, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Safe location state should have been set to unknown at least\"}", (uint8_t *)&buf, 0x12u);
      }
    }

LABEL_33:
    id v7 = v63;
    v11 = v59;
    v9 = v60;
    goto LABEL_34;
  }
  v12 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    uint64_t buf = 68289026;
    __int16 v75 = 2082;
    v76 = "";
    _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Safe location already used for this device\"}", (uint8_t *)&buf, 0x12u);
  }
LABEL_34:

  return v9 == 0;
}

- (BOOL)stopMonitorSafeLocation:(id)a3 forDevice:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    v30 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v39 = 2082;
      v40 = "";
      _os_log_impl(&dword_1D15FC000, v30, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Can't remove a non-existent safe location\"}", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_15;
  }
  uint64_t v10 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  v11 = [v10 objectForKey:v6];
  [v11 removeObject:v7];

  v12 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  char v13 = [v12 objectForKey:v6];
  uint64_t v14 = [v13 count];

  if (v14)
  {
LABEL_15:
    BOOL v29 = 0;
    goto LABEL_16;
  }
  id v32 = v7;
  double v15 = [(SAFenceManager *)self getRegionForSafeLocation:v6];
  double v16 = [(SAFenceManager *)self statesByRegionIdentifier];
  double v17 = [v15 identifier];
  [v16 removeObjectForKey:v17];

  double v18 = [(SAFenceManager *)self safeLocationsByRegionIdentifier];
  double v19 = [v15 identifier];
  [v18 removeObjectForKey:v19];

  double v20 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  [v20 removeObjectForKey:v6];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v21 = [(SAFenceManager *)self clients];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v26 removeGeofence:v15];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v23);
  }

  uint64_t v27 = [(SAFenceManager *)self regionsByRegionIdentifier];
  v28 = [v15 identifier];
  [v27 removeObjectForKey:v28];

  BOOL v29 = 1;
  id v7 = v32;
LABEL_16:

  return v29;
}

- (BOOL)startMonitorUnsafeLocationExit:(id)a3 forDevice:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  v9 = [v6 identifier];
  uint64_t v10 = [v8 objectForKey:v9];

  if (!v10) {
    goto LABEL_9;
  }
  if (![v10 containsObject:v7]) {
    goto LABEL_6;
  }
  v11 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    uint64_t buf = 68289026;
    __int16 v65 = 2082;
    long long v66 = "";
    _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Unsafe location already used for this device\"}", (uint8_t *)&buf, 0x12u);
  }
  [(SAFenceManager *)self stopMonitorUnsafeLocationExit:v6 forDevice:v7];
  v12 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  char v13 = [v6 identifier];
  uint64_t v14 = [v12 objectForKey:v13];

  uint64_t v10 = (void *)v14;
  if (v14)
  {
LABEL_6:
    double v15 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
    double v16 = [v6 identifier];
    double v17 = [v15 objectForKey:v16];
    [v17 addObject:v7];

    double v18 = [(SAFenceManager *)self statesByRegionIdentifier];
    double v19 = [v6 identifier];
    double v20 = [v18 objectForKey:v19];

    if (v20)
    {
      uint64_t v51 = v10;
      long long v21 = [(SAFenceManager *)self statesByRegionIdentifier];
      uint64_t v22 = [v6 identifier];
      uint64_t v23 = [v21 objectForKey:v22];
      char v24 = [v23 isEqual:&unk_1F27FBF48];

      if (v24)
      {
        BOOL v25 = 0;
        uint64_t v10 = v51;
      }
      else
      {
        id v52 = v7;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        obuint64_t j = [(SAFenceManager *)self clients];
        uint64_t v41 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v59 != v43) {
                objc_enumerationMutation(obj);
              }
              v45 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                [(SAFenceManager *)self statesByRegionIdentifier];
                char v47 = v46 = self;
                v48 = [v6 identifier];
                uint64_t v49 = [v47 objectForKey:v48];
                objc_msgSend(v45, "didDetermineState:forUnsafeLocation:forDevice:", objc_msgSend(v49, "unsignedIntegerValue"), v6, v52);

                self = v46;
              }
            }
            uint64_t v42 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
          }
          while (v42);
        }

        BOOL v25 = 0;
        uint64_t v10 = v51;
        id v7 = v52;
      }
    }
    else
    {
      v40 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        uint64_t buf = 68289026;
        __int16 v65 = 2082;
        long long v66 = "";
        _os_log_impl(&dword_1D15FC000, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Unsafe location state should have been set to unknown at least\"}", (uint8_t *)&buf, 0x12u);
      }
      BOOL v25 = 0;
    }
  }
  else
  {
LABEL_9:
    id v26 = v7;
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v7, 0);
    v28 = [(SAFenceManager *)self regionsByRegionIdentifier];
    BOOL v29 = [v6 identifier];
    [v28 setObject:v6 forKey:v29];

    v30 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
    v31 = [v6 identifier];
    [v30 setObject:v27 forKey:v31];

    id v32 = [(SAFenceManager *)self statesByRegionIdentifier];
    long long v33 = [v6 identifier];
    [v32 setObject:&unk_1F27FBF48 forKey:v33];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v34 = [(SAFenceManager *)self clients];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v55 != v37) {
            objc_enumerationMutation(v34);
          }
          __int16 v39 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v39 addGeofence:v6];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v36);
    }

    uint64_t v10 = 0;
    BOOL v25 = 1;
    id v7 = v26;
  }

  return v25;
}

- (BOOL)stopMonitorUnsafeLocationExit:(id)a3 forDevice:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  v9 = [v6 identifier];
  uint64_t v10 = [v8 objectForKey:v9];

  if (!v10)
  {
    v31 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289026;
      __int16 v39 = 2082;
      v40 = "";
      _os_log_impl(&dword_1D15FC000, v31, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, Can't remove a non-existent unsafe location\"}", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_15;
  }
  v11 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  v12 = [v6 identifier];
  char v13 = [v11 objectForKey:v12];
  [v13 removeObject:v7];

  uint64_t v14 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  double v15 = [v6 identifier];
  double v16 = [v14 objectForKey:v15];
  uint64_t v17 = [v16 count];

  if (v17)
  {
LABEL_15:
    BOOL v30 = 0;
    goto LABEL_16;
  }
  double v18 = [(SAFenceManager *)self statesByRegionIdentifier];
  double v19 = [v6 identifier];
  [v18 removeObjectForKey:v19];

  double v20 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  long long v21 = [v6 identifier];
  [v20 removeObjectForKey:v21];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v22 = [(SAFenceManager *)self clients];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v27 removeGeofence:v6];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v24);
  }

  v28 = [(SAFenceManager *)self regionsByRegionIdentifier];
  BOOL v29 = [v6 identifier];
  [v28 removeObjectForKey:v29];

  BOOL v30 = 1;
LABEL_16:

  return v30;
}

- (void)removeLocationsForDeviceUuid:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v5 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v49 + 1) + 8 * v9);
        v11 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
        v12 = [v11 objectForKey:v10];
        int v13 = [v12 containsObject:v4];

        if (v13)
        {
          uint64_t v14 = [(SAFenceManager *)self regionsByRegionIdentifier];
          double v15 = [v14 objectForKey:v10];
          [v36 addObject:v15];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v7);
  }

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  double v16 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v46;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * v20);
        uint64_t v22 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
        uint64_t v23 = [v22 objectForKey:v21];
        int v24 = [v23 containsObject:v4];

        if (v24) {
          [v35 addObject:v21];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v18);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v36;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        [(SAFenceManager *)self stopMonitorUnsafeLocationExit:*(void *)(*((void *)&v41 + 1) + 8 * v29++) forDevice:v4];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v27);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v30 = v35;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v38;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        [(SAFenceManager *)self stopMonitorSafeLocation:*(void *)(*((void *)&v37 + 1) + 8 * v34++) forDevice:v4];
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v32);
  }
}

- (void)handleFenceEvent:(unint64_t)a3 forRegion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = v7;
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
      uint64_t v9 = [(SAFenceManager *)self statesByRegionIdentifier];
      uint64_t v10 = [v6 identifier];
      [v9 setObject:&unk_1F27FBF48 forKey:v10];
      goto LABEL_3;
    case 1uLL:
    case 4uLL:
      if ([v7 hasPrefix:@"unsafe_"])
      {
        v11 = [(NSMutableDictionary *)self->_deviceUUIDsByUnsafeRegionIdentifier objectForKey:v8];

        if (!v11)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F29128]);
          int v13 = [v8 substringFromIndex:objc_msgSend(@"unsafe_", "length")];
          uint64_t v14 = (void *)[v12 initWithUUIDString:v13];

          double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v14, 0);
          double v16 = [(SAFenceManager *)self regionsByRegionIdentifier];
          uint64_t v17 = [v6 identifier];
          [v16 setObject:v6 forKey:v17];

          uint64_t v18 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
          uint64_t v19 = [v6 identifier];
          [v18 setObject:v15 forKey:v19];

          uint64_t v20 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v27 = 0;
            __int16 v28 = 2082;
            uint64_t v29 = "";
            __int16 v30 = 2113;
            uint64_t v31 = v14;
            _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #fencemgr handleFenceEvent for unsafe location not in dictionary\", \"deviceUUID\":\"%{private}@\"}", buf, 0x1Cu);
          }
        }
      }
      switch(a3)
      {
        case 1uLL:
        case 3uLL:
          goto LABEL_10;
        case 2uLL:
        case 4uLL:
          goto LABEL_12;
        default:
          goto LABEL_20;
      }
      goto LABEL_20;
    case 2uLL:
LABEL_12:
      if ([(SAFenceManager *)self isSafeLocation:v6])
      {
        uint64_t v21 = self;
        uint64_t v22 = 2;
        goto LABEL_14;
      }
      int v24 = self;
      uint64_t v25 = 2;
      goto LABEL_19;
    case 3uLL:
LABEL_10:
      if ([(SAFenceManager *)self isSafeLocation:v6])
      {
        uint64_t v21 = self;
        uint64_t v22 = 1;
LABEL_14:
        [(SAFenceManager *)v21 notifyState:v22 forSafeLocationRegion:v6];
      }
      else
      {
        int v24 = self;
        uint64_t v25 = 1;
LABEL_19:
        [(SAFenceManager *)v24 notifyState:v25 forUnsafeLocationRegion:v6];
      }
LABEL_20:

      return;
    case 6uLL:
      uint64_t v23 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = v23;
        uint64_t v10 = [v6 identifier];
        *(_DWORD *)uint64_t buf = 68289283;
        int v27 = 0;
        __int16 v28 = 2082;
        uint64_t v29 = "";
        __int16 v30 = 2113;
        uint64_t v31 = v10;
        _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #fencemgr, region monitoring error\", \"regionUUID\":\"%{private}@\"}", buf, 0x1Cu);
LABEL_3:
      }
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

- (BOOL)isSafeLocation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector()) {
      char v5 = [v4 isLowPower];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)notifyState:(unint64_t)a3 forSafeLocationRegion:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(SAFenceManager *)self statesByRegionIdentifier];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  uint64_t v9 = [v6 identifier];
  [v7 setObject:v8 forKey:v9];

  uint64_t v10 = [(SAFenceManager *)self safeLocationsByRegionIdentifier];
  v11 = [v6 identifier];
  id v12 = [v10 objectForKey:v11];

  int v13 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    id v15 = [v6 identifier];
    uint64_t v16 = [v15 UTF8String];
    uint64_t v17 = [(SAFenceManager *)self clients];
    uint64_t v18 = [v17 count];
    __int16 v46 = 2082;
    long long v47 = "";
    uint64_t v19 = "Yes";
    uint64_t buf = 68289795;
    if (!v12) {
      uint64_t v19 = "No";
    }
    __int16 v48 = 2081;
    uint64_t v49 = v16;
    __int16 v50 = 2049;
    uint64_t v51 = v18;
    __int16 v52 = 2081;
    v53 = v19;
    _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #fencemgr, notify state for safe\", \"regionUUID\":\"%{private}s\", \"Clients\":%{private}ld, \"Found\":\"%{private}s\"}", (uint8_t *)&buf, 0x30u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [(SAFenceManager *)self clients];
  uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v40;
    uint64_t v32 = self;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v20;
        uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * v20);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v22 = [(SAFenceManager *)self deviceUUIDsBySafeLocation];
        uint64_t v23 = [v22 objectForKey:v12];

        uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v36;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v36 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * v27);
              if (objc_opt_respondsToSelector()) {
                [v21 didDetermineState:a3 forSafeLocation:v12 forDevice:v28];
              }
              ++v27;
            }
            while (v25 != v27);
            uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v25);
        }

        uint64_t v20 = v34 + 1;
        self = v32;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v33);
  }
}

- (void)notifyState:(unint64_t)a3 forUnsafeLocationRegion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(SAFenceManager *)self statesByRegionIdentifier];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  uint64_t v9 = [v6 identifier];
  [v7 setObject:v8 forKey:v9];

  uint64_t v10 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    id v12 = [v6 identifier];
    uint64_t v13 = [v12 UTF8String];
    uint64_t v14 = [(SAFenceManager *)self clients];
    uint64_t buf = 68289539;
    __int16 v41 = 2082;
    long long v42 = "";
    __int16 v43 = 2081;
    uint64_t v44 = v13;
    __int16 v45 = 2049;
    uint64_t v46 = [v14 count];
    _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #fencemgr, notify state for unsafe\", \"regionUUID\":\"%{private}s\", \"Clients\":%{private}ld}", (uint8_t *)&buf, 0x26u);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(SAFenceManager *)self clients];
  uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v35;
    uint64_t v27 = self;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v15;
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v17 = [(SAFenceManager *)self deviceUUIDsByUnsafeRegionIdentifier];
        uint64_t v18 = [v6 identifier];
        uint64_t v19 = [v17 objectForKey:v18];

        uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v31;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v31 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * v23);
              if (objc_opt_respondsToSelector()) {
                [v16 didDetermineState:a3 forUnsafeLocation:v6 forDevice:v24];
              }
              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v21);
        }

        uint64_t v15 = v29 + 1;
        self = v27;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v28);
  }
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAFenceManager *)self clients];
  [v5 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAFenceManager *)self clients];
  [v5 removeObject:v4];
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableDictionary)deviceUUIDsByUnsafeRegionIdentifier
{
  return self->_deviceUUIDsByUnsafeRegionIdentifier;
}

- (void)setDeviceUUIDsByUnsafeRegionIdentifier:(id)a3
{
}

- (NSMutableDictionary)deviceUUIDsBySafeLocation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceUUIDsBySafeLocation:(id)a3
{
}

- (NSMutableDictionary)safeLocationsByRegionIdentifier
{
  return self->_safeLocationsByRegionIdentifier;
}

- (void)setSafeLocationsByRegionIdentifier:(id)a3
{
}

- (NSMutableDictionary)statesByRegionIdentifier
{
  return self->_statesByRegionIdentifier;
}

- (void)setStatesByRegionIdentifier:(id)a3
{
}

- (NSMutableDictionary)regionsByRegionIdentifier
{
  return self->_regionsByRegionIdentifier;
}

- (void)setRegionsByRegionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionsByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_statesByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_safeLocationsByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUUIDsBySafeLocation, 0);
  objc_storeStrong((id *)&self->_deviceUUIDsByUnsafeRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end