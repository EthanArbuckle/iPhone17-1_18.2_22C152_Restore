@interface SASingleDeviceRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSurfacedNotification;
- (BOOL)isConnected;
- (CLCircularRegion)lastWithYouLocation;
- (NSDate)currentScenarioTime;
- (NSDate)firstAdvertisementAfterScenarioTransition;
- (NSDate)lastCompanionDisconnectionDate;
- (NSDate)lastWithYouDate;
- (NSDate)latestCaseAdvertisementDate;
- (NSMutableArray)uuidsOfRelatedDevices;
- (NSUUID)uuid;
- (SAAnalyticsServiceProtocol)analytics;
- (SADevice)device;
- (SASingleDeviceRecord)initWithCoder:(id)a3;
- (SASingleDeviceRecord)initWithConnectionEvent:(id)a3 clock:(id)a4 analytics:(id)a5;
- (SASingleDeviceRecord)initWithDevice:(id)a3 clock:(id)a4 analytics:(id)a5;
- (SATimeServiceProtocol)clock;
- (TASPAdvertisement)latestAdvertisement;
- (TASPAdvertisement)latestNOAdvertisement;
- (TASPAdvertisement)latestWildAdvertisement;
- (int64_t)connectionState;
- (unint64_t)currentMonitoringSessionState;
- (unint64_t)currentScenarioClass;
- (unint64_t)monitoringSessionStateAtTimeOfFirstAdv;
- (unint64_t)notificationState;
- (unint64_t)withYouStatus;
- (void)encodeWithCoder:(id)a3;
- (void)insertRelatedDevice:(id)a3;
- (void)publishAnalyticsForFirstAdv:(id)a3 scenario:(unint64_t)a4;
- (void)resetRelatedDevices;
- (void)setAnalytics:(id)a3;
- (void)setClock:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setCurrentMonitoringSessionState:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setHasSurfacedNotification:(BOOL)a3;
- (void)setLastWithYouLocation:(id)a3;
- (void)setNotificationState:(unint64_t)a3;
- (void)setUuidsOfRelatedDevices:(id)a3;
- (void)setWithYouStatus:(unint64_t)a3;
- (void)updateCurrentScenarioClass:(unint64_t)a3;
- (void)updateFirstAdvertisementAfterScenarioTransition:(id)a3;
- (void)updateLastCompanionDisconnectionDate:(id)a3;
- (void)updateLastWithYouDate:(id)a3;
- (void)updateLatestAdvertisement:(id)a3;
- (void)updateLatestCaseAdvertisementDate:(id)a3;
- (void)updateWithYouStatus:(unint64_t)a3;
@end

@implementation SASingleDeviceRecord

- (SASingleDeviceRecord)initWithDevice:(id)a3 clock:(id)a4 analytics:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SASingleDeviceRecord;
  v12 = [(SASingleDeviceRecord *)&v27 init];
  v13 = v12;
  if (v12)
  {
    if (!v9)
    {
      v25 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_clock, a4);
    objc_storeStrong((id *)&v13->_analytics, a5);
    v14 = [v9 identifier];
    uint64_t v15 = [v14 copy];
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v15;

    objc_storeStrong((id *)&v13->_device, a3);
    latestAdvertisement = v13->_latestAdvertisement;
    *(_OWORD *)&v13->_withYouStatus = 0u;
    *(_OWORD *)&v13->_notificationState = 0u;

    latestCaseAdvertisementDate = v13->_latestCaseAdvertisementDate;
    v13->_latestCaseAdvertisementDate = 0;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uuidsOfRelatedDevices = v13->_uuidsOfRelatedDevices;
    v13->_uuidsOfRelatedDevices = v19;

    v13->_hasSurfacedNotification = 0;
    firstAdvertisementAfterScenarioTransition = v13->_firstAdvertisementAfterScenarioTransition;
    v13->_firstAdvertisementAfterScenarioTransition = 0;

    uint64_t v22 = [(SATimeServiceProtocol *)v13->_clock getCurrentTime];
    currentScenarioTime = v13->_currentScenarioTime;
    v13->_currentScenarioTime = (NSDate *)v22;

    lastCompanionDisconnectionDate = v13->_lastCompanionDisconnectionDate;
    v13->_lastCompanionDisconnectionDate = 0;
  }
  v25 = v13;
