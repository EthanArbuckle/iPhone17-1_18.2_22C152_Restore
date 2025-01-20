@interface SAPowerLog
- (BOOL)isReplay;
- (NSDate)startTimestamp;
- (NSHashTable)clients;
- (NSMutableSet)monitoredDevices;
- (SAPowerLog)initWithClock:(id)a3 isReplay:(BOOL)a4;
- (SATimeServiceProtocol)clock;
- (double)totalVisitDuration;
- (unint64_t)btScanCount;
- (unint64_t)geofenceCount;
- (unint64_t)gpsLocationRequestCount;
- (unint64_t)separationAlertsCount;
- (unint64_t)visitCount;
- (unint64_t)wifiLocationRequestCount;
- (void)addClient:(id)a3;
- (void)addMonitoredDevice:(id)a3;
- (void)increaseBTScanCount;
- (void)increaseGeofenceCount;
- (void)increaseGpsLocationRequestCount;
- (void)increaseSeparationAlertsCount:(unint64_t)a3;
- (void)increaseWifiLocationRequestCount;
- (void)ingestTAEvent:(id)a3;
- (void)removeClient:(id)a3;
- (void)resetStatistics;
- (void)sendPowerLog;
- (void)setBtScanCount:(unint64_t)a3;
- (void)setClients:(id)a3;
- (void)setClock:(id)a3;
- (void)setGeofenceCount:(unint64_t)a3;
- (void)setGpsLocationRequestCount:(unint64_t)a3;
- (void)setIsReplay:(BOOL)a3;
- (void)setMonitoredDevices:(id)a3;
- (void)setSeparationAlertsCount:(unint64_t)a3;
- (void)setStartTimestamp:(id)a3;
- (void)setTotalVisitDuration:(double)a3;
- (void)setVisitCount:(unint64_t)a3;
- (void)setWifiLocationRequestCount:(unint64_t)a3;
@end

@implementation SAPowerLog

- (void)ingestTAEvent:(id)a3
{
  id v16 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = v16;
  if (isKindOfClass)
  {
    id v6 = v16;
    if ([v6 hasArrivalDate] && objc_msgSend(v6, "hasDepartureDate"))
    {
      [(SAPowerLog *)self setVisitCount:[(SAPowerLog *)self visitCount] + 1];
      v7 = [v6 departureDate];
      v8 = [v6 arrivalDate];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;
      [(SAPowerLog *)self totalVisitDuration];
      [(SAPowerLog *)self setTotalVisitDuration:v10 + v11];
    }
    v5 = v16;
  }
  v12 = [v5 getDate];
  v13 = [(SAPowerLog *)self startTimestamp];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 >= 14400.0) {
    [(SAPowerLog *)self sendPowerLog];
  }
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (SAPowerLog)initWithClock:(id)a3 isReplay:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SAPowerLog;
  v8 = [(SAPowerLog *)&v12 init];
  if (v8)
  {
    double v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    monitoredDevices = v8->_monitoredDevices;
    v8->_monitoredDevices = v9;

    objc_storeStrong((id *)&v8->_clock, a3);
    v8->_isReplay = a4;
    [(SAPowerLog *)v8 resetStatistics];
  }

  return v8;
}

- (void)resetStatistics
{
  v3 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  [(SAPowerLog *)self setStartTimestamp:v3];

  [(SAPowerLog *)self setVisitCount:0];
  [(SAPowerLog *)self setTotalVisitDuration:0.0];
  [(SAPowerLog *)self setBtScanCount:0];
  [(SAPowerLog *)self setGeofenceCount:0];
  [(SAPowerLog *)self setGpsLocationRequestCount:0];
  [(SAPowerLog *)self setWifiLocationRequestCount:0];
  [(SAPowerLog *)self setSeparationAlertsCount:0];
  id v4 = [(SAPowerLog *)self monitoredDevices];
  [v4 removeAllObjects];
}

