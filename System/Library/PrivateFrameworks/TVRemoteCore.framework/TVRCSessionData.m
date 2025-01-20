@interface TVRCSessionData
- (BOOL)directionalControlsEnabled;
- (BOOL)requiredPairing;
- (BOOL)usedRTI;
- (BOOL)usedSiri;
- (NSDate)sessionStartTime;
- (NSString)launchContextDesc;
- (void)setDirectionalControlsEnabled:(BOOL)a3;
- (void)setLaunchContextDesc:(id)a3;
- (void)setRequiredPairing:(BOOL)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setUsedRTI:(BOOL)a3;
- (void)setUsedSiri:(BOOL)a3;
@end

@implementation TVRCSessionData

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
}

- (BOOL)usedRTI
{
  return self->_usedRTI;
}

- (void)setUsedRTI:(BOOL)a3
{
  self->_usedRTI = a3;
}

- (BOOL)usedSiri
{
  return self->_usedSiri;
}

- (void)setUsedSiri:(BOOL)a3
{
  self->_usedSiri = a3;
}

- (BOOL)requiredPairing
{
  return self->_requiredPairing;
}

- (void)setRequiredPairing:(BOOL)a3
{
  self->_requiredPairing = a3;
}

- (BOOL)directionalControlsEnabled
{
  return self->_directionalControlsEnabled;
}

- (void)setDirectionalControlsEnabled:(BOOL)a3
{
  self->_directionalControlsEnabled = a3;
}

- (NSString)launchContextDesc
{
  return self->_launchContextDesc;
}

- (void)setLaunchContextDesc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchContextDesc, 0);

  objc_storeStrong((id *)&self->_sessionStartTime, 0);
}

@end