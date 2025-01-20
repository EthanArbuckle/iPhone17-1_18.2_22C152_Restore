@interface RTInferredMapItemFuserParameters
- (RTInferredMapItemFuserParameters)init;
- (RTInferredMapItemFuserParameters)initWithAoiConsiderThreshold:(double)a3 aoiUseThreshold:(double)a4 confidenceEqualityEpsilon:(double)a5 distanceThreshold:(double)a6 placeholderMultiplier:(double)a7;
- (RTInferredMapItemFuserParameters)initWithDefaultsManager:(id)a3;
- (double)aoiConsiderThreshold;
- (double)aoiUseThreshold;
- (double)confidenceEqualityEpsilon;
- (double)distanceThreshold;
- (double)placeholderMultiplier;
- (id)description;
@end

@implementation RTInferredMapItemFuserParameters

- (RTInferredMapItemFuserParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAoiConsiderThreshold_aoiUseThreshold_confidenceEqualityEpsilon_distanceThreshold_placeholderMultiplier_);
}

- (RTInferredMapItemFuserParameters)initWithAoiConsiderThreshold:(double)a3 aoiUseThreshold:(double)a4 confidenceEqualityEpsilon:(double)a5 distanceThreshold:(double)a6 placeholderMultiplier:(double)a7
{
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: RTCommonValidConfidence(aoiConsiderThreshold)";
      goto LABEL_16;
    }
LABEL_17:

    v15 = 0;
    goto LABEL_18;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: RTCommonValidConfidence(aoiUseThreshold)";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidenceEqualityEpsilon)";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (a6 <= 0.0)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: distanceThreshold > 0";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (a7 < 1.0)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: placeholderMultiplier >= 1";
LABEL_16:
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTInferredMapItemFuserParameters;
  v17 = [(RTInferredMapItemFuserParameters *)&v18 init];
  if (v17)
  {
    v17->_aoiConsiderThreshold = a3;
    v17->_aoiUseThreshold = a4;
    v17->_confidenceEqualityEpsilon = a5;
    v17->_distanceThreshold = a6;
    v17->_placeholderMultiplier = a7;
  }
  self = v17;
  v15 = self;
LABEL_18:

  return v15;
}

- (RTInferredMapItemFuserParameters)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"RTDefaultsInferredMapItemFuserAOIConsiderThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.3;
    }
    v11 = [v5 objectForKey:@"RTDefaultsInferredMapItemFuserAOIUseThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      double v13 = v12;
    }
    else
    {
      double v13 = 0.15;
    }
    v14 = [v5 objectForKey:@"RTDefaultsInferredMapItemFuserConfidenceEqualityEpsilon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      double v16 = v15;
    }
    else
    {
      double v16 = 0.01;
    }
    v17 = [v5 objectForKey:@"RTDefaultsInferredMapItemFuserDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 doubleValue];
      double v19 = v18;
    }
    else
    {
      double v19 = 250.0;
    }
    v20 = [v5 objectForKey:@"RTDefaultsInferredMapItemFuserPlaceholderMultiplier"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v22 = 3.0;
    if (isKindOfClass)
    {
      [v20 doubleValue];
      double v22 = v23;
    }
    self = [(RTInferredMapItemFuserParameters *)self initWithAoiConsiderThreshold:v8 aoiUseThreshold:v13 confidenceEqualityEpsilon:v16 distanceThreshold:v19 placeholderMultiplier:v22];

    v10 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v25, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"aoiConsiderThreshold, %.3f, aoiUseThreshold, %.3f, confidenceEqualityEpsilon, %.3f, distanceThreshold, %.3f, placeholderMultiplier, %.3f", *(void *)&self->_aoiConsiderThreshold, *(void *)&self->_aoiUseThreshold, *(void *)&self->_confidenceEqualityEpsilon, *(void *)&self->_distanceThreshold, *(void *)&self->_placeholderMultiplier];
}

- (double)aoiConsiderThreshold
{
  return self->_aoiConsiderThreshold;
}

- (double)aoiUseThreshold
{
  return self->_aoiUseThreshold;
}

- (double)confidenceEqualityEpsilon
{
  return self->_confidenceEqualityEpsilon;
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

- (double)placeholderMultiplier
{
  return self->_placeholderMultiplier;
}

@end