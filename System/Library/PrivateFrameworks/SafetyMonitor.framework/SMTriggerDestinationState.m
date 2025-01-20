@interface SMTriggerDestinationState
+ (BOOL)supportsSecureCoding;
+ (id)convertSMDirectionTransportTypeToString:(unint64_t)a3;
+ (id)modeOfTransportToString:(unint64_t)a3;
+ (id)statusToString:(unint64_t)a3;
- (BOOL)dirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRetryETAQuery;
- (CLLocation)originLocation;
- (NSDate)currentStatusDate;
- (NSDate)date;
- (NSDate)lastLockDate;
- (NSDate)lastUnlockDate;
- (NSDate)roundTripReminderDate;
- (NSDate)timeToUpdateStatus;
- (NSUUID)sessionIdentifier;
- (SMTriggerDestinationState)initWithCoder:(id)a3;
- (SMTriggerDestinationState)initWithSessionIdentifier:(id)a3;
- (SMTriggerDestinationState)initWithSessionIdentifier:(id)a3 currentStatus:(unint64_t)a4 currentStatusDate:(id)a5 lastLockDate:(id)a6 lastUnlockDate:(id)a7 predominantModeOfTransport:(unint64_t)a8 numberOfETARetries:(unsigned __int16)a9 shouldRetryETAQuery:(BOOL)a10 roundTripReminderDate:(id)a11 timeToUpdateStatus:(id)a12 upperBoundEta:(id)a13 mapsExpectedTravelTime:(double)a14 remainingDistance:(double)a15 date:(id)a16;
- (SMUpperBoundEta)upperBoundEta;
- (double)mapsExpectedTravelTime;
- (double)remainingDistance;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)currentStatus;
- (unint64_t)hash;
- (unint64_t)predominantModeOfTransport;
- (unsigned)numberOfETARetries;
- (void)encodeWithCoder:(id)a3;
- (void)markDirty;
- (void)setCurrentStatus:(unint64_t)a3;
- (void)setCurrentStatusDate:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setLastLockDate:(id)a3;
- (void)setLastUnlockDate:(id)a3;
- (void)setMapsExpectedTravelTime:(double)a3;
- (void)setNumberOfETARetries:(unsigned __int16)a3;
- (void)setOriginLocation:(id)a3;
- (void)setPredominantModeOfTransport:(unint64_t)a3;
- (void)setRemainingDistance:(double)a3;
- (void)setRoundTripReminderDate:(id)a3;
- (void)setShouldRetryETAQuery:(BOOL)a3;
- (void)setTimeToUpdateStatus:(id)a3;
- (void)setUpperBoundEta:(id)a3;
@end

@implementation SMTriggerDestinationState

- (SMTriggerDestinationState)initWithSessionIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [MEMORY[0x263EFF910] date];
  BYTE2(v10) = 1;
  LOWORD(v10) = 0;
  v8 = -[SMTriggerDestinationState initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:](self, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v5, 1, v6, 0, 0, 0xFFFFFFFLL, -1.0, -1.0, v10, 0, 0, 0, v7);

  return v8;
}

