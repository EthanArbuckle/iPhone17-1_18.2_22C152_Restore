@interface RTVisitPipelineMotionAccumulatorParams
+ (double)loadParameterFromDefaults:(id)a3 parameterName:(id)a4 defaultValue:(double)a5;
- (RTVisitPipelineMotionAccumulatorParams)init;
- (RTVisitPipelineMotionAccumulatorParams)initWithDefaultsManager:(id)a3;
- (double)maxAllowedGapBetweenActiveMotionStates;
- (double)maxTimeToTrim;
- (double)minMotionDurationAtHighConfidence;
- (double)minMotionDurationAtMediumConfidence;
- (double)motionLookWindowOutsideVisit;
- (void)setMaxAllowedGapBetweenActiveMotionStates:(double)a3;
- (void)setMaxTimeToTrim:(double)a3;
- (void)setMinMotionDurationAtHighConfidence:(double)a3;
- (void)setMinMotionDurationAtMediumConfidence:(double)a3;
- (void)setMotionLookWindowOutsideVisit:(double)a3;
@end

@implementation RTVisitPipelineMotionAccumulatorParams

+ (double)loadParameterFromDefaults:(id)a3 parameterName:(id)a4 defaultValue:(double)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [a3 objectForKey:v8];
  if (v9)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromSelector(a2);
      int v16 = 138413314;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2048;
      double v23 = a5;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@: Parameter updated: \"%@\", original value, %f, overridden value, %@", (uint8_t *)&v16, 0x34u);
    }
    [v9 doubleValue];
    a5 = v14;
  }

  return a5;
}

- (RTVisitPipelineMotionAccumulatorParams)initWithDefaultsManager:(id)a3
{
  id v4 = a3;
  v5 = [(RTVisitPipelineMotionAccumulatorParams *)self init];
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:v4 parameterName:@"RTDefaultsVisitPipelineMotionStateTrimmerTimeToTrim" defaultValue:v5->_maxTimeToTrim];
  v5->_maxTimeToTrim = v6;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:v4 parameterName:@"RTDefaultsVisitPipelineMotionStateTrimmerLookOutsideVisit" defaultValue:v5->_motionLookWindowOutsideVisit];
  v5->_motionLookWindowOutsideVisit = v7;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:v4 parameterName:@"RTDefaultsVisitPipelineMotionStateTrimmerDurationAtHighConfidence" defaultValue:v5->_minMotionDurationAtHighConfidence];
  v5->_minMotionDurationAtHighConfidence = v8;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:v4 parameterName:@"RTDefaultsVisitPipelineMotionStateTrimmerDurationAtMediumConfidence" defaultValue:v5->_minMotionDurationAtMediumConfidence];
  v5->_minMotionDurationAtMediumConfidence = v9;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:v4 parameterName:@"RTDefaultsVisitPipelineMotionStateTrimmerMaxAllowedMotionGap" defaultValue:v5->_maxAllowedGapBetweenActiveMotionStates];
  double v11 = v10;

  v5->_maxAllowedGapBetweenActiveMotionStates = v11;
  return v5;
}

- (RTVisitPipelineMotionAccumulatorParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTVisitPipelineMotionAccumulatorParams;
  result = [(RTVisitPipelineMotionAccumulatorParams *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_maxTimeToTrim = vdupq_n_s64(0x4066800000000000uLL);
    *(_OWORD *)&result->_minMotionDurationAtHighConfidence = xmmword_1DA0FFA30;
    result->_maxAllowedGapBetweenActiveMotionStates = 30.0;
  }
  return result;
}

- (double)maxTimeToTrim
{
  return self->_maxTimeToTrim;
}

- (void)setMaxTimeToTrim:(double)a3
{
  self->_maxTimeToTrim = a3;
}

- (double)motionLookWindowOutsideVisit
{
  return self->_motionLookWindowOutsideVisit;
}

- (void)setMotionLookWindowOutsideVisit:(double)a3
{
  self->_motionLookWindowOutsideVisit = a3;
}

- (double)minMotionDurationAtHighConfidence
{
  return self->_minMotionDurationAtHighConfidence;
}

- (void)setMinMotionDurationAtHighConfidence:(double)a3
{
  self->_minMotionDurationAtHighConfidence = a3;
}

- (double)minMotionDurationAtMediumConfidence
{
  return self->_minMotionDurationAtMediumConfidence;
}

- (void)setMinMotionDurationAtMediumConfidence:(double)a3
{
  self->_minMotionDurationAtMediumConfidence = a3;
}

- (double)maxAllowedGapBetweenActiveMotionStates
{
  return self->_maxAllowedGapBetweenActiveMotionStates;
}

- (void)setMaxAllowedGapBetweenActiveMotionStates:(double)a3
{
  self->_maxAllowedGapBetweenActiveMotionStates = a3;
}

@end