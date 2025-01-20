@interface MNTraceNavigationUpdatesDepartWaypointRow
- (GEOComposedWaypoint)waypoint;
- (int64_t)navigationUpdateType;
- (unint64_t)legIndex;
- (unint64_t)reason;
- (void)setLegIndex:(unint64_t)a3;
- (void)setReason:(unint64_t)a3;
- (void)setWaypoint:(id)a3;
@end

@implementation MNTraceNavigationUpdatesDepartWaypointRow

- (int64_t)navigationUpdateType
{
  return 2;
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void).cxx_destruct
{
}

@end