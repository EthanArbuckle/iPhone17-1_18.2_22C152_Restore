@interface RTMapItemProviderBluePOIParameters
- (BOOL)earlyStop;
- (NSString)injectedPlistPath;
- (RTMapItemProviderBluePOIParameters)init;
- (RTMapItemProviderBluePOIParameters)initWithBaseDuration:(double)a3 injectedPlistPath:(id)a4 locationLookupWindowMaxMinutes:(double)a5 locationLookupWindowMinMinutes:(double)a6 maxLocationsPerFingerprint:(unint64_t)a7 locationUncertaintyThreshold:(double)a8 aoiDistanceThreshold:(double)a9 poiDistanceThreshold:(double)a10 harvestMask:(unint64_t)a11 aoiConfidencePassThroughThreshold:(double)a12 aoiConfidenceConsiderThreshold:(double)a13 poiConfidencePassThroughThreshold:(double)a14 poiConfidenceConsiderThreshold:(double)a15 maxNumberOfQueries:(unint64_t)a16 earlyStop:(BOOL)a17 noFingerprintMinVisitDuration:(double)a18 minVisitLength:(double)a19;
- (RTMapItemProviderBluePOIParameters)initWithDefaultsManager:(id)a3;
- (double)aoiConfidenceConsiderThreshold;
- (double)aoiConfidencePassThroughThreshold;
- (double)aoiDistanceThreshold;
- (double)baseDuration;
- (double)locationLookupWindowMaxMinutes;
- (double)locationLookupWindowMinMinutes;
- (double)locationUncertaintyThreshold;
- (double)minVisitLength;
- (double)noFingerprintMinVisitDuration;
- (double)poiConfidenceConsiderThreshold;
- (double)poiConfidencePassThroughThreshold;
- (double)poiDistanceThreshold;
- (id)description;
- (unint64_t)harvestMask;
- (unint64_t)maxLocationsPerFingerprint;
- (unint64_t)maxNumberOfQueries;
@end

@implementation RTMapItemProviderBluePOIParameters

- (RTMapItemProviderBluePOIParameters)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBaseDuration_injectedPlistPath_locationLookupWindowMaxMinutes_locationLookupWindowMinMinutes_maxLocationsPerFingerprint_locationUncertaintyThreshold_aoiDistanceThreshold_poiDistanceThreshold_harvestMask_aoiConfidencePassThroughThreshold_aoiConfidenceConsiderThreshold_poiConfidencePassThroughThreshold_poiConfidenceConsiderThreshold_maxNumberOfQueries_earlyStop_noFingerprintMinVisitDuration_minVisitLength_);
}

- (RTMapItemProviderBluePOIParameters)initWithBaseDuration:(double)a3 injectedPlistPath:(id)a4 locationLookupWindowMaxMinutes:(double)a5 locationLookupWindowMinMinutes:(double)a6 maxLocationsPerFingerprint:(unint64_t)a7 locationUncertaintyThreshold:(double)a8 aoiDistanceThreshold:(double)a9 poiDistanceThreshold:(double)a10 harvestMask:(unint64_t)a11 aoiConfidencePassThroughThreshold:(double)a12 aoiConfidenceConsiderThreshold:(double)a13 poiConfidencePassThroughThreshold:(double)a14 poiConfidenceConsiderThreshold:(double)a15 maxNumberOfQueries:(unint64_t)a16 earlyStop:(BOOL)a17 noFingerprintMinVisitDuration:(double)a18 minVisitLength:(double)a19
{
  id v33 = a4;
  if (a3 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: baseDuration > 0";
LABEL_40:
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_41;
  }
  if (a5 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationLookupWindowMaxMinutes > 0";
    goto LABEL_40;
  }
  if (a6 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationLookupWindowMinMinutes > 0";
    goto LABEL_40;
  }
  if (!a7)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: maxLocationsPerFingerprint > 0";
    goto LABEL_40;
  }
  if (a8 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationUncertaintyThreshold > 0";
    goto LABEL_40;
  }
  if (a9 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: aoiDistanceThreshold > 0";
    goto LABEL_40;
  }
  if (a10 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: poiDistanceThreshold > 0";
    goto LABEL_40;
  }
  if (a12 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: aoiConfidencePassThroughThreshold > 0";
    goto LABEL_40;
  }
  if (a13 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: aoiConfidenceConsiderThreshold > 0";
    goto LABEL_40;
  }
  if (a14 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: poiConfidencePassThroughThreshold > 0";
    goto LABEL_40;
  }
  if (a15 <= 0.0)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: poiConfidenceConsiderThreshold > 0";
    goto LABEL_40;
  }
  if (!a16)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v38 = "Invalid parameter not satisfying: maxNumberOfQueries > 0";
      goto LABEL_40;
    }
