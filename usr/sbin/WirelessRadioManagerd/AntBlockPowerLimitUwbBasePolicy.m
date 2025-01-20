@interface AntBlockPowerLimitUwbBasePolicy
- (AntBlockPowerLimitUwbBasePolicy)init;
- (BOOL)mEnable;
- (int)mCellularTxPowerCap;
- (unsigned)mCellularAntBitmap;
- (unsigned)mCellularBand;
- (unsigned)mCellularBandwidthKHz;
- (unsigned)mCellularCoexTech;
- (unsigned)mCellularFrequencyKHz;
- (unsigned)mMitigationType;
- (unsigned)mUwbAntBitmap;
- (unsigned)mUwbChannel;
- (void)setMCellularAntBitmap:(unsigned int)a3;
- (void)setMCellularBand:(unsigned int)a3;
- (void)setMCellularBandwidthKHz:(unsigned int)a3;
- (void)setMCellularCoexTech:(unsigned int)a3;
- (void)setMCellularFrequencyKHz:(unsigned int)a3;
- (void)setMCellularTxPowerCap:(int)a3;
- (void)setMEnable:(BOOL)a3;
- (void)setMMitigationType:(unsigned int)a3;
- (void)setMUwbAntBitmap:(unsigned int)a3;
- (void)setMUwbChannel:(unsigned __int16)a3;
- (void)setParameterEnable:(BOOL)a3 UwbChannel:(unsigned __int16)a4 UwbAntBitmap:(unsigned int)a5 CellularAntBitmap:(unsigned int)a6 MitigationType:(unsigned int)a7 CellularTxPowerCap:(int)a8 CoexTech:(unsigned int)a9 CellularBand:(unsigned int)a10 CellFreq:(unsigned int)a11 CellBW:(unsigned int)a12;
@end

@implementation AntBlockPowerLimitUwbBasePolicy

- (AntBlockPowerLimitUwbBasePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)AntBlockPowerLimitUwbBasePolicy;
  result = [(AntBlockPowerLimitUwbBasePolicy *)&v3 init];
  result->_mEnable = 0;
  return result;
}

- (void)setParameterEnable:(BOOL)a3 UwbChannel:(unsigned __int16)a4 UwbAntBitmap:(unsigned int)a5 CellularAntBitmap:(unsigned int)a6 MitigationType:(unsigned int)a7 CellularTxPowerCap:(int)a8 CoexTech:(unsigned int)a9 CellularBand:(unsigned int)a10 CellFreq:(unsigned int)a11 CellBW:(unsigned int)a12
{
  self->_mEnable = a3;
  self->_mUwbChannel = a4;
  self->_mUwbAntBitmap = a5;
  self->_mCellularAntBitmap = a6;
  self->_mMitigationType = a7;
  self->_mCellularTxPowerCap = a8;
  *(_OWORD *)&self->_mCellularCoexTech = *(_OWORD *)&a9;
}

- (BOOL)mEnable
{
  return self->_mEnable;
}

- (void)setMEnable:(BOOL)a3
{
  self->_mEnable = a3;
}

- (unsigned)mUwbChannel
{
  return self->_mUwbChannel;
}

- (void)setMUwbChannel:(unsigned __int16)a3
{
  self->_mUwbChannel = a3;
}

- (unsigned)mUwbAntBitmap
{
  return self->_mUwbAntBitmap;
}

- (void)setMUwbAntBitmap:(unsigned int)a3
{
  self->_mUwbAntBitmap = a3;
}

- (unsigned)mCellularAntBitmap
{
  return self->_mCellularAntBitmap;
}

- (void)setMCellularAntBitmap:(unsigned int)a3
{
  self->_mCellularAntBitmap = a3;
}

- (unsigned)mMitigationType
{
  return self->_mMitigationType;
}

- (void)setMMitigationType:(unsigned int)a3
{
  self->_mMitigationType = a3;
}

- (int)mCellularTxPowerCap
{
  return self->_mCellularTxPowerCap;
}

- (void)setMCellularTxPowerCap:(int)a3
{
  self->_mCellularTxPowerCap = a3;
}

- (unsigned)mCellularCoexTech
{
  return self->_mCellularCoexTech;
}

- (void)setMCellularCoexTech:(unsigned int)a3
{
  self->_mCellularCoexTech = a3;
}

- (unsigned)mCellularBand
{
  return self->_mCellularBand;
}

- (void)setMCellularBand:(unsigned int)a3
{
  self->_mCellularBand = a3;
}

- (unsigned)mCellularFrequencyKHz
{
  return self->_mCellularFrequencyKHz;
}

- (void)setMCellularFrequencyKHz:(unsigned int)a3
{
  self->_mCellularFrequencyKHz = a3;
}

- (unsigned)mCellularBandwidthKHz
{
  return self->_mCellularBandwidthKHz;
}

- (void)setMCellularBandwidthKHz:(unsigned int)a3
{
  self->_mCellularBandwidthKHz = a3;
}

@end