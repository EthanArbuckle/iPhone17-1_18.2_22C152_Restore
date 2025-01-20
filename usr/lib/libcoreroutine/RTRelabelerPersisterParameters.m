@interface RTRelabelerPersisterParameters
- (RTRelabelerPersisterParameters)init;
- (RTRelabelerPersisterParameters)initWithDefaultsManager:(id)a3;
- (RTRelabelerPersisterParameters)initWithMaxCollapseIterations:(unint64_t)a3 placeholderCollapseDistanceThreshold:(double)a4 reverseGeocodeLeewayDistance:(double)a5 reverseGeocodePlaceFetchDistanceThreshold:(double)a6 unconcreteLOICollapseDistanceThreshold:(double)a7 visitAdjacencyMergeThreshold:(double)a8;
- (double)placeholderCollapseDistanceThreshold;
- (double)reverseGeocodeLeewayDistance;
- (double)reverseGeocodePlaceFetchDistanceThreshold;
- (double)unconcreteLOICollapseDistanceThreshold;
- (double)visitAdjacencyMergeThreshold;
- (id)description;
- (unint64_t)maxCollapseIterations;
@end

@implementation RTRelabelerPersisterParameters

- (RTRelabelerPersisterParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMaxCollapseIterations_placeholderCollapseDistanceThreshold_reverseGeocodeLeewayDistance_reverseGeocodePlaceFetchDistanceThreshold_unconcreteLOICollapseDistanceThreshold_visitAdjacencyMergeThreshold_);
}

- (RTRelabelerPersisterParameters)initWithMaxCollapseIterations:(unint64_t)a3 placeholderCollapseDistanceThreshold:(double)a4 reverseGeocodeLeewayDistance:(double)a5 reverseGeocodePlaceFetchDistanceThreshold:(double)a6 unconcreteLOICollapseDistanceThreshold:(double)a7 visitAdjacencyMergeThreshold:(double)a8
{
  v8 = self;
  if (a4 <= 0.0)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: placeholderCollapseDistanceThreshold > 0";
LABEL_19:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_20;
  }
  if (a5 <= 0.0)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: reverseGeocodeLeewayDistance > 0";
    goto LABEL_19;
  }
  if (a6 <= 0.0)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: reverseGeocodePlaceFetchDistanceThreshold > 0";
    goto LABEL_19;
  }
  if (a7 <= 0.0)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: unconcreteLOICollapseDistanceThreshold > 0";
    goto LABEL_19;
  }
  if (a8 <= 0.0)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "Invalid parameter not satisfying: visitAdjacencyMergeThreshold > 0";
      goto LABEL_19;
    }
LABEL_20:

    v16 = 0;
    goto LABEL_21;
  }
  v20.receiver = self;
  v20.super_class = (Class)RTRelabelerPersisterParameters;
  v15 = [(RTRelabelerPersisterParameters *)&v20 init];
  if (v15)
  {
    v15->_maxCollapseIterations = a3;
    v15->_placeholderCollapseDistanceThreshold = a4;
    v15->_reverseGeocodeLeewayDistance = a5;
    v15->_reverseGeocodePlaceFetchDistanceThreshold = a6;
    v15->_unconcreteLOICollapseDistanceThreshold = a7;
    v15->_visitAdjacencyMergeThreshold = a8;
  }
  v8 = v15;
  v16 = v8;
LABEL_21:

  return v16;
}

- (RTRelabelerPersisterParameters)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"RTDefaultsRelabelerPersisterMaxCollapseIterations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v7 = 3;
    }
    v10 = [v5 objectForKey:@"RTDefaultsRelabelerPersisterReverseGeocodeCollapseThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      double v12 = v11;
    }
    else
    {
      double v12 = 125.0;
    }
    v13 = [v5 objectForKey:@"RTDefaultsRelabelerPersisterReverseGeocodeLeewayDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      double v15 = v14;
    }
    else
    {
      double v15 = 50.0;
    }
    v16 = [v5 objectForKey:@"RTDefaultsRelabelerPersisterReverseGeocodePlaceFetchDistanceThreshold"];
    objc_opt_class();
    double v17 = 150.0;
    double v18 = 150.0;
    if (objc_opt_isKindOfClass())
    {
      [v16 doubleValue];
      double v18 = v19;
    }
    objc_super v20 = [v5 objectForKey:@"RTDefaultsRelabelerPersisterUnconcreteLOICollapseDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 doubleValue];
      double v17 = v21;
    }
    v22 = [v5 objectForKey:@"RTDefaultsRelabelerPersisterVisitAdjacencyMergeThreshold"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v24 = 15.0;
    if (isKindOfClass)
    {
      [v22 doubleValue];
      double v24 = v25;
    }
    self = [(RTRelabelerPersisterParameters *)self initWithMaxCollapseIterations:v7 placeholderCollapseDistanceThreshold:v12 reverseGeocodeLeewayDistance:v15 reverseGeocodePlaceFetchDistanceThreshold:v18 unconcreteLOICollapseDistanceThreshold:v17 visitAdjacencyMergeThreshold:v24];

    v9 = self;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v27, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"maxCollapseIterations, %lu, placeholderCollapseDistanceThreshold, %.3f, reverseGeocodeLeewayDistance, %.3f, unconcreteLOICollapseDistanceThreshold, %.3f, visitAdjacencyMergeThreshold, %.3f", self->_maxCollapseIterations, *(void *)&self->_placeholderCollapseDistanceThreshold, *(void *)&self->_reverseGeocodeLeewayDistance, *(void *)&self->_unconcreteLOICollapseDistanceThreshold, *(void *)&self->_visitAdjacencyMergeThreshold];
}

- (unint64_t)maxCollapseIterations
{
  return self->_maxCollapseIterations;
}

- (double)placeholderCollapseDistanceThreshold
{
  return self->_placeholderCollapseDistanceThreshold;
}

- (double)reverseGeocodeLeewayDistance
{
  return self->_reverseGeocodeLeewayDistance;
}

- (double)reverseGeocodePlaceFetchDistanceThreshold
{
  return self->_reverseGeocodePlaceFetchDistanceThreshold;
}

- (double)unconcreteLOICollapseDistanceThreshold
{
  return self->_unconcreteLOICollapseDistanceThreshold;
}

- (double)visitAdjacencyMergeThreshold
{
  return self->_visitAdjacencyMergeThreshold;
}

@end