- (void)sendPowerLog
{
  v27[9] = *MEMORY[0x1E4F143B8];
  if (!self->_isReplay)
  {
    v26[0] = @"timestamp";
    v3 = (void *)MEMORY[0x1E4F28ED0];
    v19 = [(SAPowerLog *)self startTimestamp];
    [v19 timeIntervalSinceReferenceDate];
    v18 = objc_msgSend(v3, "numberWithDouble:");
    v27[0] = v18;
    v26[1] = @"NumberOfVisits";
    v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAPowerLog visitCount](self, "visitCount"));
    v27[1] = v17;
    v26[2] = @"DurationOfVisits";
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    [(SAPowerLog *)self totalVisitDuration];
    id v16 = objc_msgSend(v4, "numberWithDouble:");
    v27[2] = v16;
    v26[3] = @"TotalGeoFence";
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAPowerLog geofenceCount](self, "geofenceCount"));
    v27[3] = v5;
    v26[4] = @"BTScanCount";
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAPowerLog btScanCount](self, "btScanCount"));
    v27[4] = v6;
    v26[5] = @"Notifications";
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAPowerLog separationAlertsCount](self, "separationAlertsCount"));
    v27[5] = v7;
    v26[6] = @"DevicesMonitored";
    v8 = (void *)MEMORY[0x1E4F28ED0];
    double v9 = [(SAPowerLog *)self monitoredDevices];
    double v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v27[6] = v10;
    v26[7] = @"GPSAttribution";
    double v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAPowerLog gpsLocationRequestCount](self, "gpsLocationRequestCount"));
    v27[7] = v11;
    v26[8] = @"WifiScanCount";
    objc_super v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAPowerLog wifiLocationRequestCount](self, "wifiLocationRequestCount"));
    v27[8] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];

    id v14 = v13;
    double v15 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2113;
      id v25 = v14;
      _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa submitting PowerLog event\", \"data\":\"%{private}@\"}", buf, 0x1Cu);
    }
    PLLogRegisteredEvent();
    CFRelease(v14);
    CFRelease(@"SeparationAlert");
    [(SAPowerLog *)self resetStatistics];
  }
}

- (void)increaseBTScanCount
{
  unint64_t v3 = [(SAPowerLog *)self btScanCount] + 1;
  [(SAPowerLog *)self setBtScanCount:v3];
}

- (void)increaseGeofenceCount
{
  unint64_t v3 = [(SAPowerLog *)self geofenceCount] + 1;
  [(SAPowerLog *)self setGeofenceCount:v3];
}

- (void)increaseGpsLocationRequestCount
{
  unint64_t v3 = [(SAPowerLog *)self gpsLocationRequestCount] + 1;
  [(SAPowerLog *)self setGpsLocationRequestCount:v3];
}

- (void)increaseWifiLocationRequestCount
{
  unint64_t v3 = [(SAPowerLog *)self wifiLocationRequestCount] + 1;
  [(SAPowerLog *)self setWifiLocationRequestCount:v3];
}

- (void)increaseSeparationAlertsCount:(unint64_t)a3
{
  unint64_t v4 = [(SAPowerLog *)self separationAlertsCount] + a3;
  [(SAPowerLog *)self setSeparationAlertsCount:v4];
}

- (void)addMonitoredDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SAPowerLog *)self monitoredDevices];
  [v5 addObject:v4];
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAPowerLog *)self clients];
  [v5 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SAPowerLog *)self clients];
  [v5 removeObject:v4];
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void)setStartTimestamp:(id)a3
{
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (double)totalVisitDuration
{
  return self->_totalVisitDuration;
}

- (void)setTotalVisitDuration:(double)a3
{
  self->_totalVisitDuration = a3;
}

- (unint64_t)btScanCount
{
  return self->_btScanCount;
}

- (void)setBtScanCount:(unint64_t)a3
{
  self->_btScanCount = a3;
}

- (unint64_t)geofenceCount
{
  return self->_geofenceCount;
}

- (void)setGeofenceCount:(unint64_t)a3
{
  self->_geofenceCount = a3;
}

- (unint64_t)gpsLocationRequestCount
{
  return self->_gpsLocationRequestCount;
}

- (void)setGpsLocationRequestCount:(unint64_t)a3
{
  self->_gpsLocationRequestCount = a3;
}

- (unint64_t)wifiLocationRequestCount
{
  return self->_wifiLocationRequestCount;
}

- (void)setWifiLocationRequestCount:(unint64_t)a3
{
  self->_wifiLocationRequestCount = a3;
}

- (unint64_t)separationAlertsCount
{
  return self->_separationAlertsCount;
}

- (void)setSeparationAlertsCount:(unint64_t)a3
{
  self->_separationAlertsCount = a3;
}

- (NSMutableSet)monitoredDevices
{
  return self->_monitoredDevices;
}

- (void)setMonitoredDevices:(id)a3
{
}

- (BOOL)isReplay
{
  return self->_isReplay;
}

- (void)setIsReplay:(BOOL)a3
{
  self->_isReplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredDevices, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end