LABEL_41:

    v36 = 0;
    goto LABEL_42;
  }
  v40.receiver = self;
  v40.super_class = (Class)RTMapItemProviderBluePOIParameters;
  v34 = [(RTMapItemProviderBluePOIParameters *)&v40 init];
  v35 = v34;
  if (v34)
  {
    v34->_baseDuration = a3;
    objc_storeStrong((id *)&v34->_injectedPlistPath, a4);
    v35->_locationLookupWindowMaxMinutes = a5;
    v35->_locationLookupWindowMinMinutes = a6;
    v35->_maxLocationsPerFingerprint = a7;
    v35->_locationUncertaintyThreshold = a8;
    v35->_aoiDistanceThreshold = a9;
    v35->_poiDistanceThreshold = a10;
    v35->_harvestMask = a11;
    v35->_aoiConfidencePassThroughThreshold = a12;
    v35->_aoiConfidenceConsiderThreshold = a13;
    v35->_poiConfidencePassThroughThreshold = a14;
    v35->_poiConfidenceConsiderThreshold = a15;
    v35->_maxNumberOfQueries = a16;
    v35->_earlyStop = a17;
    v35->_noFingerprintMinVisitDuration = a18;
    v35->_minVisitLength = a19;
  }
  self = v35;
  v36 = self;
LABEL_42:

  return v36;
}

- (RTMapItemProviderBluePOIParameters)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"RTDefaultsMapItemProviderBluePOIBaseDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 doubleValue];
    }
    else {
      *(double *)&uint64_t v7 = 300.0;
    }
    double v67 = *(double *)&v7;
    uint64_t v10 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIInjectedPlistPath"];
    objc_opt_class();
    v71 = (void *)v10;
    if (objc_opt_isKindOfClass()) {
      v11 = (void *)v10;
    }
    else {
      v11 = 0;
    }
    id v70 = v11;
    v12 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOILookupWindowMaxMinutes"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v14 = 5.0;
    if (isKindOfClass) {
      [v12 doubleValue];
    }
    v58 = self;
    double v66 = v14;
    v15 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOILookupWindowMinMinutes"];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();
    double v17 = 1.0;
    if (v16) {
      [v15 doubleValue];
    }
    double v64 = v17;
    v18 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIMaxLocationsPerFingerprint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v62 = [v18 unsignedIntegerValue];
    }
    else {
      uint64_t v62 = 300;
    }
    v19 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOILocationUncertaintyThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v19 doubleValue];
    }
    else {
      *(double *)&uint64_t v20 = 250.0;
    }
    double v60 = *(double *)&v20;
    v21 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIAoiDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 doubleValue];
      double v23 = v22;
    }
    else
    {
      double v23 = 5000.0;
    }
    v24 = v12;
    v25 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIPoiDistanceThreshold"];
    objc_opt_class();
    v26 = v15;
    if (objc_opt_isKindOfClass())
    {
      [v25 doubleValue];
      double v28 = v27;
    }
    else
    {
      double v28 = 500.0;
    }
    v29 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIHarvestMask"];
    objc_opt_class();
    v59 = v29;
    if (objc_opt_isKindOfClass()) {
      uint64_t v56 = [v29 unsignedIntegerValue];
    }
    else {
      uint64_t v56 = -24577;
    }
    v72 = v6;
    v30 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIAoiConfidencePassThroughThreshold"];
    objc_opt_class();
    double v31 = 0.5;
    v32 = v26;
    if (objc_opt_isKindOfClass())
    {
      [v30 doubleValue];
      double v31 = v33;
    }
    v57 = v30;
    v34 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIAoiConfidenceConsiderThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v34 doubleValue];
      double v36 = v35;
    }
    else
    {
      double v36 = 0.1;
    }
    v65 = v19;
    v37 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIPoiConfidencePassThroughThreshold"];
    objc_opt_class();
    double v38 = 0.5;
    if (objc_opt_isKindOfClass())
    {
      [v37 doubleValue];
      double v38 = v39;
    }
    v54 = v37;
    objc_super v40 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIPoiConfidenceConsiderThreshold"];
    objc_opt_class();
    v63 = v21;
    if (objc_opt_isKindOfClass())
    {
      [v40 doubleValue];
      uint64_t v42 = v41;
    }
    else
    {
      uint64_t v42 = 0x3FB999999999999ALL;
    }
    v55 = v34;
    v69 = v24;
    v43 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIMaxNumberOfQueries"];
    objc_opt_class();
    v61 = v25;
    if (objc_opt_isKindOfClass()) {
      uint64_t v44 = [v43 unsignedIntegerValue];
    }
    else {
      uint64_t v44 = 6;
    }
    v45 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIEarlyStop"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v46 = [v45 BOOLValue];
    }
    else {
      uint64_t v46 = 0;
    }
    v68 = v32;
    v47 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOINoFingerprintMinVisitDuration"];
    objc_opt_class();
    uint64_t v48 = 0x408C200000000000;
    uint64_t v49 = 0x408C200000000000;
    if (objc_opt_isKindOfClass())
    {
      [v47 doubleValue];
      uint64_t v49 = v50;
    }
    v51 = [v5 objectForKey:@"RTDefaultsMapItemProviderBluePOIMinVisitLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v51 doubleValue];
      uint64_t v48 = v52;
    }
    self = objc_retain(-[RTMapItemProviderBluePOIParameters initWithBaseDuration:injectedPlistPath:locationLookupWindowMaxMinutes:locationLookupWindowMinMinutes:maxLocationsPerFingerprint:locationUncertaintyThreshold:aoiDistanceThreshold:poiDistanceThreshold:harvestMask:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:maxNumberOfQueries:earlyStop:noFingerprintMinVisitDuration:minVisitLength:](v58, "initWithBaseDuration:injectedPlistPath:locationLookupWindowMaxMinutes:locationLookupWindowMinMinutes:maxLocationsPerFingerprint:locationUncertaintyThreshold:aoiDistanceThreshold:poiDistanceThreshold:harvestMask:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:maxNumberOfQueries:earlyStop:noFingerprintMinVisitDuration:minVisitLength:", v70, v62, v56, v44, v46, v67, v66, v64, v60, v23, v28, v31, v36,
               *(void *)&v38,
               v42,
               v49,
               v48));

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
  if (self->_earlyStop) {
    uint64_t v2 = @"YES";
  }
  else {
    uint64_t v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"baseDuration, %.2f, locationLookupWindowMaxMinutes, %.1f, locationLookupWindowMinMinutes, %.1f, maxLocationsPerFingerprint, %lu, locationUncertaintyThreshold, %.2f, aoiDistanceThreshold, %.2f, poiDistanceThreshold, %.2f, aoiConfidencePassThroughThreshold, %.2f, aoiConfidenceConsiderThreshold, %.2f, poiConfidencePassThroughThreshold, %.2f, poiConfidenceConsiderThreshold, %.2f, maxNumberOfQueries, %lu, earlyStop, %@, noFingerprintMinVisitDuration, %.2f, minVisitLength, %.2f", *(void *)&self->_baseDuration, *(void *)&self->_locationLookupWindowMaxMinutes, *(void *)&self->_locationLookupWindowMinMinutes, self->_maxLocationsPerFingerprint, *(_OWORD *)&self->_locationUncertaintyThreshold, *(void *)&self->_poiDistanceThreshold, *(void *)&self->_aoiConfidencePassThroughThreshold, *(void *)&self->_aoiConfidenceConsiderThreshold, *(void *)&self->_poiConfidencePassThroughThreshold, *(void *)&self->_poiConfidenceConsiderThreshold, self->_maxNumberOfQueries, v2, *(void *)&self->_noFingerprintMinVisitDuration, *(void *)&self->_minVisitLength];
}

