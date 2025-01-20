@interface TVRCFindingSessionData
- (BOOL)gotToHere;
- (BOOL)remoteIsConnectedToATV;
- (NSDate)firstMeasurementTime;
- (NSDate)sessionEndTime;
- (NSDate)sessionStartTime;
- (double)endingProximityMeasurement;
- (double)startingProximityMeasurement;
- (double)timeToHere;
- (int64_t)numberOfGotCloserRegionTransitions;
- (int64_t)numberOfGotFartherRegionTransitions;
- (void)setEndingProximityMeasurement:(double)a3;
- (void)setFirstMeasurementTime:(id)a3;
- (void)setGotToHere:(BOOL)a3;
- (void)setNumberOfGotCloserRegionTransitions:(int64_t)a3;
- (void)setNumberOfGotFartherRegionTransitions:(int64_t)a3;
- (void)setRemoteIsConnectedToATV:(BOOL)a3;
- (void)setSessionEndTime:(id)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setStartingProximityMeasurement:(double)a3;
- (void)setTimeToHere:(double)a3;
@end

@implementation TVRCFindingSessionData

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
}

- (NSDate)sessionEndTime
{
  return self->_sessionEndTime;
}

- (void)setSessionEndTime:(id)a3
{
}

- (NSDate)firstMeasurementTime
{
  return self->_firstMeasurementTime;
}

- (void)setFirstMeasurementTime:(id)a3
{
}

- (BOOL)remoteIsConnectedToATV
{
  return self->_remoteIsConnectedToATV;
}

- (void)setRemoteIsConnectedToATV:(BOOL)a3
{
  self->_remoteIsConnectedToATV = a3;
}

- (double)startingProximityMeasurement
{
  return self->_startingProximityMeasurement;
}

- (void)setStartingProximityMeasurement:(double)a3
{
  self->_startingProximityMeasurement = a3;
}

- (double)endingProximityMeasurement
{
  return self->_endingProximityMeasurement;
}

- (void)setEndingProximityMeasurement:(double)a3
{
  self->_endingProximityMeasurement = a3;
}

- (int64_t)numberOfGotCloserRegionTransitions
{
  return self->_numberOfGotCloserRegionTransitions;
}

- (void)setNumberOfGotCloserRegionTransitions:(int64_t)a3
{
  self->_numberOfGotCloserRegionTransitions = a3;
}

- (int64_t)numberOfGotFartherRegionTransitions
{
  return self->_numberOfGotFartherRegionTransitions;
}

- (void)setNumberOfGotFartherRegionTransitions:(int64_t)a3
{
  self->_numberOfGotFartherRegionTransitions = a3;
}

- (BOOL)gotToHere
{
  return self->_gotToHere;
}

- (void)setGotToHere:(BOOL)a3
{
  self->_gotToHere = a3;
}

- (double)timeToHere
{
  return self->_timeToHere;
}

- (void)setTimeToHere:(double)a3
{
  self->_timeToHere = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstMeasurementTime, 0);
  objc_storeStrong((id *)&self->_sessionEndTime, 0);

  objc_storeStrong((id *)&self->_sessionStartTime, 0);
}

@end