@interface SADeviceRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDisconnectedDevices;
- (BOOL)hasSurfacedNotificationFor:(id)a3;
- (NSMutableDictionary)deviceRecord;
- (SAAnalyticsServiceProtocol)analytics;
- (SADeviceRecord)initWithClock:(id)a3 analytics:(id)a4;
- (SADeviceRecord)initWithCoder:(id)a3;
- (SATimeServiceProtocol)clock;
- (TALocationLite)lastLocation;
- (id)getAllUUIDs;
- (id)getLastCompanionDisconnectionDate:(id)a3;
- (id)getLastWithYouDate:(id)a3;
- (id)getLastWithYouLocation:(id)a3;
- (id)getLatestAdvertisement:(id)a3;
- (id)getLatestCaseAdvertisementDate:(id)a3;
- (id)getLatestNOAdvertisement:(id)a3;
- (id)getLatestWildAdvertisement:(id)a3;
- (id)getRelatedDevices:(id)a3;
- (id)getSADevice:(id)a3;
- (int64_t)getConnectionState:(id)a3;
- (unint64_t)getDeviceNotificationState:(id)a3;
- (unint64_t)getMonitoringSessionState:(id)a3;
- (unint64_t)getScenarioClass:(id)a3;
- (unint64_t)getWithYouStatus:(id)a3;
- (void)_updateAllRelatedDevices;
- (void)_updateConnectionStateOnConnectionEvent:(id)a3;
- (void)_updateDeviceRecordOnDeviceUpdateEvent:(id)a3;
- (void)_updateLatestAdvertisement:(id)a3;
- (void)_updateLatestCaseAdvertisementDate:(id)a3;
- (void)_updateSingleDeviceRecordForDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)ingestTAEvent:(id)a3;
- (void)resetAllWithYouStatus;
- (void)setAnalytics:(id)a3;
- (void)setClock:(id)a3;
- (void)setDeviceRecord:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)updateLastWithYouDate:(id)a3 forDeviceWithUUID:(id)a4;
- (void)updateLastWithYouLocation:(id)a3 forDeviceWithUUID:(id)a4;
- (void)updateLatestAdvertisement:(id)a3 forDeviceWithUUID:(id)a4;
- (void)updateLocation:(id)a3;
- (void)updateMonitoringSessionState:(unint64_t)a3 forDeviceWithUUID:(id)a4;
- (void)updateScenario:(unint64_t)a3 forDeviceWithUUID:(id)a4;
- (void)updatedWithYouStatusFrom:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5;
@end

@implementation SADeviceRecord

- (void)updateLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  lastLocation = self->_lastLocation;
  p_lastLocation = (id *)&self->_lastLocation;
  v6 = lastLocation;
  if (lastLocation)
  {
    v9 = [(TALocationLite *)v6 getDate];
    v10 = [v5 getDate];
    BOOL v11 = [v9 compare:v10] != 0;

    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v11 = 1;
    if (!v5) {
      goto LABEL_9;
    }
  }
  [v5 horizontalAccuracy];
  if (!v11 || v12 >= 70.0)
  {
LABEL_9:
    v17 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      id v18 = *p_lastLocation;
      v15 = v17;
      v16 = [v18 description];
      v19 = [v5 description];
      int v20 = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2113;
      v25 = v16;
      __int16 v26 = 2113;
      v27 = v19;
      _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SADeviceRecord updateLocation update criteria not satisfied\", \"lastLocation\":\"%{private}@\", \"newLocation\":\"%{private}@\"}", (uint8_t *)&v20, 0x26u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_storeStrong(p_lastLocation, a3);
  v13 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    id v14 = *p_lastLocation;
    v15 = v13;
    v16 = [v14 description];
    int v20 = 68289283;
    int v21 = 0;
    __int16 v22 = 2082;
    v23 = "";
    __int16 v24 = 2113;
    v25 = v16;
    _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SADeviceRecord updateLocation updated\", \"lastLocation\":\"%{private}@\"}", (uint8_t *)&v20, 0x1Cu);
