@interface RTTrustedTimeCache
- (RTTrustedTimeCache)init;
- (double)cachedReferenceTimeCfatSeconds;
- (double)cachedReferenceTimeMachContSeconds;
- (double)cachedTrustedTimeCfatSeconds;
- (double)cachedTrustedTimeMachContSeconds;
- (double)convertMachContinuousTicksToSeconds:(unint64_t)a3;
- (double)machContSecondsWhenReferenceTimeBoundsSet;
- (double)machContinuousTimeSeconds;
- (double)maxBoundReferenceTimeCfatSeconds;
- (double)minBoundReferenceTimeCfatSeconds;
- (id)getApproximateTrustedDateNow;
- (id)getApproximateTrustedDateNowWithUnsecureFallback;
- (void)setBoundsForReferenceTimeWithMinimumDate:(id)a3 maximumDate:(id)a4;
- (void)setCachedReferenceTimeCfatSeconds:(double)a3;
- (void)setCachedReferenceTimeMachContSeconds:(double)a3;
- (void)setCachedTrustedTimeCfatSeconds:(double)a3;
- (void)setCachedTrustedTimeMachContSeconds:(double)a3;
- (void)setMachContSecondsWhenReferenceTimeBoundsSet:(double)a3;
- (void)setMaxBoundReferenceTimeCfatSeconds:(double)a3;
- (void)setMinBoundReferenceTimeCfatSeconds:(double)a3;
@end

@implementation RTTrustedTimeCache

- (id)getApproximateTrustedDateNowWithUnsecureFallback
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(RTTrustedTimeCache *)self getApproximateTrustedDateNow];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_26:
    v15 = v5;
    goto LABEL_27;
  }
  [(RTTrustedTimeCache *)self machContinuousTimeSeconds];
  double v7 = v6;
  double v8 = v6 - self->_cachedReferenceTimeMachContSeconds;
  if (self->_cachedTrustedTimeCfatSeconds != 0.0 && v8 <= 300.0) {
    goto LABEL_21;
  }
  if (!TMGetReferenceTime())
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "Reference time unavailable", buf, 2u);
    }
    goto LABEL_20;
  }
  double minBoundReferenceTimeCfatSeconds = self->_minBoundReferenceTimeCfatSeconds;
  double maxBoundReferenceTimeCfatSeconds = self->_maxBoundReferenceTimeCfatSeconds;
  if (maxBoundReferenceTimeCfatSeconds < -1.0 && maxBoundReferenceTimeCfatSeconds != 0.0)
  {
    if (v7 - self->_machContSecondsWhenReferenceTimeBoundsSet + 10.0 <= maxBoundReferenceTimeCfatSeconds
                                                                       - minBoundReferenceTimeCfatSeconds)
    {
LABEL_11:
      char v11 = 0;
      goto LABEL_15;
    }
    self->_double maxBoundReferenceTimeCfatSeconds = maxBoundReferenceTimeCfatSeconds
                                            + maxBoundReferenceTimeCfatSeconds
                                            - minBoundReferenceTimeCfatSeconds;
  }
  if (-1.0 + 10.0 < minBoundReferenceTimeCfatSeconds) {
    goto LABEL_11;
  }
  self->_double cachedReferenceTimeCfatSeconds = -1.0;
  self->_cachedReferenceTimeMachContSeconds = v7;
  double v8 = 0.0;
  char v11 = 1;
LABEL_15:
  double Current = CFAbsoluteTimeGetCurrent();
  v14 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349568;
    double v24 = Current - -1.0;
    __int16 v25 = 2050;
    double v26 = -1.0;
    __int16 v27 = 1026;
    LODWORD(v28) = 0;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "Reference time fetched with offset %{public}.3f,unc,%{public}.3f,rel,%{public}d", buf, 0x1Cu);
  }

  if ((v11 & 1) == 0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v21 = self->_minBoundReferenceTimeCfatSeconds;
      double v22 = self->_maxBoundReferenceTimeCfatSeconds;
      *(_DWORD *)buf = 134349568;
      double v24 = -1.0;
      __int16 v25 = 2050;
      double v26 = v21;
      __int16 v27 = 2050;
      double v28 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Reference time %{public}.1f violated bounds %{public}.1f,%{public}.1f", buf, 0x20u);
    }
LABEL_20:
  }
LABEL_21:
  v15 = 0;
  double cachedReferenceTimeCfatSeconds = self->_cachedReferenceTimeCfatSeconds;
  if (cachedReferenceTimeCfatSeconds != 0.0 && v8 < 14400.0)
  {
    double v17 = v8 + cachedReferenceTimeCfatSeconds;
    double v18 = CFAbsoluteTimeGetCurrent();
    v19 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      double v24 = v8;
      __int16 v25 = 2050;
      double v26 = v18 - v17;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Reference time fetched with age %{public}.3f and offset %{public}.3f", buf, 0x16u);
    }

    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v17];
    goto LABEL_26;
  }
LABEL_27:

  return v15;
}

