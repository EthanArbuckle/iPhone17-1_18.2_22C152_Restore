@interface NTKSolarTimeModel
- (BOOL)dependentValuesNeedUpdate;
- (BOOL)includesDate:(id)a3;
- (BOOL)usePlaceholderData;
- (CLLocation)referenceLocation;
- (NSDate)endDateForReferenceDate;
- (NSDate)localDawnDate;
- (NSDate)localDuskDate;
- (NSDate)localSolarMidnightDate;
- (NSDate)localSolarNoonDate;
- (NSDate)localSunriseDate;
- (NSDate)localSunsetDate;
- (NSDate)referenceDate;
- (NSDate)startDateForReferenceDate;
- (NTKSolarTimeModel)init;
- (NTKSolarTimeModel)initWithReferenceDate:(id)a3 referenceLocation:(id)a4;
- (NTKSolarTimeModel)initWithReferenceDate:(id)a3 referenceLocation:(id)a4 twilightType:(unint64_t)a5;
- (double)effectiveSolarDayLength;
- (double)percentageThroughPeriodForDate:(id)a3;
- (double)percentageThroughPeriodForIdealizedTimeInCurrentSolarDay;
- (double)percentageThroughPeriodInCurrentSolarDayForDate:(id)a3;
- (id)_nextEvent:(id)a3 ofType:(unsigned int)a4;
- (id)dateForPercentageThroughPeriod:(double)a3;
- (id)normalizeDateIntervalForDate:(id)a3;
- (id)ntkCacheableKey;
- (unint64_t)twilightType;
- (void)_updateDependentValues;
- (void)setDependentValuesNeedUpdate:(BOOL)a3;
- (void)setEffectiveSolarDayLength:(double)a3;
- (void)setEndDateForReferenceDate:(id)a3;
- (void)setLocalDawnDate:(id)a3;
- (void)setLocalDuskDate:(id)a3;
- (void)setLocalSolarMidnightDate:(id)a3;
- (void)setLocalSolarNoonDate:(id)a3;
- (void)setLocalSunriseDate:(id)a3;
- (void)setLocalSunsetDate:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setReferenceLocation:(id)a3;
- (void)setStartDateForReferenceDate:(id)a3;
- (void)setTwilightType:(unint64_t)a3;
- (void)setUsePlaceholderData:(BOOL)a3;
- (void)updateForTimeZoneChange;
@end

@implementation NTKSolarTimeModel

- (NTKSolarTimeModel)init
{
  return [(NTKSolarTimeModel *)self initWithReferenceDate:0 referenceLocation:0];
}

- (NTKSolarTimeModel)initWithReferenceDate:(id)a3 referenceLocation:(id)a4
{
  return [(NTKSolarTimeModel *)self initWithReferenceDate:a3 referenceLocation:a4 twilightType:0];
}

- (NTKSolarTimeModel)initWithReferenceDate:(id)a3 referenceLocation:(id)a4 twilightType:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKSolarTimeModel;
  v11 = [(NTKSolarTimeModel *)&v14 init];
  if (v11)
  {
    v12 = _NTKLoggingObjectForDomain(34, (uint64_t)"NTKLoggingDomainSolar");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412803;
      id v16 = v9;
      __int16 v17 = 2113;
      id v18 = v10;
      __int16 v19 = 2048;
      unint64_t v20 = a5;
      _os_log_debug_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEBUG, "SolarTimeModel initWithReferenceDate:%@, referenceLocation:%{private}@, twilightType:%lu", buf, 0x20u);
    }

    objc_storeStrong((id *)&v11->_referenceDate, a3);
    objc_storeStrong((id *)&v11->_referenceLocation, a4);
    v11->_twilightType = a5;
    v11->_dependentValuesNeedUpdate = 1;
  }

  return v11;
}

