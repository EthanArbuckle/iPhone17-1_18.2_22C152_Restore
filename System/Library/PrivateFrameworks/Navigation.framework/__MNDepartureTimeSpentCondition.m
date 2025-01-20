@interface __MNDepartureTimeSpentCondition
- (NSString)name;
- (__MNDepartureTimeSpentCondition)initWithUpdater:(id)a3 timeThreshold:(double)a4;
- (double)scoreForLocation:(id)a3;
@end

@implementation __MNDepartureTimeSpentCondition

- (__MNDepartureTimeSpentCondition)initWithUpdater:(id)a3 timeThreshold:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)__MNDepartureTimeSpentCondition;
  v7 = [(__MNDepartureTimeSpentCondition *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_updater, v6);
    v8->_threshold = fmin(a4, 1.0);
    v9 = v8;
  }

  return v8;
}

- (double)scoreForLocation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  double v6 = -1.0;
  if (WeakRetained)
  {
    initialDate = self->_initialDate;
    if (initialDate)
    {
      [(NSDate *)initialDate timeIntervalSinceNow];
      double v9 = v8;
      id v10 = objc_loadWeakRetained((id *)&self->_updater);
      objc_super v11 = [v10 route];
      v12 = [v4 routeMatch];
      unint64_t v13 = objc_msgSend(v11, "segmentIndexForPointIndex:", objc_msgSend(v12, "routeCoordinate"));

      if ([v4 state] == 1)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_updater);
        unint64_t v15 = [v14 arrivalWaypointLegIndex];

        if (v13 > v15)
        {
          double threshold = self->_threshold;
          if (threshold <= -v9)
          {
            v20 = MNGetMNDepartureUpdaterLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = objc_loadWeakRetained((id *)&self->_updater);
              int v22 = [v21 arrivalWaypointLegIndex];
              double v23 = self->_threshold;
              v24[0] = 67109632;
              v24[1] = v22;
              __int16 v25 = 2048;
              double v26 = -v9;
              __int16 v27 = 2048;
              double v28 = v23;
              _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEFAULT, "Minimum time spent at intermediary waypoint arrival point completed. Leg: %d. Time (%0.1fm) > Required time (%0.1fm).", (uint8_t *)v24, 0x1Cu);
            }
            double v6 = 1.0;
          }
          else
          {
            double v6 = -v9 / threshold;
          }
        }
      }
    }
    else
    {
      v17 = [MEMORY[0x1E4F1C9C8] now];
      v18 = self->_initialDate;
      self->_initialDate = v17;
    }
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"__MNDepartureTimeSpentCondition";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_destroyWeak((id *)&self->_updater);
}

@end