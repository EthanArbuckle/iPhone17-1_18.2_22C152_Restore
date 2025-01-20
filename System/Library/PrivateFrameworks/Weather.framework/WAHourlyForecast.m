@interface WAHourlyForecast
+ (id)hourlyForecastForLocation:(id)a3 conditions:(id)a4 sunriseDateComponents:(id)a5 sunsetDateComponents:(id)a6;
+ (int64_t)TimeValueFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)forecastDetail;
- (NSString)time;
- (WFTemperature)temperature;
- (double)percentPrecipitation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)conditionCode;
- (int64_t)hourIndex;
- (unint64_t)eventType;
- (unint64_t)hash;
- (void)setConditionCode:(int64_t)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setForecastDetail:(id)a3;
- (void)setHourIndex:(int64_t)a3;
- (void)setPercentPrecipitation:(double)a3;
- (void)setTemperature:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation WAHourlyForecast

+ (id)hourlyForecastForLocation:(id)a3 conditions:(id)a4 sunriseDateComponents:(id)a5 sunsetDateComponents:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v41 = a5;
  id v40 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"WAHourlyForecast+WFAdditions.m", 18, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v39 = [MEMORY[0x263F08690] currentHandler];
  [v39 handleFailureInMethod:a2, a1, @"WAHourlyForecast+WFAdditions.m", 19, @"Invalid parameter not satisfying: %@", @"conditions" object file lineNumber description];

LABEL_3:
  v13 = objc_alloc_init(WAHourlyForecast);
  [(WAHourlyForecast *)v13 setEventType:0];
  v14 = [v12 valueForComponent:*MEMORY[0x263F86050]];
  [(WAHourlyForecast *)v13 setTemperature:v14];

  v15 = [v12 valueForComponent:*MEMORY[0x263F86088]];
  -[WAHourlyForecast setHourIndex:](v13, "setHourIndex:", [v15 integerValue]);
  v16 = [v12 valueForComponent:*MEMORY[0x263F86018]];
  [v16 floatValue];
  [(WAHourlyForecast *)v13 setPercentPrecipitation:v17];
  v18 = [v12 valueForComponent:*MEMORY[0x263F85FE0]];
  v19 = [v18 date];
  [v19 timeIntervalSince1970];
  double v21 = v20;

  v22 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(unint64_t)v21];
  id v23 = objc_alloc(MEMORY[0x263EFF8F0]);
  v24 = (void *)[v23 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
  v25 = [v11 timeZone];
  [v24 setTimeZone:v25];

  v26 = [v24 components:96 fromDate:v22];
  v27 = NSString;
  uint64_t v28 = [v26 hour];
  uint64_t v29 = [v26 minute];
  uint64_t v30 = 0;
  if (v29 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v30 = [v26 minute];
  }
  v31 = objc_msgSend(v27, "stringWithFormat:", @"%02zd:%02zd", v28, v30);
  [(WAHourlyForecast *)v13 setTime:v31];

  uint64_t v32 = [v12 valueForComponent:*MEMORY[0x263F86080]];
  v33 = (void *)v32;
  v34 = &unk_26DAEAFD0;
  if (v32) {
    v34 = (void *)v32;
  }
  id v35 = v34;

  uint64_t v36 = [v35 unsignedIntegerValue];
  [(WAHourlyForecast *)v13 setConditionCode:v36];

  return v13;
}

+ (int64_t)TimeValueFromString:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@":"];
  if ((unint64_t)[v3 count] < 2)
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v4 = [v3 firstObject];
    int64_t v5 = 100 * [v4 integerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_eventType;
  uint64_t v6 = [(NSString *)self->_time copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 24) = self->_hourIndex;
  uint64_t v8 = [(WFTemperature *)self->_temperature copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(void *)(v5 + 48) = self->_conditionCode;
  *(double *)(v5 + 56) = self->_percentPrecipitation;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WAHourlyForecast *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    uint64_t v5 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = v6;

    if (!v7) {
      goto LABEL_11;
    }
    uint64_t v8 = [(WAHourlyForecast *)v7 eventType];
    if (v8 != [(WAHourlyForecast *)self eventType]) {
      goto LABEL_11;
    }
    v9 = [(WAHourlyForecast *)v7 time];
    v10 = [(WAHourlyForecast *)self time];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_11;
    }
    uint64_t v12 = [(WAHourlyForecast *)v7 conditionCode];
    if (v12 == [(WAHourlyForecast *)self conditionCode]
      && ([(WAHourlyForecast *)v7 percentPrecipitation],
          float v14 = v13,
          [(WAHourlyForecast *)self percentPrecipitation],
          float v16 = v15,
          WAFloatIsEqual(v14, v16)))
    {
      float v17 = [(WAHourlyForecast *)v7 temperature];
      v18 = [(WAHourlyForecast *)self temperature];
      char IsEqual = WAObjectIsEqual(v17, v18);
    }
    else
    {
LABEL_11:
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  v2 = [(WAHourlyForecast *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setTemperature:(id)a3
{
  id v5 = a3;
  temperature = self->_temperature;
  p_temperature = &self->_temperature;
  id v8 = v5;
  if ((-[WFTemperature isEqualToTemperature:](temperature, "isEqualToTemperature:") & 1) == 0) {
    objc_storeStrong((id *)p_temperature, a3);
  }
}

- (id)description
{
  unint64_t v3 = NSString;
  time = self->_time;
  id v5 = NSNumber;
  uint64_t v6 = [(WAHourlyForecast *)self temperature];
  [v6 temperatureForUnit:2];
  v7 = objc_msgSend(v5, "numberWithDouble:");
  id v8 = [v3 stringWithFormat:@"<WAHourlyForecast - Hour: %@, Temp: %@, ConditionCode: %ld, Precipitation: %f>", time, v7, self->_conditionCode, *(void *)&self->_percentPrecipitation];

  return v8;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSString)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (int64_t)hourIndex
{
  return self->_hourIndex;
}

- (void)setHourIndex:(int64_t)a3
{
  self->_hourIndex = a3;
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (NSString)forecastDetail
{
  return self->_forecastDetail;
}

- (void)setForecastDetail:(id)a3
{
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (void)setConditionCode:(int64_t)a3
{
  self->_conditionCode = a3;
}

- (double)percentPrecipitation
{
  return self->_percentPrecipitation;
}

- (void)setPercentPrecipitation:(double)a3
{
  self->_percentPrecipitation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastDetail, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

@end