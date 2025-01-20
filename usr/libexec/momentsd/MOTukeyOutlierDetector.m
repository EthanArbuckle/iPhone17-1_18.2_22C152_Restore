@interface MOTukeyOutlierDetector
- (BOOL)fitData:(id)a3;
- (BOOL)valid;
- (MOAnalyticsStats)testDataStats;
- (MOAnalyticsStats)trainDataStats;
- (MOTukeyOutlierDetector)init;
- (double)iqr;
- (double)q1;
- (double)q2;
- (double)q3;
- (id)_testDatum:(id)a3;
- (id)getTestDataStats;
- (id)getTrainDataStats;
- (id)sortData:(id)a3;
- (id)testData:(id)a3;
- (void)setIqr:(double)a3;
- (void)setQ1:(double)a3;
- (void)setQ2:(double)a3;
- (void)setQ3:(double)a3;
- (void)setTestDataStats:(id)a3;
- (void)setTrainDataStats:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation MOTukeyOutlierDetector

- (MOTukeyOutlierDetector)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOTukeyOutlierDetector;
  return [(MOTukeyOutlierDetector *)&v3 init];
}

- (id)sortData:(id)a3
{
  id v3 = [a3 mutableCopy];
  v4 = +[NSSortDescriptor sortDescriptorWithKey:@"value" ascending:1];
  v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 sortUsingDescriptors:v5];

  return v3;
}

- (BOOL)fitData:(id)a3
{
  id v5 = a3;
  v6 = [[MOAnalyticsStats alloc] initWithTimeSeries:v5];
  trainDataStats = self->_trainDataStats;
  self->_trainDataStats = v6;

  self->_BOOL valid = 0;
  if ([v5 count])
  {
    id v8 = [v5 count];
    v9 = [(MOTukeyOutlierDetector *)self sortData:v5];
    double v10 = (double)(unint64_t)v8;
    v11 = [v9 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.25)];
    [v11 value];
    self->_double q1 = v12;

    v13 = [v9 objectAtIndexedSubscript:(unint64_t)(v10 * 0.5)];
    [v13 value];
    self->_double q2 = v14;

    v15 = [v9 objectAtIndexedSubscript:(unint64_t)(v10 * 0.75)];
    [v15 value];
    self->_double q3 = v16;

    double v17 = self->_q3 - self->_q1;
    self->_double iqr = v17;
    if (v17 > 0.0) {
      self->_BOOL valid = 1;
    }
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = NSStringFromSelector(a2);
      BOOL valid = self->_valid;
      double q1 = self->_q1;
      double q2 = self->_q2;
      double q3 = self->_q3;
      double iqr = self->_iqr;
      int v27 = 138413570;
      v28 = v19;
      __int16 v29 = 2048;
      BOOL v30 = valid;
      __int16 v31 = 2048;
      double v32 = q1;
      __int16 v33 = 2048;
      double v34 = q2;
      __int16 v35 = 2048;
      double v36 = q3;
      __int16 v37 = 2048;
      double v38 = iqr;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@, valid, %lu, q1, %f, q2, %f, q3, %f, iqr, %f", (uint8_t *)&v27, 0x3Eu);
    }
    BOOL v25 = self->_valid;
  }
  else
  {
    BOOL v25 = self->_valid;
  }

  return v25;
}

- (id)testData:(id)a3
{
  id v4 = a3;
  id v5 = [[MOAnalyticsStats alloc] initWithTimeSeries:v4];
  testDataStats = self->_testDataStats;
  self->_testDataStats = v5;

  if (self->_valid)
  {
    v7 = [(MOTukeyOutlierDetector *)self sortData:v4];
    id v8 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)objc_msgSend(v4, "count") * 0.5)];
    v9 = [(MOTukeyOutlierDetector *)self _testDatum:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_testDatum:(id)a3
{
  id v5 = a3;
  if (self->_valid)
  {
    v6 = objc_opt_new();
    double iqr = self->_iqr;
    double v8 = self->_q1 + iqr * -1.5;
    double v9 = self->_q3 + iqr * 1.5;
    double v10 = [v5 date];
    [v6 setDate:v10];

    [v5 value];
    [v6 setActual:];
    [v5 value];
    [v6 setScore:v11 - self->_q2];
    [v5 value];
    if (v12 >= v8)
    {
      [v5 value];
      BOOL v13 = v9 < v14;
    }
    else
    {
      BOOL v13 = 1;
    }
    [v6 setOutlier:v13];
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      double v16 = NSStringFromSelector(a2);
      BOOL valid = self->_valid;
      [v5 value];
      uint64_t v19 = v18;
      [v6 score];
      int v22 = 138413570;
      v23 = v16;
      __int16 v24 = 2048;
      BOOL v25 = valid;
      __int16 v26 = 2048;
      double v27 = v8;
      __int16 v28 = 2048;
      double v29 = v9;
      __int16 v30 = 2048;
      uint64_t v31 = v19;
      __int16 v32 = 2048;
      uint64_t v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@, valid, %lu, lower, %f, upper, %f, value, %f, score, %f", (uint8_t *)&v22, 0x3Eu);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getTrainDataStats
{
  return self->_trainDataStats;
}

- (id)getTestDataStats
{
  return self->_testDataStats;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_BOOL valid = a3;
}

- (double)q1
{
  return self->_q1;
}

- (void)setQ1:(double)a3
{
  self->_double q1 = a3;
}

- (double)q2
{
  return self->_q2;
}

- (void)setQ2:(double)a3
{
  self->_double q2 = a3;
}

- (double)q3
{
  return self->_q3;
}

- (void)setQ3:(double)a3
{
  self->_double q3 = a3;
}

- (double)iqr
{
  return self->_iqr;
}

- (void)setIqr:(double)a3
{
  self->_double iqr = a3;
}

- (MOAnalyticsStats)trainDataStats
{
  return self->_trainDataStats;
}

- (void)setTrainDataStats:(id)a3
{
}

- (MOAnalyticsStats)testDataStats
{
  return self->_testDataStats;
}

- (void)setTestDataStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDataStats, 0);

  objc_storeStrong((id *)&self->_trainDataStats, 0);
}

@end