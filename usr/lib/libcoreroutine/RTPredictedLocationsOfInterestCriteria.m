@interface RTPredictedLocationsOfInterestCriteria
- (BOOL)evaluatePredictedLocationOfInterest:(id)a3;
- (NSDate)referenceDate;
- (NSString)clientIdentifier;
- (RTLocation)referenceLocation;
- (RTPredictedLocationsOfInterestCriteria)init;
- (RTPredictedLocationsOfInterestCriteria)initWithDistanceCalculator:(id)a3;
- (double)maximumDistance;
- (double)minimumConfidence;
- (double)minimumDistance;
- (double)windowDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setMaximumDistance:(double)a3;
- (void)setMinimumConfidence:(double)a3;
- (void)setMinimumDistance:(double)a3;
- (void)setReferenceDate:(id)a3;
- (void)setReferenceLocation:(id)a3;
- (void)setWindowDuration:(double)a3;
@end

@implementation RTPredictedLocationsOfInterestCriteria

- (void)setWindowDuration:(double)a3
{
  self->_windowDuration = a3;
}

- (void)setReferenceLocation:(id)a3
{
}

- (void)setReferenceDate:(id)a3
{
}

- (void)setMinimumDistance:(double)a3
{
  self->_minimumDistance = a3;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (void)setClientIdentifier:(id)a3
{
}

- (RTPredictedLocationsOfInterestCriteria)initWithDistanceCalculator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTPredictedLocationsOfInterestCriteria;
  v6 = [(RTPredictedLocationsOfInterestCriteria *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_distanceCalculator, a3);
    v7->_windowDuration = INFINITY;
    *(_OWORD *)&v7->_minimumDistance = xmmword_1DA0FFA20;
    v7->_minimumConfidence = 0.0;
  }

  return v7;
}

- (double)windowDuration
{
  return self->_windowDuration;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

- (RTPredictedLocationsOfInterestCriteria)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_);
}

- (BOOL)evaluatePredictedLocationOfInterest:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (self->_referenceDate) {
    goto LABEL_5;
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
    __int16 v44 = 1024;
    LODWORD(v45) = 48;
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _referenceDate (in %s:%d)", buf, 0x12u);
  }

  if (self->_referenceDate)
  {
LABEL_5:
    if (v4)
    {
      v6 = [v4 locationOfInterest];
      if (!v6)
      {
        v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
          __int16 v44 = 1024;
          LODWORD(v45) = 59;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest (in %s:%d)", buf, 0x12u);
        }
        goto LABEL_42;
      }
      if (!self->_referenceLocation) {
        goto LABEL_32;
      }
      double v7 = fabs(self->_minimumDistance);
      if (v7 >= INFINITY && v7 <= INFINITY && fabs(self->_maximumDistance) == INFINITY) {
        goto LABEL_32;
      }
      if (self->_distanceCalculator) {
        goto LABEL_15;
      }
      v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
        __int16 v44 = 1024;
        LODWORD(v45) = 68;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _distanceCalculator (in %s:%d)", buf, 0x12u);
      }

      if (self->_distanceCalculator)
      {
LABEL_15:
        id v9 = objc_alloc(MEMORY[0x1E4F5CE00]);
        v10 = [v6 location];
        [v10 latitude];
        double v12 = v11;
        v13 = [v6 location];
        [v13 longitude];
        double v15 = v14;
        v16 = [v6 location];
        [v16 horizontalUncertainty];
        double v18 = v17;
        v19 = [v6 location];
        [v19 altitude];
        double v21 = v20;
        v22 = [v6 location];
        [v22 verticalUncertainty];
        v24 = [v9 initWithLatitude:0 longitude:0 horizontalUncertainty:v12 altitude:v15 verticalUncertainty:v18 date:v21 referenceFrame:v23 speed:0.0];

        distanceCalculator = self->_distanceCalculator;
        referenceLocation = self->_referenceLocation;
        id v41 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:referenceLocation toLocation:v24 error:&v41];
        double v28 = v27;
        v29 = v41;
        if (v29)
        {
          v30 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = self->_referenceLocation;
            *(_DWORD *)buf = 138412802;
            v43 = (const char *)v29;
            __int16 v44 = 2112;
            double v45 = *(double *)&v31;
            __int16 v46 = 2112;
            v47 = v24;
            _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "encountered error while computing distance, error, %@, location, %@, otherLocation, %@", buf, 0x20u);
          }
          goto LABEL_40;
        }
        if (v28 < self->_minimumDistance)
        {
          v30 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            double minimumDistance = self->_minimumDistance;
            *(_DWORD *)buf = 134218498;
            v43 = *(const char **)&v28;
            __int16 v44 = 2048;
            double v45 = minimumDistance;
            __int16 v46 = 2112;
            v47 = v4;
            v34 = "predicted location of interest failed minimum distance check, distance, %f, minimumDistance, %f, ploi, %@";
LABEL_30:
            _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, v34, buf, 0x20u);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        if (v28 > self->_maximumDistance)
        {
          v30 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            double maximumDistance = self->_maximumDistance;
            *(_DWORD *)buf = 134218498;
            v43 = *(const char **)&v28;
            __int16 v44 = 2048;
            double v45 = maximumDistance;
            __int16 v46 = 2112;
            v47 = v4;
            v34 = "predicted location of interest failed minimum distance check, distance, %f, maximumDistance, %f, ploi, %@";
            goto LABEL_30;
          }
