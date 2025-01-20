@interface RTMapItemProviderPOIHistoryParameters
- (RTMapItemProviderPOIHistoryParameters)init;
- (RTMapItemProviderPOIHistoryParameters)initWithDefaultsManager:(id)a3;
- (RTMapItemProviderPOIHistoryParameters)initWithDistanceThreshold:(double)a3;
- (double)distanceThreshold;
- (id)description;
@end

@implementation RTMapItemProviderPOIHistoryParameters

- (RTMapItemProviderPOIHistoryParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceThreshold_);
}

- (RTMapItemProviderPOIHistoryParameters)initWithDistanceThreshold:(double)a3
{
  v3 = self;
  if (a3 <= 0.0)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceThreshold > 0", buf, 2u);
    }

    v6 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RTMapItemProviderPOIHistoryParameters;
    v5 = [(RTMapItemProviderPOIHistoryParameters *)&v9 init];
    if (v5) {
      v5->_distanceThreshold = a3;
    }
    v3 = v5;
    v6 = v3;
  }

  return v6;
}

- (RTMapItemProviderPOIHistoryParameters)initWithDefaultsManager:(id)a3
{
  if (a3)
  {
    v4 = [a3 objectForKey:@"RTDefaultsMapItemProviderPOIHistoryDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 doubleValue];
    }
    else {
      double v5 = 250.0;
    }
    self = [(RTMapItemProviderPOIHistoryParameters *)self initWithDistanceThreshold:v5];

    v7 = self;
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v9, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"distanceThreshold, %.3f", *(void *)&self->_distanceThreshold];
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

@end