@interface _MNLocationSimulationData
- ($212C09783140BCCD23384160D545CE0D)lastRouteCoordinate;
- (BOOL)endAtFinalDestination;
- (BOOL)isChinaShifted;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedRoute)routeToFollow;
- (MNActiveRouteInfo)initialRouteInfo;
- (MNActiveRouteInfo)routeInfo;
- (MNLocation)lastLocation;
- (NSString)requestingAppIdentifier;
- (double)currentTime;
- (double)minimumSpeed;
- (double)speedMultiplier;
- (double)speedOverride;
- (int64_t)simulationType;
- (unint64_t)currentLegIndex;
- (void)setAuditToken:(id)a3;
- (void)setCurrentLegIndex:(unint64_t)a3;
- (void)setCurrentTime:(double)a3;
- (void)setEndAtFinalDestination:(BOOL)a3;
- (void)setInitialRouteInfo:(id)a3;
- (void)setIsChinaShifted:(BOOL)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastRouteCoordinate:(id)a3;
- (void)setMinimumSpeed:(double)a3;
- (void)setRequestingAppIdentifier:(id)a3;
- (void)setRouteInfo:(id)a3;
- (void)setSimulationType:(int64_t)a3;
- (void)setSpeedMultiplier:(double)a3;
- (void)setSpeedOverride:(double)a3;
@end

@implementation _MNLocationSimulationData

- (GEOComposedRoute)routeToFollow
{
  uint64_t v2 = 32;
  if (self->_simulationType == 2) {
    uint64_t v2 = 24;
  }
  v3 = [*(id *)((char *)&self->super.isa + v2) route];
  return (GEOComposedRoute *)v3;
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (MNActiveRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
}

- (MNActiveRouteInfo)initialRouteInfo
{
  return self->_initialRouteInfo;
}

- (void)setInitialRouteInfo:(id)a3
{
}

- (MNLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- ($212C09783140BCCD23384160D545CE0D)lastRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_lastRouteCoordinate;
}

- (void)setLastRouteCoordinate:(id)a3
{
  self->_lastRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (unint64_t)currentLegIndex
{
  return self->_currentLegIndex;
}

- (void)setCurrentLegIndex:(unint64_t)a3
{
  self->_currentLegIndex = a3;
}

- (BOOL)isChinaShifted
{
  return self->_isChinaShifted;
}

- (void)setIsChinaShifted:(BOOL)a3
{
  self->_isChinaShifted = a3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
}

- (double)speedOverride
{
  return self->_speedOverride;
}

- (void)setSpeedOverride:(double)a3
{
  self->_speedOverride = a3;
}

- (double)speedMultiplier
{
  return self->_speedMultiplier;
}

- (void)setSpeedMultiplier:(double)a3
{
  self->_speedMultiplier = a3;
}

- (double)minimumSpeed
{
  return self->_minimumSpeed;
}

- (void)setMinimumSpeed:(double)a3
{
  self->_minimumSpeed = a3;
}

- (BOOL)endAtFinalDestination
{
  return self->_endAtFinalDestination;
}

- (void)setEndAtFinalDestination:(BOOL)a3
{
  self->_endAtFinalDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_initialRouteInfo, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

@end