- (id)getApproximateTrustedDateNow
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(RTTrustedTimeCache *)self machContinuousTimeSeconds];
  double v4 = v3;
  double cachedTrustedTimeCfatSeconds = self->_cachedTrustedTimeCfatSeconds;
  double v6 = v4 - self->_cachedTrustedTimeMachContSeconds;
  if (cachedTrustedTimeCfatSeconds == 0.0 || v6 > 300.0)
  {
    if (TMGetTrustedInterval())
    {
      self->_double cachedTrustedTimeCfatSeconds = -1.0;
      self->_cachedTrustedTimeMachContSeconds = v4;
      double Current = CFAbsoluteTimeGetCurrent();
      double v8 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
      double v6 = 0.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        double v18 = Current - -1.0;
        __int16 v19 = 2050;
        double v20 = -1.0;
        v9 = "Trusted interval fetched with offset %{public}.3f,unc,%{public}.3f";
        v10 = v8;
        uint32_t v11 = 22;
LABEL_8:
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      double v8 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Trusted interval unavailable";
        v10 = v8;
        uint32_t v11 = 2;
        goto LABEL_8;
      }
    }

    double cachedTrustedTimeCfatSeconds = self->_cachedTrustedTimeCfatSeconds;
  }
  v12 = 0;
  if (cachedTrustedTimeCfatSeconds != 0.0 && v6 < 14400.0)
  {
    double v13 = cachedTrustedTimeCfatSeconds + v6;
    double v14 = CFAbsoluteTimeGetCurrent();
    v15 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      double v18 = v6;
      __int16 v19 = 2050;
      double v20 = v14 - v13;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Trusted interval fetched with age %{public}.3f and offset %{public}.3f", buf, 0x16u);
    }

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v13];
  }

  return v12;
}

- (double)machContinuousTimeSeconds
{
  uint64_t v3 = mach_continuous_time();

  [(RTTrustedTimeCache *)self convertMachContinuousTicksToSeconds:v3];
  return result;
}

- (double)convertMachContinuousTicksToSeconds:(unint64_t)a3
{
  if (qword_1EBE38898 != -1) {
    dispatch_once(&qword_1EBE38898, &__block_literal_global_84);
  }
  return (double)(_MergedGlobals_102 * a3 / *(unsigned int *)algn_1EBE38894) * 0.000000001;
}

- (RTTrustedTimeCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTTrustedTimeCache;
  double result = [(RTTrustedTimeCache *)&v3 init];
  if (result)
  {
    result->_machContSecondsWhenReferenceTimeBoundsSet = 0.0;
    *(_OWORD *)&result->_double minBoundReferenceTimeCfatSeconds = 0u;
    *(_OWORD *)&result->_double cachedReferenceTimeCfatSeconds = 0u;
    *(_OWORD *)&result->_double cachedTrustedTimeCfatSeconds = 0u;
  }
  return result;
}

uint64_t __58__RTTrustedTimeCache_convertMachContinuousTicksToSeconds___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_MergedGlobals_102);
}

- (void)setBoundsForReferenceTimeWithMinimumDate:(id)a3 maximumDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_double minBoundReferenceTimeCfatSeconds = 0.0;
  self->_double maxBoundReferenceTimeCfatSeconds = 0.0;
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    self->_double minBoundReferenceTimeCfatSeconds = v8;
  }
  if (v7)
  {
    [v7 timeIntervalSinceReferenceDate];
    self->_double maxBoundReferenceTimeCfatSeconds = v9;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint32_t v11 = _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double minBoundReferenceTimeCfatSeconds = self->_minBoundReferenceTimeCfatSeconds;
    double maxBoundReferenceTimeCfatSeconds = self->_maxBoundReferenceTimeCfatSeconds;
    int v14 = 134349824;
    double v15 = minBoundReferenceTimeCfatSeconds;
    __int16 v16 = 2050;
    double v17 = maxBoundReferenceTimeCfatSeconds;
    __int16 v18 = 2050;
    double v19 = Current - minBoundReferenceTimeCfatSeconds;
    __int16 v20 = 2050;
    double v21 = Current - maxBoundReferenceTimeCfatSeconds;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "Set reference time bounds to %{public}.1f,%{public}.1f, age, %{public}.1f,%{public}.1f", (uint8_t *)&v14, 0x2Au);
  }
}

- (double)cachedTrustedTimeCfatSeconds
{
  return self->_cachedTrustedTimeCfatSeconds;
}

- (void)setCachedTrustedTimeCfatSeconds:(double)a3
{
  self->_double cachedTrustedTimeCfatSeconds = a3;
}

- (double)cachedTrustedTimeMachContSeconds
{
  return self->_cachedTrustedTimeMachContSeconds;
}

- (void)setCachedTrustedTimeMachContSeconds:(double)a3
{
  self->_cachedTrustedTimeMachContSeconds = a3;
}

- (double)cachedReferenceTimeCfatSeconds
{
  return self->_cachedReferenceTimeCfatSeconds;
}

- (void)setCachedReferenceTimeCfatSeconds:(double)a3
{
  self->_double cachedReferenceTimeCfatSeconds = a3;
}

- (double)cachedReferenceTimeMachContSeconds
{
  return self->_cachedReferenceTimeMachContSeconds;
}

- (void)setCachedReferenceTimeMachContSeconds:(double)a3
{
  self->_cachedReferenceTimeMachContSeconds = a3;
}

- (double)minBoundReferenceTimeCfatSeconds
{
  return self->_minBoundReferenceTimeCfatSeconds;
}

- (void)setMinBoundReferenceTimeCfatSeconds:(double)a3
{
  self->_double minBoundReferenceTimeCfatSeconds = a3;
}

- (double)maxBoundReferenceTimeCfatSeconds
{
  return self->_maxBoundReferenceTimeCfatSeconds;
}

- (void)setMaxBoundReferenceTimeCfatSeconds:(double)a3
{
  self->_double maxBoundReferenceTimeCfatSeconds = a3;
}

- (double)machContSecondsWhenReferenceTimeBoundsSet
{
  return self->_machContSecondsWhenReferenceTimeBoundsSet;
}

- (void)setMachContSecondsWhenReferenceTimeBoundsSet:(double)a3
{
  self->_machContSecondsWhenReferenceTimeBoundsSet = a3;
}

@end