@interface AntBlockPowerLimitGnssImdBasePolicy
- (AntBlockPowerLimitGnssImdAggressorPolicy)mCellAggressor1;
- (AntBlockPowerLimitGnssImdAggressorPolicy)mCellAggressor2;
- (AntBlockPowerLimitGnssImdBasePolicy)init;
- (BOOL)mEnable;
- (BOOL)mGnssL5TunerAllowed;
- (BOOL)mParallelMitigationAllowed;
- (unsigned)mGnssVictimBw_KHz;
- (unsigned)mGnssVictimFreq_KHz;
- (unsigned)mImdType;
- (void)setCellAggressor1:(id)a3;
- (void)setCellAggressor2:(id)a3;
- (void)setMCellAggressor1:(id)a3;
- (void)setMCellAggressor2:(id)a3;
- (void)setMEnable:(BOOL)a3;
- (void)setMGnssL5TunerAllowed:(BOOL)a3;
- (void)setMGnssVictimBw_KHz:(unsigned int)a3;
- (void)setMGnssVictimFreq_KHz:(unsigned int)a3;
- (void)setMImdType:(unsigned int)a3;
- (void)setMParallelMitigationAllowed:(BOOL)a3;
- (void)setParameter:(BOOL)a3 ImdType:(unsigned int)a4 GnssL5TunerAllowed:(BOOL)a5 ParallelMitigationAllowed:(BOOL)a6 GnssVictimFreq_KHz:(unsigned int)a7 GnssVictimBw_KHz:(unsigned int)a8;
@end

@implementation AntBlockPowerLimitGnssImdBasePolicy

- (AntBlockPowerLimitGnssImdBasePolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitGnssImdBasePolicy;
  v2 = [(AntBlockPowerLimitGnssImdBasePolicy *)&v6 init];
  *(_WORD *)&v2->_mEnable = 1;
  v2->_mImdType = 0;
  mCellAggressor1 = v2->_mCellAggressor1;
  *(void *)&v2->_mGnssVictimFreq_KHz = 0;
  v2->_mCellAggressor1 = 0;

  mCellAggressor2 = v2->_mCellAggressor2;
  v2->_mCellAggressor2 = 0;

  v2->_mParallelMitigationAllowed = 1;
  return v2;
}

- (void)setParameter:(BOOL)a3 ImdType:(unsigned int)a4 GnssL5TunerAllowed:(BOOL)a5 ParallelMitigationAllowed:(BOOL)a6 GnssVictimFreq_KHz:(unsigned int)a7 GnssVictimBw_KHz:(unsigned int)a8
{
  self->_mEnable = a3;
  self->_mGnssL5TunerAllowed = a5;
  self->_mImdType = a4;
  self->_mGnssVictimFreq_KHz = a7;
  self->_mGnssVictimBw_KHz = a8;
  self->_mParallelMitigationAllowed = a6;
}

- (void)setCellAggressor1:(id)a3
{
}

- (void)setCellAggressor2:(id)a3
{
}

- (BOOL)mEnable
{
  return self->_mEnable;
}

- (void)setMEnable:(BOOL)a3
{
  self->_mEnable = a3;
}

- (unsigned)mImdType
{
  return self->_mImdType;
}

- (void)setMImdType:(unsigned int)a3
{
  self->_mImdType = a3;
}

- (BOOL)mGnssL5TunerAllowed
{
  return self->_mGnssL5TunerAllowed;
}

- (void)setMGnssL5TunerAllowed:(BOOL)a3
{
  self->_mGnssL5TunerAllowed = a3;
}

- (BOOL)mParallelMitigationAllowed
{
  return self->_mParallelMitigationAllowed;
}

- (void)setMParallelMitigationAllowed:(BOOL)a3
{
  self->_mParallelMitigationAllowed = a3;
}

- (unsigned)mGnssVictimFreq_KHz
{
  return self->_mGnssVictimFreq_KHz;
}

- (void)setMGnssVictimFreq_KHz:(unsigned int)a3
{
  self->_mGnssVictimFreq_KHz = a3;
}

- (unsigned)mGnssVictimBw_KHz
{
  return self->_mGnssVictimBw_KHz;
}

- (void)setMGnssVictimBw_KHz:(unsigned int)a3
{
  self->_mGnssVictimBw_KHz = a3;
}

- (AntBlockPowerLimitGnssImdAggressorPolicy)mCellAggressor1
{
  return self->_mCellAggressor1;
}

- (void)setMCellAggressor1:(id)a3
{
}

- (AntBlockPowerLimitGnssImdAggressorPolicy)mCellAggressor2
{
  return self->_mCellAggressor2;
}

- (void)setMCellAggressor2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mCellAggressor2, 0);

  objc_storeStrong((id *)&self->_mCellAggressor1, 0);
}

@end