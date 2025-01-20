@interface CLEEDCoexPowerForCA
- (CLEEDCoexPowerForCA)initWithCoexMetricDict:(id)a3;
- (double)currentpeakPowerStartTime;
- (double)peakPowerCriticalDuration;
- (double)peakPowerHeavyDuration;
- (double)peakPowerLightDuration;
- (double)peakPowerModerateDuration;
- (double)peakPowerNominalDuration;
- (unsigned)maxPeakPowerInCall;
- (unsigned)peakPowerAtEndOfCall;
- (unsigned)peakPowerAtStartOfCall;
- (void)setCurrentpeakPowerStartTime:(double)a3;
- (void)setMaxPeakPowerInCall:(unsigned int)a3;
- (void)setPeakPowerAtEndOfCall:(unsigned int)a3;
- (void)setPeakPowerAtStartOfCall:(unsigned int)a3;
- (void)setPeakPowerCriticalDuration:(double)a3;
- (void)setPeakPowerHeavyDuration:(double)a3;
- (void)setPeakPowerLightDuration:(double)a3;
- (void)setPeakPowerModerateDuration:(double)a3;
- (void)setPeakPowerNominalDuration:(double)a3;
@end

@implementation CLEEDCoexPowerForCA

- (CLEEDCoexPowerForCA)initWithCoexMetricDict:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CLEEDCoexPowerForCA;
  v4 = [(CLEEDCoexPowerForCA *)&v13 init];
  v5 = (CLEEDCoexPowerForCA *)v4;
  if (v4)
  {
    if (a3)
    {
      [objc_msgSend(a3, "valueForKey:", @"peakPowerNominalDuration") doubleValue];
      v5->_peakPowerNominalDuration = v6;
      [objc_msgSend(a3, "valueForKey:", @"peakPowerLightDuration") doubleValue];
      v5->_peakPowerLightDuration = v7;
      [objc_msgSend(a3, "valueForKey:", @"peakPowerModerateDuration") doubleValue];
      v5->_peakPowerModerateDuration = v8;
      [objc_msgSend(a3, "valueForKey:", @"peakPowerHeavyDuration") doubleValue];
      v5->_peakPowerHeavyDuration = v9;
      [objc_msgSend(a3, "valueForKey:", @"peakPowerCriticalDuration") doubleValue];
      v5->_peakPowerCriticalDuration = v10;
      v5->_peakPowerAtStartOfCall = [[objc_msgSend(a3, "valueForKey:", @"peakPowerAtStartOfCall") intValue];
      v5->_maxPeakPowerInCall = [[objc_msgSend(a3, "valueForKey:", @"maxPeakPowerInCall") intValue];
      v5->_peakPowerAtEndOfCall = [[objc_msgSend(a3, "valueForKey:", @"peakPowerAtEndOfCall") intValue];
      [objc_msgSend(a3, "valueForKey:", @"currentpeakPowerStartTime") doubleValue];
      v5->_currentpeakPowerStartTime = v11;
    }
    else
    {
      *((void *)v4 + 1) = 0;
      *((_DWORD *)v4 + 4) = 0;
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 56) = 0u;
    }
  }
  return v5;
}

- (double)peakPowerNominalDuration
{
  return self->_peakPowerNominalDuration;
}

- (void)setPeakPowerNominalDuration:(double)a3
{
  self->_peakPowerNominalDuration = a3;
}

- (double)peakPowerLightDuration
{
  return self->_peakPowerLightDuration;
}

- (void)setPeakPowerLightDuration:(double)a3
{
  self->_peakPowerLightDuration = a3;
}

- (double)peakPowerModerateDuration
{
  return self->_peakPowerModerateDuration;
}

- (void)setPeakPowerModerateDuration:(double)a3
{
  self->_peakPowerModerateDuration = a3;
}

- (double)peakPowerHeavyDuration
{
  return self->_peakPowerHeavyDuration;
}

- (void)setPeakPowerHeavyDuration:(double)a3
{
  self->_peakPowerHeavyDuration = a3;
}

- (double)peakPowerCriticalDuration
{
  return self->_peakPowerCriticalDuration;
}

- (void)setPeakPowerCriticalDuration:(double)a3
{
  self->_peakPowerCriticalDuration = a3;
}

- (unsigned)peakPowerAtStartOfCall
{
  return self->_peakPowerAtStartOfCall;
}

- (void)setPeakPowerAtStartOfCall:(unsigned int)a3
{
  self->_peakPowerAtStartOfCall = a3;
}

- (unsigned)maxPeakPowerInCall
{
  return self->_maxPeakPowerInCall;
}

- (void)setMaxPeakPowerInCall:(unsigned int)a3
{
  self->_maxPeakPowerInCall = a3;
}

- (unsigned)peakPowerAtEndOfCall
{
  return self->_peakPowerAtEndOfCall;
}

- (void)setPeakPowerAtEndOfCall:(unsigned int)a3
{
  self->_peakPowerAtEndOfCall = a3;
}

- (double)currentpeakPowerStartTime
{
  return self->_currentpeakPowerStartTime;
}

- (void)setCurrentpeakPowerStartTime:(double)a3
{
  self->_currentpeakPowerStartTime = a3;
}

@end