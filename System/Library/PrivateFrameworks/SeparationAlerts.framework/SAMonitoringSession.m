@interface SAMonitoringSession
+ (BOOL)supportsSecureCoding;
- (BOOL)earlyAirplaneTrigger;
- (BOOL)earlyVehicularTrigger;
- (BOOL)isEqual:(id)a3;
- (CLCircularRegion)geofence;
- (CLLocation)caSeparationLocation;
- (NSDate)caLastStateTransition;
- (NSDate)earlyVehicularStateChangeDate;
- (NSDate)lastAlertDateInCurrentTravelingSession;
- (NSDate)trackedTravelingStartDate;
- (NSDate)travelingGeofenceExitDate;
- (NSUUID)deviceUUID;
- (SAMonitoringSession)initWithCoder:(id)a3;
- (SAMonitoringSession)initWithDeviceUUID:(id)a3 state:(unint64_t)a4 geofence:(id)a5 scenario:(unint64_t)a6 trackedTravelingStartDate:(id)a7;
- (SAScenarioClassifier)scenarioClassifier;
- (TALocationLite)firstNotWithYouLocation;
- (TALocationLite)trackedTravelingStartLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)scenario;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setCaLastStateTransition:(id)a3;
- (void)setCaSeparationLocation:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setEarlyAirplaneTrigger:(BOOL)a3;
- (void)setEarlyVehicularStateChangeDate:(id)a3;
- (void)setEarlyVehicularTrigger:(BOOL)a3;
- (void)setFirstNotWithYouLocation:(id)a3;
- (void)setGeofence:(id)a3;
- (void)setLastAlertDateInCurrentTravelingSession:(id)a3;
- (void)setScenario:(unint64_t)a3;
- (void)setScenarioClassifier:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTrackedTravelingStartDate:(id)a3;
- (void)setTrackedTravelingStartLocation:(id)a3;
- (void)setTravelingGeofenceExitDate:(id)a3;
@end

@implementation SAMonitoringSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAMonitoringSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SAMonitoringSessionIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"SAMonitoringSessionState"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SAMonitoringSessionGeofence"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"SAMonitoringSessionScenario"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SAMonitoringSessionTrackedTravelingStartDate"];

  v10 = [(SAMonitoringSession *)self initWithDeviceUUID:v5 state:v6 geofence:v7 scenario:v8 trackedTravelingStartDate:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SAMonitoringSession *)self deviceUUID];
  [v4 encodeObject:v5 forKey:@"SAMonitoringSessionIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAMonitoringSession state](self, "state"), @"SAMonitoringSessionState");
  uint64_t v6 = [(SAMonitoringSession *)self geofence];
  [v4 encodeObject:v6 forKey:@"SAMonitoringSessionGeofence"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAMonitoringSession scenario](self, "scenario"), @"SAMonitoringSessionScenario");
  id v7 = [(SAMonitoringSession *)self trackedTravelingStartDate];
  [v4 encodeObject:v7 forKey:@"SAMonitoringSessionTrackedTravelingStartDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SAMonitoringSession allocWithZone:a3];
  v5 = [(SAMonitoringSession *)self deviceUUID];
  unint64_t v6 = [(SAMonitoringSession *)self state];
  id v7 = [(SAMonitoringSession *)self geofence];
  unint64_t v8 = [(SAMonitoringSession *)self scenario];
  v9 = [(SAMonitoringSession *)self trackedTravelingStartDate];
  v10 = [(SAMonitoringSession *)v4 initWithDeviceUUID:v5 state:v6 geofence:v7 scenario:v8 trackedTravelingStartDate:v9];

  return v10;
}

