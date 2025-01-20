@interface MapsPanTestPoint
- ($1AB5FA073B851C12C2339EC22442E995)testPoint;
- (double)timeToNextPoint;
- (void)setTestPoint:(id)a3;
- (void)setTimeToNextPoint:(double)a3;
@end

@implementation MapsPanTestPoint

- ($1AB5FA073B851C12C2339EC22442E995)testPoint
{
  double latitude = self->_testPoint.latitude;
  double longitude = self->_testPoint.longitude;
  double altitude = self->_testPoint.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setTestPoint:(id)a3
{
  self->_testPoint = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (double)timeToNextPoint
{
  return self->_timeToNextPoint;
}

- (void)setTimeToNextPoint:(double)a3
{
  self->_timeToNextPoint = a3;
}

@end