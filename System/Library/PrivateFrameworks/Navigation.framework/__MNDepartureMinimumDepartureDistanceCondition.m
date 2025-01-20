@interface __MNDepartureMinimumDepartureDistanceCondition
- (NSString)name;
- (__MNDepartureMinimumDepartureDistanceCondition)initWithUpdater:(id)a3 arrivalPoints:(id)a4 distanceThreshold:(double)a5;
- (__MNDepartureMinimumDepartureDistanceCondition)initWithUpdater:(id)a3 distanceThreshold:(double)a4;
- (double)scoreForLocation:(id)a3;
@end

@implementation __MNDepartureMinimumDepartureDistanceCondition

- (__MNDepartureMinimumDepartureDistanceCondition)initWithUpdater:(id)a3 arrivalPoints:(id)a4 distanceThreshold:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)__MNDepartureMinimumDepartureDistanceCondition;
  v10 = [(__MNDepartureMinimumDepartureDistanceCondition *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_updater, v8);
    objc_storeStrong((id *)&v11->_arrivalPoints, a4);
    v11->_threshold = a5;
    v12 = v11;
  }

  return v11;
}

- (__MNDepartureMinimumDepartureDistanceCondition)initWithUpdater:(id)a3 distanceThreshold:(double)a4
{
  return [(__MNDepartureMinimumDepartureDistanceCondition *)self initWithUpdater:a3 arrivalPoints:0 distanceThreshold:a4];
}

- (double)scoreForLocation:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_updater = &self->_updater;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_updater);
    id v8 = [v7 arrivalLeg];

    [v4 coordinate];
    id v9 = objc_loadWeakRetained((id *)&self->_updater);
    v10 = [v9 route];
    objc_msgSend(v10, "pointAt:", objc_msgSend(v8, "endPointIndex"));

    arrivalPoints = self->_arrivalPoints;
    if (arrivalPoints)
    {
      double threshold = self->_threshold;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v12 = arrivalPoints;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        double v16 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v19 = [v18 point];
            [v19 lat];
            v20 = [v18 point];
            [v20 lng];

            GEOCalculateDistance();
            if (v21 > v16)
            {
              double v22 = v21;
              GEOCalculateDistance();
              double threshold = v23 + self->_threshold;
              double v16 = v22;
            }
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v14);
      }
      else
      {
        double v16 = 0.0;
      }

      double v28 = threshold;
    }
    else
    {
      v25 = [v8 destination];
      [v25 coordinate];

      GEOCalculateDistance();
      double v16 = v26;
      GEOCalculateDistance();
      double v28 = v27 + self->_threshold;
    }
    if (v16 >= v28)
    {
      v29 = MNGetMNDepartureUpdaterLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = objc_loadWeakRetained((id *)p_updater);
        int v31 = [v30 arrivalWaypointLegIndex];
        *(_DWORD *)buf = 67109632;
        int v39 = v31;
        __int16 v40 = 2048;
        double v41 = v16;
        __int16 v42 = 2048;
        double v43 = v28;
        _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEFAULT, "Minimum deviation from intermediary waypoint detected. Leg: %d. Distance (%0.1fm) > Required distance (%0.1fm).", buf, 0x1Cu);
      }
      double v24 = 1.0;
    }
    else
    {
      double v24 = v16 / v28;
    }
  }
  else
  {
    double v24 = -1.0;
  }

  return v24;
}

- (NSString)name
{
  return (NSString *)@"__MNDepartureMinimumDepartureDistanceCondition";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalPoints, 0);
  objc_destroyWeak((id *)&self->_updater);
}

@end