LABEL_11:
  }
LABEL_12:
}

- (void)ingestTAEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SADeviceRecord *)self _updateSingleDeviceRecordForDevice:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SADeviceRecord *)self _updateDeviceRecordOnDeviceUpdateEvent:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SADeviceRecord *)self _updateConnectionStateOnConnectionEvent:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SADeviceRecord *)self _updateLatestCaseAdvertisementDate:v4];
    [(SADeviceRecord *)self _updateLatestAdvertisement:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SADeviceRecord *)self updateLocation:v4];
  }
}

- (SADeviceRecord)initWithClock:(id)a3 analytics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SADeviceRecord;
  v9 = [(SADeviceRecord *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clock, a3);
    objc_storeStrong((id *)&v10->_analytics, a4);
    BOOL v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceRecord = v10->_deviceRecord;
    v10->_deviceRecord = v11;

    lastLocation = v10->_lastLocation;
    v10->_lastLocation = 0;
  }
  return v10;
}

- (id)getAllUUIDs
{
  return (id)[(NSMutableDictionary *)self->_deviceRecord allKeys];
}

- (id)getSADevice:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_deviceRecord objectForKey:a3];
  id v4 = [v3 device];

  return v4;
}

- (int64_t)getConnectionState:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    int64_t v7 = [v6 connectionState];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)getWithYouStatus:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 withYouStatus];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)getDeviceNotificationState:(id)a3
{
  return 0;
}

- (id)getLatestAdvertisement:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 latestAdvertisement];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getLatestNOAdvertisement:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 latestNOAdvertisement];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getLatestWildAdvertisement:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 latestWildAdvertisement];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getLatestCaseAdvertisementDate:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 latestCaseAdvertisementDate];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getLastWithYouDate:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 lastWithYouDate];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getLastCompanionDisconnectionDate:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 lastCompanionDisconnectionDate];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)getScenarioClass:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 currentScenarioClass];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)getMonitoringSessionState:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 currentMonitoringSessionState];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getRelatedDevices:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 uuidsOfRelatedDevices];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)getLastWithYouLocation:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    unint64_t v7 = [v6 lastWithYouLocation];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)updateLatestAdvertisement:(id)a3 forDeviceWithUUID:(id)a4
{
  deviceRecord = self->_deviceRecord;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)deviceRecord objectForKey:a4];
  [v7 updateLatestAdvertisement:v6];
}

- (void)_updateSingleDeviceRecordForDevice:(id)a3
{
  id v4 = a3;
  id v8 = [v4 identifier];
  id v5 = -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:");

  deviceRecord = self->_deviceRecord;
  if (v5)
  {
    id v7 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v8];
    [(SASingleDeviceRecord *)v7 setDevice:v4];
  }
  else
  {
    id v7 = [[SASingleDeviceRecord alloc] initWithDevice:v4 clock:self->_clock analytics:self->_analytics];

    [(NSMutableDictionary *)deviceRecord setObject:v7 forKey:v8];
  }
}

- (void)_updateDeviceRecordOnDeviceUpdateEvent:(id)a3
{
  id v14 = a3;
  id v4 = [v14 device];

  if (!v4) {
    goto LABEL_13;
  }
  if (![v14 eventType])
  {
    id v8 = [v14 device];
    [(SADeviceRecord *)self _updateSingleDeviceRecordForDevice:v8];
LABEL_10:

    id v6 = v14;
    goto LABEL_11;
  }
  BOOL v5 = [v14 eventType] == 1;
  id v6 = v14;
  if (v5)
  {
    id v7 = [v14 device];
    id v8 = [v7 identifier];

    v9 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v8];
    int v10 = [v9 isConnected];

    deviceRecord = self->_deviceRecord;
    if (v10)
    {
      double v12 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v8];
      [v12 setDevice:0];
    }
    else
    {
      double v12 = [v14 device];
      v13 = [v12 identifier];
      [(NSMutableDictionary *)deviceRecord removeObjectForKey:v13];
    }
    goto LABEL_10;
  }
