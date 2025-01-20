@interface RTSensitiveDateClassifierMetrics
- (NSDate)gatingSignalDate;
- (NSDate)startDate;
- (RTSensitiveDateClassifierMetrics)init;
- (id)collectMetricsWithLookbackWindowDate:(id)a3;
- (int)currentLocationSignalEnvironmentType;
- (int64_t)currentLocationAvailability;
- (int64_t)lookbackWindowCategory;
- (int64_t)parkedCarSignalAvailability;
- (unint64_t)wifiAPCount;
- (void)addCurrentLocation:(id)a3 fromSource:(int64_t)a4;
- (void)processSignal:(int64_t)a3 date:(id)a4;
- (void)setCurrentLocationAvailability:(int64_t)a3;
- (void)setCurrentLocationSignalEnvironmentType:(int)a3;
- (void)setGatingSignalDate:(id)a3;
- (void)setLookbackWindowCategory:(int64_t)a3;
- (void)setParkedCarSignalAvailability:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setWifiAPCount:(unint64_t)a3;
- (void)setup;
- (void)submitMetricsWithLookbackWindowDate:(id)a3;
- (void)updateWifiAccessPointCount:(unint64_t)a3;
@end

@implementation RTSensitiveDateClassifierMetrics

- (RTSensitiveDateClassifierMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTSensitiveDateClassifierMetrics;
  v2 = [(RTSensitiveDateClassifierMetrics *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RTSensitiveDateClassifierMetrics *)v2 setup];
  }
  return v3;
}

- (void)setup
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  startDate = self->_startDate;
  self->_startDate = v3;

  self->_currentLocationSignalEnvironmentType = 0;
  *(_OWORD *)&self->_lookbackWindowCategory = xmmword_1DA0FF600;
  *(_OWORD *)&self->_parkedCarSignalAvailability = xmmword_1DA0FF610;
}

- (void)processSignal:(int64_t)a3 date:(id)a4
{
  id v8 = a4;
  if (a3 == 4) {
    [(RTSensitiveDateClassifierMetrics *)self setParkedCarSignalAvailability:1];
  }
  gatingSignalDate = self->_gatingSignalDate;
  if (!gatingSignalDate || [(NSDate *)gatingSignalDate compare:v8] == NSOrderedAscending)
  {
    objc_storeStrong((id *)&self->_gatingSignalDate, a4);
    self->_lookbackWindowCategory = a3;
  }
}

- (void)addCurrentLocation:(id)a3 fromSource:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    [(RTSensitiveDateClassifierMetrics *)self setCurrentLocationAvailability:a4];
    -[RTSensitiveDateClassifierMetrics setCurrentLocationSignalEnvironmentType:](self, "setCurrentLocationSignalEnvironmentType:", [v6 signalEnvironmentType]);
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v8, 2u);
    }
  }
}

- (void)updateWifiAccessPointCount:(unint64_t)a3
{
  unint64_t v4 = [(RTSensitiveDateClassifierMetrics *)self wifiAPCount] + a3;

  [(RTSensitiveDateClassifierMetrics *)self setWifiAPCount:v4];
}

- (id)collectMetricsWithLookbackWindowDate:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [v6 timeIntervalSinceDate:self->_startDate];
  double v8 = v7;

  v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceDate:v5];
  double v11 = v10;

  v12 = objc_opt_new();
  v13 = [NSNumber numberWithInteger:-[RTSensitiveDateClassifierMetrics lookbackWindowCategory](self, "lookbackWindowCategory")];
  [v12 setObject:v13 forKeyedSubscript:@"_category"];

  v14 = [NSNumber numberWithInteger:-[RTSensitiveDateClassifierMetrics currentLocationAvailability](self, "currentLocationAvailability")];
  [v12 setObject:v14 forKeyedSubscript:@"_currentLocationAvailability"];

  v15 = [NSNumber numberWithUnsignedInt:-[RTSensitiveDateClassifierMetrics currentLocationSignalEnvironmentType](self, "currentLocationSignalEnvironmentType")];
  [v12 setObject:v15 forKeyedSubscript:@"_currentLocationSignalEnvironment"];

  v16 = [NSNumber numberWithDouble:v8];
  [v12 setObject:v16 forKeyedSubscript:@"_latency"];

  v17 = [NSNumber numberWithInteger:-[RTSensitiveDateClassifierMetrics parkedCarSignalAvailability](self, "parkedCarSignalAvailability")];
  [v12 setObject:v17 forKeyedSubscript:@"_parkedCarAvailability"];

  v18 = [NSNumber numberWithUnsignedInteger:-[RTSensitiveDateClassifierMetrics wifiAPCount](self, "wifiAPCount")];
  [v12 setObject:v18 forKeyedSubscript:@"_numWifiAccessPoints"];

  v19 = [NSNumber numberWithDouble:v11];
  [v12 setObject:v19 forKeyedSubscript:@"_lookbackWindowDuration"];

  return v12;
}

- (void)submitMetricsWithLookbackWindowDate:(id)a3
{
  id v6 = [(RTSensitiveDateClassifierMetrics *)self collectMetricsWithLookbackWindowDate:a3];
  id v3 = [NSString alloc];
  unint64_t v4 = (void *)[v3 initWithCString:RTAnalyticsEventSensitiveDateClassifierMetrics encoding:1];
  log_analytics_submission(v4, v6);
  id v5 = [NSString stringWithFormat:@"com.apple.%@", v4];
  AnalyticsSendEvent();
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)gatingSignalDate
{
  return self->_gatingSignalDate;
}

- (void)setGatingSignalDate:(id)a3
{
}

- (int64_t)lookbackWindowCategory
{
  return self->_lookbackWindowCategory;
}

- (void)setLookbackWindowCategory:(int64_t)a3
{
  self->_lookbackWindowCategory = a3;
}

- (int64_t)currentLocationAvailability
{
  return self->_currentLocationAvailability;
}

- (void)setCurrentLocationAvailability:(int64_t)a3
{
  self->_currentLocationAvailability = a3;
}

- (int64_t)parkedCarSignalAvailability
{
  return self->_parkedCarSignalAvailability;
}

- (void)setParkedCarSignalAvailability:(int64_t)a3
{
  self->_parkedCarSignalAvailability = a3;
}

- (int)currentLocationSignalEnvironmentType
{
  return self->_currentLocationSignalEnvironmentType;
}

- (void)setCurrentLocationSignalEnvironmentType:(int)a3
{
  self->_currentLocationSignalEnvironmentType = a3;
}

- (unint64_t)wifiAPCount
{
  return self->_wifiAPCount;
}

- (void)setWifiAPCount:(unint64_t)a3
{
  self->_wifiAPCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatingSignalDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end