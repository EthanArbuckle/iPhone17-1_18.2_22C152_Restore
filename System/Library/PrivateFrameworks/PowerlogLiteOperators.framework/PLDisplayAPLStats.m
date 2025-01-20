@interface PLDisplayAPLStats
- (NSNumber)avgAPL;
- (NSNumber)avgBlue;
- (NSNumber)avgGreen;
- (NSNumber)avgPower;
- (NSNumber)avgRed;
- (NSNumber)frames;
- (void)setAvgAPL:(id)a3;
- (void)setAvgBlue:(id)a3;
- (void)setAvgGreen:(id)a3;
- (void)setAvgPower:(id)a3;
- (void)setAvgRed:(id)a3;
- (void)setFrames:(id)a3;
@end

@implementation PLDisplayAPLStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avgAPL, 0);
  objc_storeStrong((id *)&self->_avgPower, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_avgBlue, 0);
  objc_storeStrong((id *)&self->_avgGreen, 0);
  objc_storeStrong((id *)&self->_avgRed, 0);
}

- (void)setFrames:(id)a3
{
}

- (NSNumber)frames
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAvgRed:(id)a3
{
}

- (void)setAvgGreen:(id)a3
{
}

- (void)setAvgBlue:(id)a3
{
}

- (NSNumber)avgRed
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)avgGreen
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)avgBlue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAvgPower:(id)a3
{
}

- (void)setAvgAPL:(id)a3
{
}

- (NSNumber)avgPower
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)avgAPL
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

@end