LABEL_11:
  if ([v6 lastEvent]) {
    [(SADeviceRecord *)self _updateAllRelatedDevices];
  }
LABEL_13:
}

- (void)_updateAllRelatedDevices
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_deviceRecord allKeys];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v33;
    *(void *)&long long v2 = 68289795;
    long long v22 = v2;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        BOOL v5 = -[SADeviceRecord getSADevice:](self, "getSADevice:", v4, v22);
        uint64_t v6 = [v5 groupIdentifier];

        id v7 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
        [v7 resetRelatedDevices];

        id v8 = (void *)v6;
        if (v6)
        {
          uint64_t v26 = i;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v9 = obj;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v46 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v29 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                if (([v14 isEqual:v4] & 1) == 0)
                {
                  objc_super v15 = [(SADeviceRecord *)self getSADevice:v14];
                  v16 = [v15 groupIdentifier];
                  int v17 = [v16 isEqual:v8];

                  if (v17)
                  {
                    id v18 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
                    [v18 insertRelatedDevice:v14];
                  }
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v46 count:16];
            }
            while (v11);
          }

          uint64_t i = v26;
        }
        v19 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = v19;
          int v21 = [(SADeviceRecord *)self getRelatedDevices:v4];
          *(_DWORD *)buf = v22;
          int v37 = 0;
          __int16 v38 = 2082;
          v39 = "";
          __int16 v40 = 2113;
          uint64_t v41 = v4;
          __int16 v42 = 2113;
          v43 = v8;
          __int16 v44 = 2113;
          v45 = v21;
          _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa related devices update for device\", \"uuid\":\"%{private}@\", \"groupID\":\"%{private}@\", \"related devices\":\"%{private}@\"}", buf, 0x30u);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
    }
    while (v24);
  }
}

- (void)_updateConnectionStateOnConnectionEvent:(id)a3
{
  id v24 = a3;
  deviceRecord = self->_deviceRecord;
  BOOL v5 = [v24 identifier];
  uint64_t v6 = [(NSMutableDictionary *)deviceRecord objectForKey:v5];
  if (v6)
  {

    goto LABEL_3;
  }
  if ([v24 state] == 2)
  {

LABEL_14:
    int v21 = self->_deviceRecord;
    v16 = [[SASingleDeviceRecord alloc] initWithConnectionEvent:v24 clock:self->_clock analytics:self->_analytics];
    long long v22 = [v24 identifier];
    [(NSMutableDictionary *)v21 setObject:v16 forKey:v22];

    goto LABEL_17;
  }
  uint64_t v20 = [v24 state];

  if (v20 == 3) {
    goto LABEL_14;
  }
LABEL_3:
  id v7 = [v24 identifier];
  id v8 = [(SADeviceRecord *)self getSADevice:v7];
  if (!v8)
  {
    if ([v24 state])
    {
      uint64_t v19 = [v24 state];

      if (v19 != 1) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    uint64_t v23 = self->_deviceRecord;
    v16 = [v24 identifier];
    [(NSMutableDictionary *)v23 removeObjectForKey:v16];
    goto LABEL_17;
  }

LABEL_5:
  id v9 = self->_deviceRecord;
  uint64_t v10 = [v24 identifier];
  uint64_t v11 = [(NSMutableDictionary *)v9 objectForKey:v10];
  objc_msgSend(v11, "setConnectionState:", objc_msgSend(v24, "state"));

  uint64_t v12 = [v24 state];
  v13 = v24;
  if (!v12 || (uint64_t v14 = [v24 state], v13 = v24, v14 == 1))
  {
    objc_super v15 = self->_deviceRecord;
    v16 = [v13 identifier];
    int v17 = [(NSMutableDictionary *)v15 objectForKey:v16];
    id v18 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    [v17 updateLastCompanionDisconnectionDate:v18];

LABEL_17:
    v13 = v24;
  }
  MEMORY[0x1F41817F8](v14, v13);
}

- (void)_updateLatestAdvertisement:(id)a3
{
  deviceRecord = self->_deviceRecord;
  id v4 = a3;
  id v6 = [v4 uuid];
  BOOL v5 = [(NSMutableDictionary *)deviceRecord objectForKey:v6];
  [v5 updateLatestAdvertisement:v4];
}

- (void)_updateLatestCaseAdvertisementDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  deviceRecord = self->_deviceRecord;
  id v6 = [v4 uuid];
  id v7 = [(NSMutableDictionary *)deviceRecord objectForKey:v6];

  id v8 = [v7 device];
  int v9 = [v8 isAirPodsCase];

  if (v9)
  {
    uint64_t v10 = [v4 scanDate];
    [v7 updateLatestCaseAdvertisementDate:v10];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = objc_msgSend(v7, "uuidsOfRelatedDevices", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [(NSMutableDictionary *)self->_deviceRecord objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v15)];
          int v17 = [v4 scanDate];
          [v16 updateLatestCaseAdvertisementDate:v17];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
}

- (void)updateLastWithYouDate:(id)a3 forDeviceWithUUID:(id)a4
{
  deviceRecord = self->_deviceRecord;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)deviceRecord objectForKey:a4];
  [v7 updateLastWithYouDate:v6];
}

