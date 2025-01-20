@interface RTPredictedDatesCriteria
- (BOOL)evaluatePredictedDate:(id)a3;
- (NSDate)referenceDate;
- (RTLocation)referenceLocation;
- (RTPredictedDatesCriteria)init;
- (double)minimumConfidence;
- (double)windowDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMinimumConfidence:(double)a3;
- (void)setReferenceDate:(id)a3;
- (void)setReferenceLocation:(id)a3;
- (void)setWindowDuration:(double)a3;
@end

@implementation RTPredictedDatesCriteria

- (RTPredictedDatesCriteria)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTPredictedDatesCriteria;
  result = [(RTPredictedDatesCriteria *)&v3 init];
  if (result)
  {
    result->_windowDuration = INFINITY;
    result->_minimumConfidence = 0.0;
  }
  return result;
}

- (BOOL)evaluatePredictedDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_referenceLocation) {
    goto LABEL_33;
  }
  v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
    __int16 v21 = 1024;
    LODWORD(v22) = 169;
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _referenceLocation (in %s:%d)", (uint8_t *)&v19, 0x12u);
  }

  if (self->_referenceLocation)
  {
LABEL_33:
    if (self->_referenceDate) {
      goto LABEL_9;
    }
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 174;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _referenceDate (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }

    if (self->_referenceDate)
    {
LABEL_9:
      if (!v4)
      {
        v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136315394;
          v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
          __int16 v21 = 1024;
          LODWORD(v22) = 179;
          _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: predictedDate (in %s:%d)", (uint8_t *)&v19, 0x12u);
        }
        goto LABEL_24;
      }
      v7 = [v4 date];
      v8 = v7;
      if (!v7)
      {
        v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136315394;
          v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
          __int16 v21 = 1024;
          LODWORD(v22) = 185;
          _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v19, 0x12u);
        }
        goto LABEL_23;
      }
      [v7 timeIntervalSinceDate:self->_referenceDate];
      if (v9 >= 0.0)
      {
        if (v9 <= self->_windowDuration)
        {
          [v4 confidence];
          double v17 = v16;
          if (v16 >= self->_minimumConfidence)
          {
            BOOL v14 = 1;
            goto LABEL_25;
          }
          v10 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            double minimumConfidence = self->_minimumConfidence;
            int v19 = 134218498;
            v20 = *(const char **)&v17;
            __int16 v21 = 2048;
            double v22 = minimumConfidence;
            __int16 v23 = 2112;
            id v24 = v4;
            _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "predicted date failed minimum confidence check, confidence, %f, minimumConfidence, %f, predicted date, %@", (uint8_t *)&v19, 0x20u);
          }
          goto LABEL_23;
        }
        v10 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = [v8 stringFromDate];
          v12 = [(NSDate *)self->_referenceDate stringFromDate];
          int v19 = 138412802;
          v20 = v11;
          __int16 v21 = 2112;
          double v22 = *(double *)&v12;
          __int16 v23 = 2112;
          id v24 = v4;
          v13 = "predicted date failed interval check, nextEntryDate, %@, referenceDate, %@, predicted date, %@";
          goto LABEL_22;
        }
      }
      else
      {
        v10 = _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = [v8 stringFromDate];
          v12 = [(NSDate *)self->_referenceDate stringFromDate];
          int v19 = 138412802;
          v20 = v11;
          __int16 v21 = 2112;
          double v22 = *(double *)&v12;
          __int16 v23 = 2112;
          id v24 = v4;
          v13 = "predicted date failed reference date check, nextEntryDate, %@, referenceDate, %@, predicted date, %@";
LABEL_22:
          _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v19, 0x20u);
        }
      }
LABEL_23:

LABEL_24:
      BOOL v14 = 0;
LABEL_25:

      goto LABEL_26;
    }
  }
  BOOL v14 = 0;
LABEL_26:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  if (v4)
  {
    v5 = [(RTPredictedDatesCriteria *)self referenceDate];
    [v4 setReferenceDate:v5];

    [(RTPredictedDatesCriteria *)self windowDuration];
    [v4 setWindowDuration:];
    v6 = [(RTPredictedDatesCriteria *)self referenceLocation];
    [v4 setReferenceLocation:v6];

    [(RTPredictedDatesCriteria *)self minimumConfidence];
    [v4 setMinimumConfidence:];
  }
  return v4;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (double)windowDuration
{
  return self->_windowDuration;
}

- (void)setWindowDuration:(double)a3
{
  self->_windowDuration = a3;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (void)setReferenceLocation:(id)a3
{
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_double minimumConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLocation, 0);

  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end