- (double)baseDuration
{
  return self->_baseDuration;
}

- (NSString)injectedPlistPath
{
  return self->_injectedPlistPath;
}

- (double)locationLookupWindowMaxMinutes
{
  return self->_locationLookupWindowMaxMinutes;
}

- (double)locationLookupWindowMinMinutes
{
  return self->_locationLookupWindowMinMinutes;
}

- (unint64_t)maxLocationsPerFingerprint
{
  return self->_maxLocationsPerFingerprint;
}

- (double)locationUncertaintyThreshold
{
  return self->_locationUncertaintyThreshold;
}

- (double)aoiDistanceThreshold
{
  return self->_aoiDistanceThreshold;
}

- (double)poiDistanceThreshold
{
  return self->_poiDistanceThreshold;
}

- (unint64_t)harvestMask
{
  return self->_harvestMask;
}

- (double)aoiConfidencePassThroughThreshold
{
  return self->_aoiConfidencePassThroughThreshold;
}

- (double)aoiConfidenceConsiderThreshold
{
  return self->_aoiConfidenceConsiderThreshold;
}

- (double)poiConfidencePassThroughThreshold
{
  return self->_poiConfidencePassThroughThreshold;
}

- (double)poiConfidenceConsiderThreshold
{
  return self->_poiConfidenceConsiderThreshold;
}

- (unint64_t)maxNumberOfQueries
{
  return self->_maxNumberOfQueries;
}

- (BOOL)earlyStop
{
  return self->_earlyStop;
}

- (double)noFingerprintMinVisitDuration
{
  return self->_noFingerprintMinVisitDuration;
}

- (double)minVisitLength
{
  return self->_minVisitLength;
}

- (void).cxx_destruct
{
}

@end