LABEL_6:

  return v25;
}

- (SASingleDeviceRecord)initWithConnectionEvent:(id)a3 clock:(id)a4 analytics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SASingleDeviceRecord;
  id v11 = [(SASingleDeviceRecord *)&v31 init];
  v12 = v11;
  if (!v11)
  {
LABEL_12:
    v18 = v12;
    goto LABEL_13;
  }
  if (v8)
  {
    objc_storeStrong((id *)&v11->_clock, a4);
    objc_storeStrong((id *)&v12->_analytics, a5);
    v13 = [v8 identifier];
    uint64_t v14 = [v13 copy];
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v14;

    device = v12->_device;
    v12->_device = 0;

    BOOL v17 = [v8 state] == 2 || objc_msgSend(v8, "state") == 3;
    v12->_withYouStatus = v17;
    v12->_connectionState = [v8 state];
    v12->_notificationState = 0;
    latestAdvertisement = v12->_latestAdvertisement;
    v12->_latestAdvertisement = 0;

    latestNOAdvertisement = v12->_latestNOAdvertisement;
    v12->_latestNOAdvertisement = 0;

    latestWildAdvertisement = v12->_latestWildAdvertisement;
    v12->_latestWildAdvertisement = 0;

    latestCaseAdvertisementDate = v12->_latestCaseAdvertisementDate;
    v12->_latestCaseAdvertisementDate = 0;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uuidsOfRelatedDevices = v12->_uuidsOfRelatedDevices;
    v12->_uuidsOfRelatedDevices = v23;

    v12->_hasSurfacedNotification = 0;
    uint64_t v25 = [(SATimeServiceProtocol *)v12->_clock getCurrentTime];
    currentScenarioTime = v12->_currentScenarioTime;
    v12->_currentScenarioTime = (NSDate *)v25;

    if ([v8 state] && objc_msgSend(v8, "state") != 1)
    {
      lastCompanionDisconnectionDate = v12->_lastCompanionDisconnectionDate;
      v12->_lastCompanionDisconnectionDate = 0;
    }
    else
    {
      uint64_t v27 = [(SATimeServiceProtocol *)v12->_clock getCurrentTime];
      lastCompanionDisconnectionDate = v12->_lastCompanionDisconnectionDate;
      v12->_lastCompanionDisconnectionDate = (NSDate *)v27;
    }

    lastWithYouLocation = v12->_lastWithYouLocation;
    v12->_lastWithYouLocation = 0;

    goto LABEL_12;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (void)updateLatestAdvertisement:(id)a3
{
  id v20 = a3;
  v5 = [v20 getDate];
  [(SASingleDeviceRecord *)self updateFirstAdvertisementAfterScenarioTransition:v5];

  p_latestAdvertisement = &self->_latestAdvertisement;
  if (!self->_latestAdvertisement)
  {
    objc_storeStrong((id *)&self->_latestAdvertisement, a3);
    if ([v20 getType] == 1)
    {
      p_latestAdvertisement = &self->_latestNOAdvertisement;
    }
    else
    {
      if ([v20 getType] != 2) {
        goto LABEL_17;
      }
      p_latestAdvertisement = &self->_latestWildAdvertisement;
    }
    goto LABEL_16;
  }
  if ([v20 getType] == 1)
  {
    latestNOAdvertisement = self->_latestNOAdvertisement;
    if (!latestNOAdvertisement
      || ([(TASPAdvertisement *)latestNOAdvertisement scanDate],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v20 scanDate],
          id v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v8 compare:v9],
          v9,
          v8,
          v10 == -1))
    {
      objc_storeStrong((id *)&self->_latestNOAdvertisement, a3);
    }
  }
  if ([v20 getType] == 2)
  {
    latestWildAdvertisement = self->_latestWildAdvertisement;
    p_latestWildAdvertisement = &self->_latestWildAdvertisement;
    id v11 = latestWildAdvertisement;
    if (!latestWildAdvertisement
      || ([(TASPAdvertisement *)v11 scanDate],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          [v20 scanDate],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v14 compare:v15],
          v15,
          v14,
          v16 == -1))
    {
      objc_storeStrong((id *)p_latestWildAdvertisement, a3);
    }
  }
  BOOL v17 = [(TASPAdvertisement *)*p_latestAdvertisement scanDate];
  v18 = [v20 scanDate];
  uint64_t v19 = [v17 compare:v18];

  if (v19 == -1) {
LABEL_16:
  }
    objc_storeStrong((id *)p_latestAdvertisement, a3);