- (void)updateScenario:(unint64_t)a3 forDeviceWithUUID:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_deviceRecord objectForKey:a4];
  [v5 updateCurrentScenarioClass:a3];
}

- (void)updateMonitoringSessionState:(unint64_t)a3 forDeviceWithUUID:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_deviceRecord objectForKey:a4];
  [v5 setCurrentMonitoringSessionState:a3];
}

- (void)updateLastWithYouLocation:(id)a3 forDeviceWithUUID:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_deviceRecord objectForKey:v6];

    if (v7)
    {
      id v8 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v6];
      uint64_t v9 = [v8 currentScenarioClass];

      if (v9 == 3)
      {
        lastLocation = self->_lastLocation;
        if (!lastLocation) {
          goto LABEL_13;
        }
        [(TALocationLite *)lastLocation latitude];
        double v12 = v11;
        [(TALocationLite *)self->_lastLocation longitude];
        double v14 = v13;
        id v15 = objc_alloc(MEMORY[0x1E4F1E5A8]);
        [(TALocationLite *)self->_lastLocation horizontalAccuracy];
        double v17 = v16;
        long long v18 = [v6 UUIDString];
        long long v19 = objc_msgSend(v15, "initWithCenter:radius:identifier:", v18, v12, v14, v17);

        long long v20 = [(NSMutableDictionary *)self->_deviceRecord objectForKey:v6];
        id v21 = v20;
        id v22 = v19;
        goto LABEL_12;
      }
      uint64_t v23 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v6];
      uint64_t v24 = [v23 currentScenarioClass];

      if (v27 && v24 == 2)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = v27;
        }
        else {
          v25 = 0;
        }
        deviceRecord = self->_deviceRecord;
        id v21 = v25;
        long long v20 = [(NSMutableDictionary *)deviceRecord objectForKey:v6];
        long long v19 = v20;
        id v22 = v21;
LABEL_12:
        [v20 setLastWithYouLocation:v22];
      }
    }
  }
LABEL_13:
}

- (void)resetAllWithYouStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_deviceRecord allKeys];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [v8 updateWithYouStatus:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)hasSurfacedNotificationFor:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_deviceRecord objectForKey:v4],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
    char v7 = [v6 hasSurfacedNotification];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasDisconnectedDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_deviceRecord;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        unint64_t v9 = [v8 connectionState];

        if (v9 < 2)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADeviceRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SADeviceRecord;
  uint64_t v5 = [(SADeviceRecord *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceRecord"];
    deviceRecord = v5->_deviceRecord;
    v5->_deviceRecord = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)updatedWithYouStatusFrom:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5
{
  id v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:a5];
  [v6 updateWithYouStatus:a4];
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (NSMutableDictionary)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
}

- (TALocationLite)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

@end