- (BOOL)includesDate:(id)a3
{
  id v4 = a3;
  [(NTKSolarTimeModel *)self _updateDependentValues];
  v5 = [(NTKSolarTimeModel *)self startDateForReferenceDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  v8 = [(NTKSolarTimeModel *)self endDateForReferenceDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  [v4 timeIntervalSinceReferenceDate];
  double v12 = v11;

  return v12 <= v10 && v12 >= v7;
}

- (double)percentageThroughPeriodForIdealizedTimeInCurrentSolarDay
{
  v3 = NTKIdealizedDate();
  [(NTKSolarTimeModel *)self percentageThroughPeriodInCurrentSolarDayForDate:v3];
  double v5 = v4;

  return v5;
}

- (id)normalizeDateIntervalForDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  double v6 = [(NTKSolarTimeModel *)self startDateForReferenceDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  double v9 = [(NTKSolarTimeModel *)self endDateForReferenceDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  for (; v5 > v11; double v5 = v5 + -86400.0)
    ;
  for (; v5 < v8; double v5 = v5 + 86400.0)
    ;
  double v12 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)[v12 dateWithTimeIntervalSinceReferenceDate:v5];
}

- (double)percentageThroughPeriodInCurrentSolarDayForDate:(id)a3
{
  id v4 = a3;
  [(NTKSolarTimeModel *)self _updateDependentValues];
  double v5 = [(NTKSolarTimeModel *)self normalizeDateIntervalForDate:v4];

  [(NTKSolarTimeModel *)self percentageThroughPeriodForDate:v5];
  double v7 = v6;

  return v7;
}

- (double)percentageThroughPeriodForDate:(id)a3
{
  id v4 = a3;
  [(NTKSolarTimeModel *)self _updateDependentValues];
  double v5 = [(NTKSolarTimeModel *)self startDateForReferenceDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  double v8 = [(NTKSolarTimeModel *)self endDateForReferenceDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  [v4 timeIntervalSinceReferenceDate];
  double v12 = v11;

  double result = 0.0;
  if (v10 - v7 > 0.0) {
    return (v12 - v7) / (v10 - v7);
  }
  return result;
}

- (id)dateForPercentageThroughPeriod:(double)a3
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  double v5 = [(NTKSolarTimeModel *)self startDateForReferenceDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  double v8 = [(NTKSolarTimeModel *)self endDateForReferenceDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  double v11 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)[v11 dateWithTimeIntervalSinceReferenceDate:v7 + (v10 - v7) * a3];
}

- (id)_nextEvent:(id)a3 ofType:(unsigned int)a4
{
  [a3 nextEventOfType:*(void *)&a4];
  if (v4 == 0.0) {
    [MEMORY[0x1E4F1C9C8] distantPast];
  }
  else {
  double v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  return v5;
}

- (void)_updateDependentValues
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = *a1;
  [*a1 coordinate];
  uint64_t v6 = v5;
  [*a1 coordinate];
  int v8 = 138478339;
  id v9 = v4;
  __int16 v10 = 2049;
  uint64_t v11 = v6;
  __int16 v12 = 2049;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "SolarTimeModel referenceLocation: %{private}@ latitue: %{private}f longitude: %{private}f ", (uint8_t *)&v8, 0x20u);
}

- (void)updateForTimeZoneChange
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[NTKSolarTimeModel updateForTimeZoneChange]";
  _os_log_debug_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_DEBUG, "SolarTimeModel %s", (uint8_t *)&v1, 0xCu);
}

- (void)setReferenceDate:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToDate:self->_referenceDate] & 1) == 0)
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(34, (uint64_t)"NTKLoggingDomainSolar");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NTKSolarTimeModel setReferenceDate:]((uint64_t)v5, v6);
    }

    objc_storeStrong((id *)&self->_referenceDate, a3);
    [(NTKSolarTimeModel *)self setDependentValuesNeedUpdate:1];
  }
}

- (void)setReferenceLocation:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_referenceLocation] & 1) == 0)
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(34, (uint64_t)"NTKLoggingDomainSolar");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NTKSolarTimeModel setReferenceLocation:]((uint64_t)v5, v6);
    }

    objc_storeStrong((id *)&self->_referenceLocation, a3);
    [(NTKSolarTimeModel *)self setDependentValuesNeedUpdate:1];
  }
}

- (void)setUsePlaceholderData:(BOOL)a3
{
  if (self->_usePlaceholderData != a3)
  {
    self->_usePlaceholderData = a3;
    [(NTKSolarTimeModel *)self setDependentValuesNeedUpdate:1];
  }
}

