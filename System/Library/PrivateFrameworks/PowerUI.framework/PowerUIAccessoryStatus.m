@interface PowerUIAccessoryStatus
- (BOOL)enabled;
- (BOOL)temporarilyDisabled;
- (NSDate)disabledUntilDate;
- (NSDate)lastSeenDate;
- (NSDate)lastSentDate;
- (NSDate)lastTimeseriesDate;
- (NSDate)lastUnderchargeRecordedForPrediction;
- (NSUUID)expectedHash;
- (PowerUIAccessoryStatus)init;
- (id)description;
- (unint64_t)currentState;
- (unint64_t)managerState;
- (unsigned)chargingEventsSinceLastReport;
- (unsigned)minutesSavedSinceLastReport;
- (unsigned)underchargesSinceLastReport;
- (void)setChargingEventsSinceLastReport:(unsigned __int8)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDisabledUntilDate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExpectedHash:(id)a3;
- (void)setLastSeenDate:(id)a3;
- (void)setLastSentDate:(id)a3;
- (void)setLastTimeseriesDate:(id)a3;
- (void)setLastUnderchargeRecordedForPrediction:(id)a3;
- (void)setManagerState:(unint64_t)a3;
- (void)setMinutesSavedSinceLastReport:(unsigned __int16)a3;
- (void)setTemporarilyDisabled:(BOOL)a3;
- (void)setUnderchargesSinceLastReport:(unsigned __int8)a3;
@end

@implementation PowerUIAccessoryStatus

- (PowerUIAccessoryStatus)init
{
  v11.receiver = self;
  v11.super_class = (Class)PowerUIAccessoryStatus;
  v2 = [(PowerUIAccessoryStatus *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    disabledUntilDate = v2->_disabledUntilDate;
    v2->_currentState = 1;
    v2->_disabledUntilDate = 0;

    v3->_temporarilyDisabled = 0;
    lastSentDate = v3->_lastSentDate;
    v3->_lastSentDate = 0;

    lastSeenDate = v3->_lastSeenDate;
    v3->_lastSeenDate = 0;

    lastTimeseriesDate = v3->_lastTimeseriesDate;
    v3->_lastTimeseriesDate = 0;

    lastUnderchargeRecordedForPrediction = v3->_lastUnderchargeRecordedForPrediction;
    v3->_lastUnderchargeRecordedForPrediction = 0;

    *(_DWORD *)&v3->_underchargesSinceLastReport = 0;
    expectedHash = v3->_expectedHash;
    v3->_expectedHash = 0;
    v3->_managerState = 0;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = [NSNumber numberWithUnsignedInteger:self->_currentState];
  v5 = [NSNumber numberWithBool:self->_enabled];
  disabledUntilDate = self->_disabledUntilDate;
  v7 = [NSNumber numberWithBool:self->_temporarilyDisabled];
  v8 = [v3 stringWithFormat:@"AccessoryStatus: currentState=%@ enabled=%@ disabledUntilDate=%@ temporarilyDisabled=%@ lastSentDate=%@ lastSeenDate=%@ lastTimeseriesDate=%@ expectedhash=%@", v4, v5, disabledUntilDate, v7, self->_lastSentDate, self->_lastSeenDate, self->_lastTimeseriesDate, self->_expectedHash];

  return v8;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSDate)disabledUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisabledUntilDate:(id)a3
{
}

- (BOOL)temporarilyDisabled
{
  return self->_temporarilyDisabled;
}

- (void)setTemporarilyDisabled:(BOOL)a3
{
  self->_temporarilyDisabled = a3;
}

- (NSDate)lastSentDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastSentDate:(id)a3
{
}

- (NSDate)lastSeenDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastSeenDate:(id)a3
{
}

- (NSDate)lastTimeseriesDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastTimeseriesDate:(id)a3
{
}

- (NSDate)lastUnderchargeRecordedForPrediction
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastUnderchargeRecordedForPrediction:(id)a3
{
}

- (NSUUID)expectedHash
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExpectedHash:(id)a3
{
}

- (unsigned)minutesSavedSinceLastReport
{
  return self->_minutesSavedSinceLastReport;
}

- (void)setMinutesSavedSinceLastReport:(unsigned __int16)a3
{
  self->_minutesSavedSinceLastReport = a3;
}

- (unsigned)underchargesSinceLastReport
{
  return self->_underchargesSinceLastReport;
}

- (void)setUnderchargesSinceLastReport:(unsigned __int8)a3
{
  self->_underchargesSinceLastReport = a3;
}

- (unsigned)chargingEventsSinceLastReport
{
  return self->_chargingEventsSinceLastReport;
}

- (void)setChargingEventsSinceLastReport:(unsigned __int8)a3
{
  self->_chargingEventsSinceLastReport = a3;
}

- (unint64_t)managerState
{
  return self->_managerState;
}

- (void)setManagerState:(unint64_t)a3
{
  self->_managerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedHash, 0);
  objc_storeStrong((id *)&self->_lastUnderchargeRecordedForPrediction, 0);
  objc_storeStrong((id *)&self->_lastTimeseriesDate, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_lastSentDate, 0);
  objc_storeStrong((id *)&self->_disabledUntilDate, 0);
}

@end