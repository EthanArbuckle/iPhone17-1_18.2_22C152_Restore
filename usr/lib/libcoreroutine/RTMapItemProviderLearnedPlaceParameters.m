@interface RTMapItemProviderLearnedPlaceParameters
- (RTMapItemProviderLearnedPlaceParameters)init;
- (RTMapItemProviderLearnedPlaceParameters)initWithDefaultsManager:(id)a3;
- (RTMapItemProviderLearnedPlaceParameters)initWithMaxDistanceThreshold:(double)a3 minDistanceThreshold:(double)a4 softDistanceThreshold:(double)a5 homeConfidence:(double)a6 workConfidence:(double)a7 schoolConfidence:(double)a8 gymConfidence:(double)a9 nonRevGeoConfidence:(double)a10 revGeoConfidence:(double)a11 revGeoSourceMask:(unint64_t)a12 removeSourceMask:(unint64_t)a13;
- (double)gymConfidence;
- (double)homeConfidence;
- (double)maxDistanceThreshold;
- (double)minDistanceThreshold;
- (double)nonRevGeoConfidence;
- (double)revGeoConfidence;
- (double)schoolConfidence;
- (double)softDistanceThreshold;
- (double)workConfidence;
- (id)description;
- (unint64_t)removeSourceMask;
- (unint64_t)revGeoSourceMask;
@end

@implementation RTMapItemProviderLearnedPlaceParameters

- (double)softDistanceThreshold
{
  return self->_softDistanceThreshold;
}

- (double)minDistanceThreshold
{
  return self->_minDistanceThreshold;
}

- (double)maxDistanceThreshold
{
  return self->_maxDistanceThreshold;
}

- (RTMapItemProviderLearnedPlaceParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMaxDistanceThreshold_minDistanceThreshold_softDistanceThreshold_homeConfidence_workConfidence_schoolConfidence_gymConfidence_nonRevGeoConfidence_revGeoConfidence_revGeoSourceMask_removeSourceMask_);
}

