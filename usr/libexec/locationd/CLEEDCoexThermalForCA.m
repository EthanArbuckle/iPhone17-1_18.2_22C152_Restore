@interface CLEEDCoexThermalForCA
- (CLEEDCoexThermalForCA)initWithCoexMetricDict:(id)a3;
- (double)currentThermalLevelStartTime;
- (double)thermalHeavyDuration;
- (double)thermalLightDuration;
- (double)thermalModerateDuration;
- (double)thermalNominalDuration;
- (double)thermalSleepingDuration;
- (double)thermalTrappingDuration;
- (int)maxThermalLevelInCall;
- (int)thermalLevelAtEndOfCall;
- (int)thermalLevelAtStartOfCall;
- (void)setCurrentThermalLevelStartTime:(double)a3;
- (void)setMaxThermalLevelInCall:(int)a3;
- (void)setThermalHeavyDuration:(double)a3;
- (void)setThermalLevelAtEndOfCall:(int)a3;
- (void)setThermalLevelAtStartOfCall:(int)a3;
- (void)setThermalLightDuration:(double)a3;
- (void)setThermalModerateDuration:(double)a3;
- (void)setThermalNominalDuration:(double)a3;
- (void)setThermalSleepingDuration:(double)a3;
- (void)setThermalTrappingDuration:(double)a3;
@end

@implementation CLEEDCoexThermalForCA

- (CLEEDCoexThermalForCA)initWithCoexMetricDict:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLEEDCoexThermalForCA;
  v4 = [(CLEEDCoexThermalForCA *)&v14 init];
  v5 = (CLEEDCoexThermalForCA *)v4;
  if (v4)
  {
    if (a3)
    {
      [objc_msgSend(a3, "valueForKey:", @"thermalNominalDuration") doubleValue];
      v5->_thermalNominalDuration = v6;
      [objc_msgSend(a3, "valueForKey:", @"thermalLightDuration") doubleValue];
      v5->_thermalLightDuration = v7;
      [objc_msgSend(a3, "valueForKey:", @"thermalModerateDuration") doubleValue];
      v5->_thermalModerateDuration = v8;
      [objc_msgSend(a3, "valueForKey:", @"thermalHeavyDuration") doubleValue];
      v5->_thermalHeavyDuration = v9;
      [objc_msgSend(a3, "valueForKey:", @"thermalTrappingDuration") doubleValue];
      v5->_thermalTrappingDuration = v10;
      [objc_msgSend(a3, "valueForKey:", @"thermalSleepingDuration") doubleValue];
      v5->_thermalSleepingDuration = v11;
      v5->_thermalLevelAtStartOfCall = [[objc_msgSend(a3, "valueForKey:", @"thermalLevelAtStartOfCall") intValue];
      v5->_maxThermalLevelInCall = [[objc_msgSend(a3, "valueForKey:", @"maxThermalLevelInCall") intValue];
      v5->_thermalLevelAtEndOfCall = [[objc_msgSend(a3, "valueForKey:", @"thermalLevelAtEndOfCall") intValue];
      [objc_msgSend(a3, "valueForKey:", @"currentThermalLevelStartTime") doubleValue];
      v5->_currentThermalLevelStartTime = v12;
    }
    else
    {
      *((void *)v4 + 1) = 0;
      *((_DWORD *)v4 + 4) = 0;
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 56) = 0u;
      *((void *)v4 + 9) = 0;
    }
  }
  return v5;
}

- (double)thermalNominalDuration
{
  return self->_thermalNominalDuration;
}

- (void)setThermalNominalDuration:(double)a3
{
  self->_thermalNominalDuration = a3;
}

- (double)thermalLightDuration
{
  return self->_thermalLightDuration;
}

- (void)setThermalLightDuration:(double)a3
{
  self->_thermalLightDuration = a3;
}

- (double)thermalModerateDuration
{
  return self->_thermalModerateDuration;
}

- (void)setThermalModerateDuration:(double)a3
{
  self->_thermalModerateDuration = a3;
}

- (double)thermalHeavyDuration
{
  return self->_thermalHeavyDuration;
}

- (void)setThermalHeavyDuration:(double)a3
{
  self->_thermalHeavyDuration = a3;
}

- (double)thermalTrappingDuration
{
  return self->_thermalTrappingDuration;
}

- (void)setThermalTrappingDuration:(double)a3
{
  self->_thermalTrappingDuration = a3;
}

- (double)thermalSleepingDuration
{
  return self->_thermalSleepingDuration;
}

- (void)setThermalSleepingDuration:(double)a3
{
  self->_thermalSleepingDuration = a3;
}

- (int)thermalLevelAtStartOfCall
{
  return self->_thermalLevelAtStartOfCall;
}

- (void)setThermalLevelAtStartOfCall:(int)a3
{
  self->_thermalLevelAtStartOfCall = a3;
}

- (int)maxThermalLevelInCall
{
  return self->_maxThermalLevelInCall;
}

- (void)setMaxThermalLevelInCall:(int)a3
{
  self->_maxThermalLevelInCall = a3;
}

- (int)thermalLevelAtEndOfCall
{
  return self->_thermalLevelAtEndOfCall;
}

- (void)setThermalLevelAtEndOfCall:(int)a3
{
  self->_thermalLevelAtEndOfCall = a3;
}

- (double)currentThermalLevelStartTime
{
  return self->_currentThermalLevelStartTime;
}

- (void)setCurrentThermalLevelStartTime:(double)a3
{
  self->_currentThermalLevelStartTime = a3;
}

@end