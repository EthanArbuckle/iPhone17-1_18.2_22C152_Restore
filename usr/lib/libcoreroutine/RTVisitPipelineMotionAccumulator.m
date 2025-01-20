@interface RTVisitPipelineMotionAccumulator
+ (BOOL)isActivityTypeMotionTrimmable:(unint64_t)a3;
- (BOOL)processActivitiesReverse;
- (RTVisitPipelineMotionAccumulator)initWithParams:(id)a3 processInReverse:(BOOL)a4;
- (RTVisitPipelineMotionAccumulatorParams)params;
- (id)getTrimDate;
- (void)finishMotionObservations:(id)a3;
- (void)processMotionActivity:(id)a3;
@end

@implementation RTVisitPipelineMotionAccumulator

+ (BOOL)isActivityTypeMotionTrimmable:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (RTVisitPipelineMotionAccumulator)initWithParams:(id)a3 processInReverse:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTVisitPipelineMotionAccumulator initWithParams:processInReverse:]";
      __int16 v15 = 1024;
      int v16 = 25;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionAccumulatorParams (in %s:%d)", buf, 0x12u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)RTVisitPipelineMotionAccumulator;
  v9 = [(RTVisitPipelineMotionAccumulator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_params, a3);
    v10->_processActivitiesReverse = a4;
    v10->_foundIntervalToTrim = 0;
    v10->_runningScoreHighConfidence = 0.0;
    v10->_runningScoreMediumConfidence = 0.0;
  }

  return v10;
}

- (void)processMotionActivity:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!self->_foundIntervalToTrim)
  {
    p_lastObservedMotionActivity = &self->_lastObservedMotionActivity;
    if (self->_lastObservedMotionActivity)
    {
      v8 = [v5 startDate];
      v9 = [(RTMotionActivity *)self->_lastObservedMotionActivity startDate];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (self->_processActivitiesReverse) {
        double v11 = -v11;
      }
      if (v11 < 0.0)
      {
        objc_super v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          BOOL processActivitiesReverse = self->_processActivitiesReverse;
          v24 = [(RTMotionActivity *)self->_lastObservedMotionActivity startDate];
          v25 = [v6 startDate];
          int v26 = 67110146;
          *(_DWORD *)v27 = processActivitiesReverse;
          *(_WORD *)&v27[4] = 2112;
          *(void *)&v27[6] = v24;
          __int16 v28 = 2112;
          v29 = v25;
          __int16 v30 = 2080;
          v31 = "-[RTVisitPipelineMotionAccumulator processMotionActivity:]";
          __int16 v32 = 1024;
          int v33 = 63;
          _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Observed motion activity is out of expected order. Running in reverse: %u. Previous time %@, current time %@ (in %s:%d)", (uint8_t *)&v26, 0x2Cu);
        }
      }
      if (+[RTVisitPipelineMotionAccumulator isActivityTypeMotionTrimmable:[(RTMotionActivity *)*p_lastObservedMotionActivity type]])
      {
        if ((unint64_t)[(RTMotionActivity *)*p_lastObservedMotionActivity confidence] >= 2)
        {
          if (!self->_intervalStartDate)
          {
            v13 = [(RTMotionActivity *)self->_lastObservedMotionActivity startDate];
            intervalStartDate = self->_intervalStartDate;
            self->_intervalStartDate = v13;
          }
          if ([(RTMotionActivity *)*p_lastObservedMotionActivity confidence] == 2)
          {
            self->_double runningScoreMediumConfidence = v11 + self->_runningScoreMediumConfidence;
          }
          else if ([(RTMotionActivity *)*p_lastObservedMotionActivity confidence] == 3)
          {
            self->_double runningScoreHighConfidence = v11 + self->_runningScoreHighConfidence;
          }
        }
      }
      else
      {
        [(RTVisitPipelineMotionAccumulatorParams *)self->_params maxAllowedGapBetweenActiveMotionStates];
        if (v11 > v15)
        {
          self->_double runningScoreHighConfidence = 0.0;
          self->_double runningScoreMediumConfidence = 0.0;
          int v16 = self->_intervalStartDate;
          self->_intervalStartDate = 0;
        }
      }
      double runningScoreMediumConfidence = self->_runningScoreMediumConfidence;
      [(RTVisitPipelineMotionAccumulatorParams *)self->_params minMotionDurationAtMediumConfidence];
      double runningScoreHighConfidence = self->_runningScoreHighConfidence;
      double v20 = runningScoreMediumConfidence / v19;
      [(RTVisitPipelineMotionAccumulatorParams *)self->_params minMotionDurationAtHighConfidence];
      if (v20 + runningScoreHighConfidence / v21 >= 1.0)
      {
        self->_foundIntervalToTrim = 1;
        if (!self->_intervalStartDate)
        {
          v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            int v26 = 136315394;
            *(void *)v27 = "-[RTVisitPipelineMotionAccumulator processMotionActivity:]";
            *(_WORD *)&v27[8] = 1024;
            *(_DWORD *)&v27[10] = 93;
            _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Interval start not set (in %s:%d)", (uint8_t *)&v26, 0x12u);
          }
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastObservedMotionActivity, a3);
      if (!+[RTVisitPipelineMotionAccumulator isActivityTypeMotionTrimmable:](RTVisitPipelineMotionAccumulator, "isActivityTypeMotionTrimmable:", [v6 type]))goto LABEL_25; {
    }
      }
    objc_storeStrong((id *)p_lastObservedMotionActivity, a3);
  }
LABEL_25:
}

- (void)finishMotionObservations:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F5CE50];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithType:0 confidence:2 startDate:v5];

  [(RTVisitPipelineMotionAccumulator *)self processMotionActivity:v6];
}

- (id)getTrimDate
{
  if (self->_foundIntervalToTrim) {
    return self->_intervalStartDate;
  }
  else {
    return 0;
  }
}

- (RTVisitPipelineMotionAccumulatorParams)params
{
  return self->_params;
}

- (BOOL)processActivitiesReverse
{
  return self->_processActivitiesReverse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_lastObservedMotionActivity, 0);

  objc_storeStrong((id *)&self->_intervalStartDate, 0);
}

@end