@interface NavTrayWaypointRow
+ (id)waypointRowsFromNavigationService:(id)a3 withWaypoints:(id)a4;
- (GEOComposedWaypoint)waypoint;
- (MNDisplayETALegInfo)etaInfo;
- (unint64_t)waypointIndex;
- (void)setEtaInfo:(id)a3;
- (void)setWaypoint:(id)a3;
- (void)setWaypointIndex:(unint64_t)a3;
@end

@implementation NavTrayWaypointRow

+ (id)waypointRowsFromNavigationService:(id)a3 withWaypoints:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    [v5 stepIndex];
    v7 = [v5 route];
    v8 = [v7 steps];
    [v8 count];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A5282C;
    v11[3] = &unk_101315400;
    v13 = (char *)[v5 targetLegIndex] + 1;
    id v12 = v5;
    v9 = sub_100099700(v6, v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(unint64_t)a3
{
  self->_waypointIndex = a3;
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
}

- (MNDisplayETALegInfo)etaInfo
{
  return self->_etaInfo;
}

- (void)setEtaInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaInfo, 0);

  objc_storeStrong((id *)&self->_waypoint, 0);
}

@end