- (SMTriggerDestinationState)initWithSessionIdentifier:(id)a3 currentStatus:(unint64_t)a4 currentStatusDate:(id)a5 lastLockDate:(id)a6 lastUnlockDate:(id)a7 predominantModeOfTransport:(unint64_t)a8 numberOfETARetries:(unsigned __int16)a9 shouldRetryETAQuery:(BOOL)a10 roundTripReminderDate:(id)a11 timeToUpdateStatus:(id)a12 upperBoundEta:(id)a13 mapsExpectedTravelTime:(double)a14 remainingDistance:(double)a15 date:(id)a16
{
  id v23 = a3;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a11;
  id v33 = a12;
  id v32 = a13;
  id v31 = a16;
  if (v23)
  {
    v38.receiver = self;
    v38.super_class = (Class)SMTriggerDestinationState;
    v24 = [(SMTriggerDestinationState *)&v38 init];
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_sessionIdentifier, a3);
      v25->_currentStatus = a4;
      objc_storeStrong((id *)&v25->_currentStatusDate, a5);
      objc_storeStrong((id *)&v25->_lastLockDate, a6);
      objc_storeStrong((id *)&v25->_lastUnlockDate, a7);
      v25->_predominantModeOfTransport = a8;
      v25->_numberOfETARetries = a9;
      v25->_shouldRetryETAQuery = a10;
      objc_storeStrong((id *)&v25->_roundTripReminderDate, a11);
      objc_storeStrong((id *)&v25->_timeToUpdateStatus, a12);
      objc_storeStrong((id *)&v25->_upperBoundEta, a13);
      v25->_mapsExpectedTravelTime = a14;
      v25->_remainingDistance = a15;
      objc_storeStrong((id *)&v25->_date, a16);
      v25->_dirty = 1;
    }
    self = v25;
    v26 = self;
  }
  else
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionIdentifier", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

- (void)markDirty
{
  v3 = [MEMORY[0x263EFF910] date];
  date = self->_date;
  self->_date = v3;

  self->_dirty = 1;
}

- (void)setTimeToUpdateStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSDate *)self->_timeToUpdateStatus isEqualToDate:v5])
  {
    objc_storeStrong((id *)&self->_timeToUpdateStatus, a3);
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(NSDate *)self->_timeToUpdateStatus stringFromDate];
      int v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setTimeToUpdateStatus:]";
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, timeToUpdateStatus, %@", (uint8_t *)&v8, 0x16u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setLastLockDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSDate *)self->_lastLockDate isEqualToDate:v5])
  {
    objc_storeStrong((id *)&self->_lastLockDate, a3);
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(NSDate *)self->_lastLockDate stringFromDate];
      int v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setLastLockDate:]";
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, lastLockDate, %@", (uint8_t *)&v8, 0x16u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setLastUnlockDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSDate *)self->_lastUnlockDate isEqualToDate:v5])
  {
    objc_storeStrong((id *)&self->_lastUnlockDate, a3);
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(NSDate *)self->_lastUnlockDate stringFromDate];
      int v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setLastUnlockDate:]";
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, lastUnlockDate, %@", (uint8_t *)&v8, 0x16u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setCurrentStatus:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_currentStatus != a3)
  {
    self->_currentStatus = a3;
    v4 = [MEMORY[0x263EFF910] date];
    currentStatusDate = self->_currentStatusDate;
    self->_currentStatusDate = v4;

    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = +[SMTriggerDestinationState statusToString:self->_currentStatus];
      int v8 = [(NSDate *)self->_currentStatusDate stringFromDate];
      int v9 = 136315650;
      __int16 v10 = "-[SMTriggerDestinationState setCurrentStatus:]";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, currentStatus, %@, currentStatusDate, %@", (uint8_t *)&v9, 0x20u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setCurrentStatusDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (NSDate *)a3;
  if (self->_currentStatusDate != v5)
  {
    objc_storeStrong((id *)&self->_currentStatusDate, a3);
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(NSDate *)self->_currentStatusDate stringFromDate];
      int v8 = 136315394;
      int v9 = "-[SMTriggerDestinationState setCurrentStatusDate:]";
      __int16 v10 = 2112;
      __int16 v11 = v7;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, currentStatusDate, %@", (uint8_t *)&v8, 0x16u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setRoundTripReminderDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSDate *)self->_roundTripReminderDate isEqualToDate:v5])
  {
    objc_storeStrong((id *)&self->_roundTripReminderDate, a3);
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(NSDate *)self->_roundTripReminderDate stringFromDate];
      int v8 = 136315394;
      int v9 = "-[SMTriggerDestinationState setRoundTripReminderDate:]";
      __int16 v10 = 2112;
      __int16 v11 = v7;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, roundTripReminderDate, %@", (uint8_t *)&v8, 0x16u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setUpperBoundEta:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(SMUpperBoundEta *)self->_upperBoundEta isEqual:v5])
  {
    objc_storeStrong((id *)&self->_upperBoundEta, a3);
    v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      upperBoundEta = self->_upperBoundEta;
      int v8 = 136315394;
      int v9 = "-[SMTriggerDestinationState setUpperBoundEta:]";
      __int16 v10 = 2112;
      __int16 v11 = upperBoundEta;
      _os_log_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_INFO, "%s, upperBoundEta, %@", (uint8_t *)&v8, 0x16u);
    }

    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setPredominantModeOfTransport:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_predominantModeOfTransport != a3)
  {
    self->_predominantModeOfTransport = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = +[SMTriggerDestinationState convertSMDirectionTransportTypeToString:self->_predominantModeOfTransport];
      int v6 = 136315394;
      v7 = "-[SMTriggerDestinationState setPredominantModeOfTransport:]";
      __int16 v8 = 2112;
      int v9 = v5;
      _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, predominantModeOfTransport, %@", (uint8_t *)&v6, 0x16u);
    }
    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setMapsExpectedTravelTime:(double)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_mapsExpectedTravelTime != a3)
  {
    self->_double mapsExpectedTravelTime = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double mapsExpectedTravelTime = self->_mapsExpectedTravelTime;
      int v6 = 136315394;
      v7 = "-[SMTriggerDestinationState setMapsExpectedTravelTime:]";
      __int16 v8 = 2048;
      double v9 = mapsExpectedTravelTime;
      _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, mapsExpectedTravelTime, %.1f", (uint8_t *)&v6, 0x16u);
    }

    [(SMTriggerDestinationState *)self markDirty];
  }
}

