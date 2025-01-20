@interface SMReceiverSessionStatus
+ (BOOL)supportsSecureCoding;
+ (id)convertSessionStateToString:(int64_t)a3;
- (BOOL)isSOSTrigger;
- (BOOL)isSessionOngoing;
- (BOOL)zoneShareAccepted;
- (NSData)destinationMapItem;
- (NSDate)cacheExpiryDate;
- (NSDate)cacheRequestDate;
- (NSDate)coarseEstimatedEndDate;
- (NSDate)estimatedEndDate;
- (NSDate)lastKeyReleaseInfoRequestDate;
- (NSDate)lastSessionStartInfoRequestDate;
- (NSDate)lastUpdateDate;
- (NSDate)sessionStartDate;
- (NSDate)triggerDate;
- (NSString)receiverHandle;
- (NSUUID)identifier;
- (NSUUID)sessionID;
- (RTLocation)locationOfTrigger;
- (SMHandle)initiatorHandle;
- (SMReceiverSessionStatus)initWithCoder:(id)a3;
- (SMReceiverSessionStatus)initWithIdentifier:(id)a3 sessionID:(id)a4 initiatorHandle:(id)a5;
- (id)description;
- (id)outputToDictionary;
- (int64_t)cacheDownloadError;
- (int64_t)keyReleaseInfoRequestCount;
- (int64_t)lowPowerModeWarningState;
- (int64_t)sessionStartInfoRequestCount;
- (int64_t)sessionState;
- (unint64_t)destinationType;
- (unint64_t)sessionEndReason;
- (unint64_t)sessionType;
- (unint64_t)triggerType;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheDownloadError:(int64_t)a3;
- (void)setCacheExpiryDate:(id)a3;
- (void)setCacheRequestDate:(id)a3;
- (void)setCoarseEstimatedEndDate:(id)a3;
- (void)setDestinationMapItem:(id)a3;
- (void)setDestinationType:(unint64_t)a3;
- (void)setEstimatedEndDate:(id)a3;
- (void)setInitiatorHandle:(id)a3;
- (void)setIsSOSTrigger:(BOOL)a3;
- (void)setKeyReleaseInfoRequestCount:(int64_t)a3;
- (void)setLastKeyReleaseInfoRequestDate:(id)a3;
- (void)setLastSessionStartInfoRequestDate:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setLocationOfTrigger:(id)a3;
- (void)setLowPowerModeWarningState:(int64_t)a3;
- (void)setReceiverHandle:(id)a3;
- (void)setSessionEndReason:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setSessionStartInfoRequestCount:(int64_t)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setTriggerDate:(id)a3;
- (void)setTriggerType:(unint64_t)a3;
- (void)setZoneShareAccepted:(BOOL)a3;
@end

@implementation SMReceiverSessionStatus

- (SMReceiverSessionStatus)initWithIdentifier:(id)a3 sessionID:(id)a4 initiatorHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: sessionID";
LABEL_15:
    _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: initiatorHandle";
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)SMReceiverSessionStatus;
  v12 = [(SMReceiverSessionStatus *)&v21 init];
  if (v12)
  {
    if (v8)
    {
      v13 = (NSUUID *)v8;
    }
    else
    {
      v13 = [MEMORY[0x263F08C38] UUID];
    }
    identifier = v12->_identifier;
    v12->_identifier = v13;

    uint64_t v18 = [MEMORY[0x263EFF910] now];
    lastUpdateDate = v12->_lastUpdateDate;
    v12->_lastUpdateDate = (NSDate *)v18;

    objc_storeStrong((id *)&v12->_sessionID, a4);
    objc_storeStrong((id *)&v12->_initiatorHandle, a5);
    *(_WORD *)&v12->_zoneShareAccepted = 0;
    v12->_destinationType = 0;
    v12->_triggerType = 0;
    v12->_sessionState = 0;
    v12->_sessionType = 0;
    v12->_lowPowerModeWarningState = 0;
    v12->_cacheDownloadError = 0;
  }
  self = v12;
  v16 = self;
LABEL_13:

  return v16;
}

+ (id)convertSessionStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return @"Unknown";
  }
  else {
    return off_2654997F0[a3 - 1];
  }
}

