@interface RTVisitLocationPoints
- (NSArray)locations;
- (RTLocation)centroid;
- (RTVisitLocationPoints)init;
- (RTVisitLocationPoints)initWithLocations:(id)a3;
- (double)duration;
- (id)description;
- (id)firstDate;
- (id)lastDate;
- (void)enumerateLowSpeedSegementsUsingBlock:(id)a3 block:(id)a4;
@end

@implementation RTVisitLocationPoints

- (RTVisitLocationPoints)initWithLocations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTVisitLocationPoints initWithLocations:]";
      __int16 v14 = 1024;
      int v15 = 29;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v4 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)RTVisitLocationPoints;
    v6 = [(RTVisitLocationPoints *)&v11 init];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:0];
      locations = v6->_locations;
      v6->_locations = (NSArray *)v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (RTVisitLocationPoints)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocations_);
}

- (id)description
{
  v3 = NSString;
  NSUInteger v4 = [(NSArray *)self->_locations count];
  v5 = [(NSArray *)self->_locations firstObject];
  v6 = [(NSArray *)self->_locations lastObject];
  uint64_t v7 = [v3 stringWithFormat:@"n_points, %lu, first location, %@, last location, %@", v4, v5, v6];

  return v7;
}

- (RTLocation)centroid
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  centroid = self->_centroid;
  if (!centroid)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    NSUInteger v4 = self->_locations;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      double v8 = 0.0;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v11 latitude:v21];
          double v9 = v9 + v12;
          [v11 longitude];
          double v8 = v8 + v13;
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
      double v9 = 0.0;
    }

    double v14 = v9 / (double)[(NSArray *)self->_locations count];
    double v15 = v8 / (double)[(NSArray *)self->_locations count];
    id v16 = objc_alloc(MEMORY[0x1E4F5CE00]);
    v17 = [(RTVisitLocationPoints *)self firstDate];
    v18 = (RTLocation *)[v16 initWithLatitude:v17 longitude:v14 horizontalUncertainty:v15 date:0.0];
    v19 = self->_centroid;
    self->_centroid = v18;

    centroid = self->_centroid;
  }

  return centroid;
}

- (void)enumerateLowSpeedSegementsUsingBlock:(id)a3 block:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void (**)(void, void, void, void))v7;
  if (v6)
  {
    if (v7)
    {
      char v38 = 0;
      double v9 = objc_opt_new();
      id v10 = [(NSArray *)self->_locations firstObject];
      v32 = objc_opt_new();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      obj = self->_locations;
      uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v11)
      {
        uint64_t v13 = v11;
        uint64_t v31 = 0;
        unint64_t v14 = 0;
        id v15 = 0;
        uint64_t v16 = *(void *)v35;
        v29 = v8;
        *(void *)&long long v12 = 138412290;
        long long v28 = v12;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            v18 = v10;
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            [v19 speed:v28];
            double v21 = v20;
            [v6 minSpeedToFilter];
            if (v21 >= v22) {
              ++v14;
            }
            else {
              unint64_t v14 = 0;
            }

            id v33 = 0;
            [v32 distanceFromLocation:v18 toLocation:v19 error:&v33];
            double v24 = v23;
            id v15 = v33;
            if (v15)
            {
              v25 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v28;
                v41 = (const char *)v15;
                _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
              }
            }
            if ((v14 >= [v6 movingWindowSizeForSpeed]
               || v24 >= (double)(unint64_t)[v6 maxDistanceBetweenAdjacentPoints])
              && [v9 count])
            {
              ((void (**)(void, NSObject *, uint64_t, char *))v29)[2](v29, v9, v31 + i, &v38);
              if (v38)
              {
                v31 += i;
                id v10 = v18;
                goto LABEL_29;
              }
              uint64_t v26 = objc_opt_new();

              double v9 = v26;
            }
            [v9 addObject:v19];
            id v10 = v19;
          }
          uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
          v31 += i;
          if (v13) {
            continue;
          }
          break;
        }
LABEL_29:
        double v8 = v29;
      }
      else
      {
        uint64_t v31 = 0;
        id v15 = 0;
      }

      if ([v9 count]) {
        ((void (**)(void, NSObject *, uint64_t, char *))v8)[2](v8, v9, v31, &v38);
      }

      goto LABEL_34;
    }
LABEL_26:
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[RTVisitLocationPoints enumerateLowSpeedSegementsUsingBlock:block:]";
      __int16 v42 = 1024;
      int v43 = 74;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block (in %s:%d)", buf, 0x12u);
    }
LABEL_34:

    goto LABEL_35;
  }
  v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[RTVisitLocationPoints enumerateLowSpeedSegementsUsingBlock:block:]";
    __int16 v42 = 1024;
    int v43 = 73;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter (in %s:%d)", buf, 0x12u);
  }

  if (!v8) {
    goto LABEL_26;
  }
LABEL_35:
}

- (double)duration
{
  v3 = [(RTVisitLocationPoints *)self lastDate];
  NSUInteger v4 = [(RTVisitLocationPoints *)self firstDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (id)firstDate
{
  uint64_t v2 = [(NSArray *)self->_locations firstObject];
  v3 = [v2 date];

  return v3;
}

- (id)lastDate
{
  uint64_t v2 = [(NSArray *)self->_locations lastObject];
  v3 = [v2 date];

  return v3;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);

  objc_storeStrong((id *)&self->_centroid, 0);
}

@end