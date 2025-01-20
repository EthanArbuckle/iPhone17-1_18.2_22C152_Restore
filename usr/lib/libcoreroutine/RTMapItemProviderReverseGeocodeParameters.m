@interface RTMapItemProviderReverseGeocodeParameters
- (RTMapItemProviderReverseGeocodeParameters)init;
- (RTMapItemProviderReverseGeocodeParameters)initWithConfidence:(double)a3 relatedPlacesConfidence:(double)a4;
- (RTMapItemProviderReverseGeocodeParameters)initWithDefaultsManager:(id)a3;
- (double)confidence;
- (double)relatedPlacesConfidence;
- (id)description;
@end

@implementation RTMapItemProviderReverseGeocodeParameters

- (double)relatedPlacesConfidence
{
  return self->_relatedPlacesConfidence;
}

- (RTMapItemProviderReverseGeocodeParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithConfidence_relatedPlacesConfidence_);
}

- (RTMapItemProviderReverseGeocodeParameters)initWithConfidence:(double)a3 relatedPlacesConfidence:(double)a4
{
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v8 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidence)";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_9;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: RTCommonValidConfidence(relatedPlacesConfidence)";
    goto LABEL_12;
  }
  v12.receiver = self;
  v12.super_class = (Class)RTMapItemProviderReverseGeocodeParameters;
  v7 = [(RTMapItemProviderReverseGeocodeParameters *)&v12 init];
  if (v7)
  {
    v7->_confidence = a3;
    v7->_relatedPlacesConfidence = a4;
  }
  self = v7;
  v8 = self;
LABEL_10:

  return v8;
}

- (RTMapItemProviderReverseGeocodeParameters)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"RTDefaultsMapItemProviderReverseGeocodeConfidence"];
    objc_opt_class();
    double v7 = 0.4;
    double v8 = 0.4;
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v8 = v9;
    }
    v10 = [v5 objectForKey:@"RTDefaultsMapItemProviderReverseGeocodeRelatedPlacesConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      double v7 = v11;
    }
    self = [(RTMapItemProviderReverseGeocodeParameters *)self initWithConfidence:v8 relatedPlacesConfidence:v7];

    objc_super v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v15, 2u);
    }

    objc_super v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"confidence, %.3f, relatedPlacesConfidence, %.3f", *(void *)&self->_confidence, *(void *)&self->_relatedPlacesConfidence];
}

- (double)confidence
{
  return self->_confidence;
}

@end