- (BOOL)isSessionOngoing
{
  unint64_t v2 = [(SMReceiverSessionStatus *)self sessionState];
  return (v2 < 0xA) & (0x39Cu >> v2);
}

- (id)outputToDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(SMReceiverSessionStatus *)self identifier];
  [v3 setObject:v4 forKey:@"identifier"];

  v5 = NSNumber;
  v6 = [(SMReceiverSessionStatus *)self lastUpdateDate];
  [v6 timeIntervalSince1970];
  v7 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"lastUpdateDate"];

  id v8 = [(SMReceiverSessionStatus *)self sessionID];
  [v3 setObject:v8 forKey:@"sessionID"];

  id v9 = [(SMReceiverSessionStatus *)self initiatorHandle];
  id v10 = [v9 primaryHandle];
  [v3 setObject:v10 forKey:@"initiatorHandle"];

  v11 = [(SMReceiverSessionStatus *)self receiverHandle];

  if (v11)
  {
    v12 = [(SMReceiverSessionStatus *)self receiverHandle];
    [v3 setObject:v12 forKey:@"receiverHandle"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMReceiverSessionStatus sessionState](self, "sessionState"));
  [v3 setObject:v13 forKey:@"sessionState"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SMReceiverSessionStatus zoneShareAccepted](self, "zoneShareAccepted"));
  [v3 setObject:v14 forKey:@"zoneShareAccepted"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMReceiverSessionStatus sessionType](self, "sessionType"));
  [v3 setObject:v15 forKey:@"sessionType"];

  v16 = [(SMReceiverSessionStatus *)self sessionStartDate];

  if (v16)
  {
    v17 = [(SMReceiverSessionStatus *)self sessionStartDate];
    [v3 setObject:v17 forKey:@"sessionStartDate"];
  }
  uint64_t v18 = [(SMReceiverSessionStatus *)self estimatedEndDate];

  if (v18)
  {
    v19 = [(SMReceiverSessionStatus *)self estimatedEndDate];
    [v3 setObject:v19 forKey:@"estimatedEndDate"];
  }
  v20 = [(SMReceiverSessionStatus *)self coarseEstimatedEndDate];

  if (v20)
  {
    objc_super v21 = [(SMReceiverSessionStatus *)self coarseEstimatedEndDate];
    [v3 setObject:v21 forKey:@"coarseEstimatedEndDate"];
  }
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMReceiverSessionStatus destinationType](self, "destinationType"));
  [v3 setObject:v22 forKey:@"destinationType"];

  v23 = [(SMReceiverSessionStatus *)self destinationMapItem];

  if (v23)
  {
    v24 = [(SMReceiverSessionStatus *)self destinationMapItem];
    v25 = [v24 base64EncodedStringWithOptions:0];
    [v3 setObject:v25 forKey:@"destinationMapItem"];
  }
  v26 = [(SMReceiverSessionStatus *)self triggerDate];

  if (v26)
  {
    v27 = [(SMReceiverSessionStatus *)self triggerDate];
    [v3 setObject:v27 forKey:@"triggerDate"];
  }
  v28 = [(SMReceiverSessionStatus *)self locationOfTrigger];

  if (v28)
  {
    v29 = [(SMReceiverSessionStatus *)self locationOfTrigger];
    [v3 setObject:v29 forKey:@"locationOfTrigger"];
  }
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMReceiverSessionStatus triggerType](self, "triggerType"));
  [v3 setObject:v30 forKey:@"triggerType"];

  v31 = [(SMReceiverSessionStatus *)self cacheRequestDate];

  if (v31)
  {
    v32 = [(SMReceiverSessionStatus *)self cacheRequestDate];
    [v3 setObject:v32 forKey:@"cacheRequestDate"];
  }
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMReceiverSessionStatus sessionEndReason](self, "sessionEndReason"));
  [v3 setObject:v33 forKey:@"sessionEndReason"];

  v34 = [(SMReceiverSessionStatus *)self cacheExpiryDate];

  if (v34)
  {
    v35 = [(SMReceiverSessionStatus *)self cacheExpiryDate];
    [v3 setObject:v35 forKey:@"cacheExpiryDate"];
  }
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[SMReceiverSessionStatus isSOSTrigger](self, "isSOSTrigger"));
  [v3 setObject:v36 forKey:@"isSOSTrigger"];

  v37 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMReceiverSessionStatus lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  [v3 setObject:v37 forKey:@"lowPowerModeWarningState"];

  v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMReceiverSessionStatus cacheDownloadError](self, "cacheDownloadError"));
  [v3 setObject:v38 forKey:@"cacheDownloadError"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[SMReceiverSessionStatus encodeWithCoder:]";
      __int16 v21 = 1024;
      int v22 = 192;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }
  }
  v6 = [(SMReceiverSessionStatus *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(SMReceiverSessionStatus *)self lastUpdateDate];
  [v4 encodeObject:v7 forKey:@"lastUpdateDate"];

  id v8 = [(SMReceiverSessionStatus *)self sessionID];
  [v4 encodeObject:v8 forKey:@"sessionID"];

  id v9 = [(SMReceiverSessionStatus *)self initiatorHandle];
  [v4 encodeObject:v9 forKey:@"initiatorHandle"];

  id v10 = [(SMReceiverSessionStatus *)self receiverHandle];
  [v4 encodeObject:v10 forKey:@"receiverHandle"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus sessionState](self, "sessionState"), @"sessionState");
  objc_msgSend(v4, "encodeBool:forKey:", -[SMReceiverSessionStatus zoneShareAccepted](self, "zoneShareAccepted"), @"zoneShareAccepted");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus sessionType](self, "sessionType"), @"sessionType");
  v11 = [(SMReceiverSessionStatus *)self sessionStartDate];
  [v4 encodeObject:v11 forKey:@"sessionStartDate"];

  v12 = [(SMReceiverSessionStatus *)self estimatedEndDate];
  [v4 encodeObject:v12 forKey:@"estimatedEndDate"];

  v13 = [(SMReceiverSessionStatus *)self coarseEstimatedEndDate];
  [v4 encodeObject:v13 forKey:@"coarseEstimatedEndDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus destinationType](self, "destinationType"), @"destinationType");
  v14 = [(SMReceiverSessionStatus *)self destinationMapItem];
  [v4 encodeObject:v14 forKey:@"destinationMapItem"];

  v15 = [(SMReceiverSessionStatus *)self triggerDate];
  [v4 encodeObject:v15 forKey:@"triggerDate"];

  v16 = [(SMReceiverSessionStatus *)self locationOfTrigger];
  [v4 encodeObject:v16 forKey:@"locationOfTrigger"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus triggerType](self, "triggerType"), @"triggerType");
  v17 = [(SMReceiverSessionStatus *)self cacheRequestDate];
  [v4 encodeObject:v17 forKey:@"cacheRequestDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus sessionEndReason](self, "sessionEndReason"), @"sessionEndReason");
  uint64_t v18 = [(SMReceiverSessionStatus *)self cacheExpiryDate];
  [v4 encodeObject:v18 forKey:@"cacheExpiryDate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SMReceiverSessionStatus isSOSTrigger](self, "isSOSTrigger"), @"isSOSTrigger");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus lowPowerModeWarningState](self, "lowPowerModeWarningState"), @"lowPowerModeWarningState");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus cacheDownloadError](self, "cacheDownloadError"), @"cacheDownloadError");
}

- (SMReceiverSessionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initiatorHandle"];
    id v8 = [(SMReceiverSessionStatus *)self initWithIdentifier:v5 sessionID:v6 initiatorHandle:v7];
    if (v8)
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverHandle"];
      [(SMReceiverSessionStatus *)v8 setReceiverHandle:v9];

      id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdateDate"];
      [(SMReceiverSessionStatus *)v8 setLastUpdateDate:v10];

      -[SMReceiverSessionStatus setSessionState:](v8, "setSessionState:", [v4 decodeIntegerForKey:@"sessionState"]);
      -[SMReceiverSessionStatus setZoneShareAccepted:](v8, "setZoneShareAccepted:", [v4 decodeBoolForKey:@"zoneShareAccepted"]);
      -[SMReceiverSessionStatus setSessionType:](v8, "setSessionType:", [v4 decodeIntegerForKey:@"sessionType"]);
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionStartDate"];
      [(SMReceiverSessionStatus *)v8 setSessionStartDate:v11];

      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedEndDate"];
      [(SMReceiverSessionStatus *)v8 setEstimatedEndDate:v12];

      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coarseEstimatedEndDate"];
      [(SMReceiverSessionStatus *)v8 setCoarseEstimatedEndDate:v13];

      -[SMReceiverSessionStatus setDestinationType:](v8, "setDestinationType:", [v4 decodeIntegerForKey:@"destinationType"]);
      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationMapItem"];
      [(SMReceiverSessionStatus *)v8 setDestinationMapItem:v14];

      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerDate"];
      [(SMReceiverSessionStatus *)v8 setTriggerDate:v15];

      v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationOfTrigger"];
      [(SMReceiverSessionStatus *)v8 setLocationOfTrigger:v16];

      -[SMReceiverSessionStatus setTriggerType:](v8, "setTriggerType:", [v4 decodeIntegerForKey:@"triggerType"]);
      v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheRequestDate"];
      [(SMReceiverSessionStatus *)v8 setCacheRequestDate:v17];

      -[SMReceiverSessionStatus setSessionEndReason:](v8, "setSessionEndReason:", [v4 decodeIntegerForKey:@"sessionEndReason"]);
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheExpiryDate"];
      [(SMReceiverSessionStatus *)v8 setCacheExpiryDate:v18];

      -[SMReceiverSessionStatus setIsSOSTrigger:](v8, "setIsSOSTrigger:", [v4 decodeBoolForKey:@"isSOSTrigger"]);
      -[SMReceiverSessionStatus setLowPowerModeWarningState:](v8, "setLowPowerModeWarningState:", [v4 decodeIntegerForKey:@"lowPowerModeWarningState"]);
      -[SMReceiverSessionStatus setCacheDownloadError:](v8, "setCacheDownloadError:", [v4 decodeIntegerForKey:@"cacheDownloadError"]);
    }
    self = v8;

    int v19 = self;
  }
  else
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v22 = 0;
      _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", v22, 2u);
    }

    int v19 = 0;
  }

  return v19;
}