- (void)setRemainingDistance:(double)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_remainingDistance != a3)
  {
    self->_double remainingDistance = a3;
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double remainingDistance = self->_remainingDistance;
      int v6 = 136315394;
      v7 = "-[SMTriggerDestinationState setRemainingDistance:]";
      __int16 v8 = 2048;
      double v9 = remainingDistance;
      _os_log_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_INFO, "%s, remainingDistance, %.1f", (uint8_t *)&v6, 0x16u);
    }

    [(SMTriggerDestinationState *)self markDirty];
  }
}

+ (id)statusToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Invalid";
  }
  else {
    return off_265499AD0[a3];
  }
}

+ (id)modeOfTransportToString:(unint64_t)a3
{
  if ((uint64_t)a3 > 3)
  {
    if (a3 != 4)
    {
      if (a3 == 0xFFFFFFF) {
        return @"Any";
      }
      return @"Invalid";
    }
    return @"Transit";
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2) {
        return @"Walking";
      }
      return @"Invalid";
    }
    return @"Automobile";
  }
}

+ (id)convertSMDirectionTransportTypeToString:(unint64_t)a3
{
  if ((uint64_t)a3 > 3)
  {
    if (a3 != 4)
    {
      if (a3 == 0xFFFFFFF) {
        return @"SMDirectionsTransportTypeAny";
      }
      return @"UKNOWN";
    }
    return @"SMDirectionsTransportTypeTransit";
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2) {
        return @"SMDirectionsTransportTypeWalking";
      }
      return @"UKNOWN";
    }
    return @"SMDirectionsTransportTypeAutomobile";
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMTriggerDestinationState)initWithCoder:(id)a3
{
  id v3 = a3;
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateSessionIdentifierKey"];
  uint64_t v21 = [v3 decodeIntegerForKey:@"__kSMTriggerDestinationStateCurrentStatusKey"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateCurrentStatusDateKey"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateLastLockDateKey"];
  int v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateLastUnlockDateKey"];
  uint64_t v20 = [v3 decodeIntegerForKey:@"__kSMTriggerDestinationStatePredominantModeOfTransportKey"];
  __int16 v7 = [v3 decodeIntegerForKey:@"__kSMTriggerDestinationStateNumberOfETARetriesKey"];
  BOOL v8 = [v3 decodeIntegerForKey:@"__kSMTriggerDestinationStateShouldRetryETAQueryKey"] != 0;
  double v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateRoundTripReminderDateKey"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateTimeToUpdateStatusKey"];
  __int16 v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateUpperBoundEtaKey"];
  [v3 decodeDoubleForKey:@"__kSMTriggerDestinationStateMapsExpectedTravelTimeKey"];
  double v13 = v12;
  [v3 decodeDoubleForKey:@"__kSMTriggerDestinationStateRemainingDistanceKey"];
  double v15 = v14;
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMTriggerDestinationStateDateKey"];

  BYTE2(v19) = v8;
  LOWORD(v19) = v7;
  v17 = -[SMTriggerDestinationState initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:](self, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v22, v21, v4, v5, v6, v20, v13, v15, v19, v9, v10, v11, v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"__kSMTriggerDestinationStateSessionIdentifierKey"];
  [v5 encodeInteger:self->_currentStatus forKey:@"__kSMTriggerDestinationStateCurrentStatusKey"];
  [v5 encodeObject:self->_currentStatusDate forKey:@"__kSMTriggerDestinationStateCurrentStatusDateKey"];
  [v5 encodeObject:self->_lastLockDate forKey:@"__kSMTriggerDestinationStateLastLockDateKey"];
  [v5 encodeObject:self->_lastUnlockDate forKey:@"__kSMTriggerDestinationStateLastUnlockDateKey"];
  [v5 encodeInteger:self->_predominantModeOfTransport forKey:@"__kSMTriggerDestinationStatePredominantModeOfTransportKey"];
  [v5 encodeInteger:self->_numberOfETARetries forKey:@"__kSMTriggerDestinationStateNumberOfETARetriesKey"];
  [v5 encodeInteger:self->_shouldRetryETAQuery forKey:@"__kSMTriggerDestinationStateShouldRetryETAQueryKey"];
  [v5 encodeObject:self->_roundTripReminderDate forKey:@"__kSMTriggerDestinationStateRoundTripReminderDateKey"];
  [v5 encodeObject:self->_timeToUpdateStatus forKey:@"__kSMTriggerDestinationStateTimeToUpdateStatusKey"];
  [v5 encodeObject:self->_upperBoundEta forKey:@"__kSMTriggerDestinationStateUpperBoundEtaKey"];
  [v5 encodeDouble:@"__kSMTriggerDestinationStateMapsExpectedTravelTimeKey" forKey:self->_mapsExpectedTravelTime];
  [v5 encodeDouble:@"__kSMTriggerDestinationStateRemainingDistanceKey" forKey:self->_remainingDistance];
  [v5 encodeObject:self->_date forKey:@"__kSMTriggerDestinationStateDateKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v23 = +[SMTriggerDestinationState allocWithZone:a3];
  v22 = [(SMTriggerDestinationState *)self sessionIdentifier];
  unint64_t v21 = [(SMTriggerDestinationState *)self currentStatus];
  v4 = [(SMTriggerDestinationState *)self currentStatusDate];
  id v5 = [(SMTriggerDestinationState *)self lastLockDate];
  int v6 = [(SMTriggerDestinationState *)self lastUnlockDate];
  unint64_t v7 = [(SMTriggerDestinationState *)self predominantModeOfTransport];
  unsigned __int16 v8 = [(SMTriggerDestinationState *)self numberOfETARetries];
  BOOL v9 = [(SMTriggerDestinationState *)self shouldRetryETAQuery];
  uint64_t v10 = [(SMTriggerDestinationState *)self roundTripReminderDate];
  __int16 v11 = [(SMTriggerDestinationState *)self timeToUpdateStatus];
  double v12 = [(SMTriggerDestinationState *)self upperBoundEta];
  [(SMTriggerDestinationState *)self mapsExpectedTravelTime];
  double v14 = v13;
  [(SMTriggerDestinationState *)self remainingDistance];
  double v16 = v15;
  v17 = [(SMTriggerDestinationState *)self date];
  BYTE2(v20) = v9;
  LOWORD(v20) = v8;
  v18 = -[SMTriggerDestinationState initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:](v23, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v22, v21, v4, v5, v6, v7, v14, v16, v20, v10, v11, v12, v17);

  return v18;
}

