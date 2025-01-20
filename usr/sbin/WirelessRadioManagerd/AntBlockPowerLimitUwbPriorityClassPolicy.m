@interface AntBlockPowerLimitUwbPriorityClassPolicy
- (AntBlockPowerLimitUwbPriorityClassPolicy)init;
- (BOOL)mDenyVoiceProtect;
- (BOOL)mEnable;
- (BOOL)mMitigationRequired;
- (unsigned)mMitigationTimer;
- (unsigned)mPriorityClass;
- (void)setMDenyVoiceProtect:(BOOL)a3;
- (void)setMEnable:(BOOL)a3;
- (void)setMMitigationRequired:(BOOL)a3;
- (void)setMMitigationTimer:(unsigned int)a3;
- (void)setMPriorityClass:(unsigned __int8)a3;
- (void)setParameterEnable:(BOOL)a3 PriorityClass:(unsigned __int8)a4 MitigationRequired:(BOOL)a5 DenyVoiceProtect:(BOOL)a6 MitigationTimer:(unsigned int)a7;
@end

@implementation AntBlockPowerLimitUwbPriorityClassPolicy

- (AntBlockPowerLimitUwbPriorityClassPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)AntBlockPowerLimitUwbPriorityClassPolicy;
  result = [(AntBlockPowerLimitUwbPriorityClassPolicy *)&v3 init];
  result->_mEnable = 0;
  return result;
}

- (void)setParameterEnable:(BOOL)a3 PriorityClass:(unsigned __int8)a4 MitigationRequired:(BOOL)a5 DenyVoiceProtect:(BOOL)a6 MitigationTimer:(unsigned int)a7
{
  self->_mEnable = a3;
  self->_mPriorityClass = a4;
  self->_mMitigationRequired = a5;
  self->_mDenyVoiceProtect = a6;
  self->_mMitigationTimer = a7;
}

- (BOOL)mEnable
{
  return self->_mEnable;
}

- (void)setMEnable:(BOOL)a3
{
  self->_mEnable = a3;
}

- (unsigned)mPriorityClass
{
  return self->_mPriorityClass;
}

- (void)setMPriorityClass:(unsigned __int8)a3
{
  self->_mPriorityClass = a3;
}

- (BOOL)mMitigationRequired
{
  return self->_mMitigationRequired;
}

- (void)setMMitigationRequired:(BOOL)a3
{
  self->_mMitigationRequired = a3;
}

- (BOOL)mDenyVoiceProtect
{
  return self->_mDenyVoiceProtect;
}

- (void)setMDenyVoiceProtect:(BOOL)a3
{
  self->_mDenyVoiceProtect = a3;
}

- (unsigned)mMitigationTimer
{
  return self->_mMitigationTimer;
}

- (void)setMMitigationTimer:(unsigned int)a3
{
  self->_mMitigationTimer = a3;
}

@end