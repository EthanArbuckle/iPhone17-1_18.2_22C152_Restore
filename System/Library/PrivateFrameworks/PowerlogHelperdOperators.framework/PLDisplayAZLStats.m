@interface PLDisplayAZLStats
- (NSNumber)AvgPower;
- (NSNumber)azlAccum;
- (NSNumber)blFrameCount;
- (NSNumber)blUpdateCount;
- (NSNumber)nitsAccum;
- (void)setAvgPower:(id)a3;
- (void)setAzlAccum:(id)a3;
- (void)setBlFrameCount:(id)a3;
- (void)setBlUpdateCount:(id)a3;
- (void)setNitsAccum:(id)a3;
@end

@implementation PLDisplayAZLStats

- (NSNumber)AvgPower
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvgPower:(id)a3
{
}

- (NSNumber)azlAccum
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAzlAccum:(id)a3
{
}

- (NSNumber)nitsAccum
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNitsAccum:(id)a3
{
}

- (NSNumber)blUpdateCount
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBlUpdateCount:(id)a3
{
}

- (NSNumber)blFrameCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBlFrameCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blFrameCount, 0);
  objc_storeStrong((id *)&self->_blUpdateCount, 0);
  objc_storeStrong((id *)&self->_nitsAccum, 0);
  objc_storeStrong((id *)&self->_azlAccum, 0);
  objc_storeStrong((id *)&self->_AvgPower, 0);
}

@end