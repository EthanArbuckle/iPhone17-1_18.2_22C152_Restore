@interface VTCorruptDetector
- (BOOL)audioHasZeroRun;
- (VTCorruptDetector)init;
- (int)getMaxZeroSampleCount;
- (void)analyze:(AudioBuffer)a3;
- (void)reset;
@end

@implementation VTCorruptDetector

- (BOOL)audioHasZeroRun
{
  return self->_maxZeroSamplesCount > 1599;
}

- (int)getMaxZeroSampleCount
{
  return self->_maxZeroSamplesCount;
}

- (void)analyze:(AudioBuffer)a3
{
  uint64_t v3 = *(void *)&a3.mNumberChannels >> 33;
  if (*(void *)&a3.mNumberChannels >> 33)
  {
    int zeroSamplesCount = self->_zeroSamplesCount;
    int maxZeroSamplesCount = self->_maxZeroSamplesCount;
    do
    {
      int v7 = *(__int16 *)a3.mData;
      a3.mData = (char *)a3.mData + 2;
      int v6 = v7;
      if (v7 < 0) {
        int v6 = -v6;
      }
      if ((unsigned __int16)v6 < 5u) {
        ++zeroSamplesCount;
      }
      else {
        int zeroSamplesCount = 0;
      }
      if (maxZeroSamplesCount <= zeroSamplesCount) {
        int maxZeroSamplesCount = zeroSamplesCount;
      }
      --v3;
    }
    while (v3);
    self->_int zeroSamplesCount = zeroSamplesCount;
    self->_int maxZeroSamplesCount = maxZeroSamplesCount;
  }
}

- (void)reset
{
  *(void *)&self->_int zeroSamplesCount = 0;
}

- (VTCorruptDetector)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTCorruptDetector;
  result = [(VTCorruptDetector *)&v3 init];
  if (result) {
    *(void *)&result->_int zeroSamplesCount = 0;
  }
  return result;
}

@end