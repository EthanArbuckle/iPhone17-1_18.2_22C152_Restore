@interface ServiceState
- (BOOL)pausedLocalization;
- (BOOL)updateLocation;
- (CLGpsPosition)lastLocation;
- (IndoorProtocolProxy)delegateProxy;
- (void)setDelegateProxy:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setPausedLocalization:(BOOL)a3;
- (void)setUpdateLocation:(BOOL)a3;
@end

@implementation ServiceState

- (CLGpsPosition)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (BOOL)pausedLocalization
{
  return self->_pausedLocalization;
}

- (void)setPausedLocalization:(BOOL)a3
{
  self->_pausedLocalization = a3;
}

- (BOOL)updateLocation
{
  return self->_updateLocation;
}

- (void)setUpdateLocation:(BOOL)a3
{
  self->_updateLocation = a3;
}

- (IndoorProtocolProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (void)setDelegateProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProxy, 0);

  objc_storeStrong((id *)&self->_lastLocation, 0);
}

@end