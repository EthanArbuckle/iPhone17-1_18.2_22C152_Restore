@interface RTAuthorizedLocationQueryMetrics
- (BOOL)isHistoricallyALowDiversityLocation;
- (BOOL)responseValue;
- (NSDate)endDate;
- (NSDate)startDate;
- (RTAuthorizedLocationQueryMetrics)init;
- (float)daemonResponseLatencyMs;
- (float)historicalRejectionSpeedMps;
- (float)normalizedDistanceToCentroid;
- (float)userTimeOffsetHours;
- (float)visitDwellMinutes;
- (int)historicalRejectionReasonCode;
- (int)locationAgeMinutes;
- (int)loiFamiliarityRank;
- (int)numFamiliarLois;
- (int)rejectionReasonCode;
- (int)technologyAvailability;
- (void)endTimer;
- (void)setDaemonResponseLatencyMs:(float)a3;
- (void)setEndDate:(id)a3;
- (void)setHistoricalRejectionReasonCode:(int)a3;
- (void)setHistoricalRejectionSpeedMps:(float)a3;
- (void)setIsHistoricallyALowDiversityLocation:(BOOL)a3;
- (void)setLocationAgeMinutes:(int)a3;
- (void)setLoiFamiliarityRank:(int)a3;
- (void)setMotionSpeedLimitRejectionCodeFromLookbackHours:(double)a3;
- (void)setNormalizedDistanceToCentroid:(float)a3;
- (void)setNumFamiliarLois:(int)a3;
- (void)setRejectionReasonCode:(int)a3;
- (void)setResponseValue:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTechnologyAvailability:(int)a3;
- (void)setUserTimeOffsetHours:(float)a3;
- (void)setVisitDwellMinutes:(float)a3;
- (void)startTimer;
@end

@implementation RTAuthorizedLocationQueryMetrics

- (RTAuthorizedLocationQueryMetrics)init
{
  v13.receiver = self;
  v13.super_class = (Class)RTAuthorizedLocationQueryMetrics;
  v2 = [(RTAuthorizedLocationQueryMetrics *)&v13 init];
  v3 = (RTAuthorizedLocationQueryMetrics *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 0;
    *(void *)(v2 + 12) = 0xC2C80000BF800000;
    *(void *)(v2 + 20) = 0xFFFFFFFF00000000;
    __asm { FMOV            V0.2S, #-1.0 }
    *(void *)(v2 + 28) = _D0;
    *(void *)&long long v9 = -1;
    *((void *)&v9 + 1) = -1;
    *(_OWORD *)(v2 + 36) = v9;
    *((_DWORD *)v2 + 13) = -1082130432;
    v10 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = 0;

    endDate = v3->_endDate;
    v3->_endDate = 0;
  }
  return v3;
}

- (void)startTimer
{
  if (!self->_startDate)
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    startDate = self->_startDate;
    self->_startDate = v3;
  }
  endDate = self->_endDate;
  self->_endDate = 0;
}

- (void)endTimer
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  endDate = self->_endDate;
  self->_endDate = v3;

  if (self->_startDate)
  {
    v5 = self->_endDate;
    if (v5)
    {
      -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:");
      *(float *)&double v6 = v6 * 1000.0;
      self->_daemonResponseLatencyMs = *(float *)&v6;
    }
  }
}

- (void)setMotionSpeedLimitRejectionCodeFromLookbackHours:(double)a3
{
  if (a3 >= 1.0)
  {
    if (a3 >= 2.0)
    {
      if (a3 >= 3.0)
      {
        if (a3 >= 4.0)
        {
          if (a3 >= 5.0) {
            int v3 = 6;
          }
          else {
            int v3 = 5;
          }
        }
        else
        {
          int v3 = 4;
        }
      }
      else
      {
        int v3 = 3;
      }
    }
    else
    {
      int v3 = 2;
    }
  }
  else
  {
    int v3 = 1;
  }
  self->_historicalRejectionReasonCode = v3;
}

- (float)daemonResponseLatencyMs
{
  return self->_daemonResponseLatencyMs;
}

- (void)setDaemonResponseLatencyMs:(float)a3
{
  self->_daemonResponseLatencyMs = a3;
}

- (BOOL)responseValue
{
  return self->_responseValue;
}

- (void)setResponseValue:(BOOL)a3
{
  self->_responseValue = a3;
}

- (float)userTimeOffsetHours
{
  return self->_userTimeOffsetHours;
}

- (void)setUserTimeOffsetHours:(float)a3
{
  self->_userTimeOffsetHours = a3;
}

- (int)loiFamiliarityRank
{
  return self->_loiFamiliarityRank;
}

- (void)setLoiFamiliarityRank:(int)a3
{
  self->_loiFamiliarityRank = a3;
}

- (int)numFamiliarLois
{
  return self->_numFamiliarLois;
}

- (void)setNumFamiliarLois:(int)a3
{
  self->_numFamiliarLois = a3;
}

- (float)visitDwellMinutes
{
  return self->_visitDwellMinutes;
}

- (void)setVisitDwellMinutes:(float)a3
{
  self->_visitDwellMinutes = a3;
}

- (float)normalizedDistanceToCentroid
{
  return self->_normalizedDistanceToCentroid;
}

- (void)setNormalizedDistanceToCentroid:(float)a3
{
  self->_normalizedDistanceToCentroid = a3;
}

- (int)rejectionReasonCode
{
  return self->_rejectionReasonCode;
}

- (void)setRejectionReasonCode:(int)a3
{
  self->_rejectionReasonCode = a3;
}

- (BOOL)isHistoricallyALowDiversityLocation
{
  return self->_isHistoricallyALowDiversityLocation;
}

- (void)setIsHistoricallyALowDiversityLocation:(BOOL)a3
{
  self->_isHistoricallyALowDiversityLocation = a3;
}

- (int)technologyAvailability
{
  return self->_technologyAvailability;
}

- (void)setTechnologyAvailability:(int)a3
{
  self->_technologyAvailability = a3;
}

- (int)locationAgeMinutes
{
  return self->_locationAgeMinutes;
}

- (void)setLocationAgeMinutes:(int)a3
{
  self->_locationAgeMinutes = a3;
}

- (int)historicalRejectionReasonCode
{
  return self->_historicalRejectionReasonCode;
}

- (void)setHistoricalRejectionReasonCode:(int)a3
{
  self->_historicalRejectionReasonCode = a3;
}

- (float)historicalRejectionSpeedMps
{
  return self->_historicalRejectionSpeedMps;
}

- (void)setHistoricalRejectionSpeedMps:(float)a3
{
  self->_historicalRejectionSpeedMps = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end