- (unint64_t)hash
{
  v29 = [(SMTriggerDestinationState *)self sessionIdentifier];
  uint64_t v3 = [v29 hash];
  unint64_t v4 = [(SMTriggerDestinationState *)self currentStatus] ^ v3;
  v28 = [(SMTriggerDestinationState *)self currentStatusDate];
  uint64_t v5 = [v28 hash];
  int v6 = [(SMTriggerDestinationState *)self lastLockDate];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  unsigned __int16 v8 = [(SMTriggerDestinationState *)self lastUnlockDate];
  uint64_t v9 = [v8 hash];
  unint64_t v10 = v9 ^ [(SMTriggerDestinationState *)self predominantModeOfTransport];
  unint64_t v11 = v7 ^ v10 ^ [(SMTriggerDestinationState *)self numberOfETARetries];
  uint64_t v12 = [(SMTriggerDestinationState *)self shouldRetryETAQuery];
  double v13 = [(SMTriggerDestinationState *)self roundTripReminderDate];
  uint64_t v14 = v12 ^ [v13 hash];
  double v15 = [(SMTriggerDestinationState *)self timeToUpdateStatus];
  uint64_t v16 = v11 ^ v14 ^ [v15 hash];
  v17 = [(SMTriggerDestinationState *)self upperBoundEta];
  uint64_t v18 = v16 ^ [v17 hash];
  uint64_t v19 = NSNumber;
  [(SMTriggerDestinationState *)self mapsExpectedTravelTime];
  uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
  uint64_t v21 = v18 ^ [v20 hash];
  v22 = NSNumber;
  [(SMTriggerDestinationState *)self remainingDistance];
  id v23 = objc_msgSend(v22, "numberWithDouble:");
  uint64_t v24 = [v23 hash];
  v25 = [(SMTriggerDestinationState *)self date];
  unint64_t v26 = v21 ^ v24 ^ [v25 hash];

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SMTriggerDestinationState *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int v6 = [(SMTriggerDestinationState *)self sessionIdentifier];
      uint64_t v7 = [(SMTriggerDestinationState *)v5 sessionIdentifier];
      if (v6 == v7)
      {
        char v74 = 0;
      }
      else
      {
        unsigned __int16 v8 = [(SMTriggerDestinationState *)self sessionIdentifier];
        uint64_t v9 = [(SMTriggerDestinationState *)v5 sessionIdentifier];
        char v10 = [v8 isEqual:v9];

        char v74 = v10 ^ 1;
      }

      unint64_t v73 = [(SMTriggerDestinationState *)self currentStatus];
      uint64_t v72 = [(SMTriggerDestinationState *)v5 currentStatus];
      uint64_t v12 = [(SMTriggerDestinationState *)self currentStatusDate];
      double v13 = [(SMTriggerDestinationState *)v5 currentStatusDate];
      if (v12 == v13)
      {
        char v71 = 0;
      }
      else
      {
        uint64_t v14 = [(SMTriggerDestinationState *)self currentStatusDate];
        double v15 = [(SMTriggerDestinationState *)v5 currentStatusDate];
        char v16 = [v14 isEqual:v15];

        char v71 = v16 ^ 1;
      }

      v17 = [(SMTriggerDestinationState *)self lastLockDate];
      uint64_t v18 = [(SMTriggerDestinationState *)v5 lastLockDate];
      if (v17 == v18)
      {
        char v70 = 0;
      }
      else
      {
        uint64_t v19 = [(SMTriggerDestinationState *)self lastLockDate];
        uint64_t v20 = [(SMTriggerDestinationState *)v5 lastLockDate];
        char v21 = [v19 isEqual:v20];

        char v70 = v21 ^ 1;
      }

      v22 = [(SMTriggerDestinationState *)self lastUnlockDate];
      id v23 = [(SMTriggerDestinationState *)v5 lastUnlockDate];
      if (v22 == v23)
      {
        char v69 = 0;
      }
      else
      {
        uint64_t v24 = [(SMTriggerDestinationState *)self lastUnlockDate];
        v25 = [(SMTriggerDestinationState *)v5 lastUnlockDate];
        char v26 = [v24 isEqual:v25];

        char v69 = v26 ^ 1;
      }

      unint64_t v68 = [(SMTriggerDestinationState *)self predominantModeOfTransport];
      uint64_t v67 = [(SMTriggerDestinationState *)v5 predominantModeOfTransport];
      int v66 = [(SMTriggerDestinationState *)self numberOfETARetries];
      int v65 = [(SMTriggerDestinationState *)v5 numberOfETARetries];
      BOOL v63 = [(SMTriggerDestinationState *)self shouldRetryETAQuery];
      BOOL v27 = [(SMTriggerDestinationState *)v5 shouldRetryETAQuery];
      v28 = [(SMTriggerDestinationState *)self roundTripReminderDate];
      v29 = [(SMTriggerDestinationState *)v5 roundTripReminderDate];
      if (v28 == v29)
      {
        char v64 = 0;
      }
      else
      {
        v30 = [(SMTriggerDestinationState *)self roundTripReminderDate];
        id v31 = [(SMTriggerDestinationState *)v5 roundTripReminderDate];
        char v32 = [v30 isEqual:v31];

        char v64 = v32 ^ 1;
      }

      id v33 = [(SMTriggerDestinationState *)self timeToUpdateStatus];
      id v34 = [(SMTriggerDestinationState *)v5 timeToUpdateStatus];
      if (v33 == v34)
      {
        char v38 = 0;
      }
      else
      {
        id v35 = [(SMTriggerDestinationState *)self timeToUpdateStatus];
        id v36 = [(SMTriggerDestinationState *)v5 timeToUpdateStatus];
        char v37 = [v35 isEqual:v36];

        char v38 = v37 ^ 1;
      }

      v39 = [(SMTriggerDestinationState *)self upperBoundEta];
      v40 = [(SMTriggerDestinationState *)v5 upperBoundEta];
      if (v39 == v40)
      {
        char v44 = 0;
      }
      else
      {
        v41 = [(SMTriggerDestinationState *)self upperBoundEta];
        v42 = [(SMTriggerDestinationState *)v5 upperBoundEta];
        char v43 = [v41 isEqual:v42];

        char v44 = v43 ^ 1;
      }
      char v45 = v63 ^ v27;

      [(SMTriggerDestinationState *)self mapsExpectedTravelTime];
      double v47 = v46;
      [(SMTriggerDestinationState *)v5 mapsExpectedTravelTime];
      double v49 = v48;
      [(SMTriggerDestinationState *)self remainingDistance];
      double v51 = v50;
      [(SMTriggerDestinationState *)v5 remainingDistance];
      double v53 = v52;
      v54 = [(SMTriggerDestinationState *)self date];
      v55 = [(SMTriggerDestinationState *)v5 date];
      if (v54 == v55)
      {
        char v58 = 1;
      }
      else
      {
        v56 = [(SMTriggerDestinationState *)self date];
        v57 = [(SMTriggerDestinationState *)v5 date];
        char v58 = [v56 isEqual:v57];
      }
      char v59 = v74;
      if (v73 != v72) {
        char v59 = 1;
      }
      char v60 = v59 | v71 | v70 | v69;
      if (v68 != v67) {
        char v60 = 1;
      }
      if (v66 != v65) {
        char v60 = 1;
      }
      char v61 = (v47 == v49) & ~(v60 | v45 | v64 | v38 | v44);
      if (v51 != v53) {
        char v61 = 0;
      }
      char v11 = v61 & v58;
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  id v23 = NSString;
  v22 = [(SMTriggerDestinationState *)self sessionIdentifier];
  char v26 = [(SMTriggerDestinationState *)self date];
  uint64_t v20 = [v26 stringFromDate];
  uint64_t v18 = objc_msgSend((id)objc_opt_class(), "statusToString:", -[SMTriggerDestinationState currentStatus](self, "currentStatus"));
  v25 = [(SMTriggerDestinationState *)self currentStatusDate];
  uint64_t v3 = [v25 stringFromDate];
  char v21 = [(SMTriggerDestinationState *)self lastLockDate];
  v17 = [v21 stringFromDate];
  uint64_t v19 = [(SMTriggerDestinationState *)self lastUnlockDate];
  char v16 = [v19 stringFromDate];
  unint64_t v4 = objc_msgSend((id)objc_opt_class(), "modeOfTransportToString:", -[SMTriggerDestinationState predominantModeOfTransport](self, "predominantModeOfTransport"));
  unsigned int v5 = [(SMTriggerDestinationState *)self numberOfETARetries];
  if ([(SMTriggerDestinationState *)self shouldRetryETAQuery]) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  double v15 = [(SMTriggerDestinationState *)self roundTripReminderDate];
  uint64_t v7 = [v15 stringFromDate];
  unsigned __int16 v8 = [(SMTriggerDestinationState *)self timeToUpdateStatus];
  uint64_t v9 = [v8 stringFromDate];
  char v10 = [(SMTriggerDestinationState *)self upperBoundEta];
  [(SMTriggerDestinationState *)self mapsExpectedTravelTime];
  uint64_t v12 = v11;
  [(SMTriggerDestinationState *)self remainingDistance];
  uint64_t v24 = [v23 stringWithFormat:@"sessionIdentifier, %@, date, %@, currentStatus, %@, currentStatusDate, %@, lastLockDate, %@, lastUnLockDate, %@, predominantModeOfTransport, %@, numberOfETARetries, %hu, shouldRetryETAQuery, %@, roundTripReminderDate, %@, timeToUpdateStatus, %@, upperBoundEta, %@, mapsExpectedTravelTime, %.1f, remainingDistance, %.1f", v22, v20, v18, v3, v17, v16, v4, v5, v6, v7, v9, v10, v12, v13];

  return v24;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)lastLockDate
{
  return self->_lastLockDate;
}