LABEL_17:
}

- (void)updateLatestCaseAdvertisementDate:(id)a3
{
  id v5 = a3;
  latestCaseAdvertisementDate = self->_latestCaseAdvertisementDate;
  p_latestCaseAdvertisementDate = &self->_latestCaseAdvertisementDate;
  v6 = latestCaseAdvertisementDate;
  id v9 = v5;
  if (!latestCaseAdvertisementDate)
  {
    objc_storeStrong((id *)p_latestCaseAdvertisementDate, a3);
    id v5 = v9;
    v6 = *p_latestCaseAdvertisementDate;
  }
  if ([(NSDate *)v6 compare:v5] == NSOrderedAscending) {
    objc_storeStrong((id *)p_latestCaseAdvertisementDate, a3);
  }
}

- (void)updateLastWithYouDate:(id)a3
{
  id v5 = a3;
  lastWithYouDate = self->_lastWithYouDate;
  p_lastWithYouDate = &self->_lastWithYouDate;
  v6 = lastWithYouDate;
  if (!lastWithYouDate || [(NSDate *)v6 compare:v5] == NSOrderedAscending) {
    objc_storeStrong((id *)p_lastWithYouDate, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (void)updateLastCompanionDisconnectionDate:(id)a3
{
  id v5 = a3;
  lastCompanionDisconnectionDate = self->_lastCompanionDisconnectionDate;
  p_lastCompanionDisconnectionDate = &self->_lastCompanionDisconnectionDate;
  v6 = lastCompanionDisconnectionDate;
  if (!lastCompanionDisconnectionDate || [(NSDate *)v6 compare:v5] == NSOrderedAscending) {
    objc_storeStrong((id *)p_lastCompanionDisconnectionDate, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (void)updateWithYouStatus:(unint64_t)a3
{
  self->_withYouStatus = a3;
}

- (void)updateFirstAdvertisementAfterScenarioTransition:(id)a3
{
  p_firstAdvertisementAfterScenarioTransition = (NSDate **)a3;
  v6 = p_firstAdvertisementAfterScenarioTransition;
  if (p_firstAdvertisementAfterScenarioTransition)
  {
    if (self->_currentScenarioTime)
    {
      id v8 = p_firstAdvertisementAfterScenarioTransition;
      p_firstAdvertisementAfterScenarioTransition = (NSDate **)objc_msgSend(p_firstAdvertisementAfterScenarioTransition, "timeIntervalSinceDate:");
      v6 = v8;
      if (self->_currentScenarioClass)
      {
        p_firstAdvertisementAfterScenarioTransition = &self->_firstAdvertisementAfterScenarioTransition;
        if (!self->_firstAdvertisementAfterScenarioTransition && v7 > 0.0)
        {
          self->_monitoringSessionStateAtTimeOfFirstAdv = self->_currentMonitoringSessionState;
          objc_storeStrong((id *)p_firstAdvertisementAfterScenarioTransition, a3);
          v6 = v8;
        }
      }
    }
  }
  MEMORY[0x1F41817F8](p_firstAdvertisementAfterScenarioTransition, v6);
}

- (void)updateCurrentScenarioClass:(unint64_t)a3
{
  id v5 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
  if (a3 && self->_currentScenarioClass && self->_firstAdvertisementAfterScenarioTransition) {
    [(SASingleDeviceRecord *)self publishAnalyticsForFirstAdv:v5 scenario:a3];
  }
  firstAdvertisementAfterScenarioTransition = self->_firstAdvertisementAfterScenarioTransition;
  self->_firstAdvertisementAfterScenarioTransition = 0;

  currentScenarioTime = self->_currentScenarioTime;
  self->_currentScenarioTime = v5;

  self->_currentScenarioClass = a3;
}

- (void)publishAnalyticsForFirstAdv:(id)a3 scenario:(unint64_t)a4
{
  v21[5] = *MEMORY[0x1E4F143B8];
  firstAdvertisementAfterScenarioTransition = self->_firstAdvertisementAfterScenarioTransition;
  currentScenarioTime = self->_currentScenarioTime;
  id v8 = a3;
  [(NSDate *)firstAdvertisementAfterScenarioTransition timeIntervalSinceDate:currentScenarioTime];
  double v10 = v9;
  [v8 timeIntervalSinceDate:self->_firstAdvertisementAfterScenarioTransition];
  double v12 = v11;

  v20[0] = @"currentScenario";
  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASingleDeviceRecord currentScenarioClass](self, "currentScenarioClass"));
  v21[0] = v13;
  v20[1] = @"firstDetectedToNextScenarioTimeInterval";
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
  v21[1] = v14;
  v20[2] = @"nextScenario";
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v21[2] = v15;
  v20[3] = @"previousMonitoringState";
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASingleDeviceRecord monitoringSessionStateAtTimeOfFirstAdv](self, "monitoringSessionStateAtTimeOfFirstAdv"));
  v21[3] = v16;
  v20[4] = @"scenarioChangeToFirstDetectedTimeInterval";
  BOOL v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
  v21[4] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];

  uint64_t v19 = [(SASingleDeviceRecord *)self analytics];
  [v19 submitEvent:@"com.apple.clx.alert.firstAdv" content:v18];
}

- (void)resetRelatedDevices
{
}

- (void)insertRelatedDevice:(id)a3
{
}

- (BOOL)isConnected
{
  return [(SASingleDeviceRecord *)self connectionState] == 2
      || [(SASingleDeviceRecord *)self connectionState] == 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASingleDeviceRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SASingleDeviceRecord;
  id v5 = [(SASingleDeviceRecord *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Device"];
    device = v5->_device;
    v5->_device = (SADevice *)v8;

    v5->_withYouStatus = [v4 decodeIntegerForKey:@"WithYouStatus"];
    v5->_connectionState = [v4 decodeIntegerForKey:@"ConnectionState"];
    v5->_notificationState = [v4 decodeIntegerForKey:@"NotificationState"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatestAdvertisement"];
    latestAdvertisement = v5->_latestAdvertisement;
    v5->_latestAdvertisement = (TASPAdvertisement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastWithYouDate"];
    lastWithYouDate = v5->_lastWithYouDate;
    v5->_lastWithYouDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelatedDevices"];
    uuidsOfRelatedDevices = v5->_uuidsOfRelatedDevices;
    v5->_uuidsOfRelatedDevices = (NSMutableArray *)v14;

    v5->_hasSurfacedNotification = [v4 decodeBoolForKey:@"Surfaced"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstAdvertisement"];
    firstAdvertisementAfterScenarioTransition = v5->_firstAdvertisementAfterScenarioTransition;
    v5->_firstAdvertisementAfterScenarioTransition = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentScenarioTime"];
    currentScenarioTime = v5->_currentScenarioTime;
    v5->_currentScenarioTime = (NSDate *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"UUID"];
  [v5 encodeObject:self->_device forKey:@"Device"];
  [v5 encodeInteger:self->_withYouStatus forKey:@"WithYouStatus"];
  [v5 encodeInteger:self->_connectionState forKey:@"ConnectionState"];
  [v5 encodeInteger:self->_notificationState forKey:@"NotificationState"];
  [v5 encodeObject:self->_latestAdvertisement forKey:@"LatestAdvertisement"];
  [v5 encodeObject:self->_lastWithYouDate forKey:@"LastWithYouDate"];
  [v5 encodeObject:self->_uuidsOfRelatedDevices forKey:@"RelatedDevices"];
  [v5 encodeBool:self->_hasSurfacedNotification forKey:@"Surfaced"];
  [v5 encodeObject:self->_firstAdvertisementAfterScenarioTransition forKey:@"FirstAdvertisement"];
  [v5 encodeObject:self->_currentScenarioTime forKey:@"CurrentScenarioTime"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (SADevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (unint64_t)withYouStatus
{
  return self->_withYouStatus;
}

- (void)setWithYouStatus:(unint64_t)a3
{
  self->_withYouStatus = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (void)setNotificationState:(unint64_t)a3
{
  self->_notificationState = a3;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (TASPAdvertisement)latestNOAdvertisement
{
  return self->_latestNOAdvertisement;
}

- (TASPAdvertisement)latestWildAdvertisement
{
  return self->_latestWildAdvertisement;
}

- (NSDate)latestCaseAdvertisementDate
{
  return self->_latestCaseAdvertisementDate;
}

- (NSDate)lastWithYouDate
{
  return self->_lastWithYouDate;
}

- (NSDate)lastCompanionDisconnectionDate
{
  return self->_lastCompanionDisconnectionDate;
}

- (unint64_t)currentScenarioClass
{
  return self->_currentScenarioClass;
}

- (unint64_t)currentMonitoringSessionState
{
  return self->_currentMonitoringSessionState;
}

- (void)setCurrentMonitoringSessionState:(unint64_t)a3
{
  self->_currentMonitoringSessionState = a3;
}

- (unint64_t)monitoringSessionStateAtTimeOfFirstAdv
{
  return self->_monitoringSessionStateAtTimeOfFirstAdv;
}

- (NSMutableArray)uuidsOfRelatedDevices
{
  return self->_uuidsOfRelatedDevices;
}

- (void)setUuidsOfRelatedDevices:(id)a3
{
}

- (BOOL)hasSurfacedNotification
{
  return self->_hasSurfacedNotification;
}

- (void)setHasSurfacedNotification:(BOOL)a3
{
  self->_hasSurfacedNotification = a3;
}

- (NSDate)firstAdvertisementAfterScenarioTransition
{
  return self->_firstAdvertisementAfterScenarioTransition;
}

- (NSDate)currentScenarioTime
{
  return self->_currentScenarioTime;
}

- (CLCircularRegion)lastWithYouLocation
{
  return self->_lastWithYouLocation;
}

- (void)setLastWithYouLocation:(id)a3
{
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
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
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_lastWithYouLocation, 0);
  objc_storeStrong((id *)&self->_currentScenarioTime, 0);
  objc_storeStrong((id *)&self->_firstAdvertisementAfterScenarioTransition, 0);
  objc_storeStrong((id *)&self->_uuidsOfRelatedDevices, 0);
  objc_storeStrong((id *)&self->_lastCompanionDisconnectionDate, 0);
  objc_storeStrong((id *)&self->_lastWithYouDate, 0);
  objc_storeStrong((id *)&self->_latestCaseAdvertisementDate, 0);
  objc_storeStrong((id *)&self->_latestWildAdvertisement, 0);
  objc_storeStrong((id *)&self->_latestNOAdvertisement, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end