- (id)description
{
  v27 = NSString;
  v35 = [(SMReceiverSessionStatus *)self identifier];
  v31 = [(SMReceiverSessionStatus *)self lastUpdateDate];
  v34 = [v31 stringFromDate];
  v30 = [(SMReceiverSessionStatus *)self sessionID];
  v33 = [v30 UUIDString];
  v24 = [(SMReceiverSessionStatus *)self initiatorHandle];
  uint64_t v23 = [(SMReceiverSessionStatus *)self receiverHandle];
  int64_t v22 = [(SMReceiverSessionStatus *)self sessionState];
  BOOL v20 = [(SMReceiverSessionStatus *)self zoneShareAccepted];
  unint64_t v19 = [(SMReceiverSessionStatus *)self sessionType];
  v29 = [(SMReceiverSessionStatus *)self sessionStartDate];
  v32 = [v29 stringFromDate];
  v26 = [(SMReceiverSessionStatus *)self estimatedEndDate];
  v17 = [v26 stringFromDate];
  v25 = [(SMReceiverSessionStatus *)self coarseEstimatedEndDate];
  v12 = [v25 stringFromDate];
  unint64_t v16 = [(SMReceiverSessionStatus *)self destinationType];
  __int16 v21 = [(SMReceiverSessionStatus *)self destinationMapItem];
  v14 = [v21 base64EncodedStringWithOptions:0];
  uint64_t v18 = [(SMReceiverSessionStatus *)self triggerDate];
  v13 = [v18 stringFromDate];
  id v3 = [(SMReceiverSessionStatus *)self locationOfTrigger];
  unint64_t v4 = [(SMReceiverSessionStatus *)self triggerType];
  v15 = [(SMReceiverSessionStatus *)self cacheRequestDate];
  v5 = [v15 stringFromDate];
  unint64_t v6 = [(SMReceiverSessionStatus *)self sessionEndReason];
  v7 = [(SMReceiverSessionStatus *)self cacheExpiryDate];
  id v8 = [v7 stringFromDate];
  BOOL v9 = [(SMReceiverSessionStatus *)self isSOSTrigger];
  id v10 = +[SMDeviceConfigurationChecker convertLowPowerModeWarningStateToString:[(SMReceiverSessionStatus *)self lowPowerModeWarningState]];
  objc_msgSend(v27, "stringWithFormat:", @"SMReceiverSessionStatus:identifier,%@,lastUpdateDate,%@,sessionID,%@,initiatorHandle,%@,receiverHandle,%@,sessionState,%d,zoneShareAccepted,%d,sessionType,%d,sessionStartDate,%@,estimatedEndDate,%@,coarseEstimatedEndDate,%@,destinationType,%d,destinationMapItem,%@,triggerDate,%@,locationOfTrigger,%@,triggerType,%d,cacheRequestDate,%@,sessionEndReason,%d,cacheExpiryDate,%@,isSOSTrigger,%d, lowPowerModeStateWarning,%@, cacheDownloadError,%d", v35, v34, v33, v24, v23, v22, v20, v19, v32, v17, v12, v16, v14, v13, v3, v4,
    v5,
    v6,
    v8,
    v9,
    v10,
  v28 = [(SMReceiverSessionStatus *)self cacheDownloadError]);

  return v28;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (SMHandle)initiatorHandle
{
  return self->_initiatorHandle;
}

- (void)setInitiatorHandle:(id)a3
{
}

- (NSString)receiverHandle
{
  return self->_receiverHandle;
}

- (void)setReceiverHandle:(id)a3
{
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  self->_sessionState = a3;
}

- (BOOL)zoneShareAccepted
{
  return self->_zoneShareAccepted;
}

- (void)setZoneShareAccepted:(BOOL)a3
{
  self->_zoneShareAccepted = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (void)setEstimatedEndDate:(id)a3
{
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (void)setCoarseEstimatedEndDate:(id)a3
{
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(unint64_t)a3
{
  self->_destinationType = a3;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
}

- (RTLocation)locationOfTrigger
{
  return self->_locationOfTrigger;
}

- (void)setLocationOfTrigger:(id)a3
{
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(unint64_t)a3
{
  self->_triggerType = a3;
}

- (NSDate)cacheRequestDate
{
  return self->_cacheRequestDate;
}

- (void)setCacheRequestDate:(id)a3
{
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (void)setSessionEndReason:(unint64_t)a3
{
  self->_sessionEndReason = a3;
}

- (NSDate)cacheExpiryDate
{
  return self->_cacheExpiryDate;
}

- (void)setCacheExpiryDate:(id)a3
{
}

- (NSDate)lastSessionStartInfoRequestDate
{
  return self->_lastSessionStartInfoRequestDate;
}

- (void)setLastSessionStartInfoRequestDate:(id)a3
{
}

- (int64_t)sessionStartInfoRequestCount
{
  return self->_sessionStartInfoRequestCount;
}

- (void)setSessionStartInfoRequestCount:(int64_t)a3
{
  self->_sessionStartInfoRequestCount = a3;
}

- (NSDate)lastKeyReleaseInfoRequestDate
{
  return self->_lastKeyReleaseInfoRequestDate;
}

- (void)setLastKeyReleaseInfoRequestDate:(id)a3
{
}

- (int64_t)keyReleaseInfoRequestCount
{
  return self->_keyReleaseInfoRequestCount;
}

- (void)setKeyReleaseInfoRequestCount:(int64_t)a3
{
  self->_keyReleaseInfoRequestCount = a3;
}

- (BOOL)isSOSTrigger
{
  return self->_isSOSTrigger;
}

- (void)setIsSOSTrigger:(BOOL)a3
{
  self->_isSOSTrigger = a3;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

- (void)setLowPowerModeWarningState:(int64_t)a3
{
  self->_lowPowerModeWarningState = a3;
}

- (int64_t)cacheDownloadError
{
  return self->_cacheDownloadError;
}

- (void)setCacheDownloadError:(int64_t)a3
{
  self->_cacheDownloadError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKeyReleaseInfoRequestDate, 0);
  objc_storeStrong((id *)&self->_lastSessionStartInfoRequestDate, 0);
  objc_storeStrong((id *)&self->_cacheExpiryDate, 0);
  objc_storeStrong((id *)&self->_cacheRequestDate, 0);
  objc_storeStrong((id *)&self->_locationOfTrigger, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_receiverHandle, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end