- (SAMonitoringSession)initWithDeviceUUID:(id)a3 state:(unint64_t)a4 geofence:(id)a5 scenario:(unint64_t)a6 trackedTravelingStartDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SAMonitoringSession;
  v15 = [(SAMonitoringSession *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    deviceUUID = v15->_deviceUUID;
    v15->_deviceUUID = (NSUUID *)v16;

    v15->_state = a4;
    uint64_t v18 = [v13 copy];
    geofence = v15->_geofence;
    v15->_geofence = (CLCircularRegion *)v18;

    v15->_scenario = a6;
    uint64_t v20 = [v14 copy];
    trackedTravelingStartDate = v15->_trackedTravelingStartDate;
    v15->_trackedTravelingStartDate = (NSDate *)v20;

    trackedTravelingStartLocation = v15->_trackedTravelingStartLocation;
    v15->_trackedTravelingStartLocation = 0;

    travelingGeofenceExitDate = v15->_travelingGeofenceExitDate;
    v15->_travelingGeofenceExitDate = 0;

    firstNotWithYouLocation = v15->_firstNotWithYouLocation;
    v15->_firstNotWithYouLocation = 0;

    earlyVehicularStateChangeDate = v15->_earlyVehicularStateChangeDate;
    v15->_earlyVehicularStateChangeDate = 0;

    v26 = [[SAScenarioClassifier alloc] initWithDeviceUuid:v15->_deviceUUID scenarioClass:a6 unsafeLocation:0];
    scenarioClassifier = v15->_scenarioClassifier;
    v15->_scenarioClassifier = v26;

    *(_WORD *)&v15->_earlyVehicularTrigger = 0;
    lastAlertDateInCurrentTravelingSession = v15->_lastAlertDateInCurrentTravelingSession;
    v15->_lastAlertDateInCurrentTravelingSession = 0;
  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SAMonitoringSession *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      unint64_t v8 = [(SAMonitoringSession *)self deviceUUID];
      v9 = [(SAMonitoringSession *)v7 deviceUUID];
      if (v8 != v9)
      {
        v3 = [(SAMonitoringSession *)self deviceUUID];
        id v4 = [(SAMonitoringSession *)v7 deviceUUID];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_30;
        }
      }
      unint64_t v11 = [(SAMonitoringSession *)self state];
      if (v11 != [(SAMonitoringSession *)v7 state])
      {
        char v10 = 0;
        goto LABEL_29;
      }
      id v12 = [(SAMonitoringSession *)self geofence];
      id v13 = [(SAMonitoringSession *)v7 geofence];
      if (v12 != v13)
      {
        id v14 = [(SAMonitoringSession *)self geofence];
        v37 = [(SAMonitoringSession *)v7 geofence];
        if (!objc_msgSend(v14, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_27;
        }
        v36 = v14;
      }
      unint64_t v15 = [(SAMonitoringSession *)self scenario];
      if (v15 != [(SAMonitoringSession *)v7 scenario])
      {
        char v10 = 0;
        id v14 = v36;
        if (v12 == v13) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      uint64_t v16 = [(SAMonitoringSession *)self trackedTravelingStartDate];
      uint64_t v17 = [(SAMonitoringSession *)v7 trackedTravelingStartDate];
      uint64_t v18 = v16;
      BOOL v19 = v16 == v17;
      id v14 = v36;
      v32 = (void *)v17;
      v33 = (void *)v18;
      v34 = v13;
      v35 = v12;
      if (!v19)
      {
        v28 = v3;
        uint64_t v20 = [(SAMonitoringSession *)self trackedTravelingStartDate];
        objc_super v30 = [(SAMonitoringSession *)v7 trackedTravelingStartDate];
        v31 = v20;
        if (!objc_msgSend(v20, "isEqual:"))
        {
          char v10 = 0;
          v26 = v32;
          v25 = v33;
          v3 = v28;
          goto LABEL_25;
        }
        v3 = v28;
      }
      v21 = [(SAMonitoringSession *)self trackedTravelingStartLocation];
      uint64_t v22 = [(SAMonitoringSession *)v7 trackedTravelingStartLocation];
      if (v21 == (void *)v22)
      {

        char v10 = 1;
      }
      else
      {
        v23 = (void *)v22;
        v29 = [(SAMonitoringSession *)self trackedTravelingStartLocation];
        v24 = [(SAMonitoringSession *)v7 trackedTravelingStartLocation];
        char v10 = [v29 isEqual:v24];

        id v14 = v36;
      }
      v26 = v32;
      v25 = v33;
      if (v33 == v32)
      {
LABEL_26:

        id v13 = v34;
        id v12 = v35;
        if (v35 == v34)
        {
LABEL_28:

LABEL_29:
          if (v8 == v9)
          {
LABEL_31:

            goto LABEL_32;
          }
LABEL_30:

          goto LABEL_31;
        }
LABEL_27:

        goto LABEL_28;
      }
LABEL_25:

      goto LABEL_26;
    }
    char v10 = 0;
  }
LABEL_32:

  return v10;
}