LABEL_40:

          goto LABEL_41;
        }

LABEL_32:
        v36 = [v4 nextEntryTime];
        v24 = v36;
        if (v36)
        {
          [v36 timeIntervalSinceDate:self->_referenceDate];
          if (v37 < 0.0)
          {
            v29 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = [v24 stringFromDate];
              v38 = [(NSDate *)self->_referenceDate stringFromDate];
              *(_DWORD *)buf = 138412802;
              v43 = (const char *)v30;
              __int16 v44 = 2112;
              double v45 = *(double *)&v38;
              __int16 v46 = 2112;
              v47 = v4;
              v39 = "predicted location of interest failed reference date check, nextEntryDate, %@, referenceDate, %@, ploi, %@";
LABEL_39:
              _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, v39, buf, 0x20u);

              goto LABEL_40;
            }
            goto LABEL_41;
          }
          if (v37 > self->_windowDuration)
          {
            v29 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = [v24 stringFromDate];
              v38 = [(NSDate *)self->_referenceDate stringFromDate];
              *(_DWORD *)buf = 138412802;
              v43 = (const char *)v30;
              __int16 v44 = 2112;
              double v45 = *(double *)&v38;
              __int16 v46 = 2112;
              v47 = v4;
              v39 = "predicted location of interest failed interval check, nextEntryDate, %@, referenceDate, %@, ploi, %@";
              goto LABEL_39;
            }
LABEL_41:

LABEL_42:
            BOOL v32 = 0;
LABEL_43:

            goto LABEL_44;
          }
        }
        BOOL v32 = 1;
        goto LABEL_43;
      }
    }
    else
    {
      v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
        __int16 v44 = 1024;
        LODWORD(v45) = 53;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: predictedLocationOfInterest (in %s:%d)", buf, 0x12u);
      }
    }
    BOOL v32 = 0;
LABEL_44:

    goto LABEL_45;
  }
  BOOL v32 = 0;
LABEL_45:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDistanceCalculator:self->_distanceCalculator];
  if (v4)
  {
    id v5 = [(RTPredictedLocationsOfInterestCriteria *)self referenceDate];
    [v4 setReferenceDate:v5];

    [(RTPredictedLocationsOfInterestCriteria *)self windowDuration];
    [v4 setWindowDuration:];
    v6 = [(RTPredictedLocationsOfInterestCriteria *)self referenceLocation];
    [v4 setReferenceLocation:v6];

    [(RTPredictedLocationsOfInterestCriteria *)self minimumDistance];
    [v4 setMinimumDistance:];
    [(RTPredictedLocationsOfInterestCriteria *)self maximumDistance];
    [v4 setMaximumDistance:];
    [(RTPredictedLocationsOfInterestCriteria *)self minimumConfidence];
    [v4 setMinimumConfidence:];
    double v7 = [(RTPredictedLocationsOfInterestCriteria *)self clientIdentifier];
    [v4 setClientIdentifier:v7];
  }
  return v4;
}

- (double)minimumDistance
{
  return self->_minimumDistance;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = a3;
}

@end