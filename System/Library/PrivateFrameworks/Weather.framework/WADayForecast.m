@interface WADayForecast
+ (id)dayForecastForLocation:(id)a3 conditions:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isYesterday;
- (WFTemperature)high;
- (WFTemperature)low;
- (double)percentPrecipitation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compareDayNumberToDayForecast:(id)a3;
- (unint64_t)dayNumber;
- (unint64_t)dayOfWeek;
- (unint64_t)hash;
- (unint64_t)icon;
- (void)setDayNumber:(unint64_t)a3;
- (void)setDayOfWeek:(unint64_t)a3;
- (void)setHigh:(id)a3;
- (void)setIcon:(unint64_t)a3;
- (void)setIsYesterday:(BOOL)a3;
- (void)setLow:(id)a3;
- (void)setPercentPrecipitation:(double)a3;
@end

@implementation WADayForecast

+ (id)dayForecastForLocation:(id)a3 conditions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"WADayForecast+WFAdditions.m", 18, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"WADayForecast+WFAdditions.m", 19, @"Invalid parameter not satisfying: %@", @"conditions" object file lineNumber description];

LABEL_3:
  v10 = objc_alloc_init(WADayForecast);
  v11 = [v9 valueForComponent:*MEMORY[0x263F85FE8]];
  [(WADayForecast *)v10 setHigh:v11];

  v12 = [v9 valueForComponent:*MEMORY[0x263F86000]];
  [(WADayForecast *)v10 setLow:v12];

  v13 = [v9 valueForComponent:*MEMORY[0x263F86018]];
  [v13 floatValue];
  [(WADayForecast *)v10 setPercentPrecipitation:v14];
  uint64_t v15 = [v9 valueForComponent:*MEMORY[0x263F86080]];
  v16 = (void *)v15;
  v17 = &unk_26DAEAFE8;
  if (v15) {
    v17 = (void *)v15;
  }
  id v18 = v17;

  uint64_t v19 = [v18 unsignedIntegerValue];
  [(WADayForecast *)v10 setIcon:v19];
  v20 = [v9 valueForComponent:*MEMORY[0x263F85FE0]];
  v21 = [v20 date];

  id v22 = objc_alloc(MEMORY[0x263EFF8F0]);
  v23 = (void *)[v22 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
  v24 = [v7 timeZone];
  [v23 setTimeZone:v24];

  v25 = [v23 components:512 fromDate:v21];
  -[WADayForecast setDayOfWeek:](v10, "setDayOfWeek:", [v25 weekday]);
  v26 = [v7 timeZone];
  [(WADayForecast *)v10 setIsYesterday:DateIsYesterdayInTimezone(v21, v26)];

  v27 = [v9 valueForComponent:*MEMORY[0x263F86088]];
  -[WADayForecast setDayNumber:](v10, "setDayNumber:", [v27 integerValue] - 1);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WADayForecast allocWithZone:a3] init];
  v5 = [(WADayForecast *)self high];
  [(WADayForecast *)v4 setHigh:v5];

  v6 = [(WADayForecast *)self low];
  [(WADayForecast *)v4 setLow:v6];

  [(WADayForecast *)self percentPrecipitation];
  -[WADayForecast setPercentPrecipitation:](v4, "setPercentPrecipitation:");
  [(WADayForecast *)v4 setIcon:[(WADayForecast *)self icon]];
  [(WADayForecast *)v4 setDayNumber:[(WADayForecast *)self dayNumber]];
  [(WADayForecast *)v4 setDayOfWeek:[(WADayForecast *)self dayOfWeek]];
  [(WADayForecast *)v4 setIsYesterday:[(WADayForecast *)self isYesterday]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WADayForecast *)a3;
  if (v4 == self)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    id v8 = [(WADayForecast *)self high];
    v9 = [(WADayForecast *)v7 high];
    if (WAObjectIsEqual(v8, v9))
    {
      v10 = [(WADayForecast *)self low];
      v11 = [(WADayForecast *)v7 low];
      if (WAObjectIsEqual(v10, v11)
        && ([(WADayForecast *)self percentPrecipitation],
            double v13 = v12,
            [(WADayForecast *)v7 percentPrecipitation],
            v13 == v14)
        && (unint64_t v15 = [(WADayForecast *)self icon], v15 == [(WADayForecast *)v7 icon])
        && (unint64_t v16 = [(WADayForecast *)self dayNumber], v16 == [(WADayForecast *)v7 dayNumber])
        && (unint64_t v17 = [(WADayForecast *)self dayOfWeek], v17 == [(WADayForecast *)v7 dayOfWeek]))
      {
        BOOL v18 = [(WADayForecast *)self isYesterday];
        BOOL v19 = v18 ^ [(WADayForecast *)v7 isYesterday] ^ 1;
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (unint64_t)hash
{
  v2 = [(WADayForecast *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<WADayForecast - Day of Week: %lu, Day number: %lu, Icon: %lu, High: %@, Low: %@>", self->_dayOfWeek, self->_dayNumber, self->_icon, self->_high, self->_low];
}

- (void)setHigh:(id)a3
{
  id v5 = a3;
  high = self->_high;
  p_high = &self->_high;
  id v8 = v5;
  if ((-[WFTemperature isEqualToTemperature:](high, "isEqualToTemperature:") & 1) == 0) {
    objc_storeStrong((id *)p_high, a3);
  }
}

- (void)setLow:(id)a3
{
  id v5 = a3;
  low = self->_low;
  p_low = &self->_low;
  id v8 = v5;
  if ((-[WFTemperature isEqualToTemperature:](low, "isEqualToTemperature:") & 1) == 0) {
    objc_storeStrong((id *)p_low, a3);
  }
}

- (int64_t)compareDayNumberToDayForecast:(id)a3
{
  if ([a3 dayNumber] > self->_dayNumber) {
    return -1;
  }
  else {
    return 1;
  }
}

- (WFTemperature)high
{
  return self->_high;
}

- (WFTemperature)low
{
  return self->_low;
}

- (double)percentPrecipitation
{
  return self->_percentPrecipitation;
}

- (void)setPercentPrecipitation:(double)a3
{
  self->_percentPrecipitation = a3;
}

- (unint64_t)icon
{
  return self->_icon;
}

- (void)setIcon:(unint64_t)a3
{
  self->_icon = a3;
}

- (unint64_t)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(unint64_t)a3
{
  self->_dayOfWeek = a3;
}

- (unint64_t)dayNumber
{
  return self->_dayNumber;
}

- (void)setDayNumber:(unint64_t)a3
{
  self->_dayNumber = a3;
}

- (BOOL)isYesterday
{
  return self->_isYesterday;
}

- (void)setIsYesterday:(BOOL)a3
{
  self->_isYesterday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_low, 0);
  objc_storeStrong((id *)&self->_high, 0);
}

@end