- (id)descriptionDictionary
{
  v18[7] = *MEMORY[0x1E4F143B8];
  v17[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v3);
  v18[0] = v16;
  v17[1] = @"SAMonitoringSessionIdentifier";
  unint64_t v15 = [(SAMonitoringSession *)self deviceUUID];
  id v4 = [v15 description];
  v18[1] = v4;
  v17[2] = @"SAMonitoringSessionState";
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAMonitoringSession state](self, "state"));
  v18[2] = v5;
  v17[3] = @"SAMonitoringSessionGeofence";
  unint64_t v6 = [(SAMonitoringSession *)self geofence];
  id v7 = [v6 description];
  v18[3] = v7;
  v17[4] = @"SAMonitoringSessionScenario";
  unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SAMonitoringSession scenario](self, "scenario"));
  v18[4] = v8;
  v17[5] = @"SAMonitoringSessionTrackedTravelingStartDate";
  v9 = [(SAMonitoringSession *)self trackedTravelingStartDate];
  char v10 = [v9 description];
  v18[5] = v10;
  v17[6] = @"SAMonitoringSessionTrackedTravelingStartLocation";
  unint64_t v11 = [(SAMonitoringSession *)self trackedTravelingStartLocation];
  id v12 = [v11 description];
  v18[6] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];

  return v13;
}

- (id)description
{
  v3 = [(SAMonitoringSession *)self descriptionDictionary];
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    unint64_t v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      [(SAConnectionEvent *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  unint64_t v8 = v7;

  return v8;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (CLCircularRegion)geofence
{
  return self->_geofence;
}

- (void)setGeofence:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)scenario
{
  return self->_scenario;
}

- (void)setScenario:(unint64_t)a3
{
  self->_scenario = a3;
}

- (NSDate)trackedTravelingStartDate
{
  return self->_trackedTravelingStartDate;
}

- (void)setTrackedTravelingStartDate:(id)a3
{
}

- (NSDate)travelingGeofenceExitDate
{
  return self->_travelingGeofenceExitDate;
}

- (void)setTravelingGeofenceExitDate:(id)a3
{
}

- (NSDate)earlyVehicularStateChangeDate
{
  return self->_earlyVehicularStateChangeDate;
}

- (void)setEarlyVehicularStateChangeDate:(id)a3
{
}

- (TALocationLite)trackedTravelingStartLocation
{
  return self->_trackedTravelingStartLocation;
}

- (void)setTrackedTravelingStartLocation:(id)a3
{
}

- (TALocationLite)firstNotWithYouLocation
{
  return self->_firstNotWithYouLocation;
}

- (void)setFirstNotWithYouLocation:(id)a3
{
}

- (SAScenarioClassifier)scenarioClassifier
{
  return self->_scenarioClassifier;
}

- (void)setScenarioClassifier:(id)a3
{
}

- (BOOL)earlyVehicularTrigger
{
  return self->_earlyVehicularTrigger;
}

- (void)setEarlyVehicularTrigger:(BOOL)a3
{
  self->_earlyVehicularTrigger = a3;
}

- (BOOL)earlyAirplaneTrigger
{
  return self->_earlyAirplaneTrigger;
}

- (void)setEarlyAirplaneTrigger:(BOOL)a3
{
  self->_earlyAirplaneTrigger = a3;
}

- (NSDate)lastAlertDateInCurrentTravelingSession
{
  return self->_lastAlertDateInCurrentTravelingSession;
}

- (void)setLastAlertDateInCurrentTravelingSession:(id)a3
{
}

- (NSDate)caLastStateTransition
{
  return self->_caLastStateTransition;
}

- (void)setCaLastStateTransition:(id)a3
{
}

- (CLLocation)caSeparationLocation
{
  return self->_caSeparationLocation;
}

- (void)setCaSeparationLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caSeparationLocation, 0);
  objc_storeStrong((id *)&self->_caLastStateTransition, 0);
  objc_storeStrong((id *)&self->_lastAlertDateInCurrentTravelingSession, 0);
  objc_storeStrong((id *)&self->_scenarioClassifier, 0);
  objc_storeStrong((id *)&self->_firstNotWithYouLocation, 0);
  objc_storeStrong((id *)&self->_trackedTravelingStartLocation, 0);
  objc_storeStrong((id *)&self->_earlyVehicularStateChangeDate, 0);
  objc_storeStrong((id *)&self->_travelingGeofenceExitDate, 0);
  objc_storeStrong((id *)&self->_trackedTravelingStartDate, 0);
  objc_storeStrong((id *)&self->_geofence, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
}

@end