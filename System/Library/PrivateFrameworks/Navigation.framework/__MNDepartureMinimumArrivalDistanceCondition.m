@interface __MNDepartureMinimumArrivalDistanceCondition
- (NSString)name;
- (__MNDepartureMinimumArrivalDistanceCondition)initWithUpdater:(id)a3 distanceThreshold:(double)a4;
- (double)scoreForLocation:(id)a3;
@end

@implementation __MNDepartureMinimumArrivalDistanceCondition

- (__MNDepartureMinimumArrivalDistanceCondition)initWithUpdater:(id)a3 distanceThreshold:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)__MNDepartureMinimumArrivalDistanceCondition;
  v7 = [(__MNDepartureMinimumArrivalDistanceCondition *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_updater, v6);
    v8->_threshold = a4;
    v8->_closestDistanceToWaypoint = 1.79769313e308;
    v9 = v8;
  }

  return v8;
}

- (double)scoreForLocation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_updater);
    v7 = [v6 arrivalLeg];

    [v4 coordinate];
    v8 = [v7 destination];
    [v8 coordinate];

    GEOCalculateDistance();
    double v10 = v9;
    if (v9 < self->_closestDistanceToWaypoint)
    {
      self->_double closestDistanceToWaypoint = v9;
      objc_super v11 = MNGetMNDepartureUpdaterLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v27 = 134217984;
        *(double *)v28 = v10;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "Updating closest distance to waypoint: %g", (uint8_t *)&v27, 0xCu);
      }
    }
    id v12 = objc_loadWeakRetained((id *)&self->_updater);
    v13 = [v12 route];
    v14 = [v4 routeMatch];
    unint64_t v15 = objc_msgSend(v13, "segmentIndexForPointIndex:", objc_msgSend(v14, "routeCoordinate"));

    double v16 = -1.0;
    if ([v4 state] == 1)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_updater);
      unint64_t v18 = [v17 arrivalWaypointLegIndex];

      if (v15 > v18)
      {
        double closestDistanceToWaypoint = self->_closestDistanceToWaypoint;
        double threshold = self->_threshold;
        if (closestDistanceToWaypoint <= threshold)
        {
          v21 = MNGetMNDepartureUpdaterLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = objc_loadWeakRetained((id *)&self->_updater);
            int v23 = [v22 arrivalWaypointLegIndex];
            double v24 = self->_closestDistanceToWaypoint;
            double v25 = self->_threshold;
            int v27 = 67109632;
            *(_DWORD *)v28 = v23;
            *(_WORD *)&v28[4] = 2048;
            *(double *)&v28[6] = v24;
            __int16 v29 = 2048;
            double v30 = v25;
            _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_DEFAULT, "Minimum distance to intermediary waypoint arrival point completed. Leg: %d. Distance (%0.1fm) < Required distance (%0.1fm).", (uint8_t *)&v27, 0x1Cu);
          }
          double v16 = 1.0;
        }
        else
        {
          double v16 = threshold / closestDistanceToWaypoint;
        }
      }
    }
  }
  else
  {
    double v16 = -1.0;
  }

  return v16;
}

- (NSString)name
{
  return (NSString *)@"__MNDepartureMinimumArrivalDistanceCondition";
}

- (void).cxx_destruct
{
}

@end