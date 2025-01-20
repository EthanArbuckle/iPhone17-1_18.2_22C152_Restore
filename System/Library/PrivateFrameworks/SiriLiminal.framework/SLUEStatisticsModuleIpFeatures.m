@interface SLUEStatisticsModuleIpFeatures
- (NSString)cohortType;
- (SLUEStatisticsModuleIpFeatures)initWithDefaults;
- (float)buttonPressIntendedRatio;
- (float)buttonPressRequestRatio;
- (float)intendedRatio;
- (float)sdsdRetryCount;
- (float)voiceTriggerIntendedRatio;
- (float)voiceTriggerRequestRatio;
- (unint64_t)buttonPressCount;
- (unint64_t)intendedCount;
- (unint64_t)requestCount;
- (unint64_t)unintendedCount;
- (unint64_t)voiceTriggerCount;
- (unint64_t)voiceTriggerIntendedCount;
- (unint64_t)voiceTriggerUnintendedCount;
- (void)setButtonPressCount:(unint64_t)a3;
- (void)setButtonPressIntendedRatio:(float)a3;
- (void)setButtonPressRequestRatio:(float)a3;
- (void)setCohortType:(id)a3;
- (void)setIntendedCount:(unint64_t)a3;
- (void)setIntendedRatio:(float)a3;
- (void)setRequestCount:(unint64_t)a3;
- (void)setSdsdRetryCount:(float)a3;
- (void)setUnintendedCount:(unint64_t)a3;
- (void)setVoiceTriggerCount:(unint64_t)a3;
- (void)setVoiceTriggerIntendedCount:(unint64_t)a3;
- (void)setVoiceTriggerIntendedRatio:(float)a3;
- (void)setVoiceTriggerRequestRatio:(float)a3;
- (void)setVoiceTriggerUnintendedCount:(unint64_t)a3;
@end

@implementation SLUEStatisticsModuleIpFeatures

- (void)setSdsdRetryCount:(float)a3
{
  self->_sdsdRetryCount = a3;
}

- (float)sdsdRetryCount
{
  return self->_sdsdRetryCount;
}

- (void)setButtonPressIntendedRatio:(float)a3
{
  self->_buttonPressIntendedRatio = a3;
}

- (float)buttonPressIntendedRatio
{
  return self->_buttonPressIntendedRatio;
}

- (void)setButtonPressRequestRatio:(float)a3
{
  self->_buttonPressRequestRatio = a3;
}

- (float)buttonPressRequestRatio
{
  return self->_buttonPressRequestRatio;
}

- (void)setVoiceTriggerIntendedRatio:(float)a3
{
  self->_voiceTriggerIntendedRatio = a3;
}

- (float)voiceTriggerIntendedRatio
{
  return self->_voiceTriggerIntendedRatio;
}

- (void)setVoiceTriggerRequestRatio:(float)a3
{
  self->_voiceTriggerRequestRatio = a3;
}

- (float)voiceTriggerRequestRatio
{
  return self->_voiceTriggerRequestRatio;
}

- (void)setIntendedRatio:(float)a3
{
  self->_intendedRatio = a3;
}

- (float)intendedRatio
{
  return self->_intendedRatio;
}

- (void)setVoiceTriggerUnintendedCount:(unint64_t)a3
{
  self->_voiceTriggerUnintendedCount = a3;
}

- (unint64_t)voiceTriggerUnintendedCount
{
  return self->_voiceTriggerUnintendedCount;
}

- (void)setVoiceTriggerIntendedCount:(unint64_t)a3
{
  self->_voiceTriggerIntendedCount = a3;
}

- (unint64_t)voiceTriggerIntendedCount
{
  return self->_voiceTriggerIntendedCount;
}

- (void)setVoiceTriggerCount:(unint64_t)a3
{
  self->_voiceTriggerCount = a3;
}

- (unint64_t)voiceTriggerCount
{
  return self->_voiceTriggerCount;
}

- (void)setButtonPressCount:(unint64_t)a3
{
  self->_buttonPressCount = a3;
}

- (unint64_t)buttonPressCount
{
  return self->_buttonPressCount;
}

- (void)setUnintendedCount:(unint64_t)a3
{
  self->_unintendedCount = a3;
}

- (unint64_t)unintendedCount
{
  return self->_unintendedCount;
}

- (void)setIntendedCount:(unint64_t)a3
{
  self->_intendedCount = a3;
}

- (unint64_t)intendedCount
{
  return self->_intendedCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setCohortType:(id)a3
{
  self->_cohortType = (NSString *)a3;
}

- (NSString)cohortType
{
  return self->_cohortType;
}

- (SLUEStatisticsModuleIpFeatures)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)SLUEStatisticsModuleIpFeatures;
  result = [(SLUEStatisticsModuleIpFeatures *)&v3 init];
  if (result)
  {
    *(void *)&result->_buttonPressIntendedRatio = 0;
    result->_cohortType = (NSString *)&stru_26D09E668;
    *(void *)&result->_intendedRatio = 0;
    *(void *)&result->_voiceTriggerIntendedRatio = 0;
    *(_OWORD *)&result->_requestCount = 0u;
    *(_OWORD *)&result->_unintendedCount = 0u;
    *(_OWORD *)&result->_voiceTriggerCount = 0u;
    result->_voiceTriggerUnintendedCount = 0;
  }
  return result;
}

@end