- (NSDate)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (unint64_t)predominantModeOfTransport
{
  return self->_predominantModeOfTransport;
}

- (unint64_t)currentStatus
{
  return self->_currentStatus;
}

- (NSDate)currentStatusDate
{
  return self->_currentStatusDate;
}

- (NSDate)roundTripReminderDate
{
  return self->_roundTripReminderDate;
}

- (NSDate)timeToUpdateStatus
{
  return self->_timeToUpdateStatus;
}

- (SMUpperBoundEta)upperBoundEta
{
  return self->_upperBoundEta;
}

- (double)mapsExpectedTravelTime
{
  return self->_mapsExpectedTravelTime;
}

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (BOOL)shouldRetryETAQuery
{
  return self->_shouldRetryETAQuery;
}

- (void)setShouldRetryETAQuery:(BOOL)a3
{
  self->_shouldRetryETAQuery = a3;
}

- (unsigned)numberOfETARetries
{
  return self->_numberOfETARetries;
}

- (void)setNumberOfETARetries:(unsigned __int16)a3
{
  self->_numberOfETARetries = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (CLLocation)originLocation
{
  return self->_originLocation;
}

- (void)setOriginLocation:(id)a3
{
  self->_originLocation = (CLLocation *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBoundEta, 0);
  objc_storeStrong((id *)&self->_timeToUpdateStatus, 0);
  objc_storeStrong((id *)&self->_roundTripReminderDate, 0);
  objc_storeStrong((id *)&self->_currentStatusDate, 0);
  objc_storeStrong((id *)&self->_lastUnlockDate, 0);
  objc_storeStrong((id *)&self->_lastLockDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end