- (RTMapItemProviderLearnedPlaceParameters)initWithMaxDistanceThreshold:(double)a3 minDistanceThreshold:(double)a4 softDistanceThreshold:(double)a5 homeConfidence:(double)a6 workConfidence:(double)a7 schoolConfidence:(double)a8 gymConfidence:(double)a9 nonRevGeoConfidence:(double)a10 revGeoConfidence:(double)a11 revGeoSourceMask:(unint64_t)a12 removeSourceMask:(unint64_t)a13
{
  if (a3 <= 0.0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: maxDistanceThreshold > 0";
      goto LABEL_31;
    }
LABEL_32:

    v26 = 0;
    goto LABEL_33;
  }
  if (a4 <= 0.0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: minDistanceThreshold > 0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (a5 <= 0.0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: softDistanceThreshold > 0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(homeConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(workConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(schoolConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(gymConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(nonRevGeoConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(revGeoConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((a12 & 0xFFFFFFFFFFF00020) != 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTMapItemSourceValid(revGeoSourceMask)";
LABEL_31:
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if ((a13 & 0xFFFFFFFFFFF00020) != 0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: RTMapItemSourceValid(removeSourceMask)";
    goto LABEL_31;
  }
  v29.receiver = self;
  v29.super_class = (Class)RTMapItemProviderLearnedPlaceParameters;
  v28 = [(RTMapItemProviderLearnedPlaceParameters *)&v29 init];
  if (v28)
  {
    v28->_maxDistanceThreshold = a3;
    v28->_minDistanceThreshold = a4;
    v28->_softDistanceThreshold = a5;
    v28->_homeConfidence = a6;
    v28->_workConfidence = a7;
    v28->_schoolConfidence = a8;
    v28->_gymConfidence = a9;
    v28->_nonRevGeoConfidence = a10;
    v28->_revGeoConfidence = a11;
    v28->_revGeoSourceMask = a12;
    v28->_removeSourceMask = a13;
  }
  self = v28;
  v26 = self;
LABEL_33:

  return v26;
}

- (RTMapItemProviderLearnedPlaceParameters)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceMaxDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v43 = v7;
    }
    else
    {
      double v43 = 200.0;
    }
    v10 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceMinDistanceThreshold"];
    objc_opt_class();
    v44 = self;
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      double v12 = v11;
    }
    else
    {
      double v12 = 150.0;
    }
    v13 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceSoftDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      double v15 = v14;
    }
    else
    {
      double v15 = 250.0;
    }
    v16 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceHomeConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 doubleValue];
      double v18 = v17;
    }
    else
    {
      double v18 = 0.975;
    }
    v19 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceWorkConfidence"];
    objc_opt_class();
    double v20 = 0.95;
    double v21 = 0.95;
    if (objc_opt_isKindOfClass())
    {
      [v19 doubleValue];
      double v21 = v22;
    }
    v23 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceSchoolConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v23 doubleValue];
      double v20 = v24;
    }
    v25 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceGymConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v25 doubleValue];
      double v27 = v26;
    }
    else
    {
      double v27 = 0.9;
    }
    v28 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceNonRevGeoConfidence"];
    objc_opt_class();
    v46 = v6;
    if (objc_opt_isKindOfClass())
    {
      [v28 doubleValue];
      double v30 = v29;
    }
    else
    {
      double v30 = 0.3;
    }
    v42 = v16;
    v45 = v10;
    v31 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceRevGeoConfidence"];
    objc_opt_class();
    double v32 = 0.25;
    if (objc_opt_isKindOfClass())
    {
      [v31 doubleValue];
      double v32 = v33;
    }
    v34 = v23;
    v41 = v13;
    v35 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceRevGeoSourceMask"];
    objc_opt_class();
    v36 = v19;
    if (objc_opt_isKindOfClass()) {
      uint64_t v37 = [v35 unsignedIntegerValue];
    }
    else {
      uint64_t v37 = 8193;
    }
    v38 = [v5 objectForKey:@"RTDefaultsMapItemProviderLearnedPlaceRemoveSourceMask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v39 = [v38 unsignedIntegerValue];
    }
    else {
      uint64_t v39 = 0x4000;
    }
    self = [(RTMapItemProviderLearnedPlaceParameters *)v44 initWithMaxDistanceThreshold:v37 minDistanceThreshold:v39 softDistanceThreshold:v43 homeConfidence:v12 workConfidence:v15 schoolConfidence:v18 gymConfidence:v21 nonRevGeoConfidence:v20 revGeoConfidence:v27 revGeoSourceMask:v30 removeSourceMask:*(void *)&v32];

    v9 = self;
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"maxDistanceThreshold, %.3f, minDistanceThreshold, %.3f, softDistanceThreshold, %.3f, homeConfidence, %.3f, workConfidence, %.3f, schoolConfidence, %.3f, gymConfidence, %.3f, nonRevGeoConfidence, %.3f, revGeoConfidence, %.3f, revGeoSourceMask, %lu, removeSourcemask, %lu", *(void *)&self->_maxDistanceThreshold, *(void *)&self->_minDistanceThreshold, *(void *)&self->_softDistanceThreshold, *(void *)&self->_homeConfidence, *(void *)&self->_workConfidence, *(void *)&self->_schoolConfidence, *(void *)&self->_gymConfidence, *(void *)&self->_nonRevGeoConfidence, *(void *)&self->_revGeoConfidence, self->_revGeoSourceMask, self->_removeSourceMask];
}

- (double)homeConfidence
{
  return self->_homeConfidence;
}

- (double)workConfidence
{
  return self->_workConfidence;
}

- (double)schoolConfidence
{
  return self->_schoolConfidence;
}

- (double)gymConfidence
{
  return self->_gymConfidence;
}

- (double)nonRevGeoConfidence
{
  return self->_nonRevGeoConfidence;
}

- (double)revGeoConfidence
{
  return self->_revGeoConfidence;
}

- (unint64_t)revGeoSourceMask
{
  return self->_revGeoSourceMask;
}

- (unint64_t)removeSourceMask
{
  return self->_removeSourceMask;
}

@end