- (NSDate)startDateForReferenceDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  startDateForReferenceDate = self->_startDateForReferenceDate;
  return startDateForReferenceDate;
}

- (NSDate)endDateForReferenceDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  endDateForReferenceDate = self->_endDateForReferenceDate;
  return endDateForReferenceDate;
}

- (NSDate)localSolarMidnightDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  localSolarMidnightDate = self->_localSolarMidnightDate;
  return localSolarMidnightDate;
}

- (NSDate)localSunriseDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  localSunriseDate = self->_localSunriseDate;
  return localSunriseDate;
}

- (NSDate)localSunsetDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  localSunsetDate = self->_localSunsetDate;
  return localSunsetDate;
}

- (NSDate)localDawnDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  localDawnDate = self->_localDawnDate;
  return localDawnDate;
}

- (NSDate)localDuskDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  localDuskDate = self->_localDuskDate;
  return localDuskDate;
}

- (NSDate)localSolarNoonDate
{
  [(NTKSolarTimeModel *)self _updateDependentValues];
  localSolarNoonDate = self->_localSolarNoonDate;
  return localSolarNoonDate;
}

- (double)effectiveSolarDayLength
{
  return self->_effectiveSolarDayLength;
}

- (id)ntkCacheableKey
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"YYYY-MM-dd"];
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  BOOL usePlaceholderData = self->_usePlaceholderData;
  int v8 = [v3 stringFromDate:self->_referenceDate];
  [(CLLocation *)self->_referenceLocation coordinate];
  uint64_t v10 = (int)(v9 * 10000.0);
  [(CLLocation *)self->_referenceLocation coordinate];
  __int16 v12 = [v4 stringWithFormat:@"[%@-usePlaceholderData:%d-date:%@-lat:%d-lon:%d]", v6, usePlaceholderData, v8, v10, (int)(v11 * 10000.0)];

  return v12;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (BOOL)usePlaceholderData
{
  return self->_usePlaceholderData;
}

- (void)setStartDateForReferenceDate:(id)a3
{
}

- (void)setEndDateForReferenceDate:(id)a3
{
}

- (void)setLocalSolarMidnightDate:(id)a3
{
}

- (void)setEffectiveSolarDayLength:(double)a3
{
  self->_effectiveSolarDayLength = a3;
}

- (void)setLocalSunriseDate:(id)a3
{
}

- (void)setLocalSunsetDate:(id)a3
{
}

- (void)setLocalDawnDate:(id)a3
{
}

- (void)setLocalDuskDate:(id)a3
{
}

- (void)setLocalSolarNoonDate:(id)a3
{
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (BOOL)dependentValuesNeedUpdate
{
  return self->_dependentValuesNeedUpdate;
}

- (void)setDependentValuesNeedUpdate:(BOOL)a3
{
  self->_dependentValuesNeedUpdate = a3;
}

- (unint64_t)twilightType
{
  return self->_twilightType;
}

- (void)setTwilightType:(unint64_t)a3
{
  self->_twilightType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_localSolarNoonDate, 0);
  objc_storeStrong((id *)&self->_localDuskDate, 0);
  objc_storeStrong((id *)&self->_localDawnDate, 0);
  objc_storeStrong((id *)&self->_localSunsetDate, 0);
  objc_storeStrong((id *)&self->_localSunriseDate, 0);
  objc_storeStrong((id *)&self->_localSolarMidnightDate, 0);
  objc_storeStrong((id *)&self->_endDateForReferenceDate, 0);
  objc_storeStrong((id *)&self->_startDateForReferenceDate, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

- (void)setReferenceDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[NTKSolarTimeModel setReferenceDate:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "SolarTimeModel %s to:%@", (uint8_t *)&v2, 0x16u);
}

- (void)setReferenceLocation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315395;
  id v3 = "-[NTKSolarTimeModel setReferenceLocation:]";
  __int16 v4 = 2113;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "SolarTimeModel %s to:%{private}@", (uint8_t *)&v2, 0x16u);
}

@end